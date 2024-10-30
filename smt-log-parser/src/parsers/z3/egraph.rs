use std::collections::hash_map::Entry;

use fxhash::FxHashSet;
#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use petgraph::{
    graph::{DiGraph, EdgeIndex, NodeIndex},
    visit::EdgeRef,
};

use crate::{
    items::{
        ENode, ENodeIdx, EqGivenIdx, EqTransIdx, Equality, EqualityExpl, InstIdx, StackIdx,
        TermIdx, TransitiveExpl, TransitiveExplSegment, TransitiveExplSegmentKind,
    },
    BoxSlice, Error, FxHashMap, NonMaxU32, Result, TiVec,
};

use super::stack::Stack;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct EGraph {
    term_to_enode: FxHashMap<TermIdx, ENodeIdx>,
    pub(crate) enodes: TiVec<ENodeIdx, ENode>,
    pub equalities: Equalities,
}

impl EGraph {
    pub fn new_enode(
        &mut self,
        created_by: Option<InstIdx>,
        term: TermIdx,
        z3_generation: Option<u32>,
        stack: &Stack,
    ) -> Result<ENodeIdx> {
        // TODO: why does this happen sometimes?
        // if created_by.is_none() && z3_generation.is_some() {
        //     debug_assert_eq!(
        //         z3_generation.unwrap(),
        //         0,
        //         "enode with no creator has non-zero generation"
        //     );
        // }
        self.enodes.raw.try_reserve(1)?;
        let enode = self.enodes.push_and_get_key(ENode {
            frame: stack.active_frame(),
            created_by,
            owner: term,
            z3_generation,
            equalities: Vec::new(),
            transitive: FxHashMap::default(),
            self_transitive: None,
        });
        self.term_to_enode.try_reserve(1)?;
        let _old = self.term_to_enode.insert(term, enode);
        // TODO: why does this happen sometimes?
        // if let Some(old) = old {
        //     assert!(self.enodes[old].frame.is_some());
        //     assert!(!stack.stack_frames[self.enodes[old].frame.unwrap()].active);
        // }
        Ok(enode)
    }

    pub fn get_enode(&self, term: TermIdx, stack: &Stack) -> Result<ENodeIdx> {
        let enode = *self
            .term_to_enode
            .get(&term)
            .ok_or_else(|| Error::UnknownEnode(term))?;
        let frame = self.enodes[enode].frame;
        let frame_status = stack.stack_frames[frame].active.status();
        // This cannot be an enode if it points to a popped stack frame
        if frame_status.is_ended() {
            Err(Error::EnodePoppedFrame(frame))
        } else {
            Ok(enode)
        }
    }

    pub fn get_owner(&self, enode: ENodeIdx) -> TermIdx {
        self.enodes[enode].owner
    }

    pub fn new_given_equality(
        &mut self,
        from: ENodeIdx,
        expl: EqualityExpl,
        stack: &Stack,
    ) -> Result<()> {
        let to = expl.to();
        self.equalities.given.raw.try_reserve(1)?;
        let expl = self.equalities.given.push_and_get_key(expl);
        let enode = &mut self.enodes[from];
        let eq = Equality {
            _frame: stack.active_frame(),
            to,
            expl,
        };
        enode.equalities.try_reserve(1)?;
        enode.equalities.push(eq);
        // TODO: is ok to simply ignore the old equality, or should we also blame it later on?
        // let (new, others) = enode.equalities.split_last().unwrap();
        // if let Some(old) = others.last() {
        //     let inactive = old.frame.map(|f| !stack.stack_frames[f].active).unwrap_or_default();
        //     if inactive {
        //         return;
        //     }
        //     let is_root = matches!(old.expl, EqualityExpl::Root { .. });
        //     let root_unchanged = is_root || (self.path_to_root(old.to).last().unwrap() == self.path_to_root(new.to).last().unwrap());
        //     if root_unchanged {
        //         return;
        //     }

        //     let is_unknown = matches!(enode.get_equality(stack).unwrap().expl, EqualityExpl::Unknown { .. });
        //     let equivalent = old.expl == enode.get_equality(stack).unwrap().expl;
        //     // let test = old.frame.is_some_and(|f| usize::from(f) == 854);
        //     if !equivalent && !is_unknown {
        //         panic!();
        //     }
        // }
        Ok(())
    }

