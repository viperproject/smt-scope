use std::fmt;

use crate::{items::*, parsers::z3::z3parser::Z3Parser};

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

    pub display_term_ids: bool,
    pub display_quantifier_name: bool,
    pub use_mathematical_symbols: bool,
}

mod private {
    use super::*;

    #[derive(Debug, Clone)]
    pub(super) struct DisplayData<'a> {
        children: &'a [TermIdx],
        quant: Vec<&'a Quantifier>,
        bind_power: u8,
    }
    impl<'a> DisplayData<'a> {
        pub(super) fn new() -> Self {
            Self {
                children: &[],
                quant: Vec::new(),
                bind_power: super::NO_BIND,
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

        pub(super) fn children(&self) -> &'a [TermIdx] {
            self.children
        }
        pub(super) fn find_quant(&self, idx: &mut usize) -> Option<&'a Quantifier> {
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
    }
}
use private::*;
const NO_BIND: u8 = 0;
const QUANT_BIND: u8 = 3;
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
        let mut data = DisplayData::new();
        // write!(f, "{}", ctxt.parser[self].with_data(ctxt, &mut data))
        write!(f, "{}", ctxt.parser.get(self).with_data(ctxt, &mut data))
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for ENodeIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        data: &mut (),
    ) -> fmt::Result {
        ctxt.parser[self].owner.fmt_with(f, ctxt, data)
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
            let QuantKind::Other(name) = &quant.kind else {
                panic!()
            };
            write!(f, "{}", ctxt.parser.strings.resolve(name))
        }
    }
}

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
                    ctxt.parser.strings.resolve(&axiom_id.namespace)
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

////////////
// Item defs
////////////

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a Term {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        data.with_children(&self.child_ids, |data| {
            if ctxt.display_term_ids {
                let namespace = ctxt.parser.strings.resolve(&self.id.unwrap().namespace);
                let id = self.id.unwrap().id.map(|id| id.to_string()).unwrap_or_default();
                write!(f, "[{namespace}#{id}]")?;
            }
            if let Some(meaning) = &self.meaning {
                write!(f, "{}", meaning.with_data(ctxt, data))?;
            } else {
                write!(f, "{}", self.kind.with_data(ctxt, data))?;
            }
            Ok(())
        })
    }
}

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a TermKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        match self {
            &TermKind::Var(mut idx) => {
                let vars = data.find_quant(&mut idx).map(|q| &q.vars).unwrap_or(&None);
                write!(f, "{}", VarNames::get_name(&ctxt.parser.strings, vars, idx))
            }
            TermKind::ProofOrApp(poa) => write!(f, "{}", poa.with_data(ctxt, data)),
            TermKind::Quant(idx) => write!(f, "{}", ctxt.parser[*idx].with_data(ctxt, data)),
            TermKind::GeneralizedTerm => write!(f, "[generalized term]"),
        }
    }
}

enum ProofOrAppKind {
    Unary,
    Inline,
    Pattern,
    OtherApp,
    Proof,
}
impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a ProofOrApp {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        let math = ctxt.use_mathematical_symbols;
        use ProofOrAppKind::*;
        let name = ctxt.parser.strings.resolve(&self.name);
        let (name, kind) = match name {
            name if self.is_proof => (name, Proof),
            "not" => (if math { "¬" } else { "!" }, Unary),
            "-" if data.children().len() == 1 => ("-", Unary),

            "and" => (if math { "∧" } else { "&&" }, Inline),
            "or" => (if math { "∨" } else { "||" }, Inline),
            "<=" => (if math { "≤" } else { "<=" }, Inline),
            ">=" => (if math { "≥" } else { ">=" }, Inline),
            op @ ("=" | "+" | "-" | "*" | "/" | "<" | ">") => (op, Inline),

            "pattern" => ("pattern", Pattern),

            name => (name, OtherApp),
        };
        match kind {
            Unary => data.with_bind_power(PREFIX_BIND, |data, bind_power| {
                assert!(bind_power <= PREFIX_BIND);
                assert_eq!(data.children().len(), 1);
                let child = data.children()[0];
                // write!(f, "{name}{}", ctxt.parser[child].with_data(ctxt, data))
                write!(f, "{name}{}", ctxt.parser.get(child).with_data(ctxt, data))
            }),
            Inline => data.with_bind_power(INFIX_BIND, |data, bind_power| {
                let need_brackets = bind_power >= INFIX_BIND;
                if need_brackets {
                    write!(f, "(")?;
                }
                for (idx, child) in data.children().iter().enumerate() {
                    if idx != 0 {
                        write!(f, " {name} ")?;
                    }
                    // write!(f, "{}", ctxt.parser[*child].with_data(ctxt, data))?;
                    write!(f, "{}", ctxt.parser.get(*child).with_data(ctxt, data))?;
                }
                if need_brackets {
                    write!(f, ")")?;
                }
                Ok(())
            }),
            Pattern => data.with_bind_power(NO_BIND, |data, _| {
                // BIND_POWER is highest
                write!(f, "{{")?;
                for (idx, child) in data.children().iter().enumerate() {
                    if idx != 0 {
                        write!(f, ", ")?;
                    }
                    // write!(f, "{}", ctxt.parser[*child].with_data(ctxt, data))?;
                    write!(f, "{}", ctxt.parser.get(*child).with_data(ctxt, data))?;
                }
                write!(f, "}}")
            }),
            OtherApp | Proof => data.with_bind_power(NO_BIND, |data, _| {
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
                    // write!(f, "{}", ctxt.parser[*child].with_data(ctxt, data))?;
                    write!(f, "{}", ctxt.parser.get(*child).with_data(ctxt, data))?;
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
        let theory = ctxt.parser.strings.resolve(&self.theory);
        let value = ctxt.parser.strings.resolve(&self.value);
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
                write!(f, "{}", self.kind.with_data(ctxt, data))?;
                for idx in 0..self.num_vars {
                    let name = VarNames::get_name(&ctxt.parser.strings, &self.vars, idx);
                    let ty = VarNames::get_type(&ctxt.parser.strings, &self.vars, idx);
                    if idx != 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{name}{ty}")?;
                }
                let sep = if ctxt.use_mathematical_symbols {
                    "."
                } else {
                    " ::"
                };
                write!(f, "{sep}")?;
                for child in data.children() {
                    // write!(f, " {}", ctxt.parser[*child].with_data(ctxt, data))?;
                    write!(f, " {}", ctxt.parser.get(*child).with_data(ctxt, data))?;
                }
                if need_brackets {
                    write!(f, ")")?;
                }
                Ok(())
            })
        })
    }
}

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, DisplayData<'a>> for &'a QuantKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        _data: &mut DisplayData<'a>,
    ) -> fmt::Result {
        if ctxt.use_mathematical_symbols {
            write!(f, "∀ ")?;
        } else {
            write!(f, "FORALL ")?;
        }
        if ctxt.display_quantifier_name {
            write!(f, "\"")?;
            match self {
                QuantKind::Other(kind) => write!(f, "{}", ctxt.parser.strings.resolve(kind))?,
                QuantKind::Lambda => write!(f, "<null>")?,
                QuantKind::NamedQuant(name) => write!(f, "{}", ctxt.parser.strings.resolve(name))?,
                QuantKind::UnnamedQuant { name, id } => {
                    write!(f, "{}!{id}", ctxt.parser.strings.resolve(name))?
                }
            };
            write!(f, "\" ")?;
        }
        Ok(())
    }
}
