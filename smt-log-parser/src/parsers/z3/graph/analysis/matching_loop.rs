use std::rc::Rc;

use fxhash::FxHashSet;
use petgraph::{visit::Dfs, Direction::Outgoing};

use crate::{parsers::z3::graph::{raw::{Node, NodeKind}, InstGraph}, Z3Parser};
use super::RawNodeIndex;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: Rc<Z3Parser>) -> usize {
        let currently_disabled_nodes = self.disabled_nodes();
        self.initialise_inst_succs_and_preds(&parser);
        // disable all nodes that do not correspond to QIs
        self.reset_disabled_to(&parser, |nx, g| !matches!(g[nx].kind(), NodeKind::Instantiation(_)));
        let quants: FxHashSet<_> = self
            .raw
            .graph
            .node_weights()
            .filter_map(|node| if let NodeKind::Instantiation(inst) = node.kind() { Some(inst) } else { None })
            .flat_map(|inst| parser[parser[*inst].match_].kind.quant_idx())
            .collect();
        let mut matching_loop_nodes_per_quant: Vec<FxHashSet<RawNodeIndex>> = Vec::new();
        for quant in quants {
            self.raw.reset_visibility_to(true);
            self.raw.set_visibility_when(false, |_: RawNodeIndex, node: &Node| node.kind().inst().is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == Some(quant)));
            let mut visible_graph = self.to_visible_simplified();
            let matching_loops = visible_graph.find_end_nodes_of_longest_paths();
            matching_loop_nodes_per_quant.push(matching_loops);
        }
        self.raw.reset_visibility_to(true);
        let ml_nodes = matching_loop_nodes_per_quant
            .iter()
            .flat_map(|ml| ml.iter().cloned());
        self.raw.set_visibility_many(false, ml_nodes);
        let mut matching_loop_subgraph = self.to_visible_simplified();
        // for displaying the nth longest matching loop later on, we want to compute the end nodes of all the matching loops
        // and sort them by max-depth in descending order
        matching_loop_subgraph.compute_longest_distances_from_roots();
        // compute end-nodes of matching loops 
        let mut matching_loop_end_nodes: Vec<_> = matching_loop_subgraph 
            .graph
            .node_indices()
            // only keep end-points of matching loops, i.e., nodes without any children in the matching loop subgraph
            .filter(|nx| {
                matching_loop_subgraph.graph.neighbors_directed(*nx, Outgoing).count() == 0
            })
            .collect();
        // sort the matching loop end-nodes by the max-depth
        matching_loop_end_nodes.sort_unstable_by(|node_a, node_b| {
            let max_depth_node_a = matching_loop_subgraph.graph.node_weight(*node_a).unwrap().max_depth;
            let max_depth_node_b = matching_loop_subgraph.graph.node_weight(*node_b).unwrap().max_depth;
            if max_depth_node_a < max_depth_node_b {
                std::cmp::Ordering::Greater
            } else {
                std::cmp::Ordering::Less
            }
        });
        // assign to each node in a matching loop which matching loops it belongs to, i.e., if a node is part of the 
        // i-th longest matching loop, it stores the index i-1. Do this, by doing a reverse-DFS from all ML end nodes 
        for (i, end_node) in matching_loop_end_nodes.iter().enumerate() {
            let mut dfs = Dfs::new(petgraph::visit::Reversed(&matching_loop_subgraph.graph), *end_node);
            while let Some(nx) = dfs.next(petgraph::visit::Reversed(&matching_loop_subgraph.graph)) {
                let orig_nx = matching_loop_subgraph.graph[nx].idx.0;
                self.raw.graph[orig_nx].part_of_ML.insert(i);
            }
        }
        // collect all matching loop end nodes
        let matching_loop_end_nodes_raw_indices: Vec<RawNodeIndex> = matching_loop_end_nodes
            .iter()
            .map(|nidx| matching_loop_subgraph.graph[*nidx].idx)
            .collect();
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = matching_loop_end_nodes_raw_indices.len();
        self.analysis.matching_loop_end_nodes = Some(matching_loop_end_nodes_raw_indices);
        // make sure the enabled and disabled nodes stay the same as before calling the ML search 
        self.reset_disabled_to(&parser, |nx, _| currently_disabled_nodes.contains(&nx));
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }
} 