use crate::{items::TermIdx, parsers::z3::synthetic::SynthIdx};

use super::MlSignature;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphNode {
    QI(MlSignature),
    FixedENode(TermIdx),
    RecurringENode(SynthIdx, Option<bool>),
    FixedEquality(TermIdx, TermIdx),
    RecurringEquality(SynthIdx, SynthIdx, Option<bool>),
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphEdge {
    Blame(usize),
    BlameEq(usize),
    Yield,
    YieldEq,
    CombineEq,
}
