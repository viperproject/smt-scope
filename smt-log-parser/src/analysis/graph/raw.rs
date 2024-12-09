use std::{
    fmt,
    ops::{Index, IndexMut},
};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use petgraph::{
    graph::NodeIndex,
    visit::Reversed,
    Direction::{self},
};

use crate::{
    graph_idx,
    items::{
        ENodeIdx, EqGivenIdx, EqTransIdx, EqualityExpl, GraphIdx, InstIdx, ProofIdx, StackIdx,
        TransitiveExplSegmentKind,
    },
    DiGraph, FxHashMap, FxHashSet, NonMaxU32, Result, Z3Parser,
};

graph_idx!(raw_idx, RawNodeIndex, RawEdgeIndex, RawIx);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct RawInstGraph {
    pub graph: DiGraph<Node, EdgeKind, RawIx>,
    inst_idx: RawNodeIndex,
    enode_idx: RawNodeIndex,
    eq_trans_idx: RawNodeIndex,
    eq_given_idx: FxHashMap<(EqGivenIdx, Option<NonMaxU32>), RawNodeIndex>,
    proofs_idx: RawNodeIndex,

    pub(crate) stats: GraphStats,
}

impl RawInstGraph {
    pub fn new(parser: &Z3Parser) -> Result<Self> {
        let total_nodes = parser.insts.insts.len()
            + parser.egraph.enodes.len()
            + parser.egraph.equalities.given.len()
            + parser.egraph.equalities.transitive.len();
        let edges_lower_bound =
            parser.insts.insts.len() + parser.egraph.equalities.transitive.len();
        let mut graph = DiGraph::with_capacity(total_nodes, edges_lower_bound);
        let inst_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for inst in parser.insts.insts.keys() {
            graph.add_node(Node::new(NodeKind::Instantiation(inst)));
        }
        let enode_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for enode in parser.egraph.enodes.keys() {
            graph.add_node(Node::new(NodeKind::ENode(enode)));
        }
        let eq_trans_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for eq_trans in parser.egraph.equalities.transitive.keys() {
            graph.add_node(Node::new(NodeKind::TransEquality(eq_trans)));
        }
        let mut eq_given_idx = FxHashMap::default();
        eq_given_idx.try_reserve(parser.egraph.equalities.given.len())?;
        for (eq_given, eq) in parser.egraph.equalities.given.iter_enumerated() {
            match eq {
                EqualityExpl::Congruence { uses, .. } => {
                    for i in 0..uses.len() {
                        let use_ = Some(NonMaxU32::new(i as u32).unwrap());
                        let node =
                            graph.add_node(Node::new(NodeKind::GivenEquality(eq_given, use_)));
                        eq_given_idx.insert((eq_given, use_), RawNodeIndex(node));
                    }
                }
                _ => {
                    let node = graph.add_node(Node::new(NodeKind::GivenEquality(eq_given, None)));
                    eq_given_idx.insert((eq_given, None), RawNodeIndex(node));
                }
            }
        }
        let proofs_idx = RawNodeIndex(NodeIndex::new(graph.node_count()));
        for ps_idx in parser.proofs().keys() {
            graph.add_node(Node::new(NodeKind::Proof(ps_idx)));
        }
        let stats = GraphStats {
            hidden: graph.node_count() as u32,
            disabled: 0,
            generation: 0,
        };
        let mut self_ = RawInstGraph {
            graph,
            inst_idx,
            enode_idx,
            eq_given_idx,
            eq_trans_idx,
            proofs_idx,
            stats,
        };

        // Add instantiation blamed and yield edges
        for (idx, inst) in parser.insts.insts.iter_enumerated() {
            for yields in inst.yields_terms.iter() {
                self_.add_edge(idx, *yields, EdgeKind::Yield);
            }
            for (i, blame) in parser.insts.matches[inst.match_]
                .pattern_matches()
                .enumerate()
            {
                let pattern_term = i as u16;
                self_.add_edge(blame.enode(), idx, EdgeKind::Blame { pattern_term });
                for (i, eq) in blame.equalities().enumerate() {
                    self_.add_edge(
                        eq,
                        idx,
                        EdgeKind::BlameEq {
                            pattern_term,
                            eq_order: i as u16,
                        },
                    );
                }
            }
        }

        // Add given equality created edges
        for (idx, eq) in parser.egraph.equalities.given.iter_enumerated() {
            match eq {
                EqualityExpl::Root { .. } => (),
                EqualityExpl::Literal { eq, .. } => {
                    self_.add_edge(*eq, (idx, None), EdgeKind::EqualityFact)
                }
                EqualityExpl::Congruence { uses, .. } => {
                    for (use_, arg_eqs) in uses.iter().enumerate() {
                        let use_ = Some(NonMaxU32::new(use_ as u32).unwrap());
                        for arg_eq in arg_eqs.iter() {
                            self_.add_edge(*arg_eq, (idx, use_), EdgeKind::EqualityCongruence);
                        }
                    }
                }
                EqualityExpl::Theory { .. } => (),
                EqualityExpl::Axiom { .. } => (),
                EqualityExpl::Unknown { .. } => (),
            }
        }

        // Add transitive equality created edges
        for (idx, eq) in parser.egraph.equalities.transitive.iter_enumerated() {
            let all = eq.all(true);
            for parent in all {
                use TransitiveExplSegmentKind::*;
                match parent.kind {
                    Given((eq, use_)) => self_.add_edge(
                        (eq, use_),
                        idx,
                        EdgeKind::TEqualitySimple {
                            forward: parent.forward,
                        },
                    ),
                    Transitive(eq) => self_.add_edge(
                        eq,
                        idx,
                        EdgeKind::TEqualityTransitive {
                            forward: parent.forward,
                        },
                    ),
                    Error(..) => (),
                }
            }
        }

        // Add proof step edges
        for (idx, ps) in parser.proofs().iter_enumerated() {
            for pre in ps.prerequisites.iter() {
                self_.add_edge(*pre, idx, EdgeKind::ProofStep)
            }
        }

        for (iidx, inst) in parser.insts.insts.iter_enumerated() {
            let Some(proof) = inst.proof_id.proof() else {
                continue;
            };
            self_.add_edge(iidx, proof, EdgeKind::YieldProof);
        }

        debug_assert!(
            !petgraph::algo::is_cyclic_directed(&*self_.graph),
            "Graph is cyclic, this should not happen by construction!"
        );
        Ok(self_)
    }
    fn add_edge(
        &mut self,
        source: impl IndexesInstGraph,
        target: impl IndexesInstGraph,
        kind: EdgeKind,
    ) {
        let a = source.index(self).0;
        let b = target.index(self).0;
        self.graph.add_edge(a, b, kind);
    }

