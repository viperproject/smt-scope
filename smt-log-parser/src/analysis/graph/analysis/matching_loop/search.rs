use crate::{
    analysis::{
        analysis::matching_loop::MlAnalysis, raw::NodeKind, visible::VisibleEdge, InstGraph,
    },
    items::{GraphIdx, InstIdx, QuantIdx, TermIdx, TimeRange},
    Z3Parser,
};

use super::{MatchingLoop, MlData, MlOutput, MIN_MATCHING_LOOP_LENGTH};

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: &mut Z3Parser) -> &MlData {
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

        // make sure the enabled and disabled nodes stay the same as before calling the ML search
        self.reset_disabled_to(parser, |nx, _| currently_disabled_nodes.contains(&nx));
        self.analysis.ml_data.as_ref().unwrap()
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

    fn matching_loops(&self) -> Option<&MlData> {
        self.analysis.ml_data.as_ref()
    }

    pub fn found_matching_loops(&self) -> Option<(usize, usize)> {
        self.matching_loops()
            .map(|mls| (mls.sure_mls, mls.maybe_mls))
    }

    pub fn found_sure_matching_loop_graphs(&self) -> Option<usize> {
        self.matching_loops().map(|mls| mls.sure_mls)
    }

    pub fn quants_per_matching_loop(&self) -> Option<impl Iterator<Item = QuantIdx> + '_> {
        self.matching_loops().map(|mls| {
            mls.matching_loops
                .iter()
                .map(|ml| mls.signatures[ml.sig].quantifier)
        })
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
