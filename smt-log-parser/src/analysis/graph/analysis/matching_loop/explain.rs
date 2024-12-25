use petgraph::graph::NodeIndex;

use crate::{
    analysis::analysis::matching_loop::{RecurrenceKind, SimpIdx},
    items::{
        ENodeIdx, EqGivenUse, EqTransIdx, EqualityExpl, InstIdx, Term, TermIdx, TermKind,
        TransitiveExplSegmentKind,
    },
    parsers::z3::{
        egraph::{Equalities, EqualityWalker},
        synthetic::{AnyTerm, SynthIdx},
    },
    BoxSlice, FxHashMap, FxHashSet, Graph, IString, Result, Z3Parser,
};

use super::{GenIdx, MLGraphEdge, MLGraphNode, MlExplanation, MlOutput};

pub struct MlExplainer {
    pub graph: MlExplanation,

    in_node: NodeIndex,
    out_node: NodeIndex,
    fixed_node: Option<NodeIndex>,
    enodes: FxHashMap<ENodeIdx, NodeIndex>,
    recurring_equalities: FxHashMap<EqTransIdx, NodeIndex>,
    fixed_equalities: FxHashMap<EqTransIdx, NodeIndex>,
    instantiations: FxHashMap<InstIdx, NodeIndex>,
    rec_count: u32,

    error: bool,
}

impl MlExplainer {
    pub fn new() -> Self {
        let mut graph = Graph::with_capacity(0, 0);
        let in_node = graph.add_node(MLGraphNode::HiddenNode(Some(true)));
        let out_node = graph.add_node(MLGraphNode::HiddenNode(Some(false)));
        Self {
            graph,

            in_node,
            out_node,
            fixed_node: None,
            enodes: FxHashMap::default(),
            recurring_equalities: FxHashMap::default(),
            fixed_equalities: FxHashMap::default(),
            instantiations: FxHashMap::default(),
            rec_count: 0,
            error: false,
        }
    }

    pub fn explain_leaf(
        &mut self,
        ml_out: &MlOutput,
        parser: &mut Z3Parser,
        leaf: InstIdx,
        gen: GenIdx,
    ) -> bool {
        let leaf_info = &ml_out.node_to_ml[&leaf];
        let mut above = leaf_info.walk_gen(&ml_out.node_to_ml, gen);

        let Some(above1) = above.next() else {
            self.error = true;
            return self.error;
        };
        let above1 = above1.prev;

        let Some(above2) = above.next() else {
            self.error = true;
            return self.error;
        };
        let above2 = above2.prev;

        // Add the leaf instantiation
        let recurring = self.add_inst(ml_out, parser, above2, gen);

        // Add others between as well as their deps
        let mut others1 = MlOutput::others_between(&ml_out.topo, above1, leaf);
        assert!(others1.remove(&leaf));

        let mut others2 = MlOutput::others_between(&ml_out.topo, above2, above1);
        assert!(others2.remove(&above1));

        self.add_others(ml_out, parser, others1, others2);

        // Add the leaf deps
        self.add_inst_deps(ml_out, parser, above1, gen, recurring);

        self.error
    }

    fn add_others(
        &mut self,
        ml_out: &MlOutput,
        parser: &mut Z3Parser,
        others1: FxHashSet<InstIdx>,
        mut others2: FxHashSet<InstIdx>,
    ) {
        // println!("HAVE: {above2:?} -> {others2:?} -> {above1:?} -> {others1:?} -> {leaf:?}");
        // We now have `above2 -> {others2} -> above1 -> {others1} -> leaf`,
        // next we try to link all `others1` and `others2`.

        let others = others1
            .into_iter()
            .map(|other1| {
                let other1_info = &ml_out.node_to_ml[&other1];
                let other2_link = other1_info
                    .tree_above
                    .iter()
                    .find(|&above| others2.remove(&above.prev))?;
                if let Some(gen) = other2_link.gen {
                    Some((other1, other2_link.prev, gen, Vec::new()))
                } else {
                    debug_assert!(false, "No gen for other2_link");
                    None
                }
            })
            .collect::<Option<Box<[_]>>>();
        let Some(mut others) = others else {
            self.error = true;
            return;
        };
        if !others2.is_empty() {
            self.error = true;
            debug_assert!(false, "others2 is not empty");
            return;
        }
        // `InstIdx` are a partial order, so due to this sort we will always add
        // ancestors before descendants.
        others.sort_by_key(|(other1, ..)| *other1);

        for (_, other2, gen, rec) in &mut others {
            let recurring = self.add_inst(ml_out, parser, *other2, *gen);
            *rec = recurring;
        }

        let others_rev = Vec::from(others).into_iter().rev();
        for (other1, _, gen, recurring) in others_rev {
            self.add_inst_deps(ml_out, parser, other1, gen, recurring);
        }
    }