    pub fn index(&self, kind: NodeKind) -> RawNodeIndex {
        match kind {
            NodeKind::ENode(enode) => enode.index(self),
            NodeKind::GivenEquality(eq, use_) => (eq, use_).index(self),
            NodeKind::TransEquality(eq) => eq.index(self),
            NodeKind::Instantiation(inst) => inst.index(self),
            NodeKind::Proof(ps) => ps.index(self),
        }
    }

    pub fn rev(&self) -> Reversed<&petgraph::graph::DiGraph<Node, EdgeKind, RawIx>> {
        Reversed(&*self.graph)
    }

    pub fn visible_nodes(&self) -> usize {
        self.graph.node_count() - self.stats.hidden as usize - self.stats.disabled as usize
    }
    pub fn node_indices(&self) -> impl Iterator<Item = RawNodeIndex> {
        self.graph.node_indices().map(RawNodeIndex)
    }

    /// Similar to `self.graph.neighbors` but will walk through disabled nodes.
    ///
    /// Note: Iterating the neighbors is **not** a O(1) operation.
    pub fn neighbors(&self, node: RawNodeIndex) -> Neighbors<'_> {
        self.neighbors_directed(node, Direction::Outgoing)
    }
    /// Similar to `self.graph.neighbors_directed` but will walk through
    /// disabled nodes.
    ///
    /// Note: Iterating the neighbors is **not** a O(1) operation.
    pub fn neighbors_directed(&self, node: RawNodeIndex, dir: Direction) -> Neighbors<'_> {
        let direct = self.graph.neighbors_directed(node.0, dir).detach();
        let walk = WalkNeighbors {
            dir,
            visited: FxHashSet::default(),
            stack: Vec::new(),
            direct,
        };
        Neighbors { raw: self, walk }
    }

    pub fn inst_to_raw_idx(&self) -> impl Fn(InstIdx) -> RawNodeIndex {
        let inst_idx = self.inst_idx;
        move |inst| RawNodeIndex(NodeIndex::new(inst_idx.0.index() + usize::from(inst)))
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

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
pub struct Node {
    state: NodeState,
    pub cost: f64,
    pub fwd_depth: Depth,
    pub bwd_depth: Depth,
    pub subgraph: Option<(GraphIdx, u32)>,
    kind: NodeKind,
    pub parents: NextNodes,
    pub children: NextNodes,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NodeState {
    Disabled,
    Hidden,
    Visible,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy, Default)]
pub struct Depth {
    /// What is the shortest path to a root/leaf
    pub min: u32,
    /// What is the longest path to a root/leaf
    pub max: u32,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Default)]
