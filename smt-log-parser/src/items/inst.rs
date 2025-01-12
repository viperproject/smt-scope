#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BoxSlice, Error, NonMaxU32, Result};
use std::fmt;

use super::{
    ENodeIdx, EqTransIdx, MatchIdx, PatternIdx, ProofIdx, QuantIdx, QuantPat, StackIdx, TermId,
    TermIdx,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Match {
    pub kind: MatchKind,
    pub blamed: Box<[Blame]>,
    pub frame: StackIdx,
}

impl Match {
    /// A quantifier may have multiple possible patterns where each
    /// instantiation will be due to matching exactly one. Each of these
    /// patterns has a sequence of arbitrarily many terms which must all be
    /// matched. This returns a sequence of `Blame` where each explains how the
    /// corresponding term in the pattern was matched.
    pub fn pattern_matches(&self) -> impl Iterator<Item = &Blame> {
        self.blamed.iter()
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Hash, Eq, PartialEq)]
pub enum MatchKind {
    MBQI {
        quant: QuantIdx,
        bound_terms: BoxSlice<ENodeIdx>,
    },
    TheorySolving {
        axiom_id: TermId,
        bound_terms: BoxSlice<TermIdx>,
        rewrite_of: Option<TermIdx>,
    },
    Axiom {
        axiom: QuantIdx,
        pattern: PatternIdx,
        bound_terms: BoxSlice<TermIdx>,
    },
    Quantifier {
        quant: QuantIdx,
        pattern: PatternIdx,
        bound_terms: BoxSlice<ENodeIdx>,
    },
}
impl MatchKind {
    pub fn quant_pat(&self) -> Option<QuantPat> {
        self.quant_idx().map(|quant| QuantPat {
            quant,
            pat: self.pattern(),
        })
    }

    pub fn quant_idx(&self) -> Option<QuantIdx> {
        match self {
            Self::MBQI { quant, .. }
            | Self::Axiom { axiom: quant, .. }
            | Self::Quantifier { quant, .. } => Some(*quant),
            _ => None,
        }
    }
    pub fn pattern(&self) -> Option<PatternIdx> {
        match self {
            Self::MBQI { .. } | Self::TheorySolving { .. } => None,
            Self::Axiom { pattern, .. } | Self::Quantifier { pattern, .. } => Some(*pattern),
        }
    }

    pub fn bound_terms<T>(
        &self,
        enode: impl Fn(ENodeIdx) -> T,
        term: impl Fn(TermIdx) -> T,
    ) -> Box<[T]> {
        match self {
            Self::MBQI { bound_terms, .. } | Self::Quantifier { bound_terms, .. } => {
                bound_terms.iter().map(|&x| enode(x)).collect()
            }
            Self::TheorySolving { bound_terms, .. } | Self::Axiom { bound_terms, .. } => {
                bound_terms.iter().map(|&x| term(x)).collect()
            }
        }
    }
    pub fn is_discovered(&self) -> bool {
        self.quant_idx().is_none()
    }
    pub fn is_mbqi(&self) -> bool {
        matches!(self, Self::MBQI { .. })
    }
    // TODO: this is currently unused
    pub fn rewrite_of(&self) -> Option<TermIdx> {
        match self {
            Self::TheorySolving { rewrite_of, .. } => *rewrite_of,
            _ => None,
        }
    }

    pub fn bound_term(&self, to_tidx: impl Fn(ENodeIdx) -> TermIdx, qvar: u32) -> Option<TermIdx> {
        match self {
            Self::MBQI { bound_terms, .. } | Self::Quantifier { bound_terms, .. } => {
                bound_terms.get(qvar as usize).copied().map(to_tidx)
            }
            Self::TheorySolving { bound_terms, .. } | Self::Axiom { bound_terms, .. } => {
                bound_terms.get(qvar as usize).copied()
            }
        }
    }
}

/// Explains how a term in a pattern was matched. It will always start with an
/// enode and then have some sequence of equalities used to rewrite distinct
/// subexpressions of the enode.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct Blame {
    pub coupling: Coupling,
    pub enode: ENodeIdx,
    pub equalities: BoxSlice<EqTransIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Coupling {
    /// The enode and equalities parsed from the logfile could be used exactly
    /// to obtain the matched sub-pattern.
    Exact,
    /// The enode and equalities parsed from the logfile could be used exactly
    /// to obtain the matched sub-pattern. Some of the equalities needed to be
    /// flipped, reused or used in a different order.
    SwappedEqs,
    /// The enode required some unlogged equalities to be matched. These
    /// equalities existed in the logfile but were not blamed.
    MissingEqs,
    /// The enode required some new equalities to be matched. These equalities
    /// did not exist in the logfile.
    AddedEqs,
    /// The enode could not be rewritten to the matched sub-pattern. This should
    /// not appear in the final `Blame`.
    Error,
}

impl Blame {
    pub fn is_complete(&self) -> bool {
        matches!(
            self.coupling,
            Coupling::Exact | Coupling::SwappedEqs | Coupling::MissingEqs
        )
    }
}

/// An identifier for a Z3 quantifier instantiation (called "fingerprint" in the original Axiom Profiler).
/// Represented as a 16-digit hexadecimal number in log files.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct Fingerprint(pub u64);
impl Fingerprint {
    pub fn parse(value: &str) -> Result<Self> {
        u64::from_str_radix(value.strip_prefix("0x").unwrap_or(value), 16)
            .map(Self)
            .map_err(Error::InvalidFingerprint)
    }
    pub fn is_zero(&self) -> bool {
        self.0 == 0
    }
}
impl std::ops::Deref for Fingerprint {
    type Target = u64;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl fmt::Display for Fingerprint {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:x}", self.0)
    }
}

