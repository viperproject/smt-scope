use std::mem::MaybeUninit;

use petgraph::Direction;

use crate::{
    analysis::{raw::Node, InstGraph, RawNodeIndex},
    TiVec, Z3Parser,
};

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
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> Self::Value;
    fn add(&mut self, node: &mut Node, value: Self::Value);
}
/// Initialiser where values are transferred from the neighbors to the current node.
pub trait CollectInitialiser<const FORWARD: bool, const SKIP_DISABLED: bool, const ID: u8>:
    Initialiser<FORWARD, ID>
{
    fn collect<'n, T: Iterator<Item = &'n Node>>(
        &mut self,
        _node: &Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value;
}

/// FORWARD: Do a forward or reverse topological walk? If `true` then we will be
/// collecting from parents, otherwise from children.
pub trait TopoAnalysis<const FORWARD: bool, const SKIP_DISABLED: bool> {
    /// The resulting analysis per node.
    type Value: std::fmt::Debug;

    /// The starting value for a node.
    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        graph: &'a InstGraph,
        idx: RawNodeIndex,
        node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n;

    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
}

impl InstGraph {
    pub fn topo_analysis<
        I: TopoAnalysis<FORWARD, SKIP_DISABLED>,
        const FORWARD: bool,
        const SKIP_DISABLED: bool,
    >(
        &self,
        analysis: &mut I,
    ) -> TiVec<RawNodeIndex, I::Value> {
        let mut data =
            typed_index_collections::TiVec::<RawNodeIndex, MaybeUninit<I::Value>>::with_capacity(
                self.raw.graph.node_count(),
            );
        // Safety: The vector has the required capacity and the values are
        // `MaybeUninit` so it's fine that they are not initialised.
        unsafe {
            data.set_len(self.raw.graph.node_count());
        }
        let mut data = TiVec::from(data);

        for subgraph in self.subgraphs.iter() {
            analysis.reset();

            let dir = if FORWARD {
                Direction::Incoming
            } else {
                Direction::Outgoing
            };
            let for_each = |curr: RawNodeIndex| {
                let node = &self.raw[curr];
                let value = if node.disabled() && SKIP_DISABLED {
                    analysis.collect(self, curr, node, core::iter::empty)
                } else {
                    let from_all = || {
                        let ix_map = |i: RawNodeIndex| {
                            let data = &data[i];
                            // Safety: The data is initialised as the graph is a DAG
                            // and we are traversing in a topological order.
                            let data = unsafe { data.assume_init_ref() };
                            (i, data)
                        };
                        let iter = if SKIP_DISABLED {
                            either::Either::Left(self.raw.neighbors_directed(curr, dir))
                        } else {
                            either::Either::Right(
                                self.raw
                                    .graph
                                    .neighbors_directed(curr.0, dir)
                                    .map(RawNodeIndex),
                            )
                        };
                        iter.map(ix_map)
                    };
                    analysis.collect(self, curr, node, from_all)
                };
                data[curr] = MaybeUninit::new(value);
            };
            let iter = subgraph.nodes.iter().copied();
            if FORWARD {
                iter.for_each(for_each);
            } else {
                iter.rev().for_each(for_each);
            }
        }

        for &singleton in &self.subgraphs.singletons {
            let node = &self.raw[singleton];
            let value = analysis.collect(self, singleton, node, core::iter::empty);
            data[singleton] = MaybeUninit::new(value);
        }

        unsafe {
            core::mem::transmute::<
                TiVec<RawNodeIndex, MaybeUninit<I::Value>>,
                TiVec<RawNodeIndex, I::Value>,
            >(data)
        }
    }

    pub fn initialise_collect<
        I: CollectInitialiser<FORWARD, SKIP_DISABLED, ID>,
        const FORWARD: bool,
        const SKIP_DISABLED: bool,
        const ID: u8,
    >(
        &mut self,
        mut initialiser: I,
        parser: &Z3Parser,
    ) {
        // Reset to base
        for node in self.raw.graph.node_weights_mut() {
            let base = initialiser.base(node, parser);
            initialiser.assign(node, base);
        }

        for subgraph in self.subgraphs.iter() {
            initialiser.reset();
            let for_each = |idx: RawNodeIndex| {
                let value = if SKIP_DISABLED {
                    let from_all = || {
                        self.raw
                            .neighbors_directed(idx, I::direction())
                            .map(|i| &self.raw[i])
                    };
                    initialiser.collect(&self.raw.graph[idx.0], from_all)
                } else {
                    let from_all = || {
                        self.raw
                            .graph
                            .neighbors_directed(idx.0, I::direction())
                            .map(|i| &self.raw.graph[i])
                    };
                    initialiser.collect(&self.raw.graph[idx.0], from_all)
                };
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

    pub fn initialise_transfer<
        I: TransferInitialiser<FORWARD, ID>,
        const FORWARD: bool,
        const ID: u8,
    >(
        &mut self,
        mut initialiser: I,
        parser: &Z3Parser,
    ) {
        // Reset to base
        for node in self.raw.graph.node_weights_mut() {
            let base = initialiser.base(node, parser);
            initialiser.assign(node, base);
        }
        for subgraph in self.subgraphs.iter() {
            initialiser.reset();
            let for_each = |idx: RawNodeIndex| {
                let incoming: Vec<_> = self
                    .raw
                    .neighbors_directed(idx, I::direction())
                    .map(|i| initialiser.observe(&self.raw[i], parser))
                    .collect();
                let mut i = 0;
                let mut neighbors = self.raw.neighbors_directed(idx, I::direction()).detach();
                while let Some(neighbor) = neighbors.next(&self.raw) {
                    let transfer = initialiser.transfer(&self.raw.graph[idx.0], idx, i, &incoming);
                    initialiser.add(&mut self.raw[neighbor], transfer);
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
}
