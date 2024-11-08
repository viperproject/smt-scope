#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{items::GraphIdx, Result, TiVec, Z3Parser};

use self::{analysis::Analysis, raw::RawInstGraph, subgraph::Subgraph, visible::VisibleInstGraph};

// TODO: once the ML algo is reimplemented, delete this
// pub mod inst_graph;
pub mod analysis;
pub mod disable;
pub mod generalise;
pub mod hide;
pub mod raw;
pub mod subgraph;
pub mod visible;

pub use raw::{RawEdgeIndex, RawNodeIndex};
pub use visible::{VisibleEdgeIndex, VisibleNodeIndex};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
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
        let mut self_ = InstGraph {
            raw,
            subgraphs,
            analysis,
        };
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
            #[cfg(feature = "mem_dbg")]
            use mem_dbg::*;
            use petgraph::graph::IndexType;
            use std::fmt;
            use $crate::idx;

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
                    Self::MAX
                }
            }
            #[derive(Debug, Copy, Clone, Default, PartialEq, PartialOrd, Eq, Ord, Hash)]
            pub struct $node(pub petgraph::graph::NodeIndex<$inner>);
            #[derive(Debug, Copy, Clone, Default, PartialEq, PartialOrd, Eq, Ord, Hash)]
            pub struct $edge(pub petgraph::graph::EdgeIndex<$inner>);

            #[cfg(feature = "mem_dbg")]
            impl MemDbgImpl for $node {}
            #[cfg(feature = "mem_dbg")]
            impl MemSize for $node {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            #[cfg(feature = "mem_dbg")]
            impl CopyType for $node {
                type Copy = True;
            }
            #[cfg(feature = "mem_dbg")]
            impl MemDbgImpl for $edge {}
            #[cfg(feature = "mem_dbg")]
            impl MemSize for $edge {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            #[cfg(feature = "mem_dbg")]
            impl CopyType for $edge {
                type Copy = True;
            }
        }
        pub use $mod_name::{$edge, $inner, $node};
    };
}
