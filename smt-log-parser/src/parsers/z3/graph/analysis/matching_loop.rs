use std::{collections::{HashMap, HashSet}, ops::Deref};

use fxhash::{FxHashMap, FxHashSet};
use gloo_console::log;
use petgraph::{graph::NodeIndex, visit::Dfs, Direction::{Incoming, Outgoing}};

use crate::{display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt}, items::{ENodeIdx, EqTransIdx, InstIdx, MatchKind, QuantIdx, TermIdx}, parsers::z3::graph::{raw::{Node, NodeKind, RawIx}, visible::VisibleEdge, InstGraph}, Graph, Z3Parser};
use super::RawNodeIndex;
// use matching_loop_graph::*;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;

struct MlEquality {
    from: TermIdx,
    to: TermIdx,
    creators: FxHashSet<(QuantIdx, TermIdx)>,
}

impl MlEquality {
    pub fn merge_with(&mut self, from: TermIdx, to: TermIdx, creators: Vec<(QuantIdx, TermIdx)>, parser: &mut Z3Parser) {
        // let ctxt = DisplayCtxt {
        //     parser: &parser,
        //     config: DisplayConfiguration {
        //         display_term_ids: false,
        //         display_quantifier_name: false,
        //         use_mathematical_symbols: true,
        //         html: true,
        //         // Set manually elsewhere
        //         enode_char_limit: 0,
        //         limit_enode_chars: false,
        //     },
        // };
        // log!(format!("Generalising {} = {} with {} = {}", self.from.with(&ctxt), self.to.with(&ctxt), from.with(&ctxt), to.with(&ctxt)));
        if let Some(term) = parser.terms.generalise(&mut parser.strings, vec![self.from, from]) {
            self.from = term;
        }
        if let Some(term) = parser.terms.generalise(&mut parser.strings, vec![self.to, to]) {
            self.to = term;
        }
        self.creators.extend(creators);
    }
    pub fn from(from: TermIdx, to: TermIdx, creators: Vec<(QuantIdx, TermIdx)>) -> Self {
        MlEquality { from, to, creators: creators.iter().cloned().collect() }
    }
}

impl Default for MlEquality {
    fn default() -> Self {
        Self { from: TermIdx::from(0), to: TermIdx::from(0), creators: HashSet::default() }
    }
}

struct MlMatchedTerm {
    matched: TermIdx,
    creator: (QuantIdx, TermIdx),
}

impl MlMatchedTerm {
    // TODO: maybe only generalise the terms in the very end? Otherwise we are creating lots of unnecessary generalised
    // terms that we won't even make use of
    pub fn merge_with(&mut self, matched: TermIdx, quant: QuantIdx, pattern: TermIdx, parser: &mut Z3Parser) {
        let _ctxt = DisplayCtxt {
            parser: &parser,
            config: DisplayConfiguration {
                display_term_ids: false,
                display_quantifier_name: false,
                use_mathematical_symbols: true,
                html: true,
                // Set manually elsewhere
                enode_char_limit: 0,
                limit_enode_chars: false,
                },
        };
        // log!(format!("Generalising {} with {}", self.matched.with(&ctxt), matched.with(&ctxt)));
        if let Some(term) = parser.terms.generalise(&mut parser.strings, vec![self.matched, matched]) {
            self.matched = term;
        }
        self.creator = (quant, pattern)
    }
    pub fn from(matched: TermIdx, quant: QuantIdx, pattern: TermIdx) -> Self {
        MlMatchedTerm { matched, creator: (quant, pattern) }
    }
}

struct AbstractInst {
    // abstract instantiation defined by quantifier and trigger
    id: (QuantIdx, TermIdx),
    // stores the generalised blame terms and which (generalised) instantiation created it (indirectly)  
    // the first element in each tuple is a vector that will be mapped to a generalized term
    matched_terms: FxHashMap<usize, MlMatchedTerm>,
    // stores the generalised equalities and which (generalised) instantiation created it (indirectly)  
    // the first element in each tuple is a vector that will be mapped to a generalized term
    equalities: FxHashMap<usize, MlEquality>,
}

impl AbstractInst {
    pub fn from(id: (QuantIdx, TermIdx)) -> Self {
        Self { id, matched_terms: HashMap::default(), equalities: HashMap::default() }
    }
    pub fn merge_nth_blame_term(&mut self, n: usize, blame_term: TermIdx, creator_quant: QuantIdx, creator_pattern: TermIdx, parser: &mut Z3Parser) {
        if let Some(matched_term) = self.matched_terms.get_mut(&n) {
            matched_term.merge_with(blame_term, creator_quant, creator_pattern, parser);
        } else {
            self.matched_terms.insert(n, MlMatchedTerm::from(blame_term, creator_quant, creator_pattern));
        }
    }

