use fxhash::FxHashMap;
use typed_index_collections::TiVec;

use crate::{
    Error, Result,
    items::{StringTable, Term, TermId, TermIdToIdxMap, TermIdx, TermKind, Meaning, QuantIdx}
};

#[derive(Debug)]
pub struct Terms {
    term_id_map: TermIdToIdxMap,
    terms: TiVec<TermIdx, Term>,
    meanings: FxHashMap<TermIdx, Meaning>,
    parsed_terms: Option<TermIdx>,

    synthetic_terms: FxHashMap<(Term, Option<Meaning>), TermIdx>,
}

impl Terms {
    pub(super) fn new(strings: &mut StringTable) -> Self {
        Self {
            term_id_map: TermIdToIdxMap::new(strings),
            terms: TiVec::new(),
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
    ) -> Result<std::result::Result<TermIdx, TermId>> {
        let term_id = TermId::parse(strings, id)?;
        Ok(self.term_id_map.get_term(&term_id).ok_or_else(|| term_id))
    }
    pub(super) fn parse_existing_id(&self, strings: &mut StringTable, id: &str) -> Result<TermIdx> {
        self.parse_id(strings, id)?.map_err(Error::UnknownId)
    }

    pub fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.meanings.get(&tidx)
    }
    pub(super) fn quant(&self, quant: TermIdx) -> Result<QuantIdx> {
        self[quant].kind.quant_idx().ok_or_else(|| Error::UnknownQuantifierIdx(quant))
    }

    pub(super) fn new_meaning(&mut self, term: TermIdx, meaning: Meaning) -> Result<()> {
        self.meanings.try_reserve(1)?;
        use std::collections::hash_map::Entry;
        match self.meanings.entry(term) {
            Entry::Occupied(old) => assert_eq!(old.get(), &meaning),
            Entry::Vacant(empty) => {
                empty.insert(meaning);
            },
        };
        Ok(())
    }

    pub(super) fn end_of_file(&mut self) {
        self.parsed_terms = Some(self.terms.next_key());
    }

    pub(super) fn new_synthetic_term(&mut self, kind: TermKind, children: Box<[TermIdx]>, meaning: Option<Meaning>) -> TermIdx {
        let term = Term {
            id: None,
            kind,
            child_ids: children,
        };
        let term = self.synthetic_terms.entry((term, meaning));
        *term.or_insert_with_key(|(term, meaning)| {
            let term = self.terms.push_and_get_key(term.clone());
            if let Some(meaning) = meaning {
                self.meanings.insert(term, *meaning);
            }
            term
        })
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
