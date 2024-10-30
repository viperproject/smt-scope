use std::{collections::hash_map::Entry, mem::ManuallyDrop, ops::Index};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{QuantIdx, Quantifier, SynthTermIdx, Term, TermIdx, TermKind},
    FxHashMap, IString, Result, TiVec,
};

use super::terms::Terms;

// #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
// #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
// #[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
// #[repr(transparent)]
// pub struct Synth<T>(T);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
pub enum MaybeSynth<T, S> {
    Parsed(T),
    Synth(S),
}

pub type MaybeSynthIdx = MaybeSynth<TermIdx, SynthTermIdx>;
pub type MaybeSynthTerm<'a> = MaybeSynth<&'a Term, &'a SynthTerm>;
pub type MaybeSynthKind = MaybeSynth<TermKind, SynthTermKind>;
pub type MaybeSynthChildren<'a> = MaybeSynth<&'a [TermIdx], &'a [MaybeSynthIdx]>;

impl<T, S> From<T> for MaybeSynth<T, S> {
    fn from(parsed: T) -> Self {
        Self::Parsed(parsed)
    }
}

impl<T, S> MaybeSynth<T, S> {
    pub fn parsed(self) -> Option<T> {
        match self {
            Self::Parsed(parsed) => Some(parsed),
            Self::Synth(_) => None,
        }
    }

    pub fn map<NT, NS>(
        self,
        ft: impl FnOnce(T) -> NT,
        fs: impl FnOnce(S) -> NS,
    ) -> MaybeSynth<NT, NS> {
        match self {
            Self::Parsed(parsed) => MaybeSynth::Parsed(ft(parsed)),
            Self::Synth(synth) => MaybeSynth::Synth(fs(synth)),
        }
    }
}

impl<T> MaybeSynth<T, T> {
    pub fn join(self) -> T {
        match self {
            Self::Parsed(parsed) => parsed,
            Self::Synth(synth) => synth,
        }
    }
}

impl<'a> MaybeSynthTerm<'a> {
    pub fn kind(self) -> MaybeSynthKind {
        self.map(|t| t.kind, |t| t.kind)
    }
    pub fn child_ids(self) -> MaybeSynthChildren<'a> {
        self.map(|t| &*t.child_ids, |t| &*t.child_ids)
    }
}

impl MaybeSynthKind {
    pub fn either_eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::Parsed(TermKind::App(a)), Self::Synth(SynthTermKind::App(b)))
            | (Self::Synth(SynthTermKind::App(a)), Self::Parsed(TermKind::App(b))) => a == b,
            _ => self == other,
        }
    }
}

impl<'a> MaybeSynthChildren<'a> {
    pub fn len(self) -> MaybeSynth<usize, usize> {
        self.map(|t| t.len(), |t| t.len())
    }
    pub fn get(self, idx: usize) -> MaybeSynthIdx {
        self.map(|t| t[idx].into(), |t| t[idx]).join()
    }

    pub fn split_last(self) -> Option<(MaybeSynthIdx, MaybeSynthChildren<'a>)> {
        self.map(
            |t| {
                let (last, rest) = t.split_last()?;
                Some((
                    MaybeSynthIdx::Parsed(*last),
                    MaybeSynthChildren::Parsed(rest),
                ))
            },
            |t| {
                let (last, rest) = t.split_last()?;
                Some((*last, MaybeSynthChildren::Synth(rest)))
            },
        )
        .join()
    }

    pub fn iter(
        self,
    ) -> MaybeSynth<impl Iterator<Item = TermIdx> + 'a, impl Iterator<Item = MaybeSynthIdx> + 'a>
    {
        self.map(|t| t.iter().copied(), |t| t.iter().copied())
    }
}
impl<'a, T: Iterator<Item = TermIdx> + 'a, S: Iterator<Item = MaybeSynthIdx> + 'a> Iterator
    for MaybeSynth<T, S>
{
    type Item = MaybeSynthIdx;
    fn next(&mut self) -> Option<Self::Item> {
        match self {
            Self::Parsed(t) => t.next().map(MaybeSynthIdx::Parsed),
            Self::Synth(s) => s.next(),
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct SynthTerm {
    pub kind: SynthTermKind,
    pub child_ids: Box<[MaybeSynthIdx]>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SynthTermKind {
    App(IString),
    Generalised,
}

impl SynthTermKind {
    pub fn new(kind: TermKind) -> Self {
        match kind {
            TermKind::App(name) => Self::App(name),
            other => panic!("Unexpected term kind: {:?}", other),
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct SynthTerms {
    synth_terms: TiVec<SynthTermIdx, SynthTerm>,
    interned: FxHashMap<SynthTerm, SynthTermIdx>,
}

impl SynthTerms {
    pub(crate) fn new_synthetic_term(
        &mut self,
        kind: SynthTermKind,
        child_ids: Box<[MaybeSynthIdx]>,
    ) -> Result<SynthTermIdx> {
        // assert!(!matches!(kind, SynthTermKind::Generalised) || child_ids.is_empty(), "Generalised synthetic term must have no children");
        assert!(
            matches!(kind, SynthTermKind::Generalised)
                || child_ids
                    .iter()
                    .any(|c| matches!(c, MaybeSynthIdx::Synth(_))),
            "Synthetic term must have at least one synthetic child"
        );

        let term = SynthTerm { kind, child_ids };
        self.interned.try_reserve(1)?;
        match self.interned.entry(term) {
            Entry::Occupied(entry) => Ok(*entry.get()),
            Entry::Vacant(entry) => {
                self.synth_terms.raw.try_reserve(1)?;
                let idx = self.synth_terms.push_and_get_key(entry.key().clone());
                Ok(*entry.insert(idx))
            }
        }
    }
}

impl Index<SynthTermIdx> for SynthTerms {
    type Output = SynthTerm;
    fn index(&self, idx: SynthTermIdx) -> &Self::Output {
        &self.synth_terms[idx]
    }
}