    pub fn merge_nth_equalities(&mut self, n: usize, from: TermIdx, to: TermIdx, creators: Vec<(QuantIdx, TermIdx)>, parser: &mut Z3Parser) {
        if let Some(equalities) = self.equalities.get_mut(&n) {
            equalities.merge_with(from, to, creators, parser);
        } else {
            self.equalities.insert(n, MlEquality::from(from, to, creators));
        }
    }
    pub fn to_string(&self, compact: bool, parser: &mut Z3Parser) -> String {
        let generalised_pattern = parser.terms.generalise_pattern(&mut parser.strings, self.id.1);  
        let ctxt = DisplayCtxt {
            parser: &parser,
            config: DisplayConfiguration {
                display_term_ids: false,
                display_quantifier_name: false,
                use_mathematical_symbols: true,
                html: true,
                // Set manually elsewhere
                enode_char_limit: 0,
                limit_enode_chars: false,
                },
        };
        let matched_terms = self.matched_terms.values().map(|mterm| format!("{} created by {}", mterm.matched.with(&ctxt), parser[mterm.creator.0].kind.with(&ctxt))).collect::<Vec<String>>().join(", ");
        let equalities = self.equalities.values().map(|meq| format!("{} = {} created by {}", meq.from.with(&ctxt), meq.to.with(&ctxt), meq.creators.iter().map(|cr| format!("{}", parser[cr.0].kind.with(&ctxt))).collect::<Vec<String>>().join(", "))).collect::<Vec<String>>().join(", ");
        if compact {
            format!("{}: {}", parser[self.id.0].kind.with(&ctxt), generalised_pattern.with(&ctxt))
        } else {
            format!("Abstract Instantiation ({}, {}) \n has matched terms \n {} \n and \n equalities {}", parser[self.id.0].kind.with(&ctxt), generalised_pattern.with(&ctxt), matched_terms, equalities)
        }
    }
}

