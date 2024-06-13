use petgraph::Direction;

use crate::{
    analysis::{
        raw::{Node, NodeKind},
        RawNodeIndex,
    },
    Z3Parser,
};

use super::{Initialiser, TransferInitialiser};

pub trait CostInitialiser {
    /// The starting value for a node.
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> f64;
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
    ) -> f64;
}
impl<C: CostInitialiser> Initialiser<false, 0> for C {
    type Value = f64;
    fn direction() -> Direction {
        Direction::Incoming
    }
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> Self::Value {
        CostInitialiser::base(self, node, parser)
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        node.cost = value;
    }
    fn reset(&mut self) {
        CostInitialiser::reset(self)
    }
}
impl<C: CostInitialiser> TransferInitialiser<false, 0> for C {
    type Observed = C::Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed {
        CostInitialiser::observe(self, node, parser)
    }
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> Self::Value {
        CostInitialiser::transfer(self, from, from_idx, to_idx, to_all)
    }
    fn add(&mut self, node: &mut Node, value: Self::Value) {
        node.cost += value;
    }
}

pub struct DefaultCost;
impl CostInitialiser for DefaultCost {
    fn base(&mut self, node: &Node, _parser: &Z3Parser) -> f64 {
        match node.kind() {
            NodeKind::Instantiation(_) if !node.disabled() => 1.0,
            _ => 0.0,
        }
    }
    type Observed = usize;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed {
        match node.kind() {
            NodeKind::ENode(_) => 1,
            NodeKind::GivenEquality(_, _) => 1,
            NodeKind::TransEquality(eq) => parser[*eq].given_len.min(1),
            NodeKind::Instantiation(_) => 1,
            NodeKind::ProofStep(_) => 1,
            NodeKind::Decision(_) => 1,
        }
    }
    fn transfer(
        &mut self,
        node: &Node,
        _from_idx: RawNodeIndex,
        idx: usize,
        incoming: &[Self::Observed],
    ) -> f64 {
        let total = incoming.iter().sum::<usize>() as f64;
        node.cost * incoming[idx] as f64 / total
    }
}
