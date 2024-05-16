use std::{borrow::Cow, fmt};

use crate::{items::*, parsers::z3::z3parser::Z3Parser, StringTable, NonMaxU32};

////////////
// General
////////////

pub trait DisplayWithCtxt<Ctxt, Data>: Sized {
    fn fmt_with(self, f: &mut fmt::Formatter<'_>, ctxt: &Ctxt, data: &mut Data) -> fmt::Result;
    fn with<'a>(self, ctxt: &'a Ctxt) -> DisplayWrapperEmpty<'a, Ctxt, Data, Self>
    where
        Self: Copy,
        Data: Default,
    {
        DisplayWrapperEmpty {
            inner: self,
            ctxt,
            data_marker: std::marker::PhantomData,
        }
    }
    fn with_data<'a, 'b>(
        self,
        ctxt: &'a Ctxt,
        data: &'b mut Data,
    ) -> DisplayWrapperData<'a, 'b, Ctxt, Data, Self>
    where
        Self: Copy,
    {
        DisplayWrapperData {
            inner: self,
            ctxt,
            data,
            data_marker: std::marker::PhantomData,
        }
    }
}

pub struct DisplayWrapperEmpty<'a, Ctxt, Data: Default, T: DisplayWithCtxt<Ctxt, Data> + Copy> {
    inner: T,
    ctxt: &'a Ctxt,
    data_marker: std::marker::PhantomData<Data>,
}

impl<'a, Ctxt, Data: Default, T: DisplayWithCtxt<Ctxt, Data> + Copy> fmt::Display
    for DisplayWrapperEmpty<'a, Ctxt, Data, T>
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.inner.fmt_with(f, self.ctxt, &mut Data::default())
    }
}

pub struct DisplayWrapperData<'a, 'b, Ctxt, Data, T: DisplayWithCtxt<Ctxt, Data> + Copy> {
    inner: T,
    ctxt: &'a Ctxt,
    data: *mut Data,
    data_marker: std::marker::PhantomData<&'b mut Data>,
}

impl<'a, 'b, Ctxt, Data, T: DisplayWithCtxt<Ctxt, Data> + Copy> fmt::Display
    for DisplayWrapperData<'a, 'b, Ctxt, Data, T>
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // SAFETY: DisplayWrapperData is only created in `with_data` where it blocks the input `data`.
        let data = unsafe { &mut *self.data };
        self.inner.fmt_with(f, self.ctxt, data)
    }
}

////////////
// Items
////////////

pub struct DisplayCtxt<'a> {
    pub parser: &'a Z3Parser,
    pub config: DisplayConfiguration,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DisplayConfiguration {
    pub display_term_ids: bool,
    pub display_quantifier_name: bool,
    pub use_mathematical_symbols: bool,
    /// Use tags for formatting
    pub html: bool,

    // If `enode_char_limit` is Some, then any term longer than
    // the limit will be truncated.
    pub enode_char_limit: Option<NonMaxU32>,
    pub ast_depth_limit: Option<NonMaxU32>,
}

mod private {

    use super::*;

    #[derive(Debug, Clone)]
    pub(super) struct DisplayData<'a> {
        pub(super) term: TermIdx,
        children: &'a [TermIdx],
        quant: Vec<&'a Quantifier>,
        bind_power: u8,
        ast_depth: u32,
    }
    impl<'a> DisplayData<'a> {
        pub(super) fn new(term: TermIdx) -> Self {
            Self {
                term,
                children: &[],
                quant: Vec::new(),
                bind_power: super::NO_BIND,
                ast_depth: 0,
            }
        }
        pub(super) fn with_children<T>(
            &mut self,
            children: &'a [TermIdx],
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.children, children);
            let result = f(self);
            self.children = old;
            result
        }
        pub(super) fn with_quant<T>(
            &mut self,
            quant: &'a Quantifier,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            self.quant.push(quant);
            let result = f(self);
            self.quant.pop();
            result
        }
        pub(super) fn with_bind_power<T>(
            &mut self,
            bind_power: u8,
            f: impl FnOnce(&mut Self, u8) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.bind_power, bind_power);
            let result = f(self, old);
            self.bind_power = old;
            result
        }
        pub(super) fn with_term<T>(
            &mut self,
            term: TermIdx,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let term = std::mem::replace(&mut self.term, term);
            let result = f(self);
            self.term = term;
            result
        }

        pub(super) fn children(&self) -> &'a [TermIdx] {
            self.children
        }
        pub(super) fn find_quant(&self, idx: &mut usize) -> Option<&Quantifier> {
            self.quant
                .iter()
                .find(|q| {
                    let found = q.num_vars > *idx;
                    if !found {
                        *idx -= q.num_vars;
                    }
                    found
                })
                .copied()
        }
        pub(super) fn incr_ast_depth_with_limit<T>(&mut self, limit: Option<NonMaxU32>, f: impl FnOnce(&mut Self) -> T) -> Option<T> {
            if limit.is_some_and(|limit| self.ast_depth >= limit.get()) {
                return None;
            }
            self.ast_depth += 1;
            let result = f(self);
            self.ast_depth -= 1;
            Some(result)
        }
    }
}

