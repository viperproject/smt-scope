mod defns;
mod defns_const;
mod deparse;
mod error;
mod parse;
#[cfg(feature = "serde")]
mod serde;
mod term;
mod util;
mod parse2;

pub use defns::*;
pub use defns_const::*;
pub use deparse::*;
pub use error::*;
use parse::*;
pub use term::*;

macro_rules! unwrap {
    ($e:expr) => {
        match $e {
            Ok(v) => v,
            Err(e) => e.kind.const_error(true),
        }
    };
}

pub const QUANT_BIND: BindPowerPair = unwrap!(BindPowerPair::parse("-6,12")).1;

// pub const DEFAULT_FORMATTER: FormatterConst<'static> =
//     unwrap!(FormatterConst::parse("$-8$${0}$$(#0:-1|4|8|4$(|, |))$$-4$"));
pub fn default() -> TermDisplay {
    TermDisplay::parse("_", "$-8$${0}$$(#0:-1|4|8|4$(|, |))$$-4$").unwrap()
}
// pub const DEFAULT: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse("/(?:.|\\n)*/", "$-8$${0}$$(#0:-1|4|8|4$(|, |))$$-4$"));

pub fn trigger() -> TermDisplay {
    TermDisplay::parse("pattern", "$-8${ $(#0:-1|4|8|4$, )$ }$-8$").unwrap()
}

pub fn unary_op() -> TermDisplay {
    TermDisplay::parse("(/(?:not)/ _)", "$-6$${0}$$[#0|-8,16]$$-16$").unwrap()
}
pub fn neg() -> TermDisplay {
    TermDisplay::parse("(- _)", "$-6$-$[#0|-8,16]$$-16$").unwrap()
}
/// I'm not sure all of these are necessary since z3 generally breaks up terms,
/// e.g. `(>= _ _)` into `(and (= _ _) (< _ _))`, or `(=> _ _)` into `(or (not _) _)`.
pub fn binary_op() -> TermDisplay {
    TermDisplay::parse(
        "/=|\\+|-|\\*|/|<|>|(?:and)|(?:or)|(?:<=)|(?:>=)|(?:=>)/",
        "$10$$(#0:-1|9|-16|9$| ${0}$ |)$$10$",
    )
    .unwrap()
}
pub fn if_() -> TermDisplay {
    TermDisplay::parse("if", "$-8$$[#0|9,-16]$ ? $[#1|4,4]$ : $[#2|4,4]$$-8$").unwrap()
}

pub fn s_expression() -> TermDisplay {
    TermDisplay::parse("_", "$-1$(${0}$$(#0:-1|1$ | |)$)$-1$").unwrap()
}
pub fn s_expression_leaf() -> TermDisplay {
    TermDisplay::parse("(/.*/)", "$-1$${0}$$-1$").unwrap()
}
pub fn s_expression_pattern() -> TermDisplay {
    TermDisplay::parse("pattern", "$-1$:pattern ($(#0:-1|1$| |)$)$-1$").unwrap()
}

impl TermDisplayContext {
    pub fn basic() -> Self {
        let self_: Result<Self, _> = [trigger(), unary_op(), neg(), binary_op(), if_(), default()]
            .into_iter()
            .collect();
        self_.unwrap()
    }

    pub fn s_expression() -> Self {
        let mut self_: TermDisplayContext = Self::default();
        // let fallback = s_expression();
        // self_.set_fallback(fallback);

        // let leaf = s_expression_leaf();
        // self_.push(leaf).unwrap();
        let pattern = s_expression_pattern();
        self_.push(pattern).unwrap();

        self_
    }
}

impl Formatter {
    pub fn s_expression(children: usize) -> &'static Self {
        static S_APP: std::sync::OnceLock<Formatter> = std::sync::OnceLock::new();
        static S_LEAF: std::sync::OnceLock<Formatter> = std::sync::OnceLock::new();
        if children == 0 {
            S_LEAF.get_or_init(|| s_expression_leaf().formatter)
        } else {
            S_APP.get_or_init(|| s_expression().formatter)
        }
    }
}
