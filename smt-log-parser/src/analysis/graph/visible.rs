use std::ops::{Index, IndexMut};

use fxhash::FxHashMap;
use petgraph::{
    graph::DiGraph,
    visit::EdgeRef,
    Direction::{self, Incoming, Outgoing},
};

use crate::{
    graph_idx,
    items::{ENodeIdx, EqGivenIdx},
    BoxSlice, NonMaxU32,
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
                data.above.clear();
                continue;
            }
            nodes += 1;
            edges += data.above.len();
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

        for (i_idx, data) in reconnect.into_iter_enumerated() {
            let Some(v_idx) = self_.reverse(i_idx) else {
                assert!(data.above.is_empty());
                continue;
            };
            let mut edges_to_add = Vec::new();
            for (edge, path) in data.above {
                let from_v = edge.from.visible;
                let from_h = edge.from.hidden;
                let v_from_v = self_.reverse(from_v).unwrap();
                if edge.is_direct_visible() {
                    assert!(
                        from_h.is_none() && path.is_some_and(|p| p.is_empty()) && !edge.indirect
                    );
                    let old_len = edges_to_add.len();
                    for edge in self.raw.graph.edges_connecting(from_v.0, i_idx.0) {
                        let edge = RawEdgeIndex(edge.id());
                        edges_to_add.push((edge, v_from_v, Ok(edge), VisibleEdge::Direct(edge)));
                    }
                    assert!(edges_to_add.len() > old_len);
                } else {
                    assert_ne!(from_v, edge.to_h);
                    let from = from_h
                        .map(|fh| RawEdgeIndex(self.raw.graph.find_edge(from_v.0, fh.0).unwrap()));
                    let to = RawEdgeIndex(self.raw.graph.find_edge(edge.to_h.0, i_idx.0).unwrap());
                    edges_to_add.push((
                        to,
                        v_from_v,
                        from.ok_or(()),
                        VisibleEdge::Indirect {
                            from,
                            to,
                            indirect: edge.indirect,
                            path,
                        },
                    ));
                }
            }
            edges_to_add
                .sort_unstable_by_key(|&(to_edge, from, from_edge, _)| (to_edge, from, from_edge));

            for (_, from, _, edge) in edges_to_add {
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
    Indirect {
        from: Option<RawEdgeIndex>,
        to: RawEdgeIndex,
        indirect: bool,
        /// None if there are more than one possible paths.
        path: Option<BoxSlice<RawNodeIndex>>,
    },
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
    pub fn last(&self) -> RawEdgeIndex {
        match *self {
            VisibleEdge::Direct(e) => e,
            VisibleEdge::Indirect { to, .. } => to,
        }
    }

    pub fn is_indirect(&self) -> bool {
        matches!(self, VisibleEdge::Indirect { indirect: true, .. })
    }
    pub fn kind(&self, graph: &InstGraph) -> VisibleEdgeKind {
        match *self {
            VisibleEdge::Direct(e) => VisibleEdgeKind::Direct(e, graph.raw[e]),
            VisibleEdge::Indirect {
                from, to, ref path, ..
            } => {
                let Some(f) = from else {
                    return VisibleEdgeKind::Unknown(from, to);
                };
                let Some(non_visible_between) = path else {
                    return VisibleEdgeKind::Unknown(from, to);
                };

                let get_kind = |n| {
                    let idx: RawNodeIndex = *non_visible_between.get(n)?;
                    Some(graph.raw[idx].kind())
                };

                match (graph.raw[f], graph.raw[to]) {
                    // Starting at Instantiation
                    (EdgeKind::Yield, EdgeKind::Blame { pattern_term })
                        if non_visible_between.len() == 1 =>
                    {
                        VisibleEdgeKind::YieldBlame {
                            enode: get_kind(0).unwrap().enode().unwrap(),
                            pattern_term,
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
                            pattern_term,
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
                                pattern_term,
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
                            pattern_term,
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
                                pattern_term,
                                eq_order,
                            }
                        } else {
                            VisibleEdgeKind::ENodeEqOther(given_eq)
                        }
                    }

                    _ => VisibleEdgeKind::Unknown(from, to),
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
        pattern_term: u16,
    },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> `TransEquality`
    YieldEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `Instantiation` -> `ENode` -> `GivenEquality` ->
    /// `TransEquality` (only 1 parent) -> `Instantiation`
    YieldBlameEq {
        given_eq: (EqGivenIdx, Option<NonMaxU32>),
        pattern_term: u16,
        eq_order: u16,
    },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> ...
    YieldEqOther((EqGivenIdx, Option<NonMaxU32>)),

    /// `ENode` -> `GivenEquality` -> `TransEquality`
    ENodeEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `ENode` -> `GivenEquality` -> `TransEquality` -> `Instantiation`
    ENodeBlameEq {
        given_eq: (EqGivenIdx, Option<NonMaxU32>),
        pattern_term: u16,
        eq_order: u16,
    },
    /// `ENode` -> `GivenEquality` -> ...
    ENodeEqOther((EqGivenIdx, Option<NonMaxU32>)),

    Unknown(Option<RawEdgeIndex>, RawEdgeIndex),
}

impl VisibleEdgeKind {
    pub fn blame(&self, graph: &InstGraph) -> NodeKind {
        use NodeKind::*;
        match self {
            VisibleEdgeKind::Direct(edge, _) | VisibleEdgeKind::Unknown(.., edge) => {
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
