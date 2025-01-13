#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use typed_index_collections::TiSlice;

use crate::{
    items::{
        Assignment, Cdcl, CdclBacklink, CdclIdx, CdclKind, Conflict, ENodeIdx, InstIdx, MatchIdx,
        ProofIdx, StackFrame, StackIdx, TermIdx,
    },
    Error, FxHashMap, Result, TiVec,
};

use super::Z3Parser;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Stack {
    stack: Vec<StackIdx>,
    pub(super) stack_frames: TiVec<StackIdx, StackFrame>,
    timestamp: u32,
}

impl Default for Stack {
    fn default() -> Self {
        let mut stack_frames: TiVec<StackIdx, StackFrame> = TiVec::default();
        let idx = stack_frames.push_and_get_key(StackFrame::new(0, false));
        assert_eq!(idx, Self::ZERO_FRAME);
        Self {
            stack: vec![idx],
            stack_frames,
            timestamp: 1,
        }
    }
}

impl Stack {
    pub const ZERO_FRAME: StackIdx = StackIdx::ZERO;

    fn height(&self) -> usize {
        self.stack.len() - 1
    }

    fn add_frame(&mut self, from_cdcl: bool) -> Result<()> {
        self.stack_frames.raw.try_reserve(1)?;
        let idx = self
            .stack_frames
            .push_and_get_key(StackFrame::new(self.timestamp, from_cdcl));
        self.stack.try_reserve(1)?;
        self.stack.push(idx);
        self.timestamp += 1;
        Ok(())
    }
    fn remove_frame(&mut self, active: bool, from_cdcl: bool) {
        let idx = self.stack.pop().unwrap();
        assert!(!self.stack.is_empty());
        let frame = &mut self.stack_frames[idx];
        frame.active.end(self.timestamp, active);
        frame.from_cdcl = from_cdcl;
        self.timestamp += 1;
    }
    pub(super) fn ensure_height(&mut self, height: usize) -> Result<()> {
        let mut res = Ok(());
        // Neither condition should hold, but handle it as best we can.
        while height > self.height() {
            // Have not run into this case, so make tests fail if it happens.
            res = Err(Error::StackFrameNotPushed);
            let from_cdcl = self.is_speculative();
            self.add_frame(from_cdcl)?;
        }
        while height < self.height() {
            // This can happen when pushing a new frame in e.g. z3 v4.8.17 and
            // v4.11.2.
            // It seems that there is a bug where the pop doesn't get emitted
            // and so we need to conservatively leak the frame and treat it as
            // always active.
            let from_cdcl = self.is_speculative();
            self.remove_frame(true, from_cdcl);
        }
        res
    }

    pub(super) fn new_frame(&mut self, idx: usize, from_cdcl: bool) -> Result<()> {
        let res = self.ensure_height(idx);
        self.add_frame(from_cdcl)?;
        res
    }

    pub(super) fn pop_frames(
        &mut self,
        count: core::num::NonZeroUsize,
        idx: usize,
        from_cdcl: bool,
    ) -> Result<bool> {
        let count = count.get();
        debug_assert!(0 < count && count <= idx);
        let from_cdcl = from_cdcl
            || (0..count).any(|idx| self[self.stack[self.stack.len() - 1 - idx]].from_cdcl);
        let result = self.ensure_height(idx);
        for _ in 0..count {
            self.remove_frame(false, from_cdcl);
        }
        result.map(|()| from_cdcl)
    }

    pub(super) fn active_frame(&self) -> StackIdx {
        *self.stack.last().unwrap()
    }

    pub(super) fn is_speculative(&self) -> bool {
        self.stack_frames[self.active_frame()].from_cdcl
    }

