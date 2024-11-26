use fxhash::FxHashSet;

use crate::{
    analysis::{raw::Node, InstGraph, RawNodeIndex},
    TiVec,
};

use super::TopoAnalysis;

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
        if node.hidden() {
            from_all().any(|(_, &b)| b)
        } else {
            true
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

impl TopoAnalysis<true, false> for ReconnectAnalysis {
    type Value = FxHashSet<(RawNodeIndex, RawNodeIndex, RawNodeIndex)>;

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
                    data.extend(from_data.iter().copied());
                }
                (true, false) => {
                    data.insert((fidx, cidx, cidx));
                }
                (false, true) => {
                    let new = from_data.iter().map(|&(fv, fh, _)| (fv, fh, fidx));
                    data.extend(new)
                }
                (true, true) => {
                    data.insert((fidx, fidx, fidx));
                }
            }
        }

        data
    }
}
