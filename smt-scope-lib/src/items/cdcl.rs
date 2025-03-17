#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use super::{CdclIdx, InstIdx, LitIdx, StackIdx, TermIdx, TheoryKind};

/// A boolean term which has been assigned either true or false.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
pub struct Literal {
    pub term: Assignment,
    pub frame: StackIdx,
    pub iblame: Option<InstIdx>,
    pub justification: Justification,
}

/// The reason for an assignment.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, Default)]
pub enum JustificationKind {
    /// The assignment was derived from an internal axiom.
    Axiom,
    /// The assignment was a CDCL decision.
    Decision,
    /// The assignment was derived from a theory.
    Theory(TheoryKind),
    /// The assignment was due to a yet unsatisfied or-clause, where all other
    /// literals are already assigned. The or-clause is all `blamed` assignments
    /// negated + my assignment.
    Propagate,
    /// Appears only if a parsing error occurred.
    #[default]
    Error,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Default)]
pub struct Justification {
    pub kind: JustificationKind,
    // Issue 3: No way to convert LitId -> TermIdx
    #[cfg(any())]
    /// The assignments this justification depends on.
    pub blamed: BoxSlice<LitIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Cdcl {
    pub kind: CdclKind,
    pub frame: StackIdx,
    /// After an assignment some clauses may have only 1 unassigned literal
    /// left (with all others not satisfying the clause). Thus a decision
    /// propagates other assignments which are required.
    pub propagates: Vec<LitIdx>,
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

    /// Creates the `Root` node of the CDCL tree. Should only be used once.
    pub fn root(frame: StackIdx) -> Self {
        Self::new(CdclKind::Root, frame)
    }

    /// Creates a `BeginCheck` node in the CDCL tree.
    pub fn begin_check(parent: Option<CdclIdx>, frame: StackIdx) -> Self {
        Self::new(CdclKind::BeginCheck(parent), frame)
    }

    /// Creates a `Empty` node in the CDCL tree.
    pub fn new_empty(parent: CdclIdx, frame: StackIdx) -> Self {
        Self::new(CdclKind::Empty(parent), frame)
    }

    pub fn new_decision(lit: LitIdx, frame: StackIdx) -> Self {
        Self::new(CdclKind::Decision(lit), frame)
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
            CdclKind::BeginCheck(backtrack) => CdclBacklink {
                previous: Some(previous).filter(|&p| backtrack.is_some_and(|b| p != b)),
                backtrack: Some(backtrack.unwrap_or(CdclIdx::ZERO)),
                sidetrack: true,
            },
            CdclKind::Empty(backtrack) => CdclBacklink {
                previous: Some(previous).filter(|&p| p != backtrack),
                backtrack: Some(backtrack),
                sidetrack: true,
            },
            CdclKind::Decision(..) => CdclBacklink {
                previous: Some(previous),
                backtrack: None,
                sidetrack: false,
            },
            CdclKind::Conflict(ref conflict) => CdclBacklink {
                previous: Some(previous),
                backtrack: Some(conflict.backtrack),
                sidetrack: false,
            },
        }
    }

    pub fn get_assignments(&self) -> impl Iterator<Item = LitIdx> + '_ {
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
    /// Represents an empty node. Used to indicate that assignments are reset
    /// between begin-checks.
    BeginCheck(Option<CdclIdx>),
    /// Same as `Root` but used when assignments are propagated at a different
    /// stack frame than the current decision. The frame of the current decision
    /// may have been popped, thus this points to where it should be slotted in.
    Empty(CdclIdx),
    /// The branching decision z3 took, it "arbitrarily" decided that this
    /// clause has this boolean value.
    Decision(LitIdx),
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
    pub sidetrack: bool,
}

impl CdclBacklink {
    pub fn to_root(&self) -> Option<CdclIdx> {
        self.backtrack.or(self.previous)
    }
}
