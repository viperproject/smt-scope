use std::collections::hash_map::Entry;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    idx,
    items::{Meaning, Term, TermId, TermIdx, TermKind},
    BoxSlice, FxHashMap, Result, TiVec,
};

use super::terms::Terms;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub enum AnyTerm {
    Parsed(Term),
    Synth(SynthTerm),
    Constant(Meaning),
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct SynthTerm {
    pub kind: SynthTermKind,
    pub child_ids: BoxSlice<SynthIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
#[repr(transparent)]
pub struct SynthIdx(TermIdx);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
// Note that we must preserve `size_of::<SynthTermKind>() == size_of::<TermKind>()`!
pub enum SynthTermKind {
    Parsed(TermKind),
    /// When generalising e.g. `f(x)` and `f(g(x))` we get back a `f(_)` term
    /// where the `_` term is of kind `Generalised` and points to a `SynthIdx`
    /// term of `g($0)` where the `$0` term is of kind `Input`.
    Generalised(SynthIdx),
    Variable(u32),
    /// When generalising e.g. `f(x)` and `f(g(x))` we get back a `f(_)` term
    /// where the `_` term is of kind `Generalised` and points to a `SynthIdx`
    /// term of `g($0)` where the `$0` term is of kind `Input`. The `Input` may
    /// additionally contain a constant offset.
    Input(Option<SynthIdx>),
    /// Never actually stored in `SynthTerm.kind` byt created as a kind for
    /// `AnyTerm::Constant`.
    Constant,
}

impl From<TermIdx> for SynthIdx {
    fn from(tidx: TermIdx) -> Self {
        Self(tidx)
    }
}

impl AnyTerm {
    pub fn id(&self) -> Option<TermId> {
        match self {
            AnyTerm::Parsed(term) => Some(term.id),
            AnyTerm::Synth(_) => None,
            AnyTerm::Constant(_) => None,
        }
    }
    pub fn kind(&self) -> SynthTermKind {
        match self {
            AnyTerm::Parsed(term) => SynthTermKind::Parsed(term.kind),
            AnyTerm::Synth(synth_term) => synth_term.kind,
            AnyTerm::Constant(_) => SynthTermKind::Constant,
        }
    }
    pub fn child_ids<'a>(&'a self) -> &'a [SynthIdx] {
        match self {
            AnyTerm::Parsed(term) => {
                let child_ids = &*term.child_ids;
                unsafe { std::mem::transmute::<&'a [TermIdx], &'a [SynthIdx]>(child_ids) }
            }
            AnyTerm::Synth(synth_term) => &synth_term.child_ids,
            AnyTerm::Constant(_) => &[],
        }
    }
}

impl SynthTermKind {
    pub fn parsed(self) -> Option<TermKind> {
        match self {
            SynthTermKind::Parsed(p) => Some(p),
            _ => None,
        }
    }
}

impl Term {
    #[allow(clippy::no_effect)]
    const CHECK_REPR_EQ: bool = {
        let sizeof_eq = core::mem::size_of::<Term>() == core::mem::size_of::<AnyTerm>();
        [(); 1][!sizeof_eq as usize];
        true
    };
    pub fn as_any(&self) -> &AnyTerm {
        let _ = Self::CHECK_REPR_EQ;
        // SAFETY: `AnyTerm` and `Term` have the same memory layout since they
        // have the same `size_of`.
        unsafe { std::mem::transmute::<&Term, &AnyTerm>(self) }
    }
}

idx!(DefStIdx, "y{}");

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct SynthTerms {
    start_idx: TermIdx,
    synth_terms: TiVec<DefStIdx, AnyTerm>,
    interned: FxHashMap<AnyTerm, SynthIdx>,
}

impl Default for SynthTerms {
    fn default() -> Self {
        Self {
            start_idx: TermIdx::MAX,
            synth_terms: TiVec::default(),
            interned: FxHashMap::default(),
        }
    }
}

impl SynthTerms {
    fn tidx_to_dstidx(&self, tidx: SynthIdx) -> core::result::Result<DefStIdx, TermIdx> {
        if self.start_idx <= tidx.0 {
            Ok(DefStIdx::from(
                usize::from(tidx.0) - usize::from(self.start_idx),
            ))
        } else {
            Err(tidx.0)
        }
    }
    fn dstidx_to_tidx(dstidx: DefStIdx, start_idx: TermIdx) -> SynthIdx {
        assert!(
            usize::from(dstidx) + usize::from(start_idx) < usize::MAX,
            "SynthIdx overflow {dstidx} + {start_idx}"
        );
        SynthIdx(TermIdx::from(usize::from(dstidx) + usize::from(start_idx)))
    }

    pub fn eof(&mut self, start_idx: TermIdx) {
        self.start_idx = start_idx;
    }

    pub fn as_tidx(&self, sidx: SynthIdx) -> Option<TermIdx> {
        self.tidx_to_dstidx(sidx).err()
    }

    pub(crate) fn index<'a>(&'a self, terms: &'a Terms, idx: SynthIdx) -> &AnyTerm {
        match self.tidx_to_dstidx(idx) {
            Ok(idx) => &self.synth_terms[idx],
            Err(tidx) => {
                let term = &terms[tidx];
                term.as_any()
            }
        }
    }

    pub(crate) fn new_constant(&mut self, meaning: Meaning) -> Result<SynthIdx> {
        self.insert(AnyTerm::Constant(meaning))
    }

    pub(crate) fn new_input(&mut self, offset: Option<Meaning>) -> Result<SynthIdx> {
        let offset = offset.map(|o| self.new_constant(o)).transpose()?;
        let term = SynthTerm {
            kind: SynthTermKind::Input(offset),
            child_ids: Default::default(),
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn _new_variable(&mut self, id: u32) -> Result<SynthIdx> {
        let term = SynthTerm {
            kind: SynthTermKind::Variable(id),
            child_ids: Default::default(),
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn new_generalised(&mut self, gen: SynthIdx) -> Result<SynthIdx> {
        let term = SynthTerm {
            kind: SynthTermKind::Generalised(gen),
            child_ids: Default::default(),
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn new_synthetic(
        &mut self,
        kind: TermKind,
        child_ids: BoxSlice<SynthIdx>,
    ) -> Result<SynthIdx> {
        assert!(
            child_ids.iter().any(|c| self.start_idx <= c.0),
            "Synthetic term must have at least one synthetic child"
        );
        let term = SynthTerm {
            kind: SynthTermKind::Parsed(kind),
            child_ids,
        };
        self.insert(AnyTerm::Synth(term))
    }

    fn insert(&mut self, term: AnyTerm) -> Result<SynthIdx> {
        self.interned.try_reserve(1)?;
        match self.interned.entry(term) {
            Entry::Occupied(entry) => Ok(*entry.get()),
            Entry::Vacant(entry) => {
                self.synth_terms.raw.try_reserve(1)?;
                let idx = self.synth_terms.push_and_get_key(entry.key().clone());
                let idx = Self::dstidx_to_tidx(idx, self.start_idx);
                Ok(*entry.insert(idx))
            }
        }
    }
}
