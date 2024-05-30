use fxhash::{FxHashSet, FxHashMap};
use gloo_console::log;
use petgraph::graph::{NodeIndex, UnGraph};
use petgraph::stable_graph::StableGraph;
use petgraph::visit::{Bfs, IntoEdgeReferences, IntoEdges, IntoNeighborsDirected, Topo};
use petgraph::{
    stable_graph::EdgeIndex,
    visit::{Dfs, EdgeRef},
    Direction::{Incoming, Outgoing},
};
use petgraph::{Direction, Graph};
use roaring::bitmap::RoaringBitmap;
use std::cmp::Ordering;
use std::fmt;
use std::hash::Hash;
use std::iter::zip;
use typed_index_collections::TiVec;

use crate::display_with::{DisplayCtxt, DisplayWithCtxt};
use crate::items::{BlameKind, ENodeIdx, EqGivenIdx, EqTransIdx, EqualityExpl, Fingerprint, InstIdx, MatchKind, QuantIdx, Term, TermIdx, TermKind};

const MIN_MATCHING_LOOP_LENGTH: usize = 3;

#[derive(Debug, Clone)]
pub struct InstNode {
    pub is_theory_inst: bool,
    cost: f32,
    pub inst_idx: InstIdx,
    pub mkind: MatchKind,
    cost_rank: usize,
    branching_rank: usize,
    quantifier: Option<String>,
}

#[derive(Debug, Clone, Copy)]
pub struct EqualityNode<T> {
    from: ENodeIdx,
    to: ENodeIdx,
    idx: T,
}

impl<T: Hash> Hash for EqualityNode<T> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.idx.hash(state);
    }
}

impl<T: PartialEq> PartialEq for EqualityNode<T> {
    fn eq(&self, other: &Self) -> bool {
        self.idx == other.idx
    }
}

impl<T: Eq> Eq for EqualityNode<T> {}

impl<T> EqualityNode<T> {
    fn from(from: &ENodeIdx, to: &ENodeIdx, idx: T) -> Self {
        EqualityNode { 
            from: *from,
            to: *to,
            idx,
        }
    }
}

#[derive(Clone)]
pub struct Node {
    pub visible: bool,
    pub child_count: usize, // is this necessary?
    pub parent_count: usize, // is this necessary?
    pub topo_ord: usize,
    pub max_depth: usize,
    pub min_depth: Option<usize>,
    pub orig_graph_idx: NodeIndex, // is this necessary?
    pub has_visible_ancestor: bool, // is this necessary?
    pub has_visible_descendant: bool, // is this necessary?
    pub kind: NodeKind,
}

#[derive(Debug, Clone)]
pub enum NodeKind {
    Term(ENodeIdx), // corresponds to ENodeIdx
    GivenEquality(EqualityNode<EqGivenIdx>), // corresponds to EqGivenIdx
    TransEquality(EqualityNode<EqTransIdx>), // corresponds to EqTransIdx
    Inst(InstNode), // corresponds to InstIdx
}

impl Node {
    pub fn inner_inst(&self) -> Option<&InstNode> {
        match &self.kind {
            NodeKind::Inst(inst) => Some(inst),
            _ => None,
        } 
    }
    fn inner_mut_inst(&mut self) -> Option<&mut InstNode> {
        match &mut self.kind {
            NodeKind::Inst(inst) => Some(inst),
            _ => None,
        } 
    }
}

impl fmt::Debug for Node {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.kind.fmt(f)
    }
}

#[derive(Clone)]
pub enum EdgeType {
    Direct {
        kind: BlameKind,
        orig_graph_idx: EdgeIndex,
    },
    Indirect,
}

impl PartialEq for EdgeType {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (
                EdgeType::Direct {
                    orig_graph_idx: s, ..
                },
                EdgeType::Direct {
                    orig_graph_idx: o, ..
                },
            ) => s == o,
            (EdgeType::Indirect, EdgeType::Indirect) => true,
            _ => false,
        }
    }
}

impl EdgeType {
    // pub fn blame_term_idx(&self) -> Option<ENodeIdx> {
    //     match self {
    //         EdgeType::Direct { kind, .. } => kind.get_blame_node(),
    //         _ => None,
    //     }
    // }
    pub fn is_direct(&self) -> bool {
        matches!(self, EdgeType::Direct { .. })
    }
}

impl fmt::Debug for EdgeType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            EdgeType::Direct { .. } => write!(f, "direct edge"),
            EdgeType::Indirect => write!(f, "indirect edge"),
        }
    }
}

#[derive(Default, Clone)]
pub struct InstGraph {
    pub orig_graph: Graph<Node, BlameKind>,
    enode_idx: TiVec<ENodeIdx, NodeIndex>,
    eq_given_idx: TiVec<EqGivenIdx, NodeIndex>,
    eq_trans_idx: TiVec<EqTransIdx, NodeIndex>,
    inst_idx: TiVec<InstIdx, NodeIndex>,

    pub visible_graph: Graph<Node, EdgeType>,
    cost_ranked_node_indices: Vec<InstIdx>,
    branching_ranked_node_indices: Vec<InstIdx>,
    tr_closure: Vec<RoaringBitmap>,
    matching_loop_subgraph: Graph<Node, EdgeType>,
    matching_loop_end_nodes: Option<Vec<NodeIndex>>, // these are sorted by maximal depth in descending order 
    generalized_terms: TiVec<usize, Option<Vec<String>>>,
}

enum InstOrder {
    Branching,
    Cost,
}

pub struct VisibleGraphInfo {
    pub node_count: usize,
    pub edge_count: usize,
    pub node_count_decreased: bool,
    pub edge_count_decreased: bool,
}

impl InstGraph {
    pub fn from(parser: &Z3Parser) -> Self {
        let mut inst_graph = Self::default();
        inst_graph.compute_instantiation_graph(parser);
        inst_graph
    }

    pub fn retain_nodes(&mut self, retain: impl Fn(&InstNode) -> bool) {
        for node in self.orig_graph.node_weights_mut() {
            if let Node::Inst(inst) = node {
                if !retain(inst) {
                    inst.visible = false;
                }
            }
        }
    }

    pub fn hide_equality_nodes(&mut self) {
        for node in self.orig_graph.node_weights_mut() {
            if let Node::Equality(eq) = node {
                eq.visible = false;
            }
        }
    }