use private::*;
// lower inside higher needs brackets around the lower
const NO_BIND: u8 = 0;
const QUANT_BIND: u8 = 3;
const TERNARY_BIND: u8 = 7;
const INFIX_BIND: u8 = 15;
const PREFIX_BIND: u8 = 31;

////////////
// Item Idx defs
////////////

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for TermIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        _data: &mut (),
    ) -> fmt::Result {
        let mut data = DisplayData::new(self);
        write!(f, "{}", ctxt.parser[self].with_data(ctxt, &mut data))
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for ENodeIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        if let Some(enode_char_limit) = ctxt.config.enode_char_limit {
            let owner = ctxt.parser[self].owner.with_data(ctxt, data).to_string();
            if owner.len() <= enode_char_limit.get() as usize {
                write!(f, "{owner}")
            } else {
                write!(f, "{}...", &owner[..enode_char_limit.get() as usize - 3])
            }
        } else {
            ctxt.parser[self].owner.fmt_with(f, ctxt, data)
        }
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for QuantIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        let quant = &ctxt.parser[self];
        if let Some(term) = quant.term {
            term.fmt_with(f, ctxt, data)
        } else {
            let QuantKind::Other(name) = quant.kind else {
                panic!()
            };
            write!(f, "{}", &ctxt.parser[name])
        }
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for EqGivenIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        let eq = &ctxt.parser[self];
        eq.from().fmt_with(f, ctxt, data)?;
        write!(f, " = ")?;
        eq.to().fmt_with(f, ctxt, data)
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for EqTransIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        let path = ctxt.parser.egraph.equalities.path(self);
        path.first().unwrap().fmt_with(f, ctxt, data)?;
        if ctxt.config.html {
            write!(f, " =<sup>{}</sup> ", path.len() - 1)?;
        } else {
            write!(f, " =[{}] ", path.len() - 1)?;
        }
        path.last().unwrap().fmt_with(f, ctxt, data)
    }
}

// Others

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for &MatchKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        match self {
            MatchKind::MBQI { quant, .. } => {
                write!(f, "[MBQI]")?;
                quant.fmt_with(f, ctxt, data)
            }
            MatchKind::TheorySolving { axiom_id, .. } => {
                write!(
                    f,
                    "[TheorySolving] {}#",
                    &ctxt.parser[axiom_id.namespace],
                )?;
                if let Some(id) = axiom_id.id {
                    write!(f, "{id}")?;
                }
                Ok(())
            }
            MatchKind::Axiom { axiom, .. } => {
                write!(f, "[Ax]")?;
                axiom.fmt_with(f, ctxt, data)
            }
            MatchKind::Quantifier { quant, .. } => quant.fmt_with(f, ctxt, data),
        }
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for &QuantKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        _data: &mut (),
    ) -> fmt::Result {
        match *self {
            QuantKind::Other(kind) => write!(f, "{}", &ctxt.parser[kind]),
            QuantKind::Lambda => if ctxt.config.use_mathematical_symbols {
                write!(f, "λ")
            } else if ctxt.config.html {
                write!(f, "&lt;null&gt;")
            } else {
                write!(f, "<null>")
            },
            QuantKind::NamedQuant(name) => write!(f, "{}", &ctxt.parser[name]),
            QuantKind::UnnamedQuant { name, id } => {
                write!(f, "{}!{id}", &ctxt.parser[name])
            }
        }
    }
}

