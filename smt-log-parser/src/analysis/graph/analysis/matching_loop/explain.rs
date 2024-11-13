use petgraph::graph::NodeIndex;

use crate::{
    items::{ENodeIdx, EqTransIdx, EqualityExpl, InstIdx},
    FxHashMap, Graph, Z3Parser,
};

use super::{GenIdx, MLGraphEdge, MLGraphNode, MlExplanation, MlOutput};

pub struct MlExplainer {
    pub graph: MlExplanation,

    enodes: FxHashMap<ENodeIdx, usize>,
    equalities: FxHashMap<EqTransIdx, usize>,
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
            equalities: FxHashMap::default(),
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
        let above = leaf_info
            .tree_above
            .iter()
            .find(|above| above.gen.is_some_and(|ag| ag == gen))
            .unwrap();
        assert!(above.max_depth > 0);

        let leaf_prev = above.prev;
        let leaf_prev_info = &ml_out.node_to_ml[&leaf_prev];
        // We now have `leaf_prev -> {others} -> leaf`

        let others = ml_out.others_between(leaf_prev, leaf);
        debug_assert!(others.contains(&leaf));

        // println!("Others: {:?}", others);

        // TODO: handle multi-instantiation MLs
        if others.len() > 1 {
            return None;
        }

        let sig = ml_out.signatures[leaf_info.ml_sig].clone();
        let prev_inst = self.graph.add_node(MLGraphNode::QI(sig));

        let gen = &ml_out.gens[gen];
        assert_eq!(gen.len(), leaf_prev_info.blames.len());
        for (idx, (blame, gen)) in leaf_prev_info.blames.iter().zip(gen.iter()).enumerate() {
            let enode = self.enodes.entry(blame.enode).or_insert_with(|| {
                // If it wasn't generalised it means that it's fixed
                let fixed_enode = parser.as_tidx(gen.enode);
                let data = fixed_enode
                    .map(MLGraphNode::FixedENode)
                    .unwrap_or(MLGraphNode::RecurringENode(gen.enode, true));
                self.graph.add_node(data).index()
            });
            let enode = NodeIndex::new(*enode);
            self.graph
                .add_edge(enode, prev_inst, MLGraphEdge::Blame(idx));

            assert_eq!(blame.equalities.len(), gen.equalities.len());
            let blame_eqs = blame.equalities.iter().copied();
            let gen_eqs = gen.equalities.iter().copied();
            for ((eqidx, _, _), (from, to)) in blame_eqs.zip(gen_eqs) {
                let eq = self.equalities.entry(eqidx).or_insert_with(|| {
                    let from_to = parser.as_tidx(from).zip(parser.as_tidx(to));
                    let data = from_to
                        .map(|(from, to)| MLGraphNode::FixedEquality(from, to))
                        .unwrap_or(MLGraphNode::RecurringEquality(from, to, true));
                    self.graph.add_node(data).index()
                });
                let eq = NodeIndex::new(*eq);
                self.graph
                    .add_edge(eq, prev_inst, MLGraphEdge::BlameEq(idx));
            }
        }

        for (blame, gen) in leaf_info.blames.iter().zip(gen.iter()) {
            let _enode = self.enodes.entry(blame.enode).or_insert_with(|| {
                // ENode isn't fixed, but repeats
                debug_assert!(parser[blame.enode]
                    .created_by
                    .is_some_and(|cb| cb == leaf_prev));
                let data = MLGraphNode::RecurringENode(gen.enode, false);
                let node = self.graph.add_node(data);
                self.graph.add_edge(prev_inst, node, MLGraphEdge::Yield);
                node.index()
            });
            // let enode = NodeIndex::new(*enode);

            assert_eq!(blame.equalities.len(), gen.equalities.len());
            let blame_eqs = blame.equalities.iter().copied();
            let gen_eqs = gen.equalities.iter().copied();
            for ((eqidx, _, _), (from, to)) in blame_eqs.zip(gen_eqs) {
                let mut newly_added = false;
                let result_eq = self.equalities.entry(eqidx).or_insert_with(|| {
                    // Equality isn't fixed, but repeats
                    newly_added = true;
                    let data = MLGraphNode::RecurringEquality(from, to, false);
                    self.graph.add_node(data).index()
                });
                let result_eq = NodeIndex::new(*result_eq);
                self.add_equalities(parser, eqidx, result_eq, prev_inst, leaf_prev);
            }
        }

        Some(self.graph)
    }

    fn add_equalities(
        &mut self,
        parser: &Z3Parser,
        eqidx: EqTransIdx,
        result_eq: NodeIndex,
        prev_inst: NodeIndex,
        leaf_prev: InstIdx,
    ) {
        parser
            .egraph
            .walk_trans(eqidx, |given, _| match &parser[given] {
                EqualityExpl::Root { .. } => (),
                &EqualityExpl::Literal { from, eq, to } => {
                    let enode = &parser[eq];
                    match enode.created_by {
                        Some(iidx) if iidx == leaf_prev => {
                            self.graph
                                .add_edge(prev_inst, result_eq, MLGraphEdge::YieldEq);
                        }
                        _ => {
                            let data =
                                MLGraphNode::FixedEquality(parser[from].owner, parser[to].owner);
                            let enode = self.graph.add_node(data);
                            self.graph
                                .add_edge(enode, result_eq, MLGraphEdge::CombineEq);
                        }
                    }
                }
                EqualityExpl::Congruence { uses, .. } => {
                    for use_ in uses.iter().flat_map(|use_| use_.iter()) {
                        match self.equalities.get(use_) {
                            Some(&prev_node) => {
                                self.graph.add_edge(
                                    NodeIndex::new(prev_node),
                                    result_eq,
                                    MLGraphEdge::CombineEq,
                                );
                            }
                            None => {
                                self.add_equalities(parser, *use_, result_eq, prev_inst, leaf_prev)
                            }
                        }
                    }
                }
                EqualityExpl::Theory { .. } => (),
                EqualityExpl::Axiom { .. } => (),
                EqualityExpl::Unknown { .. } => (),
            });
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
