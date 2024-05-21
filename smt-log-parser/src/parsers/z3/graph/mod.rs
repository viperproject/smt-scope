#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{items::GraphIdx, Result, TiVec, Z3Parser};

use self::{analysis::Analysis, raw::{InstEdgeKind, InstNodeKind, ProofEdgeKind, ProofNodeKind, RawGraph}, subgraph::Subgraph, visible::VisibleGraph};

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

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Graph<N, E> {
    pub raw: RawGraph<N, E>,
    pub subgraphs: TiVec<GraphIdx, Subgraph>,
    pub analysis: Analysis,
}

impl Graph<InstNodeKind, InstEdgeKind> {
    pub fn new(parser: &Z3Parser) -> Result<Self> {
        let mut raw = RawGraph::<InstNodeKind, InstEdgeKind>::new(parser)?;
        let subgraphs = raw.partition()?;
        let analysis = Analysis::new(raw.graph.node_indices().map(RawNodeIndex))?;
        let mut self_ = Self { raw, subgraphs, analysis };
        self_.initialise_default(parser);
        Ok(self_)
    }

    pub fn visible_unchanged(&self, old: &VisibleGraph) -> bool {
        self.raw.stats.generation == old.generation
    }
}

impl Graph<ProofNodeKind, ProofEdgeKind> {
    pub fn new(parser: &Z3Parser) -> Result<Self> {
        let mut raw = RawGraph::<ProofNodeKind, ProofEdgeKind>::new(parser)?;
        let subgraphs = raw.partition()?;
        let analysis = Analysis::new(raw.graph.node_indices().map(RawNodeIndex))?;
        let mut self_ = Self { raw, subgraphs, analysis };
        self_.initialise_default(parser);
        Ok(self_)
    }

    pub fn visible_unchanged(&self, old: &VisibleGraph) -> bool {
        self.raw.stats.generation == old.generation
    }
}

#[macro_export]
macro_rules! graph_idx {
    ($mod_name:ident, $node:ident, $edge:ident, $inner:ident) => {
        mod $mod_name {
            use crate::idx;
            use petgraph::graph::IndexType;
            use std::fmt;
            #[cfg(feature = "mem_dbg")]
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
            
            #[cfg(feature = "mem_dbg")]
            impl MemDbgImpl for $node where {}
            #[cfg(feature = "mem_dbg")]
            impl MemSize for $node where {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            #[cfg(feature = "mem_dbg")]
            impl CopyType for $node {
                type Copy = True;
            }
            #[cfg(feature = "mem_dbg")]
            impl MemDbgImpl for $edge where {}
            #[cfg(feature = "mem_dbg")]
            impl MemSize for $edge where {
                fn mem_size(&self, _flags: SizeFlags) -> usize {
                    std::mem::size_of::<Self>()
                }
            }
            #[cfg(feature = "mem_dbg")]
            impl CopyType for $edge {
                type Copy = True;
            }
        }
        pub use $mod_name::{$node, $edge, $inner};
    };
}
