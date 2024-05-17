pub mod cost;
pub mod depth;
pub mod next_insts;
pub mod matching_loop;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use petgraph::Direction;

use crate::{Graph, Result, Z3Parser};

use self::{cost::DefaultCost, depth::DefaultDepth, matching_loop::MLGraphNode, next_insts::DefaultNextInsts};

use super::{raw::Node, InstGraph, RawNodeIndex};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Analysis {
    // Highest to lowest
    pub cost: Vec<RawNodeIndex>,
    // Most to least
    pub children: Vec<RawNodeIndex>,
    // Most to least
    pub fwd_depth_min: Vec<RawNodeIndex>,
    // // Most to least
    // pub(super) max_depth: Vec<RawNodeIndex>,
    pub matching_loop_end_nodes: Option<Vec<RawNodeIndex>>,
    pub matching_loop_graphs: Vec<Graph<MLGraphNode, ()>>,
}

impl Analysis {
    pub fn new(nodes: impl ExactSizeIterator<Item = RawNodeIndex> + Clone) -> Result<Self> {
        // Alloc `children` vector
        let mut cost = Vec::new();
        cost.try_reserve_exact(nodes.len())?;
        cost.extend(nodes.clone());
        // Alloc `children` vector
        let mut children = Vec::new();
        children.try_reserve_exact(nodes.len())?;
        children.extend(nodes.clone());
        // Alloc `fwd_depth_min` vector
        let mut fwd_depth_min = Vec::new();
        fwd_depth_min.try_reserve_exact(nodes.len())?;
        fwd_depth_min.extend(nodes.clone());
        Ok(Self { cost, children, fwd_depth_min, matching_loop_end_nodes: None, matching_loop_graphs: vec![], })
    }
}

impl InstGraph {
    pub fn initialise_collect<I: CollectInitialiser<FORWARD, ID>, const FORWARD: bool, const ID: u8>(&mut self, mut initialiser: I, parser: &Z3Parser) {
        // Reset to base
        for node in self.raw.graph.node_weights_mut() {
            let base = initialiser.base(node, parser);
            initialiser.assign(node, base);
        }

        for subgraph in self.subgraphs.iter() {
            initialiser.reset();
            let for_each = |idx: RawNodeIndex| {
                let from_all = || self.raw.graph.neighbors_directed(idx.0, I::direction()).map(|i| &self.raw.graph[i]);
                let value = initialiser.collect(&self.raw.graph[idx.0], from_all);
                initialiser.assign(&mut self.raw.graph[idx.0], value);
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
        for subgraph in self.subgraphs.iter() {
            initialiser.reset();
            let for_each = |idx: RawNodeIndex| {
                let incoming: Vec<_> = self.raw.graph.neighbors_directed(idx.0, I::direction()).map(|i| initialiser.observe(&self.raw.graph[i], parser)).collect();
                let mut neighbors = self.raw.graph.neighbors_directed(idx.0, I::direction()).detach();
                let mut i = 0;
                while let Some((_, neighbor)) = neighbors.next(&self.raw.graph) {
                    let transfer = initialiser.transfer(&self.raw.graph[idx.0], RawNodeIndex(idx.0), i, &incoming);
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

    pub fn initialise_inst_succs_and_preds(&mut self, parser: &Z3Parser) {
        self.initialise_transfer(DefaultNextInsts::<true>, parser);
        self.initialise_transfer(DefaultNextInsts::<false>, parser);
    }

    pub fn analyse(&mut self) {
        self.analysis.cost.sort_by(|&a, &b|
            self.raw.graph[a.0].cost.total_cmp(&self.raw.graph[b.0].cost).reverse().then_with(|| a.cmp(&b))
        );
        self.analysis.children.sort_by(|&a, &b| {
            let ac = self.raw.graph.neighbors_directed(a.0, Direction::Outgoing).count();
            let bc = self.raw.graph.neighbors_directed(b.0, Direction::Outgoing).count();
            ac.cmp(&bc).reverse().then_with(|| a.cmp(&b))
        });
        self.analysis.fwd_depth_min.sort_by(|&a, &b|
            self.raw.graph[a.0].fwd_depth.min.cmp(&self.raw.graph[b.0].fwd_depth.min).reverse().then_with(|| a.cmp(&b))
        );
        // self.analysis.max_depth.sort_by(|&a, &b|
        //     self.raw.graph[a.0].max_depth.cmp(&self.raw.graph[b.0].max_depth).reverse().then_with(|| a.cmp(&b))
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
    fn transfer(&mut self, from: &Node, from_idx: RawNodeIndex, to_idx: usize, to_all: &[Self::Observed]) -> Self::Value;
    fn add(&mut self, node: &mut Node, value: Self::Value);
}
/// Initialiser where values are transferred from the neighbors to the current node.
pub trait CollectInitialiser<const FORWARD: bool, const ID: u8>: Initialiser<FORWARD, ID> {
    fn collect<'n, T: Iterator<Item = &'n Node>>(&mut self, _node: &Node, from_all: impl Fn() -> T) -> Self::Value;
}
