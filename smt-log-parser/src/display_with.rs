use std::{borrow::Cow, fmt};

use crate::{
    formatter::{
        BindPowerPair, ChildIndex, MatchResult, SubFormatter, TermDisplayContext,
        DEFAULT_BIND_POWER, QUANT_BIND,
    },
    items::*,
    parsers::z3::{
        stm2::EventKind,
        synthetic::{AnyTerm, SynthIdx, SynthTermKind},
        z3parser::Z3Parser,
    },
    NonMaxU32, StringTable,
};

////////////
// General
////////////

pub trait DisplayWithCtxt<Ctxt, Data>: Sized {
    /// Display the term with the given context and data. Should not be used
    /// outside of the implementations of this trait.
    fn fmt_with(self, f: &mut fmt::Formatter<'_>, ctxt: &Ctxt, data: &mut Data) -> fmt::Result;

    /// Wrap the receiver in an object which carries along a parser context to
    /// enable efficient printing of terms. For quick debugging use the `debug`
    /// method instead to avoid building a full context.
    fn with(self, ctxt: &Ctxt) -> DisplayWrapperEmpty<'_, Ctxt, Data, Self>
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

    /// To be used with `TermIdx` or `SynthIdx` where we want to pass in the
    /// surrounding quantifier as `data` such that qvars are printed with names.
    /// Otherwise, always use `with` instead (which uses default `data`).
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

    /// Only use for quickly displaying things when debugging.
    fn debug<'a>(self, parser: &'a Z3Parser) -> String
    where
        Self: DisplayWithCtxt<DisplayCtxt<'a>, Data> + Copy,
        Data: Default,
    {
        static TERM_DISPLAY: std::sync::OnceLock<TermDisplayContext> = std::sync::OnceLock::new();
        let term_display = TERM_DISPLAY.get_or_init(TermDisplayContext::basic);
        let config = DisplayConfiguration::default();
        let ctxt = DisplayCtxt {
            parser,
            term_display,
            config,
        };
        self.with(&ctxt).to_string()
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

#[derive(Clone, Copy)]
pub struct DisplayCtxt<'a> {
    pub parser: &'a Z3Parser,
    pub term_display: &'a TermDisplayContext,
    pub config: DisplayConfiguration,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum SymbolReplacement {
    Math,
    #[default]
    Code,
    /// Display quantifiers and symbols in the smt2 format, using the
    /// [`TermDisplayContext::s_expression`] formatter is recommended.
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

    pub fn is_none(self) -> bool {
        matches!(self, SymbolReplacement::None)
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[cfg_attr(feature = "serde", serde(default))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct DisplayConfiguration {
    pub debug: bool,
    pub display_quantifier_name: bool,
    pub replace_symbols: SymbolReplacement,
    /// Print `SynthTermKind::Generalised` terms as either `_` if true or
    /// `...(_)` if false.
    pub input: Option<bool>,
    /// Use tags for formatting
    #[cfg(feature = "display_html")]
    pub html: bool,
    /// Use the HTML4 `<font>` tag for setting the colour of text. This isn't
    /// supported in HTML5 and may be used for graphviz HTML-like label
    /// compatibility.
    #[cfg(feature = "display_html")]
    pub font_tag: bool,

    // If `enode_char_limit` is Some, then any term longer than
    // the limit will be truncated.
    pub enode_char_limit: Option<NonMaxU32>,
    pub ast_depth_limit: Option<NonMaxU32>,
}

impl DisplayConfiguration {
    pub fn html(&self) -> bool {
        #[cfg(feature = "display_html")]
        return self.html;
        #[cfg(not(feature = "display_html"))]
        return false;
    }
    pub fn font_tag(&self) -> bool {
        #[cfg(feature = "display_html")]
        return self.font_tag;
        #[cfg(not(feature = "display_html"))]
        return false;
    }

    pub fn with_html_italic(
        &self,
        f: &mut fmt::Formatter<'_>,
        rest: impl FnMut(&mut fmt::Formatter) -> fmt::Result,
    ) -> fmt::Result {
        self.with_html_tag(f, "i", None, rest)
    }
    pub fn with_html_colour(
        &self,
        f: &mut fmt::Formatter<'_>,
        colour: &str,
        rest: impl FnMut(&mut fmt::Formatter) -> fmt::Result,
    ) -> fmt::Result {
        let (tag, attribute) = if self.font_tag() {
            ("font", format!("color=\"{colour}\""))
        } else {
            ("span", format!("style=\"color:{colour}\""))
        };
        self.with_html_tag(f, tag, Some(&attribute), rest)
    }

    pub fn with_html_tag(
        &self,
        f: &mut fmt::Formatter<'_>,
        tag: &str,
        attributes: Option<&str>,
        mut rest: impl FnMut(&mut fmt::Formatter<'_>) -> fmt::Result,
    ) -> fmt::Result {
        if self.html() {
            write!(f, "<{tag}")?;
            if let Some(attributes) = attributes {
                write!(f, " {}", attributes)?;
            }
            write!(f, ">")?;
        }
        rest(f)?;
        if self.html() {
            write!(f, "</{tag}>")?;
        }
        Ok(())
    }
}

mod private {
    use super::*;

    #[derive(Debug, Clone)]
    pub(super) struct DisplayData<'a> {
        pub(super) term: SynthIdx,
        children: &'a [SynthIdx],
        quant: Vec<&'a Quantifier>,
        bind_power: BindPowerPair,
        ast_depth: u32,
        newline_spaces: u32,
    }
    impl<'a> DisplayData<'a> {
        pub(super) fn new(term: SynthIdx) -> Self {
            Self {
                term,
                children: &[],
                quant: Vec::new(),
                bind_power: BindPowerPair::symmetric(DEFAULT_BIND_POWER),
                ast_depth: 0,
                newline_spaces: 0,
            }
        }
        pub(super) fn with_children<T>(
            &mut self,
            children: &'a [SynthIdx],
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
        pub(super) fn with_inner_bind_power<T>(
            &mut self,
            bind_power: BindPowerPair,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.bind_power, bind_power);
            let result = f(self);
            self.bind_power = old;
            result
        }
        pub(super) fn with_term<T>(&mut self, term: SynthIdx, f: impl FnOnce(&mut Self) -> T) -> T {
            let term = std::mem::replace(&mut self.term, term);
            let result = f(self);
            self.term = term;
            result
        }

        pub(super) fn children(&self) -> &'a [SynthIdx] {
            self.children
        }
        pub(super) fn find_quant(&self, idx: &mut u32) -> Option<&Quantifier> {
            self.quant
                .iter()
                .rev()
                .find(|q| {
                    let found = q.num_vars > *idx;
                    if !found {
                        *idx -= q.num_vars;
                    }
                    found
                })
                .copied()
        }
        pub(super) fn incr_ast_depth_with_limit<T>(
            &mut self,
            limit: Option<NonMaxU32>,
            f: impl FnOnce(&mut Self) -> T,
        ) -> Option<T> {
            if limit.is_some_and(|limit| self.ast_depth >= limit.get()) {
                return None;
            }
            self.ast_depth += 1;
            let result = f(self);
            self.ast_depth -= 1;
            Some(result)
        }

        pub(super) fn with_indented<'b>(
            &mut self,
            spaces: u32,
            f: &mut fmt::Formatter<'b>,
            inner: impl FnOnce(&mut Self, &mut fmt::Formatter<'b>) -> fmt::Result,
        ) -> fmt::Result {
            self.newline_spaces += spaces;
            write!(f, "\n{: <1$}", "", self.newline_spaces as usize)?;
            let result = inner(self, f);
            self.newline_spaces -= spaces;
            result
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
        SynthIdx::from(self).fmt_with(f, ctxt, quant)
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, Option<QuantIdx>> for SynthIdx {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        quant: &mut Option<QuantIdx>,
    ) -> fmt::Result {
        let mut data = DisplayData::new(self);
        if let Some(quant) = quant {
            data.with_quant(&ctxt.parser[*quant], |data| {
                ctxt.parser[self].fmt_with(f, ctxt, data)
            })
        } else {
            ctxt.parser[self].fmt_with(f, ctxt, &mut data)
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
            let owner = ctxt.parser[self]
                .owner
                .with_data(ctxt, &mut None)
                .to_string();
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
        quant.term.fmt_with(f, ctxt, &mut Some(self))
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
        // let kind = eq.kind_str(&ctxt.parser.strings);
        // write!(f, "{kind}: ")?;
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
        if ctxt.config.html() {
            write!(f, " =<sup>")?;
        } else {
            write!(f, " =[ ")?;
        }
        if let Some(len) = ctxt.parser[self].given_len {
            write!(f, "{len}")?;
        } else {
            write!(f, "?")?;
        }
        if ctxt.config.html() {
            write!(f, "</sup> ")?;
        } else {
            write!(f, "] ")?;
        }
        path.last().unwrap().fmt_with(f, ctxt, data)
    }
}

impl DisplayWithCtxt<DisplayCtxt<'_>, ()> for Assignment {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'_>,
        _data: &mut (),
    ) -> fmt::Result {
        write!(f, "{} = {}", self.value, self.literal.with(ctxt))
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
                write!(f, "[MBQI] ")?;
                quant.fmt_with(f, ctxt, data)
            }
            MatchKind::TheorySolving { axiom_id, .. } => {
                write!(f, "[TheorySolving] ")?;
                axiom_id.fmt_with(f, ctxt, data)?;
                Ok(())
            }
            MatchKind::Axiom { axiom, .. } => {
                write!(f, "[Ax] ")?;
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
            QuantKind::Lambda(_) => {
                if matches!(ctxt.config.replace_symbols, SymbolReplacement::Math) {
                    write!(f, "λ")
                } else if ctxt.config.html() {
                    write!(f, "&lt;null&gt;")
                } else {
                    write!(f, "<null>")
                }
            }
            QuantKind::NamedQuant(name) => write!(f, "{}", &ctxt.parser[name]),
            QuantKind::UnnamedQuant { name, id, .. } => {
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
        self.as_any().fmt_with(f, ctxt, data)
    }
}
impl<'a: 'b, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a AnyTerm {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        data.with_children(self.child_ids(), |data| {
            if ctxt.config.debug {
                match self.id() {
                    Some(id) => write!(f, "[{}]", id.with(ctxt))?,
                    None => write!(f, "[synth]")?,
                }
            }
            let meaning = ctxt
                .parser
                .as_tidx(data.term)
                .and_then(|tidx| ctxt.parser.meaning(tidx));
            let meaning = meaning.or(match self {
                AnyTerm::Constant(meaning) => Some(meaning),
                _ => None,
            });
            if let Some(meaning) = meaning {
                meaning.fmt_with(f, ctxt, data)
            } else {
                self.kind().fmt_with(f, ctxt, data)
            }
        })
    }
}

impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a SynthTermKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        match self {
            SynthTermKind::Parsed(kind) => kind.fmt_with(f, ctxt, data),
            SynthTermKind::Generalised => {
                let synth_idx = data.children()[0];
                match ctxt.config.input {
                    Some(true) => write!(f, "⭐"),
                    // Colour the generalised term in blue
                    Some(false) => ctxt
                        .config
                        .with_html_colour(f, "#4285f4", |f| synth_idx.fmt_with(f, ctxt, &mut None)),
                    None => {
                        write!(f, "[⭐ → ")?;
                        ctxt.config.with_html_colour(f, "#4285f4", |f| {
                            synth_idx.fmt_with(f, ctxt, &mut None)
                        })?;
                        write!(f, "]")
                    }
                }
            }
            SynthTermKind::Variable(var) => write!(f, "${var}"),
            SynthTermKind::Input(offset) => match offset {
                Some(offset) => {
                    offset.fmt_with(f, ctxt, &mut None)?;
                    write!(f, " + ⭐")
                }
                None => write!(f, "⭐"),
            },
            SynthTermKind::Constant => write!(f, "CONST"),
        }
    }
}

impl<'a: 'b, 'b> DisplayWithCtxt<DisplayCtxt<'b>, ()> for &'a TermId {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        _data: &mut (),
    ) -> fmt::Result {
        let (namespace, id) = self.to_string_components(&ctxt.parser.strings);
        write!(f, "{namespace}#")?;
        if let Some(id) = id {
            write!(f, "{id}")
        } else {
            Ok(())
        }
    }
}

pub struct VarName<F: Fn(&mut fmt::Formatter) -> fmt::Result>(F);
impl<F: Fn(&mut fmt::Formatter) -> fmt::Result> fmt::Display for VarName<F> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        (self.0)(f)
    }
}

