mod analysis;
mod explain;
mod node;
mod search;
mod signature;

pub use analysis::*;
pub use node::*;
pub use signature::*;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{idx, items::InstIdx, BoxSlice, FxHashMap, Graph, TiVec};

// Note: the current implementation misses the first inst in the chain and so
// actually requires one more inst than the number here.
pub const MIN_MATCHING_LOOP_LENGTH: u32 = 3;
pub const MIN_SUSPICIOUS_CHAIN_LENGTH: u32 = 6;

idx!(MlSigIdx, "∞{}");

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct MlData {
    pub signatures: TiVec<MlSigIdx, MlSignature>,
    pub per_inst: FxHashMap<InstIdx, MlAnalysisInfo>,
    pub matching_loops: Vec<MatchingLoop>,
    /// How many MLs were found for which we managed to construct a generalised
    /// graph? We are pretty confident that these are actual MLs.
    pub sure_mls: usize,
    /// How many long chains with the same signature were found, but which
    /// couldn't be generalised? These are probably not MLs but we might still
    /// want to show them to the user.
    pub maybe_mls: usize,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
pub struct MatchingLoop {
    pub sig: MlSigIdx,
    pub leaves: MlLeaves,
    pub members: BoxSlice<InstIdx>,
    pub graph: Option<MlGraph>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
pub struct MlGraph {
    pub gen: GenIdx,
    /// Set to `true` if we failed at some point during the graph construction.
    /// The graph is likely incomplete in this case and we should warn the user.
    pub graph_incomplete: bool,
    pub data: MlExplanation,
}

pub type MlExplanation = Graph<MLGraphNode, MLGraphEdge>;

pub type MlEndNodes = Vec<MlSigCollection>;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone)]
/// Collection of instantiations all with the same ML signature, grouped by
/// generalisations along with a set of unknown generalisations.
pub struct MlSigCollection {
    pub sig: MlSignature,
    pub gens: Vec<(GenIdx, MlLeaves)>,
    pub ungens: MlLeaves,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Default)]
pub struct MlLeaves(pub Vec<(u32, InstIdx)>);

impl MatchingLoop {
    pub fn members<'a>(&'a self, data: &'a MlData) -> impl Iterator<Item = InstIdx> + 'a {
        let mut members = self.members.iter().copied();
        let mut last_saved = members.next();
        let mut others_between = None::<std::collections::hash_set::IntoIter<InstIdx>>;
        core::iter::from_fn(move || {
            if let Some(mut ob) = others_between.take() {
                if let Some(next) = ob.next() {
                    others_between = Some(ob);
                    return Some(next);
                }
            }
            let last = last_saved?;
            last_saved = members.next();
            let member = last_saved?;

            others_between =
                Some(MlOutput::others_between(&data.per_inst, member, last).into_iter());
            Some(member)
        })
    }
}
