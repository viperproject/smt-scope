use gloo_console::log;
use typed_index_collections::TiVec;

use crate::items::{StringTable, Term, TermId, TermIdToIdxMap, TermIdx, TermKind::{GeneralizedPrimitive, self}, Meaning};

#[derive(Debug)]
pub struct Terms {
    term_id_map: TermIdToIdxMap,
    terms: TiVec<TermIdx, Term>,
    wild_card_index: Option<TermIdx>,
}

impl Terms {
    pub(super) fn new(strings: &mut StringTable) -> Self {
        Self {
            term_id_map: TermIdToIdxMap::new(strings),
            terms: TiVec::new(),
            wild_card_index: None,
        }
    }

    pub(super) fn new_term(&mut self, id: TermId, term: Term) -> TermIdx {
        let idx = self.terms.next_key();
        self.terms.push(term);
        self.term_id_map.register_term(id, idx);
        idx
    }

    #[must_use]
    pub(super) fn parse_id(
        &self,
        strings: &mut StringTable,
        id: &str,
    ) -> Option<Result<TermIdx, TermId>> {
        let term_id = TermId::parse(strings, id)?;
        Some(self.term_id_map.get_term(&term_id).ok_or_else(|| term_id))
    }
    #[must_use]
    pub(super) fn parse_existing_id(&self, strings: &mut StringTable, id: &str) -> Option<TermIdx> {
        self.parse_id(strings, id).and_then(|r| r.ok())
    }

    pub(super) fn create_wild_card(&mut self) {
        // log!(format!("There are {} non-general terms", self.terms.len()));
        let wild_card = Term {
            id: None,
            kind: GeneralizedPrimitive,
            child_ids: vec![],
            meaning: None,
        };
        self.terms.push(wild_card);
        self.wild_card_index = self.terms.last_key();
    }

    pub(super) fn is_general_term(&self, t: TermIdx) -> bool {
        if let Some(boundary) = self.wild_card_index {
            t > boundary 
        } else {
            false
        } 
    }

    pub(super) fn mk_generalized_term(&mut self, meaning: Option<Meaning>, kind: TermKind, children: Vec<TermIdx>) -> TermIdx {
        let idx = self.terms.next_key();
        let term = Term {
            id: None,
            kind,
            meaning,
            child_ids: children,
        };
        self.terms.push(term);
        // log!(format!("There are {} terms (including general terms)", self.terms.len()));
        idx
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
