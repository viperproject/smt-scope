use fxhash::FxHashSet;
use petgraph::visit::{Dfs, Reversed};

use crate::{
    analysis::{
        analysis::{matching_loop::MlAnalysis, MlEndNodes},
        raw::{IndexesInstGraph, NodeKind},
        visible::VisibleEdge,
        InstGraph,
    },
    items::{GraphIdx, InstIdx, TermIdx, TimeRange},
    Z3Parser,
};

use super::{MLGraphNode, MIN_MATCHING_LOOP_LENGTH};

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: &mut Z3Parser) -> usize {
        let currently_disabled_nodes = self.disabled_nodes();
        self.reset_disabled_to(parser, |_, _| false);

        let (mut long_path_leaves, long_path_nodes) = self.find_long_paths_per_quant(parser);
        self.raw.reset_visibility_to(true);
        self.raw
            .set_visibility_many(false, long_path_nodes.into_iter());
        let long_paths_subgraph = self.to_visible_opt();

        // We sort the leaves from highest to lowest max depth, using earlier
        // indices for ties.
        long_path_leaves.sort_unstable_by(|(a_sig, a_leaves), (b_sig, b_leaves)| {
            (b_leaves[0].0, a_sig).cmp(&(a_leaves[0].0, b_sig))
        });

        let long_path_leaves_sub_idx: Vec<_> = long_path_leaves
            .iter()
            .map(|(_, leaves)| {
                long_paths_subgraph
                    .reverse(leaves[0].1.index(&self.raw))
                    .unwrap()
            })
            .collect();

        // assign to each node in a matching loop which matching loops it belongs to, i.e., if a node is part of the
        // i-th longest matching loop, it stores the index i-1. Do this, by doing a reverse-DFS from all ML end nodes
        for (i, end_node) in long_path_leaves_sub_idx.iter().enumerate() {
            let mut dfs = Dfs::new(Reversed(&long_paths_subgraph.graph), end_node.0);
            while let Some(nx) = dfs.next(Reversed(&long_paths_subgraph.graph)) {
                let orig_nx = long_paths_subgraph.graph[nx].idx.0;
                self.raw.graph[orig_nx].part_of_ml.insert(i);
            }
        }
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = long_path_leaves.len();
        self.analysis.matching_loop_end_nodes = Some(long_path_leaves);

        // compute the ML graphs for all the potential matching loops
        self.analysis.matching_loop_graphs = (0..nr_matching_loop_end_nodes)
            .map(|n| self.compute_nth_matching_loop_graph(n, parser))
            .collect();

        // make sure the enabled and disabled nodes stay the same as before calling the ML search
        self.reset_disabled_to(parser, |nx, _| currently_disabled_nodes.contains(&nx));
        nr_matching_loop_end_nodes
    }

    fn has_n_overlapping_stacks(
        &self,
        parser: &Z3Parser,
        i: impl Iterator<Item = InstIdx>,
        n: u32,
    ) -> bool {
        let mut frames: Vec<_> = i
            .map(|inst| {
                (
                    self.raw[inst].subgraph.map(|s| s.0),
                    parser[parser[inst].frame].active,
                )
            })
            .collect();
        frames.sort_unstable();
        let mut frame_stack = Vec::<(GraphIdx, TimeRange)>::new();
        for (subgraph, frame) in frames {
            let Some(subgraph) = subgraph else {
                continue;
            };
            while let Some(last) = frame_stack.last() {
                if subgraph == last.0 && last.1.sorted_overlap(&frame) {
                    break;
                } else {
                    frame_stack.pop();
                }
            }
            frame_stack.push((subgraph, frame));
            if frame_stack.len() >= n as usize {
                return true;
            }
        }
        false
    }

    /// Per each quantifier, finds the nodes that are part paths of length at
    /// least `MIN_MATCHING_LOOP_LENGTH`. Additionally, returns a list of the
    /// endpoints of these paths.
    fn find_long_paths_per_quant(&mut self, parser: &Z3Parser) -> (MlEndNodes, FxHashSet<InstIdx>) {
        let signatures = self.collect_ml_signatures(parser);
        // Collect all signatures instantiated at least `MIN_MATCHING_LOOP_LENGTH` times
        let mut signatures: Vec<_> = signatures
            .into_iter()
            .filter_map(|(sig, insts)| {
                self.has_n_overlapping_stacks(
                    parser,
                    insts.iter().copied(),
                    MIN_MATCHING_LOOP_LENGTH,
                )
                .then_some((sig, insts))
            })
            .collect();
        // eprintln!("Found {} signatures", signatures.len());
        signatures.sort_unstable_by(|a, b| a.0.cmp(&b.0));

        let mut analysis = MlAnalysis::new(parser, signatures);
        self.topo_analysis(&mut analysis);
        analysis.finalise(MIN_MATCHING_LOOP_LENGTH)
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis
            .matching_loop_end_nodes
            .as_ref()
            .map(|mlen| mlen.len())
    }

    pub fn nth_matching_loop_graph(&mut self, n: usize) -> petgraph::Graph<MLGraphNode, ()> {
        if let Some(ml_graph) = self.analysis.matching_loop_graphs.get(n) {
            (**ml_graph).clone()
        } else {
            petgraph::Graph::default().clone()
        }
    }

    fn _get_blame_term(&self, edge: &VisibleEdge, parser: &Z3Parser) -> Option<TermIdx> {
        let kind = edge.kind(self);
        let node = &self.raw[self.raw.index(kind.blame(self))];
        match node.kind() {
            NodeKind::ENode(enode) => Some(parser[*enode].owner),
            NodeKind::GivenEquality(eq, _) => match parser[*eq] {
                crate::items::EqualityExpl::Literal { eq, .. } => Some(parser[eq].owner),
                _ => None,
            },
            _ => None,
        }
    }
}