#[derive(Debug, Clone)]
pub enum MLGraphNode {
    QI(QuantIdx),
    ENode,
    Equality,
}

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: &mut Z3Parser) -> usize {
        let currently_disabled_nodes = self.disabled_nodes();
        self.initialise_inst_succs_and_preds(&parser);
        // disable all nodes that do not correspond to QIs
        self.reset_disabled_to(&parser, |nx, g| !matches!(g[nx].kind(), NodeKind::Instantiation(_)));
        let quants: FxHashSet<_> = self
            .raw
            .graph
            .node_weights()
            .filter_map(|node| if let NodeKind::Instantiation(inst) = node.kind() { Some(inst) } else { None })
            .flat_map(|inst| parser[parser[*inst].match_].kind.quant_idx())
            .collect();
        let mut matching_loop_nodes_per_quant: Vec<FxHashSet<RawNodeIndex>> = Vec::new();
        for quant in quants {
            self.raw.reset_visibility_to(true);
            self.raw.set_visibility_when(false, |_: RawNodeIndex, node: &Node| node.kind().inst().is_some_and(|i| parser[parser[i].match_].kind.quant_idx() == Some(quant)));
            let mut visible_graph = self.to_visible_simplified();
            let matching_loops = visible_graph.find_end_nodes_of_longest_paths();
            matching_loop_nodes_per_quant.push(matching_loops);
        }
        self.raw.reset_visibility_to(true);
        let ml_nodes = matching_loop_nodes_per_quant
            .iter()
            .flat_map(|ml| ml.iter().cloned());
        self.raw.set_visibility_many(false, ml_nodes);
        let mut matching_loop_subgraph = self.to_visible_simplified();
        // for displaying the nth longest matching loop later on, we want to compute the end nodes of all the matching loops
        // and sort them by max-depth in descending order
        matching_loop_subgraph.compute_longest_distances_from_roots();
        // compute end-nodes of matching loops 
        let mut matching_loop_end_nodes: Vec<_> = matching_loop_subgraph 
            .graph
            .node_indices()
            // only keep end-points of matching loops, i.e., nodes without any children in the matching loop subgraph
            .filter(|nx| {
                matching_loop_subgraph.graph.neighbors_directed(*nx, Outgoing).count() == 0
            })
            .collect();
        // sort the matching loop end-nodes by the max-depth
        matching_loop_end_nodes.sort_unstable_by(|node_a, node_b| {
            let max_depth_node_a = matching_loop_subgraph.graph.node_weight(*node_a).unwrap().max_depth;
            let max_depth_node_b = matching_loop_subgraph.graph.node_weight(*node_b).unwrap().max_depth;
            if max_depth_node_a < max_depth_node_b {
                std::cmp::Ordering::Greater
            } else {
                std::cmp::Ordering::Less
            }
        });
        // assign to each node in a matching loop which matching loops it belongs to, i.e., if a node is part of the 
        // i-th longest matching loop, it stores the index i-1. Do this, by doing a reverse-DFS from all ML end nodes 
        for (i, end_node) in matching_loop_end_nodes.iter().enumerate() {
            let mut dfs = Dfs::new(petgraph::visit::Reversed(&matching_loop_subgraph.graph), *end_node);
            while let Some(nx) = dfs.next(petgraph::visit::Reversed(&matching_loop_subgraph.graph)) {
                let orig_nx = matching_loop_subgraph.graph[nx].idx.0;
                self.raw.graph[orig_nx].part_of_ml.insert(i);
            }
        }
        // collect all matching loop end nodes
        let matching_loop_end_nodes_raw_indices: Vec<RawNodeIndex> = matching_loop_end_nodes
            .iter()
            .map(|nidx| matching_loop_subgraph.graph[*nidx].idx)
            .collect();
        // return the total number of potential matching loops
        let nr_matching_loop_end_nodes = matching_loop_end_nodes_raw_indices.len();
        self.analysis.matching_loop_end_nodes = Some(matching_loop_end_nodes_raw_indices);

        // compute the ML graphs for all the potential matching loops
        // first enable all of them
        self.reset_disabled_to(&parser, |_, _| false);
        self.analysis.matching_loop_graphs = (0..nr_matching_loop_end_nodes).map(|n| self.compute_nth_matching_loop_graph(n, parser)).collect();
        
        // make sure the enabled and disabled nodes stay the same as before calling the ML search 
        self.reset_disabled_to(&parser, |nx, _| currently_disabled_nodes.contains(&nx));
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }

    pub fn nth_matching_loop_graph(&mut self, n: usize) -> petgraph::Graph<(String, MLGraphNode), ()> {
        if let Some(ml_graph) = self.analysis.matching_loop_graphs.get(n) {
            ml_graph.deref().clone()
            // Graph(ml_graph.0.clone())
        } else {
            petgraph::Graph::default().clone()
        }
    }

    fn _get_blame_term(&self, edge: &VisibleEdge, parser: &Z3Parser) -> Option<TermIdx> {
            let kind = edge.kind(self);
            let node = &self.raw[self.raw.index(kind.blame(self))];
            match node.kind() {
                NodeKind::ENode(enode) => {
                    return Some(parser[*enode].owner)
                }
                NodeKind::GivenEquality(eq, _) => {match parser[*eq] {
                    crate::items::EqualityExpl::Literal { eq, .. } => return Some(parser[eq].owner),
                    _ => return None 
                }},
                _ => return None,
            };
    }

    pub fn compute_nth_matching_loop_graph(&mut self, n: usize, parser: &mut Z3Parser) -> Graph<(String, MLGraphNode), ()> {
        // filter out graph to only view the nodes that belong to nth matching loop
        self.raw.reset_visibility_to(true);
        // make the nodes of the n-th matching loop visible
        let nodes_of_nth_matching_loop = self.raw.graph.node_indices().filter(|nx| self.raw.graph[*nx].part_of_ml.contains(&n)).collect::<FxHashSet<NodeIndex<RawIx>>>();
        self.raw.set_visibility_when(false, |_: RawNodeIndex, node: &Node| node.kind().inst().is_some() && node.part_of_ml.contains(&n));
        // identify the blame terms of the nodes of the n-th matching loop that have both an ancestor and a descendant that is part of the n-th matching loop and make them visible
        let relevant_blame_terms = nodes_of_nth_matching_loop.iter().flat_map(|nx| 
            self.raw.graph
                .neighbors_directed(*nx, Incoming)
                .filter(|nx| self.raw.graph[*nx].kind().inst().is_none())
                .filter(|nx| self.raw.graph[*nx].inst_children.nodes.intersection(&nodes_of_nth_matching_loop).count() > 0 && self.raw.graph[*nx].inst_parents.nodes.intersection(&nodes_of_nth_matching_loop).count() > 0)
                .map(|nx| RawNodeIndex(nx))
        ).collect::<Vec<RawNodeIndex>>();
        self.raw.set_visibility_many(false, relevant_blame_terms.iter().cloned());
        let potential_ml = self.to_visible();
        // generalise the blame terms and equalities
        // let mut equality_term_buckets: FxHashMap<((QuantIdx, TermIdx), (QuantIdx, TermIdx)), Vec<(TermIdx, TermIdx)>> = HashMap::default();
        // let mut enode_term_buckets: FxHashMap<((QuantIdx, TermIdx), (QuantIdx, TermIdx)), Vec<TermIdx>> = HashMap::default();
        let mut abstract_insts: FxHashMap<(QuantIdx, TermIdx), AbstractInst> = HashMap::default();
        for nx in potential_ml.graph.node_indices() {
            let idx = potential_ml.graph[nx].idx;
            let node_kind = self.raw.graph[idx.0].kind();
            if let NodeKind::Instantiation(inst) = node_kind {
                // log!(format!("Processing i{}", inst));
                let match_ = &parser[parser[*inst].match_];
                let pattern = match_.kind.pattern().unwrap();
                // here we have pairs (trigger, matched) where 
                // matched.enode(): ENodeIdx is the matched term
                // matched.equalities(): Iterator<EqTransIdx> iterates over all equalities used to rewrite the matched term 
                let trigger_matches = parser[pattern].child_ids.iter().zip(match_.trigger_matches());
                let (matched_terms, equalities): (Vec<ENodeIdx>, Vec<Vec<EqTransIdx>>) = trigger_matches.map(|(_, matched)| (matched.enode(), matched.equalities().collect())).unzip();
                let quant = match_.kind.quant_idx().unwrap();
                // if let Some(abstract_inst) = abstract_insts.get_mut(&(quant, pattern)) {
                    for (n, matched_term) in matched_terms.iter().enumerate() {
                        // let parent_enode_owners: Vec<_> = potential_ml.graph.neighbors_directed(nx, Incoming).filter_map(|idx| {
                        //     let idx = potential_ml.graph[idx].idx;
                        //     let node_kind = self.raw.graph[idx.0].kind();  
                        //     if let Some(enode) = node_kind.enode() {
                        //         Some(parser[enode].owner)
                        //     } else {
                        //         None
                        //     }
                        // }).collect();
                        let creator = parser[*matched_term].created_by;
                        if let Some(inst) = creator {
                            let match_ = &parser[parser[inst].match_];
                            let creator_pattern = match_.kind.pattern().unwrap();
                            let creator_quant = match_.kind.quant_idx().unwrap();
                            let blame_term = parser[*matched_term].owner;
                            // if parent_enode_owners.contains(&blame_term) {
                                if let Some(abstract_inst) = abstract_insts.get_mut(&(quant, pattern)) {
                                    abstract_inst.merge_nth_blame_term(n, blame_term, creator_quant, creator_pattern, parser)
                                } else {
                                    abstract_insts.insert((quant, pattern), AbstractInst::from((quant, pattern)));
                                    abstract_insts.get_mut(&(quant, pattern)).unwrap().merge_nth_blame_term(n, blame_term, creator_quant, creator_pattern, parser)
                                }
                            // }
                        }
                    }
                    for (n, equality) in equalities.iter().enumerate() {
                        for (i, eq) in equality.iter().enumerate() {
                            // should first check that eq = (from, to) occurs as an equality in the ML-graph, so need to 
                            // collect all incoming equalities of the current node
                            let creator_insts: Vec<(QuantIdx, TermIdx)> = parser[*eq].get_creator_insts(parser).iter().filter_map(|iidx| {
                                if let Some(inst) = iidx {
                                    let match_ = &parser[parser[*inst].match_];
                                    let creator_pattern = match_.kind.pattern().unwrap();
                                    let creator_quant = match_.kind.quant_idx().unwrap();
                                    Some((creator_quant, creator_pattern))
                                } else {
                                    None
                                }
                            }).collect();
                            let from = parser[*eq].from;
                            let from_term = parser[from].owner;
                            let to = parser[*eq].to;
                            let to_term = parser[to].owner;
                            // let ctxt = DisplayCtxt {
                            //     parser: &parser,
                            //     config: DisplayConfiguration {
                            //         display_term_ids: false,
                            //         display_quantifier_name: false,
                            //         use_mathematical_symbols: true,
                            //         html: true,
                            //         // Set manually elsewhere
                            //         enode_char_limit: 0,
                            //         limit_enode_chars: false,
                            //         },
                            // };
                            // if from_term != to_term {
                                if let Some(abstract_inst) = abstract_insts.get_mut(&(quant, pattern)) {
                                    // log!(format!("1: Merging {} = {} into QI {}", from_term.with(&ctxt), to_term.with(&ctxt), parser[quant].kind.with(&ctxt)));
                                    abstract_inst.merge_nth_equalities(n+i, from_term, to_term, creator_insts, parser)
                                } else {
                                    // log!(format!("2: Merging {} = {} into QI {}", from_term.with(&ctxt), to_term.with(&ctxt), parser[quant].kind.with(&ctxt)));
                                    abstract_insts.insert((quant, pattern), AbstractInst::from((quant, pattern)));
                                    abstract_insts.get_mut(&(quant, pattern)).unwrap().merge_nth_equalities(n, from_term, to_term, creator_insts, parser)
                                }
                            // }
                        }
                    }
                // }
            }
        } 
        for abstract_ints in abstract_insts.values() {
            log!(format!("{}", abstract_ints.to_string(false, parser)))
        }
        let mut ml_graph: Graph<(String, MLGraphNode), ()> = Graph::with_capacity(0, 0);
        let mut nx_of_gen_term: FxHashMap<String, NodeIndex> = HashMap::default();
        let mut nx_of_abstract_inst: FxHashMap<(QuantIdx, TermIdx), NodeIndex> = HashMap::default();

        for ((quant, pattern), abstract_inst) in &abstract_insts {
            let abstract_inst_nx = if let Some(nx) = nx_of_abstract_inst.get(&(*quant, *pattern)) {
                *nx
            } else {
                let abstract_inst_label = abstract_inst.to_string(true, parser);
                let nx = ml_graph.add_node((abstract_inst_label, MLGraphNode::QI(*quant)));
                nx_of_abstract_inst.insert((*quant, *pattern), nx);
                nx
            }; 
            for matched_term in abstract_inst.matched_terms.values() {
                let ctxt = DisplayCtxt {
                    parser: &parser,
                    config: DisplayConfiguration {
                        display_term_ids: false,
                        display_quantifier_name: false,
                        use_mathematical_symbols: true,
                        html: true,
                        // Set manually elsewhere
                        enode_char_limit: 0,
                        limit_enode_chars: false,
                        },
                };
                let pretty_matched_term = format!("{}", matched_term.matched.with(&ctxt));
                let matched_term_nx = if let Some(nx) = nx_of_gen_term.get(&pretty_matched_term) {
                    *nx
                } else {
                    let nx = ml_graph.add_node((pretty_matched_term.clone(), MLGraphNode::ENode));
                    nx_of_gen_term.insert(pretty_matched_term, nx);
                    nx
                };
                ml_graph.update_edge(matched_term_nx, abstract_inst_nx, ());
                let matched_term_creator_nx = if let Some(nx) = nx_of_abstract_inst.get(&matched_term.creator) {
                    *nx
                } else {
                    if let Some(creator_abstract_inst) = abstract_insts.get(&matched_term.creator) {
                        let abstract_inst_label = creator_abstract_inst.to_string(true, parser);
                        let nx = ml_graph.add_node((abstract_inst_label, MLGraphNode::QI(creator_abstract_inst.id.0)));
                        nx_of_abstract_inst.insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                        nx
                    } else {
                        let creator_abstract_inst = AbstractInst::from(matched_term.creator);
                        let abstract_inst_label = creator_abstract_inst.to_string(true, parser);
                        let nx = ml_graph.add_node((abstract_inst_label, MLGraphNode::QI(creator_abstract_inst.id.0)));
                        nx_of_abstract_inst.insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                        nx
                    }

                };
                ml_graph.update_edge(matched_term_creator_nx, matched_term_nx, ());
            }
            for eq in abstract_inst.equalities.values() {
                let ctxt = DisplayCtxt {
                    parser: &parser,
                    config: DisplayConfiguration {
                        display_term_ids: false,
                        display_quantifier_name: false,
                        use_mathematical_symbols: true,
                        html: true,
                        // Set manually elsewhere
                        enode_char_limit: 0,
                        limit_enode_chars: false,
                        },
                };
                if eq.from != eq.to {
                    let pretty_eq = format!("{} = {}", eq.from.with(&ctxt), eq.to.with(&ctxt));
                    let eq_nx = if let Some(nx) = nx_of_gen_term.get(&pretty_eq) {
                        *nx
                    } else {
                        let nx = ml_graph.add_node((pretty_eq.clone(), MLGraphNode::Equality));
                        nx_of_gen_term.insert(pretty_eq, nx);
                        nx
                    };
                    ml_graph.update_edge(eq_nx, abstract_inst_nx, ());
                    for eq_creator in &eq.creators {
                        let eq_creator_nx = if let Some(nx) = nx_of_abstract_inst.get(&eq_creator) {
                            *nx
                        } else {
                            if let Some(creator_abstract_inst) = abstract_insts.get(&eq_creator) {
                                let abstract_inst_label = creator_abstract_inst.to_string(true, parser);
                                let nx = ml_graph.add_node((abstract_inst_label, MLGraphNode::QI(creator_abstract_inst.id.0)));
                                nx_of_abstract_inst.insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                                nx
                            } else {
                                let creator_abstract_inst = AbstractInst::from(*eq_creator);
                                let abstract_inst_label = creator_abstract_inst.to_string(true, parser);
                                let nx = ml_graph.add_node((abstract_inst_label, MLGraphNode::QI(creator_abstract_inst.id.0)));
                                nx_of_abstract_inst.insert((creator_abstract_inst.id.0, creator_abstract_inst.id.1), nx);
                                nx
                            }
                        };
                        ml_graph.update_edge(eq_creator_nx, eq_nx, ());
                    }
                }
            }
        }
        return ml_graph
    }

    fn _get_pattern(&self, iidx: InstIdx, parser: &Z3Parser) -> Option<TermIdx> {
        if let Some(_quant) = parser[parser[iidx].match_].kind.quant_idx() {
            let inst = &parser[iidx];
            let match_ = &parser[inst.match_];
            match_.kind.pattern()
        } else {
            None
        }
    }
} 