    fn add_inst(
        &mut self,
        ml_out: &MlOutput,
        parser: &mut Z3Parser,
        prev: InstIdx,
        gen: GenIdx,
    ) -> Vec<(usize, Option<usize>, u32)> {
        let prev_info = &ml_out.node_to_ml[&prev];

        let sig = ml_out.signatures[prev_info.ml_sig].clone();
        let Some(pat) = parser.get_pattern(sig.qpat) else {
            debug_assert!(false, "Found an MBQI matching loop?");
            self.error = true;
            return Vec::new();
        };
        let quantifier = sig.qpat.quant;

        let prev_inst = MLGraphNode::QI(sig, quantifier, pat.into());
        let prev_inst = self.graph.add_node(prev_inst);

        let body = parser.quantifier_body(quantifier).unwrap().into();
        let inst_body = MLGraphNode::InstBody(quantifier, body);
        let inst_body = self.graph.add_node(inst_body);

        self.graph
            .add_edge(prev_inst, inst_body, MLGraphEdge::Instantiation);
        let old = self.instantiations.insert(prev, inst_body);
        assert!(old.is_none());

        let mut recurring = Vec::new();

        let gen = &ml_out.gens[gen];
        assert_eq!(gen.len(), prev_info.blames.len());
        for (blame_idx, (blame, gen)) in prev_info.blames.iter().zip(gen.iter()).enumerate() {
            // If it wasn't generalised it means that it's fixed
            let fixed_enode = parser.as_tidx(gen.enode);
            if fixed_enode.is_some() {
                self.fixed_node
                    .get_or_insert_with(|| self.graph.add_node(MLGraphNode::HiddenNode(None)));
            }

            let mut next_rec = None;
            let enode = *self.enodes.entry(blame.enode).or_insert_with(|| {
                let data = fixed_enode
                    .map(SimpIdx::from)
                    .map(MLGraphNode::FixedENode)
                    .unwrap_or_else(|| {
                        next_rec = Some(self.rec_count);
                        MLGraphNode::RecurringENode(gen.enode.into(), RecurrenceKind::Intermediate)
                    });
                self.graph.add_node(data)
            });
            self.graph
                .add_edge(enode, prev_inst, MLGraphEdge::Blame(blame_idx));
            if let Some(next_rec) = next_rec {
                let ancestor_is_recurring = self.add_enode(parser, blame.enode, enode);
                if !ancestor_is_recurring {
                    self.graph.add_edge(
                        self.in_node,
                        enode,
                        MLGraphEdge::HiddenEdge(true, next_rec),
                    );
                    let MLGraphNode::RecurringENode(.., rec) = &mut self.graph[enode] else {
                        unreachable!();
                    };
                    self.rec_count += 1;
                    *rec = RecurrenceKind::Input(next_rec);
                    recurring.push((blame_idx, None, next_rec));
                }
            }

            assert_eq!(blame.equalities.len(), gen.equalities.len());
            let blame_eqs = blame.equalities.iter().copied();
            let gen_eqs = gen.equalities.iter().copied();
            for (eq_idx, ((eqidx, _, _), (from, to))) in blame_eqs.zip(gen_eqs).enumerate() {
                let from_to = parser.as_tidx(from).zip(parser.as_tidx(to));
                let equalities = if from_to.is_some() {
                    self.fixed_node
                        .get_or_insert_with(|| self.graph.add_node(MLGraphNode::HiddenNode(None)));
                    &mut self.fixed_equalities
                } else {
                    &mut self.recurring_equalities
                };
                let mut next_rec = None;
                let eq = *equalities.entry(eqidx).or_insert_with(|| {
                    let data = from_to
                        .map(|(from, to)| MLGraphNode::FixedEquality(from.into(), to.into()))
                        .unwrap_or_else(|| {
                            next_rec = Some(self.rec_count);
                            MLGraphNode::RecurringEquality(
                                from.into(),
                                to.into(),
                                RecurrenceKind::Intermediate,
                            )
                        });
                    self.graph.add_node(data)
                });
                self.graph
                    .add_edge(eq, prev_inst, MLGraphEdge::BlameEq(blame_idx));
                if let Some(next_rec) = next_rec {
                    // If the equality doesn't depend on any recurring nodes then
                    // nothing is added, otherwise the recurring node edges are
                    // added.
                    let ancestor_is_recurring = self.add_equalities(parser, eqidx, eq);
                    if !ancestor_is_recurring {
                        self.graph.add_edge(
                            self.in_node,
                            eq,
                            MLGraphEdge::HiddenEdge(true, next_rec),
                        );
                        let MLGraphNode::RecurringEquality(.., rec) = &mut self.graph[eq] else {
                            unreachable!();
                        };
                        self.rec_count += 1;
                        *rec = RecurrenceKind::Input(next_rec);
                        recurring.push((blame_idx, Some(eq_idx), next_rec));
                    }
                }
            }
        }

        recurring
    }

