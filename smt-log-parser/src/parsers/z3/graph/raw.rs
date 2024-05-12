use std::{collections::HashSet, fmt, ops::{Index, IndexMut}};

#[cfg(feature = "mem_dbg")]
// use fxhash::FxHashSet;
use mem_dbg::{MemDbg, MemSize};
use petgraph::{graph::NodeIndex, visit::{Reversed, Visitable}, Direction::{self, Incoming, Outgoing}};

use crate::{graph_idx, items::{ENodeIdx, EqGivenIdx, EqTransIdx, EqualityExpl, GraphIdx, InstIdx, TransitiveExplSegmentKind}, DiGraph, FxHashMap, NonMaxU32, Result, TiVec, Z3Parser};

use super::subgraph::{Subgraph, VisitBox};

graph_idx!(raw_idx, RawNodeIndex, RawEdgeIndex, RawIx);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct RawInstGraph {
    pub graph: DiGraph<Node, EdgeKind, RawIx>,
    enode_idx: RawNodeIndex,
    eq_trans_idx: RawNodeIndex,
    inst_idx: RawNodeIndex,
    eq_given_idx: FxHashMap<(EqGivenIdx, Option<NonMaxU32>), RawNodeIndex>,

    pub(super) stats: GraphStats,
}

impl RawInstGraph {
    pub fn new(parser: &Z3Parser) -> Result<Self> {
        let total_nodes = parser.insts.insts.len()
            + parser.egraph.enodes.len()
            + parser.egraph.equalities.given.len()
            + parser.egraph.equalities.transitive.len();
        let edges_lower_bound = parser.insts.insts.len()
            + parser.egraph.equalities.transitive.len();
        let mut graph = DiGraph::with_capacity(total_nodes, edges_lower_bound);
        let enode_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for enode in parser.egraph.enodes.keys() {
            let nidx = graph.add_node(Node::new(NodeKind::ENode(enode)));
            graph[nidx].raw_nidx = nidx;
        }
        let eq_trans_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for eq_trans in parser.egraph.equalities.transitive.keys() {
            let nidx = graph.add_node(Node::new(NodeKind::TransEquality(eq_trans)));
            graph[nidx].raw_nidx = nidx;
        }
        let inst_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for inst in parser.insts.insts.keys() {
            let nidx = graph.add_node(Node::new(NodeKind::Instantiation(inst)));
            graph[nidx].raw_nidx = nidx;
        }
        let mut eq_given_idx = FxHashMap::default();
        eq_given_idx.try_reserve(parser.egraph.equalities.given.len())?;
        for (eq_given, eq) in parser.egraph.equalities.given.iter_enumerated() {
            match eq {
                EqualityExpl::Congruence { uses, .. } => {
                    for i in 0..uses.len() {
                        let use_ = Some(NonMaxU32::new(i as u32).unwrap());
                        let node = graph.add_node(Node::new(NodeKind::GivenEquality(eq_given, use_)));
                        graph[node].raw_nidx = node;
                        eq_given_idx.insert((eq_given, use_), RawNodeIndex(node));
                    }
                }
                _ => {
                    let node = graph.add_node(Node::new(NodeKind::GivenEquality(eq_given, None)));
                    graph[node].raw_nidx = node;
                    eq_given_idx.insert((eq_given, None), RawNodeIndex(node));
                }
            }
        }
        let stats = GraphStats { hidden: graph.node_count() as u32, disabled: 0, generation: 0 };
        let mut self_ = RawInstGraph { graph, enode_idx, eq_given_idx, eq_trans_idx, inst_idx, stats };

        // Add instantiation blamed and yield edges
        for (idx, inst) in parser.insts.insts.iter_enumerated() {
            for yields in inst.yields_terms.iter() {
                self_.add_edge(idx, *yields, EdgeKind::Yield);
            }
            for (i, blame) in parser.insts.matches[inst.match_].trigger_matches().enumerate() {
                let trigger_term = i as u16;
                self_.add_edge(blame.enode(), idx, EdgeKind::Blame { trigger_term });
                for (i, eq) in blame.equalities().enumerate() {
                    self_.add_edge(eq, idx, EdgeKind::BlameEq { trigger_term, eq_order: i as u16 });
                }
            }
        }

        // Add given equality created edges
        for (idx, eq) in parser.egraph.equalities.given.iter_enumerated() {
            match eq {
                EqualityExpl::Root { .. } => (),
                EqualityExpl::Literal { eq, .. } =>
                    self_.add_edge(*eq, (idx, None), EdgeKind::EqualityFact),
                EqualityExpl::Congruence { uses, .. } => for (use_, arg_eqs) in uses.iter().enumerate() {
                    let use_ = Some(NonMaxU32::new(use_ as u32).unwrap());
                    for arg_eq in arg_eqs.iter() {
                        self_.add_edge(*arg_eq, (idx, use_), EdgeKind::EqualityCongruence);
                    }
                },
                EqualityExpl::Theory { .. } => (),
                EqualityExpl::Axiom { .. } => (),
                EqualityExpl::Unknown { .. } => (),
            }
        }

        // Add transitive equality created edges
        for (idx, eq) in parser.egraph.equalities.transitive.iter_enumerated() {
            let mut all = eq.all(true);
            while let Some(parent) = all.next() {
                match parent.kind {
                    TransitiveExplSegmentKind::Given(eq, use_) =>
                        self_.add_edge((eq, use_), idx, EdgeKind::TEqualitySimple { forward: parent.forward }),
                    TransitiveExplSegmentKind::Transitive(eq) =>
                        self_.add_edge(eq, idx, EdgeKind::TEqualityTransitive { forward: parent.forward }),
                }
            }
        }

        Ok(self_)
    }
    fn add_edge(&mut self, source: impl IndexesInstGraph, target: impl IndexesInstGraph, kind: EdgeKind) {
        let a = source.index(self).0;
        let b = target.index(self).0;
        self.graph.add_edge(a, b, kind);
    }

