use std::cmp::{Ordering, Reverse};

use crate::{
    items::{Assignment, TermIdx},
    FxHashMap, Z3Parser,
};

pub struct CdclAnalysis {
    /// The number of times an assignment was made and then not used in the cut.
    pub uncut_assigns: Vec<(Assignment, u32)>,
    pub cut_assigns: Vec<(Assignment, u32)>,
}

#[derive(Default)]
struct AssignCount(FxHashMap<TermIdx, (u32, u32)>);

impl AssignCount {
    fn insert(&mut self, assign: Assignment) {
        let (true_count, false_count) = self.0.entry(assign.literal).or_default();
        if assign.value {
            *true_count += 1;
        } else {
            *false_count += 1;
        }
    }

    fn into_vec(self) -> Vec<(Assignment, u32)> {
        let mut v = self
            .0
            .into_iter()
            .filter_map(
                |(literal, (true_count, false_count))| match true_count.cmp(&false_count) {
                    Ordering::Greater => Some((
                        Assignment {
                            literal,
                            value: true,
                        },
                        true_count - false_count,
                    )),
                    Ordering::Less => Some((
                        Assignment {
                            literal,
                            value: false,
                        },
                        false_count - true_count,
                    )),
                    Ordering::Equal => None,
                },
            )
            .collect::<Vec<_>>();
        v.sort_by_key(|&(a, c)| (Reverse(c), a.literal));
        v
    }
}

impl CdclAnalysis {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut uncut_assigns = AssignCount::default();
        let mut cut_assigns = AssignCount::default();
        for db in parser.cdcl.dead_branches() {
            let dead_branch = parser.cdcl.dead_branch(db);

            let mut cut = FxHashMap::default();
            for &assign in db.conflict.cut.iter() {
                cut_assigns.insert(assign);
                let old = cut.insert(assign.literal, Some(assign.value));
                debug_assert!(old.is_none());
            }
            let assignments = dead_branch.flat_map(|db| parser[db].get_assignments());
            for assign in assignments {
                if let Some(value) = cut.get_mut(&assign.literal) {
                    debug_assert_eq!(value.take(), Some(!assign.value));
                    continue;
                }
                uncut_assigns.insert(assign);
            }
        }
        let uncut_assigns = uncut_assigns.into_vec();
        let cut_assigns = cut_assigns.into_vec();
        Self {
            uncut_assigns,
            cut_assigns,
        }
    }
}