    fn add_inst_deps(
        &mut self,
        ml_out: &MlOutput,
        parser: &Z3Parser,
        leaf: InstIdx,
        gen: GenIdx,
        recurring: Vec<(usize, Option<usize>, u32)>,
    ) {
        let leaf_info = &ml_out.node_to_ml[&leaf];
        let gen = &ml_out.gens[gen];
        assert_eq!(gen.len(), leaf_info.blames.len());

        for (blame_idx, eq_idx, rec_idx) in recurring {
            let rec_kind = RecurrenceKind::Output(rec_idx);

            let blame = &leaf_info.blames[blame_idx];
            let gen = &gen[blame_idx];
            if let Some(eq_idx) = eq_idx {
                let (eqidx, _, _) = blame.equalities[eq_idx];
                let (from, to) = gen.equalities[eq_idx];
                let mut added = false;
                let eq = *self.recurring_equalities.entry(eqidx).or_insert_with(|| {
                    added = true;
                    let data = MLGraphNode::RecurringEquality(from.into(), to.into(), rec_kind);
                    self.graph.add_node(data)
                });
                self.graph
                    .add_edge(eq, self.out_node, MLGraphEdge::HiddenEdge(false, rec_idx));
                if added {
                    let ancestor_is_recurring = self.add_equalities(parser, eqidx, eq);
                    // TODO: Currently ML#6 in `problem.log` has a recurring
                    // incoming equality from another ML but this other ML
                    // is not in-between any instantiations of this ML, so
                    // we do not figure out how the equality is recurring.
                    // This should be fixed by using a better measure than
                    // QIs between.
                    self.error |= !ancestor_is_recurring;
                    // debug_assert!(ancestor_is_recurring);
                } else {
                    // See same branch in enode case below.
                    let MLGraphNode::RecurringEquality(.., rec) = &mut self.graph[eq] else {
                        unreachable!();
                    };
                    debug_assert_eq!(*rec, RecurrenceKind::Intermediate);
                    *rec = rec_kind;
                }
            } else {
                let mut added = false;
                let enode = *self.enodes.entry(blame.enode).or_insert_with(|| {
                    added = true;
                    let data = MLGraphNode::RecurringENode(gen.enode.into(), rec_kind);
                    self.graph.add_node(data)
                });
                self.graph.add_edge(
                    enode,
                    self.out_node,
                    MLGraphEdge::HiddenEdge(false, rec_idx),
                );
                if added {
                    let ancestor_is_recurring = self.add_enode(parser, blame.enode, enode);
                    self.error |= !ancestor_is_recurring;
                    // TODO: make this pass (i.e. no error)
                    // debug_assert!(ancestor_is_recurring);
                } else {
                    // We mark this node as output even though it's
                    // already been added to the graph (meaning that it also has
                    // other outputs).
                    let MLGraphNode::RecurringENode(.., rec) = &mut self.graph[enode] else {
                        unreachable!();
                    };
                    debug_assert_eq!(*rec, RecurrenceKind::Intermediate);
                    *rec = rec_kind;
                }
            }
        }
    }

