use std::rc::Rc;

use fxhash::FxHashSet;
use gloo_console::log;
use petgraph::Direction::Outgoing;

use crate::{display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt}, parsers::z3::graph::{raw::{Node, NodeKind}, InstGraph}, Z3Parser};
use super::RawNodeIndex;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: Rc<Z3Parser>) -> usize {
        // dummy default code to test GUI
        // let n = 6.min(self.raw.graph.node_count());
        // let end_nodes = self.raw.graph.node_indices().rev().take(n).collect::<Vec<NodeIndex>>();
        // self.analysis.matching_loop_end_nodes = Some(end_nodes); 
        // n
        let ctxt = DisplayCtxt {
            parser: &parser, 
            config: DisplayConfiguration {
            display_term_ids: false,
            display_quantifier_name: false,
            use_mathematical_symbols: true,
            html: true,
            // Set manually elsewhere
            enode_char_limit: 0,
            limit_enode_chars: false,
        }
        }; 
        // first disable all nodes that do not correspond to QIs
        self.initialise_inst_succs_and_preds(&parser);
        self.reset_disabled_to(&parser, |nx, g| !matches!(g[nx].kind(), NodeKind::Instantiation(_)));
        let quants: FxHashSet<_> = self
            .raw
            .graph
            .node_weights()
            .filter_map(|node| if let NodeKind::Instantiation(inst) = node.kind() { Some(inst) } else { None })
            // .flat_map(|node| node.mkind.quant_idx())
            .flat_map(|inst| parser[parser[*inst].match_].kind.quant_idx())
            .collect();
        let mut matching_loop_nodes_per_quant: Vec<FxHashSet<RawNodeIndex>> = Vec::new();
        for quant in quants {
            log!(format!("Processing quant {}", ctxt.parser[quant].kind.with(&ctxt).to_string()));
            self.raw.reset_visibility_to(true);
            self.raw.set_visibility_when(false, |_: RawNodeIndex, node: &Node| node.kind().inst().is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == Some(quant)));
            let mut visible_graph = self.to_visible_simplified();
            log!(format!("Visible graph has {} nodes and {} edges", visible_graph.graph.node_count(), visible_graph.graph.edge_count()));
            let matching_loops = visible_graph.find_end_nodes_of_longest_paths();
            matching_loop_nodes_per_quant.push(matching_loops);
        }
        log!(format!("There are {} matching loop end nodes", matching_loop_nodes_per_quant.len()));
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
        // self.analysis.matching_loop_subgraph = self.to_visible();
        log!(format!("Computing ML subgraph"));
        let mut matching_loop_subgraph = self.to_visible_simplified();
        log!(format!("Matching loop subgraph has {} nodes and {} edges", matching_loop_subgraph.graph.node_count(), matching_loop_subgraph.graph.edge_count()));
        // for displaying the nth longest matching loop later on, we want to compute the end nodes of all the matching loops
        // and sort them by max-depth in descending order
        matching_loop_subgraph.compute_longest_distances_from_roots();
        // compute end-nodes of matching loops 
        let mut matching_loop_end_nodes: Vec<_> = matching_loop_subgraph 
            .graph
            .node_indices()
            // only keep end-points of matching loops, i.e., nodes without any children in the matching loop subgraph
            .filter(|nx| {
                let node = &self.raw[matching_loop_subgraph.graph[*nx].idx];
                match node.kind() {
                    NodeKind::Instantiation(_) => log!(format!("Inst node has max_depth: {}", matching_loop_subgraph.graph[*nx].max_depth)),
                    _ => ()
                };
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
        let matching_loop_end_nodes_raw_indices: Vec<RawNodeIndex> = matching_loop_end_nodes
            .iter()
            .map(|nidx| matching_loop_subgraph.graph[*nidx].idx)
            .collect();
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = matching_loop_end_nodes_raw_indices.len();
        self.analysis.matching_loop_end_nodes = Some(matching_loop_end_nodes_raw_indices);
        // self.generalized_terms.resize(nr_matching_loop_end_nodes, None);
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }
} 