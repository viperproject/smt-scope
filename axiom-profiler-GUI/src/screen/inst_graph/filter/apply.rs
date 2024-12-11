use petgraph::{
    visit::{Dfs, Walker},
    Direction,
};
use smt_log_parser::{
    analysis::{
        analysis::matching_loop::{MatchingLoop, MlData},
        raw::{IndexesInstGraph, Node, NodeKind, RawInstGraph},
        InstGraph, RawNodeIndex,
    },
    items::{InstIdx, QuantKind},
    Z3Parser,
};

use super::{Disabler, Filter};

impl Filter {
    pub fn apply(&self, graph: &mut InstGraph, parser: &Z3Parser) -> FilterOutput {
        let mut select = None;
        use Filter::*;
        let modified = match *self {
            MaxNodeIdx(max) => graph
                .raw
                .set_visibility_when(true, |_, idx: RawNodeIndex, _| idx.0.index() >= max),
            MinNodeIdx(min) => graph
                .raw
                .set_visibility_when(true, |_, idx: RawNodeIndex, _| idx.0.index() < min),
            IgnoreTheorySolving => graph.raw.set_visibility_when(true, |_, _, node: &Node| {
                node.kind()
                    .inst()
                    .is_some_and(|i| parser[parser[i].match_].kind.is_discovered())
            }),
            IgnoreQuantifier(qidx) => graph.raw.set_visibility_when(true, |_, _, node: &Node| {
                node.kind()
                    .inst()
                    .is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == qidx)
            }),
            IgnoreAllButQuantifier(qidx) => {
                graph.raw.set_visibility_when(true, |_, _, node: &Node| {
                    node.kind()
                        .inst()
                        .is_some_and(|i| parser[parser[i].match_].kind.quant_idx() != qidx)
                })
            }
            AllButExpensive(n) => {
                if graph.raw.visible_nodes() > n {
                    graph.keep_first_n_cost(n)
                } else {
                    false
                }
            }
            MaxBranching(n) => graph.keep_first_n_children(n),
            ShowNeighbours(nidx, direction) => {
                let nodes: Vec<_> = graph.raw.neighbors_directed(nidx, direction).collect();
                let modified = graph.raw.set_visibility_many(false, nodes.iter().copied());
                select = Some(nodes);
                modified
            }
            VisitSubTreeWithRoot(nidx, retain) => {
                let nodes: Vec<_> = Dfs::new(&*graph.raw.graph, nidx.0)
                    .iter(&*graph.raw.graph)
                    .map(RawNodeIndex)
                    .collect();
                graph.raw.set_visibility_many(!retain, nodes.into_iter())
            }
            VisitSourceTree(nidx, retain) => {
                let nodes: Vec<_> = Dfs::new(graph.raw.rev(), nidx.0)
                    .iter(graph.raw.rev())
                    .map(RawNodeIndex)
                    .collect();
                graph.raw.set_visibility_many(!retain, nodes.into_iter())
            }
            MaxDepth(depth) => graph.raw.set_visibility_when(true, |_, _, node: &Node| {
                node.fwd_depth.min as usize > depth
            }),
            ShowLongestPath(nidx) => {
                let (modified, nodes) = graph.raw.show_longest_path_through(nidx);
                select = Some(nodes);
                modified
            }
            ShowNamedQuantifier(ref name) => {
                if let Some(name) = QuantKind::parse_existing(&parser.strings, name) {
                    graph.raw.set_visibility_when(false, |_, _, node: &Node| {
                        node.kind().inst().is_some_and(|i| {
                            parser[parser[i].match_]
                                .kind
                                .quant_idx()
                                .is_some_and(|q| parser[q].kind == name)
                        })
                    })
                } else {
                    false
                }
            }
            SelectNthMatchingLoop(n) => {
                let Some(ml_data) = &graph.analysis.ml_data else {
                    return FilterOutput::default();
                };
                let Some(ml) = ml_data.matching_loops.get(n) else {
                    return FilterOutput::default();
                };
                graph.raw.reset_visibility_to(true);
                let (ml_nodes, related_nodes) = Self::ml_nodes(ml, ml_data, graph);
                graph.raw.set_visibility_many(false, ml_nodes.into_iter());
                graph
                    .raw
                    .set_visibility_many(false, related_nodes.into_iter());
                true
            }
            ShowMatchingLoopSubgraph => {
                let Some(ml_data) = &graph.analysis.ml_data else {
                    return FilterOutput::default();
                };
                graph.raw.reset_visibility_to(true);
                for ml in &ml_data.matching_loops {
                    let (ml_nodes, related_nodes) = Self::ml_nodes(ml, ml_data, graph);
                    graph.raw.set_visibility_many(false, ml_nodes.into_iter());
                    graph
                        .raw
                        .set_visibility_many(false, related_nodes.into_iter());
                }
                true
            }
            HideUnitNodes => {
                macro_rules! allow {
                    ($e:expr) => {
                        if $e {
                            return false;
                        }
                    };
                }
                graph.raw.set_visibility_when(true, |_, _, n| {
                    allow!(n.children.count > 0 || n.parents.count > 1);
                    let Some(proof) = n.kind().proof() else {
                        return n.parents.count == 0 && n.kind().inst().is_none();
                    };
                    allow!(n.proof.proves_false());
                    let proof = &parser[proof];
                    allow!(proof.kind.is_asserted());
                    allow!(n.parents.count == 1 && !proof.kind.is_quant_inst());
                    true
                })
            }
            LimitProofNodes(mut count) => graph.raw.set_visibility_when(true, |_, _, n| {
                n.kind().proof().is_some_and(|_| {
                    if count == 0 {
                        true
                    } else {
                        count -= 1;
                        false
                    }
                })
            }),
            HideNonProof => graph
                .raw
                .set_visibility_when(true, |_, _, n| n.kind().proof().is_none()),
            ShowAsserted => graph.raw.set_visibility_when(false, |_, _, n| {
                n.kind()
                    .proof()
                    .is_some_and(|p| parser[p].kind.is_asserted())
            }),
            ShowFalse => graph
                .raw
                .set_visibility_when(false, |_, _, n| n.proof.proves_false()),
        };
        FilterOutput { modified, select }
    }

    fn ml_nodes(
        ml: &MatchingLoop,
        ml_data: &MlData,
        graph: &InstGraph,
    ) -> (Vec<InstIdx>, Vec<RawNodeIndex>) {
        let members = ml.members(ml_data);
        let nodes_of_nth_matching_loop = members.collect::<Vec<_>>();
        let start = ml.leaves.0[0].1.index(&graph.raw).0;
        let rev_graph = graph.raw.rev();
        let relevant_non_qi_nodes: Vec<_> = Dfs::new(rev_graph, start)
            .iter(rev_graph)
            .filter(|nx| graph.raw.graph[*nx].kind().inst().is_none())
            .filter(|nx| {
                let node = &graph.raw.graph[*nx];
                nodes_of_nth_matching_loop
                    .iter()
                    .any(|n| node.children.insts.contains(n))
                // && nodes_of_nth_matching_loop.iter().any(|n| {
                //     node.inst_parents.nodes.contains(&n)
                // })
            })
            .map(RawNodeIndex)
            .collect();
        (nodes_of_nth_matching_loop, relevant_non_qi_nodes)
    }
}

#[derive(Debug, Default)]
pub struct FilterOutput {
    pub modified: bool,
    pub select: Option<Vec<RawNodeIndex>>,
}

impl Disabler {
    pub fn disable(self, idx: RawNodeIndex, graph: &RawInstGraph, parser: &Z3Parser) -> bool {
        let node = &graph[idx];
        match self {
            Disabler::ENodes => node.kind().enode().is_some(),
            Disabler::GivenEqualities => node.kind().eq_given().is_some(),
            Disabler::AllEqualities => {
                node.kind().eq_given().is_some() || node.kind().eq_trans().is_some()
            }
            Disabler::NonProof => node.kind().proof().is_none(),
            Disabler::Smart => match *node.kind() {
                NodeKind::Instantiation(_) => false,
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
                NodeKind::Proof(proof) => parser[proof].kind.is_trivial(),
            },
        }
    }
}
