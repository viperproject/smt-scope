mod cdcl;
mod dependencies;
mod generalise;
mod graph;
mod misc;
mod proofs;
mod redundancy;

pub use cdcl::*;
pub use dependencies::*;
pub use graph::*;
pub use misc::*;
pub use proofs::*;
pub use redundancy::*;

use crate::Z3Parser;

pub struct AllAnalyses<'a> {
    pub log_info: LogInfo,
    pub cdcl_info: CdclAnalysis,
    pub redundancy: RedundancyAnalysis<'a>,
    pub inst_graph: InstGraph,
    pub quant_info: QuantifierAnalysis,
    pub proof_info: ProofAnalysis,
}

/// Run all available analyses. Used for testing.
pub fn run_all(parser: &Z3Parser) -> AllAnalyses<'_> {
    let log_info = LogInfo::new(parser);
    let cdcl_info = CdclAnalysis::new(parser);
    let redundancy = RedundancyAnalysis::new(parser);
    let inst_graph = InstGraph::new(parser).unwrap();
    let quant_info = QuantifierAnalysis::new(parser, &inst_graph);
    let proof_info = ProofAnalysis::new(parser, &inst_graph);
    AllAnalyses {
        log_info,
        cdcl_info,
        redundancy,
        inst_graph,
        quant_info,
        proof_info,
    }
}
