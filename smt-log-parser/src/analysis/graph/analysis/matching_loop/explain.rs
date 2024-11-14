use fxhash::FxHashSet;
use petgraph::graph::NodeIndex;

use crate::{
    items::{
        ENodeIdx, EqGivenUse, EqTransIdx, EqualityExpl, InstIdx, TransitiveExplSegment,
        TransitiveExplSegmentKind,
    },
    parsers::z3::egraph::{Equalities, EqualityWalker},
    FxHashMap, Graph, Z3Parser,
};

use super::{GenIdx, MLGraphEdge, MLGraphNode, MlExplanation, MlOutput};

pub struct MlExplainer {
    pub graph: MlExplanation,

    enodes: FxHashMap<ENodeIdx, NodeIndex>,
    recurring_equalities: FxHashMap<EqTransIdx, NodeIndex>,
    fixed_equalities: FxHashMap<EqTransIdx, NodeIndex>,
    instantiations: FxHashMap<InstIdx, NodeIndex>,
}

// struct InstGraphNodes {
//     inst: NodeIndex,
//     blame: Box<[GeneralisedBlame<NodeIndex>]>,
// }

impl MlExplainer {
    pub fn new() -> Self {
        Self {
            graph: Graph::with_capacity(0, 0),

            enodes: FxHashMap::default(),
            recurring_equalities: FxHashMap::default(),
            fixed_equalities: FxHashMap::default(),
            instantiations: FxHashMap::default(),
        }
    }

    pub fn explain_leaf(
        mut self,
        ml_out: &MlOutput,
        parser: &Z3Parser,
        leaf: InstIdx,
        gen: GenIdx,
    ) -> Option<MlExplanation> {
        let leaf_info = &ml_out.node_to_ml[&leaf];
        let mut above = leaf_info.walk_gen(&ml_out.node_to_ml, gen);

        let above1 = above.next()?;
        let above1 = above1.prev;

        let above2 = above.next()?;
        let above2 = above2.prev;

        let mut others1 = MlOutput::others_between(ml_out.topo, above1, leaf);
        assert!(others1.remove(&leaf));

        let mut others2 = MlOutput::others_between(ml_out.topo, above2, above1);
        assert!(others2.remove(&above1));

        // We now have `above2 -> {others2} -> above1 -> {others1} -> leaf`,
        // next we try to link all `others1` and `others2`.

        let mut others = others1
            .into_iter()
            .map(|other1| {
                let other1_info = &ml_out.node_to_ml[&other1];
                let other2_link = other1_info.walk_gen(&ml_out.node_to_ml, gen).next()?;
                let other2 = other2_link.prev;
                if others2.remove(&other2) {
                    Some((other1, other2, other2_link.gen.unwrap(), Vec::new()))
                } else {
                    None
                }
            })
            .collect::<Option<Box<[_]>>>()?;
        if !others2.is_empty() {
            return None;
        }
        // `InstIdx` are a partial order, so due to this sort we will always add
        // ancestors before descendants.
        others.sort_by_key(|(other1, ..)| *other1);

        let recurring = self.add_inst(ml_out, parser, above2, gen);
        for (_, other2, gen, rec) in &mut others {
            let recurring = self.add_inst(ml_out, parser, *other2, *gen);
            *rec = recurring;
        }

        self.add_inst_deps(ml_out, parser, above1, gen, recurring)?;
        for (other1, _, gen, recurring) in others {
            self.add_inst_deps(ml_out, parser, other1, gen, recurring)?;
        }

        Some(self.graph)
    }

