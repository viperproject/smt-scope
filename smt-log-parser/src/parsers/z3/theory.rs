#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Term, TermIdx},
    FxHashMap,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct TheorySolving {
    /// Rewrites to equivalent terms.
    pub equivs: FxHashMap<TermIdx, TermIdx>,
    pub reprs: FxHashMap<Term, TermIdx>,
}

impl TheorySolving {
    pub fn new_term(&mut self, term: &Term) {}
}

/// https://github.com/Z3Prover/z3/blob/z3-4.13.4/src/ast/ast.cpp#L856-L878
const BASIC_NAMES: &[&str] = &[
    "true",
    "false",
    "=",
    "distinct",
    "ite",
    "if",
    "and",
    "or",
    "xor",
    "not",
    "=>",
    "implies",
    "iff",
    "if_then_else",
    "&&",
    "||",
    "equals",
    "equiv",
];

/// https://github.com/Z3Prover/z3/blob/z3-4.13.4/src/ast/arith_decl_plugin.cpp#L599-L640
const ARITH_NAMES: &[&str] = &[
    "<=",
    ">=",
    "<",
    ">",
    "+",
    "-",
    "~",
    "*",
    "/",
    "div",
    "divisible",
    "rem",
    "mod",
    "to_real",
    "to_int",
    "is_int",
    "abs",
    "^",
    "^0",
    "sin",
    "cos",
    "tan",
    "asin",
    "acos",
    "atan",
    "sinh",
    "cosh",
    "tanh",
    "asinh",
    "acosh",
    "atanh",
    "pi",
    "euler",
    "/0",
    "div0",
    "mod0",
];
