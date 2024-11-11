mod analysis;
mod explain;
mod node;
mod search;
mod signature;

pub use analysis::*;
pub use node::*;
pub use signature::*;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::Graph;

pub const MIN_MATCHING_LOOP_LENGTH: u32 = 6;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
pub struct MlExplanation {
    pub graph: Graph<MLGraphNode, MLGraphEdge>,
}