pub struct NextNodes {
    /// What are the immediate next instantiation nodes
    pub insts: FxHashSet<InstIdx>,
    /// How many parents/children does this node have (not-necessarily
    /// instantiation nodes), walking through disabled nodes.
    pub count: u32,
}

impl Node {
    fn new(kind: NodeKind) -> Self {
        Self {
            state: NodeState::Hidden,
            cost: 0.0,
            fwd_depth: Depth::default(),
            bwd_depth: Depth::default(),
            subgraph: None,
            kind,
            parents: NextNodes::default(),
            children: NextNodes::default(),
        }
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
        matches!(
            (self.state, self.kind),
            (NodeState::Hidden, NodeKind::Instantiation(_))
        )
    }

    pub fn frame(&self, parser: &Z3Parser) -> Option<StackIdx> {
        match *self.kind() {
            NodeKind::Instantiation(iidx) => Some(parser[iidx].frame),
            NodeKind::ENode(eidx) => Some(parser[eidx].frame),
            NodeKind::GivenEquality(..) | NodeKind::TransEquality(_) => None,
            NodeKind::Proof(psidx) => Some(parser[psidx].frame),
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy)]
pub enum NodeKind {
    /// Corresponds to `InstIdx`.
    ///
    /// **Parents:** (small) arbitrary count, will always be `ENode` or
    /// `TransEquality`.\
    /// **Children:** (small) arbitrary count, will always be `ENode`.
    Instantiation(InstIdx),
    /// Corresponds to `ENodeIdx`.
    ///
    /// **Parents:** will always have 0 or 1 parents, if 1 then this will be an `Instantiation`.\
    /// **Children:** (large) arbitrary count, will always be either
    /// `Instantiation` or `GivenEquality` of type `EqualityExpl::Literal`.
    ENode(ENodeIdx),
    /// Corresponds to `EqGivenIdx`.
    ///
    /// **Parents:** will always have 0 or 1 parents, if 1 then this will be an
    /// `ENode` or a `TransEquality` depending on if it's a `Literal` or
    /// `Congruence` resp.\
    /// **Children:** (small) arbitrary count, will always be `TransEquality` of
    /// type.
    GivenEquality(EqGivenIdx, Option<NonMaxU32>),
    /// Corresponds to `EqTransIdx`.
    ///
    /// **Parents:** arbitrary count, will always be `GivenEquality` or
    /// `TransEquality`. The number of immediately reachable `GivenEquality` con
    /// be found in `TransitiveExpl::given_len`.\
    /// **Children:** (large) arbitrary count, can be `GivenEquality`,
    /// `TransEquality` or `Instantiation`.
    TransEquality(EqTransIdx),
    /// Corresponds to `ProofIdx`.
    ///
    /// **Parents:** (small) arbitrary count, will always be `Proof` or
    /// `Instantiation`.
    /// **Children:** (small) arbitrary count, will always be `Proof`.
    Proof(ProofIdx),
}

impl fmt::Display for NodeKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            NodeKind::ENode(enode) => write!(f, "{enode:?}"),
            NodeKind::GivenEquality(eq, use_) => write!(
                f,
                "{eq:?}{}",
                use_.filter(|u| *u != NonMaxU32::ZERO)
                    .map(|u| format!("[{u}]"))
                    .unwrap_or_default()
            ),
            NodeKind::TransEquality(eq) => write!(f, "{eq:?}"),
            NodeKind::Instantiation(inst) => write!(f, "{inst:?}"),
            NodeKind::Proof(ps) => write!(f, "{ps:?}"),
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

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy)]
pub enum EdgeKind {
    /// Instantiation -> ENode
    Yield,
    /// ENode -> Instantiation
    Blame { pattern_term: u16 },
    /// TransEquality -> Instantiation
    BlameEq { pattern_term: u16, eq_order: u16 },
    /// ENode -> GivenEquality (`EqualityExpl::Literal`)
    EqualityFact,
    /// TransEquality -> GivenEquality (`EqualityExpl::Congruence`)
    EqualityCongruence,
    /// GivenEquality -> TransEquality (`TransitiveExplSegmentKind::Leaf`)
    TEqualitySimple { forward: bool },
    /// TransEquality -> TransEquality (`TransitiveExplSegmentKind::Transitive`)
    TEqualityTransitive { forward: bool },
    /// Proof -> Proof
    ProofStep,
    /// Instantiation -> Proof
    YieldProof,
}

