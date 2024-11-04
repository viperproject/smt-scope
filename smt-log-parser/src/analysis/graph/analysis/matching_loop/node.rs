use crate::{items::TermIdx, parsers::z3::synthetic::SynthIdx};

use super::MlSignature;

#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphNode {
    QI(MlSignature, SynthIdx),
    ENode(SynthIdx),
    Equality(SynthIdx, SynthIdx),
    FixedEquality(TermIdx),
}

#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphEdge {
    Blame,
    BlameRewrite,
    Yield(bool),
    YieldEq(bool),
    FixedEquality,
}
