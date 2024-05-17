use petgraph::Direction;

use crate::{parsers::z3::graph::raw::{BaseAndObserve, Depth, InstNodeKind, Node}, Z3Parser};

use super::{CollectInitialiser, Initialiser};


pub trait DepthInitialiser<const FORWARD: bool, N> {
    /// The starting value for a node.
    fn base(&mut self, _node: &Node<N>, _parser: &Z3Parser) -> Depth { Depth::default() }
    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
    fn collect<'n, T: Iterator<Item = &'n Node<N>>>(&mut self, _node: &Node<N>, from_all: impl Fn() -> T) -> Depth where N: 'n;
}
impl<N, C: DepthInitialiser<FORWARD, N>, const FORWARD: bool> Initialiser<FORWARD, 1, N> for C {
    type Value = Depth;
    fn direction() -> Direction { if FORWARD { Direction::Incoming } else { Direction::Outgoing } }
    fn base(&mut self, node: &Node<N>, parser: &Z3Parser) -> Self::Value {
        DepthInitialiser::base(self, node, parser)
    }
    fn assign(&mut self, node: &mut Node<N>, depth: Self::Value) {
        if FORWARD {
            node.fwd_depth = depth;
        } else {
            node.bwd_depth = depth;
        }
    }
    fn reset(&mut self) {
        DepthInitialiser::reset(self)
    }
}
impl<N, C: DepthInitialiser<FORWARD, N>, const FORWARD: bool> CollectInitialiser<FORWARD, 1, N> for C {
    fn collect<'n, T: Iterator<Item = &'n Node<N>>>(&mut self, node: &Node<N>, from_all: impl Fn() -> T) -> Self::Value where N: 'n {
        DepthInitialiser::collect(self, node, from_all)
    }
}

pub struct DefaultDepth<const FORWARD: bool>;
impl<const FORWARD: bool, N> DepthInitialiser<FORWARD, N> for DefaultDepth<FORWARD> where Node<N>: BaseAndObserve {
    fn collect<'n, T: Iterator<Item = &'n Node<N>>>(&mut self, node: &Node<N>, from_all: impl Fn() -> T) -> Depth where N: 'n {
        let is_disabled = node.disabled();
        // let min_depth_increase = (!is_disabled && node.kind().inst().is_some()) as u32;
        let min_depth_increase = node.get_min_depth_increase();
        let depth = |n: &Node<N>| if FORWARD { n.fwd_depth } else { n.bwd_depth };
        // We filter all parent nodes without an instantiation parent, this way
        // we calculate a 'true' min depth from instantiation nodes only.
        let min = from_all().map(|n| depth(n).min).filter(|min| *min != 0).min().unwrap_or(0) + min_depth_increase;
        let max = from_all().map(|n|
            if is_disabled {
                depth(n).max
            } else {
                depth(n).max + 1
            }
        ).max().unwrap_or(0);
        Depth { min, max }
    }
}
