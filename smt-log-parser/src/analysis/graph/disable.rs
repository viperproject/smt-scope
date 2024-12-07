

use crate::Z3Parser;

use super::{
    raw::{NodeState, RawInstGraph},
    InstGraph, RawNodeIndex,
};

impl InstGraph {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all nodes is reset to `false` so any filters will need to be
    /// reapplied. The default analyses are also reapplied.
    pub fn reset_disabled_to(
        &mut self,
        parser: &Z3Parser,
        f: impl Fn(RawNodeIndex, &RawInstGraph) -> bool,
    ) {
        let (_, disabled_changed) = self.raw.reset_disabled_to_raw(f);
        if disabled_changed {
            self.initialise_default(parser);
        }
    }

    pub fn disabled_nodes(&self) -> impl Iterator<Item = RawNodeIndex> + '_ {
        self.raw.node_indices().filter(|&n| self.raw[n].disabled())
    }
}

impl RawInstGraph {
    /// Updates which nodes are disabled based on the predicate `f`. The
    /// `hidden` of all non-disabled nodes is reset to `false` so any filters
    /// will need to be reapplied. It returns two booleans: the first indicates
    /// if any state was modified, the second indicates if any node was
    /// enabled/disabled.
    ///
    /// Analyses should be reapplied after this function is called! (unless the
    /// second boolean is false)
    pub fn reset_disabled_to_raw(
        &mut self,
        f: impl Fn(RawNodeIndex, &RawInstGraph) -> bool,
    ) -> (bool, bool) {
        let mut modified_disabled = false;
        let mut modified = false;
        for node in self.graph.node_indices().map(RawNodeIndex) {
            let disable = f(node, self);
            let node = &mut self.graph[node.0];
            modified_disabled |= disable != node.disabled();
            let state = if disable {
                NodeState::Disabled
            } else {
                NodeState::Visible
            };
            modified |= self.stats.set_state(node, state);
        }
        (modified, modified_disabled)
    }
}