    pub fn new_trans_equality(
        &mut self,
        from: ENodeIdx,
        to: ENodeIdx,
        stack: &Stack,
        can_mismatch: impl Fn(&EGraph) -> bool,
    ) -> Result<EqTransIdx> {
        if from == to {
            // Handle the easy and common case of `(#n #n)` separately
            self.equalities.transitive.raw.try_reserve(1)?;
            Ok(*self.enodes[from].self_transitive.get_or_insert_with(|| {
                self.equalities
                    .transitive
                    .push_and_get_key(TransitiveExpl::empty(to))
            }))
        } else {
            self.construct_trans_equality(from, to, stack, can_mismatch)
        }
    }

    fn path_to_root(
        &self,
        mut from: ENodeIdx,
        root: Option<ENodeIdx>,
        stack: &Stack,
    ) -> Result<(Option<ENodeIdx>, Vec<ENodeIdx>)> {
        let mut visited = FxHashSet::default();
        visited.try_reserve(1)?;
        visited.insert(from);

        let mut path = Vec::new();
        path.try_reserve(1)?;
        path.push(from);
        while let Some(eq) = &self.enodes[from].get_equality(stack) {
            if visited.contains(&eq.to) {
                // On rare occasions there is a cycle in the equality graph
                // (EXPLAIN). Return the path and the root as just before
                // cycling (`from`).
                return Ok((Some(from), path));
            }
            from = eq.to;
            visited.try_reserve(1)?;
            visited.insert(from);
            path.try_reserve(1)?;
            path.push(from);
            if root.is_some_and(|root| root == from) {
                return Ok((Some(from), path));
            }
        }
        Ok((None, path))
    }

    fn get_simple_path(
        &self,
        from: ENodeIdx,
        to: ENodeIdx,
        stack: &Stack,
        can_mismatch: impl Fn(&EGraph) -> bool,
    ) -> Result<Option<SimplePath>> {
        let (root, f_path) = self.path_to_root(from, None, stack)?;
        let f_root = f_path.len() - 1;
        let (_, t_path) = self.path_to_root(to, root, stack)?;
        let t_root = t_path.len() - 1;

        if f_path[f_root] != t_path[t_root] {
            // Root may not always be the same from v4.12.3 onwards if `to` is an `ite` expression. See:
            // https://github.com/Z3Prover/z3/commit/faf14012ba18d21c1fcddbdc321ac127f019fa03#diff-0a9ec50ded668e51578edc67ecfe32380336b9cbf12c5d297e2d3759a7a39847R2417-R2419
            if can_mismatch(self) {
                // Return no path if the roots are different.
                return Ok(None);
            } else {
                return Err(Error::EnodeRootMismatch(from, to));
            }
        }
        let mut shared = 1;
        while shared < f_path.len()
            && shared < t_path.len()
            && f_path[f_root - shared] == t_path[t_root - shared]
        {
            shared += 1;
        }
        let path = SimplePath {
            from_to_root: f_path,
            to_to_root: t_path,
            shared,
        };
        Ok(Some(path))
    }