    pub fn partition(&mut self) -> Result<TiVec<GraphIdx, Subgraph>> {
        let mut subgraphs = TiVec::default();
        let mut discovered = VisitBox { dfs: self.graph.visit_map() };
        for node in self.graph.node_indices().map(RawNodeIndex) {
            let has_parents = self.graph.neighbors_directed(node.0, Incoming).next().is_some();
            if has_parents {
                continue;
            }
            let has_children = self.graph.neighbors_directed(node.0, Outgoing).next().is_some();
            if !has_children {
                continue;
            }
            if self.graph[node.0].subgraph.is_some() {
                continue;
            }

            // Construct subgraph
            let idx = subgraphs.next_key();
            let (subgraph, discovered_) = Subgraph::new(
                node,
                &mut self.graph,
                discovered,
                |node, i| node.subgraph = Some((idx, i)),
                |node| node.subgraph.unwrap().1,
            )?;
            discovered = discovered_;
            subgraphs.raw.try_reserve(1)?;
            subgraphs.push(subgraph);
        }
        Ok(subgraphs)
    }

    pub fn index(&self, kind: NodeKind) -> RawNodeIndex {
        match kind {
            NodeKind::ENode(enode) => enode.index(self),
            NodeKind::GivenEquality(eq, use_) => (eq, use_).index(self),
            NodeKind::TransEquality(eq) => eq.index(self),
            NodeKind::Instantiation(inst) => inst.index(self),
        }
    }

    pub fn rev(&self) -> Reversed<&petgraph::graph::DiGraph<Node, EdgeKind, RawIx>> {
        Reversed(&*self.graph)
    }
    pub fn neighbors_directed(&self, node: RawNodeIndex, dir: Direction) -> Vec<RawNodeIndex> {
        let (mut disabled, mut enabled): (Vec<_>, Vec<_>) = self.graph
            .neighbors_directed(node.0, dir)
            .map(RawNodeIndex)
            .partition(|n| self.graph[n.0].disabled());
        while let Some(next) = disabled.pop() {
            for n in self.graph.neighbors_directed(next.0, dir).map(RawNodeIndex) {
                if self.graph[n.0].disabled() {
                    disabled.push(n);
                } else {
                    enabled.push(n);
                }
            }
        }
        enabled
    }

