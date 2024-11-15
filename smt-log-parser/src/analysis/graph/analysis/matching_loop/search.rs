use crate::{
    analysis::{
        analysis::matching_loop::MlAnalysis, raw::NodeKind, visible::VisibleEdge, InstGraph,
    },
    items::{GraphIdx, InstIdx, TermIdx, TimeRange},
    Z3Parser,
};

use super::{MatchingLoop, MlOutput, MIN_MATCHING_LOOP_LENGTH};

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: &mut Z3Parser) -> usize {
        let currently_disabled_nodes = self.disabled_nodes();
        self.reset_disabled_to(parser, |_, _| false);

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
        let topo = self.topo_analysis(&mut analysis);
        let topo = topo
            .into_iter_enumerated()
            .filter_map(|(i, v)| self.raw[i].kind().inst().map(|i| (i, v)))
            .collect();
        let analysis = analysis.finalise(&topo, MIN_MATCHING_LOOP_LENGTH);
        let ml_data = analysis.ml_graphs(parser);
        let mls = ml_data.matching_loops.len();
        for (i, ml) in ml_data.matching_loops.iter().enumerate() {
            let mut last = None;
            for &member in ml.members.iter() {
                self.raw[member].part_of_ml.insert(i);
                if let Some(last) = last.replace(member) {
                    for between in MlOutput::others_between(&topo, member, last) {
                        self.raw[between].part_of_ml.insert(i);
                    }
                }
            }
        }
        self.analysis.ml_data = Some(ml_data);

        // self.raw.reset_visibility_to(true);
        // self.raw
        //     .set_visibility_many(false, analysis.ml_nodes.iter().copied());
        // let long_paths_subgraph = self.to_visible_opt();

        // // We sort the leaves from highest to lowest max depth, using earlier
        // // indices for ties.
        // let mut long_path_leaves: Vec<_> = analysis.leaves().cloned().collect();
        // long_path_leaves.sort_unstable_by(|(a_sig, a_gen_leaves, a_ungen_leaves), (b_sig, b_gen_leaves, b_ungen_leaves)| {
        //     (b_gen_leaves[0].0, b_ungen_leaves[0].0, a_sig).cmp(&(a_gen_leaves[0].0, a_ungen_leaves[0].0, b_sig))
        // });

        // let long_path_leaves_sub_idx: Vec<_> = long_path_leaves
        //     .iter()
        //     .map(|(_, gen_leaves, ungen_leaves)| {
        //         long_paths_subgraph
        //             .reverse(gen_leaves.get(0).unwrap_or_else(|| &ungen_leaves[0]).1.index(&self.raw))
        //             .unwrap()
        //     })
        //     .collect();

        // // assign to each node in a matching loop which matching loops it belongs to, i.e., if a node is part of the
        // // i-th longest matching loop, it stores the index i-1. Do this, by doing a reverse-DFS from all ML end nodes
        // for (i, end_node) in long_path_leaves_sub_idx.iter().enumerate() {
        //     let mut nodes = Vec::new();

        //     let mut dfs = Dfs::new(Reversed(&long_paths_subgraph.graph), end_node.0);
        //     while let Some(nx) = dfs.next(Reversed(&long_paths_subgraph.graph)) {
        //         let orig_nx = long_paths_subgraph.graph[nx].idx;
        //         self.raw[orig_nx].part_of_ml.insert(i);
        //         nodes.push(orig_nx);
        //     }

        //     // // compute the ML graph for the potential matching loop
        //     // let ml_graph = self.compute_nth_matching_loop_graph(nodes, parser);
        //     // self.analysis.matching_loop_graphs.push(ml_graph);
        // }
        // // return the total number of potential matching loops
        // let nr_matching_loop_end_nodes = long_path_leaves.len();
        // self.analysis.matching_loop_end_nodes = Some(long_path_leaves);

        // make sure the enabled and disabled nodes stay the same as before calling the ML search
        self.reset_disabled_to(parser, |nx, _| currently_disabled_nodes.contains(&nx));
        mls
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

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis
            .ml_data
            .as_ref()
            .map(|mls| mls.matching_loops.len())
    }

    pub fn nth_matching_loop_graph(&mut self, n: usize) -> Option<MatchingLoop> {
        self.analysis
            .ml_data
            .as_ref()
            .and_then(|mls| mls.matching_loops.get(n))
            .cloned()
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
