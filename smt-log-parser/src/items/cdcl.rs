#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use super::{CdclIdx, StackIdx, TermIdx};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Cdcl {
    pub kind: CdclKind,
    pub frame: StackIdx,
    /// After an assignment some clauses may have only 1 unassigned literal
    /// left (with all others not satisfying the clause). Thus a decision
    /// propagates other assignments which are required.
    pub propagates: Vec<Assignment>,
    pub conflicts: bool,
}

impl Cdcl {
    fn new(kind: CdclKind, frame: StackIdx) -> Self {
        Self {
            kind,
            frame,
            propagates: Vec::new(),
            conflicts: false,
        }
    }

    /// Creates the `Root` node of the CDCL tree. There may be multiple roots if
    /// one uses the incremental solver and goes back to an empty stack.
    pub fn new_root(frame: StackIdx) -> Self {
        Self::new(CdclKind::Root, frame)
    }

    /// Creates a `Empty` node in the CDCL tree.
    pub fn new_empty(parent: CdclIdx, frame: StackIdx) -> Self {
        Self::new(CdclKind::Empty(parent), frame)
    }

    pub fn new_decision(assign: Assignment, frame: StackIdx) -> Self {
        Self::new(CdclKind::Decision(assign), frame)
    }

    pub fn new_conflict(conflict: Conflict, frame: StackIdx) -> Self {
        Self::new(CdclKind::Conflict(conflict), frame)
    }

    /// Return a pair of the previous node and the backtrack node. If the
    /// backtrack node is set then its the parent otherwise the previous node is
    pub fn backlink(&self, cidx: CdclIdx) -> CdclBacklink {
        if matches!(self.kind, CdclKind::Root) {
            return CdclBacklink::default();
        }
        let previous = usize::from(cidx).checked_sub(1).map(CdclIdx::from);
        let previous = previous.unwrap();
        match self.kind {
            CdclKind::Root => unreachable!(),
            CdclKind::Empty(backtrack) => CdclBacklink {
                previous: Some(previous).filter(|&p| p != backtrack),
                backtrack: Some(backtrack),
            },
            CdclKind::Decision(..) => CdclBacklink {
                previous: Some(previous),
                backtrack: None,
            },
            CdclKind::Conflict(ref conflict) => CdclBacklink {
                previous: Some(previous),
                backtrack: Some(conflict.backtrack),
            },
        }
    }

    pub fn get_assignments(&self) -> impl Iterator<Item = Assignment> + '_ {
        let first = match &self.kind {
            CdclKind::Decision(assign) => Some(*assign),
            _ => None,
        };
        first.into_iter().chain(self.propagates.iter().copied())
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub enum CdclKind {
    /// Represents an empty node. Used as the root of the CDCL tree (in which
    /// the solver may already propagate some facts).
    Root,
    /// Same as `Root` but used when assignments are propagated at a different
    /// stack frame than the current decision. The frame of the current decision
    /// may have been popped, thus this points to where it should be slotted in.
    Empty(CdclIdx),
    /// The branching decision z3 took, it "arbitrarily" decided that this
    /// clause has this boolean value.
    Decision(Assignment),
    Conflict(Conflict),
}

/// Assignment to a literal.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Assignment {
    /// The boolean term that was assigned.
    pub literal: TermIdx,
    /// Was it assigned true or false?
    pub value: bool,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Conflict {
    pub cut: Box<[Assignment]>,
    /// Which decision to backtrack to (i.e. which one is this conflict rooted
    /// from and all between are reverted). If `None` then we backtrack all.
    pub backtrack: CdclIdx,
}

#[derive(Debug, Clone, Copy, Default)]
pub struct CdclBacklink {
    /// Always `Some` with a one smaller value, unless at the root or at a
    /// side-track `Empty` node where previous and backtrack would be the same.
    pub previous: Option<CdclIdx>,
    /// The node to back-jump to.
    pub backtrack: Option<CdclIdx>,
}

impl CdclBacklink {
    pub fn to_root(&self) -> Option<CdclIdx> {
        self.backtrack.or(self.previous)
    }
}
