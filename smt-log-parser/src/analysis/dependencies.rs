use std::{cmp::Ordering, ops::Deref};

use fxhash::FxHashSet;

use crate::{items::QuantIdx, FxHashMap, TiVec, Z3Parser};

use super::InstGraph;

#[derive(Clone)]
pub struct QuantifierAnalysis(TiVec<QuantIdx, QuantifierInfo>);

#[derive(Default, Clone)]
pub struct QuantifierInfo {
    /// How much total cost did this quantifier accrue from individual
    /// instantiations.
    pub costs: f64,
    /// How many times does an instantiation of this quantifier depend on an
    /// instantiation of the other quantifier.
    pub direct_deps: FxHashMap<QuantIdx, u32>,
}

type TransQuantAnalaysis = TiVec<QuantIdx, FxHashSet<QuantIdx>>;

impl Deref for QuantifierAnalysis {
    type Target = TiVec<QuantIdx, QuantifierInfo>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl QuantifierAnalysis {
    pub fn new(parser: &Z3Parser, inst_graph: &InstGraph) -> Self {
        let mut self_ = Self(
            parser
                .quantifiers
                .iter()
                .map(|_| QuantifierInfo::default())
                .collect(),
        );
        for data in parser.instantiations_data() {
            let Some(qidx) = data.match_.kind.quant_idx() else {
                continue;
            };
            let qinfo = &mut self_.0[qidx];
            let ginst = &inst_graph.raw[data.iidx];
            qinfo.costs += ginst.cost;
            for &parent_iidx in ginst.parents.insts.iter() {
                let parent_inst = &parser.insts[parent_iidx];
                let parent_match_ = &parser.insts[parent_inst.match_];
                let Some(parent_qidx) = parent_match_.kind.quant_idx() else {
                    continue;
                };
                *qinfo.direct_deps.entry(parent_qidx).or_default() += 1;
            }
        }
        self_
    }

    pub fn total_costs(&self) -> f64 {
        self.iter().map(|info| info.costs).sum()
    }

    pub fn calculate_transitive(&self, mut steps: Option<u32>) -> TransQuantAnalaysis {
        let mut initial = self
            .iter()
            .map(|info| info.direct_deps.keys().copied().collect())
            .collect();
        while !steps.is_some_and(|steps| steps == 0) {
            if !self.calculate_transitive_one(&mut initial) {
                break;
            }
            if let Some(steps) = &mut steps {
                *steps -= 1;
            }
        }
        initial
    }
    fn calculate_transitive_one(&self, analysis: &mut TransQuantAnalaysis) -> bool {
        let mut changed = false;
        for (idx, info) in self.iter_enumerated() {
            for &ddep in info.direct_deps.keys() {
                let (curr, ddep) = match idx.cmp(&ddep) {
                    Ordering::Less => {
                        let (left, right) = analysis.split_at_mut(ddep);
                        (&mut left[idx], right.first().unwrap())
                    }
                    Ordering::Greater => {
                        let (left, right) = analysis.split_at_mut(idx);
                        (right.first_mut().unwrap(), &left[ddep])
                    }
                    Ordering::Equal => continue,
                };
                let old_len = curr.len();
                curr.extend(ddep);
                changed |= old_len != curr.len();
            }
        }
        changed
    }
}
