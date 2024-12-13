use std::cmp::Reverse;

use crate::{items::ProofIdx, F64Ord, FxHashMap, Z3Parser};

use super::InstGraph;

pub struct ProofAnalysis {
    /// The cost approximation that it took to disprove the hypothesis (may have
    /// been disproved in conjunction with other hypotheses).
    pub hypothesis_cost: Vec<(ProofIdx, f64)>,
}

impl ProofAnalysis {
    pub fn new(parser: &Z3Parser, graph: &InstGraph) -> Self {
        let mut hypothesis = FxHashMap::<_, f64>::default();
        for (idx, _) in parser.proofs().iter_enumerated() {
            let node = &graph.raw[idx];
            if !node.proof.proves_false() {
                continue;
            }
            let cost = node.cost;
            let hypotheses = graph.raw.hypotheses(parser, idx);
            if hypotheses.is_empty() {
                // proved unsat
                continue;
            }
            let cost_div = cost / hypotheses.len() as f64;
            for h in hypotheses {
                *hypothesis.entry(h).or_default() += cost_div;
            }
        }
        let mut hypothesis_cost = hypothesis.into_iter().collect::<Vec<_>>();
        hypothesis_cost.sort_by_key(|&(idx, cost)| (Reverse(F64Ord(cost)), idx));
        Self { hypothesis_cost }
    }
}
