use petgraph::{
    graph::{DiGraph, EdgeReference, NodeIndex},
    visit::{Bfs, EdgeFiltered, EdgeRef, Reversed, ReversedEdgeReference, Walker},
};

use super::{
    raw::{EdgeKind, IndexesInstGraph, Node, NodeState, RawInstGraph, RawIx},
    InstGraph, RawNodeIndex,
};

impl RawInstGraph {
    pub fn reset_visibility_to(&mut self, hidden: bool) -> bool {
        let state = if hidden {
            NodeState::Hidden
        } else {
            NodeState::Visible
        };
        let mut modified = false;
        for node in self.graph.node_weights_mut().filter(|n| !n.disabled()) {
            modified |= self.stats.set_state(node, state);
        }
        modified
    }
    pub fn set_visibility(&mut self, hidden: bool, node: RawNodeIndex) -> bool {
        let node = &mut self.graph[node.0];
        if node.disabled() {
            return false;
        }
        self.stats.set_state(
            node,
            if hidden {
                NodeState::Hidden
            } else {
                NodeState::Visible
            },
        )
    }

    pub fn keep_first_n(
        &mut self,
        nodes: impl Iterator<Item = RawNodeIndex>,
        mut n: usize,
    ) -> bool {
        let mut modified = false;
        for node in nodes {
            if n == 0 {
                modified |= self.set_visibility(true, node);
            } else if self.graph[node.0].visible() {
                n -= 1;
            }
        }
        modified
    }

    /// When predicate `p` evaluates to true the visibility of the corresponding
    /// node is set to `hidden`.
    pub fn set_visibility_when(
        &mut self,
        hidden: bool,
        mut p: impl FnMut(RawNodeIndex, &Node) -> bool,
    ) -> bool {
        let mut modified = false;
        for node in self.graph.node_indices().map(RawNodeIndex) {
            let n = &self.graph[node.0];
            if n.disabled() {
                continue;
            }
            if p(node, n) {
                modified |= self.set_visibility(hidden, node);
            }
        }
        modified
    }
    pub fn set_visibility_many<I: IndexesInstGraph>(
        &mut self,
        hidden: bool,
        nodes: impl Iterator<Item = I>,
    ) -> bool {
        let mut modified = false;
        for node in nodes {
            let node = node.index(self);
            modified |= self.set_visibility(hidden, node);
        }
        modified
    }

    fn filter_path(
        &self,
        edge: impl EdgeRef<NodeId = NodeIndex<RawIx>>,
        f: impl Fn(&Node) -> u32,
    ) -> bool {
        let from = &self.graph[edge.source()];
        let to = &self.graph[edge.target()];
        if from.disabled() {
            f(from) == f(to)
        } else {
            f(from) == f(to) + 1
        }
    }
    /// A graph with edges that aren't part of any `longest/shortest` path to a
    /// root filtered out. The edges are also reversed, so the graph can be
    /// walked from any node to find the longest/shortest path to a root.
    pub fn path_to_root_graph(
        &self,
        longest: bool,
    ) -> EdgeFiltered<
        Reversed<&DiGraph<Node, EdgeKind, RawIx>>,
        impl Fn(ReversedEdgeReference<EdgeReference<EdgeKind, RawIx>>) -> bool + '_,
    > {
        let f = move |depth: &Node| {
            if longest {
                depth.fwd_depth.max
            } else {
                depth.fwd_depth.min
            }
        };
        let filter = move |edge: ReversedEdgeReference<EdgeReference<EdgeKind, RawIx>>| {
            self.filter_path(edge, f)
        };
        EdgeFiltered::from_fn(self.rev(), filter)
    }
    /// A graph with edges that aren't part of any `longest/shortest` path to a
    /// leaf filtered out. The graph can be walked from any node to find the
    /// longest/shortest path to a leaf.
    pub fn path_to_leaf_graph(
        &self,
        longest: bool,
    ) -> EdgeFiltered<
        &DiGraph<Node, EdgeKind, RawIx>,
        impl Fn(EdgeReference<EdgeKind, RawIx>) -> bool + '_,
    > {
        let f = move |depth: &Node| {
            if longest {
                depth.bwd_depth.max
            } else {
                depth.bwd_depth.min
            }
        };
        let filter = move |edge: EdgeReference<EdgeKind, RawIx>| self.filter_path(edge, f);
        EdgeFiltered::from_fn(&self.graph, filter)
    }

    pub fn show_longest_path_through(&mut self, node: RawNodeIndex) -> (bool, Vec<RawNodeIndex>) {
        let mut path: Vec<_> = {
            let to_root = self.path_to_root_graph(true);
            Bfs::new(&to_root, node.0)
                .iter(&to_root)
                .map(RawNodeIndex)
                .collect()
        };
        path.reverse();
        {
            let to_leaf = self.path_to_leaf_graph(true);
            let to_leaf = Bfs::new(&to_leaf, node.0).iter(&to_leaf).skip(1);
            path.extend(to_leaf.map(RawNodeIndex));
        };
        path.retain(|&n| !self.graph[n.0].disabled());
        let modified = self.set_visibility_many(false, path.iter().copied());
        (modified, path)
    }
}

impl InstGraph {
    pub fn keep_first_n_cost(&mut self, n: usize) -> bool {
        let (top_cost, other) = self.analysis.first_n_cost(&self.raw, n);
        let cost = top_cost.iter().chain(other).copied();
        let cost = cost.chain(self.subgraphs.singletons());
        self.raw.keep_first_n(cost, n)
    }
    pub fn keep_first_n_children(&mut self, n: usize) -> bool {
        let (top_children, other) = self.analysis.first_n_children(&self.raw, n);
        let children = top_children.iter().chain(other).copied();
        let children = children.chain(self.subgraphs.singletons());
        self.raw.keep_first_n(children, n)
    }
    pub fn keep_first_n_fwd_depth_min(&mut self, n: usize) -> bool {
        let (top_fwd_depth_min, other) = self.analysis.first_n_fwd_depth_min(&self.raw, n);
        let fwd_depth_min = top_fwd_depth_min.iter().chain(other).copied();
        let fwd_depth_min = fwd_depth_min.chain(self.subgraphs.singletons());
        self.raw.keep_first_n(fwd_depth_min, n)
    }
}
