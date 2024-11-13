use crate::{items::TermIdx, parsers::z3::synthetic::SynthIdx};

use super::MlSignature;

#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphNode {
    QI(MlSignature),
    FixedENode(TermIdx),
    RecurringENode(SynthIdx, bool),
    FixedEquality(TermIdx, TermIdx),
    RecurringEquality(SynthIdx, SynthIdx, bool),
}

#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphEdge {
    Blame(usize),
    BlameEq(usize),
    Yield,
    YieldEq,
    CombineEq,
}