    pub fn prune_equality_nodes(&mut self) {
        let mut new_inst_graph = self.orig_graph.filter_map(
            |_, node| Some(node).filter(|node| node.visible()).cloned(),
            |orig_graph_idx, edge_data| {
                Some(EdgeType::Direct {
                    kind: edge_data.clone(),
                    orig_graph_idx,
                })
            },
        );
        let mut topo = Topo::new(&new_inst_graph);
        while let Some(nx) = topo.next(&new_inst_graph) {
            let any_parent_has_visible_ancestor = new_inst_graph
                .neighbors_directed(nx, Incoming)
                .map(|nx| new_inst_graph.node_weight(nx).unwrap())
                .any(|parent| parent.has_visible_ancestor());
            let curr = new_inst_graph.node_weight_mut(nx).unwrap();
            match curr {
                Node::Inst(inst) => {
                    inst.has_visible_ancestor = true;
                },
                Node::Equality(eq) => {
                    eq.has_visible_ancestor = any_parent_has_visible_ancestor;
                },
            }
        }
        let mut rev_topo = Topo::new(petgraph::visit::Reversed(&new_inst_graph));
        while let Some(nx) = rev_topo.next(&petgraph::visit::Reversed(&new_inst_graph)) {
            let any_child_has_visible_descendant = new_inst_graph
                .neighbors_directed(nx, Outgoing)
                .map(|nx| new_inst_graph.node_weight(nx).unwrap())
                .any(|child| child.has_visible_descendant());
            let curr = new_inst_graph.node_weight_mut(nx).unwrap();
            match curr {
                Node::Inst(inst) => {
                    inst.has_visible_descendant = true;
                },
                Node::Equality(eq) => {
                    eq.has_visible_descendant = any_child_has_visible_descendant;
                },
            }
        }
        for node in new_inst_graph.node_weights() {
            let orig_nx = node.orig_graph_idx();
            self.orig_graph[orig_nx].set_visibility_to(node.has_visible_ancestor() && node.has_visible_descendant());
        }
    }

    pub fn ignore_chain_equality_nodes(&mut self) {
        let new_inst_graph = self.orig_graph.filter_map(
        |_, node| Some(node).filter(|node| node.visible()).cloned(),
        |orig_graph_idx, edge_data| {
            Some(EdgeType::Direct {
                kind: edge_data.clone(),
                orig_graph_idx,
            })},
        );
        for nx in new_inst_graph.node_indices() {
            if let Node::Equality(_) = new_inst_graph[nx] {
                let parent_count = new_inst_graph.neighbors_directed(nx, Incoming).count(); 
                let child_count = new_inst_graph.neighbors_directed(nx, Outgoing).count(); 
                if parent_count == 1 && child_count == 1 {
                    let orig_idx = new_inst_graph.node_weight(nx).unwrap().orig_graph_idx();
                    self.orig_graph[orig_idx].set_visibility_to(false);
                }
            }

        }
    }

    pub fn retain_visible_nodes_and_reconnect(&mut self) -> VisibleGraphInfo {
        let prev_node_count = self.visible_graph.node_count();
        let prev_edge_count = self.visible_graph.edge_count();
        // retain all visible nodes
        let mut new_inst_graph = self.orig_graph.filter_map(
            |_, node| Some(node).filter(|node| node.visible()).cloned(),
            |orig_graph_idx, edge_data| {
                Some(EdgeType::Direct {
                    kind: edge_data.clone(),
                    orig_graph_idx,
                })
            },
        );
        // remember all direct edges (will be added to the graph in the end)
        let direct_edges = new_inst_graph
            .raw_edges()
            .to_vec();
        // nodes with missing children
        let out_set: Vec<NodeIndex> = new_inst_graph
            .node_indices()
            .filter(|node| {
                let new_child_count = new_inst_graph.neighbors_directed(*node, Outgoing).count();
                let old_child_count = new_inst_graph.node_weight(*node).unwrap().child_count();
                new_child_count < old_child_count
            })
            .collect();
        // nodes with missing parents
        let in_set: Vec<NodeIndex> = new_inst_graph
            .node_indices()
            .filter(|node| {
                new_inst_graph.neighbors_directed(*node, Incoming).count()
                    < new_inst_graph.node_weight(*node).unwrap().parent_count()
            })
            .collect();
        // add all edges (u,v) in out_set x in_set to the new_inst_graph where v is reachable from u in the original graph
        // and (u,v) is not an edge in the original graph, i.e., all indirect edges
        for &u in &out_set {
            for &v in &in_set {
                let old_u = new_inst_graph.node_weight(u).unwrap().orig_graph_idx();
                let old_v = new_inst_graph.node_weight(v).unwrap().orig_graph_idx();
                if old_u != old_v
                    && !self.orig_graph.contains_edge(old_u.into(), old_v.into())
                    && self.tr_closure_contains_edge(old_u, old_v)
                // && petgraph::algo::has_path_connecting(&self.orig_graph, old_u, old_v, None)
                {
                    new_inst_graph.add_edge(u, v, EdgeType::Indirect);
                }
            }
        }
        // compute transitive reduction to minimize |E| and not clutter the graph
        let toposorted_dag = petgraph::algo::toposort(&new_inst_graph, None).unwrap();
        let (intermediate, _) = petgraph::algo::tred::dag_to_toposorted_adjacency_list::<_, u32>(
            &new_inst_graph,
            &toposorted_dag,
        );
        let (tred, _) = petgraph::algo::tred::dag_transitive_reduction_closure(&intermediate);
        // remove all edges since we only want the direct edges and the indirect edges in the transitive reduction in the final graph
        new_inst_graph.clear_edges();
        // add all direct edges to new_inst_graph that we removed previously
        for direct_edge in direct_edges {
            new_inst_graph.add_edge(
                direct_edge.source(),
                direct_edge.target(),
                direct_edge.weight,
            );
        }
        // add all indirect edges from transitive reduction that are not direct edges
        for indirect_edge in tred.edge_references() {
            // in tred, the node indices are replaced by their topological rank
            // hence we need to look up the index before adding to new_inst_graph
            let source = toposorted_dag[indirect_edge.source() as usize];
            let target = toposorted_dag[indirect_edge.target() as usize];
            // we only want indirect edges
            if !new_inst_graph.contains_edge(source, target) {
                new_inst_graph.add_edge(source, target, EdgeType::Indirect);
            }
        }
        self.visible_graph = new_inst_graph;
        let curr_node_count = self.visible_graph.node_count();
        let curr_edge_count = self.visible_graph.edge_count();
        VisibleGraphInfo {
            node_count: self.visible_graph.node_count(),
            edge_count: self.visible_graph.edge_count(),
            node_count_decreased: curr_node_count < prev_node_count,
            edge_count_decreased: curr_edge_count < prev_edge_count,
        }
    }

