#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use fxhash::FxHashSet;

use crate::{
    analysis::{analysis::TopoAnalysis, raw::Node, InstGraph, RawNodeIndex},
    idx,
    items::{Blame, ENodeIdx, EqTransIdx, InstIdx, TermIdx},
    parsers::z3::synthetic::SynthIdx,
    FxHashMap, TiVec, Z3Parser,
};

use super::{explain::MlExplainer, MatchingLoop, MlData, MlSigCollection, MlSigIdx, MlSignature};

idx!(GenIdx, "${}");

pub struct MlOutput {
    pub(super) signatures: TiVec<MlSigIdx, MlSignature>,
    ml_leaves: TiVec<MlSigIdx, MlSigCollection>,
    pub(super) node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
    pub(super) gens: TiVec<GenIdx, Box<[GeneralisedBlame]>>,
    topo: FxHashMap<InstIdx, MlAnalysisInfo>,
}

impl MlOutput {
    pub fn others_between(&self, ancestor: InstIdx, descendant: InstIdx) -> FxHashSet<InstIdx> {
        let mut others_between = self.topo[&descendant].ancestors.clone();
        for above_all in &self.topo[&ancestor].ancestors {
            others_between.remove(above_all);
        }
        assert!(others_between.contains(&descendant));
        others_between
    }

    pub fn ml_graphs(mut self, parser: &mut Z3Parser) -> MlData {
        let mut matching_loops = Vec::new();
        let ml_leaves = core::mem::take(&mut self.ml_leaves);
        for (sig, sig_col) in ml_leaves.into_iter_enumerated() {
            for (gen, leaves) in sig_col.gens {
                let (_, longest_leaf) = leaves.0[0];
                let members = self.node_to_ml[&longest_leaf]
                    .walk_gen(&self.node_to_ml, gen)
                    .map(|info| info.prev);
                let members = [longest_leaf].into_iter().chain(members).collect();
                let expl = MlExplainer::new();
                let graph = expl.explain_leaf(&self, parser, longest_leaf, gen);
                matching_loops.push(MatchingLoop {
                    sig,
                    leaves,
                    members,
                    graph: Some((gen, graph)),
                });
            }
            if !sig_col.ungens.0.is_empty() {
                let (_, longest_leaf) = sig_col.ungens.0[0];
                let members = self.node_to_ml[&longest_leaf]
                    .walk_un_gen(&self.node_to_ml)
                    .map(|info| info.prev);
                let members = [longest_leaf].into_iter().chain(members).collect();
                matching_loops.push(MatchingLoop {
                    sig,
                    leaves: sig_col.ungens,
                    members,
                    graph: None,
                });
            }
        }
        MlData {
            signatures: self.signatures,
            matching_loops,
        }
    }
}

pub struct MlAnalysis<'a> {
    inner: MlAnalysisInner<'a>,
    data: TiVec<MlSigIdx, MlSignature>,
    node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
}

