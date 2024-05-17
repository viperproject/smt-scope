use std::ops::{Index, IndexMut};

use fxhash::FxHashMap;
use petgraph::{graph::{DiGraph, EdgeIndex, NodeIndex}, visit::{EdgeRef, IntoEdges, NodeFiltered}, Direction};

use crate::{graph_idx, items::{ENodeIdx, EqGivenIdx}, NonMaxU32};

use super::{raw::{InstEdgeKind, Node, InstNodeKind}, Graph, RawEdgeIndex, RawNodeIndex};

graph_idx!(visible_idx, VisibleNodeIndex, VisibleEdgeIndex, VisibleIx);

pub struct VisibleGraph {
    pub graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx>,
    reverse: FxHashMap<RawNodeIndex, VisibleNodeIndex>,
    pub generation: u32,
}

impl<N, E> Graph<N, E> {
    pub fn to_visible(&self) -> VisibleGraph {
        // debug_assert_eq!(self.hidden as usize, self.graph.node_weights().filter(|n| n.hidden).count());
        
        // Code copied from `DiGraph::filter_map`, but that function does not
        // allow for changing the node index type.
        let mut graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx> = DiGraph::with_capacity(self.raw.visible_nodes(), 0);
        // mapping from old node index to new node index, end represents removed.
        let mut node_index_map = vec![NodeIndex::end(); self.raw.graph.node_count()];
        let node_map = |idx, node: &Node<N>| node.visible().then(|| VisibleNode {
            idx,
            hidden_parents: self.raw.neighbors_directed(idx, Direction::Incoming).into_iter().filter(|n| self.raw.graph[n.0].hidden()).count() as u32,
            hidden_children: self.raw.neighbors_directed(idx, Direction::Outgoing).into_iter().filter(|n| self.raw.graph[n.0].hidden()).count() as u32,
        });
        for (i, node) in self.raw.graph.node_weights().into_iter().enumerate() {
            if let Some(nw) = node_map(RawNodeIndex(NodeIndex::new(i)), node) {
                node_index_map[i] = graph.add_node(nw);
            }
        }
        let edge_map = |idx, _| Some(VisibleEdge::Direct(idx));
        for (i, edge) in self.raw.graph.edge_references().enumerate() {
            // skip edge if any endpoint was removed
            let source = node_index_map[edge.source().index()];
            let target = node_index_map[edge.target().index()];
            if source != NodeIndex::end() && target != NodeIndex::end() {
                if let Some(ew) = edge_map(RawEdgeIndex(EdgeIndex::new(i)), edge.weight()) {
                    graph.add_edge(source, target, ew);
                }
            }
        }

        let reverse: FxHashMap<_, _> = graph.node_indices().map(VisibleNodeIndex).map(|idx| (graph[idx.0].idx, idx)).collect();
        let mut self_ = VisibleGraph { graph, reverse, generation: self.raw.stats.generation };
        self_.reconnect(self);
        self_
    }
}
impl VisibleGraph {
    /// Does the hidden instantiation graph contain the given node?
    pub fn contains(&self, i_idx: RawNodeIndex) -> bool {
        self.reverse.contains_key(&i_idx)
    }