    fn construct_trans_equality(
        &mut self,
        from: ENodeIdx,
        to: ENodeIdx,
        stack: &Stack,
        can_mismatch: impl Fn(&EGraph) -> bool,
    ) -> Result<EqTransIdx> {
        debug_assert_ne!(from, to);
        let Some(simple_path) = self.get_simple_path(from, to, stack, can_mismatch)? else {
            // There was a root mismatch (and `can_mismatch` was true), so we
            // can't construct a simple path.
            self.enodes[from].transitive.try_reserve(1)?;
            let trans = match self.enodes[from].transitive.entry(to) {
                Entry::Occupied(mut o) => {
                    let trans = *o.get();
                    if self.equalities.transitive[trans].given_len != 0 {
                        // These two nodes are no longer equal (this is an old
                        // transitive equality that is no longer valid).
                        self.equalities.transitive.raw.try_reserve(1)?;
                        let trans = self
                            .equalities
                            .transitive
                            .push_and_get_key(TransitiveExpl::empty(to));
                        o.insert(trans);
                        trans
                    } else {
                        trans
                    }
                }
                Entry::Vacant(v) => {
                    self.equalities.transitive.raw.try_reserve(1)?;
                    let trans = self
                        .equalities
                        .transitive
                        .push_and_get_key(TransitiveExpl::empty(to));
                    *v.insert(trans)
                }
            };
            return Ok(trans);
        };
        let edges_len = simple_path.edges_len();
        debug_assert_ne!(edges_len, 0);
        let mut graph = simple_path.initialise_graph(self, stack);

        // Add transitive edges to graph, start by trying to find either forward
        // or backward full solutions.
        if let Some((forward, solution)) = graph.add_trans_from(0, self) {
            debug_assert!(forward);
            return Ok(solution);
        }
        let trans = if let Some((forward, solution)) = graph.add_trans_from(edges_len, self) {
            debug_assert!(!forward);
            let inner = &self.equalities.transitive[solution];
            if inner.path.len() == 1 {
                match inner.path[0] {
                    TransitiveExplSegment {
                        forward: false,
                        kind: TransitiveExplSegmentKind::Transitive(idx),
                    } => return Ok(idx),
                    TransitiveExplSegment {
                        forward: true,
                        kind: TransitiveExplSegmentKind::Transitive(_),
                    } => unreachable!(),
                    TransitiveExplSegment {
                        kind: TransitiveExplSegmentKind::Given(..),
                        ..
                    } => (),
                }
            }
            let solution = TransitiveExplSegment {
                forward,
                kind: TransitiveExplSegmentKind::Transitive(solution),
            };
            TransitiveExpl::new([solution].into_iter(), 1, to)?
        } else {
            for idx in 1..edges_len {
                graph.add_trans_from(idx, self);
            }
            // Find the shortest path
            for idx in (0..edges_len).rev() {
                let idx = NodeIndex::new(idx);
                // Use `.rev()` here to prefer transitive edges over leaf edges,
                // though hopefully the `min_by_key` should be unique.
                let min = graph
                    .graph
                    .edges(idx)
                    .min_by_key(|edge| graph.graph[edge.target()].0)
                    .unwrap();
                let (cost, id) = (graph.graph[min.target()].0, min.id());
                let idx = &mut graph.graph[idx];
                idx.0 = cost + 1;
                idx.1 = Some(id);
            }

            let start = NodeIndex::new(0);
            let mut edge = graph.graph[start].1;
            let path_length = graph.graph[start].0;
            TransitiveExpl::new(
                (0..path_length)
                    .map(|_| {
                        let kind = &graph.graph[edge.unwrap()];
                        edge = graph.graph[graph.graph.edge_endpoints(edge.unwrap()).unwrap().1].1;
                        kind
                    })
                    .copied(),
                edges_len,
                to,
            )?
        };
        let trans = self.insert_trans_equality(trans, stack)?;
        debug_assert_eq!(self.equalities.walk_to(from, trans), to);
        self.enodes[from].transitive.try_reserve(1)?;
        let old = self.enodes[from].transitive.insert(to, trans);
        debug_assert_eq!(old, None);
        Ok(trans)
    }

