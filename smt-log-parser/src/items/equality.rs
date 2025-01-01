use std::num::NonZeroUsize;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BoxSlice, IString, NonMaxU32};
use crate::{Result, StringTable};

use super::{ENodeIdx, EqGivenIdx, EqTransIdx};

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
        args: BoxSlice<IString>,
        to: ENodeIdx,
    },
}

impl EqualityExpl {
    pub fn is_trivial(&self) -> bool {
        self.from() == self.to()
    }
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
    pub fn kind(&self) -> core::result::Result<&'static str, IString> {
        let kind = match *self {
            EqualityExpl::Root { .. } => "root",
            EqualityExpl::Literal { .. } => "literal",
            EqualityExpl::Congruence { .. } => "congruence",
            EqualityExpl::Theory { .. } => "theory",
            EqualityExpl::Axiom { .. } => "axiom",
            EqualityExpl::Unknown { kind, .. } => return Err(kind),
        };
        Ok(kind)
    }
    pub fn kind_str<'a>(&self, strings: &'a StringTable) -> &'a str {
        self.kind().unwrap_or_else(|kind| &strings[*kind])
    }
}

// Whenever a pair of enodes are said to be equal this uses transitive reasoning
// with one or more `EqualityExpl` to explain why.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub struct TransitiveExpl {
    pub path: Box<[TransitiveExplSegment]>,
    pub given_len: Option<NonZeroUsize>,
    pub to: ENodeIdx,
}
type BackwardIter<'a> = std::iter::Map<
    std::iter::Rev<std::iter::Copied<std::slice::Iter<'a, TransitiveExplSegment>>>,
    fn(TransitiveExplSegment) -> TransitiveExplSegment,
>;
#[derive(Clone)]
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
        given_len: NonZeroUsize,
        to: ENodeIdx,
    ) -> Result<Self> {
        let mut path = Vec::new();
        path.try_reserve_exact(i.len())?;
        path.extend(i);
        Ok(Self {
            path: path.into_boxed_slice(),
            given_len: Some(given_len),
            to,
        })
    }
    pub fn error(from: ENodeIdx, to: ENodeIdx) -> Self {
        Self {
            path: Box::new([TransitiveExplSegment {
                forward: true,
                kind: TransitiveExplSegmentKind::Error(from),
            }]),
            given_len: None,
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
    pub fn error_from(&self) -> Option<ENodeIdx> {
        self.given_len.is_none().then(|| match self.path[0].kind {
            TransitiveExplSegmentKind::Error(from) => from,
            _ => panic!("expected error segment"),
        })
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
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

pub type EqGivenUse = (EqGivenIdx, Option<NonMaxU32>);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub enum TransitiveExplSegmentKind {
    Given(EqGivenUse),
    Transitive(EqTransIdx),
    Error(ENodeIdx),
}
impl TransitiveExplSegmentKind {
    pub fn given(self) -> Option<EqGivenUse> {
        match self {
            Self::Given(eq_use) => Some(eq_use),
            _ => None,
        }
    }
}