pub trait IndexesInstGraph {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex;
}
impl IndexesInstGraph for InstIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        graph.inst_to_raw_idx()(*self)
    }
}
impl IndexesInstGraph for ENodeIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(
            graph.enode_idx.0.index() + usize::from(*self),
        ))
    }
}
impl IndexesInstGraph for EqTransIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(
            graph.eq_trans_idx.0.index() + usize::from(*self),
        ))
    }
}
impl IndexesInstGraph for (EqGivenIdx, Option<NonMaxU32>) {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        graph.eq_given_idx[self]
    }
}
impl IndexesInstGraph for ProofIdx {
    fn index(&self, graph: &RawInstGraph) -> RawNodeIndex {
        RawNodeIndex(NodeIndex::new(
            graph.proofs_idx.0.index() + usize::from(*self),
        ))
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

#[derive(Clone)]
pub struct Neighbors<'a> {
    pub raw: &'a RawInstGraph,
    pub walk: WalkNeighbors,
}

impl<'a> Neighbors<'a> {
    pub fn detach(self) -> WalkNeighbors {
        self.walk
    }

    pub fn count_hidden(self) -> usize {
        let raw = self.raw;
        self.filter(|&ix| raw[ix].hidden()).count()
    }
}

impl Iterator for Neighbors<'_> {
    type Item = RawNodeIndex;
    fn next(&mut self) -> Option<Self::Item> {
        self.walk.next(self.raw)
    }
}

#[derive(Clone)]
pub struct WalkNeighbors {
    pub dir: Direction,
    pub visited: FxHashSet<RawNodeIndex>,
    pub stack: Vec<RawNodeIndex>,
    pub direct: petgraph::graph::WalkNeighbors<RawIx>,
}

impl WalkNeighbors {
    pub fn next(&mut self, raw: &RawInstGraph) -> Option<RawNodeIndex> {
        // TODO: decide if we want to prevent direct neighbors from being
        // visited multiple times if there are multiple direct edges.
        loop {
            // let mut idx = None;
            // while let Some((_, direct)) = self.direct.next(&raw.graph) {
            //     let direct = RawNodeIndex(direct);
            //     if self.visited.insert(direct) {
            //         idx = Some(direct);
            //         break;
            //     }
            // }
            // let idx = idx.or_else(|| self.stack.pop())?;
            let idx = self
                .direct
                .next(&raw.graph)
                .map(|(_, n)| RawNodeIndex(n))
                .or_else(|| self.stack.pop())?;
            let node = &raw[idx];
            if !node.disabled() {
                return Some(idx);
            }
            for n in raw
                .graph
                .neighbors_directed(idx.0, self.dir)
                .map(RawNodeIndex)
            {
                if self.visited.insert(n) {
                    self.stack.push(n);
                }
            }
        }
    }
}
