use petgraph::{
    visit::{Dfs, Walker},
    Direction, Graph,
};
use smt_log_parser::{
    analysis::{
        analysis::matching_loop::MLGraphNode,
        raw::{Node, NodeKind, RawInstGraph},
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
// the second field decides whether the disabler is set or not
// the third field decides whether the disabler is applicable or not (depends on viewer mode)
pub const DEFAULT_DISABLER_CHAIN: &[(Disabler, bool, bool)] = &[
    (Disabler::Smart, true, true),
    (Disabler::ENodes, false, true),
    (Disabler::GivenEqualities, false, true),
    (Disabler::AllEqualities, false, true),
    (Disabler::ProofSteps, true, false),
    (Disabler::Instantiations, false, false),
];
// the second field decides whether the disabler is set or not
// the third field decides whether the disabler is applicable or not (depends on viewer mode)
pub const PROOF_STEPS_DISABLER_CHAIN: &[(Disabler, bool, bool)] = &[
    (Disabler::Smart, true, true),
    (Disabler::ENodes, true, false),
    (Disabler::GivenEqualities, true, false),
    (Disabler::AllEqualities, true, false),
    (Disabler::ProofSteps, false, false),
    (Disabler::Instantiations, true, true),
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
    ShowProofSteps,
    IgnoreTrivialProofSteps,
    ShowOnlyFalseProofSteps,
    ShowNamedProofStep(String),
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
                let nodes = graph.raw.neighbors_directed(nidx, direction);
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
                let nth_ml_endnode = graph
                    .analysis
                    .matching_loop_end_nodes
                    .as_ref()
                    .unwrap()
                    .get(n)
                    .unwrap();
                let nodes_of_nth_matching_loop = graph
                    .raw
                    .node_indices()
                    .filter(|nx| graph.raw[*nx].part_of_ml.contains(&n))
                    .collect::<fxhash::FxHashSet<_>>();
                let relevant_non_qi_nodes: Vec<_> = Dfs::new(&*graph.raw.graph, nth_ml_endnode.0)
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
                let dot_graph = graph.nth_matching_loop_graph(n);
                return FilterOutput::MatchingLoopGraph(dot_graph);
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
            Filter::ShowProofSteps => {
                graph
                    .raw
                    .set_visibility_when(false, |_: RawNodeIndex, node: &Node| {
                        node.kind().proof_step().is_some()
                    });
            }
            Filter::IgnoreTrivialProofSteps => {
                let ctxt = config(parser);
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        if let Some(ps) = node.kind().proof_step() {
                            let ps_result = parser[ps].result.with(&ctxt).to_string();
                            if ps_result == "false" {
                                false
                            } else {
                                let ps_name = &parser.strings[*parser[ps].name];
                                matches!(ps_name, "mp" | "rewrite" | "monotonicity" | "trans" | "refl" | "commutativity" | "iff-true" | "iff-false" | "symm")
                            }
                        } else {
                            false
                        }
                    })
            }
            Filter::ShowOnlyFalseProofSteps => {
                let ctxt = config(parser);
                graph
                    .raw
                    .set_visibility_when(true, |_: RawNodeIndex, node: &Node| {
                        if let Some(ps) = node.kind().proof_step() {
                            let ps_result = parser[ps].result.with(&ctxt).to_string();
                            ps_result != "false"
                        } else {
                            true
                        }
                    })
            }
            Filter::ShowNamedProofStep(name) => {
                graph
                    .raw
                    .set_visibility_when(false, |_: RawNodeIndex, node: &Node| {
                        node.kind().proof_step().is_some_and(|ps| {
                            parser[parser[ps].result]
                                .kind
                                .ps_name()
                                .map(|name| parser.strings[*name].to_string())
                                .is_some_and(|s| s == name)
                        })
                    })
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
    MatchingLoopGraph(Graph<MLGraphNode, ()>),
    None,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Disabler {
    Smart,
    ENodes,
    GivenEqualities,
    AllEqualities,
    ProofSteps,
    Instantiations,
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
                NodeKind::ProofStep(_) => {
                    let parents = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Incoming)
                        .count();
                    let children = graph
                        .graph
                        .neighbors_directed(idx.0, Direction::Outgoing)
                        .count();
                    (parents == 0 && children == 0) || (parents == 1 && children == 1)
                }
            },
            Disabler::ProofSteps => node.kind().proof_step().is_some(),
            Disabler::Instantiations => node.kind().inst().is_some(),
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
            Disabler::ProofSteps => "proof steps",
            Disabler::Instantiations => "instantiations",
        }
    }
    pub fn icon(&self) -> &'static str {
        match self {
            Disabler::Smart => "low_priority",
            Disabler::ENodes => "functions",
            Disabler::GivenEqualities => "compare_arrows",
            Disabler::AllEqualities => "compare_arrows",
            Disabler::ProofSteps => "compare_arrows",
            Disabler::Instantiations => "compare_arrows",
        }
    }
}