struct MlAnalysisInner<'a> {
    pub parser: &'a mut Z3Parser,
    pub generalisations: FxHashMap<Box<[GeneralisedBlame]>, GenIdx>,
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
                let i = MlSigIdx::from(i);
                node_to_ml.extend(
                    iidxs
                        .into_iter()
                        .map(|iidx| (iidx, MlNodeInfo::new(parser, iidx, i))),
                );
                sig
            })
            .collect();
        Self {
            data,
            node_to_ml,
            inner: MlAnalysisInner {
                parser,
                generalisations: FxHashMap::default(),
            },
        }
    }

    /// Per each quantifier, finds the nodes that are part paths of length at
    /// least `MIN_MATCHING_LOOP_LENGTH`. Additionally, returns a list of the
    /// endpoints of these paths.
    pub fn finalise(self, topo: FxHashMap<InstIdx, MlAnalysisInfo>, min_depth: u32) -> MlOutput {
        let mut ml_leaves: TiVec<MlSigIdx, MlSigCollection> = self
            .data
            .iter()
            .map(|sig| MlSigCollection {
                sig: sig.clone(),
                gens: Default::default(),
                ungens: Default::default(),
            })
            .collect();

        let mut all_gens: Vec<_> = self
            .inner
            .generalisations
            .into_iter()
            .map(|(gen, idx)| (idx, gen))
            .collect();
        all_gens.sort_by_key(|(idx, _)| *idx);
        debug_assert!(all_gens
            .iter()
            .enumerate()
            .all(|(i, (idx, _))| usize::from(*idx) == i));
        let gens: TiVec<GenIdx, _> = all_gens.into_iter().map(|(_, gen)| gen).collect();

        for (iidx, data) in self.node_to_ml.iter() {
            let mut root_above = data.root_above(min_depth);
            let Some(above) = root_above.next() else {
                continue;
            };

            let (gen_above, ungen_above) = if above.max_depth > 0 {
                (
                    Some(above),
                    root_above.find(|above| above.max_ungen_depth > 0),
                )
            } else {
                (None, Some(above))
            };

            let leaf = &mut ml_leaves[data.ml_sig];

            if let Some(gen_above) = gen_above {
                assert!(gen_above.max_depth > 0);
                let ga = gen_above.gen.unwrap();

                let idx = leaf
                    .gens
                    .iter()
                    .position(|(gen, _)| *gen == ga)
                    .unwrap_or_else(|| {
                        leaf.gens.push((ga, Default::default()));
                        leaf.gens.len() - 1
                    });
                leaf.gens[idx].1 .0.push((gen_above.max_depth, *iidx));
            }

            if let Some(ungen_above) = ungen_above {
                leaf.ungens.0.push((ungen_above.max_ungen_depth, *iidx));
            }
        }
        for sig_col in ml_leaves.iter_mut() {
            for gen in &mut sig_col.gens {
                gen.1
                     .0
                    .sort_unstable_by_key(|(len, idx)| (u32::MAX - *len, *idx));
            }
            sig_col
                .gens
                .sort_unstable_by_key(|(gen, leaves)| (u32::MAX - leaves.0[0].0, *gen));

            sig_col
                .ungens
                .0
                .sort_unstable_by_key(|(len, idx)| (u32::MAX - *len, *idx));
        }
        MlOutput {
            signatures: self.data,
            ml_leaves,
            node_to_ml: self.node_to_ml,
            gens,
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
    pub ml_sig: MlSigIdx,
    pub ast_size: u32,
    pub blames: Box<[CollectedBlame]>,

    pub tree_above: Vec<MlLinkInfo>,
}

#[derive(Debug, Clone, Copy)]
pub struct MlLinkInfo {
    pub prev: InstIdx,
    pub max_depth: u32,
    pub max_ungen_depth: u32,
    pub gen: Option<GenIdx>,
    pub is_leaf: MlLinkLeaf,
}

#[derive(Debug, Clone, Copy)]
pub enum MlLinkLeaf {
    /// No descendant nodes with the same fingerprint.
    FullLeaf,
    /// Some descendant nodes with the same fingerprint but none with the same
    /// generalisation.
    UnGenLeaf,
    /// Some descendant nodes with the same fingerprint and at least one with
    /// the same generalisation.
    NonLeaf,
}

#[derive(Debug)]
pub struct CollectedBlame {
    pub enode: ENodeIdx,
    pub owner: TermIdx,
    pub equalities: Box<[(EqTransIdx, TermIdx, TermIdx)]>,
}

impl CollectedBlame {
    pub fn new(parser: &Z3Parser, blame: Blame<'_>) -> Self {
        let enode = blame.enode();
        let owner = parser[enode].owner;
        let equalities = blame
            .equalities()
            .filter_map(|eidx| {
                let eq = &parser[eidx];
                (eq.given_len != 0).then(|| {
                    let from = parser.egraph.equalities.from(eidx);
                    let from = parser[from].owner;
                    let to = parser[eq.to].owner;
                    (eidx, from, to)
                })
            })
            .collect();
        Self {
            enode,
            owner,
            equalities,
        }
    }
}

#[derive(Debug, PartialEq, Eq, Hash)]
pub struct GeneralisedBlame {
    pub enode: SynthIdx,
    pub equalities: Box<[(SynthIdx, SynthIdx)]>,
}

impl MlAnalysisInner<'_> {
    fn generalise(
        &mut self,
        smaller: &[CollectedBlame],
        larger: &[CollectedBlame],
    ) -> Option<GenIdx> {
        assert_eq!(smaller.len(), larger.len());
        let gen = smaller
            .iter()
            .zip(larger.iter())
            .map(|(smaller, larger)| {
                let enode = self
                    .parser
                    .synth_terms
                    .generalise_first(&self.parser.terms, smaller.owner, larger.owner)
                    .unwrap()?;
                assert_eq!(smaller.equalities.len(), larger.equalities.len());
                let equalities = smaller
                    .equalities
                    .iter()
                    .zip(larger.equalities.iter())
                    .map(|(self_eq, other_eq)| {
                        let from = self
                            .parser
                            .synth_terms
                            .generalise_first(&self.parser.terms, self_eq.1, other_eq.1)
                            .unwrap()?;
                        let to = self
                            .parser
                            .synth_terms
                            .generalise_first(&self.parser.terms, self_eq.2, other_eq.2)
                            .unwrap()?;
                        Some((from, to))
                    })
                    .collect::<Option<_>>()?;
                Some(GeneralisedBlame { enode, equalities })
            })
            .collect::<Option<_>>()?;
        // let is_empty = gen.iter().all(|gen| gen.is_empty(self.parser));

        let gen_idx = GenIdx::from(self.generalisations.len());
        Some(*self.generalisations.entry(gen).or_insert(gen_idx))
    }
}

