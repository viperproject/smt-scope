use std::ops::{Index, IndexMut};

use fxhash::{FxHashMap, FxHashSet};
use petgraph::{
    graph::DiGraph,
    Direction::{self, Incoming, Outgoing},
};

use crate::{
    graph_idx,
    items::{ENodeIdx, EqGivenIdx},
    NonMaxU32,
};

use super::{
    analysis::reconnect::{BwdReachableVisAnalysis, ReconnectAnalysis},
    raw::{EdgeKind, NodeKind},
    InstGraph, RawEdgeIndex, RawNodeIndex,
};

graph_idx!(visible_idx, VisibleNodeIndex, VisibleEdgeIndex, VisibleIx);

#[derive(Default)]
pub struct VisibleInstGraph {
    pub graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx>,
    reverse: FxHashMap<RawNodeIndex, VisibleNodeIndex>,
    pub generation: u32,
}

impl InstGraph {
    pub fn to_visible(&self) -> VisibleInstGraph {
        let bwd_vis_reachable = self.topo_analysis(&mut BwdReachableVisAnalysis);
        let mut reconnect = self.topo_analysis(&mut ReconnectAnalysis(bwd_vis_reachable));
        let (mut nodes, mut edges) = (0, 0);
        for (idx, data) in reconnect.iter_mut_enumerated() {
            if !self.raw[idx].visible() {
                data.clear();
            }
            nodes += 1;
            edges += data.len();
        }

        let mut graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx> =
            DiGraph::with_capacity(nodes, edges);

        for idx in self.raw.node_indices() {
            if !self.raw[idx].visible() {
                continue;
            }
            let hidden_parents = self.raw.neighbors_directed(idx, Incoming).count_hidden();
            let hidden_children = self.raw.neighbors_directed(idx, Outgoing).count_hidden();
            let v_node = VisibleNode {
                idx,
                hidden_parents: hidden_parents as u32,
                hidden_children: hidden_children as u32,
            };
            graph.add_node(v_node);
        }

        let reverse: FxHashMap<_, _> = graph
            .node_indices()
            .map(VisibleNodeIndex)
            .map(|idx| (graph[idx.0].idx, idx))
            .collect();
        let mut self_ = VisibleInstGraph {
            graph,
            reverse,
            generation: self.raw.stats.generation,
        };

        for (i_idx, data) in reconnect.iter_enumerated() {
            let Some(v_idx) = self_.reverse(i_idx) else {
                assert!(data.is_empty());
                continue;
            };
            let mut edges_to_add: Vec<_> = data
                .iter()
                .map(|&(from_v, from_h, to_h)| {
                    let v_from_v = self_.reverse(from_v).unwrap();
                    let (edge, to_edge) = if from_v == from_h {
                        let edge =
                            RawEdgeIndex(self.raw.graph.find_edge(from_v.0, i_idx.0).unwrap());
                        (VisibleEdge::Direct(edge), edge)
                    } else {
                        let from_edge =
                            RawEdgeIndex(self.raw.graph.find_edge(from_v.0, from_h.0).unwrap());
                        let to_edge =
                            RawEdgeIndex(self.raw.graph.find_edge(to_h.0, i_idx.0).unwrap());
                        (VisibleEdge::Indirect(from_edge, to_edge), to_edge)
                    };
                    (to_edge, v_from_v, edge)
                })
                .collect();
            edges_to_add.sort_unstable_by_key(|(to_edge, from, _)| (*to_edge, *from));

            for (_, from, edge) in edges_to_add {
                self_.graph.add_edge(from.0, v_idx.0, edge);
            }
        }
        self_
    }
}
impl VisibleInstGraph {
    /// Does the hidden instantiation graph contain the given node?
    pub fn contains(&self, i_idx: RawNodeIndex) -> bool {
        self.reverse.contains_key(&i_idx)
    }

    pub(super) fn reverse(&self, i_idx: RawNodeIndex) -> Option<VisibleNodeIndex> {
        self.reverse.get(&i_idx).copied()
    }
}

