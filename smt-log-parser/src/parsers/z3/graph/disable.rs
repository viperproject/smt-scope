use std::collections::HashSet;

use fxhash::FxHashSet;

use crate::Z3Parser;

use super::{raw::{NodeState, RawInstGraph}, InstGraph, RawNodeIndex};


impl InstGraph {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all nodes is reset to `false` so any filters will need to be
    /// reapplied. The default analyses are also reapplied.
    pub fn reset_disabled_to(&mut self, parser: &Z3Parser, f: impl Fn(RawNodeIndex, &RawInstGraph) -> bool) {
        self.raw.reset_disabled_to_raw(f);
        self.initialise_default(parser);
    }

    pub fn disabled_nodes(&self) -> FxHashSet<RawNodeIndex> {
        let mut disabled_nodes = HashSet::default();
        for node in self.raw.graph.node_weights() {
            if node.disabled() {
                disabled_nodes.insert(RawNodeIndex(node.raw_nidx));
            }
        }
        disabled_nodes
    }
}

impl RawInstGraph {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all non-disabled nodes is reset to `false` so any filters
    /// will need to be reapplied.
    /// 
    /// Analyses should be reapplied after this function is called!
    pub fn reset_disabled_to_raw(&mut self, f: impl Fn(RawNodeIndex, &RawInstGraph) -> bool) {
        for node in self.graph.node_indices().map(RawNodeIndex) {
            let state = if f(node, self) {
                NodeState::Disabled
            } else {
                NodeState::Visible
            };
            self.stats.set_state(&mut self.graph[node.0], state);
        }
    }
}
