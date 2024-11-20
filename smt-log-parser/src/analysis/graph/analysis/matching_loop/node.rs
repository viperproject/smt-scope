use crate::parsers::z3::synthetic::SynthIdx;

use super::MlSignature;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphNode {
    HiddenNode(Option<bool>),
    QI(MlSignature, SimpIdx),
    FixedENode(SimpIdx),
    RecurringENode(SimpIdx, RecurrenceKind),
    FixedEquality(SimpIdx, SimpIdx),
    RecurringEquality(SimpIdx, SimpIdx, RecurrenceKind),
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphEdge {
    HiddenEdge(bool, u32),
    Blame(usize),
    BlameEq(usize),
    Yield,
    YieldEq,
    CombineEq,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, Eq, Hash, PartialEq)]
pub struct SimpIdx {
    pub orig: SynthIdx,
    pub simp: SynthIdx,
}

impl<T: Into<SynthIdx>> From<T> for SimpIdx {
    fn from(idx: T) -> Self {
        let idx = idx.into();
        Self {
            orig: idx,
            simp: idx,
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, Eq, Hash, PartialEq)]
pub enum RecurrenceKind {
    Input(u32),
    Output(u32),
    Intermediate,
}

impl RecurrenceKind {
    pub fn rec_idx(self) -> Option<u32> {
        use RecurrenceKind::*;
        match self {
            Input(i) | Output(i) => Some(i),
            Intermediate => None,
        }
    }
    pub fn rec_input(self) -> Option<bool> {
        use RecurrenceKind::*;
        match self {
            Input(_) => Some(true),
            Output(_) => Some(false),
            Intermediate => None,
        }
    }
}