impl MlNodeInfo {
    pub fn blames(parser: &Z3Parser, iidx: InstIdx) -> impl Iterator<Item = CollectedBlame> + '_ {
        let blames = parser[parser[iidx].match_].trigger_matches();
        blames.map(|blame| CollectedBlame::new(parser, blame))
    }

    pub fn new(parser: &Z3Parser, iidx: InstIdx, ml_sig: MlSigIdx) -> Self {
        Self {
            ml_sig,
            ast_size: parser.inst_ast_size(iidx),
            tree_above: Default::default(),
            blames: Self::blames(parser, iidx).collect(),
        }
    }

    pub fn root_above(&self, min_depth: u32) -> impl Iterator<Item = &MlLinkInfo> + '_ {
        self.tree_above
            .iter()
            .filter(move |above| match above.is_leaf {
                MlLinkLeaf::FullLeaf => {
                    above.max_depth >= min_depth || above.max_ungen_depth >= min_depth
                }
                MlLinkLeaf::UnGenLeaf => above.max_depth >= min_depth,
                MlLinkLeaf::NonLeaf => false,
            })
    }

    /// TODO: handle when `tree_above.len() > 1`
    pub fn tree_above(&self) -> impl Iterator<Item = InstIdx> + '_ {
        self.tree_above.iter().map(|above| above.prev)
    }
    pub fn tree_above_contains(&self, iidx: InstIdx) -> bool {
        self.tree_above().any(|i| i == iidx)
    }

    pub fn gen_above(&self) -> impl Iterator<Item = &MlLinkInfo> + '_ {
        self.tree_above
            .iter()
            .take_while(|above| above.max_depth > 0)
    }

    pub fn walk_un_gen<'a>(
        &'a self,
        map: &'a FxHashMap<InstIdx, MlNodeInfo>,
    ) -> impl Iterator<Item = &'a MlLinkInfo> + 'a {
        let mut next = self.tree_above.iter().find(|above| above.max_depth == 0);
        core::iter::from_fn(move || {
            let above = next?;
            next = map[&above.prev]
                .tree_above
                .iter()
                .find(|above| above.max_depth == 0);
            debug_assert!(
                above.max_ungen_depth == 0
                    || next.is_some_and(|next| above.max_ungen_depth == next.max_ungen_depth + 1)
            );
            Some(above)
        })
    }

    /// Walks a ML up along a `GenIdx`. The path should be as long as
    /// `self.max_depth + 1`.
    pub fn walk_gen<'a>(
        &'a self,
        map: &'a FxHashMap<InstIdx, MlNodeInfo>,
        gen: GenIdx,
    ) -> impl Iterator<Item = &'a MlLinkInfo> + 'a {
        let mut next = self
            .tree_above
            .iter()
            .find(|above| above.gen.is_some_and(|ag| ag == gen));
        core::iter::from_fn(move || {
            let above = next?;
            next = map[&above.prev]
                .tree_above
                .iter()
                .find(|above| above.gen.is_some_and(|ag| ag == gen));
            debug_assert!(
                above.max_depth == 0
                    || next.is_some_and(|next| above.max_depth == next.max_depth + 1),
                "above: {above:?}, next: {next:?}"
            );
            Some(above)
        })
    }
}

