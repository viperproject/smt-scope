use std::collections::hash_map::Entry;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    idx,
    items::{Term, TermId, TermIdx, TermKind},
    BoxSlice, FxHashMap, IString, Result, TiVec,
};

use super::terms::Terms;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
#[repr(transparent)]
pub struct Synth<T>(T);

// #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
// #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
// #[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
// pub enum MaybeSynth<T, S> {
//     Parsed(T),
//     Synth(S),
// }

pub type SynthIdx = Synth<TermIdx>;
pub type SynthTerm = Synth<Term>;
pub type SynthTermKind = Synth<TermKind>;

impl From<TermIdx> for SynthIdx {
    fn from(tidx: TermIdx) -> Self {
        Synth(tidx)
    }
}

impl SynthTerm {
    pub fn id(&self) -> Option<TermId> {
        if self.0.id == TermId::default() {
            None
        } else {
            Some(self.0.id)
        }
    }
    pub fn kind<'a>(&'a self) -> &'a SynthTermKind {
        let kind = &self.0.kind;
        unsafe { std::mem::transmute::<&'a TermKind, &'a Synth<TermKind>>(kind) }
    }
    pub fn child_ids<'a>(&'a self) -> &'a [SynthIdx] {
        let child_ids = &*self.0.child_ids;
        unsafe { std::mem::transmute::<&'a [TermIdx], &'a [Synth<TermIdx>]>(child_ids) }
    }
}

impl<'a> From<&'a Term> for &'a SynthTerm {
    fn from(term: &'a Term) -> Self {
        unsafe { std::mem::transmute::<&'a Term, &'a Synth<Term>>(term) }
    }
}

impl SynthTermKind {
    pub fn non_generalised(&self) -> Option<TermKind> {
        match self.0 {
            TermKind::Var(u32::MAX) => None,
            other => Some(other),
        }
    }
}

// impl MaybeSynthKind {
//     pub fn either_eq(self, other: Self) -> bool {
//         match (self, other) {
//             (Self::Parsed(TermKind::App(a)), Self::Synth(SynthTermKind::App(b)))
//             | (Self::Synth(SynthTermKind::App(a)), Self::Parsed(TermKind::App(b))) => a == b,
//             _ => self == other,
//         }
//     }
// }

// impl<'a> MaybeSynthChildren<'a> {
//     pub fn len(self) -> MaybeSynth<usize, usize> {
//         self.map(|t| t.len(), |t| t.len())
//     }
//     pub fn get(self, idx: usize) -> MaybeSynthIdx {
//         self.map(|t| t[idx].into(), |t| t[idx]).join()
//     }

//     pub fn split_last(self) -> Option<(MaybeSynthIdx, MaybeSynthChildren<'a>)> {
//         self.map(
//             |t| {
//                 let (last, rest) = t.split_last()?;
//                 Some((
//                     MaybeSynthIdx::Parsed(*last),
//                     MaybeSynthChildren::Parsed(rest),
//                 ))
//             },
//             |t| {
//                 let (last, rest) = t.split_last()?;
//                 Some((*last, MaybeSynthChildren::Synth(rest)))
//             },
//         )
//         .join()
//     }

//     pub fn iter(
//         self,
//     ) -> MaybeSynth<impl Iterator<Item = TermIdx> + 'a, impl Iterator<Item = MaybeSynthIdx> + 'a>
//     {
//         self.map(|t| t.iter().copied(), |t| t.iter().copied())
//     }
// }
// impl<'a, T: Iterator<Item = TermIdx> + 'a, S: Iterator<Item = MaybeSynthIdx> + 'a> Iterator
//     for MaybeSynth<T, S>
// {
//     type Item = MaybeSynthIdx;
//     fn next(&mut self) -> Option<Self::Item> {
//         match self {
//             Self::Parsed(t) => t.next().map(MaybeSynthIdx::Parsed),
//             Self::Synth(s) => s.next(),
//         }
//     }
// }

// #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
// #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
// #[derive(Debug, PartialEq, Eq, Hash, Clone)]
// pub struct SynthTerm {
//     pub kind: SynthTermKind,
//     pub child_ids: Box<[MaybeSynthIdx]>,
// }

// #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
// #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
// #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
// pub enum SynthTermKind {
//     App(IString),
//     Generalised,
// }

// impl SynthTermKind {
//     pub fn new(kind: TermKind) -> Self {
//         match kind {
//             TermKind::App(name) => Self::App(name),
//             other => panic!("Unexpected term kind: {:?}", other),
//         }
//     }
// }

idx!(DefStIdx, "y{}");

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct SynthTerms {
    start_idx: TermIdx,
    synth_terms: TiVec<DefStIdx, SynthTerm>,
    interned: FxHashMap<SynthTerm, SynthIdx>,
}

impl Default for SynthTerms {
    fn default() -> Self {
        Self {
            start_idx: TermIdx::from(usize::MAX - 1),
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
        Synth(TermIdx::from(usize::from(dstidx) + usize::from(start_idx)))
    }

    pub fn eof(&mut self, start_idx: TermIdx) {
        self.start_idx = start_idx;
    }

    pub fn as_tidx(&self, sidx: SynthIdx) -> Option<TermIdx> {
        self.tidx_to_dstidx(sidx).err()
    }

    pub(crate) fn index<'a>(&'a self, terms: &'a Terms, idx: SynthIdx) -> &SynthTerm {
        match self.tidx_to_dstidx(idx) {
            Ok(idx) => &self.synth_terms[idx],
            Err(tidx) => {
                let term = &terms[tidx];
                unsafe { std::mem::transmute::<&'a Term, &'a Synth<Term>>(term) }
            }
        }
    }

    pub(crate) fn new_generalised(&mut self, child_ids: BoxSlice<SynthIdx>) -> Result<SynthIdx> {
        self.insert(TermKind::Var(u32::MAX), child_ids)
    }

    pub(crate) fn new_synthetic(
        &mut self,
        app_name: IString,
        child_ids: BoxSlice<SynthIdx>,
    ) -> Result<SynthIdx> {
        assert!(
            child_ids.iter().any(|c| self.start_idx <= c.0),
            "Synthetic term must have at least one synthetic child"
        );
        self.insert(TermKind::App(app_name), child_ids)
    }

    fn insert(&mut self, kind: TermKind, child_ids: BoxSlice<SynthIdx>) -> Result<SynthIdx> {
        let child_ids =
            unsafe { std::mem::transmute::<BoxSlice<SynthIdx>, BoxSlice<TermIdx>>(child_ids) };
        let term = Synth(Term {
            kind,
            child_ids,
            id: TermId::default(),
        });
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