    fn tr_closure_contains_edge(&self, from: NodeIndex, to: NodeIndex) -> bool {
        let topo_ord_from = self.orig_graph.node_weight(from).unwrap().topo_ord();
        let from_bitset = &self.tr_closure[topo_ord_from];
        from_bitset.contains(to.index() as u32)
    }

    pub fn visit_descendants(&mut self, root: InstIdx, retain: bool) {
        let mut dfs = Dfs::new(&self.orig_graph, self.node_of_inst_idx[root]);
        while let Some(nx) = dfs.next(&self.orig_graph) {
            self.orig_graph[nx].set_visibility_to(retain);
        }
    }

    pub fn visit_ancestors(&mut self, node: InstIdx, retain: bool) {
        let mut dfs = Dfs::new(petgraph::visit::Reversed(&self.orig_graph), self.node_of_inst_idx[node]);
        while let Some(nx) = dfs.next(petgraph::visit::Reversed(&self.orig_graph)) {
            self.orig_graph[nx].set_visibility_to(retain);
        }
    }

    pub fn show_longest_path_through(&mut self, node: NodeIndex) -> Vec<NodeIndex> {
        // construct subtree rooted at selected node
        let mut subtree_rooted_at_node: StableGraph<Node, BlameKind> =
            StableGraph::from(self.orig_graph.clone());
        for node in subtree_rooted_at_node.node_weights_mut() {
            node.set_visibility_to(false);
        }
        let mut dfs = Dfs::new(&subtree_rooted_at_node, node.into());
        while let Some(nx) = dfs.next(&subtree_rooted_at_node) {
            subtree_rooted_at_node[nx].set_visibility_to(true);
        }
        subtree_rooted_at_node = subtree_rooted_at_node.filter_map(
            |_, node_data| {
                node_data.visible().then(|| node_data.clone())
            },
            |_, edge| Some(edge.clone()),
        );
        // traverse this subtree in topological order to compute longest distances from node
        let mut topo = Topo::new(&subtree_rooted_at_node);
        while let Some(nx) = topo.next(&subtree_rooted_at_node) {
            let parents = subtree_rooted_at_node.neighbors_directed(nx, Incoming);
            let max_parent_depth = parents
                .map(|nx| subtree_rooted_at_node.node_weight(nx).unwrap().max_depth())
                .max();
            if let Some(depth) = max_parent_depth {
                subtree_rooted_at_node[nx].set_max_depth_to(depth + 1);
            }
        }
        let furthest_away_node_idx = subtree_rooted_at_node
            .node_weights()
            .max_by(|node_a, node_b| node_a.max_depth().cmp(&node_b.max_depth()))
            .unwrap()
            .orig_graph_idx();
        // backtrack a longest path from furthest away node in subgraph until we reach the root
        // with respect to the subgraph, i.e., node
        // self.backtrack(Some(&subtree_rooted_at_node), furthest_away_node_idx);
        let mut longest_path: Vec<NodeIndex> = Vec::new();
        let mut visitor: Vec<NodeIndex> = Vec::new();
        if furthest_away_node_idx != node {
            visitor.push(furthest_away_node_idx);
        }
        while let Some(curr) = visitor.pop() {
            longest_path.push(curr);
            self.orig_graph[curr].set_visibility_to(true);
            let curr_distance = subtree_rooted_at_node.node_weight(curr).unwrap().max_depth();
            let pred = subtree_rooted_at_node
                .neighbors_directed(curr, Incoming)
                .filter(|pred| {
                    let pred_distance =
                        subtree_rooted_at_node.node_weight(*pred).unwrap().max_depth();
                    pred_distance == curr_distance - 1
                })
                .next();
            if let Some(node) = pred {
                visitor.push(node);
            }
        }
        // backtrack a longest path from node until we reach a root with respect to the original graph
        visitor.push(node);
        while let Some(curr) = visitor.pop() {
            longest_path.push(curr);
            self.orig_graph[curr].set_visibility_to(true);
            let curr_distance = self.orig_graph.node_weight(curr).unwrap().max_depth();
            let pred = self
                .orig_graph
                .neighbors_directed(curr, Incoming)
                .filter(|pred| {
                    let pred_distance = self.orig_graph.node_weight(*pred).unwrap().max_depth();
                    pred_distance == curr_distance - 1
                })
                .next();
            if let Some(node) = pred {
                visitor.push(node);
            }
        }
        longest_path
            .iter()
            .cloned()
            .rev()
            .collect::<Vec<NodeIndex>>()
    }

    // fn backtrack<T>(&mut self, graph: Option<T>, node: InstIdx) where
    // T: NodeIndexable<EdgeId = EdgeIndex, NodeId = InstIdx> + DataMap<NodeWeight = Node> + IntoNeighborsDirected {
    //     let mut visitor: Vec<InstIdx> = Vec::new();
    //     visitor.push(node);
    //     while let Some(curr) = visitor.pop() {
    //         self.orig_graph[curr].visible = true;
    //         let curr_distance = graph.unwrap_or(self.orig_graph).node_weight(curr).unwrap().max_depth;
    //         // log!(format!("Node {} has distance {} from {}", curr.index(), curr_distance, ))
    //         let pred = graph
    //             .unwrap_or_default(self.orig_graph)
    //             .neighbors_directed(curr, Incoming)
    //             .filter(|pred| {
    //                 let pred_distance = graph.unwrap_or(self.orig_graph).node_weight(*pred).unwrap().max_depth;
    //                 pred_distance == curr_distance - 1
    //             })
    //             .last();
    //         if let Some(node) = pred {
    //             visitor.push(node);
    //         }
    //     }
    // }

