#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    error::Either,
    items::{Meaning, QuantIdx, Term, TermAndMeaning, TermId, TermIdToIdxMap, TermIdx, TermKind},
    Error, FxHashMap, Result, StringTable, TiVec,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Terms {
    term_id_map: TermIdToIdxMap,
    terms: TiVec<TermIdx, Term>,
    meanings: FxHashMap<TermIdx, Meaning>,
    parsed_terms: Option<TermIdx>,

    synthetic_terms: FxHashMap<TermAndMeaning<'static>, TermIdx>,
}

impl Terms {
    pub(super) fn new(strings: &mut StringTable) -> Self {
        Self {
            term_id_map: TermIdToIdxMap::new(strings),
            terms: TiVec::default(),
            meanings: FxHashMap::default(),
            parsed_terms: None,

            synthetic_terms: FxHashMap::default(),
        }
    }

    pub(super) fn new_term(&mut self, term: Term) -> Result<TermIdx> {
        self.terms.raw.try_reserve(1)?;
        let id = term.id;
        let idx = self.terms.push_and_get_key(term);
        if let Some(id) = id {
            self.term_id_map.register_term(id, idx)?;
        }
        Ok(idx)
    }

    pub(super) fn parse_id(
        &self,
        strings: &mut StringTable,
        id: &str,
    ) -> Result<Either<TermIdx, TermId>> {
        let term_id = TermId::parse(strings, id)?;
        Ok(self
            .term_id_map
            .get_term(&term_id)
            .map(Either::Left)
            .unwrap_or(Either::Right(term_id)))
    }
    pub(super) fn parse_existing_id(&self, strings: &mut StringTable, id: &str) -> Result<TermIdx> {
        self.parse_id(strings, id)?
            .into_result()
            .map_err(Error::UnknownId)
    }

    pub fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.meanings.get(&tidx)
    }
    pub(super) fn quant(&self, quant: TermIdx) -> Result<QuantIdx> {
        self[quant]
            .kind
            .quant_idx()
            .ok_or_else(|| Error::UnknownQuantifierIdx(quant))
    }

    pub(super) fn new_meaning(&mut self, term: TermIdx, meaning: Meaning) -> Result<()> {
        self.meanings.try_reserve(1)?;
        use std::collections::hash_map::Entry;
        match self.meanings.entry(term) {
            Entry::Occupied(old) => assert_eq!(old.get(), &meaning),
            Entry::Vacant(empty) => {
                empty.insert(meaning);
            }
        };
        Ok(())
    }

    pub fn get_term(&self, term: TermIdx) -> TermAndMeaning {
        TermAndMeaning {
            term: &self.terms[term],
            meaning: self.meanings.get(&term),
        }
    }

    pub(super) fn end_of_file(&mut self) {
        self.parsed_terms = Some(self.terms.next_key());
    }

    pub(crate) fn new_synthetic_term(
        &mut self,
        kind: TermKind,
        child_ids: Box<[TermIdx]>,
        meaning: Option<Meaning>,
    ) -> TermIdx {
        let term = Term {
            id: None,
            kind,
            child_ids,
        };
        let term_and_meaning = TermAndMeaning {
            term: &term,
            meaning: meaning.as_ref(),
        };
        if let Some(&tidx) = self.synthetic_terms.get(&term_and_meaning) {
            tidx
        } else {
            let tidx = self.terms.push_and_get_key(term);
            if let Some(meaning) = meaning {
                self.meanings.insert(tidx, meaning);
            }
            let term = self.get_term(tidx);
            // Safety: this will only ever be stored in the keys of the
            // `synthetic_terms` map and the API ensures that these keys never
            // leak out. The keys of the map are dropped at the same time that
            // the lifetime expires. The existing `Term` and `Meaning` values
            // are never mutated.
            let term =
                unsafe { std::mem::transmute::<TermAndMeaning, TermAndMeaning<'static>>(term) };
            self.synthetic_terms.insert(term, tidx);
            tidx
        }
    }
    pub(super) fn get_term_idx_of_id(&self, tid: TermId) -> Option<TermIdx> {
        self.term_id_map.get_term(&tid)
    }
}

impl std::ops::Index<TermIdx> for Terms {
    type Output = Term;
    fn index(&self, idx: TermIdx) -> &Self::Output {
        &self.terms[idx]
    }
}

impl std::ops::IndexMut<TermIdx> for Terms {
    fn index_mut(&mut self, idx: TermIdx) -> &mut Self::Output {
        &mut self.terms[idx]
    }
}
