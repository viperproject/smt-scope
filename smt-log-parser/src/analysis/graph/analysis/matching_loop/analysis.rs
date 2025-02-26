use std::cmp::Reverse;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use nonmax::NonMaxU64;

use crate::{
    analysis::{analysis::run::TopoAnalysis, raw::Node, InstGraph, RawNodeIndex},
    idx,
    items::{Blame, ENodeIdx, EqTransIdx, InstIdx, TermIdx},
    mem_dbg::InternMap,
    parsers::z3::{synthetic::SynthIdx, AstSize},
    FxHashMap, FxHashSet, TiVec, Z3Parser,
};

use super::{
    explain::MlExplainer, MatchingLoop, MlData, MlGraph, MlSigCollection, MlSigIdx, MlSignature,
};

idx!(GenIdx, "${}");

pub struct MlOutput {
    pub(super) signatures: TiVec<MlSigIdx, MlSignature>,
    ml_leaves: TiVec<MlSigIdx, MlSigCollection>,
    pub(super) node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
    pub(super) gens: TiVec<GenIdx, Box<[GeneralisedBlame]>>,
    pub(super) topo: FxHashMap<InstIdx, MlAnalysisInfo>,
}

impl MlOutput {
    pub fn others_between(
        topo: &FxHashMap<InstIdx, MlAnalysisInfo>,
        ancestor: InstIdx,
        descendant: InstIdx,
    ) -> FxHashSet<InstIdx> {
        let mut others_between = topo[&descendant].ancestors.clone();
        for above_all in topo[&ancestor].ancestors.iter() {
            others_between.remove(above_all);
        }
        assert!(others_between.contains(&descendant));
        others_between
    }