    fn insert_trans_equality(
        &mut self,
        mut trans: TransitiveExpl,
        stack: &Stack,
    ) -> Result<EqTransIdx> {
        // Find the current congruence uses
        for seg in trans.path.iter_mut() {
            if let TransitiveExplSegmentKind::Given(cg, idx) = &mut seg.kind {
                debug_assert_eq!(*idx, None);
                let EqualityExpl::Congruence { arg_eqs, .. } = &self.equalities.given[*cg] else {
                    continue;
                };
                let mut args = Vec::new();
                args.try_reserve_exact(arg_eqs.len())?;
                args.extend(arg_eqs.iter().copied());

                let mut use_ = Vec::new();
                use_.try_reserve_exact(arg_eqs.len())?;
                for (from, to) in args {
                    let trans = self.new_trans_equality(from, to, stack, |_| false)?;
                    use_.push(trans);
                }
                let EqualityExpl::Congruence { uses, .. } = &mut self.equalities.given[*cg] else {
                    unreachable!()
                };
                let real_idx = uses.iter().position(|u| ***u == use_).unwrap_or_else(|| {
                    uses.push(BoxSlice(use_.into_boxed_slice()));
                    uses.len() - 1
                });
                *idx = Some(NonMaxU32::new(real_idx as u32).unwrap());
            }
        }

        self.equalities.transitive.raw.try_reserve(1)?;
        let trans = self.equalities.transitive.push_and_get_key(trans);
        Ok(trans)
    }
}

impl std::ops::Index<ENodeIdx> for EGraph {
    type Output = ENode;
    fn index(&self, idx: ENodeIdx) -> &Self::Output {
        &self.enodes[idx]
    }
}

