use petgraph::graph::NodeIndex;

use crate::{
    analysis::{raw::NodeKind, visible::VisibleInstGraph, InstGraph, VisibleNodeIndex},
    items::{ENodeIdx, EqTransIdx, QuantIdx, TermIdx},
    FxHashMap, Graph, Z3Parser,
};

use super::{MLGraphNode, MlEquality, MlMatchedTerm};

// pub struct MatchingLoop {

// }

// impl MatchingLoop {
//     /// Generalise a potential matching loop ending at `leaf`. The `leaf` must
//     /// point to an instantiation node with a quantifier and pattern.
//     pub fn new(&self, parser: &mut Z3Parser, graph: &InstGraph, leaf: VisibleNodeIndex, visible: &VisibleInstGraph) -> Self {
//         let iidx = graph.raw[visible[leaf].idx].kind().inst().unwrap();
//         let match_ = &parser[parser[iidx].match_];
//         let qidx = match_.kind.quant_idx().unwrap();
//         let pattern = match_.kind.pattern().unwrap();

//         Self {}
//     }
// }

impl InstGraph {
    pub fn compute_nth_matching_loop_graph(
        &self,
        n: usize,
        parser: &mut Z3Parser,
    ) -> Graph<MLGraphNode, ()> {
        let nodes_of_nth_matching_loop = self
            .raw
            .node_indices()
            .filter(|nx| self.raw[*nx].part_of_ml.contains(&n))
            .collect::<Vec<_>>();
        // here we "fold" a potential matching loop into an abstract instantiation graph that represents the repeating pattern of the potential matching loop
        // an abstract instantiation is defined by the quantifier and the pattern used for the pattern match
        let mut abstract_insts: FxHashMap<(QuantIdx, TermIdx), AbstractInst> = FxHashMap::default();
        // for each abstract instantiation, we identify the matched terms and the blamed equalities
        for nx in nodes_of_nth_matching_loop {
            let node_kind = self.raw[nx].kind();
            if let NodeKind::Instantiation(inst) = node_kind {
                let match_ = &parser[parser[*inst].match_];
                let pattern = match_.kind.pattern().unwrap();
                // here we have pairs (trigger, matched) where
                // matched.enode(): ENodeIdx is the matched term
                // matched.equalities(): Iterator<EqTransIdx> iterates over all equalities used to rewrite the matched term
                let trigger_matches = parser[pattern]
                    .child_ids
                    .iter()
                    .zip(match_.trigger_matches());
                let (matched_terms, equalities): (Vec<ENodeIdx>, Vec<Vec<EqTransIdx>>) =
                    trigger_matches
                        .map(|(_, matched)| (matched.enode(), matched.equalities().collect()))
                        .unzip();
                let quant = match_.kind.quant_idx().unwrap();
                for (n, matched_term) in matched_terms.iter().enumerate() {
                    let creator = parser[*matched_term].created_by;
                    let Some(inst) = creator else {
                        continue;
                    };
                    let match_ = &parser[parser[inst].match_];
                    let Some(creator_pattern) = match_.kind.pattern() else {
                        continue;
                    };
                    let creator_quant = match_.kind.quant_idx().unwrap();
                    let blame_term = parser[*matched_term].owner;
                    if let Some(abstract_inst) = abstract_insts.get_mut(&(quant, pattern)) {
                        abstract_inst.merge_nth_blame_term(
                            n,
                            blame_term,
                            creator_quant,
                            creator_pattern,
                            parser,
                        )
                    } else {
                        abstract_insts
                            .insert((quant, pattern), AbstractInst::from((quant, pattern)));
                        abstract_insts
                            .get_mut(&(quant, pattern))
                            .unwrap()
                            .merge_nth_blame_term(
                                n,
                                blame_term,
                                creator_quant,
                                creator_pattern,
                                parser,
                            )
                    }
                }
                for (n, equality) in equalities.iter().enumerate() {
                    for (i, eq) in equality.iter().enumerate() {
                        let creator_insts: Vec<(QuantIdx, TermIdx)> = parser[*eq]
                            .get_creator_insts(parser)
                            .iter()
                            .filter_map(|iidx| {
                                if let Some(inst) = iidx {
                                    let match_ = &parser[parser[*inst].match_];
                                    let creator_pattern = match_.kind.pattern().unwrap();
                                    let creator_quant = match_.kind.quant_idx().unwrap();
                                    Some((creator_quant, creator_pattern))
                                } else {
                                    None
                                }
                            })
                            .collect();
                        if !creator_insts.is_empty() {
                            let from = parser.egraph.equalities.from(*eq);
                            let from_term = parser[from].owner;
                            let to = parser[*eq].to;
                            let to_term = parser[to].owner;
                            if let Some(abstract_inst) = abstract_insts.get_mut(&(quant, pattern)) {
                                abstract_inst.merge_nth_equalities(
                                    n + i,
                                    from_term,
                                    to_term,
                                    creator_insts,
                                    parser,
                                )
                            } else {
                                abstract_insts
                                    .insert((quant, pattern), AbstractInst::from((quant, pattern)));
                                abstract_insts
                                    .get_mut(&(quant, pattern))
                                    .unwrap()
                                    .merge_nth_equalities(
                                        n + i,
                                        from_term,
                                        to_term,
                                        creator_insts,
                                        parser,
                                    )
                            }
                        }
                    }
                }
            } else {
                unreachable!()
            }
        }
        let mut ml_graph: Graph<MLGraphNode, ()> = Graph::with_capacity(0, 0);
        let mut nx_of_gen_term: FxHashMap<MLGraphNode, NodeIndex> = FxHashMap::default();
        let mut nx_of_abstract_inst: FxHashMap<(QuantIdx, TermIdx), NodeIndex> =
            FxHashMap::default();

        for ((quant, pattern), abstract_inst) in abstract_insts.iter() {
            let abstract_inst_nx = if let Some(nx) = nx_of_abstract_inst.get(&(*quant, *pattern)) {
                *nx
            } else {
                let generalised_pattern = parser
                    .synth_terms
                    .generalise_pattern(&parser.terms, *pattern)
                    .unwrap();
                let nx = ml_graph.add_node(MLGraphNode::QI(*quant, generalised_pattern));
                nx_of_abstract_inst.insert((*quant, *pattern), nx);
                nx
            };
            for matched_term in abstract_inst.matched_terms.values() {
                let enode = MLGraphNode::ENode(matched_term.matched);
                let matched_term_nx = if let Some(nx) = nx_of_gen_term.get(&enode) {
                    *nx
                } else {
                    let nx = ml_graph.add_node(enode.clone());
                    nx_of_gen_term.insert(enode, nx);
                    nx
                };
                ml_graph.update_edge(matched_term_nx, abstract_inst_nx, ());
                let matched_term_creator_nx =
                    if let Some(nx) = nx_of_abstract_inst.get(&matched_term.creator) {
                        *nx
                    } else if let Some(creator_abstract_inst) =
                        abstract_insts.get(&matched_term.creator)
                    {
                        let generalised_pattern = parser
                            .synth_terms
                            .generalise_pattern(&parser.terms, creator_abstract_inst.id.1)
                            .unwrap();
                        let nx = ml_graph.add_node(MLGraphNode::QI(
                            creator_abstract_inst.id.0,
                            generalised_pattern,
                        ));
                        nx_of_abstract_inst
                            .insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                        nx
                    } else {
                        let creator_abstract_inst = AbstractInst::from(matched_term.creator);
                        let generalised_pattern = parser
                            .synth_terms
                            .generalise_pattern(&parser.terms, creator_abstract_inst.id.1)
                            .unwrap();
                        let nx = ml_graph.add_node(MLGraphNode::QI(
                            creator_abstract_inst.id.0,
                            generalised_pattern,
                        ));
                        nx_of_abstract_inst
                            .insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                        nx
                    };
                ml_graph.update_edge(matched_term_creator_nx, matched_term_nx, ());
            }
            for eq in abstract_inst.equalities.values() {
                if eq.from != eq.to {
                    let eq_node = MLGraphNode::Equality(eq.from, eq.to);
                    let eq_nx = if let Some(nx) = nx_of_gen_term.get(&eq_node) {
                        *nx
                    } else {
                        let nx = ml_graph.add_node(eq_node.clone());
                        nx_of_gen_term.insert(eq_node, nx);
                        nx
                    };
                    ml_graph.update_edge(eq_nx, abstract_inst_nx, ());
                    for eq_creator in &eq.creators {
                        let eq_creator_nx = if let Some(nx) = nx_of_abstract_inst.get(eq_creator) {
                            *nx
                        } else if let Some(creator_abstract_inst) = abstract_insts.get(eq_creator) {
                            let generalised_pattern = parser
                                .synth_terms
                                .generalise_pattern(&parser.terms, creator_abstract_inst.id.1)
                                .unwrap();
                            let nx = ml_graph.add_node(MLGraphNode::QI(
                                creator_abstract_inst.id.0,
                                generalised_pattern,
                            ));
                            nx_of_abstract_inst.insert(
                                (creator_abstract_inst.id.0, creator_abstract_inst.id.1),
                                nx,
                            );
                            nx
                        } else {
                            let creator_abstract_inst = AbstractInst::from(*eq_creator);
                            let generalised_pattern = parser
                                .synth_terms
                                .generalise_pattern(&parser.terms, creator_abstract_inst.id.1)
                                .unwrap();
                            let nx = ml_graph.add_node(MLGraphNode::QI(
                                creator_abstract_inst.id.0,
                                generalised_pattern,
                            ));
                            nx_of_abstract_inst.insert(
                                (creator_abstract_inst.id.0, creator_abstract_inst.id.1),
                                nx,
                            );
                            nx
                        };
                        ml_graph.update_edge(eq_creator_nx, eq_nx, ());
                    }
                }
            }
        }
        ml_graph
    }

