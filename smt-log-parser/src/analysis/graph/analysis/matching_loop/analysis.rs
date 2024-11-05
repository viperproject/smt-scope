use fxhash::FxHashSet;
use petgraph::graph::NodeIndex;

use crate::{
    analysis::{
        analysis::{MlEndNodes, TopoAnalysis},
        raw::Node,
        InstGraph, RawNodeIndex,
    },
    items::{Blame, EqualityExpl, InstIdx},
    parsers::z3::synthetic::SynthIdx,
    FxHashMap, Graph, Z3Parser,
};

use super::{MLGraphEdge, MLGraphNode, MlSignature};

pub struct MlOutput {
    ml_leaves: MlEndNodes,
    pub ml_nodes: FxHashSet<InstIdx>,
    node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
    topo: FxHashMap<InstIdx, FxHashSet<InstIdx>>,
}

type InstGraphNodes = (NodeIndex, Vec<(NodeIndex, Vec<NodeIndex>)>);

impl MlOutput {
    pub fn leaves(&self) -> impl Iterator<Item = &(MlSignature, Vec<(u32, InstIdx)>)> + '_ {
        self.ml_leaves
            .iter()
            .filter(|(_, leaves)| !leaves.is_empty())
    }

    pub fn others_between(&self, iidx: InstIdx) -> FxHashSet<InstIdx> {
        let node = &self.node_to_ml[&iidx];
        let mut others_between = self.topo[&iidx].clone();
        for above in &node.tree_above {
            for above_all in &self.topo[above] {
                others_between.remove(above_all);
            }
        }
        assert!(others_between.contains(&iidx));
        others_between
    }

    pub fn ml_graphs(&self, parser: &mut Z3Parser) -> Vec<Graph<MLGraphNode, MLGraphEdge>> {
        self.leaves()
            .map(|(_sig, leaves)| {
                let mut graph = Graph::with_capacity(0, 0);

                let iidx = leaves[0].1;
                let leaf = &self.node_to_ml[&iidx];
                let others_between = self.others_between(iidx);
                let insts_map: FxHashMap<_, _> = others_between
                    .into_iter()
                    .map(|iidx| (iidx, self.add_inst(parser, &mut graph, iidx)))
                    .collect();
                let root = insts_map[&iidx].0;

                for (iidx, idata) in insts_map.iter() {
                    self.add_dependencies(&*parser, &mut graph, *iidx, idata, |get_iidx| {
                        if leaf.tree_above.contains(&get_iidx) {
                            Some((root, true))
                        } else {
                            insts_map.get(&get_iidx).map(|(node, _)| (*node, false))
                        }
                    });
                }

                graph
            })
            .collect()
    }

    fn add_inst(
        &self,
        parser: &mut Z3Parser,
        graph: &mut Graph<MLGraphNode, MLGraphEdge>,
        iidx: InstIdx,
    ) -> InstGraphNodes {
        let inst = &self.node_to_ml[&iidx];
        let sig = self.ml_leaves[inst.ml_sig].0.clone();
        let gen_pat = parser
            .synth_terms
            .generalise_pattern(&parser.terms, sig.pattern)
            .unwrap();
        let node = MLGraphNode::QI(sig, gen_pat);
        let node = graph.add_node(node);
        let generalisation = inst
            .generalisation
            .iter()
            .map(|gen| {
                let enode = graph.add_node(MLGraphNode::ENode(gen.enode));
                let mut last_node = enode;
                let equalities: Vec<_> = gen
                    .equalities
                    .iter()
                    .map(|&(from, to)| {
                        let equality = graph.add_node(MLGraphNode::Equality(from, to));
                        graph.add_edge(last_node, equality, MLGraphEdge::BlameRewrite);
                        last_node = equality;
                        equality
                    })
                    .collect();
                graph.add_edge(last_node, node, MLGraphEdge::Blame);
                (enode, equalities)
            })
            .collect();
        (node, generalisation)
    }

    fn add_dependencies(
        &self,
        parser: &Z3Parser,
        graph: &mut Graph<MLGraphNode, MLGraphEdge>,
        iidx: InstIdx,
        idata: &InstGraphNodes,
        insts_map: impl Fn(InstIdx) -> Option<(NodeIndex, bool)>,
    ) {
        let inst = &parser[iidx];
        let match_ = &parser[inst.match_];
        for (i, tm) in match_.trigger_matches().enumerate() {
            let curr_idata = &idata.1[i];

            let tm_enode = tm.enode();
            let blame = &parser[tm_enode];
            if let Some(created_by) = blame.created_by {
                if let Some((created_by, rec)) = insts_map(created_by) {
                    graph.add_edge(created_by, curr_idata.0, MLGraphEdge::Yield(rec));
                }
            }

            for (i, eq) in tm
                .equalities()
                .filter(|&eq| parser[eq].given_len > 0)
                .enumerate()
            {
                parser.egraph.walk_trans(eq, |given, _| {
                    let EqualityExpl::Literal { eq, .. } = &parser[given] else {
                        return;
                    };
                    let eq = &parser[*eq];
                    if let Some((created_by, rec)) = eq.created_by.and_then(&insts_map) {
                        graph.add_edge(created_by, curr_idata.1[i], MLGraphEdge::YieldEq(rec));
                    }
                    // else {
                    //     let fixed = graph.add_node(MLGraphNode::FixedEquality(eq.owner));
                    //     graph.add_edge(fixed, curr_idata.1[i], MLGraphEdge::FixedEquality);
                    // }
                });
            }
        }
    }
}

