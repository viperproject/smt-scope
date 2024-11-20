use petgraph::{
    visit::{Dfs, Walker},
    Direction,
};
use smt_log_parser::{
    analysis::{
        analysis::matching_loop::MatchingLoop,
        raw::{IndexesInstGraph, Node, NodeKind, RawInstGraph},
        InstGraph, RawNodeIndex,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::QuantIdx,
    Z3Parser,
};

use super::svg_result::DEFAULT_NODE_COUNT;

pub const DEFAULT_FILTER_CHAIN: &[Filter] = &[
    Filter::IgnoreTheorySolving,
    Filter::MaxInsts(DEFAULT_NODE_COUNT),
];
pub const DEFAULT_DISABLER_CHAIN: &[(Disabler, bool)] = &[
    (Disabler::Smart, true),
    (Disabler::ENodes, false),
    (Disabler::GivenEqualities, false),
    (Disabler::AllEqualities, false),
];

#[derive(Debug, Clone, PartialEq, Hash)]
pub enum Filter {
    MaxNodeIdx(usize),
    MinNodeIdx(usize),
    IgnoreTheorySolving,
    IgnoreQuantifier(Option<QuantIdx>),
    IgnoreAllButQuantifier(Option<QuantIdx>),
    MaxInsts(usize),
    MaxBranching(usize),
    ShowNeighbours(RawNodeIndex, Direction),
    VisitSourceTree(RawNodeIndex, bool),
    VisitSubTreeWithRoot(RawNodeIndex, bool),
    MaxDepth(usize),
    ShowLongestPath(RawNodeIndex),
    ShowNamedQuantifier(String),
    SelectNthMatchingLoop(usize),
    ShowMatchingLoopSubgraph,
}

impl Filter {
    pub fn apply<'a>(
        self,
        graph: &mut InstGraph,
        parser: &'a Z3Parser,
        config: impl FnOnce(&'a Z3Parser) -> DisplayCtxt<'a>,
    ) -> FilterOutput {
        match self {
            Filter::MaxNodeIdx(max) => graph
                .raw
                .set_visibility_when(true, |idx: RawNodeIndex, _: &Node| idx.0.index() >= max),
            Filter::MinNodeIdx(min) => graph
                .raw
                .set_visibility_when(true, |idx: RawNodeIndex, _: &Node| idx.0.index() < min),
            Filter::IgnoreTheorySolving => {
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        node.kind()
                            .inst()
                            .is_some_and(|i| parser[parser[i].match_].kind.is_discovered())
                    })
            }
            Filter::IgnoreQuantifier(qidx) => {
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        node.kind()
                            .inst()
                            .is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == qidx)
                    })
            }
            Filter::IgnoreAllButQuantifier(qidx) => {
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        node.kind()
                            .inst()
                            .is_some_and(|i| parser[parser[i].match_].kind.quant_idx() != qidx)
                    })
            }
            Filter::MaxInsts(n) => graph.keep_first_n_cost(n),
            Filter::MaxBranching(n) => graph.keep_first_n_children(n),
            Filter::ShowNeighbours(nidx, direction) => {
                let nodes: Vec<_> = graph.raw.neighbors_directed(nidx, direction).collect();
                graph.raw.set_visibility_many(false, nodes.into_iter())
            }
            Filter::VisitSubTreeWithRoot(nidx, retain) => {
                let nodes: Vec<_> = Dfs::new(&*graph.raw.graph, nidx.0)
                    .iter(&*graph.raw.graph)
                    .map(RawNodeIndex)
                    .collect();
                graph.raw.set_visibility_many(!retain, nodes.into_iter())
            }
            Filter::VisitSourceTree(nidx, retain) => {
                let nodes: Vec<_> = Dfs::new(graph.raw.rev(), nidx.0)
                    .iter(graph.raw.rev())
                    .map(RawNodeIndex)
                    .collect();
                graph.raw.set_visibility_many(!retain, nodes.into_iter())
            }
            Filter::MaxDepth(depth) => graph
                .raw
                .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                    node.fwd_depth.min as usize > depth
                }),
            Filter::ShowLongestPath(nidx) => {
                return FilterOutput::LongestPath(graph.raw.show_longest_path_through(nidx))
            }
            Filter::ShowNamedQuantifier(name) => {
                let ctxt = config(parser);
                graph
                    .raw
                    .set_visibility_when(false, |_: RawNodeIndex, node: &Node| {
                        node.kind().inst().is_some_and(|i| {
                            parser[parser[i].match_]
                                .kind
                                .quant_idx()
                                .map(|q| parser[q].kind.with(&ctxt).to_string())
                                .is_some_and(|s| s == name)
                        })
                    })
            }
            // TODO: implement
            Filter::SelectNthMatchingLoop(n) => {
                graph.raw.reset_visibility_to(true);
                let ml_graph = graph.nth_matching_loop_graph(n).unwrap();
                let nodes_of_nth_matching_loop = graph
                    .raw
                    .node_indices()
                    .flat_map(|nx| {
                        let node = &graph.raw[nx];
                        match *node.kind() {
                            NodeKind::Instantiation(iidx) => {
                                node.part_of_ml.contains(&n).then_some(iidx)
                            }
                            _ => None,
                        }
                    })
                    .collect::<fxhash::FxHashSet<_>>();
                let start = ml_graph.leaves.0[0].1.index(&graph.raw).0;
                let relevant_non_qi_nodes: Vec<_> = Dfs::new(&*graph.raw.graph, start)
                    .iter(graph.raw.rev())
                    .filter(|nx| graph.raw.graph[*nx].kind().inst().is_none())
                    .filter(|nx| {
                        graph.raw.graph[*nx]
                            .inst_children
                            .nodes
                            .intersection(&nodes_of_nth_matching_loop)
                            .count()
                            > 0
                            && graph.raw.graph[*nx]
                                .inst_parents
                                .nodes
                                .intersection(&nodes_of_nth_matching_loop)
                                .count()
                                > 0
                    })
                    .map(RawNodeIndex)
                    .collect();
                graph
                    .raw
                    .set_visibility_many(false, relevant_non_qi_nodes.into_iter());
                graph
                    .raw
                    .set_visibility_when(false, |_: RawNodeIndex, node: &Node| {
                        node.kind().inst().is_some() && node.part_of_ml.contains(&n)
                    });
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        node.kind().inst().is_some() && !node.part_of_ml.contains(&n)
                    });
                return FilterOutput::MatchingLoopGraph(n, ml_graph);
            }
            Filter::ShowMatchingLoopSubgraph => {
                // graph.raw.reset_visibility_to(true);
                graph
                    .raw
                    .set_visibility_when(false, |_: RawNodeIndex, node: &Node| {
                        node.kind().inst().is_some() && !node.part_of_ml.is_empty()
                    });
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        node.kind().inst().is_some() && node.part_of_ml.is_empty()
                    })
                // if let Some(nodes) = &graph.analysis.matching_loop_end_nodes {
                //     graph.raw.reset_visibility_to(true);
                //     for nidx in nodes {
                //         let nodes: Vec<_> = Dfs::new(graph.raw.rev(), nidx.0).iter(graph.raw.rev()).map(RawNodeIndex).collect();
                //         graph.raw.set_visibility_many(false, nodes.into_iter())
                //     }
                // }
            }
        }
        FilterOutput::None
    }
    pub fn get_hash(&self) -> u64 {
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};
        let mut hasher = DefaultHasher::new();
        self.hash(&mut hasher);
        hasher.finish()
    }
}

