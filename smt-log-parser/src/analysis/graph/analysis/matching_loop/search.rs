use crate::{
    analysis::{analysis::matching_loop::MlAnalysis, InstGraph},
    items::{GraphIdx, InstIdx, QuantPat, TimeRange},
    Z3Parser,
};

use super::{
    MatchingLoop, MlData, MlSignature, MIN_MATCHING_LOOP_LENGTH, MIN_SUSPICIOUS_CHAIN_LENGTH,
};

impl InstGraph {
    /// Search for matching loops in the graph.
    pub fn search_matching_loops(&mut self, parser: &mut Z3Parser) -> &MlData {
        let signatures = MlSignature::collect_ml_signatures(parser);
        let min = MIN_MATCHING_LOOP_LENGTH.min(MIN_SUSPICIOUS_CHAIN_LENGTH);
        // Collect all signatures instantiated at least `min` times
        let mut signatures: Vec<_> = signatures
            .into_iter()
            .filter_map(|(sig, insts)| {
                self.has_n_overlapping_stacks(parser, insts.iter().copied(), min)
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
        let analysis =
            analysis.finalise(topo, MIN_MATCHING_LOOP_LENGTH, MIN_SUSPICIOUS_CHAIN_LENGTH);
        let ml_data = analysis.ml_graphs(parser);

        self.analysis.ml_data = Some(ml_data);
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
                    parser.get_frame(inst).active,
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

    pub fn quants_per_matching_loop(&self) -> Option<impl Iterator<Item = QuantPat> + '_> {
        self.matching_loops().map(|mls| {
            mls.matching_loops
                .iter()
                .map(|ml| mls.signatures[ml.sig].qpat)
        })
    }

    pub fn nth_matching_loop_graph(&self, n: usize) -> Option<&MatchingLoop> {
        self.analysis
            .ml_data
            .as_ref()
            .and_then(|mls| mls.matching_loops.get(n))
    }
}
