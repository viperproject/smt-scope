use petgraph::Direction;

use crate::{parsers::z3::graph::raw::{BaseAndObserve, InstNodeKind, Node}, Z3Parser};

use super::{Initialiser, TransferInitialiser};


pub trait CostInitialiser<N> {
    /// The starting value for a node.
    fn base(&mut self, node: &Node<N>, parser: &Z3Parser) -> f64;
    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
    type Observed;
    fn observe(&mut self, node: &Node<N>, parser: &Z3Parser) -> Self::Observed;
    fn transfer(&mut self, from: &Node<N>, to_idx: usize, to_all: &[Self::Observed]) -> f64;
}
impl<N, C: CostInitialiser<N>> Initialiser<false, 0, N> for C {
    type Value = f64;
    fn direction() -> Direction { Direction::Incoming }
    fn base(&mut self, node: &Node<N>, parser: &Z3Parser) -> Self::Value {
        CostInitialiser::base(self, node, parser)
    }
    fn assign(&mut self, node: &mut Node<N>, value: Self::Value) {
        node.cost = value;
    }
    fn reset(&mut self) {
        CostInitialiser::reset(self)
    }
}
impl<N, C: CostInitialiser<N>> TransferInitialiser<false, 0, N> for C {
    type Observed = C::Observed;
    fn observe(&mut self, node: &Node<N>, parser: &Z3Parser) -> Self::Observed {
        CostInitialiser::observe(self, node, parser)
    }
    fn transfer(&mut self, from: &Node<N>, to_idx: usize, to_all: &[Self::Observed]) -> Self::Value {
        CostInitialiser::transfer(self, from, to_idx, to_all)
    }
    fn add(&mut self, node: &mut Node<N>, value: Self::Value) {
        node.cost += value;
    }
}

pub struct DefaultCost;
impl<N> CostInitialiser<N> for DefaultCost where Node<N>: BaseAndObserve {
    fn base(&mut self, node: &Node<N>, _parser: &Z3Parser) -> f64 {
        // match node.kind() {
        //     InstNodeKind::Instantiation(_) if !node.disabled() => 1.0,
        //     _ => 0.0,
        // }
        node.base()
    }
    type Observed = usize;
    fn observe(&mut self, node: &Node<N>, parser: &Z3Parser) -> Self::Observed {
        // match node.kind() {
        //     InstNodeKind::ENode(_) => 1,
        //     InstNodeKind::GivenEquality(_, _) => 1,
        //     InstNodeKind::TransEquality(eq) => parser[*eq].given_len.min(1),
        //     InstNodeKind::Instantiation(_) => 1,
        // }
        node.observe(parser)
    }
    fn transfer(&mut self, node: &Node<N>, idx: usize, incoming: &[Self::Observed]) -> f64 {
        let total = incoming.iter().sum::<usize>() as f64;
        node.cost * incoming[idx] as f64 / total
    }
}
