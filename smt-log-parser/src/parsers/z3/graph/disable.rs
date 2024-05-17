use crate::Z3Parser;

use super::{raw::{BaseAndObserve, Node, NodeState, RawGraph}, Graph, RawNodeIndex};


impl<N, E> Graph<N, E> where Node<N>: BaseAndObserve {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all nodes is reset to `false` so any filters will need to be
    /// reapplied. The default analyses are also reapplied.
    pub fn reset_disabled_to(&mut self, parser: &Z3Parser, f: impl Fn(RawNodeIndex, &RawGraph<N, E>) -> bool) {
        self.raw.reset_disabled_to_raw(f);
        self.initialise_default(parser);
    }
}

impl<N, E> RawGraph<N, E> {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all non-disabled nodes is reset to `false` so any filters
    /// will need to be reapplied.
    /// 
    /// Analyses should be reapplied after this function is called!
    pub fn reset_disabled_to_raw(&mut self, f: impl Fn(RawNodeIndex, &RawGraph<N, E>) -> bool) {
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
