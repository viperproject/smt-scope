use std::cmp::Ordering;

use smt_log_parser::analysis::visible::VisibleInstGraph;

pub const EDGE_LIMIT: usize = 2000;
pub const NODE_LIMIT: usize = 4000;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct GraphDimensions {
    pub node_count: usize,
    pub edge_count: usize,
}

impl GraphDimensions {
    pub fn default_permissions() -> Self {
        Self {
            node_count: NODE_LIMIT,
            edge_count: EDGE_LIMIT,
        }
    }

    pub fn of_graph(visible: &VisibleInstGraph) -> Self {
        Self {
            node_count: visible.graph.node_count(),
            edge_count: visible.graph.edge_count(),
        }
    }

    pub fn max(self, other: Self) -> Self {
        Self {
            node_count: self.node_count.max(other.node_count),
            edge_count: self.edge_count.max(other.edge_count),
        }
    }
}

impl PartialOrd for GraphDimensions {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        match (
            self.node_count.cmp(&other.node_count),
            self.edge_count.cmp(&other.edge_count),
        ) {
            (Ordering::Equal, ord) | (ord, Ordering::Equal) => Some(ord),
            (Ordering::Less, Ordering::Less) => Some(Ordering::Less),
            (Ordering::Greater, Ordering::Greater) => Some(Ordering::Greater),
            (Ordering::Less, Ordering::Greater) | (Ordering::Greater, Ordering::Less) => None,
        }
    }
}
