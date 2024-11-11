#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{FxHashMap, NonMaxU32};

use super::{ENodeIdx, EqGivenIdx, EqTransIdx, InstIdx, StackIdx, TermIdx};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct ENode {
    pub frame: StackIdx,
    pub created_by: Option<InstIdx>,
    pub owner: TermIdx,
    pub z3_generation: Option<NonMaxU32>,

    pub(crate) equalities: Vec<Equality>,
    /// This will never contain a `TransitiveExpl::to` pointing to itself. It
    /// may contain `TransitiveExpl::given_len` of 0, but only when
    /// `get_simple_path` fails but `can_mismatch` is true.
    pub(crate) transitive: FxHashMap<ENodeIdx, EqTransIdx>,
    pub(crate) self_transitive: Option<EqTransIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Equality {
    pub(crate) _frame: StackIdx,
    pub to: ENodeIdx,
    pub expl: EqGivenIdx,
}
