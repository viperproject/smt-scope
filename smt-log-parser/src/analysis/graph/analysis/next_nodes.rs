use petgraph::Direction;

use crate::{
    analysis::{
        raw::{NextNodes, Node, NodeKind},
        RawNodeIndex,
    },
    Z3Parser,
};

use super::run::{Initialiser, TransferInitialiser};

pub trait NextInstsInitialiser<const FORWARD: bool> {
    /// The starting value for a node.
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> NextNodes;
    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
    type Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed;
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> NextNodes;
}
impl<C: NextInstsInitialiser<FORWARD>, const FORWARD: bool> Initialiser<FORWARD, 2> for C {
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
    fn reset(&mut self) {
        NextInstsInitialiser::reset(self)
    }
}
impl<C: NextInstsInitialiser<FORWARD>, const FORWARD: bool> TransferInitialiser<FORWARD, 2> for C {
    type Observed = C::Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed {
        NextInstsInitialiser::observe(self, node, parser)
    }
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> Self::Value {
        NextInstsInitialiser::transfer(self, from, from_idx, to_idx, to_all)
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

pub struct DefaultNextInsts<const FORWARD: bool>;
impl<const FORWARD: bool> NextInstsInitialiser<FORWARD> for DefaultNextInsts<FORWARD> {
    fn base(&mut self, _node: &Node, _parser: &Z3Parser) -> NextNodes {
        NextNodes::default()
    }
    type Observed = ();
    fn observe(&mut self, _node: &Node, _parser: &Z3Parser) -> Self::Observed {}
    fn transfer(
        &mut self,
        node: &Node,
        _from_idx: RawNodeIndex,
        _idx: usize,
        _incoming: &[Self::Observed],
    ) -> NextNodes {
        let kind = *node.kind();
        let nodes = match kind {
            NodeKind::Instantiation(iidx) => std::iter::once(iidx).collect(),
            _ => {
                if FORWARD {
                    node.parents.insts.clone()
                } else {
                    node.children.insts.clone()
                }
            }
        };
        let count = if node.disabled() { 0 } else { 1 };
        NextNodes {
            insts: nodes,
            count,
        }
    }
}