    pub fn visible_nodes(&self) -> usize {
        self.graph.node_count() - self.stats.hidden as usize - self.stats.disabled as usize
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct GraphStats {
    pub hidden: u32,
    pub disabled: u32,
    /// How many times has the visibility of nodes been changed?
    /// Used to keep track of if the hidden graph needs to be recalculated.
    pub generation: u32,
}

impl GraphStats {
    pub fn set_state(&mut self, node: &mut Node, state: NodeState) -> bool {
        if node.state == state {
            return false;
        }
        self.generation = self.generation.wrapping_add(1);
        match node.state {
            NodeState::Disabled => self.disabled -= 1,
            NodeState::Hidden => self.hidden -= 1,
            _ => (),
        }
        match state {
            NodeState::Disabled => self.disabled += 1,
            NodeState::Hidden => self.hidden += 1,
            _ => (),
        }
        node.state = state;
        true
    }
}

#[derive(Debug, Clone)]
pub struct Node {
    state: NodeState,
    pub cost: f64,
    pub fwd_depth: Depth,
    pub bwd_depth: Depth,
    pub subgraph: Option<(GraphIdx, u32)>,
    kind: NodeKind,
    pub inst_parents: NextInsts,
    pub inst_children: NextInsts,
    pub raw_nidx: NodeIndex<RawIx>,
    pub part_of_ml: fxhash::FxHashSet<usize>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NodeState {
    Disabled,
    Hidden,
    Visible,
}

#[derive(Debug, Clone, Copy, Default)]
pub struct Depth {
    /// What is the shortest path to a root/leaf
    pub min: u32,
    /// What is the longest path to a root/leaf
    pub max: u32,
}

#[derive(Debug, Clone, Default)]
pub struct NextInsts {
    /// What are the immediate next instantiation nodes 
    pub nodes: fxhash::FxHashSet<NodeIndex<RawIx>>,
}

impl Node {
    fn new(kind: NodeKind) -> Self {
        Self { state: NodeState::Hidden, cost: 0.0, fwd_depth: Depth::default(), bwd_depth: Depth::default(), subgraph: None, kind, inst_parents: NextInsts { nodes: HashSet::default() }, inst_children: NextInsts { nodes: HashSet::default() }, raw_nidx: NodeIndex::default(), part_of_ml: HashSet::default() }
    }
    pub fn kind(&self) -> &NodeKind {
        &self.kind
    }

    pub fn disabled(&self) -> bool {
        matches!(self.state, NodeState::Disabled)
    }
    pub fn hidden(&self) -> bool {
        matches!(self.state, NodeState::Hidden)
    }
    pub fn visible(&self) -> bool {
        matches!(self.state, NodeState::Visible)
    }
    pub fn hidden_inst(&self) -> bool {
        matches!((self.state, self.kind), (NodeState::Hidden, NodeKind::Instantiation(_)))
    }
}

#[derive(Debug, Clone, Copy)]
pub enum NodeKind {
    /// Corresponds to `ENodeIdx`.
    /// 
    /// **Parents:** will always have 0 or 1 parents, if 1 then this will be an `Instantiation`.\
    /// **Children:** arbitrary count, will always be either `Instantiation` or
    /// `GivenEquality` of type `EqualityExpl::Literal`.
    ENode(ENodeIdx),
    /// Corresponds to `EqGivenIdx`.
    /// 
    /// **Parents:** will always have 0 or 1 parents, if 1 then this will be an
    /// `ENode` or a `TransEquality` depending on if it's a `Literal` or
    /// `Congruence` resp.\
    /// **Children:** arbitrary count, will always be `TransEquality` of type.
    GivenEquality(EqGivenIdx, Option<NonMaxU32>),
    /// Corresponds to `EqTransIdx`.
    /// 
    /// **Parents:** arbitrary count, will always be `GivenEquality` or
    /// `TransEquality`. The number of immediately reachable `GivenEquality` con
    /// be found in `TransitiveExpl::given_len`.\
    /// **Children:** arbitrary count, can be `GivenEquality`, `TransEquality`
    /// or `Instantiation`.
    TransEquality(EqTransIdx),
    /// Corresponds to `InstIdx`.
    /// 
    /// **Parents:** arbitrary count, will always be `ENode` or `TransEquality`.\
    /// **Children:** arbitrary count, will always be `ENode`.
    Instantiation(InstIdx),
}

impl fmt::Display for NodeKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            NodeKind::ENode(enode) => write!(f, "{enode:?}"),
            NodeKind::GivenEquality(eq, use_) =>
                write!(f, "{eq:?}{}", use_.filter(|u| *u != NonMaxU32::ZERO).map(|u| format!("[{u}]")).unwrap_or_default()),
            NodeKind::TransEquality(eq) => write!(f, "{eq:?}"),
            NodeKind::Instantiation(inst) => write!(f, "{inst:?}"),
        }
    }
}

