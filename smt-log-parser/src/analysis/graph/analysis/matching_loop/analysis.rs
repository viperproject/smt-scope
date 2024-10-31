use fxhash::FxHashSet;

use crate::{
    analysis::{
        analysis::{MlEndNodes, TopoAnalysis},
        raw::Node,
        InstGraph, RawNodeIndex,
    },
    items::InstIdx,
    FxHashMap, Z3Parser,
};

use super::MlSignature;

pub struct MlAnalysis {
    pub data: Vec<MlSignature>,
    pub node_to_ml: FxHashMap<InstIdx, MlNodeInfo>,
}

impl MlAnalysis {
    pub fn new(parser: &Z3Parser, signatures: Vec<(MlSignature, FxHashSet<InstIdx>)>) -> Self {
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
        Self { data, node_to_ml }
    }

    pub fn finalise(self, min_depth: u32) -> (MlEndNodes, FxHashSet<InstIdx>) {
        let mut ml_end_nodes: MlEndNodes =
            self.data.into_iter().map(|sig| (sig, Vec::new())).collect();
        let mut ml_nodes = FxHashSet::default();
        for (iidx, data) in self.node_to_ml.iter() {
            if !data.is_root || data.max_depth < min_depth {
                continue;
            }
            ml_nodes.insert(*iidx);
            Self::walk_tree(&self.node_to_ml, data, &mut ml_nodes);
            ml_end_nodes[data.ml_sig].1.push((data.max_depth, *iidx));
        }
        ml_end_nodes.retain_mut(|(_, v)| {
            if v.is_empty() {
                false
            } else {
                v.sort_unstable_by_key(|(len, idx)| (u32::MAX - *len, *idx));
                true
            }
        });
        (ml_end_nodes, ml_nodes)
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

#[derive(Clone, Debug)]
pub struct MlNodeInfo {
    pub is_root: bool,
    pub ml_sig: usize,
    pub max_depth: u32,
    pub ast_size: u32,
    pub tree_above: FxHashSet<InstIdx>,
}

impl MlNodeInfo {
    pub fn new(parser: &Z3Parser, iidx: InstIdx, ml_sig: usize) -> Self {
        Self {
            is_root: true,
            ml_sig,
            max_depth: 0,
            ast_size: parser.inst_ast_size(iidx),
            tree_above: FxHashSet::default(),
        }
    }
}

impl TopoAnalysis<true, false> for MlAnalysis {
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
