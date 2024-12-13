use petgraph::Direction;

use crate::{
    analysis::{
        raw::{Node, NodeKind},
        RawNodeIndex,
    },
    Z3Parser,
};

use super::run::{Initialiser, TransferInitialiser};

pub trait CostInitialiser<const FORWARD: bool = false> {
    /// The starting value for a node.
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> f64;
    fn assign(&mut self, node: &mut Node, value: f64) {
        node.cost = value;
    }
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
impl<C: CostInitialiser<FORWARD>, const FORWARD: bool> Initialiser<FORWARD, 0> for C {
    type Value = f64;
    fn direction() -> Direction {
        if FORWARD {
            Direction::Outgoing
        } else {
            Direction::Incoming
        }
    }
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> Self::Value {
        CostInitialiser::base(self, node, parser)
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        CostInitialiser::assign(self, node, value)
    }
    fn reset(&mut self) {
        CostInitialiser::reset(self)
    }
}
impl<C: CostInitialiser<FORWARD>, const FORWARD: bool> TransferInitialiser<FORWARD, 0> for C {
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
            NodeKind::Instantiation(_) | NodeKind::Cdcl(_) if !node.disabled() => 1.0,
            _ => 0.0,
        }
    }
    type Observed = usize;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed {
        match node.kind() {
            NodeKind::ENode(_) => 1,
            NodeKind::GivenEquality(_, _) => 1,
            NodeKind::TransEquality(eq) => {
                parser[*eq].given_len.map(|l| l.get()).unwrap_or_default()
            }
            NodeKind::Instantiation(_) => 1,
            NodeKind::Proof(_) => 0,
            NodeKind::Cdcl(_) => 1,
        }
    }
    fn transfer(
        &mut self,
        node: &Node,
        _from_idx: RawNodeIndex,
        idx: usize,
        incoming: &[Self::Observed],
    ) -> f64 {
        let total = incoming.iter().sum::<usize>();
        if total == 0 {
            return 0.0;
        }
        node.cost * incoming[idx] as f64 / total as f64
    }
}

pub struct ProofCost;
impl CostInitialiser<true> for ProofCost {
    fn base(&mut self, node: &Node, _parser: &Z3Parser) -> f64 {
        match node.kind() {
            NodeKind::Proof(_) if !node.disabled() => 1.0,
            _ => 0.0,
        }
    }
    fn assign(&mut self, node: &mut Node, value: f64) {
        if node.kind().proof().is_some() {
            node.cost = value;
        }
    }

    type Observed = usize;
    fn observe(&mut self, node: &Node, _parser: &Z3Parser) -> Self::Observed {
        match node.kind() {
            NodeKind::Proof(_) => 1,
            _ => 0,
        }
    }
    fn transfer(
        &mut self,
        node: &Node,
        _from_idx: RawNodeIndex,
        idx: usize,
        incoming: &[Self::Observed],
    ) -> f64 {
        if node.kind().proof().is_none() {
            return 0.0;
        }

        let total = incoming.iter().sum::<usize>();
        if total == 0 {
            return 0.0;
        }
        node.cost * incoming[idx] as f64 / total as f64
    }
}
