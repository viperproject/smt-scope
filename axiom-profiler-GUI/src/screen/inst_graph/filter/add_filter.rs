use petgraph::{
    visit::{Dfs, Walker},
    Direction,
};
use smt_log_parser::{
    analysis::{raw::NodeKind, InstGraph, RawNodeIndex},
    Z3Parser,
};
use yew::Callback;

use crate::screen::{
    extra::{Action, SimpleButton},
    inst_graph::GraphMode,
    ml::MlData,
};

use super::{Filter, DEFAULT_NODE_COUNT};

#[derive(Clone, Copy)]
pub struct AddFilter<'a> {
    pub parser: &'a Z3Parser,
    pub graph: &'a InstGraph,
    pub new_filter: &'a Callback<Filter>,
}

impl AddFilter<'_> {
    fn ml_data(self) -> Option<MlData> {
        self.graph.analysis.ml_data.as_ref().map(MlData::from)
    }

    pub fn general(self, mode: GraphMode) -> Vec<SimpleButton> {
        match mode {
            GraphMode::Inst => self.inst(),
            GraphMode::Proof => self.proof(),
            GraphMode::Cdcl => self.cdcl(),
        }
    }

    fn inst(self) -> Vec<SimpleButton> {
        let enable_ml = self
            .ml_data()
            .is_some_and(|mls| mls.maybe_mls + mls.sure_mls > 0);
        let filters = [
            (true, Filter::HideUnitNodes, vec![]),
            (true, Filter::MaxNodeIdx(1000), vec![]),
            (true, Filter::MinNodeIdx(1000), vec![]),
            (true, Filter::IgnoreTheorySolving, vec![]),
            (true, Filter::AllButExpensive(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::MaxBranching(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::MaxDepth(6), vec![]),
            (
                true,
                Filter::ShowNamedQuantifier("name".to_string()),
                vec![],
            ),
            (enable_ml, Filter::SelectNthMatchingLoop(0), vec![]),
            (enable_ml, Filter::ShowMatchingLoopSubgraph, vec![]),
        ];
        self.filters_to_buttons(filters.into_iter())
    }

    fn proof(self) -> Vec<SimpleButton> {
        let filters = [
            (true, Filter::HideUnitNodes, vec![]),
            (true, Filter::MaxNodeIdx(1000), vec![]),
            (true, Filter::MinNodeIdx(1000), vec![]),
            (true, Filter::AllButExpensive(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::MaxDepth(6), vec![]),
            (
                true,
                Filter::ShowNamedQuantifier("name".to_string()),
                vec![],
            ),
            (true, Filter::LimitProofNodes(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::HideNonProof, vec![]),
            (true, Filter::ShowAsserted, vec![]),
            (true, Filter::ShowFalse, vec![]),
            (true, Filter::ShowNamedProof("name".to_string()), vec![]),
        ];
        self.filters_to_buttons(filters.into_iter())
    }

    fn cdcl(self) -> Vec<SimpleButton> {
        let filters = [
            (true, Filter::MaxNodeIdx(1000), vec![]),
            (true, Filter::MinNodeIdx(1000), vec![]),
            (true, Filter::MaxDepth(6), vec![]),
            (true, Filter::LimitDeadCdcl(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::LimitCdclNodes(DEFAULT_NODE_COUNT), vec![]),
        ];
        self.filters_to_buttons(filters.into_iter())
    }

    pub fn selection(self, selected: &[RawNodeIndex]) -> Vec<SimpleButton> {
        let nodes = selected.iter().map(|n| {
            let i = match *self.graph.raw[*n].kind() {
                NodeKind::Instantiation(i) => Some(i),
                _ => None,
            };
            let q = i.and_then(|i| self.parser[self.parser[i].match_].kind.quant_idx());
            (*n, i, q)
        });
        fn mk_filter<T: Default, I: Iterator<Item = T> + Clone>(
            nodes: &I,
            p: impl Fn(&T) -> bool,
            f: impl Fn(T) -> Filter,
        ) -> (bool, Filter, Vec<Filter>) {
            let mut filters = nodes.clone().filter(p).map(&f);
            let first = filters.next();
            let enable = first.is_some();
            let first = first.unwrap_or_else(|| f(T::default()));
            (enable, first, filters.collect())
        }
        let raw = &self.graph.raw;
        let filters = [
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    raw.neighbors_directed(n, Direction::Outgoing, &self.graph.analysis.reach)
                        .count_hidden()
                        > 0
                },
                |(n, _, _)| Filter::ShowNeighbours(n, Direction::Outgoing),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    raw.neighbors_directed(n, Direction::Incoming, &self.graph.analysis.reach)
                        .count_hidden()
                        > 0
                },
                |(n, _, _)| Filter::ShowNeighbours(n, Direction::Incoming),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(raw.rev(), n.0)
                        .iter(raw.rev())
                        .any(|n| raw.graph[n].hidden())
                },
                |(n, _, _)| Filter::VisitSourceTree(n, true),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(raw.rev(), n.0)
                        .iter(raw.rev())
                        .any(|n| raw.graph[n].visible())
                },
                |(n, _, _)| Filter::VisitSourceTree(n, false),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(&*raw.graph, n.0)
                        .iter(&*raw.graph)
                        .any(|n| raw.graph[n].hidden())
                },
                |(n, _, _)| Filter::VisitSubTreeWithRoot(n, true),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(&*raw.graph, n.0)
                        .iter(&*raw.graph)
                        .any(|n| raw.graph[n].visible())
                },
                |(n, _, _)| Filter::VisitSubTreeWithRoot(n, false),
            ),
            mk_filter(
                &nodes,
                |&(_, i, _)| i.is_some(),
                |(_, _, q)| Filter::IgnoreQuantifier(q),
            ),
            mk_filter(
                &nodes,
                |&(_, i, _)| i.is_some(),
                |(_, _, q)| Filter::IgnoreAllButQuantifier(q),
            ),
            mk_filter(&nodes, |_| true, |(n, _, _)| Filter::ShowLongestPath(n)),
        ];
        self.filters_to_buttons(filters.into_iter())
    }

    fn filters_to_buttons(
        self,
        filters: impl Iterator<Item = (bool, Filter, Vec<Filter>)>,
    ) -> Vec<SimpleButton> {
        filters
            .map(|(enabled, first, other)| {
                let icon = first.icon();
                let fc = |i: RawNodeIndex| enabled.then(|| *self.graph.raw[i].kind());
                let short_text = first
                    .short_text(fc)
                    .split(['|', '"', '$'])
                    .enumerate()
                    .map(|(i, c)| if i % 2 == 0 { c } else { "_" })
                    .collect::<String>();
                let long_text = first.long_text(fc, false);

                let new_filter = self.new_filter.clone();
                let click = Callback::from(move |()| {
                    for f in [&first].into_iter().chain(other.iter()) {
                        new_filter.emit(f.clone());
                    }
                });
                SimpleButton {
                    icon,
                    text: short_text,
                    hover_text: Some(long_text),
                    disabled: !enabled,
                    click: Action::MouseDown(click),
                }
            })
            .collect()
    }
}