#[derive(Clone, Debug)]
pub enum InstOrEquality {
    Inst(String, MatchKind),
    Equality,
}

impl std::fmt::Display for InstOrEquality {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            InstOrEquality::Inst(quant, _) => write!(f, "{}", quant),
            InstOrEquality::Equality => write!(f, ""),
        }
    }
}

// mod matching_loop_graph {
//     use std::{collections::{HashMap, HashSet}, fmt, hash::{Hash, Hasher}};

//     use fxhash::FxHashMap;
//     use petgraph::{graph::NodeIndex, visit::EdgeRef, Direction::Incoming, Graph};

//     use crate::{display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt}, items::{BlameKind, InstIdx, MatchKind, QuantIdx, TermIdx}, parsers::z3::graph::visible::{VisibleEdgeKind, VisibleInstGraph, VisibleIx}};

//     use super::*;

//     #[derive(Clone)]
//     struct AbstractInstantiation {
//         pub quant: QuantIdx,
//         // The meaning of an entry (blame_inst, (blame_term, blame_kind)) is that this instantiation
//         // blames the term blame_term via a blame_kind-dependency which was generated by blame_inst
//         pub blame_terms: FxHashMap<AbstractInstantiation, (TermIdx, VisibleEdgeKind)>,
//         // The meaning of an entry (yield_inst, (yield_term, blame_kind)) is that yield_inst blames 
//         // the term yield_term via a blame_kind-dependency which was generated by this instantiation 
//         pub yield_terms: FxHashMap<AbstractInstantiation, (TermIdx, VisibleEdgeKind)>,
//         pub pattern: TermIdx,
//         pub match_kind: MatchKind,
//         pub blame_term_deps: FxHashSet<AbstractInstantiation>,
//         pub equality_deps: FxHashSet<AbstractInstantiation>,
//     }

