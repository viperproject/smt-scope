use std::{ops::Deref, rc::Rc};

use smt_log_parser::analysis::{visible::VisibleInstGraph, RawNodeIndex, VisibleEdgeIndex};
use web_sys::SvgsvgElement;

use crate::{results::svg_result::GraphDimensions, screen::extra::OmniboxSearch};

#[derive(Clone)]
pub struct RcVisibleGraph(Rc<VisibleInstGraph>);

impl Deref for RcVisibleGraph {
    type Target = VisibleInstGraph;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl PartialEq for RcVisibleGraph {
    fn eq(&self, other: &Self) -> bool {
        self.generation == other.generation
    }
}

impl RcVisibleGraph {
    pub fn new(graph: VisibleInstGraph) -> Self {
        Self(Rc::new(graph))
    }
}

#[derive(Clone)]
pub struct RenderedGraph {
    pub graph: RcVisibleGraph,
    pub svg: SvgsvgElement,

    /// The `RawNodeIndex` here refers to the original graph!
    pub selected_nodes: Vec<RawNodeIndex>,
    /// The `VisibleEdgeIndex` here refers to the VisibleGraph!
    pub selected_edges: Vec<VisibleEdgeIndex>,
    pub search: Rc<OmniboxSearch>,
}

impl PartialEq for RenderedGraph {
    fn eq(&self, other: &Self) -> bool {
        self.graph == other.graph
    }
}

impl RenderedGraph {
    pub fn dims(&self) -> GraphDimensions {
        GraphDimensions::of_graph(&self.graph)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum GraphState {
    GraphToDot,
    RenderingGraph,
    Failed(String),
}
