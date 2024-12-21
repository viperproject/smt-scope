#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{FxHashMap, NonMaxU32};

use super::{ENodeIdx, EqGivenIdx, EqTransIdx, InstIdx, ProofIdx, StackIdx, TermIdx};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct ENode {
    pub frame: StackIdx,
    pub blame: ENodeBlame,
    pub owner: TermIdx,
    pub z3_generation: NonMaxU32,

    pub(crate) equalities: Vec<Equality>,
    /// This will never contain a `TransitiveExpl::to` pointing to itself. It
    /// may contain `TransitiveExpl::given_len` of 0, but only when
    /// `get_simple_path` fails but `can_mismatch` is true.
    pub(crate) transitive: FxHashMap<ENodeIdx, EqTransIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy)]
pub enum ENodeBlame {
    /// The `ENode` was created by an instantiation.
    Inst(InstIdx),
    /// The `ENode` was created by a proof step.
    Proof(ProofIdx),
    /// The `ENode` represents either `#1` or `#2`.
    BoolConst,
    /// We don't know why the `ENode` was created.
    Unknown,
}

impl ENodeBlame {
    pub fn inst(self) -> Option<InstIdx> {
        match self {
            Self::Inst(inst) => Some(inst),
            _ => None,
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy)]
pub struct Equality {
    pub(crate) _frame: StackIdx,
    pub to: ENodeIdx,
    pub expl: EqGivenIdx,
}
