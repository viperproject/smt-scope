mod defns;
mod defns_const;
mod deparse;
mod error;
mod parse;
#[cfg(feature = "serde")]
mod serde;

pub use defns::*;
pub use defns_const::*;
pub use deparse::*;
pub use error::*;
use parse::*;

macro_rules! unwrap {
    ($e:expr) => {
        match $e {
            Ok(v) => v,
            Err(e) => e.kind.const_error(true),
        }
    };
}

pub const QUANT_BIND: BindPowerPair = unwrap!(BindPowerPair::parse("-6,12")).1;

pub const DEFAULT_FORMATTER: FormatterConst<'static> =
    unwrap!(FormatterConst::parse("$-8$${0}$$(#0:-1|4|8|4$(|, |))$$-4$"));
// pub const DEFAULT: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse("/(?:.|\\n)*/", "$-8$${0}$$(#0:-1|4|8|4$(|, |))$$-4$"));

pub const TRIGGER: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse(
    "pattern",
    "$-8${ $(#0:-1|4|8|4$, )$ }$-8$"
));

pub const UNARY_OP: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse(
    "(/(?:not)/ _)",
    "$-6$${0}$$[#0|-8,16]$$-16$"
));
pub const NEG: TermDisplayConst<'static> =
    unwrap!(TermDisplayConst::parse("(- _)", "$-6$-$[#0|-8,16]$$-16$"));
/// I'm not sure all of these are necessary since z3 generally breaks up terms,
/// e.g. `(>= _ _)` into `(and (= _ _) (< _ _))`, or `(=> _ _)` into `(or (not _) _)`.
pub const BINARY_OP: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse(
    "/=|\\+|-|\\*|/|<|>|(?:and)|(?:or)|(?:<=)|(?:>=)|(?:=>)/",
    "$10$$(#0:-1|9|-16|9$| ${0}$ |)$$10$"
));
pub const IF: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse(
    "if",
    "$-8$$[#0|9,-16]$ ? $[#1|4,4]$ : $[#2|4,4]$$-8$"
));

// pub const SLOT_TEST: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse("slot", "$-8$&$[#0|9,-16]$[$[#1|4,4]$]$-8$"));

pub const S_EXPRESSION: FormatterConst<'static> =
    unwrap!(FormatterConst::parse("$-1$(${0}$$(#0:-1|1$ | |)$)$-1$"));
pub const S_EXPRESSION_LEAF: TermDisplayConst<'static> =
    unwrap!(TermDisplayConst::parse("(/.*/)", "$-1$${0}$$-1$"));
pub const S_EXPRESSION_PATTERN: TermDisplayConst<'static> = unwrap!(TermDisplayConst::parse(
    "pattern",
    "$-1$:pattern ($(#0:-1|1$| |)$)$-1$"
));

impl TermDisplayContext {
    pub fn basic() -> Self {
        let self_: Result<Self, _> = [TRIGGER, UNARY_OP, NEG, BINARY_OP, IF]
            .into_iter()
            .map(|td| TermDisplay::try_from(td).unwrap())
            .collect();
        self_.unwrap()
    }

    pub fn s_expression() -> Self {
        let fallback = Formatter::try_from(S_EXPRESSION).unwrap();
        let mut self_ = Self::new(fallback);

        let leaf = TermDisplay::try_from(S_EXPRESSION_LEAF).unwrap();
        self_.push(leaf).unwrap();
        let pattern = TermDisplay::try_from(S_EXPRESSION_PATTERN).unwrap();
        self_.push(pattern).unwrap();

        self_
    }
}

impl Default for Formatter {
    fn default() -> Self {
        static FMT: std::sync::OnceLock<Formatter> = std::sync::OnceLock::new();
        FMT.get_or_init(|| Formatter::try_from(DEFAULT_FORMATTER).unwrap())
            .clone()
    }
}
