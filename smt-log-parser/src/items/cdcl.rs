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
}

impl Cdcl {
    /// Creates the `Root` node of the CDCL tree. Should only be used once.
    pub fn root(frame: StackIdx) -> Self {
        Self {
            kind: CdclKind::Root,
            frame,
            propagates: Vec::new(),
        }
    }

    /// Creates a `Empty` node in the CDCL tree.
    pub fn new_empty(parent: CdclIdx, frame: StackIdx) -> Self {
        Self {
            kind: CdclKind::Empty(parent),
            frame,
            propagates: Vec::new(),
        }
    }

    pub fn new_decision(assign: Assignment, frame: StackIdx) -> Self {
        Self {
            kind: CdclKind::Decision(assign),
            frame,
            propagates: Vec::new(),
        }
    }

    pub fn new_conflict(conflict: Conflict, frame: StackIdx) -> Self {
        Self {
            kind: CdclKind::Conflict(conflict),
            frame,
            propagates: Vec::new(),
        }
    }

    pub fn get_backtrack(&self) -> Option<CdclIdx> {
        match &self.kind {
            CdclKind::Conflict(conflict) => Some(conflict.backtrack),
            _ => None,
        }
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
#[derive(Debug, Clone, Copy)]
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
