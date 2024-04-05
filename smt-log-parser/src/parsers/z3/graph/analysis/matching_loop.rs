use crate::parsers::z3::graph::InstGraph;
use super::NodeIndex;


impl InstGraph {
    pub fn search_matching_loops(&mut self) -> usize {
        let n = 6.min(self.raw.graph.node_count());
        let end_nodes = self.raw.graph.node_indices().take(n).collect::<Vec<NodeIndex>>();
        self.analysis.matching_loop_end_nodes = Some(end_nodes); 
        n
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }

    pub fn get_nth_matching_loop_end_node(&self, n: usize) -> Option<&NodeIndex> {
        if let Some(nodes) = &self.analysis.matching_loop_end_nodes {
            nodes.get(n)
        } else {
            None
        }
    }
} 