//     impl Hash for AbstractInstantiation {
//         fn hash<H: Hasher>(&self, state: &mut H) {
//             self.quant.hash(state);
//             self.pattern.hash(state);
//         }
//     }

//     impl std::cmp::PartialEq for AbstractInstantiation {
//         fn eq(&self, other: &Self) -> bool {
//             self.quant == other.quant && self.pattern == other.pattern
//         }
//     }

//     impl std::cmp::Eq for AbstractInstantiation {}

//     impl std::fmt::Display for AbstractInstantiation {
//         fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
//             write!(f, "(quant: {}, pattern: {})", self.quant, self.pattern)
//         }
//     }

//     impl AbstractInstantiation {
//         fn generalize(&mut self, other: Self, p: &mut Z3Parser) {
//             for (inst, (other_blame_term, blame_kind)) in other.blame_terms {
//                 if let Some((self_yield_term, _)) = self.blame_terms.get(&inst) {
//                     if let Some(gen_blame_term) = p.terms.generalise(&mut p.strings, vec![other_blame_term, *self_yield_term]) {
//                         self.blame_terms.insert(inst, (gen_blame_term, blame_kind.clone()));
//                     }
//                 } else {
//                     self.blame_terms.insert(inst, (other_blame_term, blame_kind));
//                 }
//             } 
//             for (inst, (other_yield_term, blame_kind)) in other.yield_terms {
//                 if let Some((self_yield_term, _)) = self.yield_terms.get(&inst) {
//                     if let Some(gen_yield_term) = p.terms.generalise(&mut p.strings, vec![other_yield_term, *self_yield_term]) {
//                         self.yield_terms.insert(inst, (gen_yield_term, blame_kind.clone()));
//                     }
//                 } else {
//                     self.yield_terms.insert(inst, (other_yield_term, blame_kind));
//                 }
//             } 
//             self.blame_term_deps = self.blame_term_deps.union(&other.blame_term_deps).cloned().collect();
//             self.equality_deps = self.equality_deps.union(&other.equality_deps).cloned().collect();
//         }

