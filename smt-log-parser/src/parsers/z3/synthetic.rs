use std::collections::hash_map::Entry;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    idx,
    items::{Meaning, Term, TermId, TermIdx, TermKind},
    BoxSlice, FxHashMap, Result, TiVec,
};

use super::{terms::Terms, Z3Parser};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub enum AnyTerm {
    Parsed(Term),
    Synth(SynthTerm),
    Constant(Meaning),
}

impl AnyTerm {
    pub fn check_valid(&self, is_tidx: impl Fn(SynthIdx) -> bool) {
        if let AnyTerm::Parsed(_) = self {
            debug_assert!(false, "Parsed term should not be inserted as synthetic!");
        }
        use SynthTermKind::*;
        match self.kind() {
            Parsed(TermKind::Var(_)) | Variable(_) | Input(_) | Constant => {
                debug_assert_eq!(self.child_ids().len(), 0)
            }
            Generalised => debug_assert_eq!(self.child_ids().len(), 1),
            Parsed(TermKind::Quant(_)) => debug_assert!(!self.child_ids().is_empty()),
            Parsed(TermKind::App(_)) => debug_assert!(
                self.child_ids().iter().any(|&c| !is_tidx(c)),
                "Synthetic term must have at least one synthetic child"
            ),
        }
    }

    pub fn replace_child_ids(&self, child_ids: BoxSlice<SynthIdx>) -> Option<Self> {
        assert_eq!(self.child_ids().len(), child_ids.len());
        if self.child_ids() == &*child_ids {
            return None;
        }
        match self {
            AnyTerm::Parsed(term) => Some(AnyTerm::Synth(SynthTerm {
                kind: SynthTermKind::Parsed(term.kind),
                child_ids,
            })),
            AnyTerm::Synth(synth_term) => Some(AnyTerm::Synth(SynthTerm {
                kind: synth_term.kind,
                child_ids,
            })),
            AnyTerm::Constant(_) => unreachable!(),
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct SynthTerm {
    pub kind: SynthTermKind,
    pub child_ids: BoxSlice<SynthIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
#[repr(transparent)]
pub struct SynthIdx(TermIdx);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
// Note that we must preserve `size_of::<SynthTermKind>() == size_of::<TermKind>()`!
pub enum SynthTermKind {
    Parsed(TermKind),
    /// When generalising e.g. `f(x)` and `f(g(x))` we get back a `f(_)` term
    /// where the `_` term is of kind `Generalised` and points to a `SynthIdx`
    /// term of `g($0)` where the `$0` term is of kind `Input`.
    Generalised,
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

    pub(crate) fn new_variable(&mut self, id: u32) -> Result<SynthIdx> {
        let term = SynthTerm {
            kind: SynthTermKind::Variable(id),
            child_ids: Default::default(),
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn new_generalised(&mut self, gen: SynthIdx) -> Result<SynthIdx> {
        let term = SynthTerm {
            kind: SynthTermKind::Generalised,
            child_ids: [gen].into_iter().collect(),
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn new_synthetic(
        &mut self,
        kind: TermKind,
        child_ids: BoxSlice<SynthIdx>,
    ) -> Result<SynthIdx> {
        let term = SynthTerm {
            kind: SynthTermKind::Parsed(kind),
            child_ids,
        };
        self.insert(AnyTerm::Synth(term))
    }

    pub(crate) fn insert(&mut self, term: AnyTerm) -> Result<SynthIdx> {
        term.check_valid(|idx| self.as_tidx(idx).is_some());
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

pub trait TermWalker<'a> {
    fn parser(&self) -> &'a Z3Parser;
    fn walk_idx(&mut self, idx: SynthIdx) {
        let term = self.parser().synth_terms.index(&self.parser().terms, idx);
        if !self.walk_synth(term, idx) {
            return;
        }
        if let AnyTerm::Parsed(term) = term {
            let idx = self.parser().synth_terms.as_tidx(idx).unwrap();
            if !self.walk_term(term, idx) {
                return;
            }
        }
        for &child in term.child_ids() {
            self.walk_idx(child);
        }
    }
    /// Return `false` to stop walking the children of this term.
    fn walk_synth(&mut self, _term: &'a AnyTerm, _idx: SynthIdx) -> bool {
        true
    }
    /// Return `false` to stop walking the children of this term.
    fn walk_term(&mut self, _term: &'a Term, _idx: TermIdx) -> bool {
        true
    }
}
