use std::{cmp::Ordering, ops::Deref};

use fxhash::FxHashSet;

use crate::{
    items::{QuantIdx, QuantPatVec},
    BoxSlice, FxHashMap, TiVec, Z3Parser,
};

use super::InstGraph;

#[derive(Clone)]
pub struct QuantifierAnalysis(QuantPatVec<QuantPatInfo>);

#[derive(Default, Clone)]
pub struct QuantPatInfo {
    /// How much total cost did this quantifier + pattern accrue from individual
    /// instantiations.
    pub costs: f64,
    /// How many other instantiations of other quantifiers is this quantifier
    /// _directly_ responsible for.
    pub children: f64,
    /// How many times does an instantiation of this quantifier depend on an
    /// instantiation of the other quantifier.
    pub direct_deps: Vec<DirectDep>,
}

#[derive(Clone, Default)]
pub struct DirectDep {
    pub enode: FxHashMap<Option<QuantIdx>, u32>,
    pub eqs: FxHashMap<BoxSlice<QuantIdx>, u32>,
}

type TransQuantAnalaysis = TiVec<QuantIdx, FxHashSet<QuantIdx>>;

impl Deref for QuantifierAnalysis {
    type Target = QuantPatVec<QuantPatInfo>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl QuantifierAnalysis {
    pub fn new(parser: &Z3Parser, inst_graph: &InstGraph) -> Self {
        let mut self_ = QuantifierAnalysis(parser.new_quant_pat_vec(|_| QuantPatInfo::default()));
        for data in parser.instantiations_data() {
            let Some(qpat) = data.match_.kind.quant_pat() else {
                continue;
            };
            let qinfo = &mut self_.0[qpat];

            let ginst = &inst_graph.raw[data.iidx];
            qinfo.costs += ginst.cost;

            for &child in ginst.children.insts.iter() {
                let cq = parser.get_inst(child).match_.kind.quant_idx();
                if cq.is_some_and(|q| q == qpat.quant) {
                    // Skip self references.
                    continue;
                }
                let parents = inst_graph.raw[child].parents.insts.len() as f64;
                qinfo.children += 1.0 / parents;
            }

            let pat = parser.get_pattern_term(qpat);
            let subpats = pat.map(|p| p.child_ids.len()).unwrap_or_default();
            for (i, blame) in data.match_.pattern_matches().enumerate() {
                // Increment the count for each expression in the pattern.
                if i == qinfo.direct_deps.len() {
                    if i >= subpats {
                        // TODO: there is a bug in z3 whereby more matched
                        // expressions are printed than subpatterns available.
                        // This happens rarely so don't bother trying to
                        // backtrack here (the results will be slightly wrong).
                        break;
                    }
                    qinfo.direct_deps.push(DirectDep::default());
                }
                let direct_dep = &mut qinfo.direct_deps[i];

                let created_by = parser[blame.enode].blame.inst();
                let created_by =
                    created_by.and_then(|iidx| parser.get_inst(iidx).match_.kind.quant_idx());
                *direct_dep.enode.entry(created_by).or_default() += 1;

                for &eq in blame.equalities.iter() {
                    let eq_parents = inst_graph.raw[eq].parents.insts.iter().copied();
                    let eq_parents =
                        eq_parents.filter_map(|iidx| parser.get_inst(iidx).match_.kind.quant_idx());
                    *direct_dep.eqs.entry(eq_parents.collect()).or_default() += 1;
                }
            }
        }
        self_
    }

    pub fn total_costs(&self) -> f64 {
        self.iter_enumerated().map(|(_, info)| info.costs).sum()
    }

    pub fn quant_sum_cost(&self, quant: QuantIdx) -> f64 {
        let data = &self.0 .0[quant];
        data.mbqi.costs + data.pats.iter().map(|d| d.costs).sum::<f64>()
    }

    pub fn quants_costs(&self) -> impl Iterator<Item = (QuantIdx, f64)> + '_ {
        self.0
             .0
            .iter_enumerated()
            .map(|(quant, data)| (quant, data.iter_enumerated().map(|(_, d)| d.costs).sum()))
    }

    pub fn quants_children(&self) -> impl Iterator<Item = (QuantIdx, f64)> + '_ {
        self.0
             .0
            .iter_enumerated()
            .map(|(quant, data)| (quant, data.iter_enumerated().map(|(_, d)| d.children).sum()))
    }

    pub fn calculate_transitive(&self, mut steps: Option<u32>) -> TransQuantAnalaysis {
        let mut initial: TiVec<QuantIdx, _> =
            (0..self.0 .0.len()).map(|_| FxHashSet::default()).collect();
        for (qpat, data) in self.iter_enumerated() {
            initial[qpat.quant].extend(data.keys());
        }
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
            for ddep in info.keys() {
                let (curr, ddep) = match idx.quant.cmp(&ddep) {
                    Ordering::Less => {
                        let (left, right) = analysis.split_at_mut(ddep);
                        (&mut left[idx.quant], right.first().unwrap())
                    }
                    Ordering::Greater => {
                        let (left, right) = analysis.split_at_mut(idx.quant);
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

impl QuantPatInfo {
    /// This function will not provide an accurate view of dependencies, use
    /// only for debugging.
    pub fn keys(&self) -> impl Iterator<Item = QuantIdx> + '_ {
        self.iter().map(|(q, _)| q)
    }

    /// This function will not provide an accurate view of dependencies, use
    /// only for debugging.
    pub fn values(&self) -> impl Iterator<Item = u32> + '_ {
        self.iter().map(|(_, c)| c)
    }

    /// This function will not provide an accurate view of dependencies, use
    /// only for debugging.
    pub fn iter(&self) -> impl Iterator<Item = (QuantIdx, u32)> + '_ {
        self.direct_deps.iter().flat_map(|ddep| {
            let enode = ddep.enode.iter().filter_map(|(q, c)| q.zip(Some(*c)));
            let eqs = ddep
                .eqs
                .iter()
                .flat_map(|(q, c)| q.iter().map(move |q| (*q, *c)));
            enode.chain(eqs)
        })
    }
}