pub struct MlAnalysis<'a> {
    pub parser: &'a mut Z3Parser,
    pub data: Vec<MlSignature>,
    pub node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
}

impl<'a> MlAnalysis<'a> {
    pub fn new(
        parser: &'a mut Z3Parser,
        signatures: Vec<(MlSignature, FxHashSet<InstIdx>)>,
    ) -> Self {
        let mut node_to_ml = FxHashMap::<InstIdx, MlNodeInfo>::default();
        let data = signatures
            .into_iter()
            .enumerate()
            .map(|(i, (sig, iidxs))| {
                node_to_ml.extend(
                    iidxs
                        .into_iter()
                        .map(|iidx| (iidx, MlNodeInfo::new(parser, iidx, i))),
                );
                sig
            })
            .collect();
        Self {
            parser,
            data,
            node_to_ml,
        }
    }

    /// Per each quantifier, finds the nodes that are part paths of length at
    /// least `MIN_MATCHING_LOOP_LENGTH`. Additionally, returns a list of the
    /// endpoints of these paths.
    pub fn finalise(
        self,
        topo: FxHashMap<InstIdx, FxHashSet<InstIdx>>,
        min_depth: u32,
    ) -> MlOutput {
        let mut ml_leaves: MlEndNodes =
            self.data.into_iter().map(|sig| (sig, Vec::new())).collect();
        let mut ml_nodes = FxHashSet::default();
        for (iidx, data) in self.node_to_ml.iter() {
            if !data.is_root || data.max_depth < min_depth {
                continue;
            }
            ml_nodes.insert(*iidx);
            Self::walk_tree(&self.node_to_ml, data, &mut ml_nodes);
            ml_leaves[data.ml_sig].1.push((data.max_depth, *iidx));
        }
        for (_, ml_end_nodes) in &mut ml_leaves {
            ml_end_nodes.sort_unstable_by_key(|(len, idx)| (u32::MAX - *len, *idx));
        }
        MlOutput {
            ml_leaves,
            ml_nodes,
            node_to_ml: self.node_to_ml,
            topo,
        }
    }