    pub(super) fn is_alive(&self, frame: StackIdx) -> bool {
        self[frame].active.status().is_alive()
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct CdclTree {
    pub assignments: FxHashMap<TermIdx, (bool, StackIdx)>,
    cdcl: TiVec<CdclIdx, Cdcl>,
    /// The cut from the last conflict, only set between a `[conflict]` line and
    /// a `[pop]`. The latter will backtrack and insert this into the above vec.
    conflict: Option<Box<[Assignment]>>,
}

impl Default for CdclTree {
    fn default() -> Self {
        let mut cdcl = TiVec::default();
        cdcl.push(Cdcl::root(Stack::ZERO_FRAME));
        Self {
            assignments: FxHashMap::default(),
            cdcl,
            conflict: None,
        }
    }
}

impl CdclTree {
    fn new_assign(&mut self, assign: Assignment, stack: &Stack) -> Result<()> {
        self.assignments.try_reserve(1)?;
        self.assignments
            .insert(assign.literal, (assign.value, stack.active_frame()));
        Ok(())
    }

    pub fn get_assign(&self, term: TermIdx, stack: &Stack) -> Option<bool> {
        let (value, frame) = *self.assignments.get(&term)?;
        stack.is_alive(frame).then_some(value)
    }

    pub fn new_decision(&mut self, assign: Assignment, stack: &Stack) -> Result<CdclIdx> {
        debug_assert!(self.conflict.is_none());
        self.new_assign(assign, stack)?;
        self.check_frame_decision(stack)?;

        let cdcl = Cdcl::new_decision(assign, stack.active_frame());
        self.cdcl.raw.try_reserve(1)?;
        Ok(self.cdcl.push_and_get_key(cdcl))
    }

    fn check_frame_decision(&mut self, stack: &Stack) -> Result<()> {
        if stack.is_alive(self.cdcl.last().unwrap().frame) {
            return Ok(());
        }
        // Just before making a decision z3 will always push a new frame.
        // Take the one just before the push here. Note that this may create an
        // empty with `ZERO_FRAME`.
        let prev = stack.stack[stack.stack.len() - 2];
        self.insert_empty_frame(stack, prev)?;
        Ok(())
    }

    pub fn new_conflict(&mut self, cut: Box<[Assignment]>, frame: StackIdx) {
        debug_assert!(self.conflict.is_none());
        debug_assert!(self.cdcl.last().is_some_and(|cdcl| cdcl.frame == frame));
        debug_assert!({
            let mut assigns = crate::FxHashSet::default();
            self.curr_to_root()
                .flat_map(|c| self[c].get_assignments())
                .all(|assign| assigns.insert(assign.literal))
        });
        self.cdcl.last_mut().unwrap().conflicts = true;
        self.conflict = Some(cut);
    }

    pub fn backtrack(&mut self, stack: &Stack) -> Result<CdclIdx> {
        let backtrack = self.last_active(stack);
        debug_assert_ne!(backtrack, self.cdcl.last_key().unwrap());
        // Not always true:
        // debug_assert_eq!(self[backtrack].frame, stack.active_frame());

        let cut = self.conflict.take().ok_or(Error::NoConflict)?;
        let conflict = Conflict { cut, backtrack };
        let cdcl = Cdcl::new_conflict(conflict, stack.active_frame());
        self.cdcl.raw.try_reserve(1)?;
        Ok(self.cdcl.push_and_get_key(cdcl))
    }

    pub fn new_propagate(&mut self, assign: Assignment, stack: &Stack) -> Result<()> {
        debug_assert!(self.conflict.is_none());
        self.new_assign(assign, stack)?;
        let mut last = self.cdcl.last_mut().unwrap();
        let frame = stack.active_frame();
        if last.frame != frame {
            last = self.insert_empty_frame(stack, frame)?;
        }
        last.propagates.try_reserve(1)?;
        last.propagates.push(assign);
        Ok(())
    }

    fn insert_empty_frame(&mut self, stack: &Stack, at: StackIdx) -> Result<&mut Cdcl> {
        let parent = self.last_active(stack);
        let empty = Cdcl::new_empty(parent, at);
        self.cdcl.raw.try_reserve(1)?;
        let new = self.cdcl.push_and_get_key(empty);
        Ok(&mut self.cdcl[new])
    }

    pub fn has_conflict(&self) -> bool {
        self.conflict.is_some()
    }

    pub fn cdcls(&self) -> &TiSlice<CdclIdx, Cdcl> {
        &self.cdcl
    }

    pub fn backlink(&self, cidx: CdclIdx) -> CdclBacklink {
        self[cidx].backlink(cidx)
    }

    fn last_active(&self, stack: &Stack) -> CdclIdx {
        let active = |i: &CdclIdx| stack.is_alive(self[*i].frame);
        self.curr_to_root().find(active).unwrap()
    }

    fn curr_to_root(&self) -> impl Iterator<Item = CdclIdx> + '_ {
        self.to_root(self.cdcl.last_key().unwrap())
    }

    fn to_root(&self, from: CdclIdx) -> impl Iterator<Item = CdclIdx> + '_ {
        let mut curr = Some(from);
        core::iter::from_fn(move || {
            let cdcl = curr?;
            let backlink = self.backlink(cdcl);
            curr = backlink.to_root();
            Some(cdcl)
        })
    }

    /// Returns an iterator over all of the dead branches explored by the solver.
    pub fn dead_branches(&self) -> impl Iterator<Item = DeadBranch> + '_ {
        self.cdcl
            .iter_enumerated()
            .filter_map(|(cidx, cdcl)| match &cdcl.kind {
                CdclKind::Conflict(conflict) => Some(DeadBranch { cidx, conflict }),
                _ => None,
            })
    }

    /// Returns an iterator over the nodes in a dead branch.
    pub fn dead_branch(&self, db: DeadBranch) -> impl Iterator<Item = CdclIdx> + '_ {
        let conflict_leaf = usize::from(db.cidx).checked_sub(1).unwrap();
        let conflict_leaf = CdclIdx::from(conflict_leaf);
        let common_ancestor = db.conflict.backtrack;
        debug_assert!(self.to_root(conflict_leaf).any(|c| c == common_ancestor));
        self.to_root(conflict_leaf)
            .take_while(move |&c| c != common_ancestor)
    }
}

#[derive(Clone, Copy)]
pub struct DeadBranch<'a> {
    /// The index of the cut node.
    pub cidx: CdclIdx,
    pub conflict: &'a Conflict,
}

impl std::ops::Index<StackIdx> for Stack {
    type Output = StackFrame;
    fn index(&self, idx: StackIdx) -> &Self::Output {
        &self.stack_frames[idx]
    }
}

impl std::ops::Index<CdclIdx> for CdclTree {
    type Output = Cdcl;
    fn index(&self, idx: CdclIdx) -> &Self::Output {
        &self.cdcl[idx]
    }
}

pub trait HasFrame {
    fn frame(self, parser: &Z3Parser) -> StackIdx;
}

macro_rules! impl_has_frame {
    ($($ty:ty),*) => {
        $(impl HasFrame for $ty {
            fn frame(self, parser: &Z3Parser) -> StackIdx {
                parser[self].frame
            }
        })*
    };
}

impl_has_frame!(ENodeIdx, MatchIdx, InstIdx, ProofIdx, CdclIdx);
