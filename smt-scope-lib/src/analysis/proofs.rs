use std::cmp::Reverse;

use crate::{items::TermIdx, F64Ord, FxHashMap, Z3Parser};

use super::InstGraph;

pub struct ProofAnalysis {
    /// The cost approximation that it took to prove each lemma (by
    /// contradiction).
    pub lemmas_cost: Vec<(TermIdx, f64)>,
}

impl ProofAnalysis {
    pub fn new(parser: &Z3Parser, graph: &InstGraph) -> Self {
        let mut lemmas = FxHashMap::<_, f64>::default();
        for (idx, proof) in parser.proofs().iter_enumerated() {
            if !proof.kind.is_lemma() {
                continue;
            }
            *lemmas.entry(proof.result).or_default() += graph.raw[idx].cost;
        }
        let mut lemmas_cost = lemmas.into_iter().collect::<Vec<_>>();
        lemmas_cost.sort_unstable_by_key(|&(lemma, cost)| (Reverse(F64Ord(cost)), lemma));
        Self { lemmas_cost }
    }
}
