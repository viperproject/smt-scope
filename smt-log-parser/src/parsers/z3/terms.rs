use typed_index_collections::TiVec;

use crate::items::{StringTable, Term, TermId, TermIdToIdxMap, TermIdx, TermKind::GeneralizedTerm, Meaning};

#[derive(Debug)]
pub struct Terms {
    term_id_map: TermIdToIdxMap,
    terms: TiVec<TermIdx, Term>,
    generalized_term_boundary: Option<TermIdx>,
}

impl Terms {
    pub(super) fn new(strings: &mut StringTable) -> Self {
        Self {
            term_id_map: TermIdToIdxMap::new(strings),
            terms: TiVec::new(),
            generalized_term_boundary: None,
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

    pub(super) fn set_generalized_term_boundary(&mut self) {
        self.generalized_term_boundary = self.terms.last_key();
    }

    pub(super) fn is_general_term(&self, t: TermIdx) -> bool {
        if let Some(boundary) = self.generalized_term_boundary {
            t > boundary 
        } else {
            false
        } 
    }

    pub(super) fn mk_generalized_term(&mut self, meaning: Option<Meaning>, children: Vec<TermIdx>) -> TermIdx {
        let idx = self.terms.next_key();
        let term = Term {
            id: None,
            kind: GeneralizedTerm,
            meaning,
            child_ids: children,
        };
        self.terms.push(term);
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