/// A Z3 instantiation.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct Instantiation {
    pub match_: MatchIdx,
    pub kind: InstantiationKind,
    pub proof_id: InstProofLink,
    /// The enodes that were yielded by the instantiation along with the
    /// generalised terms for them (`MaybeSynthIdx::Parsed` if the yielded term
    /// doesn't contain any quantified variables)
    pub yields_terms: BoxSlice<ENodeIdx>,
    pub frame: StackIdx,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub enum InstantiationKind {
    Axiom,
    NonAxiom {
        fingerprint: Fingerprint,
        z3_generation: NonMaxU32,
    },
}

impl InstantiationKind {
    pub fn fingerprint(&self) -> Fingerprint {
        match self {
            Self::NonAxiom { fingerprint, .. } => *fingerprint,
            _ => Fingerprint(0),
        }
    }

    pub fn z3_generation(&self) -> Option<NonMaxU32> {
        match self {
            Self::NonAxiom { z3_generation, .. } => Some(*z3_generation),
            _ => None,
        }
    }
}

/// A Z3 instantiation.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub enum InstProofLink {
    /// Axiom instantiations (i.e. those with `.fingerprint.is_zero()`) point to
    /// a term regardless of whether proofs are enabled. These terms seem to
    /// generally be an equality.
    IsAxiom(TermIdx),
    /// When proofs are enabled (i.e. if z3 was run with `proof=true`) non-axiom
    /// instantiations will include a pointer to the instantiation proof step.
    HasProof(ProofIdx),
    /// When proofs are disabled, non-axiom instantiations have no link to the
    /// fact (i.e. their body) that was instantiated. However, we use a hack to
    /// try and find the proof term nevertheless: the `[mk-app]` immediately
    /// preceding the `[instantiation]` line is generally the term we just
    /// proved.
    ProofsDisabled(Option<TermIdx>),
}

impl InstProofLink {
    pub fn proof(&self) -> Option<ProofIdx> {
        match self {
            Self::HasProof(proof) => Some(*proof),
            _ => None,
        }
    }
}