impl Index<VisibleNodeIndex> for VisibleInstGraph {
    type Output = VisibleNode;
    fn index(&self, idx: VisibleNodeIndex) -> &Self::Output {
        &self.graph[idx.0]
    }
}
impl IndexMut<VisibleNodeIndex> for VisibleInstGraph {
    fn index_mut(&mut self, idx: VisibleNodeIndex) -> &mut Self::Output {
        &mut self.graph[idx.0]
    }
}
impl Index<VisibleEdgeIndex> for VisibleInstGraph {
    type Output = VisibleEdge;
    fn index(&self, idx: VisibleEdgeIndex) -> &Self::Output {
        &self.graph[idx.0]
    }
}
impl IndexMut<VisibleEdgeIndex> for VisibleInstGraph {
    fn index_mut(&mut self, idx: VisibleEdgeIndex) -> &mut Self::Output {
        &mut self.graph[idx.0]
    }
}

#[derive(Debug, Clone)]
pub struct VisibleNode {
    pub idx: RawNodeIndex,
    pub hidden_parents: u32,
    pub hidden_children: u32,
}

#[derive(Clone, PartialEq, Eq, Hash)]
pub enum VisibleEdge {
    Direct(RawEdgeIndex),
    Indirect(RawEdgeIndex, RawEdgeIndex),
}

impl std::fmt::Debug for VisibleEdge {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            VisibleEdge::Direct(_) => write!(f, "direct edge"),
            VisibleEdge::Indirect { .. } => write!(f, "indirect edge"),
        }
    }
}

impl VisibleEdge {
    fn indirect_nodes<'a>(&'a self, graph: &'a InstGraph) -> FxHashSet<RawNodeIndex> {
        match self {
            VisibleEdge::Direct(_) => FxHashSet::default(),
            VisibleEdge::Indirect(from, to) =>
            // graph.raw.graph.edge_endpoints(from.0).unwrap().1 --> graph.raw.graph.edge_endpoints(to.0).unwrap().0
            {
                graph
                    .non_visible_paths_between(
                        RawNodeIndex(graph.raw.graph.edge_endpoints(from.0).unwrap().1),
                        RawNodeIndex(graph.raw.graph.edge_endpoints(to.0).unwrap().0),
                    )
                    .unwrap()
                    .0
            }
        }
    }
    pub fn is_indirect(&self, graph: &InstGraph) -> bool {
        self.indirect_nodes(graph)
            .iter()
            .any(|n| graph.raw.graph[n.0].hidden())
    }
    pub fn kind(&self, graph: &InstGraph) -> VisibleEdgeKind {
        match self {
            VisibleEdge::Direct(e) => VisibleEdgeKind::Direct(*e, graph.raw.graph[e.0]),
            VisibleEdge::Indirect(from, to) => {
                // TODO: clean this up
                let (all_between, non_visible_between) = graph
                    .non_visible_paths_between(
                        RawNodeIndex(graph.raw.graph.edge_endpoints(from.0).unwrap().1),
                        RawNodeIndex(graph.raw.graph.edge_endpoints(to.0).unwrap().0),
                    )
                    .unwrap();
                if !non_visible_between
                    .as_ref()
                    .is_some_and(|non_visible_between| {
                        all_between.len() == non_visible_between.len()
                    })
                {
                    return VisibleEdgeKind::Unknown(*from, *to);
                };
                let non_visible_between = non_visible_between.unwrap();

                let get_kind = |n| Some(graph.raw[*non_visible_between.get(n)?].kind());

                match (graph.raw.graph[from.0], graph.raw.graph[to.0]) {
                    // Starting at Instantiation
                    (EdgeKind::Yield, EdgeKind::Blame { trigger_term })
                        if non_visible_between.len() == 1 =>
                    {
                        VisibleEdgeKind::YieldBlame {
                            enode: get_kind(0).unwrap().enode().unwrap(),
                            trigger_term,
                        }
                    }
                    (EdgeKind::Yield, EdgeKind::TEqualitySimple { .. })
                        if non_visible_between.len() == 2 =>
                    {
                        VisibleEdgeKind::YieldEq(get_kind(1).unwrap().eq_given().unwrap())
                    }
                    (
                        EdgeKind::Yield,
                        EdgeKind::BlameEq {
                            trigger_term,
                            eq_order,
                        },
                    ) if non_visible_between.len() == 3 => {
                        let trans = graph
                            .raw
                            .graph
                            .edges_directed(non_visible_between[2].0, Direction::Incoming)
                            .count();
                        let given_eq = get_kind(1).unwrap().eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::YieldBlameEq {
                                given_eq,
                                trigger_term,
                                eq_order,
                            }
                        } else {
                            VisibleEdgeKind::YieldEqOther(given_eq)
                        }
                    }

                    // Starting at ENode
                    (EdgeKind::EqualityFact, EdgeKind::TEqualitySimple { .. })
                        if non_visible_between.len() == 1 =>
                    {
                        VisibleEdgeKind::ENodeEq(get_kind(0).unwrap().eq_given().unwrap())
                    }
                    (
                        EdgeKind::EqualityFact,
                        EdgeKind::BlameEq {
                            trigger_term,
                            eq_order,
                        },
                    ) if non_visible_between.len() == 2 => {
                        let trans = graph
                            .raw
                            .graph
                            .edges_directed(non_visible_between[1].0, Direction::Incoming)
                            .count();
                        let given_eq = get_kind(0).unwrap().eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::ENodeBlameEq {
                                given_eq,
                                trigger_term,
                                eq_order,
                            }
                        } else {
                            VisibleEdgeKind::ENodeEqOther(given_eq)
                        }
                    }

                    _ => VisibleEdgeKind::Unknown(*from, *to),
                }
            }
        }
    }
}