    pub fn search_matching_loops(&mut self) -> usize {
        let quants: FxHashSet<_> = self
            .orig_graph
            .node_weights()
            .filter_map(|node| if let Node::Inst(inst) = node { Some(inst) } else { None })
            .flat_map(|node| node.mkind.quant_idx())
            .collect();
        let mut matching_loop_nodes_per_quant: Vec<FxHashSet<NodeIndex>> = Vec::new();
        for quant in quants {
            // log!(format!("Processing quant {}", quant));
            self.reset_visibility_to(true);
            self.retain_nodes(|node| {
                node.mkind
                    .quant_idx()
                    .map(|q| q == quant)
                    .unwrap_or_default()
            });
            self.retain_visible_nodes_and_reconnect();
            let matching_loops = Self::find_longest_paths(&mut self.visible_graph);
            matching_loop_nodes_per_quant.push(matching_loops);
        }
        self.reset_visibility_to(false);
        for matching_loop in matching_loop_nodes_per_quant {
            for node in matching_loop {
                self.orig_graph[node].set_visibility_to(true);
            }
        }
        self.retain_visible_nodes_and_reconnect();
        self.matching_loop_subgraph = self.visible_graph.clone();
        // for displaying the nth longest matching loop later on, we want to compute the end nodes of all the matching loops
        // and sort them by max-depth in descending order
        Self::compute_longest_distances_from_roots(&mut self.matching_loop_subgraph);
        // compute end-nodes of matching loops 
        let mut matching_loop_end_nodes: Vec<_> = self.matching_loop_subgraph 
            .node_indices()
            // only keep end-points of matching loops, i.e., nodes without any children in the matching loop subgraph
            .filter(|nx| self.matching_loop_subgraph.neighbors_directed(*nx, Outgoing).count() == 0)
            .collect();
        // sort the matching loop end-nodes by the max-depth
        matching_loop_end_nodes.sort_unstable_by(|node_a, node_b| {
            let max_depth_node_a = self.matching_loop_subgraph.node_weight(*node_a).unwrap().max_depth();
            let max_depth_node_b = self.matching_loop_subgraph.node_weight(*node_b).unwrap().max_depth();
            if max_depth_node_a < max_depth_node_b {
                std::cmp::Ordering::Greater
            } else {
                std::cmp::Ordering::Less
            }
        });
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = matching_loop_end_nodes.len();
        self.matching_loop_end_nodes = Some(matching_loop_end_nodes);
        self.generalized_terms.resize(nr_matching_loop_end_nodes, None);
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }

    pub fn show_nth_matching_loop(&mut self, n: usize, p: &mut Z3Parser) -> Vec<String> {
        self.reset_visibility_to(false);
        // relies on the fact that we have previously sorted self.matching_loop_end_nodes by max_depth in descending order in 
        // search_matching_loops
        let end_node_of_nth_matching_loop = self.matching_loop_end_nodes.as_ref().and_then(|mlen| mlen.get(n));
        if let Some(&node) = end_node_of_nth_matching_loop {
            // start a reverse-DFS from node and mark all the nodes as visible along the way
            // during the reverse-DFS collect information needed to compute the generalized terms later on
            // we abstract the edges over the from- and to-quantifiers as well as the trigger, i.e.,
            // two edges (a,b) and (c,d) are the same abstract edge iff 
            // - a and c correspond to an instantiation of the same quantifier
            // - and b and d correspond to an instantiation of the same quantifier 
            // - and b and d used the same trigger
            let mut abstract_edge_blame_terms: FxHashMap<(QuantIdx, QuantIdx, TermIdx), Vec<TermIdx>> = FxHashMap::default(); 
            let mut dfs = Dfs::new(petgraph::visit::Reversed(&self.matching_loop_subgraph), node);
            while let Some(nx) = dfs.next(petgraph::visit::Reversed(&self.matching_loop_subgraph)) {
                let orig_index = self.matching_loop_subgraph.node_weight(nx).unwrap().orig_graph_idx();
                self.orig_graph[NodeIndex::from(orig_index)].set_visibility_to(true);
                // add all direct dependencies which have BlameKind::Term to the correct bin in abstract_edges
                // such that later on we can generalize over each all edges in a matching loop that have 
                // identical from- and to-quantifiers
                // (*)
                // avoid unnecessary recomputation if we have already computed the generalized terms 
                if let None = &self.generalized_terms[n] {
                    log!(format!("Computation I for matching loop #{}", n));
                    // TODO: fix
                    // if let Some(to_quant) = self.matching_loop_subgraph.node_weight(nx).unwrap().mkind.quant_idx() {
                    //     for incoming_edge in self.matching_loop_subgraph.edges_directed(nx, Incoming) {
                    //         let from = incoming_edge.source(); 
                    //         if let Some(from_quant) = self.matching_loop_subgraph.node_weight(from).unwrap().mkind.quant_idx() {
                    //             if let Some(blame_term) = incoming_edge.weight().blame_term_idx() {
                    //                 let blame_term_idx = p[blame_term].owner; 
                    //                 if let Some(trigger) = self.matching_loop_subgraph.node_weight(nx).unwrap().mkind.pattern() {
                    //                     if let Some(blame_terms) = abstract_edge_blame_terms.get_mut(&(from_quant, to_quant, trigger)) {
                    //                         blame_terms.push(blame_term_idx);
                    //                     } else {
                    //                         abstract_edge_blame_terms.insert((from_quant, to_quant, trigger), vec![blame_term_idx]);
                    //                     }
                    //                 }
                    //             }
                    //         }
                    //     }
                    // }
                }
            }
            if let Some(generalized_terms) = &self.generalized_terms[n] {
                // check if we have already computed the generalized terms for the n-th matching loop
                generalized_terms.clone()
            } else {
                log!(format!("Computation II for matching loop #{}", n));
                // if not, compute the generalized terms for each bucket in abstract_edge_blame_terms
                let mut generalized_terms: Vec<String> = Vec::new();
                for blame_terms in abstract_edge_blame_terms.values() {
                    // let generalized_term = blame_terms.iter().reduce(|&t1, &t2| generalize(t1, t2, p)).unwrap();
                    if let Some(t1) = blame_terms.get(0) {
                        let mut gen_term = *t1;
                        for &t2 in &blame_terms[1..] {
                            gen_term = p.terms.generalize(gen_term, t2);
                            // let ctxt = DisplayCtxt {
                            //     parser: p,
                            //     display_term_ids: false,
                            //     display_quantifier_name: false,
                            //     use_mathematical_symbols: true,
                            // };
                            // log!(format!("Generalized term {} and {}", gen_term.with(&ctxt), t2.with(&ctxt)));
                        }
                        let ctxt = DisplayCtxt {
                            parser: p,
                            display_term_ids: false,
                            display_quantifier_name: false,
                            use_mathematical_symbols: true,
                        };
                        let pretty_gen_term = gen_term.with(&ctxt).to_string();
                        generalized_terms.push(pretty_gen_term);
                    }
                }
                self.generalized_terms[n] = Some(generalized_terms.clone());
                generalized_terms
            }
            // after generalizing over the terms for each abstract edge, store the key-value pair (n, MatchingLoopInfo) in the 
            // InstGraph such that we don't need to recompute the generalization => can check if the value is already in the map at (*)
        } else {
            Vec::new() 
        }
    }

    pub fn show_named_quantifier(&mut self, quant: String) {
        for node in self.orig_graph.node_weights_mut() {
            if let Node::Inst(inst) = node {
                inst.visible |= inst.quantifier.as_ref().is_some_and(|q| q == &quant);
            }
        }
    }

