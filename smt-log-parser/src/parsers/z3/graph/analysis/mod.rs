pub mod cost;
pub mod depth;
pub mod matching_loop;

use petgraph::{graph::NodeIndex, Direction};

use crate::Z3Parser;

use self::{cost::DefaultCost, depth::DefaultDepth};

use super::{raw::Node, InstGraph};

#[derive(Default)]
pub struct Analysis {
    // Highest to lowest
    pub cost: Vec<NodeIndex>,
    // Most to least
    pub children: Vec<NodeIndex>,
    // Most to least
    pub fwd_depth_min: Vec<NodeIndex>,
    // // Most to least
    // pub(super) max_depth: Vec<NodeIndex>,
    pub matching_loop_end_nodes: Option<Vec<NodeIndex>>,
}

impl Analysis {
    pub fn new(nodes: Vec<NodeIndex>) -> Self {
        Self { cost: nodes.clone(), children: nodes.clone(), fwd_depth_min: nodes, matching_loop_end_nodes: None }//.clone(), max_depth: nodes }
    }
}

impl InstGraph {
    pub fn initialise_collect<I: CollectInitialiser<FORWARD, ID>, const FORWARD: bool, const ID: u8>(&mut self, mut initialiser: I, parser: &Z3Parser) {
        // Reset to base
        for node in self.raw.graph.node_weights_mut() {
            let base = initialiser.base(node, parser);
            initialiser.assign(node, base);
        }

        for subgraph in &self.subgraphs {
            initialiser.reset();
            let for_each = |idx: NodeIndex| {
                let from_all = || self.raw.graph.neighbors_directed(idx, I::direction()).map(|i| &self.raw.graph[i]);
                let value = initialiser.collect(&self.raw.graph[idx], from_all);
                initialiser.assign(&mut self.raw.graph[idx], value);
            };
            let iter = subgraph.nodes.iter().copied();
            if FORWARD {
                iter.for_each(for_each);
            } else {
                iter.rev().for_each(for_each);
            }
        }
    }

    pub fn initialise_transfer<I: TransferInitialiser<FORWARD, ID>, const FORWARD: bool, const ID: u8>(&mut self, mut initialiser: I, parser: &Z3Parser) {
        // Reset to base
        for node in self.raw.graph.node_weights_mut() {
            let base = initialiser.base(node, parser);
            initialiser.assign(node, base);
        }
        for subgraph in &self.subgraphs {
            initialiser.reset();
            let for_each = |idx: NodeIndex| {
                let incoming: Vec<_> = self.raw.graph.neighbors_directed(idx, I::direction()).map(|i| initialiser.observe(&self.raw.graph[i], parser)).collect();
                let mut neighbors = self.raw.graph.neighbors_directed(idx, I::direction()).detach();
                let mut i = 0;
                while let Some((_, neighbor)) = neighbors.next(&self.raw.graph) {
                    let transfer = initialiser.transfer(&self.raw.graph[idx], i, &incoming);
                    initialiser.add(&mut self.raw.graph[neighbor], transfer);
                    i += 1;
                }
            };
            let iter = subgraph.nodes.iter().copied();
            if FORWARD {
                iter.for_each(for_each);
            } else {
                iter.rev().for_each(for_each);
            }
        }
    }
    pub fn initialise_default(&mut self, parser: &Z3Parser) {
        self.initialise_transfer(DefaultCost, parser);
        self.initialise_collect(DefaultDepth::<true>, parser);
        self.initialise_collect(DefaultDepth::<false>, parser);

        self.analyse();
    }

    pub fn analyse(&mut self) {
        self.analysis.cost.sort_by(|&a, &b|
            self.raw.graph[a].cost.total_cmp(&self.raw.graph[b].cost).reverse().then_with(|| a.index().cmp(&b.index()))
        );
        self.analysis.children.sort_by(|&a, &b| {
            let ac = self.raw.graph.neighbors_directed(a, Direction::Outgoing).count();
            let bc = self.raw.graph.neighbors_directed(b, Direction::Outgoing).count();
            ac.cmp(&bc).reverse().then_with(|| a.index().cmp(&b.index()))
        });
        self.analysis.fwd_depth_min.sort_by(|&a, &b|
            self.raw.graph[a].fwd_depth.min.cmp(&self.raw.graph[b].fwd_depth.min).reverse().then_with(|| a.index().cmp(&b.index()))
        );
        // self.analysis.max_depth.sort_by(|&a, &b|
        //     self.raw.graph[a].max_depth.cmp(&self.raw.graph[b].max_depth).reverse().then_with(|| a.index().cmp(&b.index()))
        // );
    }
}

// FIXME: `ID` makes the implementations unique, but is not a great solution.
/// FORWARD: Do a forward or reverse topological walk?
pub trait Initialiser<const FORWARD: bool, const ID: u8> {
    /// The value that is being initialised.
    type Value: std::fmt::Debug;

    /// Will I get to see the incoming parents or outgoing children?
    fn direction() -> Direction;
    /// The starting value for a node.
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> Self::Value;
    fn assign(&mut self, node: &mut Node, value: Self::Value);

    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
}
/// Initialiser where values are transferred from the current node to its neighbors.
pub trait TransferInitialiser<const FORWARD: bool, const ID: u8>: Initialiser<FORWARD, ID> {
    type Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed;
    fn transfer(&mut self, from: &Node, to_idx: usize, to_all: &[Self::Observed]) -> Self::Value;
    fn add(&mut self, node: &mut Node, value: Self::Value);
}
/// Initialiser where values are transferred from the neighbors to the current node.
pub trait CollectInitialiser<const FORWARD: bool, const ID: u8>: Initialiser<FORWARD, ID> {
    fn collect<'n, T: Iterator<Item = &'n Node>>(&mut self, _node: &Node, from_all: impl Fn() -> T) -> Self::Value;
}
