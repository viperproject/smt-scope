use std::num::NonZeroU32;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use typed_index_collections::TiSlice;

use crate::{
    items::{
        Assignment, Cdcl, CdclBacklink, CdclIdx, CdclKind, Conflict, InstIdx, Justification,
        JustificationKind, LitIdx, Literal, StackIdx, TermIdx,
    },
    Error, FxHashMap, Result, TiVec,
};

use super::stack::Stack;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Literals {
    literals: TiVec<LitIdx, Literal>,
    // Issue 3: No way to convert LitId -> TermIdx
    #[cfg(any())]
    pub lit_stack: SortedVec<LitIdx>,
    pub assignments: FxHashMap<TermIdx, LitIdx>,

    pub cdcl: CdclTree,
}

#[cfg(any())]
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct LitStack {
    global_lits: u32,
    stack: Vec<LitIdx>,
}

impl Literals {
    pub fn new_literal(
        &mut self,
        term: Assignment,
        iblame: Option<InstIdx>,
        stack: &Stack,
    ) -> Result<LitIdx> {
        let frame = stack.active_frame();
        let lit = Literal {
            term,
            frame,
            iblame,
            justification: Default::default(),
        };
        self.literals.try_reserve(1)?;
        let lit = self.literals.push_and_get_key(lit);
        self.assignments.try_reserve(1)?;
        self.assignments.insert(term.literal, lit);

        // Issue 3: No way to convert LitId -> TermIdx
        #[cfg(any())]
        self.lit_stack
            .raw
            .retain(|&l| stack.is_alive(self.literals[l].frame));
        #[cfg(any())]
        self.lit_stack.push_by(lit, |a, b| {
            let a = &self.literals[*a];
            let b = &self.literals[*b];
            a.term.literal.cmp(&b.term.literal)
        })?;
        // match &mut self.lit_stack {
        //     Some(ls) => {
        //         while ls
        //             .stack
        //             .last()
        //             .is_some_and(|&l| !stack.is_alive(self.literals[l].frame))
        //         {
        //             ls.stack.pop();
        //         }
        //         ls.stack.try_reserve(1)?;
        //         ls.stack.push(lit);
        //     }
        //     None if !stack.is_global(frame) => {
        //         let mut ls = LitStack {
        //             global_lits: self.literals.len() as u32 - 1,
        //             stack: Vec::new(),
        //         };
        //         ls.stack.try_reserve(1)?;
        //         ls.stack.push(lit);
        //         self.lit_stack = Some(ls);
        //     }
        //     None => {}
        // }
        Ok(lit)
    }

    pub fn get_assign(&self, term: TermIdx, stack: &Stack) -> Option<LitIdx> {
        let lit = *self.assignments.get(&term)?;
        stack.is_alive(self.literals[lit].frame).then_some(lit)
    }

    /// Must only be called after a `new_literal` call. If not called the
    /// justification of the new literal will be an error.
    pub fn justification(
        &mut self,
        lit: LitIdx,
        kind: JustificationKind,
        #[allow(unused)] blamed: impl Iterator<Item = Result<(Option<NonZeroU32>, bool)>>,
    ) -> Result<&Justification> {
        #[cfg(any())]
        let mut literals = Vec::new();
        #[cfg(any())]
        let negated = matches!(kind, JustificationKind::Propagate);
        #[cfg(any())]
        for lit in blamed {
            let lit = self.literal_to_term(lit?, negated);
            literals.try_reserve(1)?;
            literals.push(lit?);
        }
        let justification = Justification {
            kind,
            #[cfg(any())]
            blamed: literals.into(),
        };
        let j = &mut self.literals[lit].justification;
        *j = justification;
        Ok(j)
    }