    fn reconnect<N, E>(&mut self, igraph: &Graph<N, E>) {
        // Look for tuples of 4 indices:
        //  - `from`: a visible node
        //  - `from_child`: a hidden child of `from`
        //  - `to_parent`: a hidden node reachable from `from_child` but not
        //    reachable by any hidden node also reachable from `from_child`
        //    (note that it's possible for `from_child == to_parent`)
        //  - `to`: a visible child of `to_parent`
        //
        // There a 4 nested loops here which could be pretty expensive, however
        // we assume that the connectivity of the graph is rather low and so all
        // 3 inner nested loops are relatively cheap (few neighbors and not many
        // reachable nodes). If this is not the case, then the graph would
        // anyway have lots of edges and be hard to render.
        for v_from in self.graph.node_indices() {
            let i_from = self.graph[v_from].idx;
            let Some((sg, _)) = igraph.raw.graph[i_from.0].subgraph else {
                continue;
            };
            let sg = &igraph.subgraphs[sg];
            // Found a potential `from` node, look for `from_child` nodes.
            for i_from_edge in igraph.raw.graph.edges(i_from.0) {
                // Edge between `from` -> `from_child`
                let i_from_child = i_from_edge.target();
                if igraph.raw.graph[i_from_child].visible() {
                    continue;
                }
                let s_from_child = igraph.raw.graph[i_from_child].subgraph.unwrap().1;

                let visible_reachable = || sg.reach_fwd.reachable_from(s_from_child).filter(|&s|
                    igraph.raw.graph[sg.nodes[s as usize].0].visible()
                );
                // All nodes reachable from "any visible node reachable from `s_from_child`".
                let fwd_reachable = sg.reach_fwd.reachable_from_many(visible_reachable());
                if fwd_reachable.is_empty() {
                    // no visible node reachable from `s_from_child`
                    continue;
                }
                // we do not want to walk any nodes which cannot reach any visible node
                let bwd_reachable = sg.reach_bwd.reachable_from_many(visible_reachable());

                // visible nodes are ruled out here too (`fwd_reachable` is reflexive)
                let filter = |i| {
                    let node: &Node<N> = &igraph.raw.graph[i];
                    node.subgraph.is_some_and(|(_, s)| !fwd_reachable.contains(s) && bwd_reachable.contains(s))
                };
                let filtered = NodeFiltered::from_fn(&*igraph.raw.graph, filter);

                let mut path = Vec::new();
                let mut stack = vec![Some(i_from_edge)];
                while let Some(top) = stack.pop() {
                    // Edge between `?` -> `to_parent`
                    let Some(i_to_parent_edge) = top else {
                        path.pop();
                        continue;
                    };
                    path.push(RawEdgeIndex(i_to_parent_edge.id()));
                    stack.push(None);
                    let i_to_parent = i_to_parent_edge.target();
                    stack.extend(filtered.edges(i_to_parent).map(Some));

                    // Found a potential `to_parent` node, look for `to` nodes.
                    for i_to_edge in igraph.raw.graph.edges(i_to_parent) {
                        let i_to = RawNodeIndex(i_to_edge.target());
                        if !igraph.raw.graph[i_to.0].visible() {
                            continue;
                        }
                        let v_to = self.reverse[&i_to];
                        let mut path = path.clone();
                        path.push(RawEdgeIndex(i_to_edge.id()));
                        self.graph.add_edge(v_from, v_to.0, VisibleEdge::Indirect(path));
                    }
                }
            }
        }
    }
}

impl Index<VisibleNodeIndex> for VisibleGraph {
    type Output = VisibleNode;
    fn index(&self, idx: VisibleNodeIndex) -> &Self::Output {
        &self.graph[idx.0]
    }
}
impl IndexMut<VisibleNodeIndex> for VisibleGraph {
    fn index_mut(&mut self, idx: VisibleNodeIndex) -> &mut Self::Output {
        &mut self.graph[idx.0]
    }
}
impl Index<VisibleEdgeIndex> for VisibleGraph {
    type Output = VisibleEdge;
    fn index(&self, idx: VisibleEdgeIndex) -> &Self::Output {
        &self.graph[idx.0]
    }
}
impl IndexMut<VisibleEdgeIndex> for VisibleGraph {
    fn index_mut(&mut self, idx: VisibleEdgeIndex) -> &mut Self::Output {
        &mut self.graph[idx.0]
    }
}

#[derive(Debug)]
pub struct VisibleNode {
    pub idx: RawNodeIndex,
    pub hidden_parents: u32,
    pub hidden_children: u32,
}

#[derive(Clone, PartialEq, Eq, Hash)]
pub enum VisibleEdge {
    Direct(RawEdgeIndex),
    Indirect(Vec<RawEdgeIndex>),
}

impl std::fmt::Debug for VisibleEdge {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            VisibleEdge::Direct(_) => write!(f, "direct edge"),
            VisibleEdge::Indirect{ .. } => write!(f, "indirect edge"),
        }
    }
}

impl VisibleEdge {
    fn indirect_nodes<'a, N, E>(&'a self, graph: &'a Graph<N, E>) -> impl Iterator<Item = RawNodeIndex> + 'a {
        let iter = match self {
            VisibleEdge::Direct(_) => None,
            VisibleEdge::Indirect(path) =>
                Some(path.iter().skip(1).map(|e| graph.raw.graph.edge_endpoints(e.0).unwrap().0)),
        };
        iter.into_iter().flatten().map(RawNodeIndex)
    }
    pub fn is_indirect<N, E>(&self, graph: &Graph<N, E>) -> bool {
        self.indirect_nodes(graph).any(|n| graph.raw.graph[n.0].hidden())
    }
}

