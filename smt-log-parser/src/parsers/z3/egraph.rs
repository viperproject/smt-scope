use fxhash::{FxHashMap, FxHashSet};
use gloo_console::log;
use petgraph::{graph::{DiGraph, EdgeIndex, NodeIndex}, visit::EdgeRef};
use typed_index_collections::TiVec;

use crate::{
    items::{ENodeIdx, EqGivenIdx, EqTransIdx, EqualityExpl, InstIdx, StackIdx, TermIdx, TransitiveExpl, TransitiveExplSegment}, Error, Result
};

use super::stack::Stack;

#[derive(Debug, Default)]
pub struct EGraph {
    term_to_enode: FxHashMap<TermIdx, ENodeIdx>,
    pub(super) enodes: TiVec<ENodeIdx, ENode>,
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
            transitive: Vec::new(),
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
        let enode = *self.term_to_enode.get(&term).ok_or_else(|| Error::UnknownEnode(term))?;
        let frame = self.enodes[enode].frame;
        // This cannot be an enode if it points to a popped stack frame
        if frame.is_some_and(|f| !stack.stack_frames[f].active) {
            Err(Error::EnodePoppedFrame(frame.unwrap()))
        } else {
            Ok(enode)
        }
    }

    pub fn get_owner(&self, enode: ENodeIdx) -> TermIdx {
        self.enodes[enode].owner
    }

    pub fn new_given_equality(&mut self, from: ENodeIdx, expl: EqualityExpl, stack: &Stack) -> Result<()> {
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

    pub fn new_trans_equality(&mut self, from: ENodeIdx, to: ENodeIdx, stack: &Stack, can_mismatch: impl Fn(&EGraph) -> bool) -> Result<EqTransIdx> {
        let trans = self.construct_trans_equality(from, to, stack, can_mismatch)?;
        self.enodes[from].transitive.try_reserve(1)?;
        self.enodes[from].transitive.push(trans);
        log!(format!("Added transitive equality {}", trans));
        log!("\n");
        Ok(trans)
    }

    fn path_to_root(&self, mut from: ENodeIdx, root: Option<ENodeIdx>, stack: &Stack) -> Result<(Option<ENodeIdx>, Vec<ENodeIdx>)> {
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

    fn get_simple_path(&self, from: ENodeIdx, to: ENodeIdx, stack: &Stack, can_mismatch: impl Fn(&EGraph) -> bool) -> Result<SimplePath> {
        log!(format!("Computing simple path from {} to {}", from, to));
        let (root, f_path) = self.path_to_root(from, None, stack)?;
        log!(format!("f_path: {}", f_path.iter().map(|n| format!("{}", n)).collect::<Vec<String>>().join(", ")));
        let f_root = f_path.len() - 1;
        let (_, t_path) = self.path_to_root(to, root, stack)?;
        log!(format!("t_path: {}", t_path.iter().map(|n| format!("{}", n)).collect::<Vec<String>>().join(", ")));
        let t_root = t_path.len() - 1;

        let mut shared = 1;
        if f_path[f_root] != t_path[t_root] {
            // Root may not always be the same from v4.12.3 onwards if `to` is an `ite` expression. See:
            // https://github.com/Z3Prover/z3/commit/faf14012ba18d21c1fcddbdc321ac127f019fa03#diff-0a9ec50ded668e51578edc67ecfe32380336b9cbf12c5d297e2d3759a7a39847R2417-R2419
            if !can_mismatch(self) {
                return Err(Error::EnodeRootMismatch(from, to));
            }
            // Return an empty iterator if the roots are different.
            shared = f_path.len().max(t_path.len());
        }
        while shared < f_path.len() && shared < t_path.len() && f_path[f_root - shared] == t_path[t_root - shared] {
            shared += 1;
        }
        Ok(SimplePath { from_to_root: f_path, to_to_root: t_path, shared })
    }

    fn construct_trans_equality(&mut self, from: ENodeIdx, to: ENodeIdx, stack: &Stack, can_mismatch: impl Fn(&EGraph) -> bool) -> Result<EqTransIdx> {
        // Note that it is possible for `from == to`!
        // log!(format!("Constructing transitive equality (#{} #{})", self.enodes[from].owner, self.enodes[to].owner));
        log!(format!("Constr. equality (#{} #{})", from, to));
        let simple_path = self.get_simple_path(from, to, stack, can_mismatch)?;
        log!(format!("Initially, in simple_path, f_path has {}, t_path {}, and shared has {} nodes.", simple_path.from_to_root.len(), simple_path.to_to_root.len(), simple_path.shared));
        // TODO: no need to store the `ENodeIdx` in the graph!
        let mut graph: DiGraph<(ENodeIdx, u32, EdgeIndex), TransitiveExplSegment> = DiGraph::with_capacity(simple_path.nodes_len(), simple_path.edges_len());
        let mut last = graph.add_node((from, 0, EdgeIndex::from(u32::MAX)));
        for (to, eq) in simple_path.all_simple_edges(self, stack) {
            let next = graph.add_node((to, 0, EdgeIndex::from(u32::MAX)));
            graph.add_edge(last, next, TransitiveExplSegment::Leaf(eq));
            log!(format!("1: Adding edge ({} {})", graph[last].0, graph[next].0));
            last = next;
        }
        log!(format!("Later, in simple_path, f_path has {}, t_path {}, and shared has {} nodes.", simple_path.from_to_root.len(), simple_path.to_to_root.len(), simple_path.shared));
        for (idx, efrom) in simple_path.all_nodes().enumerate() {
            let nfrom = NodeIndex::new(idx);
            // TODO: remove, just testing `node_at`
            debug_assert_eq!(simple_path.node_at(idx as usize), efrom);
            debug_assert_eq!(efrom, graph[nfrom].0);
            log!(format!("\n idx = {}, efrom = {}", idx, efrom));

            self.enodes[efrom].transitive.retain(|&trans| {
                log!(format!("\t Processing transitive equality {}", trans));
                log!(format!("\t idx = {}", idx));
                let mut prior_simple_edges = (0..idx).rev().map(|idx| { 
                    log!(format!("\t\t Creating EdgeIndex::new({})", idx));
                    EdgeIndex::new(idx) }).map(|idx| match graph[idx] {
                    TransitiveExplSegment::Leaf(eq) => {
                        log!(format!("\t\t\t prior: matches with Leaf(eq)"));
                        eq
                    },
                    _ => {
                        log!(format!("\t\t\t prior: Executing unreachable code"));
                        unreachable!()
                    },
                });
                let check_left = prior_simple_edges.len() != 0;
                log!(format!("\t check_left = {}", check_left));
                if check_left {
                    match self.equalities.is_equal(trans, false, &mut prior_simple_edges) {
                        // Unequal straight away at the first one, lets try the other direction
                        Err((true, mismatch)) => debug_assert!(mismatch),
                        Err((false, mismatch)) => return !mismatch,
                        Ok(()) => {
                            let to = NodeIndex::new(prior_simple_edges.len());
                            debug_assert_eq!(self.equalities.walk_to(efrom, trans, false), graph[to].0);
                            debug_assert!(to.index() < nfrom.index());
                            graph.add_edge(to, nfrom, TransitiveExplSegment::TransitiveBwd(trans));
                            log!(format!("\t\t\t\t 2: Adding edge ({} {})", graph[to].0, graph[nfrom].0));
                            return true
                        }
                    }
                }
                let mut post_simple_edges = (idx..simple_path.edges_len()).map(|idx| { 
                    log!(format!("\t\t Creating EdgeIndex::new({})", idx));
                    EdgeIndex::new(idx)
                }).map(|idx| match graph[idx] {
                    TransitiveExplSegment::Leaf(eq) => {
                        log!(format!("\t\t\t post: matches with Leaf({})", eq));
                        eq
                    },
                    _ => unreachable!(),
                });
                let check_right = prior_simple_edges.len() != 0;
                log!(format!("\t check_right = {}", check_right));
                if check_right {
                    let keep = match self.equalities.is_equal(trans, true, &mut post_simple_edges) {
                        Err((true, mismatch)) => {
                            debug_assert!(mismatch);
                            // If we've checked both and both had a mismatch
                            // then this must be stale.
                            !check_left
                        }
                        Err((false, mismatch)) => !mismatch,
                        Ok(()) => {
                            let idx = simple_path.edges_len() - post_simple_edges.len();
                            let to = NodeIndex::new(idx);
                            debug_assert_eq!(self.equalities.walk_to(efrom, trans, true), graph[to].0);
                            debug_assert!(nfrom.index() < to.index());
                            graph.add_edge(nfrom, to, TransitiveExplSegment::TransitiveFwd(trans));
                            log!(format!("\t\t\t\t 3: Adding edge ({} {})", graph[nfrom].0, graph[to].0));
                            true
                        }
                    };
                    return keep;
                }
                // Reachable only if `from == to`
                debug_assert_eq!(from, to);
                true
            });
        }

        // Find the shortest path
        for idx in (0..simple_path.nodes_len() - 1).rev() {
            let idx = NodeIndex::new(idx);
            // Use `.rev()` here to prefer transitive edges over leaf edges,
            // though hopefully the `min_by_key` should be unique.
            let min = graph.edges(idx).min_by_key(|edge| graph[edge.target()].1).unwrap();
            let (cost, id) = (graph[min.target()].1, min.id());
            let idx = &mut graph[idx];
            idx.1 = cost + 1;
            idx.2 = id;
        }

        let start = NodeIndex::new(0);
        let mut edge = graph[start].2;
        let path_length = graph[start].1;
        if path_length == 1 {
            match graph[edge] {
                TransitiveExplSegment::TransitiveFwd(idx) => return Ok(idx),
                TransitiveExplSegment::TransitiveBwd(idx) => {
                    let trans = &self.equalities.transitive[idx];
                    if trans.path.len() == 1 {
                        match trans.path[0] {
                            TransitiveExplSegment::TransitiveFwd(_) => unreachable!(),
                            TransitiveExplSegment::TransitiveBwd(idx) => return Ok(idx),
                            TransitiveExplSegment::Leaf(_) => (),
                        }
                    }
                }
                TransitiveExplSegment::Leaf(_) => (),
            }
        }
        let trans = TransitiveExpl::new((0..path_length).map(|_| {
            let kind = &graph[edge];
            edge = graph[graph.edge_endpoints(edge).unwrap().1].2;
            kind
        }).copied(), simple_path.edges_len(), to)?;
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

#[derive(Debug)]
pub struct ENode {
    frame: Option<StackIdx>,
    pub created_by: Option<InstIdx>,
    pub owner: TermIdx,
    pub z3_generation: Option<u32>,

    equalities: Vec<Equality>,
    transitive: Vec<EqTransIdx>,
}

impl ENode {
    pub fn get_equality(&self, _stack: &Stack) -> Option<&Equality> {
        // TODO: why are we allowed to use equalities from popped stack frames?
        // self.equalities.iter().rev().find(|eq| eq.frame.map(|f| stack.stack_frames[f].active).unwrap_or(true))
        self.equalities.last()
    }
}

#[derive(Debug)]
pub struct Equality {
    _frame: Option<StackIdx>,
    pub to: ENodeIdx,
    pub expl: EqGivenIdx,
}

#[derive(Debug, Default)]
pub struct Equalities {
    pub(super) given: TiVec<EqGivenIdx, EqualityExpl>,
    pub(super) transitive: TiVec<EqTransIdx, TransitiveExpl>,
}

impl Equalities {
    pub fn walk_trans<E>(&self, eq: EqTransIdx, fwd: bool, mut f: impl FnMut(EqGivenIdx, bool) -> std::result::Result<(), E>) -> std::result::Result<(), E> {
        let mut stack = vec![self.transitive[eq].all(fwd)];
        while let Some(top) = stack.last_mut() {
            match top.next().copied() {
                None => {
                    stack.pop();
                }
                Some(TransitiveExplSegment::Leaf(eq)) => f(eq, fwd)?,
                Some(TransitiveExplSegment::TransitiveFwd(eq)) =>
                    stack.push(self.transitive[eq].all(true)),
                Some(TransitiveExplSegment::TransitiveBwd(eq)) =>
                    stack.push(self.transitive[eq].all(false)),
            }
        }
        Ok(())
    }
    pub fn is_equal(&self, eq: EqTransIdx, fwd: bool, simple: &mut impl Iterator<Item = EqGivenIdx>) -> std::result::Result<(), (bool, bool)> {
        let mut never_eq = true;
        self.walk_trans(eq, fwd, |eq, eq_fwd| {
            let simple = simple.next().ok_or((never_eq, false))?;
            (simple == eq && fwd == eq_fwd).then(|| never_eq = false).ok_or((never_eq, true))
        })
    }
    pub fn walk_to(&self, mut from: ENodeIdx, eq: EqTransIdx, fwd: bool) -> ENodeIdx {
        #[derive(Debug)]
        enum Never {}
        self.walk_trans::<Never>(eq, fwd, |eq, fwd| {
            from = self.given[eq].walk(from, fwd).unwrap();
            Ok(())
        }).unwrap();
        from
    }
    pub fn path(&self, eq: EqTransIdx) -> Vec<ENodeIdx> {
        let mut path = Vec::new();
        #[derive(Debug)]
        enum Never {}
        self.walk_trans::<Never>(eq, true, |eq, fwd| {
            let eq = &self.given[eq];
            let from = if fwd { eq.from() } else { eq.to() };
            path.push(from);
            Ok(())
        }).unwrap();
        path.push(self.transitive[eq].to);
        path
    }
}

pub struct SimplePath {
    from_to_root: Vec<ENodeIdx>,
    to_to_root: Vec<ENodeIdx>,
    shared: usize,
}
impl SimplePath {
    pub fn edges_len(&self) -> usize {
        self.from_to_root.len() + self.to_to_root.len() - 2 * self.shared
    }
    pub fn all_simple_edges<'a>(&'a self, egraph: &'a EGraph, stack: &'a Stack) -> impl DoubleEndedIterator<Item = (ENodeIdx, EqGivenIdx)> + 'a {
        let from_to_join = self.from_to_root[..self.from_to_root.len() - self.shared].iter().copied();
        let from_to_join = from_to_join.map(|e| {
            let eq = &egraph.enodes[e].get_equality(stack).unwrap();
            (eq.to, eq.expl)
        });
        let join_to_to = self.to_to_root[..self.to_to_root.len() - self.shared].iter().rev().copied();
        let join_to_to = join_to_to.map(|e| (e, egraph.enodes[e].get_equality(stack).unwrap().expl));
        from_to_join.chain(join_to_to)
    }

    pub fn nodes_len(&self) -> usize {
        self.edges_len() + 1
    }
    pub fn all_nodes(&self) -> impl DoubleEndedIterator<Item = ENodeIdx> + '_ {
        let from_to_join = self.from_to_root[..self.from_to_root.len() + 1 - self.shared].iter();
        let join_to_to = self.to_to_root[..self.to_to_root.len() - self.shared].iter().rev();
        from_to_join.chain(join_to_to).copied()
    }
    pub fn node_at(&self, idx: usize) -> ENodeIdx {
        let from_len = self.from_to_root.len() - self.shared;
        if idx <= from_len {
            self.from_to_root[idx]
        } else {
            let to_len = self.from_to_root.len() - self.shared;
            self.to_to_root[(to_len + from_len) - idx]
        }
    }
    pub fn all_transitive<'a>(&'a self, egraph: &'a EGraph) -> impl DoubleEndedIterator<Item = impl DoubleEndedIterator<Item = EqTransIdx> + 'a> + 'a {
        self.all_nodes().map(move |idx| egraph.enodes[idx].transitive.iter().copied())
    }
}