    fn add_enode(&mut self, parser: &Z3Parser, enode: ENodeIdx, result_enode: NodeIndex) -> bool {
        let enode_data = &parser[enode];
        let created_by = enode_data.blame.inst();
        let created_by = created_by.and_then(|cb| self.instantiations.get(&cb));
        if let Some(created_by) = created_by {
            self.graph
                .add_edge(*created_by, result_enode, MLGraphEdge::Yield);
            true
        } else {
            false
        }
    }

    fn add_equalities(
        &mut self,
        parser: &Z3Parser,
        eqidx: EqTransIdx,
        result_eq: NodeIndex,
    ) -> bool {
        struct TransEqGraphWalker<'a> {
            parser: &'a Z3Parser,
            explainer: &'a mut MlExplainer,
            result_eq: NodeIndex,
            ancestor_is_recurring: bool,
            add_mode: bool,
            burned_eqs: FxHashSet<EqTransIdx>,
        }
        #[derive(Debug)]
        enum Never {}
        impl<'a> EqualityWalker<'a> for TransEqGraphWalker<'a> {
            type Error = Never;
            fn equalities(&self) -> &'a Equalities {
                &self.parser.egraph.equalities
            }
            fn walk_given(
                &mut self,
                eq_use: EqGivenUse,
                forward: bool,
            ) -> core::result::Result<(), Self::Error> {
                let (eq, use_) = eq_use;
                let eq_expl = &self.equalities().given[eq];
                match eq_expl {
                    &EqualityExpl::Literal { eq, .. } => {
                        let created_by = self.parser[eq].blame.inst();
                        let created_by =
                            created_by.and_then(|iidx| self.explainer.instantiations.get(&iidx));
                        if let Some(created_by) = created_by {
                            if self.add_mode {
                                return Ok(());
                            }
                            self.explainer.graph.add_edge(
                                *created_by,
                                self.result_eq,
                                MLGraphEdge::YieldEq,
                            );
                            self.ancestor_is_recurring = true;
                            return Ok(());
                        }
                    }
                    EqualityExpl::Congruence { uses, .. } => {
                        return self.walk_congruence(uses, use_.unwrap(), forward)
                    }
                    _ => (),
                };
                if self.add_mode {
                    let (from, to) = (eq_expl.from(), eq_expl.to());
                    let (from, to) = (self.parser[from].owner, self.parser[to].owner);
                    let data = MLGraphNode::FixedEquality(from.into(), to.into());
                    let enode = self.explainer.graph.add_node(data);
                    self.explainer
                        .graph
                        .add_edge(enode, self.result_eq, MLGraphEdge::CombineEq);
                }
                Ok(())
            }
            fn super_walk_trans(
                &mut self,
                eq: EqTransIdx,
                forward: bool,
            ) -> core::result::Result<(), Self::Error> {
                let mut ancestor_is_recurring = self.ancestor_is_recurring;
                self.ancestor_is_recurring = false;

                let all = self.equalities().transitive[eq].all(forward);
                for next in all {
                    use TransitiveExplSegmentKind::*;
                    match next.kind {
                        Given(eq_use) => self.walk_given(eq_use, next.forward)?,
                        Transitive(eq) => self.walk_trans(eq, next.forward)?,
                        Error(_) => (),
                    }
                    ancestor_is_recurring |= self.ancestor_is_recurring;
                    self.ancestor_is_recurring = false;
                }
                self.ancestor_is_recurring = ancestor_is_recurring;
                Ok(())
            }
            fn walk_trans(
                &mut self,
                eq: EqTransIdx,
                forward: bool,
            ) -> core::result::Result<(), Self::Error> {
                if self.add_mode {
                    if self.burned_eqs.insert(eq) {
                        let data =
                            *self
                                .explainer
                                .fixed_equalities
                                .entry(eq)
                                .or_insert_with(|| {
                                    let (from, to) = self.parser.from_to(eq);
                                    let (from, to) =
                                        (self.parser[from].owner, self.parser[to].owner);
                                    let data = MLGraphNode::FixedEquality(from.into(), to.into());
                                    self.explainer.graph.add_node(data)
                                });
                        self.explainer
                            .graph
                            .add_edge(data, self.result_eq, MLGraphEdge::CombineEq);
                    };
                    return Ok(());
                }

                if let Some(eq_idx) = self.explainer.recurring_equalities.get(&eq) {
                    self.explainer
                        .graph
                        .add_edge(*eq_idx, self.result_eq, MLGraphEdge::CombineEq);
                    self.ancestor_is_recurring = true;
                    self.burned_eqs.insert(eq);
                    return Ok(());
                }

                self.super_walk_and_rewalk(eq, forward)
            }
        }
        impl TransEqGraphWalker<'_> {
            fn super_walk_and_rewalk(
                &mut self,
                eq: EqTransIdx,
                forward: bool,
            ) -> core::result::Result<(), Never> {
                self.super_walk_trans(eq, forward)?;
                if self.ancestor_is_recurring && !self.add_mode {
                    self.burned_eqs.insert(eq);
                    self.add_mode = true;
                    self.super_walk_trans(eq, forward)?;
                    self.add_mode = false;
                    assert!(self.ancestor_is_recurring);
                }
                Ok(())
            }
        }
        let mut walker = TransEqGraphWalker {
            parser,
            explainer: self,
            result_eq,
            ancestor_is_recurring: false,
            add_mode: false,
            burned_eqs: FxHashSet::default(),
        };
        walker.super_walk_and_rewalk(eqidx, true).unwrap();
        walker.ancestor_is_recurring
    }

    pub fn simplify_terms(mut self, parser: &mut Z3Parser) -> Result<MlExplanation> {
        let mut collector = QVarParentCollector::new(parser);
        for &i in self.instantiations.values() {
            self.collect_inst(&mut collector, i);
        }
        let mut simplifier = TermSimplifier {
            forbidden_apps: collector.forbidden_apps,
            terms_with_qvars: collector.terms_with_qvars,
            parser,
            simplifications: FxHashMap::default(),
            stack: Vec::new(),
        };
        for i in self.graph.node_indices() {
            simplifier.simplify_node(&mut self.graph[i])?;
        }
        Ok(self.graph)
    }

    fn collect_inst(&self, collector: &mut QVarParentCollector<'_>, i: NodeIndex) {
        let MLGraphNode::InstBody(_, body) = &self.graph[i] else {
            unreachable!();
        };
        collector.stack = None;
        let body = collector.parser.synth_terms.as_tidx(body.orig).unwrap();
        let _has_qvars = collector.collect_term(body);

        let dir = petgraph::Direction::Incoming;
        let mut parents = self.graph.neighbors_directed(i, dir);
        let i = parents.next().unwrap();
        assert_eq!(parents.next(), None);
        let MLGraphNode::QI(_, _, pattern) = &self.graph[i] else {
            unreachable!();
        };
        collector.stack = Some(Vec::new());
        let pattern = collector.parser.synth_terms.as_tidx(pattern.orig).unwrap();
        let has_qvars = collector.collect_term(pattern);
        debug_assert!(has_qvars);
    }
}

