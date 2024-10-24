#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::Result;
use crate::{BoxSlice, IString, NonMaxU32, Z3Parser};

use super::{ENodeIdx, EqGivenIdx, EqTransIdx, InstIdx};

/// A Z3 equality explanation.
/// Root represents a term that is a root of its equivalence class.
/// All other variants represent an equality between two terms and where it came from.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq)]
pub enum EqualityExpl {
    Root {
        id: ENodeIdx,
    },
    Literal {
        from: ENodeIdx,
        /// The equality term this is from
        eq: ENodeIdx,
        to: ENodeIdx,
    },
    Congruence {
        from: ENodeIdx,
        arg_eqs: Box<[(ENodeIdx, ENodeIdx)]>,
        to: ENodeIdx,
        /// The `arg_eqs` need to be evaluated whenever this is used.
        uses: Vec<BoxSlice<EqTransIdx>>,
    },
    Theory {
        from: ENodeIdx,
        theory: IString,
        to: ENodeIdx,
    },
    Axiom {
        from: ENodeIdx,
        to: ENodeIdx,
    },
    Unknown {
        kind: IString,
        from: ENodeIdx,
        args: Box<[IString]>,
        to: ENodeIdx,
    },
}

impl EqualityExpl {
    pub fn from(&self) -> ENodeIdx {
        use EqualityExpl::*;
        match *self {
            Root { id } => id,
            Literal { from, .. }
            | Congruence { from, .. }
            | Theory { from, .. }
            | Axiom { from, .. }
            | Unknown { from, .. } => from,
        }
    }
    pub fn to(&self) -> ENodeIdx {
        use EqualityExpl::*;
        match *self {
            Root { id } => id,
            Literal { to, .. }
            | Congruence { to, .. }
            | Theory { to, .. }
            | Axiom { to, .. }
            | Unknown { to, .. } => to,
        }
    }
    pub fn walk_any(&self, from: ENodeIdx) -> ENodeIdx {
        let Some(to) = self.walk(from, true).or_else(|| self.walk(from, false)) else {
            panic!(
                "walking from {from:?} with {:?} <--> {:?}",
                self.from(),
                self.to()
            );
        };
        to
    }
    pub fn walk(&self, from: ENodeIdx, fwd: bool) -> Option<ENodeIdx> {
        if fwd {
            (self.from() == from).then(|| self.to())
        } else {
            (self.to() == from).then(|| self.from())
        }
    }
    pub fn short_str(&self) -> &'static str {
        match self {
            EqualityExpl::Root { .. } => "root",
            EqualityExpl::Literal { .. } => "literal",
            EqualityExpl::Congruence { .. } => "congruence",
            EqualityExpl::Theory { .. } => "theory",
            EqualityExpl::Axiom { .. } => "axiom",
            EqualityExpl::Unknown { .. } => "unknown",
        }
    }
}

// Whenever a pair of enodes are said to be equal this uses transitive reasoning
// with one or more `EqualityExpl` to explain why.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub struct TransitiveExpl {
    pub path: Box<[TransitiveExplSegment]>,
    pub given_len: usize,
    pub to: ENodeIdx,
}
type BackwardIter<'a> = std::iter::Map<
    std::iter::Rev<std::iter::Copied<std::slice::Iter<'a, TransitiveExplSegment>>>,
    fn(TransitiveExplSegment) -> TransitiveExplSegment,
>;
pub enum TransitiveExplIter<'a> {
    Forward(std::iter::Copied<std::slice::Iter<'a, TransitiveExplSegment>>),
    Backward(BackwardIter<'a>),
}
impl Iterator for TransitiveExplIter<'_> {
    type Item = TransitiveExplSegment;
    fn next(&mut self) -> Option<Self::Item> {
        match self {
            Self::Forward(iter) => iter.next(),
            Self::Backward(iter) => iter.next(),
        }
    }
}

impl TransitiveExpl {
    pub fn new(
        i: impl ExactSizeIterator<Item = TransitiveExplSegment>,
        given_len: usize,
        to: ENodeIdx,
    ) -> Result<Self> {
        let mut path = Vec::new();
        path.try_reserve_exact(i.len())?;
        path.extend(i);
        Ok(Self {
            path: path.into_boxed_slice(),
            given_len,
            to,
        })
    }
    pub fn empty(to: ENodeIdx) -> Self {
        Self {
            path: Box::new([]),
            given_len: 0,
            to,
        }
    }
    pub fn all(&self, fwd: bool) -> TransitiveExplIter {
        let iter = self.path.iter().copied();
        if fwd {
            TransitiveExplIter::Forward(iter)
        } else {
            TransitiveExplIter::Backward(TransitiveExplSegment::rev(iter))
        }
    }
    pub fn get_creator_insts(&self, parser: &Z3Parser) -> Vec<Option<InstIdx>> {
        self.path
            .iter()
            .flat_map(|expl_seg| match expl_seg.kind {
                TransitiveExplSegmentKind::Given(eq_idx, _) => match parser[eq_idx] {
                    EqualityExpl::Literal { eq, .. } => vec![parser[eq].created_by],
                    _ => vec![None],
                },
                TransitiveExplSegmentKind::Transitive(eq_idx) => {
                    let trans_expl = &parser[eq_idx];
                    trans_expl.get_creator_insts(parser)
                }
            })
            .collect()
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub struct TransitiveExplSegment {
    pub forward: bool,
    pub kind: TransitiveExplSegmentKind,
}
impl TransitiveExplSegment {
    pub fn rev<I: Iterator<Item = TransitiveExplSegment> + std::iter::DoubleEndedIterator>(
        iter: I,
    ) -> std::iter::Map<std::iter::Rev<I>, fn(TransitiveExplSegment) -> TransitiveExplSegment> {
        // Negate the forward direction since we're walking
        // backwards (`.rev()` above).
        iter.rev().map(TransitiveExplSegment::rev_single)
    }
    fn rev_single(mut self) -> Self {
        self.forward = !self.forward;
        self
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub enum TransitiveExplSegmentKind {
    Given(EqGivenIdx, Option<NonMaxU32>),
    Transitive(EqTransIdx),
}
impl TransitiveExplSegmentKind {
    pub fn given(self) -> Option<EqGivenIdx> {
        match self {
            Self::Given(given, _) => Some(given),
            _ => None,
        }
    }
}