//         fn from(quant: QuantIdx, pattern: TermIdx) -> Self {
//             AbstractInstantiation {
//                 quant,
//                 blame_terms: HashMap::default(),
//                 yield_terms: HashMap::default(),
//                 pattern,
//                 match_kind: MatchKind::Quantifier { quant: QuantIdx::from(0), pattern: TermIdx::from(0), bound_terms: vec![].into() },
//                 blame_term_deps: HashSet::default(),
//                 equality_deps: HashSet::default(),
//             }
//         }

//         fn to_string(&self, p: &Z3Parser) -> String {
//             let ctxt = DisplayCtxt {
//                 parser: p,
//                 // display_term_ids: false,
//                 // display_quantifier_name: false,
//                 // use_mathematical_symbols: true,
//                 config: DisplayConfiguration {
//                     display_term_ids: false,
//                     display_quantifier_name: false,
//                     use_mathematical_symbols: true,
//                     html: true,
//                     // Set manually elsewhere
//                     enode_char_limit: 0,
//                     limit_enode_chars: false,
//                 },
//             };
//             let pretty_blame_terms = self.blame_terms
//                 .iter()
//                 .map(|(from_quant, (blame_term, _))| format!("{} from q{}", blame_term.with(&ctxt), from_quant))
//                 .collect::<Vec<String>>()
//                 .join(", ");
//             let pretty_pattern = self.pattern.with(&ctxt).to_string();
//             let pretty_yield_terms = self.yield_terms
//                 .iter()
//                 .map(|(to_quant, (yield_term, _))| format!("{} to q{}", yield_term.with(&ctxt), to_quant))
//                 .collect::<Vec<String>>()
//                 .join(", ");
//             format!("Quantifier q{} with pattern {} has blame terms {} and yield terms {}.", self.quant, pretty_pattern, pretty_blame_terms, pretty_yield_terms)
//         }
//     }

//     #[derive(Default)]
//     pub struct MatchingLoopGraph {
//         abstract_insts: Vec<AbstractInstantiation>,
//         pub graph: std::cell::RefCell<Graph<String, InstOrEquality>>,
//         node_idx_per_weight: std::cell::RefCell<FxHashMap<String, NodeIndex>>,
//         // needed such that we can index into this with AbstractInstantiation 
//         abstract_insts_idx_map: FxHashMap<AbstractInstantiation, usize>,
//     }

//     impl MatchingLoopGraph {

//         // fn get_pattern(nx: NodeIndex, graph: &VisibleInstGraph, orig_graph: &InstGraph, p: &Z3Parser) -> Option<TermIdx> {
//         //     let orig_index = graph[nx].;
//         //     let NodeData { inst_idx, ..} = orig_graph[orig_index];
//         //     let inst_idx = orig_graph.raw[orig_index] 
//         //     let inst = &p.insts[inst_idx];
//         //     let match_ = &p.insts[inst.match_];
//         //     match_.kind.pattern()
//         // }

//         fn inst_idx(nx: NodeIndex<VisibleIx>, graph: &VisibleInstGraph, orig_graph: &InstGraph, p: &mut Z3Parser) -> InstIdx {
//             orig_graph.raw[graph.graph[nx].idx].kind().inst().unwrap()
//         }

//         fn quant_idx(inst_idx: InstIdx, graph: &VisibleInstGraph, orig_graph: &InstGraph, p: &mut Z3Parser) -> Option<QuantIdx> {
//             p[p[inst_idx].match_].kind.quant_idx()
//         }