impl NodeKind {
    pub fn enode(&self) -> Option<ENodeIdx> {
        match self {
            Self::ENode(enode) => Some(*enode),
            _ => None,
        }
    }
    pub fn eq_given(&self) -> Option<(EqGivenIdx, Option<NonMaxU32>)> {
        match self {
            Self::GivenEquality(eq, use_) => Some((*eq, *use_)),
            _ => None,
        }
    }
    pub fn eq_trans(&self) -> Option<EqTransIdx> {
        match self {
            Self::TransEquality(eq) => Some(*eq),
            _ => None,
        }
    }
    pub fn inst(&self) -> Option<InstIdx> {
        match self {
            Self::Instantiation(inst) => Some(*inst),
            _ => None,
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub enum EdgeKind {
    /// Instantiation -> ENode
    Yield,
    /// ENode -> Instantiation
    Blame { trigger_term: u16 },
    /// TransEquality -> Instantiation
    BlameEq { trigger_term: u16, eq_order: u16 },
    /// ENode -> GivenEquality (`EqualityExpl::Literal`)
    EqualityFact,
    /// TransEquality -> GivenEquality (`EqualityExpl::Congruence`)
    EqualityCongruence,
    /// GivenEquality -> TransEquality (`TransitiveExplSegmentKind::Leaf`)
    TEqualitySimple { forward: bool },
    /// TransEquality -> TransEquality (`TransitiveExplSegmentKind::Transitive`)
    TEqualityTransitive { forward: bool },
}

pub trait IndexesInstGraph {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex;
}
impl IndexesInstGraph for ENodeIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(graph.enode_idx.0.index() + usize::from(*self)))
    }
}
impl IndexesInstGraph for EqTransIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(graph.eq_trans_idx.0.index() + usize::from(*self)))
    }
}
impl IndexesInstGraph for InstIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(graph.inst_idx.0.index() + usize::from(*self)))
    }
}
impl IndexesInstGraph for (EqGivenIdx, Option<NonMaxU32>) {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        graph.eq_given_idx[self]
    }
}
impl IndexesInstGraph for RawNodeIndex {
    fn index(&self, _graph: &RawInstGraph) -> RawNodeIndex {
        *self
    }
}

impl<T: IndexesInstGraph> Index<T> for RawInstGraph {
    type Output = Node;
    fn index(&self, index: T) -> &Self::Output {
        let index = index.index(self);
        &self.graph[index.0]
    }
}
impl<T: IndexesInstGraph> IndexMut<T> for RawInstGraph {
    fn index_mut(&mut self, index: T) -> &mut Self::Output {
        let index = index.index(self);
        &mut self.graph[index.0]
    }
}