struct QVarParentCollector<'a> {
    parser: &'a Z3Parser,
    stack: Option<Vec<IString>>,
    forbidden_apps: FxHashSet<BoxSlice<IString>>,
    terms_with_qvars: FxHashSet<TermIdx>,
}

impl<'a> QVarParentCollector<'a> {
    fn new(parser: &'a Z3Parser) -> Self {
        Self {
            parser,
            stack: Some(Default::default()),
            forbidden_apps: Default::default(),
            terms_with_qvars: Default::default(),
        }
    }
    fn collect_term(&mut self, tidx: TermIdx) -> bool {
        let term = &self.parser[tidx];
        match term.kind {
            TermKind::Var(_) => {
                self.terms_with_qvars.insert(tidx);
                true
            }
            TermKind::App(app) => {
                if let Some(stack) = &mut self.stack {
                    stack.push(app);
                }

                let mut has_qvar = false;
                for &child in term.child_ids.iter() {
                    has_qvar |= self.collect_term(child);
                }

                if has_qvar {
                    self.terms_with_qvars.insert(tidx);
                    // I have qvars so prevent sequences of terms like me being
                    // replaced.
                    if let Some(stack) = &self.stack {
                        for i in 0..stack.len() {
                            let forbidden_app = stack[i..].iter().copied().collect();
                            self.forbidden_apps.insert(forbidden_app);
                        }
                    }
                }

                if let Some(stack) = &mut self.stack {
                    stack.pop();
                }
                has_qvar
            }
            TermKind::Quant(..) => unreachable!(),
        }
    }
}