//         pub fn from_graph(graph: &VisibleInstGraph, orig_graph: &InstGraph, p: &mut Z3Parser) -> Graph<String, InstOrEquality> {
//             // let graph = graph.graph.filter_map(
//             // |_, data| match orig_graph.raw[data.idx].kind() {
//             //         NodeKind::Instantiation(_) => Some(data.clone()),
//             //         _ => None,
//             //     }, 
//             //     |_, data| Some(data.clone())
//             // );
//             let mut matching_loop_graph = Self::default();
//             for nx in graph.graph.node_indices() {
//                 // let quant = graph.node_weight(nx).unwrap().mkind.quant_idx().unwrap(); 
//                 let inst_idx = orig_graph.raw[graph.graph[nx].idx].kind().inst().unwrap(); 
//                 let quant = p[p[inst_idx].match_].kind.quant_idx().unwrap();
//                 let inst = &p[inst_idx];
//                 let match_ = &p.insts[inst.match_];
//                 let pattern = match_.kind.pattern().unwrap(); 
//                 let mut yield_terms = HashMap::default(); 
//                 for outgoing_edge in graph.graph.edges_directed(nx, Outgoing) {
//                     let to_nx = outgoing_edge.target();
//                     // if let Some(to_quant) = graph.graph.node_weight(to_nx).unwrap().mkind.quant_idx() {
//                     if let Some(to_quant) = p[p[orig_graph.raw[graph.graph[to_nx].idx].kind().inst().unwrap()].match_].kind.quant_idx() {
//                         // if let Some(yield_term) = outgoing_edge.weight().blame_term_idx() {
//                         if let Some(yield_term_idx) = orig_graph._get_blame_term(outgoing_edge.weight(), p) {
//                             // let yield_term_idx = p[yield_term].owner;
//                             let blame_kind = outgoing_edge.weight().kind(orig_graph);
//                             let to_pattern = orig_graph.get_pattern(orig_graph.raw[graph.graph[to_nx].idx].kind().inst().unwrap(), p).unwrap();
//                             if let Some((old_yield_term, _)) = yield_terms.get(&AbstractInstantiation::from(to_quant, to_pattern)) {
//                                 let gen_yield_term = p.terms.generalise(&mut p.strings, vec![*old_yield_term, yield_term_idx]).unwrap();
//                                 yield_terms.insert(AbstractInstantiation::from(to_quant, to_pattern), (gen_yield_term, blame_kind));
//                             } else {
//                                 yield_terms.insert(AbstractInstantiation::from(to_quant, to_pattern), (yield_term_idx, blame_kind));
//                             }
//                         }
//                     }
//                 }
//                 let mut blame_terms = HashMap::default();
//                 let mut blame_term_deps = HashSet::default();
//                 let mut equality_deps = HashSet::default();
//                 for incoming_edge in graph.graph.edges_directed(nx, Incoming) {
//                     let from_nx = incoming_edge.source();
//                     // if let Some(from_quant) = graph.node_weight(from_nx).unwrap().mkind.quant_idx() {
//                     if let Some(from_quant) = p[p[orig_graph.raw[graph.graph[from_nx].idx].kind().inst().unwrap()].match_].kind.quant_idx() {
//                         // if let Some(blame_term) = incoming_edge.weight().blame_term_idx() {
//                         if let Some(blame_term_idx) = orig_graph._get_blame_term(incoming_edge.weight(), p) {
//                             // let blame_term_idx = p[blame_term].owner;
//                             // let blame_kind = incoming_edge.weight().blame_kind();
//                             let blame_kind = incoming_edge.weight().kind(orig_graph);
//                             // let from_pattern = Self::get_pattern(from_nx, &graph, orig_graph, p).unwrap();
//                             let from_pattern = orig_graph.get_pattern(orig_graph.raw[graph.graph[from_nx].idx].kind().inst().unwrap(), p).unwrap();
//                             if let Some((old_blame_term, _)) = blame_terms.get(&AbstractInstantiation::from(from_quant, from_pattern)) {
//                                 let gen_blame_term = p.terms.generalise(&mut p.strings, vec![*old_blame_term, blame_term_idx]).unwrap();
//                                 blame_terms.insert(AbstractInstantiation::from(from_quant, from_pattern), (gen_blame_term, blame_kind.clone()));
//                             } else {
//                                 blame_terms.insert(AbstractInstantiation::from(from_quant, from_pattern), (blame_term_idx, blame_kind.clone()));
//                             }
//                             match blame_kind {
//                                 VisibleEdgeKind::Direct(_, _) | VisibleEdgeKind::YieldBlame { .. } => {blame_term_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 _ => {equality_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 // BlameKind::Term { .. } => {blame_term_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 // BlameKind::Equality { .. } => {equality_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 // _ => (),
//                             }
//                         }
//                     }
//                 }
//                 let abstract_inst = AbstractInstantiation {
//                     quant,
//                     blame_terms,
//                     yield_terms,
//                     pattern,
//                     match_kind: match_.kind.clone(),
//                     blame_term_deps,
//                     equality_deps,
//                 };
//                 matching_loop_graph.process_inst(abstract_inst, p);
//             }
//             matching_loop_graph.compute_matching_loop_graph(p);
//             matching_loop_graph.graph.into_inner()
//         }

//         fn display_insts(&self, p: &Z3Parser) -> Vec<String> {
//             let mut out = Vec::new();
//             for inst in &self.abstract_insts {
//                 out.push(inst.to_string(p));
//             }
//             out
//         } 

//         fn get(&self, inst: &AbstractInstantiation) -> Option<&AbstractInstantiation> {
//             if let Some(idx) = self.abstract_insts_idx_map.get(&inst) {
//                 self.abstract_insts.get(*idx)
//             } else {
//                 None
//             }
//         }

//         fn get_mut(&mut self, inst: &AbstractInstantiation) -> Option<&mut AbstractInstantiation> {
//             if let Some(idx) = self.abstract_insts_idx_map.get(&inst) {
//                 self.abstract_insts.get_mut(*idx)
//             } else {
//                 None
//             }
//         }

//         fn add_node(&self, term: String) -> NodeIndex {
//             let mut node_idx_per_weight = self.node_idx_per_weight.borrow_mut();
//             if let Some(idx) = node_idx_per_weight.get(&term) {
//                 *idx
//             } else {
//                 let node_idx = self.graph.borrow_mut().add_node(term.clone()); 
//                 node_idx_per_weight.insert(term, node_idx);
//                 node_idx
//             }
//         }

//         fn add_edge(&self, from: String, to: String, edge_label: InstOrEquality) {
//             let from_idx = self.add_node(from);
//             let to_idx = self.add_node(to);
//             self.graph.borrow_mut().update_edge(from_idx, to_idx, edge_label);
//         }

