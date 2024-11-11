use fxhash::FxHashSet;

use crate::{
    analysis::{
        analysis::{MlEndNodes, TopoAnalysis},
        raw::Node,
        InstGraph, RawNodeIndex,
    },
    items::{Blame, InstIdx, TermIdx},
    parsers::z3::synthetic::SynthIdx,
    FxHashMap, Z3Parser,
};

use super::{MlExplanation, MlSignature};

pub struct MlOutput {
    pub(super) ml_leaves: MlEndNodes,
    pub ml_nodes: FxHashSet<InstIdx>,
    pub(super) node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
    topo: FxHashMap<InstIdx, FxHashSet<InstIdx>>,
}

impl MlOutput {
    pub fn leaves(&self) -> impl Iterator<Item = &(MlSignature, Vec<(u32, InstIdx)>)> + '_ {
        self.ml_leaves
            .iter()
            .filter(|(_, leaves)| !leaves.is_empty())
    }

    pub fn others_between(&self, iidx: InstIdx) -> FxHashSet<InstIdx> {
        let node = &self.node_to_ml[&iidx];
        let mut others_between = self.topo[&iidx].clone();
        for above in node.tree_above() {
            for above_all in &self.topo[&above] {
                others_between.remove(above_all);
            }
        }
        assert!(others_between.contains(&iidx));
        others_between
    }

    pub fn ml_graphs(&self, parser: &mut Z3Parser) -> Vec<MlExplanation> {
        self.leaves()
            .map(|(_sig, leaves)| {
                let iidx = leaves[0].1;

                let mut expl = MlExplanation::new();
                expl.explain_leaf(self, parser, iidx);
                expl
            })
            .collect()
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
        let mut stack = vec![data];
        while let Some(data) = stack.pop() {
            for reachable in data.tree_above() {
                if ml_nodes.insert(reachable) {
                    let data = &node_to_ml[&reachable];
                    stack.push(data);
                }
            }
        }
    }
}

#[derive(Debug)]
pub struct MlNodeInfo {
    pub is_root: bool,
    pub ml_sig: usize,
    pub ast_size: u32,
    pub tree_above: Vec<InstIdx>,
    pub max_depth: u32,
    pub generalisation: Vec<GeneralisedBlame<SynthIdx>>,
}

#[derive(Debug)]
pub struct GeneralisedBlame<Idx> {
    pub enode: Idx,
    pub equalities: Vec<(Idx, Idx)>,
}

impl<T: From<TermIdx>> GeneralisedBlame<T> {
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
}
impl GeneralisedBlame<SynthIdx> {
    pub fn generalise(&self, curr: GeneralisedBlame<TermIdx>, parser: &mut Z3Parser) -> Self {
        let enode = parser
            .synth_terms
            .generalise(&parser.terms, self.enode, curr.enode)
            .unwrap();
        assert_eq!(self.equalities.len(), curr.equalities.len());
        let equalities = self
            .equalities
            .iter()
            .zip(curr.equalities.iter())
            .map(|(self_eq, other_eq)| {
                let from = parser
                    .synth_terms
                    .generalise(&parser.terms, self_eq.0, other_eq.0)
                    .unwrap();
                let to = parser
                    .synth_terms
                    .generalise(&parser.terms, self_eq.1, other_eq.1)
                    .unwrap();
                (from, to)
            })
            .collect();
        Self { enode, equalities }
    }
}

impl MlNodeInfo {
    pub fn generalisation<T: From<TermIdx>>(
        parser: &Z3Parser,
        iidx: InstIdx,
    ) -> impl Iterator<Item = GeneralisedBlame<T>> + '_ {
        let generalisation = parser[parser[iidx].match_].trigger_matches();
        generalisation.map(|blame| GeneralisedBlame::new(parser, blame))
    }

    pub fn new(parser: &Z3Parser, iidx: InstIdx, ml_sig: usize) -> Self {
        Self {
            is_root: true,
            ml_sig,
            ast_size: parser.inst_ast_size(iidx),
            tree_above: Default::default(),
            max_depth: 0,
            generalisation: Vec::new(),
        }
    }

    pub fn tree_above(&self) -> impl Iterator<Item = InstIdx> + '_ {
        // TODO: handle when `tree_above.len() > 1`
        self.tree_above.first().copied().into_iter()
    }
    pub fn tree_above_contains(&self, iidx: InstIdx) -> bool {
        self.tree_above().any(|i| i == iidx)
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
                curr_info.tree_above.push(prev_iidx);
                false
            } else {
                true
            }
        });

        curr_info
            .tree_above
            .sort_unstable_by_key(|&pidx| (u32::MAX - self.node_to_ml[&pidx].max_depth, pidx));
        let generalisation = if let Some(pidx) = curr_info.tree_above().next() {
            let gen: Vec<_> = MlNodeInfo::generalisation(self.parser, iidx).collect();
            self.node_to_ml[&pidx]
                .generalisation
                .iter()
                .zip(gen)
                .map(|(prev_gen, curr_gen)| prev_gen.generalise(curr_gen, self.parser))
                .collect()
        } else {
            MlNodeInfo::generalisation(self.parser, iidx).collect()
        };
        curr_info.generalisation = generalisation;

        self.node_to_ml.insert(iidx, curr_info);
        self_info.insert(iidx);
        self_info
    }
}