impl VarNames {
    pub fn get_name<'a>(
        strings: &'a StringTable,
        this: Option<&Self>,
        idx: usize,
        config: DisplayConfiguration,
    ) -> VarName<impl Fn(&mut fmt::Formatter) -> fmt::Result + 'a> {
        let name = match this {
            Some(Self::NameAndType(names)) => Cow::Borrowed(&strings[*names[idx].0]),
            None | Some(Self::TypeOnly(_)) => Cow::Owned(
                if matches!(config.replace_symbols, SymbolReplacement::Math) {
                    format!("•{idx}")
                } else {
                    format!("_{idx}")
                },
            ),
        };

        #[cfg(feature = "display_html")]
        {
            let mut colour = None;
            let name = if config.html() {
                const COLOURS: [&str; 9] = [
                    "blue", "green", "olive", "maroon", "teal", "purple", "red", "fuchsia", "navy",
                ];
                colour = Some(COLOURS[idx % COLOURS.len()]);
                use std::borrow::Borrow;
                let name = ammonia::clean_text(name.borrow());
                Cow::Owned(name)
            } else {
                name
            };
            VarName(move |f| {
                if let Some(colour) = colour {
                    config.with_html_colour(f, colour, |f| write!(f, "{name}"))
                } else {
                    write!(f, "{name}")
                }
            })
        }
        #[cfg(not(feature = "display_html"))]
        VarName(move |f| write!(f, "{name}"))
    }
}

impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a TermKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        match *self {
            TermKind::Var(mut idx) => {
                let vars = data.find_quant(&mut idx).and_then(|q| q.vars.as_ref());
                let name =
                    VarNames::get_name(&ctxt.parser.strings, vars, idx as usize, ctxt.config);
                write!(f, "{name}")
            }
            TermKind::App(name) => {
                let name = &ctxt.parser[name];
                let children = NonMaxU32::new(data.children().len() as u32).unwrap();
                let match_ = ctxt.term_display.match_str(name, children);
                match_.fmt_with(f, ctxt, data)
            }
            TermKind::Quant(idx) => ctxt.parser[idx].fmt_with(f, ctxt, data),
        }
    }
}

fn display_child<'b>(
    f: &mut fmt::Formatter<'_>,
    child: SynthIdx,
    ctxt: &DisplayCtxt<'b>,
    data: &mut DisplayData<'b>,
) -> fmt::Result {
    let cterm = &ctxt.parser[child];
    let mut display =
        |data: &mut DisplayData<'b>| data.with_term(child, |data| cterm.fmt_with(f, ctxt, data));
    if cterm.child_ids().is_empty() {
        display(data)
    } else {
        data.incr_ast_depth_with_limit(ctxt.config.ast_depth_limit, display)
            .unwrap_or_else(|| write!(f, "..."))
    }
}