#[derive(Debug, Default, Clone)]
pub struct MlAnalysisInfo {
    ancestors: FxHashSet<InstIdx>,
    banned: FxHashSet<InstIdx>,
}

impl MlAnalysisInfo {
    fn extend(&mut self, incoming: &Self) {
        for banned in &incoming.banned {
            self.ancestors.remove(banned);
        }
        self.ancestors.extend(
            incoming
                .ancestors
                .iter()
                .copied()
                .filter(|iidx| !self.banned.contains(iidx)),
        );
        self.banned.extend(incoming.banned.iter().copied());
    }

    fn filter(&mut self, mut predicate: impl FnMut(InstIdx) -> bool) {
        self.ancestors.retain(|&iidx| {
            if predicate(iidx) {
                true
            } else {
                self.banned.insert(iidx);
                false
            }
        });
    }

    fn insert(&mut self, iidx: InstIdx) {
        self.ancestors.insert(iidx);
    }
}

impl TopoAnalysis<true, false> for MlAnalysis<'_> {
    type Value = MlAnalysisInfo;

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
        let mut curr = MlAnalysisInfo::default();
        for (_, info) in from_all() {
            curr.extend(info);
        }

        let Some(iidx) = graph.raw[idx].kind().inst() else {
            return curr;
        };
        let Some(mut curr_info) = self.node_to_ml.remove(&iidx) else {
            return curr;
        };

        curr.filter(|prev_iidx| {
            let prev_info = self.node_to_ml.get_mut(&prev_iidx).unwrap();
            if prev_info.ml_sig == curr_info.ml_sig && prev_info.ast_size <= curr_info.ast_size {
                let gen = self.inner.generalise(&prev_info.blames, &curr_info.blames);

                let mut max_ungen_depth = 0;
                let mut max_depth = 0;
                for above in &mut prev_info.tree_above {
                    max_ungen_depth = max_ungen_depth.max(above.max_ungen_depth + 1);

                    if gen.is_some_and(|gen| above.gen == Some(gen)) {
                        above.is_leaf = MlLinkLeaf::NonLeaf;
                        max_depth = max_depth.max(above.max_depth + 1);
                    } else if matches!(above.is_leaf, MlLinkLeaf::FullLeaf) {
                        above.is_leaf = MlLinkLeaf::UnGenLeaf;
                    }
                }
                if max_depth > 0 {
                    max_ungen_depth = 0;
                }

                let link = MlLinkInfo {
                    prev: prev_iidx,
                    gen,
                    max_depth,
                    max_ungen_depth,
                    is_leaf: MlLinkLeaf::FullLeaf,
                };
                curr_info.tree_above.push(link);
                false
            } else {
                true
            }
        });

        curr_info.tree_above.sort_unstable_by_key(|&pidx| {
            (
                u32::MAX - pidx.max_depth,
                u32::MAX - pidx.max_ungen_depth,
                pidx.prev,
            )
        });

        self.node_to_ml.insert(iidx, curr_info);
        curr.insert(iidx);
        curr
    }
}
