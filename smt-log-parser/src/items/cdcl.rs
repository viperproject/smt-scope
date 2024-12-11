#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use super::{DecisionIdx, StackIdx, TermIdx};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Decision {
    /// The branching decision z3 took, it "arbitrarily" decided that this
    /// clause has this boolean value.
    pub assign: Assignment,
    pub frame: StackIdx,
    /// After an assignment some clauses may have only 1 unassigned literal
    /// left (with all others not satisfying the clause). Thus a decision
    /// propagates other assignments which are required.
    pub propagates: Vec<Assignment>,
    pub conflict: Option<Conflict>,
}

impl Decision {
    pub fn new(assign: Assignment, frame: StackIdx) -> Self {
        Self {
            assign,
            frame,
            propagates: Vec::new(),
            conflict: None,
        }
    }

    pub fn has_unresolved_conflict(&self) -> bool {
        self.conflict
            .as_ref()
            .is_some_and(|c| c.backtrack.is_none())
    }
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

impl Assignment {
    pub fn negate(self) -> Self {
        Self {
            value: !self.value,
            ..self
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Conflict {
    pub cut: Box<[Assignment]>,
    pub backtrack: Option<DecisionIdx>,
}