    pub fn show_matching_loop_subgraph(&mut self) {
        self.reset_visibility_to(false);
        for node in self.matching_loop_subgraph.node_weights() {
            self.orig_graph[node.orig_graph_idx()].set_visibility_to(true);
        }
    }

    fn compute_longest_distances_from_roots(graph: &mut Graph<Node, EdgeType>) {
        let mut topo = Topo::new(&*graph);
        while let Some(nx) = topo.next(&*graph) {
            let parents = graph.neighbors_directed(nx, Incoming);
            let max_parent_depth = parents
                .map(|nx| graph.node_weight(nx).unwrap().max_depth())
                .max();
            if let Some(depth) = max_parent_depth {
                graph[nx].set_max_depth_to(depth + 1);
            } else {
                graph[nx].set_max_depth_to(0);
            }
        }
    }

    fn find_longest_paths(graph: &mut Graph<Node, EdgeType>) -> FxHashSet<NodeIndex> {
        // traverse this subtree in topological order to compute longest distances from root nodes
        Self::compute_longest_distances_from_roots(graph);
        let furthest_away_end_nodes = graph
            .node_indices()
            // only want to keep end nodes of longest paths, i.e., nodes without any children 
            .filter(|nx| graph.neighbors_directed(*nx, Outgoing).count() == 0)
            // only want to show matching loops of length at least 3, hence only keep nodes with depth at least 2
            .filter(|nx| graph.node_weight(*nx).unwrap().max_depth() >= MIN_MATCHING_LOOP_LENGTH - 1) 
            .collect();
        // backtrack longest paths from furthest away nodes in subgraph until we reach a root
        let mut matching_loop_nodes: FxHashSet<NodeIndex> = FxHashSet::default();
        let mut visitor: Vec<NodeIndex> = furthest_away_end_nodes;
        let mut visited: FxHashSet<_> = FxHashSet::default();
        while let Some(curr) = visitor.pop() {
            matching_loop_nodes.insert(graph.node_weight(curr).unwrap().orig_graph_idx());
            let curr_distance = graph.node_weight(curr).unwrap().max_depth();
            let preds = graph.neighbors_directed(curr, Incoming).filter(|pred| {
                let pred_distance = graph.node_weight(*pred).unwrap().max_depth();
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

    pub fn reset_visibility_to(&mut self, visibility: bool) {
        for node in self.orig_graph.node_weights_mut() {
            node.set_visibility_to(visibility);
        }
    }

    pub fn show_neighbours(&mut self, node: InstIdx, direction: petgraph::Direction) {
        let neighbour_indices: Vec<NodeIndex> = self
            .orig_graph
            .neighbors_directed(self.node_of_inst_idx[node], direction)
            .collect();
        for neighbour in neighbour_indices {
            self.orig_graph.node_weight_mut(neighbour).unwrap().set_visibility_to(true);
        }
    }

    pub fn node_has_filtered_children(&self, node_idx: InstIdx) -> bool {
        self.node_has_filtered_direct_neighbours(node_idx, Outgoing)
    }

    pub fn node_has_filtered_parents(&self, node_idx: InstIdx) -> bool {
        self.node_has_filtered_direct_neighbours(node_idx, Incoming)
    }

    fn node_has_filtered_direct_neighbours(
        &self,
        node_idx: InstIdx,
        direction: Direction,
    ) -> bool {
        let neighbours =
            self.orig_graph
                .edges_directed(self.node_of_inst_idx[node_idx], direction)
                .map(|e| match direction {
                    Outgoing => e.target(),
                    Incoming => e.source(),
                });
        let (visible_neighbours, hidden_neighbours): (Vec<NodeIndex>, Vec<NodeIndex>) =
            neighbours.partition(|n| self.orig_graph.node_weight(*n).unwrap().visible());
        let nr_visible_neighbours = visible_neighbours.len();
        let nr_hidden_neighbours = hidden_neighbours.len();
        nr_visible_neighbours < nr_hidden_neighbours + nr_visible_neighbours
    }

    fn compute_instantiation_graph(&mut self, parser: &Z3Parser) {
        // parser.egraph.

        for eq in parser.equalities.borrow().iter() {
            match eq {
                // NodeEquality::Leaf(LeafEquality(lhs, rhs)) => self.add_eq_edge_to_inst(EqualityNode::from(lhs, rhs), inst_idx),
                NodeEquality::Leaf(LeafEquality(_, _)) => (),
                NodeEquality::Node(lhs, rhs, eqs) => {
                    // self.add_eq_edge_to_inst(EqualityNode::from(lhs, rhs), inst_idx);
                    for eq in eqs {
                        self.add_equalities(&lhs, &rhs, &eq);
                    }
                }
            }
        }
        for (inst_idx, inst) in parser.insts.insts.iter_enumerated() {
            let match_ = &parser.insts[inst.match_];
            // add new node to graph
            self.add_inst_node(InstNode {
                is_theory_inst: match_.kind.is_discovered(),
                cost: inst.cost,
                inst_idx,
                mkind: match_.kind.clone(),
                visible: true,
                child_count: 0,
                parent_count: 0,
                cost_rank: 0,
                branching_rank: 0,
                min_depth: None,
                max_depth: 0,
                // the order of instantiations in the log already defines a topological order on the nodes 
                // because the log implicitly defines a total order on the QIs (quantifier instantiations)
                // that is consistent with all dependencies. This is because if QI B occurs later than QI A
                // in the log, QI A can't blame any terms generated by QI B as they did not exist yet 
                topo_ord: inst_idx.into(),
                quantifier: match_.kind.quant_idx().and_then(|q| parser[q].kind.name()).map(|s| parser.strings[s].into()),
                orig_graph_idx: NodeIndex::default(),
            });
            // then add all edges to previous instantiation nodes 
            for (kind, from) in match_
                .due_to_terms()
                .filter_map(|(kind, e)| parser[e].created_by.map(|c| (kind, c)))
            {
                self.add_edge(from, inst_idx, kind);
            }
            // add all equality edges from this instantiation to the equality-nodes representing 
            // the equalities this instantiation created 
            for (from, to) in &inst.yields_equalities 
            {
                self.add_eq_edge_from_inst(inst_idx, EqualityNode::from(from, to));
                // since from = to has now been explained, must add it to the equality-graph
                // self.equalities.add_equality(*from, *to);
            }
            for eq in match_.due_to_equalities() 
            {
                match eq {
                    NodeEquality::Leaf(LeafEquality(lhs, rhs)) => self.add_eq_edge_to_inst(EqualityNode::from(lhs, rhs), inst_idx),
                    NodeEquality::Node(lhs, rhs, eqs) => {
                        self.add_eq_edge_to_inst(EqualityNode::from(lhs, rhs), inst_idx);
                        for eq in eqs {
                            self.add_equalities(lhs, rhs, eq);
                        }
                    }
                }
                // add equality edges from the blamed equalities obtained in the [new-match] of this instantiation 
                // to the instantiation node
                // self.add_eq_edge_to_inst(EqualityNode::from(from, to), inst_idx);
                // // must explain the blamed equalities 
                // for (lhs, rhs) in self.equalities.blamed_equalities(from, to) {
                //     self.add_eq_edge(EqualityNode::from(&lhs, &rhs), EqualityNode::from(from, to));
                // }
                // // since from = to has now been explained, must add it to the equality-graph
                // self.equalities.add_equality(*from, *to);
            }
        }
        // precompute number of children and parents of each node
        for idx in self.orig_graph.node_indices() {
            let child_count = self.orig_graph.neighbors_directed(idx, Outgoing).count();
            let parent_count = self.orig_graph.neighbors_directed(idx, Incoming).count();
            self.orig_graph.node_weight_mut(idx).unwrap().set_child_count_to(child_count);
            self.orig_graph.node_weight_mut(idx).unwrap().set_parent_count_to(parent_count);
        }
        // precompute the cost-rank of all nodes by sorting the node_indices by our cost-order
        // in descending order and then assigning the rank to each node
        // Our cost-order is defined as follows:
        // inst_b > inst_a iff (cost_b > cost_a or (cost_b = cost_a and line_nr_b < line_nr_a))
        // This is a total order since the line numbers are always guaranteed to be distinct
        // integers.
        let mut cost_ranked_node_indices: Vec<_> = self.orig_graph.node_weights_mut().flat_map(|n| n.inner_mut_inst()).collect();
        let cost_order = |node_a: &&mut InstNode, node_b: &&mut InstNode| {
            node_a.cost.partial_cmp(&node_b.cost).map(Ordering::reverse).unwrap_or(Ordering::Equal)
        };
        cost_ranked_node_indices.sort_by(cost_order);
        self.cost_ranked_node_indices = cost_ranked_node_indices.iter().map(|n| n.inst_idx).collect();
        for (i, node) in cost_ranked_node_indices.into_iter().enumerate() {
            node.cost_rank = i;
        }
        // precompute BFS depth such that we can filter the graph up to some specified depth
        let roots: Vec<NodeIndex> = self
            .orig_graph
            .node_indices()
            .filter(|nx| self.orig_graph.node_weight(*nx).unwrap().parent_count() == 0)
            .collect();
        for root in roots {
            let mut bfs = Bfs::new(&self.orig_graph, root);
            while let Some(nx) = bfs.next(&self.orig_graph) {
                let parents = self.orig_graph.neighbors_directed(nx, Incoming);
                let min_parent_depth = parents
                    .filter_map(|parent| self.orig_graph.node_weight(parent).unwrap().min_depth())
                    .min();
                if let Some(depth) = min_parent_depth {
                    self.orig_graph[nx].set_min_depth_to(Some(depth + 1));
                } else {
                    // the min_depth is None iff the node at nx has no parents, hence we set the depth to 0
                    self.orig_graph[nx].set_min_depth_to(Some(0));
                }
            }
        }
        // precompute the branching-rank of all nodes by sorting the node_indices by our branching-order
        // in descending order and then assigning the rank to each node
        // Our branching-order is defined as follows:
        // inst_b > inst_a iff (child_count(b) > child_count(a) or (child_count(b) = child_count(a) and line_nr_b < line_nr_a))
        // This is a total order since the line numbers are always guaranteed to be distinct
        // integers.
        let mut branching_ranked_node_indices: Vec<_> = self.orig_graph.node_weights_mut().flat_map(|n| n.inner_mut_inst()).collect();
        let branching_order = |node_a: &&mut InstNode, node_b: &&mut InstNode| {
            node_a.child_count.cmp(&node_b.child_count).reverse()
        };
        branching_ranked_node_indices.sort_by(branching_order);
        self.branching_ranked_node_indices = branching_ranked_node_indices.iter().map(|n| n.inst_idx).collect();
        for (i, node) in branching_ranked_node_indices.into_iter().enumerate() {
            node.branching_rank = i;
        }
        // compute the longest distances from root nodes by traversing the graph in topological order
        // and taking max distance among parents + 1. Needed to compute longest paths through selected
        // nodes
        // root nodes (i.e., nodes without parents) have distance 0
        for node in self.orig_graph.node_indices() {
            let max_parent_depth = self
                .orig_graph
                .neighbors_directed(node, Incoming)
                .map(|nx| self.orig_graph.node_weight(nx).unwrap().max_depth())
                .max();
            if let Some(depth) = max_parent_depth {
                let node_weight = self.orig_graph.node_weight_mut(node).unwrap();
                node_weight.set_max_depth_to(depth + 1);
            }
        }
        // efficiently compute transitive closure with a vector of FixedBitSet's
        self.tr_closure = vec![RoaringBitmap::new(); self.orig_graph.node_count()];
        // note that we are storing the bitsets's of each node index in topological order!
        let mut bitsets = self.tr_closure.as_mut_slice();
        let mut nodes_in_reverse_topo_ord = self.orig_graph.node_indices().rev();
        while let Some((last, others)) = bitsets.split_last_mut() {
            if let Some(nx) = nodes_in_reverse_topo_ord.next() {
                last.insert(nx.index() as u32);
                for pred in self.orig_graph.neighbors_directed(nx, Incoming) {
                    let pred_topo_ord = self.orig_graph.node_weight(pred).unwrap().topo_ord();
                    let pred_bitset = others.get_mut(pred_topo_ord).unwrap();
                    *pred_bitset |= &*last;
                }
            }
            bitsets = others;
        }
        self.visible_graph = self.orig_graph.map(
            |_, n| n.clone(),
            |orig_graph_idx, e| EdgeType::Direct {
                kind: e.clone(),
                orig_graph_idx,
            },
        )
    }

    fn add_equalities(&mut self, child_from: &ENodeIdx, child_to: &ENodeIdx, curr: &NodeEquality) {
        match curr {
            NodeEquality::Leaf(LeafEquality(lhs, rhs)) => self.add_eq_edge(EqualityNode::from(&lhs, &rhs), EqualityNode::from(&child_from, &child_to)),
            NodeEquality::Node(lhs, rhs, parent_eqs) => {
                self.add_eq_edge(EqualityNode::from(&lhs, &rhs), EqualityNode::from(child_from, child_to));
                for parent_eq in parent_eqs {
                    self.add_equalities(&lhs, &rhs, parent_eq);
                }
            },
        }
    }

    fn add_inst_node(&mut self, node_data: InstNode) {
        let inst_idx = node_data.inst_idx;
        let node = self.orig_graph.add_node(Node::Inst(node_data));
        // log!(format!("Processing inst with node index {}", node.index()));
        let ins_idx = self.node_of_inst_idx.push_and_get_key(node);
        assert_eq!(ins_idx, inst_idx);
        // store original node-index in each node
        // self.inst_graph.node_weight_mut(node).unwrap().orig_graph_idx = node;
        // store original node-idx such that when we compute reachability, we
        // can use the old indices.
        // this is necessary since filtering out nodes will changes node-indices
        // Also, using StableGraph where node-indices stay stable across removals
        // is not viable here since StableGraph does not implement NodeCompactIndexable
        // which is needed for petgraph::algo::tred::dag_to_toposorted_adjacency_list
        self.orig_graph[node].set_orig_graph_idx_to(node);
    }

    // fn add_eq_node(&mut self, node_data: EqualityNode) -> NodeIndex {
    // fn add_eq_node(&mut self, from: ENodeIdx, to: ENodeIdx) -> Option<NodeIndex> {
    //     if from != to {
    //         let node_data = EqualityNode::from(from, to);
    //         let node_data_rev = EqualityNode::from(to, from);
    //         if let Some(nx) = self.node_idx_of_eq.get(&node_data) {
    //             Some(*nx)
    //         } else {
    //             let node = self.orig_graph.add_node(Node::Equality(node_data));
    //             self.orig_graph[node].set_orig_graph_idx_to(node);
    //             self.node_idx_of_eq.insert(node_data, node);
    //             self.node_idx_of_eq.insert(node_data_rev, node);
    //             Some(node)
    //         }
    //     } else {
    //         None
    //     }
    // }

    fn add_eq_node(&mut self, eq: EqualityNode) -> NodeIndex {
        if let Some(nx) = self.node_idx_of_eq.get(&eq) {
            *nx
        } else {
            let nx = self.orig_graph.add_node(Node::Equality(eq));
            self.orig_graph[nx].set_orig_graph_idx_to(nx);
            self.node_idx_of_eq.insert(eq, nx);
            nx
        }
    }

    fn add_edge(&mut self, from: InstIdx, to: InstIdx, blame: &BlameKind) {
        self.orig_graph.add_edge(self.node_of_inst_idx[from], self.node_of_inst_idx[to], blame.clone());
    }

    fn add_eq_edge_to_inst(&mut self, eq: EqualityNode, to: InstIdx) {
        let to = self.node_of_inst_idx[to];
        let eq_nx = self.add_eq_node(eq);
        // TODO: fix
        self.orig_graph.update_edge(eq_nx, to, BlameKind::Equality { eq: ENodeIdx::from(0) });
    }

    fn add_eq_edge_from_inst(&mut self, from: InstIdx, eq: EqualityNode) {
        let from = self.node_of_inst_idx[from];
        let eq_nx = self.add_eq_node(eq);
        // TODO: fix
        self.orig_graph.update_edge(from, eq_nx, BlameKind::Equality { eq: ENodeIdx::from(0) });
    }

    fn add_eq_edge(&mut self, from: EqualityNode, to: EqualityNode) {
        let from_nx = self.add_eq_node(from);
        let to_nx = self.add_eq_node(to);
        // TODO: fix
        self.orig_graph.update_edge(from_nx, to_nx, BlameKind::Equality { eq: ENodeIdx::from(0) });
    }

    pub fn get_node_info_map(&self) -> NodeInfoMap {
        let mut node_info_map = FxHashMap::default();
        let mut eq_info_map = FxHashMap::default();
        for node_index in self.orig_graph.node_indices() {
            if let Node::Inst(ref inst) = self.orig_graph[node_index] {
                let InstNode { inst_idx, .. } = inst;
                node_info_map.insert(node_index, *inst_idx);
            } else {
                if let Node::Equality(eq) = &self.orig_graph[node_index] {
                    eq_info_map.insert(node_index, (eq.from, eq.to));
                }
            }
        }
        NodeInfoMap::from(node_info_map, eq_info_map)
    }

    pub fn get_edge_info_map(&self) -> EdgeInfoMap {
        let mut edge_info_map = FxHashMap::default(); 
        for edge_index in self.orig_graph.edge_indices() {
            let edge_data = &self.orig_graph[edge_index];
            let (from, to) = self.orig_graph.edge_endpoints(edge_index).unwrap();
            edge_info_map.insert(edge_index, (edge_data.clone(), (from, to)));
        }
        EdgeInfoMap::from(edge_info_map)
    }
}

#[derive(Clone, Debug)]
pub struct InstInfo {
    pub fingerprint: Fingerprint,
    pub inst_idx: InstIdx,
    pub resulting_term: Option<String>,
    pub z3_gen: Option<u32>,
    pub cost: f32,
    pub mkind: MatchKind,
    pub quant_discovered: bool,
    pub formula: String,
    pub pattern: Option<String>,
    pub yields_terms: Vec<String>,
    pub bound_terms: Vec<String>,
    pub blamed_terms: Vec<String>,
    pub equality_expls: Vec<String>,
    pub dep_instantiations: Vec<NodeIndex>,
    pub node_index: NodeIndex,
}

#[derive(Clone, Debug, PartialEq)]
pub struct EqualityInfo {
    pub equality: String,
    pub node_index: NodeIndex,
}

#[derive(Clone, Debug, PartialEq)]
pub enum NodeInfo {
    Inst(InstInfo),
    Equality(EqualityInfo),
}

impl NodeInfo {
    pub fn node_index(&self) -> NodeIndex {
        match self {
            NodeInfo::Inst(inst) => inst.node_index,
            NodeInfo::Equality(eq) => eq.node_index,
        }
    }

    pub fn mkind(&self) -> Option<&MatchKind> {
        match self {
            NodeInfo::Inst(inst) => Some(&inst.mkind),
            NodeInfo::Equality(_) => None,
        }
    }
    pub fn inst_info(&self) -> Option<&InstInfo> {
        match self {
            NodeInfo::Inst(inst) => Some(inst),
            NodeInfo::Equality(_) => None,
        }
    }
}

impl PartialEq for InstInfo {
    fn eq(&self, other: &Self) -> bool {
        self.inst_idx == other.inst_idx
    }
}

pub struct NodeInfoMap{
    inst_info_map: FxHashMap<NodeIndex, InstIdx>,
    eq_info_map: FxHashMap<NodeIndex, (ENodeIdx, ENodeIdx)>
} 

impl NodeInfoMap {

    fn from(inst_info_map: FxHashMap<NodeIndex, InstIdx>, eq_info_map: FxHashMap<NodeIndex, (ENodeIdx, ENodeIdx)>) -> Self {
        NodeInfoMap {
            inst_info_map,
            eq_info_map,
        } 
    }

    pub fn get_instantiation_info(
        &self,
        node_index: usize,
        parser: &Z3Parser,
        ignore_ids: bool,
    ) -> NodeInfo {
        let ctxt = DisplayCtxt {
            parser,

            display_term_ids: !ignore_ids,
            display_quantifier_name: false,
            use_mathematical_symbols: true,
        };
        if let Some(inst_idx) = self.inst_info_map.get(&NodeIndex::new(node_index)) {
            let inst = &parser.insts[*inst_idx];
            let match_ = &parser.insts[inst.match_];
            let pretty_blamed_terms = match_
                .due_to_terms()
                .map(|(_, eidx)| eidx.with(&ctxt).to_string())
                .collect::<Vec<String>>();
            let inst_info = InstInfo {
                fingerprint: inst.fingerprint,
                inst_idx: *inst_idx,
                resulting_term: inst
                    .get_resulting_term()
                    .map(|rt| rt.with(&ctxt).to_string()),
                z3_gen: inst.z3_generation,
                cost: inst.cost,
                mkind: match_.kind.clone(),
                quant_discovered: match_.kind.is_discovered(),
                formula: match_.kind.with(&ctxt).to_string(),
                pattern: match_.kind.pattern().map(|p| p.with(&ctxt).to_string()),
                yields_terms: inst
                    .yields_terms
                    .iter()
                    .map(|&tidx| format!("{}", tidx.with(&ctxt)))
                    .collect(),
                bound_terms: match_
                    .kind
                    .bound_terms(|e| e.with(&ctxt).to_string(), |t| t.with(&ctxt).to_string()),
                blamed_terms: pretty_blamed_terms,
                equality_expls: match_
                    .due_to_equalities()
                    .map(|eq| format!("{} = {}", eq.from().with(&ctxt).to_string(), eq.to().with(&ctxt).to_string()))
                    .collect(),
                dep_instantiations: Vec::new(),
                node_index: NodeIndex::new(node_index),
            };
            NodeInfo::Inst(inst_info)
        } else {
            let (from_idx, to_idx) = self.eq_info_map.get(&NodeIndex::new(node_index)).unwrap();
            let pretty_equality = format!("{} = {}", parser[*from_idx].owner.with(&ctxt), parser[*to_idx].owner.with(&ctxt));
            let eq_info = EqualityInfo {
                equality: pretty_equality,
                node_index: NodeIndex::new(node_index),
            };
            NodeInfo::Equality(eq_info)
        }
    }
}


#[derive(Clone)]
pub struct EdgeInfo {
    pub edge_data: BlameKind,
    pub orig_graph_idx: EdgeIndex,
    pub blame_term: String,
    pub from: NodeIndex,
    pub to: NodeIndex,
}

impl PartialEq for EdgeInfo {
    fn eq(&self, other: &Self) -> bool {
        self.orig_graph_idx == other.orig_graph_idx
    }
}

pub struct EdgeInfoMap(FxHashMap<EdgeIndex, (BlameKind, (NodeIndex, NodeIndex))>); 

impl EdgeInfoMap {

    fn from(map: FxHashMap<EdgeIndex, (BlameKind, (NodeIndex, NodeIndex))>) -> Self {
        EdgeInfoMap(map)
    }

    pub fn get_edge_info(
        &self,
        edge_index: EdgeIndex,
        parser: &Z3Parser,
        ignore_ids: bool,
    ) -> EdgeInfo {
        let (edge_data, (from, to)) = self.0.get(&edge_index).unwrap();
        let ctxt = DisplayCtxt {
            parser,

            display_term_ids: !ignore_ids,
            display_quantifier_name: false,
            use_mathematical_symbols: true,
        };
        let blame_term = if let Some(blame_term_idx) = edge_data.get_blame_node() {
            blame_term_idx.with(&ctxt).to_string()
        } else {
            String::new()
        };
        // let blame_term = blame_term_idx.with(&ctxt).to_string();
        EdgeInfo {
            edge_data: edge_data.clone(),
            orig_graph_idx: edge_index,
            blame_term,
            from: *from,
            to: *to,
        }
    }
}

// mod equalities {
//     use petgraph::algo::dijkstra;
//     use super::*;

//     #[derive(Default, Clone)]
//     pub struct EqualityGraph {
//         graph: UnGraph<ENodeIdx, ()>,
//         node_idx_of_weight: FxHashMap<ENodeIdx, NodeIndex>,
//     }

//     impl EqualityGraph {
//         fn add_node(&mut self, weight: ENodeIdx) -> NodeIndex {
//             if let Some(idx) = self.node_idx_of_weight.get(&weight) {
//                 *idx
//             } else {
//                 let nx = self.graph.add_node(weight);
//                 self.node_idx_of_weight.insert(weight, nx);
//                 nx
//             }
//         }
//         pub fn add_equality(&mut self, from: ENodeIdx, to: ENodeIdx) {
//             let from_idx = self.add_node(from);
//             let to_idx = self.add_node(to);
//             self.graph.update_edge(from_idx, to_idx, ());
//         }
//         pub fn blamed_equalities(&mut self, from: &ENodeIdx, to: &ENodeIdx) -> Vec<(ENodeIdx, ENodeIdx)> {
//             let mut blamed_eqs = Vec::new();
//             if let (Some(from), Some(to)) = (self.node_idx_of_weight.get(from), self.node_idx_of_weight.get(to)) {
//                 let shortest_path_lengths = dijkstra(&self.graph, *from, Some(*to), |_| 1);
//                 let mut curr = *to;
//                 let mut curr_dist = *shortest_path_lengths.get(&curr).unwrap();
//                 while let Some(ref node) = self.graph
//                 .neighbors(curr)
//                 .filter(|nx| if let Some(&dist) = shortest_path_lengths.get(nx) { dist == curr_dist - 1 } else { false })
//                 .next() {
//                     let curr_eq = self.graph.node_weight(curr).unwrap();
//                     let node_eq = self.graph.node_weight(*node).unwrap();
//                     blamed_eqs.push((*node_eq, *curr_eq));
//                     curr = node.clone();
//                     curr_dist = curr_dist - 1;
//                 }
//             }
//             // need to check that the blamed equality is not the same as from = to. 
//             // if that's the case we should just return an empty vector
//             if blamed_eqs.len() > 1 {
//                 blamed_eqs
//             } else {
//                 vec![]
//             }
//         }
//     }
// }