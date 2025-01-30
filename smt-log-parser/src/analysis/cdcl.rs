use crate::{
    items::{CdclIdx, TermIdx},
    FxHashMap, TiVec, Z3Parser,
};

#[derive(Default)]
pub struct CdclAnalysis {
    pub assignments: FxHashMap<TermIdx, (AssignData, AssignData)>,
}

#[derive(Clone, Copy, Default)]
pub struct AssignData {
    pub count: u32,
    pub cost: u32,
}

impl CdclAnalysis {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut self_ = Self::default();
        let mut cdcl_size: TiVec<CdclIdx, _> = parser.cdcls().iter().map(|_| 1u32).collect();

        for (cidx, data) in parser.cdcls().iter_enumerated().rev() {
            let Some(parent) = data.backlink(cidx).to_root() else {
                continue;
            };
            let size = cdcl_size[cidx];
            cdcl_size[parent] += size;

            for a in data.get_assignments() {
                let (true_data, false_data) = self_.assignments.entry(a.literal).or_default();
                if a.value {
                    true_data.count += 1;
                    true_data.cost += size;
                } else {
                    false_data.count += 1;
                    false_data.cost += size;
                }
            }
        }
        self_
    }
}