    // fn _get_pattern(&self, iidx: InstIdx, parser: &Z3Parser) -> Option<TermIdx> {
    //     if let Some(_quant) = parser[parser[iidx].match_].kind.quant_idx() {
    //         let inst = &parser[iidx];
    //         let match_ = &parser[inst.match_];
    //         match_.kind.pattern()
    //     } else {
    //         None
    //     }
    // }
}

pub(super) struct AbstractInst {
    // abstract instantiation defined by quantifier and trigger
    id: (QuantIdx, TermIdx),
    // stores the generalised blame terms and which (generalised) instantiation created it (indirectly)
    // the first element in each tuple is a vector that will be mapped to a generalised term
    matched_terms: FxHashMap<usize, MlMatchedTerm>,
    // stores the generalised equalities and which (generalised) instantiation created it (indirectly)
    // the first element in each tuple is a vector that will be mapped to a generalised term
    equalities: FxHashMap<usize, MlEquality>,
}

impl AbstractInst {
    pub fn from(id: (QuantIdx, TermIdx)) -> Self {
        Self {
            id,
            matched_terms: FxHashMap::default(),
            equalities: FxHashMap::default(),
        }
    }
    pub fn merge_nth_blame_term(
        &mut self,
        n: usize,
        blame_term: TermIdx,
        creator_quant: QuantIdx,
        creator_pattern: TermIdx,
        parser: &mut Z3Parser,
    ) {
        if let Some(matched_term) = self.matched_terms.get_mut(&n) {
            matched_term.merge_with(blame_term, creator_quant, creator_pattern, parser);
        } else {
            self.matched_terms.insert(
                n,
                MlMatchedTerm::from(blame_term, creator_quant, creator_pattern),
            );
        }
    }

