use typed_index_collections::TiVec;

use crate::{items::GraphIdx, Z3Parser};

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

pub struct InstGraph {
    pub raw: RawInstGraph,
    pub subgraphs: TiVec<GraphIdx, Subgraph>,
    pub analysis: Analysis,
}

impl InstGraph {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut raw = RawInstGraph::new(parser);
        let subgraphs = raw.partition();
        let analysis = Analysis::new(raw.graph.node_indices().collect());
        let mut self_ = InstGraph { raw, subgraphs, analysis };
        self_.initialise_default(parser);
        self_
    }

    pub fn visible_unchanged(&self, old: &VisibleInstGraph) -> bool {
        self.raw.stats.generation == old.generation
    }

    pub fn search_matching_loops(&mut self) -> usize {
        0
    }
}
