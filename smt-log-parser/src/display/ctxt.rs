use std::fmt;

use crate::{
    items::*,
    parsers::z3::{synthetic::SynthIdx, Z3Parser},
    NonMaxU32,
};

use super::{BindPowerPair, TermDisplayContext, DEFAULT_BIND_POWER};

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
    pub struct DisplayData<'a> {
        pub term: SynthIdx,
        children: &'a [SynthIdx],
        quant: Vec<&'a Quantifier>,
        bind_power: BindPowerPair,
        ast_depth: u32,
        newline_spaces: u32,
    }
    impl<'a> DisplayData<'a> {
        pub fn new(term: SynthIdx) -> Self {
            Self {
                term,
                children: &[],
                quant: Vec::new(),
                bind_power: BindPowerPair::symmetric(DEFAULT_BIND_POWER),
                ast_depth: 0,
                newline_spaces: 0,
            }
        }
        pub fn with_children<T>(
            &mut self,
            children: &'a [SynthIdx],
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.children, children);
            let result = f(self);
            self.children = old;
            result
        }
        pub fn with_quant<T>(
            &mut self,
            quant: &'a Quantifier,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            self.quant.push(quant);
            let result = f(self);
            self.quant.pop();
            result
        }

        pub fn with_outer_bind_power<'b>(
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
        pub fn with_inner_bind_power<T>(
            &mut self,
            bind_power: BindPowerPair,
            f: impl FnOnce(&mut Self) -> T,
        ) -> T {
            let old = std::mem::replace(&mut self.bind_power, bind_power);
            let result = f(self);
            self.bind_power = old;
            result
        }
        pub fn with_term<T>(&mut self, term: SynthIdx, f: impl FnOnce(&mut Self) -> T) -> T {
            let term = std::mem::replace(&mut self.term, term);
            let result = f(self);
            self.term = term;
            result
        }

        pub fn children(&self) -> &'a [SynthIdx] {
            self.children
        }
        pub fn find_quant(&self, idx: &mut NonMaxU32) -> Option<&Quantifier> {
            self.quant
                .iter()
                .rev()
                .find(|q| {
                    if let Some(new) = idx.get().checked_sub(q.num_vars.get()) {
                        *idx = NonMaxU32::new(new).unwrap();
                        false
                    } else {
                        true
                    }
                })
                .copied()
        }
        pub fn incr_ast_depth_with_limit<T>(
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

        pub fn with_indented<'b>(
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

pub(super) use private::*;