pub enum FilterOutput {
    LongestPath(Vec<RawNodeIndex>),
    MatchingLoopGeneralizedTerms(Vec<String>),
    MatchingLoopGraph(usize, MatchingLoop),
    None,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Disabler {
    Smart,
    ENodes,
    GivenEqualities,
    AllEqualities,
}

impl Disabler {
    pub fn disable(self, idx: RawNodeIndex, graph: &RawInstGraph, _parser: &Z3Parser) -> bool {
        let node = &graph[idx];
        match self {
            Disabler::ENodes => node.kind().enode().is_some(),
            Disabler::GivenEqualities => node.kind().eq_given().is_some(),
            Disabler::AllEqualities => {
                node.kind().eq_given().is_some() || node.kind().eq_trans().is_some()
            }
            Disabler::Smart => match node.kind() {
                NodeKind::ENode(_) => {
                    // Should only be 0 or 1
                    let parents = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Incoming)
                        .count();
                    let children = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Outgoing)
                        .count();
                    children == 0 || (parents == 1 && children == 1)
                }
                NodeKind::GivenEquality(..) => {
                    let parents = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Incoming)
                        .count();
                    let children = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Outgoing)
                        .count();
                    children == 0 || (parents == 1 && children == 1)
                }
                NodeKind::TransEquality(_) => {
                    let parents = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Incoming)
                        .count();
                    // Should be >= 1
                    let children = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Outgoing)
                        .count();
                    parents == 0 || (parents == 1 && children == 1)
                }
                NodeKind::Instantiation(_) => false,
            },
        }
    }
    pub fn apply(
        many: impl Iterator<Item = Disabler> + Clone,
        graph: &mut InstGraph,
        parser: &Z3Parser,
    ) {
        graph.reset_disabled_to(parser, |node, graph| {
            many.clone().any(|d| d.disable(node, graph, parser))
        });
    }

    pub fn description(&self) -> &'static str {
        match self {
            Disabler::Smart => "trivial nodes",
            Disabler::ENodes => "yield terms",
            Disabler::GivenEqualities => "yield equalities",
            Disabler::AllEqualities => "all equalities",
        }
    }
    pub fn icon(&self) -> &'static str {
        match self {
            Disabler::Smart => "low_priority",
            Disabler::ENodes => "functions",
            Disabler::GivenEqualities => "compare_arrows",
            Disabler::AllEqualities => "compare_arrows",
        }
    }
}
