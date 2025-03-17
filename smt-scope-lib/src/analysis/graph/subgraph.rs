use std::ops::Deref;

use fxhash::FxHashSet;
#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use petgraph::{
    graph::{DiGraph, EdgeIndex, IndexType, Neighbors, NodeIndex},
    Directed,
    Direction::{self, Incoming, Outgoing},
    Undirected,
};

use super::{
    raw::{RawInstGraph, RawIx},
    RawNodeIndex,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Subgraphs {
    pub subgraphs: TiVec<GraphIdx, Subgraph>,
    pub singletons: Vec<RawNodeIndex>,
}

impl Subgraphs {
    pub fn topo_node_indices(&self) -> impl Iterator<Item = RawNodeIndex> + '_ {
        self.in_subgraphs().chain(self.singletons())
    }
    pub fn in_subgraphs(&self) -> impl Iterator<Item = RawNodeIndex> + '_ {
        self.subgraphs.iter().flat_map(|s| s.nodes.iter().copied())
    }
    pub fn singletons(&self) -> impl Iterator<Item = RawNodeIndex> + '_ {
        self.singletons.iter().copied()
    }
}

impl Deref for Subgraphs {
    type Target = TiVec<GraphIdx, Subgraph>;
    fn deref(&self) -> &Self::Target {
        &self.subgraphs
    }
}

impl RawInstGraph {
    pub fn partition(&mut self) -> Result<Subgraphs> {
        let mut subgraphs = TiVec::default();
        let mut discovered = VisitBox {
            dfs: self.graph.visit_map(),
        };
        for node in self.node_indices() {
            let has_parents = self
                .graph
                .neighbors_directed(node.0, Incoming)
                .next()
                .is_some();
            if has_parents {
                continue;
            }
            let has_children = self
                .graph
                .neighbors_directed(node.0, Outgoing)
                .next()
                .is_some();
            if !has_children {
                continue;
            }
            // We've skipped all singleton nodes and all non-root nodes.

            if self.graph[node.0].subgraph.is_some() {
                continue;
            }

            // Construct subgraph
            let idx = subgraphs.next_key();
            let (subgraph, discovered_) =
                Subgraph::new(node, &mut self.graph, discovered, |node, i| {
                    node.subgraph = Some((idx, i))
                })?;
            discovered = discovered_;
            subgraphs.raw.try_reserve(1)?;
            subgraphs.push(subgraph);
        }

        // Collect all missing singleton nodes
        discovered.dfs.toggle_range(..);
        debug_assert!(discovered.visited().all(|a| {
            let no_parents = self.graph.edges_directed(a.0, Incoming).next().is_none();
            let no_children = self.graph.edges_directed(a.0, Outgoing).next().is_none();
            no_parents && no_children
        }));
        let singletons = discovered.visited().collect();
        Ok(Subgraphs {
            singletons,
            subgraphs,
        })
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Subgraph {
    pub(super) nodes: Vec<RawNodeIndex>,
}

pub struct VisitBox<D: VisitMap<NodeIndex<RawIx>>> {
    pub dfs: D,
}

impl VisitBox<<petgraph::graph::DiGraph<(), ()> as petgraph::visit::Visitable>::Map> {
    pub fn visited(&self) -> impl Iterator<Item = RawNodeIndex> + '_ {
        self.dfs.ones().map(NodeIndex::new).map(RawNodeIndex)
    }
}

impl Subgraph {
    pub fn new<N, E, D: VisitMap<NodeIndex<RawIx>>>(
        node: RawNodeIndex,
        graph: &mut DiGraph<N, E, RawIx>,
        mut visit: VisitBox<D>,
        mut f: impl FnMut(&mut N, u32),
    ) -> Result<(Self, VisitBox<D>)> {
        let mut start_nodes = Vec::new();

        let mut un_graph = std::mem::replace(graph, DiGraph::<N, E, RawIx>::with_capacity(0, 0))
            .into_edge_type::<Undirected>();
        let mut dfs: Dfs<NodeIndex<RawIx>, _> =
            petgraph::visit::Dfs::from_parts(Vec::new(), visit.dfs);
        dfs.move_to(node.0);
        while let Some(node) = dfs.next(&un_graph) {
            let di_graph = un_graph.into_edge_type::<Directed>();
            let has_parents = di_graph.neighbors_directed(node, Incoming).next().is_some();
            un_graph = di_graph.into_edge_type();
            if !has_parents {
                start_nodes.push(node);
            }
        }
        visit.dfs = dfs.discovered;
        *graph = un_graph.into_edge_type();

        // OPTIMISATION: use a `VisitMap` from `VisitBox` to avoid allocating a
        // `FxHashSet` here (as well as the need for `SubgraphStartNodes`).
        let mut topo = petgraph::visit::Topo::new(&SubgraphStartNodes {
            start_nodes: &start_nodes,
            graph,
        });
        let mut nodes = Vec::new();
        let mut count = 0_u32;
        while let Some(node) = topo.next(&SubgraphStartNodes {
            start_nodes: &start_nodes,
            graph,
        }) {
            let n = &mut graph[node];
            f(n, count);
            count += 1;
            nodes.try_reserve(1)?;
            nodes.push(RawNodeIndex(node));
        }

        Ok((Self { nodes }, visit))
    }
}

// Graph wrapper for Topo walk

pub(super) struct SubgraphStartNodes<'g, N, E, Ix: IndexType> {
    pub(super) start_nodes: &'g Vec<NodeIndex<Ix>>,
    pub(super) graph: &'g DiGraph<N, E, Ix>,
}
use petgraph::visit::*;

use crate::{items::GraphIdx, Result, TiVec};

impl<N, E, Ix: IndexType> GraphBase for SubgraphStartNodes<'_, N, E, Ix> {
    type NodeId = NodeIndex<Ix>;
    type EdgeId = EdgeIndex;
}
impl<'a, N, E, Ix: IndexType> IntoNodeIdentifiers for &'a SubgraphStartNodes<'_, N, E, Ix> {
    type NodeIdentifiers = std::iter::Copied<std::slice::Iter<'a, NodeIndex<Ix>>>;
    fn node_identifiers(self) -> Self::NodeIdentifiers {
        self.start_nodes.iter().copied()
    }
}
impl<'a, N, E, Ix: IndexType> IntoNeighbors for &'a SubgraphStartNodes<'_, N, E, Ix> {
    type Neighbors = Neighbors<'a, E, Ix>;
    fn neighbors(self, n: Self::NodeId) -> Self::Neighbors {
        self.graph.neighbors(n)
    }
}
impl<'a, N, E, Ix: IndexType> IntoNeighborsDirected for &'a SubgraphStartNodes<'_, N, E, Ix> {
    type NeighborsDirected = Neighbors<'a, E, Ix>;
    fn neighbors_directed(self, n: Self::NodeId, d: Direction) -> Self::NeighborsDirected {
        self.graph.neighbors_directed(n, d)
    }
}
impl<'a, N, E, Ix: IndexType> Visitable for &'a SubgraphStartNodes<'_, N, E, Ix> {
    type Map = FxHashSet<NodeIndex<Ix>>;
    fn visit_map(&self) -> Self::Map {
        FxHashSet::default()
    }
    fn reset_map(&self, map: &mut Self::Map) {
        map.clear()
    }
}