    fn add_inst(
        &mut self,
        ml_out: &MlOutput,
        parser: &Z3Parser,
        prev: InstIdx,
        gen: GenIdx,
    ) -> Vec<(usize, Option<usize>)> {
        let prev_info = &ml_out.node_to_ml[&prev];

        let sig = ml_out.signatures[prev_info.ml_sig].clone();
        let prev_inst = self.graph.add_node(MLGraphNode::QI(sig));
        let old = self.instantiations.insert(prev, prev_inst);
        assert!(old.is_none());

        let mut recurring = Vec::new();

        let gen = &ml_out.gens[gen];
        assert_eq!(gen.len(), prev_info.blames.len());
        for (blame_idx, (blame, gen)) in prev_info.blames.iter().zip(gen.iter()).enumerate() {
            // If it wasn't generalised it means that it's fixed
            let fixed_enode = parser.as_tidx(gen.enode);

            let mut added = false;
            let enode = *self.enodes.entry(blame.enode).or_insert_with(|| {
                added = true;
                let data = fixed_enode
                    .map(MLGraphNode::FixedENode)
                    .unwrap_or(MLGraphNode::RecurringENode(gen.enode, Some(true)));
                self.graph.add_node(data)
            });
            self.graph
                .add_edge(enode, prev_inst, MLGraphEdge::Blame(blame_idx));
            if added && fixed_enode.is_none() {
                let ancestor_is_recurring = self.add_enode(parser, blame.enode, enode);
                if ancestor_is_recurring {
                    let MLGraphNode::RecurringENode(.., rec) = &mut self.graph[enode] else {
                        unreachable!();
                    };
                    *rec = None;
                } else {
                    recurring.push((blame_idx, None));
                }
            }

            assert_eq!(blame.equalities.len(), gen.equalities.len());
            let blame_eqs = blame.equalities.iter().copied();
            let gen_eqs = gen.equalities.iter().copied();
            for (eq_idx, ((eqidx, _, _), (from, to))) in blame_eqs.zip(gen_eqs).enumerate() {
                let from_to = parser.as_tidx(from).zip(parser.as_tidx(to));
                let equalities = if from_to.is_some() {
                    &mut self.fixed_equalities
                } else {
                    &mut self.recurring_equalities
                };
                let mut added = false;
                let eq = *equalities.entry(eqidx).or_insert_with(|| {
                    added = true;
                    let data = from_to
                        .map(|(from, to)| MLGraphNode::FixedEquality(from, to))
                        .unwrap_or(MLGraphNode::RecurringEquality(from, to, Some(true)));
                    self.graph.add_node(data)
                });
                self.graph
                    .add_edge(eq, prev_inst, MLGraphEdge::BlameEq(blame_idx));
                if added && from_to.is_none() {
                    // If the equality doesn't depend on any recurring nodes then
                    // nothing is added, otherwise the recurring node edges are
                    // added.
                    let ancestor_is_recurring = self.add_equalities(parser, eqidx, eq);
                    if ancestor_is_recurring {
                        let MLGraphNode::RecurringEquality(.., rec) = &mut self.graph[eq] else {
                            unreachable!();
                        };
                        *rec = None;
                    } else {
                        recurring.push((blame_idx, Some(eq_idx)));
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
        recurring: Vec<(usize, Option<usize>)>,
    ) -> Option<()> {
        let leaf_info = &ml_out.node_to_ml[&leaf];
        let gen = &ml_out.gens[gen];
        assert_eq!(gen.len(), leaf_info.blames.len());

        for (blame_idx, eq_idx) in recurring {
            let blame = &leaf_info.blames[blame_idx];
            let gen = &gen[blame_idx];
            if let Some(eq_idx) = eq_idx {
                let (eqidx, _, _) = blame.equalities[eq_idx];
                let (from, to) = gen.equalities[eq_idx];
                let mut added = false;
                let eq = *self.recurring_equalities.entry(eqidx).or_insert_with(|| {
                    added = true;
                    let data = MLGraphNode::RecurringEquality(from, to, Some(false));
                    self.graph.add_node(data)
                });
                if added {
                    let ancestor_is_recurring = self.add_equalities(parser, eqidx, eq);
                    if !ancestor_is_recurring {
                        // TODO: Currently ML#6 in `problem.log` has a recurring
                        // incoming equality from another ML but this other ML
                        // is not in-between any instantiations of this ML, so
                        // we do not figure out how the equality is recurring.
                        // This should be fixed by using a better measure than
                        // EQs between.
                        return None;
                    }
                }
            } else {
                let mut added = false;
                let enode = *self.enodes.entry(blame.enode).or_insert_with(|| {
                    added = true;
                    let data = MLGraphNode::RecurringENode(gen.enode, Some(false));
                    self.graph.add_node(data)
                });
                if added {
                    let ancestor_is_recurring = self.add_enode(parser, blame.enode, enode);
                    assert!(ancestor_is_recurring);
                }
            }
        }
        Some(())
    }

    fn add_enode(&mut self, parser: &Z3Parser, enode: ENodeIdx, result_enode: NodeIndex) -> bool {
        let enode_data = &parser[enode];
        let created_by = enode_data.created_by;
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
                        let created_by = self.parser[eq].created_by;
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
                    let data = MLGraphNode::FixedEquality(from, to);
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
                    match next {
                        TransitiveExplSegment {
                            forward,
                            kind: TransitiveExplSegmentKind::Given(eq_use),
                        } => self.walk_given(eq_use, forward)?,
                        TransitiveExplSegment {
                            forward,
                            kind: TransitiveExplSegmentKind::Transitive(eq),
                        } => self.walk_trans(eq, forward)?,
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
                if self.equalities().transitive[eq].given_len == 0 {
                    return Ok(());
                }

                if self.add_mode {
                    if self.burned_eqs.insert(eq) {
                        let data =
                            *self
                                .explainer
                                .fixed_equalities
                                .entry(eq)
                                .or_insert_with(|| {
                                    let (from, to) = self.parser.egraph.equalities.from_to(eq);
                                    let (from, to) =
                                        (self.parser[from].owner, self.parser[to].owner);
                                    let data = MLGraphNode::FixedEquality(from, to);
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

                self.super_walk_trans(eq, forward)?;
                if self.ancestor_is_recurring {
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
        walker.super_walk_trans(eqidx, true).unwrap();
        walker.ancestor_is_recurring
    }

    // fn _add_inst(
    //     &mut self,
    //     ml_out: &MlOutput,
    //     parser: &mut Z3Parser,
    //     iidx: InstIdx,
    //     gen: GenIdx,
    // ) -> InstGraphNodes {
    //     let gen = &ml_out.gens[gen];

    //     let inst = &ml_out.node_to_ml[&iidx];
    //     let sig = ml_out.ml_leaves[inst.ml_sig].sig.clone();
    //     let gen_pat = parser
    //         .synth_terms
    //         .generalise_pattern(&parser.terms, sig.pattern)
    //         .unwrap();
    //     let node = MLGraphNode::QI(sig, gen_pat);
    //     let inst = self.graph.add_node(node);

    //     let blame = gen
    //         .iter()
    //         .enumerate()
    //         .map(|(idx, gen)| {
    //             let enode = match gen.enode.and_then(|enode| parser.as_tidx(enode)) {
    //                 Some(enode) => {
    //                     NodeIndex::new(*self.fixed_enodes.entry(enode).or_insert_with(|| {
    //                         self.graph.add_node(MLGraphNode::FixedENode(enode)).index()
    //                     }))
    //                 }
    //                 None => self.graph.add_node(MLGraphNode::RecurringENode(gen.enode)),
    //             };
    //             self.graph.add_edge(enode, inst, MLGraphEdge::Blame(idx));

    //             let equalities: Box<[_]> = gen
    //                 .equalities
    //                 .iter()
    //                 .map(|&(from, to)| {
    //                     let from_to = from
    //                         .zip(to)
    //                         .and_then(|(from, to)| parser.as_tidx(from).zip(parser.as_tidx(to)));
    //                     let eq = match from_to {
    //                         Some((from, to)) => NodeIndex::new(
    //                             *self.fixed_equalities.entry((from, to)).or_insert_with(|| {
    //                                 self.graph
    //                                     .add_node(MLGraphNode::FixedEquality(from, to))
    //                                     .index()
    //                             }),
    //                         ),
    //                         None => self
    //                             .graph
    //                             .add_node(MLGraphNode::RecurringEquality(from, to)),
    //                     };
    //                     self.graph.add_edge(eq, inst, MLGraphEdge::BlameEq(idx));
    //                     (eq, eq)
    //                 })
    //                 .collect();
    //             GeneralisedBlame { enode, equalities }
    //         })
    //         .collect();
    //     InstGraphNodes { inst, blame }
    // }

    // fn _add_dependencies(
    //     &mut self,
    //     parser: &Z3Parser,
    //     iidx: InstIdx,
    //     idata: &InstGraphNodes,
    //     insts_map: impl Fn(InstIdx) -> Option<(NodeIndex, bool)>,
    // ) {
    //     let inst = &parser[iidx];
    //     let match_ = &parser[inst.match_];
    //     for (i, tm) in match_.trigger_matches().enumerate() {
    //         let curr_idata = &idata.blame[i];

    //         let tm_enode = tm.enode();
    //         let blame = &parser[tm_enode];
    //         if let Some(created_by) = blame.created_by {
    //             if let Some((created_by, rec)) = insts_map(created_by) {
    //                 self.graph
    //                     .add_edge(created_by, curr_idata.enode, MLGraphEdge::Yield(rec));
    //             }
    //         }

    //         for (i, eq) in tm
    //             .equalities()
    //             .filter(|&eq| parser[eq].given_len > 0)
    //             .enumerate()
    //         {
    //             parser.egraph.walk_trans(eq, |given, _| {
    //                 let EqualityExpl::Literal { eq, .. } = &parser[given] else {
    //                     return;
    //                 };
    //                 let eq = &parser[*eq];
    //                 if let Some((created_by, rec)) = eq.created_by.and_then(&insts_map) {
    //                     self.graph.add_edge(
    //                         created_by,
    //                         curr_idata.equalities[i].0,
    //                         MLGraphEdge::YieldEq(rec),
    //                     );
    //                 }
    //                 // else {
    //                 //     let fixed = self.graph.add_node(MLGraphNode::FixedEquality(eq.owner));
    //                 //     self.graph
    //                 //         .add_edge(fixed, curr_idata.1[i], MLGraphEdge::FixedEquality);
    //                 // }
    //             });
    //         }
    //     }
    // }
}