struct TermSimplifier<'a> {
    parser: &'a mut Z3Parser,
    simplifications: FxHashMap<TermIdx, SynthIdx>,

    stack: Vec<IString>,
    forbidden_apps: FxHashSet<BoxSlice<IString>>,
    terms_with_qvars: FxHashSet<TermIdx>,
}

impl TermSimplifier<'_> {
    fn simplify_node(&mut self, node: &mut MLGraphNode) -> Result<()> {
        match node {
            MLGraphNode::HiddenNode(..) => (),
            MLGraphNode::QI(_, _, idx)
            | MLGraphNode::InstBody(_, idx)
            | MLGraphNode::FixedENode(idx)
            | MLGraphNode::RecurringENode(idx, _) => {
                idx.simp = self.simplify_term(idx.simp)?;
            }
            MLGraphNode::FixedEquality(lhs, rhs) | MLGraphNode::RecurringEquality(lhs, rhs, _) => {
                lhs.simp = self.simplify_term(lhs.simp)?;
                rhs.simp = self.simplify_term(rhs.simp)?;
            }
        };
        Ok(())
    }

    fn simplify_term(&mut self, idx: SynthIdx) -> Result<SynthIdx> {
        let tidx = self.parser.synth_terms.as_tidx(idx);
        let has_qvars = tidx.is_some_and(|tidx| self.terms_with_qvars.contains(&tidx));
        if let Some(tidx) = tidx.and_then(|tidx| self.simplifications.get(&tidx)) {
            assert!(!has_qvars);
            return Ok(*tidx);
        }
        let term = &self.parser[idx];

        // Do not simplify terms with no children.
        if term.child_ids().is_empty() {
            return Ok(idx);
        }

        let must_pop = &mut false;
        match term {
            AnyTerm::Parsed(Term {
                kind: TermKind::App(name),
                ..
            }) if {
                self.stack.push(*name);
                *must_pop = true;
                let is_forbidden = self.forbidden_apps.contains(self.stack.as_slice());
                !is_forbidden && !has_qvars
            } =>
            {
                self.stack.pop();

                let next = self.simplifications.len();
                let new = self.parser.synth_terms.new_variable(next as u32)?;
                let old = self.simplifications.insert(tidx.unwrap(), new);
                // Should have returned early above if it was already contained.
                assert!(old.is_none());
                Ok(new)
            }
            _ => {
                let mut child_ids = Vec::<SynthIdx>::new();
                child_ids.try_reserve_exact(term.child_ids().len())?;
                for i in 0..term.child_ids().len() {
                    let child = self.parser[idx].child_ids()[i];
                    let new = self.simplify_term(child)?;
                    child_ids.push(new);
                }
                if *must_pop {
                    self.stack.pop();
                }
                let term = self.parser[idx].replace_child_ids(child_ids.into());
                let term = term
                    .map(|term| self.parser.synth_terms.insert(term))
                    .transpose()?;
                Ok(term.unwrap_or(idx))
            }
        }
    }
}