#[derive(Clone)]
pub enum VisibleEdgeKind {
    Direct(RawEdgeIndex, EdgeKind),
    /// `Instantiation` -> `ENode` -> `Instantiation`
    YieldBlame {
        enode: ENodeIdx,
        trigger_term: u16,
    },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> `TransEquality`
    YieldEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `Instantiation` -> `ENode` -> `GivenEquality` ->
    /// `TransEquality` (only 1 parent) -> `Instantiation`
    YieldBlameEq {
        given_eq: (EqGivenIdx, Option<NonMaxU32>),
        trigger_term: u16,
        eq_order: u16,
    },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> ...
    YieldEqOther((EqGivenIdx, Option<NonMaxU32>)),

    /// `ENode` -> `GivenEquality` -> `TransEquality`
    ENodeEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `ENode` -> `GivenEquality` -> `TransEquality` -> `Instantiation`
    ENodeBlameEq {
        given_eq: (EqGivenIdx, Option<NonMaxU32>),
        trigger_term: u16,
        eq_order: u16,
    },
    /// `ENode` -> `GivenEquality` -> ...
    ENodeEqOther((EqGivenIdx, Option<NonMaxU32>)),

    Unknown(RawEdgeIndex, RawEdgeIndex),
}

impl VisibleEdgeKind {
    pub fn blame(&self, graph: &InstGraph) -> NodeKind {
        use NodeKind::*;
        match self {
            VisibleEdgeKind::Direct(edge, _) | VisibleEdgeKind::Unknown(edge, ..) => {
                *graph.raw.graph[graph.raw.graph.edge_endpoints(edge.0).unwrap().0].kind()
            }

            VisibleEdgeKind::YieldEq(given_eq)
            | VisibleEdgeKind::YieldBlameEq { given_eq, .. }
            | VisibleEdgeKind::YieldEqOther(given_eq)
            | VisibleEdgeKind::ENodeEq(given_eq)
            | VisibleEdgeKind::ENodeBlameEq { given_eq, .. }
            | VisibleEdgeKind::ENodeEqOther(given_eq) => GivenEquality(given_eq.0, given_eq.1),

            VisibleEdgeKind::YieldBlame { enode, .. } => ENode(*enode),
        }
    }
}