////////////
// Item defs
////////////

impl<'a: 'b, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a Term {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        data.with_children(&self.child_ids, |data| {
            if ctxt.config.display_term_ids {
                match self.id {
                    None => write!(f, "[synthetic]")?,
                    Some(id) => {
                        let namespace = &ctxt.parser[id.namespace];
                        let id = id.id.map(|id| id.to_string()).unwrap_or_default();
                        write!(f, "[{namespace}#{id}]")?
                    }
                }

            }
            if let Some(meaning) = ctxt.parser.meaning(data.term) {
                write!(f, "{}", meaning.with_data(ctxt, data))?;
            } else {
                write!(f, "{}", self.kind.with_data(ctxt, data))?;
            }
            Ok(())
        })
    }
}


impl VarNames {
    pub fn get_name<'a>(strings: &'a StringTable, this: Option<&Self>, idx: usize, config: &DisplayConfiguration) -> Cow<'a, str> {
        let name = match this {
            Some(Self::NameAndType(names)) => Cow::Borrowed(&strings[*names[idx].0]),
            None | Some(Self::TypeOnly(_)) => Cow::Owned(if config.use_mathematical_symbols {
                format!("•{idx}")
            } else {
                format!("qvar_{idx}")
            }),
        };
        if config.html {
            const COLORS: [&str; 9] = ["blue", "green", "olive", "maroon", "teal", "purple", "red", "fuchsia", "navy"];
            let color = COLORS[idx % COLORS.len()];
            let name = format!("<div style=\"color:{color};display:inline\">{name}</div>");
            Cow::Owned(name)
        } else {
            name
        }
    }
}
impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a TermKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        match self {
            &TermKind::Var(mut idx) => {
                let vars = data.find_quant(&mut idx).and_then(|q| q.vars.as_ref());
                let name = VarNames::get_name(&ctxt.parser.strings, vars, idx, &ctxt.config);
                write!(f, "{name}")
            }
            TermKind::ProofOrApp(poa) => write!(f, "{}", poa.with_data(ctxt, data)),
            TermKind::Quant(idx) => write!(f, "{}", ctxt.parser[*idx].with_data(ctxt, data)),
            // TODO: it would be nice to display some extra information here
            TermKind::Generalised => write!(f, "_"),
        }
    }
}

fn display_child<'a, 'b, 'c, 'd>(f: &mut fmt::Formatter<'_>, child: TermIdx, ctxt: &'a DisplayCtxt<'b>, data: &'c mut DisplayData<'b>) -> fmt::Result {
    data.incr_ast_depth_with_limit(ctxt.config.ast_depth_limit, |data| {
        data.with_term(child, |data| write!(f, "{}", ctxt.parser[child].with_data(ctxt, data)))
    }).unwrap_or_else(|| {
        write!(f, "...")
    })
}