impl VisibleEdge {
    pub fn kind(&self, graph: &Graph<InstNodeKind, InstEdgeKind>) -> VisibleEdgeKind<InstEdgeKind> {
        match self {
            VisibleEdge::Direct(e) => VisibleEdgeKind::Direct(*e, graph.raw.graph[e.0]),
            VisibleEdge::Indirect(path) => {
                let get_node = |n| if n == path.len() {
                    let node: RawEdgeIndex = path[n - 1];
                    graph.raw.graph.edge_endpoints(node.0).unwrap().1
                } else {
                    let node: RawEdgeIndex = path[n];
                    graph.raw.graph.edge_endpoints(node.0).unwrap().0
                };
                let get_kind = |n| graph.raw.graph[get_node(n)].kind();
                let edges = path.iter().map(|e| graph.raw.graph[e.0]).collect::<Vec<_>>();
                match edges[..] {
                    // Starting at Instantiation
                    [InstEdgeKind::Yield, InstEdgeKind::Blame { trigger_term }] =>
                        VisibleEdgeKind::YieldBlame { enode: get_kind(1).enode().unwrap(), trigger_term },
                    [InstEdgeKind::Yield, InstEdgeKind::EqualityFact, InstEdgeKind::TEqualitySimple { .. }] =>
                        VisibleEdgeKind::YieldEq(get_kind(2).eq_given().unwrap()),
                    [InstEdgeKind::Yield, InstEdgeKind::EqualityFact, InstEdgeKind::TEqualitySimple { .. }, InstEdgeKind::BlameEq { trigger_term, eq_order }] => {
                        let trans = graph.raw.graph.edges_directed(get_node(3), Direction::Incoming).count();
                        let given_eq = get_kind(2).eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::YieldBlameEq { given_eq, trigger_term, eq_order }
                        } else {
                            VisibleEdgeKind::YieldEqOther(given_eq, edges)
                        }
                    }
                    [InstEdgeKind::Yield, InstEdgeKind::EqualityFact, ..] =>
                        VisibleEdgeKind::YieldEqOther(get_kind(2).eq_given().unwrap(), edges),
                    // Starting at ENode
                    [InstEdgeKind::EqualityFact, InstEdgeKind::TEqualitySimple { .. }] =>
                        VisibleEdgeKind::ENodeEq(get_kind(1).eq_given().unwrap()),
                    [InstEdgeKind::EqualityFact, InstEdgeKind::TEqualitySimple { .. }, InstEdgeKind::BlameEq { trigger_term, eq_order }] => {
                        let trans = graph.raw.graph.edges_directed(get_node(2), Direction::Incoming).count();
                        let given_eq = get_kind(1).eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::ENodeBlameEq { given_eq, trigger_term, eq_order }
                        } else {
                            VisibleEdgeKind::ENodeEqOther(given_eq, edges)
                        }
                    }
                    [InstEdgeKind::EqualityFact, ..] =>
                        VisibleEdgeKind::ENodeEqOther(get_kind(1).eq_given().unwrap(), edges),
                    _ => VisibleEdgeKind::Unknown(*path.first().unwrap(), edges, *path.last().unwrap()),
                }
            }
        }
    }
}

pub enum VisibleEdgeKind<InstEdgeKind> {
    Direct(RawEdgeIndex, InstEdgeKind),
    /// `Instantiation` -> `ENode` -> `Instantiation`
    YieldBlame { enode: ENodeIdx, trigger_term: u16 },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> `TransEquality`
    YieldEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `Instantiation` -> `ENode` -> `GivenEquality` ->
    /// `TransEquality` (only 1 parent) -> `Instantiation`
    YieldBlameEq { given_eq: (EqGivenIdx, Option<NonMaxU32>), trigger_term: u16, eq_order: u16 },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> ...
    YieldEqOther((EqGivenIdx, Option<NonMaxU32>), Vec<InstEdgeKind>),

    /// `ENode` -> `GivenEquality` -> `TransEquality`
    ENodeEq((EqGivenIdx, Option<NonMaxU32>)),
    /// `ENode` -> `GivenEquality` -> `TransEquality` -> `Instantiation`
    ENodeBlameEq { given_eq: (EqGivenIdx, Option<NonMaxU32>), trigger_term: u16, eq_order: u16 },
    /// `ENode` -> `GivenEquality` -> ...
    ENodeEqOther((EqGivenIdx, Option<NonMaxU32>), Vec<InstEdgeKind>),

    Unknown(RawEdgeIndex, Vec<InstEdgeKind>, RawEdgeIndex),
}

impl VisibleEdgeKind<InstEdgeKind> {
    pub fn blame(&self, graph: &Graph<InstNodeKind, InstEdgeKind>) -> InstNodeKind {
        use InstNodeKind::*;
        match self {
            VisibleEdgeKind::Direct(edge, _) |
            VisibleEdgeKind::Unknown(edge, ..) =>
                *graph.raw.graph[graph.raw.graph.edge_endpoints(edge.0).unwrap().0].kind(),

            VisibleEdgeKind::YieldEq(given_eq) |
            VisibleEdgeKind::YieldBlameEq { given_eq, .. } |
            VisibleEdgeKind::YieldEqOther(given_eq, _) |
            VisibleEdgeKind::ENodeEq(given_eq) |
            VisibleEdgeKind::ENodeBlameEq { given_eq, .. } |
            VisibleEdgeKind::ENodeEqOther(given_eq, _) => GivenEquality(given_eq.0, given_eq.1),

            VisibleEdgeKind::YieldBlame { enode, .. } => ENode(*enode),
        }
    }
}
