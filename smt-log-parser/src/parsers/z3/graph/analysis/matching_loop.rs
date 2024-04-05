use std::rc::Rc;

use fxhash::FxHashSet;
use petgraph::Direction::Outgoing;

use crate::{parsers::z3::graph::{raw::{Node, NodeKind}, InstGraph}, Z3Parser};
use super::NodeIndex;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: Rc<Z3Parser>) -> usize {
        // dummy default code to test GUI
        // let n = 6.min(self.raw.graph.node_count());
        // let end_nodes = self.raw.graph.node_indices().rev().take(n).collect::<Vec<NodeIndex>>();
        // self.analysis.matching_loop_end_nodes = Some(end_nodes); 
        // n
        let quants: FxHashSet<_> = self
            .raw
            .graph
            .node_weights()
            .filter_map(|node| if let NodeKind::Instantiation(inst) = node.kind() { Some(inst) } else { None })
            // .flat_map(|node| node.mkind.quant_idx())
            .flat_map(|inst| parser[parser[*inst].match_].kind.quant_idx())
            .collect();

        let mut matching_loop_nodes_per_quant: Vec<FxHashSet<NodeIndex>> = Vec::new();
        for quant in quants {
            // log!(format!("Processing quant {}", quant));
            self.raw.reset_visibility_to(true);
            self.raw.set_visibility_when(false, |_: NodeIndex, node: &Node| node.kind().inst().is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == Some(quant)));
            let mut visible_graph = self.to_visible();
            let matching_loops = visible_graph.find_longest_paths();
            matching_loop_nodes_per_quant.push(matching_loops);
        }
        self.raw.reset_visibility_to(true);
        let ml_nodes = matching_loop_nodes_per_quant
            .iter()
            .flat_map(|ml| ml.iter().cloned());
        self.raw.set_visibility_many(false, ml_nodes);
        // for matching_loop in matching_loop_nodes_per_quant {
        //     for node in matching_loop {
        //         self.raw.graph[node].set_visibility_to(true);
        //     }
        // }
        self.analysis.matching_loop_subgraph = self.to_visible();
        // for displaying the nth longest matching loop later on, we want to compute the end nodes of all the matching loops
        // and sort them by max-depth in descending order
        self.analysis.matching_loop_subgraph.compute_longest_distances_from_roots();
        // compute end-nodes of matching loops 
        let mut matching_loop_end_nodes: Vec<_> = self.analysis.matching_loop_subgraph 
            .graph
            .node_indices()
            // only keep end-points of matching loops, i.e., nodes without any children in the matching loop subgraph
            .filter(|nx| self.analysis.matching_loop_subgraph.graph.neighbors_directed(*nx, Outgoing).count() == 0)
            .collect();
        // sort the matching loop end-nodes by the max-depth
        matching_loop_end_nodes.sort_unstable_by(|node_a, node_b| {
            let max_depth_node_a = self.analysis.matching_loop_subgraph.graph.node_weight(*node_a).unwrap().max_depth;
            let max_depth_node_b = self.analysis.matching_loop_subgraph.graph.node_weight(*node_b).unwrap().max_depth;
            if max_depth_node_a < max_depth_node_b {
                std::cmp::Ordering::Greater
            } else {
                std::cmp::Ordering::Less
            }
        });
        matching_loop_end_nodes = matching_loop_end_nodes.iter().map(|nidx| self.analysis.matching_loop_subgraph.graph[*nidx].idx).collect();
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = matching_loop_end_nodes.len();
        self.analysis.matching_loop_end_nodes = Some(matching_loop_end_nodes);
        // self.generalized_terms.resize(nr_matching_loop_end_nodes, None);
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }
} 