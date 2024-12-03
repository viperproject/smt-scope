use std::rc::Rc;

use smt_log_parser::analysis::visible::VisibleInstGraph;
use yew::AttrValue;

use crate::results::svg_result::GraphDimensions;

pub use crate::results::svg_result::RenderedGraph;

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
