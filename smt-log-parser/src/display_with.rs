use std::{borrow::Cow, fmt};

use crate::{formatter::{BindPowerPair, ChildIndex, MatchResult, SubFormatter, TermDisplayContext, QUANT_BIND}, items::*, parsers::z3::z3parser::Z3Parser, NonMaxU32, StringTable};

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
    pub term_display: &'a TermDisplayContext,
    pub config: DisplayConfiguration,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SymbolReplacement {
    Math,
    Code,
    None,
}

impl SymbolReplacement {
    pub fn as_math(self) -> Option<bool> {
        match self {
            SymbolReplacement::Math => Some(true),
            SymbolReplacement::Code => Some(false),
            SymbolReplacement::None => None,
        }
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DisplayConfiguration {
    pub display_term_ids: bool,
    pub display_quantifier_name: bool,
    pub replace_symbols: SymbolReplacement,
    /// Use tags for formatting
    pub html: bool,

    // If `enode_char_limit` is Some, then any term longer than
    // the limit will be truncated.
    pub enode_char_limit: Option<NonMaxU32>,
    pub ast_depth_limit: Option<NonMaxU32>,
}

mod private {
    use crate::formatter::DEFAULT_BIND_POWER;

    use super::*;

    #[derive(Debug, Clone)]
    pub(super) struct DisplayData<'a> {
        pub(super) term: TermIdx,
        children: &'a [TermIdx],
        quant: Vec<&'a Quantifier>,
        bind_power: BindPowerPair,
        ast_depth: u32,
    }
    impl<'a> DisplayData<'a> {
        pub(super) fn new(term: TermIdx) -> Self {
            Self {
                term,
                children: &[],
                quant: Vec::new(),
                bind_power: BindPowerPair::symmetric(DEFAULT_BIND_POWER),
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

        pub(super) fn with_outer_bind_power<'b>(
            &mut self,
            f: &mut fmt::Formatter<'b>,
            bind_power: BindPowerPair,
            inner: impl FnOnce(&mut Self, &mut fmt::Formatter<'b>) -> fmt::Result,
        ) -> fmt::Result {
            let needs_brackets = bind_power.is_smaller(&self.bind_power);
            if needs_brackets {
                write!(f, "(")?;
            }
            inner(self, f)?;
            if needs_brackets {
                write!(f, ")")?;
            }
            Ok(())
        }
        pub(super) fn with_inner_bind_power<'f, 'b, T>(
            &mut self,
            bind_power: BindPowerPair,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.bind_power, bind_power);
            let result = f(self);
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

////////////
// Item Idx defs
////////////

impl DisplayWithCtxt<DisplayCtxt<'_>, Option<QuantIdx>> for TermIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        quant: &mut Option<QuantIdx>,
    ) -> fmt::Result {
        let mut data = DisplayData::new(self);
        if let Some(quant) = quant {
            data.with_quant(&ctxt.parser[*quant], |data| {
                write!(f, "{}", ctxt.parser[self].with_data(ctxt, data))
            })
        } else {
            write!(f, "{}", ctxt.parser[self].with_data(ctxt, &mut data))
        }
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for ENodeIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        _data: &mut (),
    ) -> fmt::Result {
        if let Some(enode_char_limit) = ctxt.config.enode_char_limit {
            let owner = ctxt.parser[self].owner.with_data(ctxt, &mut None).to_string();
            if owner.len() <= enode_char_limit.get() as usize {
                write!(f, "{owner}")
            } else {
                write!(f, "{}...", &owner[..enode_char_limit.get() as usize - 3])
            }
        } else {
            ctxt.parser[self].owner.fmt_with(f, ctxt, &mut None)
        }
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for QuantIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        _data: &mut (),
    ) -> fmt::Result {
        let quant = &ctxt.parser[self];
        if let Some(term) = quant.term {
            term.fmt_with(f, ctxt, &mut None)
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
            QuantKind::Lambda => if matches!(ctxt.config.replace_symbols, SymbolReplacement::Math) {
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
                if ctxt.config.html {
                    write!(f, "<i style=\"color:#666\">")?;
                }
                write!(f, "{}", meaning.with_data(ctxt, data))?;
                if ctxt.config.html {
                    write!(f, "</i>")?;
                }
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
            None | Some(Self::TypeOnly(_)) => Cow::Owned(if matches!(config.replace_symbols, SymbolReplacement::Math) {
                format!("•{idx}")
            } else {
                format!("qvar_{idx}")
            }),
        };
        if config.html {
            const COLORS: [&str; 9] = ["blue", "green", "olive", "maroon", "teal", "purple", "red", "fuchsia", "navy"];
            let color = COLORS[idx % COLORS.len()];
            let name = format!("<span style=\"color:{color}\">{name}</span>");
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

impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a ProofOrApp {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        let name = &ctxt.parser[self.name];
        let children = NonMaxU32::new(data.children().len() as u32).unwrap();
        let match_ = ctxt.term_display.match_str(name, children);
        match_.fmt_with(f, ctxt, data)
    }
}
impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a MatchResult<'a, 'a> {
    fn fmt_with(self, f: &mut fmt::Formatter<'_>, ctxt: &DisplayCtxt<'b>, data: &mut DisplayData<'b>) -> fmt::Result {
        data.with_outer_bind_power(f, self.formatter.bind_power, |data, f| {
            let get_capture = |idx: NonMaxU32| {
                if idx == NonMaxU32::ZERO {
                    Some(self.haystack)
                } else {
                    self.captures.as_ref().and_then(|c| c.get(idx.get() as usize).map(|c| c.as_str()))
                }
            };
            fn get_child(index: ChildIndex, data: &DisplayData) -> Option<usize> {
                if index.0.is_negative() {
                    data.children().len().checked_sub(index.0.wrapping_abs() as u32 as usize)
                } else {
                    let index = index.0 as usize;
                    (index < data.children().len()).then(|| index)
                }
            }
            fn write_formatter<'b, 's>(formatter_outputs: &[SubFormatter], f: &mut fmt::Formatter<'_>, ctxt: &DisplayCtxt<'b>, data: &mut DisplayData<'b>, get_capture: &impl Fn(NonMaxU32) -> Option<&'s str>) -> fmt::Result {
                for output in formatter_outputs {
                    match output {
                        SubFormatter::String(s) =>
                            write!(f, "{s}")?,
                        SubFormatter::Capture(idx) => {
                            let Some(capture) = get_capture(*idx) else {
                                continue;
                            };
                            if let Some(as_math) = ctxt.config.replace_symbols.as_math() {
                                match capture {
                                    "and" if as_math => write!(f, "∧")?,
                                    "and" if !as_math => write!(f, "&&")?,
                                    "or" if as_math => write!(f, "∨")?,
                                    "or" if !as_math => write!(f, "||")?,
                                    "not" if as_math => write!(f, "¬")?,
                                    "not" if !as_math => write!(f, "!")?,
                                    "<=" if as_math => write!(f, "≤")?,
                                    ">=" if as_math => write!(f, "≥")?,
                                    _ => write!(f, "{capture}")?,
                                }
                            } else {
                                write!(f, "{capture}")?
                            }
                        }
                        SubFormatter::Single { index, bind_power } => {
                            let Some(child) = get_child(*index, data) else {
                                continue;
                            };
                            let child = data.children()[child];
                            data.with_inner_bind_power(*bind_power, |data| {
                                display_child(f, child, ctxt, data)
                            })?;
                        }
                        SubFormatter::Repeat(r) => {
                            let (Some(from), Some(to)) = (get_child(r.from, data), get_child(r.to, data)) else {
                                continue;
                            };
                            if !r.from.0.is_negative() && r.to.0.is_negative() && from > to {
                                continue;
                            }
                            if r.from.0.is_negative() && !r.to.0.is_negative() && from < to {
                                continue;
                            }
                            let forwards = from <= to;
                            // The range is inclusive on both ends
                            let mut curr = if forwards { from.wrapping_sub(1) } else { from.wrapping_add(1) };
                            let iter = std::iter::from_fn(move || {
                                if curr == to {
                                    None
                                } else {
                                    curr = if forwards { curr.wrapping_add(1) } else { curr.wrapping_sub(1) };
                                    Some(curr)
                                }
                            });
                            write_formatter(&r.left_sep.outputs, f, ctxt, data, get_capture)?;
                            let mut bind_power = BindPowerPair::asymmetric(r.left, r.middle.left);
                            for child in iter {
                                let is_final = child == to;
                                if is_final {
                                    bind_power.right = r.right;
                                }
                                let child = data.children()[child];
                                data.with_inner_bind_power(bind_power, |data| {
                                    display_child(f, child, ctxt, data)
                                })?;
                                if !is_final {
                                    write_formatter(&r.middle_sep.outputs, f, ctxt, data, get_capture)?;
                                    bind_power.left = r.middle.right;
                                }
                            }
                            write_formatter(&r.right_sep.outputs, f, ctxt, data, get_capture)?;
                        }
                    }
                }
                Ok(())
            }

            write_formatter(&self.formatter.outputs, f, ctxt, data, &get_capture)
        })
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
            data.with_outer_bind_power(f, QUANT_BIND, |data, f| {
                if matches!(ctxt.config.replace_symbols, SymbolReplacement::Math) {
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
                let sep = if matches!(ctxt.config.replace_symbols, SymbolReplacement::Math) {
                    "."
                } else {
                    " ::"
                };
                write!(f, "{sep}")?;
                for child in data.children() {
                    write!(f, " ")?;
                    // TODO: binding power!
                    display_child(f, *child, ctxt, data)?;
                }
                Ok(())
            })
        })
    }
}
