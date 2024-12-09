use fxhash::FxHashSet;

use crate::{
    analysis::{raw::Node, InstGraph, RawNodeIndex},
    TiVec,
};

use super::run::TopoAnalysis;

pub struct BwdReachableVisAnalysis;

impl TopoAnalysis<false, false> for BwdReachableVisAnalysis {
    type Value = bool;

    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        _graph: &'a InstGraph,
        _cidx: RawNodeIndex,
        node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n,
    {
        if node.visible() {
            true
        } else {
            from_all().any(|(_, &b)| b)
        }
    }
}

/// Looks for tuples of 4 indices:
///  - `from`: a visible node
///  - `from_child`: a non-visible child of `from`
///  - `to_parent`: a non-visible node reachable from `from_child` but not
///    reachable by any visible node also reachable from `from_child`
///    (note that it's possible for `from_child == to_parent`)
///  - `to`: a visible child of `to_parent`
///
/// The `to` is implicit in the index which we used to reach the
/// `TopoAnalysis::Value`.
pub struct ReconnectAnalysis(pub TiVec<RawNodeIndex, bool>);

#[derive(Debug, Default)]
pub struct ReconnectData {
    pub above: FxHashSet<(RawNodeIndex, RawNodeIndex, RawNodeIndex)>,
    /// These should not be added to `above` since they can be transitively
    /// reached.
    pub transitive: FxHashSet<(RawNodeIndex, RawNodeIndex)>,
}

impl ReconnectData {
    pub fn extend(&mut self, other: &Self) {
        // Remove any that we've already added but should not have.
        self.above
            .retain(|&(from_vis, from_hid, ..)| !other.transitive.contains(&(from_vis, from_hid)));
        // Add any that we can add, this is after the above line since `other`
        // may contain nodes which it has itself forbidden.
        self.above.extend(
            other
                .above
                .iter()
                .copied()
                .filter(|&(from_vis, from_hid, ..)| {
                    !self.transitive.contains(&(from_vis, from_hid))
                }),
        );
        // Add the transitive ones which forbid adding.
        self.transitive.extend(other.transitive.iter().copied());
    }

    pub fn reached_visible(&self) -> impl Iterator<Item = (RawNodeIndex, RawNodeIndex)> + '_ {
        self.above
            .iter()
            .copied()
            .map(move |(from_vis, from_hid, _)| (from_vis, from_hid))
    }
}

impl TopoAnalysis<true, false> for ReconnectAnalysis {
    type Value = ReconnectData;

    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        graph: &'a InstGraph,
        cidx: RawNodeIndex,
        node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n,
    {
        let mut data = Self::Value::default();
        if !self.0[cidx] {
            return data;
        }

        let visible = node.visible();
        for (fidx, from_data) in from_all() {
            let from = &graph.raw[fidx];
            match (from.visible(), visible) {
                (false, false) => {
                    data.extend(from_data);
                }
                (true, false) => {
                    data.above.insert((fidx, cidx, cidx));
                    data.transitive.extend(from_data.transitive.iter().copied());
                }
                (false, true) => {
                    data.transitive.extend(from_data.reached_visible());
                    let new = from_data
                        .reached_visible()
                        .map(|(from_vis, from_hid)| (from_vis, from_hid, fidx));
                    data.above.extend(new)
                }
                (true, true) => {
                    data.above.insert((fidx, fidx, fidx));
                    data.transitive.extend(from_data.transitive.iter().copied());
                }
            }
        }

        data
    }
}