    pub fn merge_nth_equalities(
        &mut self,
        n: usize,
        from: TermIdx,
        to: TermIdx,
        creators: Vec<(QuantIdx, TermIdx)>,
        parser: &mut Z3Parser,
    ) {
        if let Some(equalities) = self.equalities.get_mut(&n) {
            equalities.merge_with(from, to, creators, parser);
        } else {
            self.equalities
                .insert(n, MlEquality::from(from.into(), to.into(), creators));
        }
    }
    // pub fn _to_string(&self, compact: bool, parser: &mut Z3Parser, ctxt: DisplayCtxt) -> String {
    //     let generalised_pattern = parser
    //         .terms
    //         .generalise_pattern(&mut parser.strings, self.id.1);
    //     let matched_terms = self
    //         .matched_terms
    //         .values()
    //         .map(|mterm| {
    //             format!(
    //                 "{} created by {}",
    //                 mterm.matched.with(&ctxt),
    //                 parser[mterm.creator.0].kind.with(&ctxt)
    //             )
    //         })
    //         .collect::<Vec<String>>()
    //         .join(", ");
    //     let equalities = self
    //         .equalities
    //         .values()
    //         .map(|meq| {
    //             format!(
    //                 "{} = {} created by {}",
    //                 meq.from.with(&ctxt),
    //                 meq.to.with(&ctxt),
    //                 meq.creators
    //                     .iter()
    //                     .map(|cr| format!("{}", parser[cr.0].kind.with(&ctxt)))
    //                     .collect::<Vec<String>>()
    //                     .join(", ")
    //             )
    //         })
    //         .collect::<Vec<String>>()
    //         .join(", ");
    //     if compact {
    //         format!(
    //             "{}: {}",
    //             parser[self.id.0].kind.with(&ctxt),
    //             generalised_pattern.with(&ctxt)
    //         )
    //     } else {
    //         format!("Abstract Instantiation ({}, {}) \n has matched terms \n {} \n and \n equalities {}", parser[self.id.0].kind.with(&ctxt), generalised_pattern.with(&ctxt), matched_terms, equalities)
    //     }
    // }
}
