mod cdcl;
mod dependencies;
mod generalise;
mod graph;
mod misc;
mod proofs;

pub use cdcl::*;
pub use dependencies::*;
pub use graph::*;
pub use misc::*;
pub use proofs::*;

use crate::Z3Parser;

/// Run all available analyses. Used for testing.
pub fn run_all(parser: &Z3Parser) -> InstGraph {
    let _log_info = LogInfo::new(parser);
    let _cdcl_info = CdclAnalysis::new(parser);
    let inst_graph = InstGraph::new(parser).unwrap();
    let _quant_info = QuantifierAnalysis::new(parser, &inst_graph);
    let _proof_info = ProofAnalysis::new(parser, &inst_graph);
    inst_graph
}