//         fn compute_matching_loop_graph(&mut self, p: &mut Z3Parser) {
//             self.cross_generalize_terms(p);
//             self.display_insts(p);
//             for inst in &self.abstract_insts {
//                 let gen_trigger = inst.pattern;
//                 let gen_trigger = p.terms.generalise_pattern(&mut p.strings, gen_trigger); 
//                 // let gen_blame_term = inst.blame_term; 
//                 let quant = inst.quant;
//                 if inst.equality_deps.len() == 0 {
//                     // inst does not always rely on equalities and hence at some point the blame terms are instances of the trigger 
//                     // so we can indicate this to the user by adding "direct" edges from the blame terms to the yield terms
//                     let ctxt = DisplayCtxt {
//                     parser: p,
//                     config: DisplayConfiguration {
//                     display_term_ids: false,
//                     display_quantifier_name: false,
//                     use_mathematical_symbols: true,
//                     html: true,
//                     // Set manually elsewhere
//                     enode_char_limit: 0,
//                     limit_enode_chars: false,
//                     },
//                 };
//                     for (_, (blame_term, blame_kind)) in &inst.blame_terms {
//                         // if let Some(BlameKind::Term {..}) = blame_kind {
//                         if matches!(blame_kind, VisibleEdgeKind::Direct(..)) ||  matches!(blame_kind, VisibleEdgeKind::YieldBlame {..}){
//                             let pretty_blame_term = blame_term.with(&ctxt).to_string();
//                             for (_, (yield_term, _)) in &inst.yield_terms {
//                                     let pretty_yield_term = yield_term.with(&ctxt).to_string();
//                                     self.add_edge(pretty_blame_term.clone(), pretty_yield_term, InstOrEquality::Inst(format!("q{}", quant), inst.match_kind.clone()));
//                             }
//                         }
//                     }
//                 } else {
//                     // here there are some equalities that this instantiation relies on 
//                     // more precisely, the blame terms are not instances of the triggers and hence
//                     // we need to rewrite them using equalities
//                     // We indicate this to the user by adding equality edges from all blame terms 
//                     // to all equalities that inst depends on and an equality edge from the equalities
//                     // to the trigger
//                     let ctxt = DisplayCtxt {
//                     parser: p,
//                     config: DisplayConfiguration {
//                     display_term_ids: false,
//                     display_quantifier_name: false,
//                     use_mathematical_symbols: true,
//                     html: true,
//                     // Set manually elsewhere
//                     enode_char_limit: 0,
//                     limit_enode_chars: false,
//                     },
//                 };
//                     let pretty_gen_trigger = gen_trigger.with(&ctxt).to_string();
//                     for (_, (yield_term, _)) in &inst.yield_terms {
//                         let pretty_yield_term = yield_term.with(&ctxt).to_string();
//                         self.add_edge(pretty_gen_trigger.clone(), pretty_yield_term, InstOrEquality::Inst(format!("q{}", quant), inst.match_kind.clone()));
//                     }
//                     for (_, (blame_term, blame_kind)) in &inst.blame_terms {
//                         // if let Some(BlameKind::Term {..}) = blame_kind {
//                         if matches!(blame_kind, VisibleEdgeKind::Direct(..)) ||  matches!(blame_kind, VisibleEdgeKind::YieldBlame {..}){
//                             for equality_dep in &inst.equality_deps {
//                                 let (equality, _) = self.get(equality_dep).unwrap().yield_terms.get(inst).unwrap();
//                                 let pretty_equality = equality.with(&ctxt).to_string();
//                                 let pretty_blame_term = blame_term.with(&ctxt).to_string();
//                                 self.add_edge(pretty_blame_term.clone(), pretty_equality.clone(), InstOrEquality::Equality);
//                                 self.add_edge(pretty_equality, pretty_gen_trigger.clone(), InstOrEquality::Equality);
//                             }
//                         } 
//                     }
//                 }
//             }
//         } 

//         fn process_inst(&mut self, new_inst: AbstractInstantiation, p: &mut Z3Parser) {
//             if let Some(inst) = self.get_mut(&new_inst) {
//                 inst.generalize(new_inst, p);
//             } else {
//                 let idx = self.abstract_insts.len();
//                 self.abstract_insts.push(new_inst.clone());
//                 self.abstract_insts_idx_map.insert(new_inst, idx);
//             }
//         }

//         fn cross_generalize_terms(&mut self, p: &mut Z3Parser) {
//             // here we generalize the terms across blame-term-edges, i.e., if node B blames term tb which is a yield term ta of node A
//             // then we update tb and ta with their intersection/generalization
//             let abstract_insts = self.abstract_insts.as_mut_slice();
//             let mut idx: usize = 0;
//             while idx < abstract_insts.len() {
//                 let (before, after) = abstract_insts.split_at_mut(idx);
//                 if let Some((curr, after)) = after.split_first_mut() {
//                     for (to, (yield_term, blame_kind)) in curr.yield_terms.clone() {
//                         // if let Some(BlameKind::Term {..}) = blame_kind {
//                         if matches!(blame_kind, VisibleEdgeKind::Direct(..)) ||  matches!(blame_kind, VisibleEdgeKind::YieldBlame {..}){
//                             let blame_term = if *curr == to {
//                                 curr.blame_terms.get(&curr).unwrap().0
//                             } else {
//                                 if let Some(el) = before.get(*self.abstract_insts_idx_map.get(&to).unwrap()) {
//                                     el.blame_terms.get(&curr).unwrap().0
//                                 } else {
//                                     after.get(*self.abstract_insts_idx_map.get(&to).unwrap() - (idx + 1)).unwrap().blame_terms.get(&curr).unwrap().0
//                                 }
//                             };
//                             let generalized_term = p.terms.generalise(&mut p.strings, vec![blame_term, yield_term]).unwrap();
//                             curr.yield_terms.insert(to.clone(), (generalized_term, blame_kind.clone()));
//                             if *curr == to {
//                                 // curr.blame_terms = generalized_term;
//                                 curr.blame_terms.get_mut(&to).unwrap().0 = generalized_term;
//                             } else {
//                                 if let Some(el) = before.get_mut(*self.abstract_insts_idx_map.get(&to).unwrap()) {
//                                     // el.blame_term = generalized_term;
//                                     el.blame_terms.get_mut(&curr).unwrap().0 = generalized_term;
//                                 } else {
//                                     // after.get_mut(*self.abstract_insts_idx_map.get(&to).unwrap() - (idx + 1)).unwrap().blame_term = generalized_term;
//                                     after.get_mut(*self.abstract_insts_idx_map.get(&to).unwrap() - (idx + 1)).unwrap().blame_terms.get_mut(&curr).unwrap().0 = generalized_term;
//                                 }
//                             }
//                         }
//                     }
//                 }
//                 idx += 1;
//             }
//         }
//     }
// }