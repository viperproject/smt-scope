use mem_dbg::{MemDbg, MemSize};

use crate::{items::GraphIdx, Result, TiVec, Z3Parser};

use self::{analysis::Analysis, raw::RawInstGraph, subgraph::Subgraph, visible::VisibleInstGraph};

// TODO: once the ML algo is reimplemented, delete this
// pub mod inst_graph;
pub mod generalise;
pub mod hide;
pub mod disable;
pub mod visible;
pub mod raw;
pub mod subgraph;
pub mod analysis;

pub use raw::{RawNodeIndex, RawEdgeIndex};
pub use visible::{VisibleNodeIndex, VisibleEdgeIndex};

#[derive(Debug, MemSize, MemDbg)]
pub struct InstGraph {
    pub raw: RawInstGraph,
    pub subgraphs: TiVec<GraphIdx, Subgraph>,
    pub analysis: Analysis,
}

impl InstGraph {
    pub fn new(parser: &Z3Parser) -> Result<Self> {
        let mut raw = RawInstGraph::new(parser)?;
        let subgraphs = raw.partition()?;
        let analysis = Analysis::new(raw.graph.node_indices().map(RawNodeIndex))?;
        let mut self_ = InstGraph { raw, subgraphs, analysis };
        self_.initialise_default(parser);
        Ok(self_)
    }

    pub fn visible_unchanged(&self, old: &VisibleInstGraph) -> bool {
        self.raw.stats.generation == old.generation
    }

}

#[macro_export]
macro_rules! graph_idx {
    ($mod_name:ident, $node:ident, $edge:ident, $inner:ident) => {
        mod $mod_name {
            use crate::idx;
            use petgraph::graph::IndexType;
            use mem_dbg::{MemDbg, MemSize};
            use serde::{Deserialize, Serialize};
            use std::fmt;
            use std::num::NonZeroUsize;
            use mem_dbg::*;

            idx!($inner, "ix{}");
            impl Default for $inner {
                fn default() -> Self {
                    Self::from(0)
                }
            }
            unsafe impl IndexType for $inner {
                fn new(x: usize) -> Self {
                    Self::from(x)
                }
                fn index(&self) -> usize {
                    usize::from(*self)
                }
                fn max() -> Self {
                    Self::from(usize::MAX - 1)
                }
            }
            #[derive(Debug, Copy, Clone, Default, PartialEq, PartialOrd, Eq, Ord, Hash)]
            pub struct $node(pub petgraph::graph::NodeIndex<$inner>);
            #[derive(Debug, Copy, Clone, Default, PartialEq, PartialOrd, Eq, Ord, Hash)]
            pub struct $edge(pub petgraph::graph::EdgeIndex<$inner>);
            
            impl MemDbgImpl for $node where {}
            impl MemSize for $node where {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            impl CopyType for $node {
                type Copy = True;
            }
            impl MemDbgImpl for $edge where {}
            impl MemSize for $edge where {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            impl CopyType for $edge {
                type Copy = True;
            }
        }
        pub use $mod_name::{$node, $edge, $inner};
    };
}
