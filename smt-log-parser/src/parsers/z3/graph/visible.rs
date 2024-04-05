use fxhash::{FxHashMap, FxHashSet};
use petgraph::{graph::{DiGraph, EdgeIndex, NodeIndex}, visit::{EdgeRef, IntoEdges, NodeFiltered, Topo}, Direction::{self, Incoming, Outgoing}};

use crate::items::{ENodeIdx, EqGivenIdx};

use super::{analysis::matching_loop::MIN_MATCHING_LOOP_LENGTH, raw::{EdgeKind, NodeKind}, InstGraph};

#[derive(Default)]
pub struct VisibleInstGraph {
    pub graph: DiGraph<VisibleNode, VisibleEdge>,
    reverse: FxHashMap<NodeIndex, NodeIndex>,
    pub generation: u32,
}

impl InstGraph {
    pub fn to_visible(&self) -> VisibleInstGraph {
        // debug_assert_eq!(self.hidden as usize, self.graph.node_weights().filter(|n| n.hidden).count());
        let graph = self.raw.graph.filter_map(
            |idx, node| node.visible().then(|| VisibleNode {
                idx,
                hidden_parents: self.raw.neighbors_directed(idx, Direction::Incoming).into_iter().filter(|n| self.raw.graph[*n].hidden()).count() as u32,
                hidden_children: self.raw.neighbors_directed(idx, Direction::Outgoing).into_iter().filter(|n| self.raw.graph[*n].hidden()).count() as u32,
                max_depth: 0,
            }),
            |idx, _| Some(VisibleEdge::Direct(idx))
        );
        let reverse: FxHashMap<_, _> = graph.node_indices().map(|idx| (graph[idx].idx, idx)).collect();
        let mut self_ = VisibleInstGraph { graph, reverse, generation: self.raw.stats.generation };
        self_.reconnect(self);
        self_
    }
}
impl VisibleInstGraph {
    /// Does the hidden instantiation graph contain the given node?
    pub fn contains(&self, i_idx: NodeIndex) -> bool {
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
            let Some((sg, _)) = igraph.raw.graph[i_from].subgraph else {
                continue;
            };
            let sg = &igraph.subgraphs[sg];
            // Found a potential `from` node, look for `from_child` nodes.
            for i_from_edge in igraph.raw.graph.edges(i_from) {
                // Edge between `from` -> `from_child`
                let i_from_child = i_from_edge.target();
                if igraph.raw.graph[i_from_child].visible() {
                    continue;
                }
                let s_from_child = igraph.raw.graph[i_from_child].subgraph.unwrap().1;

                let visible_reachable = sg.reachable_from(s_from_child).filter(|&s| igraph.raw.graph[sg.nodes[s as usize]].visible());
                // All nodes reachable from "any visible node reachable from `s_from_child`".
                let vr_reachable = sg.reachable_from_many(visible_reachable);
                // visible nodes are ruled out here too (`vr_reachable` is reflexive)
                let filter = |i| igraph.raw[i].subgraph.is_some_and(|(_, s)| !vr_reachable.contains(s));
                let filtered = NodeFiltered::from_fn(&igraph.raw.graph, filter);

                let mut path = Vec::new();
                let mut stack = vec![Some(i_from_edge)];
                while let Some(top) = stack.pop() {
                    // Edge between `?` -> `to_parent`
                    let Some(i_to_parent_edge) = top else {
                        path.pop();
                        continue;
                    };
                    path.push(i_to_parent_edge.id());
                    stack.push(None);
                    let i_to_parent = i_to_parent_edge.target();
                    stack.extend(filtered.edges(i_to_parent).map(Some));

                    // Found a potential `to_parent` node, look for `to` nodes.
                    for i_to_edge in igraph.raw.graph.edges(i_to_parent) {
                        let i_to = i_to_edge.target();
                        if !igraph.raw.graph[i_to].visible() {
                            continue;
                        }
                        let v_to = self.reverse[&i_to];
                        let mut path = path.clone();
                        path.push(i_to_edge.id());
                        self.graph.add_edge(v_from, v_to, VisibleEdge::Indirect(path));
                    }
                }
            }
        }
    }

    pub fn find_longest_paths(&mut self) -> FxHashSet<NodeIndex> {
        // traverse this subtree in topological order to compute longest distances from root nodes
        Self::compute_longest_distances_from_roots(self);
        let furthest_away_end_nodes = self.graph
            .node_indices()
            // only want to keep end nodes of longest paths, i.e., nodes without any children 
            .filter(|nx| self.graph.neighbors_directed(*nx, Outgoing).count() == 0)
            // only want to show matching loops of length at least 3, hence only keep nodes with depth at least 2
            .filter(|nx| self.graph.node_weight(*nx).unwrap().max_depth >= MIN_MATCHING_LOOP_LENGTH - 1) 
            .collect();
        // backtrack longest paths from furthest away nodes in subgraph until we reach a root
        let mut matching_loop_nodes: FxHashSet<NodeIndex> = FxHashSet::default();
        let mut visitor: Vec<NodeIndex> = furthest_away_end_nodes;
        let mut visited: FxHashSet<_> = FxHashSet::default();
        while let Some(curr) = visitor.pop() {
            // matching_loop_nodes.insert(self.graph.node_weight(curr).unwrap().orig_graph_idx());
            matching_loop_nodes.insert(self.graph[curr].idx);
            let curr_distance = self.graph.node_weight(curr).unwrap().max_depth;
            let preds = self.graph.neighbors_directed(curr, Incoming).filter(|pred| {
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

#[derive(Debug)]
pub struct VisibleNode {
    pub idx: NodeIndex,
    pub hidden_parents: u32,
    pub hidden_children: u32,
    pub max_depth: usize,
}

#[derive(Clone, PartialEq, Eq)]
pub enum VisibleEdge {
    Direct(EdgeIndex),
    Indirect(Vec<EdgeIndex>),
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
    fn indirect_nodes<'a>(&'a self, graph: &'a InstGraph) -> impl Iterator<Item = NodeIndex> + 'a {
        let iter = match self {
            VisibleEdge::Direct(_) => None,
            VisibleEdge::Indirect(path) =>
                Some(path.iter().skip(1).map(|e| graph.raw.graph.edge_endpoints(*e).unwrap().0)),
        };
        iter.into_iter().flatten()
    }
    pub fn is_indirect(&self, graph: &InstGraph) -> bool {
        self.indirect_nodes(graph).any(|n| graph.raw.graph[n].hidden())
    }
    pub fn kind(&self, graph: &InstGraph) -> VisibleEdgeKind {
        match self {
            VisibleEdge::Direct(e) => VisibleEdgeKind::Direct(*e, graph.raw.graph[*e]),
            VisibleEdge::Indirect(path) => {
                let get_node = |n| if n == path.len() {
                    graph.raw.graph.edge_endpoints(path[n - 1]).unwrap().1
                } else {
                    graph.raw.graph.edge_endpoints(path[n]).unwrap().0
                };
                let get_kind = |n| graph.raw.graph[get_node(n)].kind();
                let edges = path.iter().map(|e| graph.raw.graph[*e]).collect::<Vec<_>>();
                match edges[..] {
                    // Starting at Instantiation
                    [EdgeKind::Yield, EdgeKind::Blame { trigger_term }] =>
                        VisibleEdgeKind::YieldBlame { enode: get_kind(1).enode().unwrap(), trigger_term },
                    [EdgeKind::Yield, EdgeKind::EqualityFact, EdgeKind::TEqualitySimple] =>
                        VisibleEdgeKind::YieldEq(get_kind(2).eq_given().unwrap()),
                    [EdgeKind::Yield, EdgeKind::EqualityFact, EdgeKind::TEqualitySimple, EdgeKind::BlameEq { trigger_term, eq_order }] => {
                        let trans = graph.raw.graph.edges_directed(get_node(3), Direction::Incoming).count();
                        let given_eq = get_kind(2).eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::YieldBlameEq { given_eq, trigger_term, eq_order }
                        } else {
                            VisibleEdgeKind::YieldEqOther(given_eq, edges)
                        }
                    }
                    [EdgeKind::Yield, EdgeKind::EqualityFact, ..] =>
                        VisibleEdgeKind::YieldEqOther(get_kind(2).eq_given().unwrap(), edges),
                    // Starting at ENode
                    [EdgeKind::EqualityFact, EdgeKind::TEqualitySimple] =>
                        VisibleEdgeKind::ENodeEq(get_kind(1).eq_given().unwrap()),
                    [EdgeKind::EqualityFact, EdgeKind::TEqualitySimple, EdgeKind::BlameEq { trigger_term, eq_order }] => {
                        let trans = graph.raw.graph.edges_directed(get_node(2), Direction::Incoming).count();
                        let given_eq = get_kind(1).eq_given().unwrap();
                        if trans == 1 {
                            VisibleEdgeKind::ENodeBlameEq { given_eq, trigger_term, eq_order }
                        } else {
                            VisibleEdgeKind::ENodeEqOther(given_eq, edges)
                        }
                    }
                    [EdgeKind::EqualityFact, ..] =>
                        VisibleEdgeKind::ENodeEqOther(get_kind(1).eq_given().unwrap(), edges),
                    _ => VisibleEdgeKind::Unknown(*path.first().unwrap(), edges, *path.last().unwrap()),
                }
            }
        }
    }
}

pub enum VisibleEdgeKind {
    Direct(EdgeIndex, EdgeKind),
    /// `Instantiation` -> `ENode` -> `Instantiation`
    YieldBlame { enode: ENodeIdx, trigger_term: u16 },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> `TransEquality`
    YieldEq(EqGivenIdx),
    /// `Instantiation` -> `ENode` -> `GivenEquality` ->
    /// `TransEquality` (only 1 parent) -> `Instantiation`
    YieldBlameEq { given_eq: EqGivenIdx, trigger_term: u16, eq_order: u16 },
    /// `Instantiation` -> `ENode` -> `GivenEquality` -> ...
    YieldEqOther(EqGivenIdx, Vec<EdgeKind>),

    /// `ENode` -> `GivenEquality` -> `TransEquality`
    ENodeEq(EqGivenIdx),
    /// `ENode` -> `GivenEquality` -> `TransEquality` -> `Instantiation`
    ENodeBlameEq { given_eq: EqGivenIdx, trigger_term: u16, eq_order: u16 },
    /// `ENode` -> `GivenEquality` -> ...
    ENodeEqOther(EqGivenIdx, Vec<EdgeKind>),

    Unknown(EdgeIndex, Vec<EdgeKind>, EdgeIndex),
}

impl VisibleEdgeKind {
    pub fn blame(&self, graph: &InstGraph) -> NodeKind {
        use NodeKind::*;
        match self {
            VisibleEdgeKind::Direct(edge, _) |
            VisibleEdgeKind::Unknown(edge, ..) =>
                *graph.raw.graph[graph.raw.graph.edge_endpoints(*edge).unwrap().0].kind(),

            VisibleEdgeKind::YieldEq(given_eq) |
            VisibleEdgeKind::YieldBlameEq { given_eq, .. } |
            VisibleEdgeKind::YieldEqOther(given_eq, _) |
            VisibleEdgeKind::ENodeEq(given_eq) |
            VisibleEdgeKind::ENodeBlameEq { given_eq, .. } |
            VisibleEdgeKind::ENodeEqOther(given_eq, _) => GivenEquality(*given_eq),

            VisibleEdgeKind::YieldBlame { enode, .. } => ENode(*enode),
        }
    }
}
