use petgraph::Direction;

use crate::{
    analysis::{
        raw::{NextNodes, Node},
        RawNodeIndex,
    },
    Z3Parser,
};

use super::run::{Initialiser, TransferInitialiser};

pub struct NextInstsInit<const FORWARD: bool>;
impl<const FORWARD: bool> Initialiser<FORWARD, 2> for NextInstsInit<FORWARD> {
    type Value = NextNodes;
    fn direction() -> Direction {
        if FORWARD {
            Direction::Outgoing
        } else {
            Direction::Incoming
        }
    }
    fn base(&mut self, _node: &Node, _parser: &Z3Parser) -> Self::Value {
        NextNodes::default()
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        if FORWARD {
            node.parents = value;
        } else {
            node.children = value;
        }
    }
}
impl<const FORWARD: bool> TransferInitialiser<FORWARD, 2> for NextInstsInit<FORWARD> {
    type Observed = ();
    fn observe(&mut self, _node: &Node, _parser: &Z3Parser) -> Self::Observed {}
    fn transfer(
        &mut self,
        from: &Node,
        _from_idx: RawNodeIndex,
        _idx: usize,
        _incoming: &[Self::Observed],
    ) -> Self::Value {
        let insts = if let Some(iidx) = from.kind().inst() {
            std::iter::once(iidx).collect()
        } else if FORWARD {
            from.parents.insts.clone()
        } else {
            from.children.insts.clone()
        };
        let count = if from.disabled() { 0 } else { 1 };
        NextNodes { insts, count }
    }
    fn add(&mut self, node: &mut Node, value: Self::Value) {
        let node = if FORWARD {
            &mut node.parents
        } else {
            &mut node.children
        };
        node.insts.extend(value.insts);
        node.count += value.count;
    }
}