impl ENode {
    pub fn get_equality(&self, _stack: &Stack) -> Option<&Equality> {
        // TODO: why are we allowed to use equalities from popped stack frames?
        // self.equalities.iter().rev().find(|eq| eq.frame.map(|f| stack.stack_frames[f].active).unwrap_or(true))
        self.equalities.last()
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Equalities {
    pub(crate) given: TiVec<EqGivenIdx, EqualityExpl>,
    pub(crate) transitive: TiVec<EqTransIdx, TransitiveExpl>,
}

impl Equalities {
    pub fn from(&self, eq: EqTransIdx) -> ENodeIdx {
        let eq = &self.transitive[eq];
        eq.path
            .first()
            .map(|seg| match seg {
                TransitiveExplSegment {
                    kind: TransitiveExplSegmentKind::Given(eq, _),
                    forward,
                } => {
                    if *forward {
                        self.given[*eq].from()
                    } else {
                        self.given[*eq].to()
                    }
                }
                TransitiveExplSegment {
                    kind: TransitiveExplSegmentKind::Transitive(eq),
                    forward,
                } => {
                    if *forward {
                        self.from(*eq)
                    } else {
                        self.transitive[*eq].to
                    }
                }
            })
            .unwrap_or(eq.to)
    }

    pub fn walk_trans<E>(
        &self,
        fwd: bool,
        eq: EqTransIdx,
        f: &mut impl FnMut(EqGivenIdx, bool) -> std::result::Result<(), E>,
    ) -> std::result::Result<(), E> {
        let all = self.transitive[eq].all(fwd);
        for next in all {
            match next {
                TransitiveExplSegment {
                    forward,
                    kind: TransitiveExplSegmentKind::Given(eq, _),
                } => f(eq, forward)?,
                TransitiveExplSegment {
                    forward,
                    kind: TransitiveExplSegmentKind::Transitive(eq),
                } => self.walk_trans(forward, eq, f)?,
            }
        }
        Ok(())
    }
    pub fn is_equal(
        &self,
        eq: EqTransIdx,
        simple: &mut impl Iterator<Item = (EqGivenIdx, bool)>,
    ) -> Option<bool> {
        let res = self.walk_trans(true, eq, &mut |eq, eq_fwd| {
            // Return `Err(false)` if we're out of simple, this should never
            // happen.
            let (simple, fwd) = simple.next().ok_or(false)?;
            // Return `Ok` if equal, else `Err(true)`.
            (simple == eq && fwd == eq_fwd).then_some(()).ok_or(true)
        });
        // Map `Ok` -> `Ok(true)`, `Err(true)` -> `Ok(false)`, `Err(false)` -> `Err`.
        res.map_or_else(|e| e.then_some(false), |_| Some(true))
    }
    pub fn walk_to(&self, mut from: ENodeIdx, eq: EqTransIdx) -> ENodeIdx {
        #[derive(Debug)]
        enum Never {}
        self.walk_trans::<Never>(true, eq, &mut |eq, fwd| {
            from = self.given[eq].walk(from, fwd).unwrap();
            Ok(())
        })
        .unwrap();
        from
    }
    pub fn path(&self, eq: EqTransIdx) -> Vec<ENodeIdx> {
        let mut path = Vec::new();
        #[derive(Debug)]
        enum Never {}
        self.walk_trans::<Never>(true, eq, &mut |eq, fwd| {
            let eq = &self.given[eq];
            let from = if fwd { eq.from() } else { eq.to() };
            path.push(from);
            Ok(())
        })
        .unwrap();
        path.push(self.transitive[eq].to);
        path
    }
}

#[derive(Debug)]
pub struct SimplePath {
    from_to_root: Vec<ENodeIdx>,
    to_to_root: Vec<ENodeIdx>,
    shared: usize,
}
impl SimplePath {
    pub fn edges_len(&self) -> usize {
        self.from_to_root.len() + self.to_to_root.len() - 2 * self.shared
    }
    pub fn all_simple_edges<'a>(
        &'a self,
        egraph: &'a EGraph,
        stack: &'a Stack,
    ) -> impl DoubleEndedIterator<Item = (ENodeIdx, EqGivenIdx, bool)> + 'a {
        let from_to_join = self.from_to_root[..self.from_to_root.len() - self.shared]
            .iter()
            .copied();
        let from_to_join = from_to_join.map(|e| {
            let eq = &egraph.enodes[e].get_equality(stack).unwrap();
            (eq.to, eq.expl, true)
        });
        let join_to_to = self.to_to_root[..self.to_to_root.len() - self.shared]
            .iter()
            .rev()
            .copied();
        let join_to_to =
            join_to_to.map(|e| (e, egraph.enodes[e].get_equality(stack).unwrap().expl, false));
        from_to_join.chain(join_to_to)
    }

    pub fn nodes_len(&self) -> usize {
        self.edges_len() + 1
    }
    pub fn all_nodes(&self) -> impl DoubleEndedIterator<Item = ENodeIdx> + '_ {
        let from_to_join = self.from_to_root[..self.from_to_root.len() + 1 - self.shared].iter();
        let join_to_to = self.to_to_root[..self.to_to_root.len() - self.shared]
            .iter()
            .rev();
        from_to_join.chain(join_to_to).copied()
    }
    pub fn node_at(&self, idx: usize) -> ENodeIdx {
        let from_len = self.from_to_root.len() - self.shared;
        if idx <= from_len {
            self.from_to_root[idx]
        } else {
            let to_len = self.to_to_root.len() - self.shared;
            self.to_to_root[(to_len + from_len) - idx]
        }
    }
    pub fn all_transitive<'a>(
        &'a self,
        egraph: &'a EGraph,
    ) -> impl DoubleEndedIterator<Item = impl Iterator<Item = EqTransIdx> + 'a> + 'a {
        self.all_nodes()
            .map(move |idx| egraph.enodes[idx].transitive.values().copied())
    }

    pub fn initialise_graph<'a>(self, egraph: &'a EGraph, stack: &'a Stack) -> Graph {
        let edges_len = self.edges_len();
        let mut g = Graph {
            graph: DiGraph::with_capacity(self.nodes_len(), edges_len),
            path_enodes: self.all_nodes().collect(),
            edges_len,
            simple_path: self,
        };
        let mut last = g.graph.add_node((edges_len as u32, None));
        for (idx, (_, eq, forward)) in g.simple_path.all_simple_edges(egraph, stack).enumerate() {
            let cost = (edges_len - idx - 1) as u32;
            let next = g.graph.add_node((cost, None));
            let kind = TransitiveExplSegmentKind::Given(eq, None);
            g.graph
                .add_edge(last, next, TransitiveExplSegment { forward, kind });
            last = next;
        }
        g
    }
}

