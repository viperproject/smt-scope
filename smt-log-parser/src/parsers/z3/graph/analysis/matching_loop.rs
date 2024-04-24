use std::{default, rc::Rc};

use fxhash::FxHashSet;
use gloo_console::log;
use petgraph::{dot::{Config, Dot}, visit::Dfs, Direction::Outgoing, Graph};

use crate::{display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt}, items::MatchKind, parsers::z3::graph::{raw::{Node, NodeKind}, InstGraph}, Z3Parser};
use super::RawNodeIndex;
// use matching_loop_graph::*;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;

impl InstGraph {
    pub fn search_matching_loops(&mut self, parser: Rc<Z3Parser>) -> usize {
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
                self.raw.graph[orig_nx].part_of_ML.insert(i);
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
        // make sure the enabled and disabled nodes stay the same as before calling the ML search 
        self.reset_disabled_to(&parser, |nx, _| currently_disabled_nodes.contains(&nx));
        nr_matching_loop_end_nodes
    }

    pub fn found_matching_loops(&self) -> Option<usize> {
        self.analysis.matching_loop_end_nodes.as_ref().map(|mlen| mlen.len())
    }

    pub fn nth_matching_loop_graph(&mut self, n: usize, parser: &Z3Parser) -> Graph<String, ()> {
        let mut ctxt = DisplayCtxt {
            parser,
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
        let mut graph: Graph<String, ()> = Graph::default();
        // filter out graph to only view the nodes that belong to nth matching loop
        self.raw.reset_visibility_to(true);
        self.raw.set_visibility_when(false, |_: RawNodeIndex, node: &Node| node.kind().inst().is_some() && node.part_of_ML.contains(&n));
        let potential_ml = self.to_visible();
        log!(format!("Potential ML has {} nodes and {} edges", potential_ml.graph.node_count(), potential_ml.graph.edge_count()));
        for edge in potential_ml.graph.edge_indices() {
            let (from, to) = potential_ml.graph.edge_endpoints(edge).unwrap();
            let (from, to) = (potential_ml.graph[from].idx, potential_ml.graph[to].idx);
            let edge = &potential_ml.graph[edge];
            let kind = edge.kind(self);
            let node = &self.raw[self.raw.index(kind.blame(self))];
            let output = match node.kind() {
                NodeKind::ENode(enode) => {
                    ctxt.config.enode_char_limit *= 2;
                    enode.with(&ctxt).to_string()
                }
                NodeKind::GivenEquality(eq, _) => eq.with(&ctxt).to_string(),
                NodeKind::TransEquality(eq) => eq.with(&ctxt).to_string(),
                NodeKind::Instantiation(inst) => match &ctxt.parser[ctxt.parser[*inst].match_].kind {
                    MatchKind::MBQI { quant, .. } =>
                        ctxt.parser[*quant].kind.with(&ctxt).to_string(),
                    MatchKind::TheorySolving { axiom_id, .. } => {
                        let namespace = &ctxt.parser[axiom_id.namespace];
                        let id = axiom_id.display_id().map(|id| id.to_string()).unwrap_or_default();
                        format!("{namespace}[{id}]")
                    }
                    MatchKind::Axiom { axiom, .. } =>
                        ctxt.parser[*axiom].kind.with(&ctxt).to_string(),
                    MatchKind::Quantifier { quant, .. } =>
                        ctxt.parser[*quant].kind.with(&ctxt).to_string(),
                },
            };
            log!(format!("Edge from {} to {} has label {}", self.raw.graph[from.0].kind(), self.raw.graph[to.0].kind(), output));
        }
        for i in 0..n {
            graph.add_node(format!("{i}"));
        }
        return graph
    }
} 

// mod matching_loop_graph {
//     use std::{collections::{HashMap, HashSet}, fmt, hash::{Hash, Hasher}};

//     use fxhash::FxHashMap;
//     use petgraph::{graph::NodeIndex, Graph};

//     use crate::{display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt}, items::{BlameKind, MatchKind, QuantIdx, TermIdx}};

//     use super::*;

//     #[derive(Clone)]
//     struct AbstractInstantiation {
//         pub quant: QuantIdx,
//         // The meaning of an entry (blame_inst, (blame_term, blame_kind)) is that this instantiation
//         // blames the term blame_term via a blame_kind-dependency which was generated by blame_inst
//         pub blame_terms: FxHashMap<AbstractInstantiation, (TermIdx, Option<BlameKind>)>,
//         // The meaning of an entry (yield_inst, (yield_term, blame_kind)) is that yield_inst blames 
//         // the term yield_term via a blame_kind-dependency which was generated by this instantiation 
//         pub yield_terms: FxHashMap<AbstractInstantiation, (TermIdx, Option<BlameKind>)>,
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
//                     let gen_blame_term = p.terms.generalise(*self_yield_term, other_blame_term);
//                     self.blame_terms.insert(inst, (gen_blame_term, blame_kind.clone()));
//                 } else {
//                     self.blame_terms.insert(inst, (other_blame_term, blame_kind));
//                 }
//             } 
//             for (inst, (other_yield_term, blame_kind)) in other.yield_terms {
//                 if let Some((self_yield_term, _)) = self.yield_terms.get(&inst) {
//                     let gen_yield_term = p.terms.generalize(*self_yield_term, other_yield_term);
//                     self.yield_terms.insert(inst, (gen_yield_term, blame_kind.clone()));
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
//                 match_kind: MatchKind::Quantifier { quant: QuantIdx::from(0), pattern: TermIdx::from(0), bound_terms: vec![] },
//                 blame_term_deps: HashSet::default(),
//                 equality_deps: HashSet::default(),
//             }
//         }

//         fn _to_string(&self, p: &Z3Parser) -> String {
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

//         fn get_pattern(nx: NodeIndex, graph: &Graph<NodeData, EdgeType>, orig_graph: &Graph<NodeData, BlameKind>, p: &Z3Parser) -> Option<TermIdx> {
//             let orig_index = graph.node_weight(nx).unwrap().orig_graph_idx;
//             let NodeData { inst_idx, ..} = orig_graph[orig_index];
//             let inst = &p.insts[inst_idx];
//             let match_ = &p.insts[inst.match_];
//             match_.kind.pattern()
//         }

//         pub fn from_graph(graph: &Graph<NodeData, EdgeType>, orig_graph: &Graph<NodeData, BlameKind>, p: &mut Z3Parser) -> Graph<String, InstOrEquality> {
//             let graph = graph.filter_map(
//             |_, data| match data.mkind {
//                 MatchKind::Quantifier { .. } => Some(data.clone()),
//                 _ => None,
//             }, 
//             |_, data| Some(data.clone()));
//             let mut matching_loop_graph = Self::default();
//             for nx in graph.node_indices() {
//                 let quant = graph.node_weight(nx).unwrap().mkind.quant_idx().unwrap(); 
//                 let orig_index = graph.node_weight(nx).unwrap().orig_graph_idx;
//                 let NodeData { inst_idx, ..} = orig_graph[orig_index];
//                 let inst = &p.insts[inst_idx];
//                 let match_ = &p.insts[inst.match_];
//                 let pattern = match_.kind.pattern().unwrap(); 
//                 let mut yield_terms = HashMap::default(); 
//                 for outgoing_edge in graph.edges_directed(nx, Outgoing) {
//                     let to_nx = outgoing_edge.target();
//                     if let Some(to_quant) = graph.node_weight(to_nx).unwrap().mkind.quant_idx() {
//                         if let Some(yield_term) = outgoing_edge.weight().blame_term_idx() {
//                             let yield_term_idx = p[yield_term].owner;
//                             let blame_kind = outgoing_edge.weight().blame_kind();
//                             let to_pattern = Self::get_pattern(to_nx, &graph, orig_graph, p).unwrap();
//                             if let Some((old_yield_term, _)) = yield_terms.get(&AbstractInstantiation::from(to_quant, to_pattern)) {
//                                 let gen_yield_term = p.terms.generalize(*old_yield_term, yield_term_idx);
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
//                 for incoming_edge in graph.edges_directed(nx, Incoming) {
//                     let from_nx = incoming_edge.source();
//                     if let Some(from_quant) = graph.node_weight(from_nx).unwrap().mkind.quant_idx() {
//                         if let Some(blame_term) = incoming_edge.weight().blame_term_idx() {
//                             let blame_term_idx = p[blame_term].owner;
//                             let blame_kind = incoming_edge.weight().blame_kind();
//                             let from_pattern = Self::get_pattern(from_nx, &graph, orig_graph, p).unwrap();
//                             if let Some((old_blame_term, _)) = blame_terms.get(&AbstractInstantiation::from(from_quant, from_pattern)) {
//                                 let gen_blame_term = p.terms.generalize(*old_blame_term, blame_term_idx);
//                                 blame_terms.insert(AbstractInstantiation::from(from_quant, from_pattern), (gen_blame_term, blame_kind.clone()));
//                             } else {
//                                 blame_terms.insert(AbstractInstantiation::from(from_quant, from_pattern), (blame_term_idx, blame_kind.clone()));
//                             }
//                             match blame_kind.unwrap() {
//                                 BlameKind::Term { .. } => {blame_term_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 BlameKind::Equality { .. } => {equality_deps.insert(AbstractInstantiation::from(from_quant, from_pattern));},
//                                 _ => (),
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

//         fn _display_insts(&self, p: &Z3Parser) -> Vec<String> {
//             let mut out = Vec::new();
//             for inst in &self.abstract_insts {
//                 out.push(inst._to_string(p));
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
//             for inst in &self.abstract_insts {
//                 let gen_trigger = inst.pattern;
//                 let gen_trigger = p.terms.generalize_pattern(gen_trigger); 
//                 // let gen_blame_term = inst.blame_term; 
//                 let quant = inst.quant;
//                 if inst.equality_deps.len() == 0 {
//                     // inst does not always rely on equalities and hence at some point the blame terms are instances of the trigger 
//                     // so we can indicate this to the user by adding "direct" edges from the blame terms to the yield terms
//                     let ctxt = DisplayCtxt {
//                         parser: p,
//                         display_term_ids: false,
//                         display_quantifier_name: false,
//                         use_mathematical_symbols: true,
//                     };
//                     for (_, (blame_term, blame_kind)) in &inst.blame_terms {
//                         if let Some(BlameKind::Term {..}) = blame_kind {
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
//                         parser: p,
//                         display_term_ids: false,
//                         display_quantifier_name: false,
//                         use_mathematical_symbols: true,
//                     };
//                     let pretty_gen_trigger = gen_trigger.with(&ctxt).to_string();
//                     for (_, (yield_term, _)) in &inst.yield_terms {
//                         let pretty_yield_term = yield_term.with(&ctxt).to_string();
//                         self.add_edge(pretty_gen_trigger.clone(), pretty_yield_term, InstOrEquality::Inst(format!("q{}", quant), inst.match_kind.clone()));
//                     }
//                     for (_, (blame_term, blame_kind)) in &inst.blame_terms {
//                         if let Some(BlameKind::Term {..}) = blame_kind {
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
//                         if let Some(BlameKind::Term {..}) = blame_kind {
//                             let blame_term = if *curr == to {
//                                 curr.blame_terms.get(&curr).unwrap().0
//                             } else {
//                                 if let Some(el) = before.get(*self.abstract_insts_idx_map.get(&to).unwrap()) {
//                                     el.blame_terms.get(&curr).unwrap().0
//                                 } else {
//                                     after.get(*self.abstract_insts_idx_map.get(&to).unwrap() - (idx + 1)).unwrap().blame_terms.get(&curr).unwrap().0
//                                 }
//                             };
//                             let generalized_term = p.terms.generalize(yield_term, blame_term);
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