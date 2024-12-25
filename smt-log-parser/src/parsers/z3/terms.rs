use std::collections::hash_map::Entry;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use typed_index_collections::TiSlice;

use crate::{
    error::Either,
    items::{
        InstProofLink, Instantiation, Meaning, ProofIdx, ProofStep, ProofStepKind, QuantIdx, Term,
        TermId, TermIdToIdxMap, TermIdx, TermKind,
    },
    Error, FxHashMap, Result, StringTable, TiVec,
};

pub trait HasTermId {
    fn term_id(&self) -> TermId;
}

impl HasTermId for Term {
    fn term_id(&self) -> TermId {
        self.id
    }
}

impl HasTermId for ProofStep {
    fn term_id(&self) -> TermId {
        self.id
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct TermStorage<K: From<usize> + Copy, V: HasTermId> {
    term_id_map: TermIdToIdxMap<K>,
    terms: TiVec<K, V>,
}

impl<K: From<usize> + Copy, V: HasTermId> Default for TermStorage<K, V> {
    fn default() -> Self {
        Self {
            term_id_map: TermIdToIdxMap::default(),
            terms: TiVec::default(),
        }
    }
}

impl<K: From<usize> + Copy, V: HasTermId> TermStorage<K, V> {
    pub(super) fn new_term(&mut self, term: V) -> Result<K> {
        self.terms.raw.try_reserve(1)?;
        let id = term.term_id();
        let idx = self.terms.push_and_get_key(term);
        self.term_id_map.register_term(id, idx)?;
        Ok(idx)
    }

    pub(super) fn parse_id(
        &self,
        strings: &mut StringTable,
        id: &str,
    ) -> Result<Either<K, TermId>> {
        let term_id = TermId::parse(strings, id)?;
        Ok(self
            .term_id_map
            .get_term(&term_id)
            .map_or(Either::Right(term_id), Either::Left))
    }
    pub(super) fn parse_existing_id(&self, strings: &mut StringTable, id: &str) -> Result<K> {
        self.parse_id(strings, id)?
            .into_result()
            .map_err(Error::UnknownId)
    }

    pub(super) fn terms(&self) -> &TiSlice<K, V> {
        &self.terms
    }

    /// Perform a top-down dfs walk of the AST rooted at `idx` calling `f` on
    /// each node. If `f` returns `None` then the walk is terminated early.
    /// Otherwise the walk is restricted to the children returned by `f`.
    pub fn ast_walk<T>(
        &self,
        idx: K,
        mut f: impl FnMut(K, &V) -> core::result::Result<&[K], T>,
    ) -> Option<T>
    where
        usize: From<K>,
    {
        let mut todo = vec![idx];
        while let Some(idx) = todo.pop() {
            let next = &self.terms[idx];
            match f(idx, next) {
                Ok(to_walk) => todo.extend_from_slice(to_walk),
                Err(t) => return Some(t),
            }
        }
        None
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Terms {
    pub(super) app_terms: TermStorage<TermIdx, Term>,
    pub(super) proof_terms: TermStorage<ProofIdx, ProofStep>,

    meanings: FxHashMap<TermIdx, Meaning>,
}

impl Terms {
    pub(crate) fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.meanings.get(&tidx)
    }

    pub(super) fn get_instantiation_body(&self, inst: &Instantiation) -> Option<TermIdx> {
        let proved_term = match inst.proof_id {
            InstProofLink::IsAxiom(term_idx) => return Some(term_idx),
            InstProofLink::HasProof(proof_idx) => {
                let proof = &self[proof_idx];
                if matches!(proof.kind, ProofStepKind::PR_QUANT_INST) {
                    self[proof_idx].result
                } else {
                    return Some(proof.result);
                }
            }
            InstProofLink::ProofsDisabled(term_idx) => term_idx?,
        };
        // The proved term is of the form `quant-inst(¬(quant) ∨ (inst))`.
        let proved_term = &self[proved_term];
        assert_eq!(proved_term.child_ids.len(), 2);
        Some(proved_term.child_ids[1])
    }

    pub(super) fn quant(&self, quant: TermIdx) -> Result<QuantIdx> {
        self[quant]
            .kind
            .quant_idx()
            .ok_or_else(|| Error::UnknownQuantifierIdx(quant))
    }

    pub(super) fn new_meaning(&mut self, term: TermIdx, meaning: Meaning) -> Result<&Meaning> {
        self.meanings.try_reserve(1)?;
        match self.meanings.entry(term) {
            Entry::Occupied(old) => assert_eq!(old.get(), &meaning),
            Entry::Vacant(empty) => {
                empty.insert(meaning);
            }
        };
        Ok(&self.meanings[&term])
    }

    /// Perform a top-down walk of the AST rooted at `tidx` calling `f` on each
    /// node of kind `App` and walking the children that are returned. `Quant`
    /// and `Var` nodes are skipped.
    pub(super) fn app_walk<T>(
        &self,
        tidx: TermIdx,
        mut f: impl FnMut(TermIdx, &Term) -> core::result::Result<&[TermIdx], T>,
    ) -> core::result::Result<(), T> {
        self.app_terms
            .ast_walk(tidx, |tidx, term| match term.kind {
                TermKind::Var(_) => Ok(&[]),
                TermKind::App(_) => f(tidx, term),
                TermKind::Quant(_) => Ok(&[]),
            })
            .map_or(Ok(()), Err)
    }

    /// Heuristic to get body of instantiated quantifier. See documentation of
    /// [`InstProofLink::ProofsDisabled`].
    pub(super) fn last_term_from_instance(&self, strings: &StringTable) -> Option<TermIdx> {
        self.app_terms
            .terms
            .last_key_value()
            .filter(|(_, term)| {
                term.kind
                    .app_name()
                    .is_some_and(|name| &strings[*name] == "or")
                    && term.child_ids.len() == 2
                    && {
                        let neg_quant = &self[term.child_ids[0]];
                        neg_quant
                            .kind
                            .app_name()
                            .is_some_and(|name| &strings[*name] == "not")
                            && neg_quant.child_ids.len() == 1
                            && self[neg_quant.child_ids[0]].kind.quant_idx().is_some()
                    }
            })
            .map(|(idx, _)| idx)
    }

    pub fn is_true_const(&self, tidx: TermIdx) -> bool {
        let id = self[tidx].id;
        id.namespace.is_none() && id.id.is_some_and(|id| id.get() == 1)
    }
    pub fn is_false_const(&self, tidx: TermIdx) -> bool {
        let id = self[tidx].id;
        id.namespace.is_none() && id.id.is_some_and(|id| id.get() == 2)
    }
    pub fn is_bool_const(&self, tidx: TermIdx) -> bool {
        self.is_true_const(tidx) || self.is_false_const(tidx)
    }
}

impl std::ops::Index<TermIdx> for Terms {
    type Output = Term;
    fn index(&self, idx: TermIdx) -> &Self::Output {
        &self.app_terms.terms[idx]
    }
}

impl std::ops::IndexMut<TermIdx> for Terms {
    fn index_mut(&mut self, idx: TermIdx) -> &mut Self::Output {
        &mut self.app_terms.terms[idx]
    }
}

impl std::ops::Index<ProofIdx> for Terms {
    type Output = ProofStep;
    fn index(&self, idx: ProofIdx) -> &Self::Output {
        &self.proof_terms.terms[idx]
    }
}

impl std::ops::IndexMut<ProofIdx> for Terms {
    fn index_mut(&mut self, idx: ProofIdx) -> &mut Self::Output {
        &mut self.proof_terms.terms[idx]
    }
}