pub struct Graph {
    simple_path: SimplePath,
    path_enodes: FxHashSet<ENodeIdx>,
    graph: DiGraph<(u32, Option<EdgeIndex>), TransitiveExplSegment>,
    edges_len: usize,
}
impl Graph {
    pub fn add_trans_from(
        &mut self,
        idx: usize,
        egraph: &mut EGraph,
    ) -> Option<(bool, EqTransIdx)> {
        let nfrom = NodeIndex::new(idx);
        let efrom = self.simple_path.node_at(idx);

        for to in 0..self.simple_path.nodes_len() {
            let to = self.simple_path.node_at(to);
            if let Entry::Occupied(o) = egraph.enodes[efrom].transitive.entry(to) {
                let trans = *o.get();
                let trans_node = &egraph.equalities.transitive[trans];
                let Some((nto, forward)) =
                    self.add_trans_single(idx, trans, trans_node, &egraph.equalities)
                else {
                    o.remove();
                    continue;
                };
                let segment = TransitiveExplSegment {
                    forward,
                    kind: TransitiveExplSegmentKind::Transitive(trans),
                };
                let (from, to) = if forward { (nfrom, nto) } else { (nto, nfrom) };
                debug_assert!(trans_node.given_len == 0 || from.index() < to.index());
                self.graph.add_edge(from, to, segment);
                if trans_node.given_len == self.edges_len {
                    return Some((forward, trans));
                }
            }
        }
        None
    }
    fn add_trans_single(
        &self,
        idx: usize,
        trans: EqTransIdx,
        trans_node: &TransitiveExpl,
        equalities: &Equalities,
    ) -> Option<(NodeIndex, bool)> {
        let edges_len = self.edges_len;
        debug_assert!(self.path_enodes.contains(&trans_node.to));

        let left = trans_node.given_len <= idx
            && trans_node.to == self.simple_path.node_at(idx - trans_node.given_len);
        if left {
            let prior_simple_edges = (0..idx).map(|idx| self.graph[EdgeIndex::new(idx)]);
            let mut prior_simple_edges = TransitiveExplSegment::rev(prior_simple_edges)
                .map(|seg| (seg.kind.given().unwrap(), seg.forward));
            match equalities.is_equal(trans, &mut prior_simple_edges) {
                None => {
                    debug_assert!(false);
                    None
                }
                Some(false) => None,
                Some(true) => {
                    let to = NodeIndex::new(idx - trans_node.given_len);
                    Some((to, false))
                }
            }
        } else if trans_node.given_len <= edges_len - idx
            && trans_node.to == self.simple_path.node_at(idx + trans_node.given_len)
        {
            let post_simple_edges = (idx..edges_len).map(|idx| self.graph[EdgeIndex::new(idx)]);
            let mut post_simple_edges =
                post_simple_edges.map(|seg| (seg.kind.given().unwrap(), seg.forward));
            match equalities.is_equal(trans, &mut post_simple_edges) {
                None => {
                    debug_assert!(false);
                    None
                }
                Some(false) => None,
                Some(true) => {
                    let to = NodeIndex::new(idx + trans_node.given_len);
                    Some((to, true))
                }
            }
        } else {
            None
        }
    }
}