    pub fn ml_graphs(mut self, parser: &mut Z3Parser) -> MlData {
        let (mut sure_mls, mut maybe_mls) = (0, 0);
        let mut matching_loops = Vec::new();
        let ml_leaves = core::mem::take(&mut self.ml_leaves);
        for (sig, sig_col) in ml_leaves.into_iter_enumerated() {
            for (gen, leaves) in sig_col.gens {
                let (_, longest_leaf) = leaves.0[0];
                let members = self.node_to_ml[&longest_leaf]
                    .walk_gen(&self.node_to_ml, gen)
                    .map(|info| info.prev);
                let members = [longest_leaf].into_iter().chain(members).collect();
                let mut expl = MlExplainer::new();
                let error = expl.explain_leaf(&self, parser, longest_leaf, gen);
                let data = expl.simplify_terms(parser).unwrap();
                let graph = MlGraph {
                    gen,
                    graph_incomplete: error,
                    data,
                };
                matching_loops.push(MatchingLoop {
                    sig,
                    leaves,
                    members,
                    graph: Some(graph),
                });
                sure_mls += 1;
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
                maybe_mls += 1;
            }
        }
        matching_loops.sort_unstable_by_key(|ml| {
            let (len, leaf) = ml.leaves.0[0];
            let has_complete_graph = ml.graph.as_ref().is_some_and(|g| !g.graph_incomplete);
            (
                Reverse(has_complete_graph),
                ml.graph.is_none(),
                Reverse(len),
                leaf,
            )
        });
        MlData {
            signatures: self.signatures,
            per_inst: self.topo,
            matching_loops,
            sure_mls,
            maybe_mls,
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
    pub generalisations: InternMap<GenIdx, [GeneralisedBlame]>,
}

impl<'a> MlAnalysis<'a> {
    pub fn new(
        parser: &'a mut Z3Parser,
        signatures: Vec<(MlSignature, FxHashSet<InstIdx>)>,
    ) -> Self {
        let mut cached = FxHashMap::default();
        let mut node_to_ml = FxHashMap::<InstIdx, MlNodeInfo>::default();
        let data = signatures
            .into_iter()
            .enumerate()
            .map(|(i, (sig, iidxs))| {
                let i = MlSigIdx::from(i);
                node_to_ml.extend(
                    iidxs
                        .into_iter()
                        .map(|iidx| (iidx, MlNodeInfo::new(parser, iidx, i, &mut cached))),
                );
                sig
            })
            .collect();
        Self {
            data,
            node_to_ml,
            inner: MlAnalysisInner {
                parser,
                generalisations: Default::default(),
            },
        }
    }

    /// Per each quantifier, finds the nodes that are part paths of length at
    /// least `MIN_MATCHING_LOOP_LENGTH`. Additionally, returns a list of the
    /// endpoints of these paths.
    pub fn finalise(
        self,
        topo: FxHashMap<InstIdx, MlAnalysisInfo>,
        min_ml: u32,
        min_sc: u32,
    ) -> MlOutput {
        let mut ml_leaves: TiVec<MlSigIdx, MlSigCollection> = self
            .data
            .iter()
            .map(|sig| MlSigCollection {
                sig: sig.clone(),
                gens: Default::default(),
                ungens: Default::default(),
            })
            .collect();

        let gens = self.inner.generalisations.finish();

        for (iidx, data) in self.node_to_ml.iter() {
            let mut root_above = data.root_above(min_ml, min_sc);
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
                    .sort_unstable_by_key(|(len, idx)| (Reverse(*len), *idx));
            }
            sig_col
                .gens
                .sort_unstable_by_key(|(gen, leaves)| (Reverse(leaves.0[0].0), *gen));

            sig_col
                .ungens
                .0
                .sort_unstable_by_key(|(len, idx)| (Reverse(*len), *idx));
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
    pub ast_size: Option<NonMaxU64>,
    pub blames: Box<[CollectedBlame]>,

    pub tree_above: Vec<MlLinkInfo>,
}

#[derive(Debug, Clone, Copy)]
pub struct MlLinkInfo {
    pub prev: InstIdx,
    pub max_depth: u32,
    pub max_ungen_depth: u32,
    pub gen: Option<GenIdx>,
    pub parent: Option<u32>,
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
    pub fn new(parser: &Z3Parser, blame: &Blame) -> Self {
        let enode = blame.enode;
        let owner = parser[enode].owner;
        let equalities = blame
            .equalities
            .iter()
            .map(|&eidx| {
                let (from, to) = parser.from_to(eidx);
                let from = parser[from].owner;
                let to = parser[to].owner;
                (eidx, from, to)
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
                // println!(
                //     "\nsmaller: {:?}\nlarger : {:?}",
                //     smaller.owner.debug(self.parser),
                //     larger.owner.debug(self.parser)
                // );
                let enode = self
                    .parser
                    .synth_terms
                    .generalise_first(&self.parser.terms, smaller.owner, larger.owner, 20)
                    .unwrap()?;
                // println!("result  : {:?}", enode.debug(self.parser));
                assert_eq!(smaller.equalities.len(), larger.equalities.len());
                let equalities = smaller
                    .equalities
                    .iter()
                    .zip(larger.equalities.iter())
                    .map(|(self_eq, other_eq)| {
                        // println!(
                        //     "\nsmaller 1: {:?}\nlarger 1 : {:?}",
                        //     self_eq.1.debug(self.parser),
                        //     other_eq.1.debug(self.parser)
                        // );
                        let from = self
                            .parser
                            .synth_terms
                            .generalise_first(&self.parser.terms, self_eq.1, other_eq.1, 20)
                            .unwrap()?;
                        // println!("result   : {:?}", from.debug(self.parser));
                        // println!(
                        //     "\nsmaller 2: {:?}\nlarger 2 : {:?}",
                        //     self_eq.2.debug(self.parser),
                        //     other_eq.2.debug(self.parser)
                        // );
                        let to = self
                            .parser
                            .synth_terms
                            .generalise_first(&self.parser.terms, self_eq.2, other_eq.2, 20)
                            .unwrap()?;
                        // println!("result   : {:?}", to.debug(self.parser));
                        Some((from, to))
                    })
                    .collect::<Option<_>>()?;
                Some(GeneralisedBlame { enode, equalities })
            })
            .collect::<Option<_>>()?;
        // let is_empty = gen.iter().all(|gen| gen.is_empty(self.parser));

        Some(self.generalisations.intern(gen))
    }

    fn generalise_second(
        &mut self,
        smaller: &[CollectedBlame],
        larger: &[CollectedBlame],
        gen: GenIdx,
    ) -> Option<GenIdx> {
        assert_eq!(smaller.len(), larger.len());
        let gen = &self.generalisations[gen];
        assert_eq!(gen.len(), smaller.len());
        assert_eq!(gen.len(), larger.len());

        let smaller_larger = smaller.iter().zip(larger.iter());
        let gen = gen
            .iter()
            .zip(smaller_larger)
            .map(|(gen, (smaller, larger))| {
                // println!(
                //     "\nsmaller: {:?}\nlarger : {:?}",
                //     smaller.owner.debug(self.parser),
                //     larger.owner.debug(self.parser)
                // );
                let enode = self
                    .parser
                    .synth_terms
                    .generalise_second(&self.parser.terms, smaller.owner, larger.owner, gen.enode)
                    .unwrap()?;
                // println!("result  : {:?}", enode.debug(self.parser));
                assert_eq!(smaller.equalities.len(), larger.equalities.len());
                let smaller_larger = smaller.equalities.iter().zip(larger.equalities.iter());
                let equalities = gen
                    .equalities
                    .iter()
                    .zip(smaller_larger)
                    .map(|(gen, (self_eq, other_eq))| {
                        // println!(
                        //     "\nsmaller 1: {:?}\nlarger 1 : {:?}",
                        //     self_eq.1.debug(self.parser),
                        //     other_eq.1.debug(self.parser)
                        // );
                        let from = self
                            .parser
                            .synth_terms
                            .generalise_second(&self.parser.terms, self_eq.1, other_eq.1, gen.0)
                            .unwrap()?;
                        // println!("result   : {:?}", from.debug(self.parser));
                        // println!(
                        //     "\nsmaller 2: {:?}\nlarger 2 : {:?}",
                        //     self_eq.2.debug(self.parser),
                        //     other_eq.2.debug(self.parser)
                        // );
                        let to = self
                            .parser
                            .synth_terms
                            .generalise_second(&self.parser.terms, self_eq.2, other_eq.2, gen.1)
                            .unwrap()?;
                        // println!("result   : {:?}", to.debug(self.parser));
                        Some((from, to))
                    })
                    .collect::<Option<_>>()?;
                Some(GeneralisedBlame { enode, equalities })
            })
            .collect::<Option<_>>()?;
        // let is_empty = gen.iter().all(|gen| gen.is_empty(self.parser));

        Some(self.generalisations.intern(gen))
    }

    pub fn is_generalised_by(
        &mut self,
        smaller: &[CollectedBlame],
        larger: &[CollectedBlame],
        gen: GenIdx,
    ) -> bool {
        self.is_generalised_by_inner::<false>(smaller, larger, gen)
    }

    /// Should only be run with `SECOND = false`. Use `true` to recheck the
    /// results from `generalise_second`.
    fn is_generalised_by_inner<const SECOND: bool>(
        &mut self,
        smaller: &[CollectedBlame],
        larger: &[CollectedBlame],
        gen: GenIdx,
    ) -> bool {
        assert_eq!(smaller.len(), larger.len());
        let gen = &self.generalisations[gen];
        assert_eq!(gen.len(), smaller.len());
        assert_eq!(gen.len(), larger.len());
        let smaller_larger = smaller.iter().zip(larger.iter());
        for (gen, (smaller, larger)) in gen.iter().zip(smaller_larger) {
            assert_eq!(gen.equalities.len(), smaller.equalities.len());
            assert_eq!(gen.equalities.len(), larger.equalities.len());
            if !self.parser.synth_terms.is_generalised_by::<SECOND>(
                &self.parser.terms,
                smaller.owner,
                larger.owner,
                gen.enode,
            ) {
                return false;
            }
            let smaller_larger = smaller.equalities.iter().zip(larger.equalities.iter());
            for (gen, (smaller, larger)) in gen.equalities.iter().zip(smaller_larger) {
                if !self.parser.synth_terms.is_generalised_by::<SECOND>(
                    &self.parser.terms,
                    smaller.1,
                    larger.1,
                    gen.0,
                ) {
                    return false;
                }
                if !self.parser.synth_terms.is_generalised_by::<SECOND>(
                    &self.parser.terms,
                    smaller.2,
                    larger.2,
                    gen.1,
                ) {
                    return false;
                }
            }
        }
        true
    }
}

impl MlNodeInfo {
    pub fn blames(parser: &Z3Parser, iidx: InstIdx) -> impl Iterator<Item = CollectedBlame> + '_ {
        let blames = parser[parser[iidx].match_].pattern_matches();
        blames.map(|blame| CollectedBlame::new(parser, blame))
    }

    pub fn new(
        parser: &Z3Parser,
        iidx: InstIdx,
        ml_sig: MlSigIdx,
        cached: &mut FxHashMap<TermIdx, AstSize>,
    ) -> Self {
        Self {
            ml_sig,
            ast_size: parser.inst_ast_size(iidx, cached),
            tree_above: Default::default(),
            blames: Self::blames(parser, iidx).collect(),
        }
    }

    pub fn root_above(&self, min_ml: u32, min_sc: u32) -> impl Iterator<Item = &MlLinkInfo> + '_ {
        self.tree_above
            .iter()
            .filter(move |above| match above.is_leaf {
                MlLinkLeaf::FullLeaf => {
                    above.max_depth + 1 >= min_ml || above.max_ungen_depth + 1 >= min_sc
                }
                MlLinkLeaf::UnGenLeaf => above.max_depth + 1 >= min_ml,
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
                    || next.is_some_and(|next| above.max_ungen_depth == next.max_ungen_depth + 1),
                "above: {above:?}, next: {next:?}",
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
            next = above
                .parent
                .map(|idx| &map[&above.prev].tree_above[idx as usize]);
            debug_assert!(
                above.max_depth == 0
                    || next.is_some_and(|next| above.max_depth == next.max_depth + 1),
                "above: {above:?}, next: {next:?}",
            );
            Some(above)
        })
    }

    pub fn ge_ast_size(&self, other: &Self) -> bool {
        match (self.ast_size, other.ast_size) {
            (Some(ss), Some(os)) => ss >= os,
            (Some(_), None) => false,
            (None, Some(_)) => true,
            (None, None) => true,
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default, Clone)]
pub struct MlAnalysisInfo {
    ancestors: FxHashSet<InstIdx>,
    banned: FxHashSet<InstIdx>,
}

impl MlAnalysisInfo {
    fn extend(&mut self, incoming: &Self) {
        for banned in incoming.banned.iter() {
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
            if prev_info.ml_sig == curr_info.ml_sig && curr_info.ge_ast_size(prev_info) {
                let mut gen = None;
                let mut parent = None;
                let mut max_ungen_depth = 0;
                let mut max_depth = 0;
                for (idx, above) in prev_info.tree_above.iter_mut().enumerate() {
                    if above.max_depth == 0 {
                        max_ungen_depth = max_ungen_depth.max(above.max_ungen_depth + 1);
                    }
                    if matches!(above.is_leaf, MlLinkLeaf::FullLeaf) {
                        above.is_leaf = MlLinkLeaf::UnGenLeaf;
                    }

                    if let Some(above_gen) = above.gen {
                        let new_max_depth = above.max_depth + 1;
                        debug_assert!(new_max_depth > max_depth || gen.is_some());
                        if new_max_depth > max_depth {
                            if above.max_depth == 0 {
                                if let Some(above_gen) = self.inner.generalise_second(
                                    &prev_info.blames,
                                    &curr_info.blames,
                                    above_gen,
                                ) {
                                    max_depth = new_max_depth;
                                    gen = Some(above_gen);
                                    parent = Some(idx as u32);
                                    above.is_leaf = MlLinkLeaf::NonLeaf;
                                } else {
                                    debug_assert!(!self.inner.is_generalised_by_inner::<true>(
                                        &prev_info.blames,
                                        &curr_info.blames,
                                        above_gen,
                                    ));
                                }
                            } else if self.inner.is_generalised_by(
                                &prev_info.blames,
                                &curr_info.blames,
                                above_gen,
                            ) {
                                max_depth = new_max_depth;
                                gen = Some(above_gen);
                                parent = Some(idx as u32);
                                above.is_leaf = MlLinkLeaf::NonLeaf;
                            }
                        }
                    }
                }
                if gen.is_some() {
                    debug_assert!(max_depth > 0);
                    max_ungen_depth = 0;
                    // println!("gen a: {:?} ({max_depth})", gen);
                } else {
                    debug_assert!(max_depth == 0);
                    gen = self.inner.generalise(&prev_info.blames, &curr_info.blames);
                    // println!("gen b: {:?} | {:?}\n", gen, prev_info.tree_above);
                }

                let link = MlLinkInfo {
                    prev: prev_iidx,
                    gen,
                    parent,
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
                Reverse(pidx.max_depth),
                Reverse(pidx.max_ungen_depth),
                pidx.prev,
            )
        });

        self.node_to_ml.insert(iidx, curr_info);
        curr.insert(iidx);
        curr
    }
}