impl<'a, 'b> DisplayWithCtxt<DisplayCtxt<'b>, DisplayData<'b>> for &'a MatchResult<'a, 'a> {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'b>,
        data: &mut DisplayData<'b>,
    ) -> fmt::Result {
        data.with_outer_bind_power(f, self.formatter.bind_power, |data, f| {
            let get_capture = |idx: NonMaxU32| {
                if idx == NonMaxU32::ZERO {
                    Some(self.haystack)
                } else {
                    self.captures
                        .as_ref()
                        .and_then(|c| c.get(idx.get() as usize).map(|c| c.as_str()))
                }
            };
            fn get_child(index: ChildIndex, data: &DisplayData) -> Option<usize> {
                if index.0.is_negative() {
                    data.children()
                        .len()
                        .checked_sub(index.0.wrapping_abs() as u32 as usize)
                } else {
                    let index = index.0 as usize;
                    (index < data.children().len()).then_some(index)
                }
            }
            fn write_formatter<'b, 's>(
                formatter_outputs: &[SubFormatter],
                f: &mut fmt::Formatter<'_>,
                ctxt: &DisplayCtxt<'b>,
                data: &mut DisplayData<'b>,
                get_capture: &impl Fn(NonMaxU32) -> Option<&'s str>,
            ) -> fmt::Result {
                for output in formatter_outputs {
                    match output {
                        SubFormatter::String(s) => write!(f, "{s}")?,
                        SubFormatter::Capture(idx) => {
                            let Some(capture) = get_capture(*idx) else {
                                continue;
                            };
                            let capture =
                                if let Some(as_math) = ctxt.config.replace_symbols.as_math() {
                                    match capture {
                                        "and" if as_math => "∧",
                                        "and" if !as_math => "&&",
                                        "or" if as_math => "∨",
                                        "or" if !as_math => "||",
                                        "not" if as_math => "¬",
                                        "not" if !as_math => "!",
                                        "<=" if as_math => "≤",
                                        ">=" if as_math => "≥",
                                        _ => capture,
                                    }
                                } else {
                                    capture
                                };
                            #[cfg(feature = "display_html")]
                            let capture = if ctxt.config.html() {
                                Cow::Owned(ammonia::clean_text(capture))
                            } else {
                                Cow::Borrowed(capture)
                            };
                            write!(f, "{capture}")?;
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
                            let (Some(from), Some(to)) =
                                (get_child(r.from, data), get_child(r.to, data))
                            else {
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
                            let mut curr = if forwards {
                                from.wrapping_sub(1)
                            } else {
                                from.wrapping_add(1)
                            };
                            let iter = std::iter::from_fn(move || {
                                if curr == to {
                                    None
                                } else {
                                    curr = if forwards {
                                        curr.wrapping_add(1)
                                    } else {
                                        curr.wrapping_sub(1)
                                    };
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
                                    write_formatter(
                                        &r.middle_sep.outputs,
                                        f,
                                        ctxt,
                                        data,
                                        get_capture,
                                    )?;
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
        let fn_ = |f: &mut fmt::Formatter| match self {
            Meaning::Arith(value) => write!(f, "{value}"),
            &Meaning::Unknown { theory, value } => {
                write!(f, "/{} {}\\", &ctxt.parser[theory], &ctxt.parser[value])
            }
        };
        // The text block inside graphviz messes up the text alignment,
        // skip it in that case.
        if ctxt.config.font_tag() {
            fn_(f)
        } else {
            ctxt.config
                .with_html_colour(f, "#666666", |f| ctxt.config.with_html_italic(f, fn_))
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
                let Some((body, patterns)) = data.children().split_last() else {
                    return write!(f, "lambda");
                };
                // Print the variables in reverse since they are logged in
                // reverse for some reason.
                let vars = (0..self.num_vars).rev().map(|idx| {
                    let name = VarNames::get_name(
                        &ctxt.parser.strings,
                        self.vars.as_ref(),
                        idx as usize,
                        ctxt.config,
                    );
                    let ty =
                        VarNames::get_type(&ctxt.parser.strings, self.vars.as_ref(), idx as usize);
                    (idx != self.num_vars - 1, name, ty)
                });
                if ctxt.config.replace_symbols.is_none() {
                    write!(f, "(forall (")?;
                    for (not_first, name, ty) in vars {
                        if not_first {
                            write!(f, " ")?;
                        }
                        write!(f, "({name} {})", ty.unwrap_or("?"))?;
                    }
                    write!(f, ") (!")?;
                    data.with_indented(2, f, |data, f| display_child(f, *body, ctxt, data))?;
                    for &pattern in patterns.iter() {
                        data.with_indented(2, f, |data, f| display_child(f, pattern, ctxt, data))?;
                    }
                    if let Some(name) = self.kind.user_name() {
                        data.with_indented(2, f, |_, f| write!(f, ":qid {}", &ctxt.parser[name]))?;
                    }
                    data.with_indented(0, f, |_, f| write!(f, "))"))?;
                } else {
                    let (start, sep) = match ctxt.config.replace_symbols {
                        SymbolReplacement::Math => ("∀", "."),
                        SymbolReplacement::Code => ("FORALL", " ::"),
                        SymbolReplacement::None => unreachable!(),
                    };
                    write!(f, "{} ", start)?;
                    if ctxt.config.display_quantifier_name {
                        write!(f, "\"{}\" ", self.kind.with(ctxt))?;
                    }
                    for (not_first, name, ty) in vars {
                        if not_first {
                            write!(f, ", ")?;
                        }
                        write!(f, "{name}")?;
                        if let Some(ty) = ty {
                            write!(f, ": {ty}")?;
                        }
                    }
                    write!(f, "{sep} ")?;
                    for &pattern in patterns.iter() {
                        display_child(f, pattern, ctxt, data)?;
                        write!(f, " ")?;
                    }
                    // TODO: binding power!
                    display_child(f, *body, ctxt, data)?;
                }
                Ok(())
            })
        })
    }
}

impl<'a> DisplayWithCtxt<DisplayCtxt<'a>, ()> for &'a EventKind {
    fn fmt_with(
        self,
        f: &mut fmt::Formatter<'_>,
        ctxt: &DisplayCtxt<'a>,
        _data: &mut (),
    ) -> fmt::Result {
        match *self {
            EventKind::NewConst(term_idx) => {
                let term = &ctxt.parser[term_idx];
                let name = &ctxt.parser[term.kind.app_name().unwrap()];
                if term.child_ids.is_empty() {
                    write!(f, "(declare-const {name} ?)")
                } else {
                    write!(f, "(declare-fun {name} (?")?;
                    for _ in 0..term.child_ids.len() - 1 {
                        write!(f, " ?")?;
                    }
                    write!(f, ") ?)")
                }
            }
            EventKind::Assert(proof_idx) => {
                let proof = &ctxt.parser[proof_idx];
                let display = proof.result.with(ctxt);
                write!(f, "(assert {display})")
            }
            EventKind::Push => write!(f, "(push)"),
            EventKind::Pop(num) => match num {
                Some(num) => write!(f, "(pop {})", num.get()),
                None => write!(f, "(pop)"),
            },
            EventKind::BeginCheck => write!(f, "(check-sat)"),
        }
    }
}
