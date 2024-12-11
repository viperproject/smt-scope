#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Assignment, Cdcl, CdclIdx, Conflict, StackFrame, StackIdx},
    Error, Result, TiVec,
};

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
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct CdclTree {
    cdcl: TiVec<CdclIdx, Cdcl>,
    /// The cut from the last conflict, only set between a `[conflict]` line and
    /// a `[pop]`. The latter will backtrack and insert this into the above vec.
    conflict: Option<Box<[Assignment]>>,
}

impl Default for CdclTree {
    fn default() -> Self {
        let mut cdcl = TiVec::default();
        cdcl.push(Cdcl::new_empty(Stack::ZERO_FRAME));
        Self {
            cdcl,
            conflict: None,
        }
    }
}

impl CdclTree {
    pub fn new_decision(&mut self, assign: Assignment, frame: StackIdx) -> Result<CdclIdx> {
        debug_assert!(self.conflict.is_none());
        debug_assert!(!self.cdcl.last().is_some_and(|cdcl| cdcl.frame == frame));

        let cdcl = Cdcl::new_decision(assign, frame);
        self.cdcl.raw.try_reserve(1)?;
        Ok(self.cdcl.push_and_get_key(cdcl))
    }

    pub fn new_conflict(&mut self, cut: Box<[Assignment]>, frame: StackIdx) {
        debug_assert!(self.conflict.is_none());
        debug_assert!(self.cdcl.last().is_some_and(|cdcl| cdcl.frame == frame));
        self.conflict = Some(cut);
    }

    pub fn backtrack(&mut self, stack: &Stack) -> Result<CdclIdx> {
        let active = |i: &CdclIdx| {
            let status = stack[self[*i].frame].active.status();
            status.is_active() || status.is_global()
        };
        let backtrack = self.curr_to_root().find(active).unwrap();
        // Not always true:
        // debug_assert_eq!(self[backtrack].frame, stack.active_frame());

        let cut = self.conflict.take().ok_or(Error::NoConflict)?;
        let conflict = Conflict { cut, backtrack };
        let cdcl = Cdcl::new_conflict(conflict, stack.active_frame());
        self.cdcl.raw.try_reserve(1)?;
        Ok(self.cdcl.push_and_get_key(cdcl))
    }

    pub fn new_propagate(&mut self, assign: Assignment, frame: StackIdx) -> Result<()> {
        debug_assert!(self.conflict.is_none());
        let mut last = self.cdcl.last_mut().unwrap();
        if last.frame != frame {
            let empty = Cdcl::new_empty(frame);
            self.cdcl.raw.try_reserve(1)?;
            let new = self.cdcl.push_and_get_key(empty);
            last = &mut self.cdcl[new];
        }
        last.propagates.try_reserve(1)?;
        last.propagates.push(assign);
        Ok(())
    }

    pub fn has_conflict(&self) -> bool {
        self.conflict.is_some()
    }

    fn curr_to_root(&self) -> impl Iterator<Item = CdclIdx> + '_ {
        let mut curr = self.cdcl.last_key();
        core::iter::from_fn(move || {
            let cdcl = curr?;
            if let Some(backtrack) = self[cdcl].get_backtrack() {
                curr = Some(backtrack);
            } else {
                curr = usize::from(cdcl).checked_sub(1).map(CdclIdx::from);
            }
            Some(cdcl)
        })
    }
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
