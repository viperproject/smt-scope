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

        let hidden = node.hidden();
        for (fidx, from_data) in from_all() {
            let from = &graph.raw[fidx];
            match (from.hidden(), hidden) {
                (true, true) => {
                    data.extend(from_data.iter().copied());
                }
                (false, true) => {
                    data.insert((fidx, cidx, cidx));
                }
                (true, false) => {
                    let new = from_data.iter().map(|&(fv, fh, _)| (fv, fh, fidx));
                    data.extend(new)
                }
                (false, false) => {
                    data.insert((fidx, fidx, fidx));
                }
            }
        }

        data
    }
}
