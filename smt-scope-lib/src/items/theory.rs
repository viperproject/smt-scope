use core::num::NonZeroU32;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{IString, StringTable};

/// See https://github.com/Z3Prover/z3/blob/z3-4.13.4/src/ast/ast.h#L78-L88 and
/// https://github.com/Z3Prover/z3/blob/z3-4.13.4/src/ast/ast.cpp#L1330-L1336
/// These define the basic family IDs, we get them either as a number (e.g. in
/// `[assign]` lines) or names (e.g. in `[eq-expl] th` lines). Other family IDs
/// may be defined, which are represented as either `Other` or `Unknown`,
/// depending on if we got a name or a number.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TheoryKind {
    Null,
    Basic,
    Label,
    Pattern,
    ModelValue,
    UserSort,
    Arith,
    Polymorphic,

    Other(IString),
    Unknown(NonZeroU32),
}

impl TheoryKind {
    pub fn from_id(id: i32) -> Self {
        debug_assert!(id >= -1);
        use TheoryKind::*;
        match id {
            -1 => Null,
            0 => Basic,
            1 => Label,
            2 => Pattern,
            3 => ModelValue,
            4 => UserSort,
            5 => Arith,
            6 => Polymorphic,
            _ => Unknown(NonZeroU32::new(id as u32).unwrap()),
        }
    }

    pub fn from_name(name: &str, strings: &mut StringTable) -> Self {
        use TheoryKind::*;
        match name {
            "null" => Null,
            "basic" => Basic,
            "label" => Label,
            "pattern" => Pattern,
            "model-value" => ModelValue,
            "user-sort" => UserSort,
            "arith" => Arith,
            "polymorphic" => Polymorphic,
            _ => Other(IString(strings.get_or_intern(name))),
        }
    }
}
