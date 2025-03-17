use crate::{
    items::{Blame, ENodeIdx, InstIdx, QuantPatVec, TermIdx},
    FxHashMap, Z3Parser,
};

pub struct RedundancyAnalysis {
    pub per_quant: QuantPatVec<QuantRedundancy>,
}

impl RedundancyAnalysis {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut per_quant = parser.new_quant_pat_vec(|_| QuantRedundancy::default());
        for data in parser.instantiations_data() {
            let Some(qpat) = data.match_.kind.quant_pat() else {
                continue;
            };
            let bound_terms = data.match_.kind.bound_terms(Ok, Err);
            let quant = &mut per_quant[qpat];
            let duplicates = quant.duplicates.entry(bound_terms).or_default();
            duplicates.push(data.iidx);

            if duplicates.len() > 1
                || parser
                    .get_pattern(qpat)
                    .is_some_and(|p| parser[p].child_ids.len() <= 1)
            {
                continue;
            }
            for blame in data.match_.pattern_matches() {
                let blame = blame.clone();
                let sd = quant.sub_duplicates.entry(blame).or_default();
                *sd += 1;
            }
        }
        Self { per_quant }
    }
}

#[derive(Debug, Default)]
pub struct QuantRedundancy {
    pub duplicates: FxHashMap<Box<[Result<ENodeIdx, TermIdx>]>, Vec<InstIdx>>,
    pub sub_duplicates: FxHashMap<Blame, u32>,
}

impl QuantRedundancy {
    pub fn redundant_count(&self) -> u32 {
        self.duplicates.values().map(|v| v.len() as u32 - 1).sum()
    }
    pub fn redundant_ratio(&self) -> f64 {
        let rc = self.redundant_count();
        let total = rc + self.duplicates.len() as u32;
        if total == 0 {
            return 0.0;
        }
        rc as f64 / total as f64
    }

    pub fn unique_count(&self) -> u32 {
        self.duplicates.len() as u32
    }
    pub fn unique_inputs(&self) -> u32 {
        self.sub_duplicates.len() as u32
    }
    pub fn input_multiplicativity(&self) -> f64 {
        let uis = self.unique_inputs();
        if uis == 0 {
            return 0.0;
        }
        self.unique_count() as f64 / self.unique_inputs() as f64
    }
}