    pub fn walk_tree(
        node_to_ml: &FxHashMap<InstIdx, MlNodeInfo>,
        data: &MlNodeInfo,
        ml_nodes: &mut FxHashSet<InstIdx>,
    ) {
        for &reachable in &data.tree_above {
            if ml_nodes.insert(reachable) {
                let data = &node_to_ml[&reachable];
                Self::walk_tree(node_to_ml, data, ml_nodes);
            }
        }
    }
}

#[derive(Debug)]
pub struct MlNodeInfo {
    pub is_root: bool,
    pub ml_sig: usize,
    pub ast_size: u32,
    pub tree_above: FxHashSet<InstIdx>,
    pub max_depth: u32,
    pub generalisation: Vec<GeneralisedBlame>,
}

#[derive(Debug)]
pub struct GeneralisedBlame {
    pub enode: SynthIdx,
    pub equalities: Vec<(SynthIdx, SynthIdx)>,
}

impl GeneralisedBlame {
    pub fn new(parser: &Z3Parser, blame: Blame<'_>) -> Self {
        let enode = parser[blame.enode()].owner.into();
        let equalities = blame
            .equalities()
            .filter_map(|eidx| {
                let eq = &parser[eidx];
                (eq.given_len != 0).then(|| {
                    let from = parser.egraph.equalities.from(eidx);
                    let from = parser[from].owner.into();
                    let to = parser[eq.to].owner.into();
                    (from, to)
                })
            })
            .collect();
        Self { enode, equalities }
    }

    pub fn generalise(&mut self, other: &Self, parser: &mut Z3Parser) {
        self.enode = parser
            .synth_terms
            .generalise(&parser.terms, vec![self.enode, other.enode])
            .unwrap();
        assert_eq!(self.equalities.len(), other.equalities.len());
        for (self_eq, other_eq) in self.equalities.iter_mut().zip(other.equalities.iter()) {
            self_eq.0 = parser
                .synth_terms
                .generalise(&parser.terms, vec![self_eq.0, other_eq.0])
                .unwrap();
            self_eq.1 = parser
                .synth_terms
                .generalise(&parser.terms, vec![self_eq.1, other_eq.1])
                .unwrap();
        }
    }
}

impl MlNodeInfo {
    pub fn new(parser: &Z3Parser, iidx: InstIdx, ml_sig: usize) -> Self {
        let generalisation = parser[parser[iidx].match_].trigger_matches();
        let generalisation = generalisation
            .map(|blame| GeneralisedBlame::new(parser, blame))
            .collect();
        Self {
            is_root: true,
            ml_sig,
            ast_size: parser.inst_ast_size(iidx),
            tree_above: FxHashSet::default(),
            max_depth: 0,
            generalisation,
        }
    }
}

impl TopoAnalysis<true, false> for MlAnalysis<'_> {
    type Value = FxHashSet<InstIdx>;

    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        graph: &'a InstGraph,
        idx: RawNodeIndex,
        _node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n,
    {
        let mut self_info = FxHashSet::default();
        for (_, info) in from_all() {
            self_info.extend(info.iter().copied());
        }

        let Some(iidx) = graph.raw[idx].kind().inst() else {
            return self_info;
        };
        let Some(mut curr_info) = self.node_to_ml.remove(&iidx) else {
            return self_info;
        };

        self_info.retain(|&prev_iidx| {
            let prev_info = self.node_to_ml.get_mut(&prev_iidx).unwrap();
            if prev_info.ml_sig == curr_info.ml_sig && prev_info.ast_size <= curr_info.ast_size {
                prev_info.is_root = false;
                curr_info.max_depth = curr_info.max_depth.max(prev_info.max_depth + 1);
                curr_info.tree_above.insert(prev_iidx);
                let gen = curr_info
                    .generalisation
                    .iter_mut()
                    .zip(prev_info.generalisation.iter());
                for (curr_gen, prev_gen) in gen {
                    curr_gen.generalise(prev_gen, self.parser);
                }
                false
            } else {
                true
            }
        });

        self.node_to_ml.insert(iidx, curr_info);
        self_info.insert(iidx);
        self_info
    }
}
