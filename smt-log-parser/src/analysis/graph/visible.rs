use std::ops::{Index, IndexMut};

use fxhash::{FxHashMap, FxHashSet};
use petgraph::{
    graph::{DiGraph, EdgeIndex, NodeIndex},
    visit::{EdgeRef, IntoEdgeReferences, Topo},
    Direction::{self, Incoming, Outgoing},
};

use crate::{
    graph_idx,
    items::{ENodeIdx, EqGivenIdx},
    NonMaxU32,
};

use super::{
    analysis::matching_loop::MIN_MATCHING_LOOP_LENGTH,
    raw::{EdgeKind, IndexesInstGraph, Node, NodeKind},
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
        // debug_assert_eq!(self.hidden as usize, self.graph.node_weights().filter(|n| n.hidden).count());

        // Code copied from `DiGraph::filter_map`, but that function does not
        // allow for changing the node index type.
        let mut graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx> =
            DiGraph::with_capacity(self.raw.visible_nodes(), 0);
        // mapping from old node index to new node index, end represents removed.
        let mut node_index_map = vec![NodeIndex::end(); self.raw.graph.node_count()];
        let node_map = |idx, node: &Node| {
            node.visible().then(|| {
                let hidden_parents = self.raw.neighbors_directed_count_hidden(idx, Incoming);
                let hidden_children = self.raw.neighbors_directed_count_hidden(idx, Outgoing);
                VisibleNode {
                    idx,
                    hidden_parents: hidden_parents as u32,
                    hidden_children: hidden_children as u32,
                    max_depth: 0,
                }
            })
        };
        for (i, node) in self.raw.graph.node_weights().enumerate() {
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
        self_.reconnect(self);
        self_
    }

    pub fn to_visible_simplified(&self) -> VisibleInstGraph {
        // debug_assert_eq!(self.hidden as usize, self.graph.node_weights().filter(|n| n.hidden).count());

        // Code copied from `DiGraph::filter_map`, but that function does not
        // allow for changing the node index type.
        let mut graph: DiGraph<VisibleNode, VisibleEdge, VisibleIx> =
            DiGraph::with_capacity(self.raw.visible_nodes(), 0);
        // mapping from old node index to new node index, end represents removed.
        let mut node_index_map = vec![NodeIndex::end(); self.raw.graph.node_count()];
        let node_map = |idx, node: &Node| {
            node.visible().then(|| VisibleNode {
                idx,
                // hidden_parents: self.raw.neighbors_directed(idx, Direction::Incoming).into_iter().filter(|n| self.raw.graph[n.0].hidden()).count() as u32,
                hidden_parents: self.raw.graph[idx.0]
                    .inst_parents
                    .nodes
                    .iter()
                    .filter(|&n| self.raw[*n].hidden())
                    .count() as u32,
                // hidden_children: self.raw.neighbors_directed(idx, Direction::Outgoing).into_iter().filter(|n| self.raw.graph[n.0].hidden()).count() as u32,
                hidden_children: self.raw.graph[idx.0]
                    .inst_children
                    .nodes
                    .iter()
                    .filter(|&n| self.raw[*n].hidden())
                    .count() as u32,
                max_depth: 0,
            })
        };
        for (i, node) in self.raw.graph.node_weights().enumerate() {
            if let Some(nw) = node_map(RawNodeIndex(NodeIndex::new(i)), node) {
                node_index_map[i] = graph.add_node(nw);
            }
        }
        // assumes that inst-nodes in self.raw.graph are ordered in topological order
        let mut edge_idx = 0;
        for (i, node) in self.raw.graph.node_weights().enumerate() {
            let from = node_index_map[i];
            if from != NodeIndex::end() {
                for &next_inst in &node.inst_children.nodes {
                    let next_inst = next_inst.index(&self.raw);
                    let to = node_index_map[next_inst.0.index()];
                    if to != NodeIndex::end() {
                        graph.add_edge(
                            from,
                            to,
                            VisibleEdge::Direct(RawEdgeIndex(EdgeIndex::new(edge_idx))),
                        );
                        edge_idx += 1;
                    }
                }
            }
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
        self_.reconnect_simplified(self);
        self_
    }
}
impl VisibleInstGraph {
    /// Does the hidden instantiation graph contain the given node?
    pub fn contains(&self, i_idx: RawNodeIndex) -> bool {
        self.reverse.contains_key(&i_idx)
    }

    fn reconnect(&mut self, igraph: &InstGraph) {
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

                let visible_reachable = || {
                    sg.reach_fwd
                        .reachable_from(s_from_child)
                        .filter(|&s| igraph.raw.graph[sg.nodes[s as usize].0].visible())
                };
                // All nodes reachable from "any visible node reachable from `s_from_child`".
                let fwd_reachable = sg.reach_fwd.reachable_from_many(visible_reachable());
                if fwd_reachable.is_empty() {
                    // no visible node reachable from `s_from_child`
                    continue;
                }

                let non_visible_reachable =
                    sg.reach_fwd.reachable_from_many([s_from_child].into_iter()) - fwd_reachable;
                let non_visible_reachable =
                    non_visible_reachable.iter().map(|s| sg.nodes[s as usize].0);

                for i_to_parent in non_visible_reachable {
                    // Found a potential `to_parent` node, look for `to` nodes.
                    for i_to_edge in igraph.raw.graph.edges(i_to_parent) {
                        let i_to = RawNodeIndex(i_to_edge.target());
                        if !igraph.raw.graph[i_to.0].visible() {
                            continue;
                        }
                        let v_to = self.reverse[&i_to];
                        self.graph.add_edge(
                            v_from,
                            v_to.0,
                            VisibleEdge::Indirect(
                                RawEdgeIndex(i_from_edge.id()),
                                RawEdgeIndex(i_to_edge.id()),
                            ),
                        );
                    }
                }
            }
        }
    }

    fn reconnect_simplified(&mut self, igraph: &InstGraph) {
        // remember all direct edges (will be added to the graph in the end)
        let direct_edges = self.graph.raw_edges().to_vec();
        // nodes with missing children
        let out_set: Vec<NodeIndex<VisibleIx>> = self
            .graph
            .node_indices()
            .filter(|node| {
                // let new_child_count = self.graph.neighbors_directed(*node, Outgoing).count();
                // let old_child_count = self.graph.node_weight(*node).unwrap().;
                // new_child_count < old_child_count
                self.graph.node_weight(*node).unwrap().hidden_children > 0
            })
            .collect();
        // nodes with missing parents
        let in_set: Vec<NodeIndex<VisibleIx>> = self
            .graph
            .node_indices()
            .filter(|node| self.graph.node_weight(*node).unwrap().hidden_parents > 0)
            .collect();
        // add all edges (u,v) in out_set x in_set to the self.graph where v is reachable from u in the original graph
        // and (u,v) is not an edge in the original graph, i.e., all indirect edges
        for &u in &out_set {
            let old_u = self.graph[u].idx;
            let Some((subgraph_u, s_u)) = igraph.raw[old_u].subgraph else {
                continue;
            };
            for &v in &in_set {
                let old_v = self.graph[v].idx;
                let Some((subgraph_v, s_v)) = igraph.raw[old_v].subgraph else {
                    continue;
                };
                if subgraph_u != subgraph_v {
                    continue;
                }
                {
                    if s_u != s_v
                        && igraph.subgraphs[subgraph_u]
                            .reach_fwd
                            .in_transitive_closure(s_u, s_v)
                    {
                        // TODO: the edge indices are not correct
                        self.graph.update_edge(
                            u,
                            v,
                            VisibleEdge::Indirect(RawEdgeIndex::default(), RawEdgeIndex::default()),
                        );
                    }
                }
            }
        }
        // compute transitive reduction to minimize |E| and not clutter the graph
        let toposorted_dag = petgraph::algo::toposort(&self.graph, None).unwrap();
        let (intermediate, _) = petgraph::algo::tred::dag_to_toposorted_adjacency_list::<_, u32>(
            &self.graph,
            &toposorted_dag,
        );
        let (tred, _) = petgraph::algo::tred::dag_transitive_reduction_closure(&intermediate);
        // remove all edges since we only want the direct edges and the indirect edges in the transitive reduction in the final graph
        self.graph.clear_edges();
        // add all direct edges to new_inst_graph that we removed previously
        for direct_edge in direct_edges {
            self.graph.add_edge(
                direct_edge.source(),
                direct_edge.target(),
                direct_edge.weight,
            );
        }
        // add all indirect edges from transitive reduction that are not direct edges
        for indirect_edge in tred.edge_references() {
            // in tred, the node indices are replaced by their topological rank
            // hence we need to look up the index before adding to self.graph
            let source = toposorted_dag[indirect_edge.source() as usize];
            let target = toposorted_dag[indirect_edge.target() as usize];
            // we only want indirect edges
            if !self.graph.contains_edge(source, target) {
                // TODO: the edge indices are not correct
                self.graph.add_edge(
                    source,
                    target,
                    VisibleEdge::Indirect(RawEdgeIndex::default(), RawEdgeIndex::default()),
                );
            }
        }
    }

    pub fn find_longest_paths(&mut self) -> FxHashSet<RawNodeIndex> {
        // traverse this subtree in topological order to compute longest distances from root nodes
        Self::compute_longest_distances_from_roots(self);
        let furthest_away_end_nodes = self
            .graph
            .node_indices()
            // only want to keep end nodes of longest paths, i.e., nodes without any children
            .filter(|nx| self.graph.neighbors_directed(*nx, Outgoing).count() == 0)
            // only want to show matching loops of length at least 3, hence only keep nodes with depth at least 2
            .filter(|nx| {
                self.graph.node_weight(*nx).unwrap().max_depth >= MIN_MATCHING_LOOP_LENGTH - 1
            })
            .collect();
        // backtrack longest paths from furthest away nodes in subgraph until we reach a root
        let mut matching_loop_nodes: FxHashSet<RawNodeIndex> = FxHashSet::default();
        let mut visitor: Vec<NodeIndex<VisibleIx>> = furthest_away_end_nodes;
        let mut visited: FxHashSet<_> = FxHashSet::default();
        while let Some(curr) = visitor.pop() {
            // matching_loop_nodes.insert(self.graph.node_weight(curr).unwrap().orig_graph_idx());
            matching_loop_nodes.insert(self.graph[curr].idx);
            let curr_distance = self.graph.node_weight(curr).unwrap().max_depth;
            let preds = self
                .graph
                .neighbors_directed(curr, Incoming)
                .filter(|pred| {
                    let pred_distance = self.graph.node_weight(*pred).unwrap().max_depth;
                    pred_distance == curr_distance - 1
                });
            for pred in preds {
                if visited.insert(pred) {
                    visitor.push(pred);
                }
            }
        }
        matching_loop_nodes
    }

    pub fn find_end_nodes_of_longest_paths(&mut self) -> FxHashSet<RawNodeIndex> {
        // traverse this subtree in topological order to compute longest distances from root nodes
        Self::compute_longest_distances_from_roots(self);
        let furthest_away_end_nodes = self
            .graph
            .node_indices()
            // only want to keep end nodes of longest paths, i.e., nodes without any children
            .filter(|nx| self.graph.neighbors_directed(*nx, Outgoing).count() == 0)
            // only want to show matching loops of length at least 3, hence only keep nodes with depth at least 2
            .filter(|nx| {
                self.graph.node_weight(*nx).unwrap().max_depth >= MIN_MATCHING_LOOP_LENGTH - 1
            })
            .collect();
        // backtrack longest paths from furthest away nodes in subgraph until we reach a root
        let mut matching_loop_nodes: FxHashSet<RawNodeIndex> = FxHashSet::default();
        let mut visitor: Vec<NodeIndex<VisibleIx>> = furthest_away_end_nodes;
        let mut visited: FxHashSet<_> = FxHashSet::default();
        while let Some(curr) = visitor.pop() {
            // matching_loop_nodes.insert(self.graph.node_weight(curr).unwrap().orig_graph_idx());
            matching_loop_nodes.insert(self.graph[curr].idx);
            let curr_distance = self.graph.node_weight(curr).unwrap().max_depth;
            let preds = self
                .graph
                .neighbors_directed(curr, Incoming)
                .filter(|pred| {
                    let pred_distance = self.graph.node_weight(*pred).unwrap().max_depth;
                    pred_distance == curr_distance - 1
                });
            for pred in preds {
                if visited.insert(pred) {
                    visitor.push(pred);
                }
            }
        }
        matching_loop_nodes
    }

    pub fn compute_longest_distances_from_roots(&mut self) {
        let mut topo = Topo::new(&self.graph);
        while let Some(nx) = topo.next(&self.graph) {
            let parents = self.graph.neighbors_directed(nx, Incoming);
            let max_parent_depth = parents
                .map(|nx| self.graph.node_weight(nx).unwrap().max_depth)
                .max();
            if let Some(depth) = max_parent_depth {
                self.graph[nx].max_depth = depth + 1;
            } else {
                self.graph[nx].max_depth = 0;
            }
        }
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
    pub max_depth: usize,
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