enum ProofOrAppKind<'a> {
    Unary(&'a str),
    Inline(&'a str),
    Ternary(&'a str, &'a str),
    Pattern,
    OtherApp(&'a str),
    Proof(&'a str),
}
impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a ProofOrApp {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        let math = ctxt.config.use_mathematical_symbols;
        use ProofOrAppKind::*;
        let name = &ctxt.parser[self.name];
        let kind = match name {
            name if self.is_proof => Proof(name),
            "not" => Unary(if math { "¬" } else { "!" }),
            "-" if data.children().len() == 1 => Unary("-"),

            "and" => Inline(if math { "∧" } else { "&&" }),
            "or" => Inline(if math { "∨" } else { "||" }),
            "<=" => Inline(if math { "≤" } else { "<=" }),
            ">=" => Inline(if math { "≥" } else { ">=" }),
            op @ ("=" | "+" | "-" | "*" | "/" | "<" | ">") => Inline(op),

            "if" => Ternary("?", ":"),

            "pattern" => Pattern,

            name => OtherApp(name),
        };
        match kind {
            Unary(op) => data.with_bind_power(PREFIX_BIND, |data, bind_power| {
                assert!(bind_power <= PREFIX_BIND);
                assert_eq!(data.children().len(), 1);
                let child = data.children()[0];
                write!(f, "{op}")?;
                display_child(f, child, ctxt, data)
                
            }),
            Inline(op) => data.with_bind_power(INFIX_BIND, |data, bind_power| {
                let need_brackets = bind_power >= INFIX_BIND;
                if need_brackets {
                    write!(f, "(")?;
                }
                for (idx, child) in data.children().iter().enumerate() {
                    if idx != 0 {
                        write!(f, " {op} ")?;
                    }
                    display_child(f, *child, ctxt, data)?;
                }
                if need_brackets {
                    write!(f, ")")?;
                }
                Ok(())
            }),
            // `if` -> `$[#0|7] ? $[#1|7] : $[#2|7]_7`
            Ternary(op1, op2) => data.with_bind_power(TERNARY_BIND, |data, bind_power| {
                let need_brackets = bind_power >= TERNARY_BIND;
                if need_brackets {
                    write!(f, "(")?;
                }
                assert_eq!(data.children().len(), 3);
                let cond = data.children()[0];
                display_child(f, cond, ctxt, data)?;
                write!(f, " {op1} ")?;
                let then = data.children()[1];
                display_child(f, then, ctxt, data)?;
                write!(f, " {op2} ")?;
                let else_ = data.children()[2];
                display_child(f, else_, ctxt, data)?;
                if need_brackets {
                    write!(f, ")")?;
                }
                Ok(())
            }),
            // `pattern` -> `{ $(#0:-0|0|, ) }_256`
            Pattern => data.with_bind_power(NO_BIND, |data, _| {
                // BIND_POWER is highest
                write!(f, "{{")?;
                for (idx, child) in data.children().iter().enumerate() {
                    if idx != 0 {
                        write!(f, ", ")?;
                    }
                    display_child(f, *child, ctxt, data)?;
                }
                write!(f, "}}")
            }),
            OtherApp(name) | Proof(name) => data.with_bind_power(NO_BIND, |data, _| {
                // BIND_POWER is highest
                write!(f, "{name}")?;
                if data.children().is_empty() {
                    return Ok(());
                }
                write!(f, "(")?;
                for (idx, child) in data.children().iter().enumerate() {
                    if idx != 0 {
                        write!(f, ", ")?;
                    }
                    display_child(f, *child, ctxt, data)?;
                }
                write!(f, ")")
            }),
        }
    }
}

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a Meaning {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        _data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        let theory = &ctxt.parser[self.theory];
        let value = &ctxt.parser[self.value];
        match theory {
            "arith" | "bv" => write!(f, "{value}"),
            theory => write!(f, "/{theory} {value}\\"),
        }
    }
}

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a Quantifier {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        // Within the body of the term of a quantified formula, we
        // want to replace the quantified variables by their names
        // for this, we need to store the quantifier in the context
        data.with_quant(self, |data| {
            data.with_bind_power(QUANT_BIND, |data, bind_power| {
                let need_brackets = bind_power > QUANT_BIND;
                if need_brackets {
                    write!(f, "(")?;
                }
                if ctxt.config.use_mathematical_symbols {
                    write!(f, "∀ ")?;
                } else {
                    write!(f, "FORALL ")?;
                }
                if ctxt.config.display_quantifier_name {
                    write!(f, "\"{}\" ", self.kind.with(ctxt))?;
                }
                for idx in 0..self.num_vars {
                    let name = VarNames::get_name(&ctxt.parser.strings, self.vars.as_ref(), idx, &ctxt.config);
                    let ty = VarNames::get_type(&ctxt.parser.strings, self.vars.as_ref(), idx);
                    if idx != 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{name}{ty}")?;
                }
                let sep = if ctxt.config.use_mathematical_symbols {
                    "."
                } else {
                    " ::"
                };
                write!(f, "{sep}")?;
                for child in data.children() {
                    write!(f, " ")?;
                    display_child(f, *child, ctxt, data)?;
                }
                if need_brackets {
                    write!(f, ")")?;
                }
                Ok(())
            })
        })
    }
}