    // Issue 3: No way to convert LitId -> TermIdx
    #[cfg(any())]
    /// Must only be called after a `new_literal` call.
    pub fn literal_to_term(
        &self,
        (lit, value): (Option<NonZeroU32>, bool),
        negated: bool,
    ) -> Result<LitIdx> {
        let lit = self.literal_to_term_inner(lit);
        if (self.literals[lit].term.value == value) == negated {
            return Err(Error::BoolLiteral);
        }
        if negated {
            debug_assert_eq!(!self.literals[lit].term.value, value);
        } else {
            debug_assert_eq!(self.literals[lit].term.value, value);
        }
        Ok(lit)
    }
    #[cfg(any())]
    fn literal_to_term_inner(&self, lit: Option<NonZeroU32>) -> LitIdx {
        let lit = lit.unwrap().get() - 1; // TODO: handle `true` and `false` literals
        self.lit_stack[lit as usize]
        // let lit = lit.unwrap().get() - 1; // TODO: handle `true` and `false` literals
        // if let Some(ls) = &self.lit_stack {
        //     if let Some(lidx) = lit.checked_sub(ls.global_lits) {
        //         return ls.stack[lidx as usize];
        //     }
        // }
        // LitIdx::from(lit as usize)
    }

    pub(super) fn curr_to_root_unique(&self) -> bool {
        let mut assigns = crate::FxHashSet::default();
        self.cdcl
            .curr_to_root()
            .flat_map(|c| self.cdcl[c].get_assignments())
            .all(|lit| assigns.insert(self[lit].term.literal))
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct CdclTree {
    incremental_mode: bool,
    cdcl: TiVec<CdclIdx, Cdcl>,
    /// The cut from the last conflict, only set between a `[conflict]` line and
    /// a `[pop]`. The latter will backtrack and insert this into the above vec.
    conflict: Option<Box<[Assignment]>>,
}

impl Default for CdclTree {
    fn default() -> Self {
        let mut cdcl = TiVec::default();
        let zero = cdcl.push_and_get_key(Cdcl::root(Stack::ZERO_FRAME));
        debug_assert_eq!(zero, CdclIdx::ZERO);
        Self {
            incremental_mode: false,
            cdcl,
            conflict: None,
        }
    }
}

impl CdclTree {
    pub fn new_decision(&mut self, lit: LitIdx, stack: &Stack) -> Result<CdclIdx> {
        debug_assert!(self.conflict.is_none());
        self.check_frame_decision(stack)?;

        let cdcl = Cdcl::new_decision(lit, stack.active_frame());
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
        let prev = stack.pre_active_frame();
        self.insert_empty_frame(stack, prev)?;
        Ok(())
    }

    pub fn new_conflict(&mut self, cut: Box<[Assignment]>, frame: StackIdx) {
        debug_assert!(self.conflict.is_none());
        debug_assert!(self.cdcl.last().is_some_and(|cdcl| cdcl.frame == frame));
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

    pub fn new_propagate(&mut self, lit: LitIdx, stack: &Stack) -> Result<()> {
        debug_assert!(self.conflict.is_none());
        let mut last = self.cdcl.last_mut().unwrap();
        let frame = stack.active_frame();
        if last.frame != frame {
            last = self.insert_empty_frame(stack, frame)?;
        }
        last.propagates.try_reserve(1)?;
        last.propagates.push(lit);
        Ok(())
    }

    fn insert_empty_frame(&mut self, stack: &Stack, at: StackIdx) -> Result<&mut Cdcl> {
        let parent = self.last_active(stack);
        let empty = Cdcl::new_empty(parent, at);
        self.cdcl.raw.try_reserve(1)?;
        let new = self.cdcl.push_and_get_key(empty);
        Ok(&mut self.cdcl[new])
    }

    pub fn begin_check(&mut self, incremental_mode: bool, stack: &Stack) -> Result<()> {
        debug_assert!(self.conflict.is_none());
        debug_assert!(!self.incremental_mode || incremental_mode);
        self.incremental_mode = incremental_mode;
        let parent = incremental_mode.then(|| self.last_active(stack));
        let check = Cdcl::begin_check(parent, stack.active_frame());
        self.cdcl.raw.try_reserve(1)?;
        self.cdcl.push_and_get_key(check);
        Ok(())
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

impl std::ops::Index<LitIdx> for Literals {
    type Output = Literal;
    fn index(&self, idx: LitIdx) -> &Self::Output {
        &self.literals[idx]
    }
}

impl std::ops::Index<CdclIdx> for CdclTree {
    type Output = Cdcl;
    fn index(&self, idx: CdclIdx) -> &Self::Output {
        &self.cdcl[idx]
    }
}
