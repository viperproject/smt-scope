use core::fmt;
use std::{borrow::Cow, rc::Rc};

use smt_log_parser::{display_with::SymbolReplacement, formatter::{ConversionError, DeParseTrait, FallbackFormatter, FallbackParseError, Formatter, FormatterParseError, Matcher, TdcError, TermDisplay, TermDisplayContext}, NonMaxUsize};
use wasm_bindgen::JsCast;
use web_sys::HtmlInputElement;
use yew::{function_component, prelude::Context, use_context, use_effect_with_deps, Callback, Component, Event, Html, NodeRef, Properties};

use crate::{configuration::{Configuration, ConfigurationProvider, TermDisplayContextFiles}, state::{FileInfo, StateProvider}};

macro_rules! flag_widget {
    ($cfg:ident, $default:ident, $($access:ident).+, $title:expr, $description:expr, $($from:ident => $to:literal),+$(,)?) => {
        {
            let id = stringify!(cfg.$($access).+);
            let curr = &(($cfg).config.$($access).+);
            let curr_to = match curr {
                $($from => $to,)+
            };
            let effect = move |curr_to| {
                let element = gloo::utils::document().get_element_by_id(id);
                let element = element.and_then(|t| t.dyn_into::<web_sys::HtmlSelectElement>().ok());
                if let Some(element) = element {
                    element.set_value(curr_to);
                };
                || {}
            };
            let deps = curr_to;
            let default = $default.$($access).+;
            let default_to = match &default {
                $($from => $to,)+
            };
            let cfg_update = $cfg.update.clone();
            let onchange = Callback::from(move |e: Event| {
                e.prevent_default();
                let Some(target) = e.target().and_then(|t| t.dyn_into::<web_sys::HtmlSelectElement>().ok()) else {
                    return;
                };
                cfg_update.update(move |cfg| {
                    let new_value = match target.value().as_str() {
                        $($to => $from,)+
                        _ => unreachable!(),
                    };
                    let old_value = &mut cfg.$($access).*;
                    if old_value != &new_value {
                        *old_value = new_value;
                        true
                    } else {
                        false
                    }
                });
            });
            (yew::html! {
                <div class="flag-widget">
                    <label>{$title}</label>
                    <select {id} {onchange}>
                        $(<option value={$to}>{if $to == default_to { concat!("Default (", $to, ")") } else { $to }}</option>)+
                    </select>
                    <div class="description">{$description}</div>
                </div>
            }, effect, deps)
        }
    };
}

#[function_component]
pub fn Flags(_props: &()) -> Html {
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let cfg_update = cfg.update.clone();
    let reset = Callback::from(move |_| cfg_update.reset());
    let default = Configuration::default();
    let (display_term_ids, effect, deps) = flag_widget!(
        cfg,
        default,
        display.display_term_ids,
        "Display term IDs",
        "Display the IDs (e.g. `#123`) of the terms as they appear in the log file in the UI.",
        true => "Enabled",
        false => "Disabled"
    );
    use_effect_with_deps(move |deps| effect(deps), deps);
    use SymbolReplacement::*;
    let (replace_symbols, effect, deps) = flag_widget!(
        cfg,
        default,
        display.replace_symbols,
        "Symbol replacement",
        "Replace some symbols (e.g. \"not\", \"and\", \"<=\") in the UI with their corresponding mathematical or code representation.",
        Math => "Mathematical",
        Code => "Code",
        None => "Disabled",
    );
    use_effect_with_deps(move |deps| effect(deps), deps);

    yew::html! {
        <div class="flags-page"><div class="flags-content">
            <h1>{"Configuration flags"}</h1>
            <button onclick={reset}>{"Reset configuration"}</button>
            {display_term_ids}
            {replace_symbols}
            <TermDisplayFlag cfg={cfg.clone()} />
        </div></div>
    }
}

#[derive(Properties, Clone)]
pub struct TermDisplayFlagProps {
    pub cfg: Rc<ConfigurationProvider>,
}

impl PartialEq for TermDisplayFlagProps {
    fn eq(&self, other: &Self) -> bool {
        self.cfg.config.term_display == other.cfg.config.term_display
    }
}

#[function_component]
pub fn TermDisplayFlag(props: &TermDisplayFlagProps) -> Html {
    let term_display = &props.cfg.config.term_display;
    let mut default = TermDisplayContextFiles::default();
    let data = use_context::<Rc<StateProvider>>().unwrap();
    let file = data.state.file_info.as_ref();

    let term_display_general = &term_display.general;
    let cfg = props.cfg.clone();
    let apply = Callback::from(move |new| cfg.update_term_display(None, new));
    let cfg = props.cfg.clone();
    let reset = Callback::from(move |_| cfg.update_term_display(None, default.general.clone()));
    let general = term_display_file_to_html((term_display_general, apply, reset, None));

    let term_display_file = file.map(|f| term_display.per_file.get(&f.name).map(Cow::Borrowed).unwrap_or_default());
    let term_display_file = term_display_file.as_ref().map(|td| {
        let f = file.unwrap();
        let cfg = props.cfg.clone();
        let file = f.clone();
        let default = default.per_file.remove(&file.name).unwrap_or_default();
        let reset = Callback::from(move |_| cfg.update_term_display(Some(file.clone()), default.clone()));
        let cfg = props.cfg.clone();
        let file = f.clone();
        let apply = Callback::from(move |new| cfg.update_term_display(Some(file.clone()), new));
        (td.as_ref(), apply, reset, Some(f))
    });
    let file = term_display_file.map(term_display_file_to_html);
    yew::html! {
        <>{general}{file}</>
    }
}

fn term_display_file_to_html((td_ctx, apply, reset, file): (&TermDisplayContext, Callback<TermDisplayContext>, Callback<()>, Option<&FileInfo>)) -> Html {
    let title = if let Some(file) = file {
        format!("Term Formatting ({})", file.name)
    } else {
        "Term Formatting (Global)".to_string()
    };
    let description = if file.is_some() {
        "Formatting rules for the specified file. Replaces any global rules which match identically."
    } else {
        "Configure how to pretty print terms in the UI. If no matching formatting rule is found for a term, it is printed as a function application."
    };
    yew::html! {
        <div class="flag-widget term-display">
            <label>{title}</label>
            <div class="description">{description}</div>
            <TermDisplayComponent td_ctx={td_ctx.clone()} apply={apply} reset={reset} />
        </div>
    }
}

struct TermDisplayComponent {
    fallback: String,
    fallback_ref: NodeRef,
    fallback_parsed: Result<FallbackFormatter, FallbackParseError>,
    tds: Vec<TermDisplayRow>,
    parsed: Option<Result<TermDisplayContext, TdcError>>,
    modified: bool,
    focused: Option<(NonMaxUsize, bool)>,
}

pub enum TdcMsg {
    ChangedRow(NonMaxUsize, bool, Event),
    ChangedFallback(Event),
    Revert,
    Apply,
    OnFocus(NonMaxUsize, bool),
    OnBlur(NonMaxUsize, bool),
}

#[derive(Properties, PartialEq)]
struct TermDisplayComponentProps {
    pub td_ctx: TermDisplayContext,
    pub apply: Callback<TermDisplayContext>,
    pub reset: Callback<()>,
}

#[derive(Debug)]
struct TermDisplayRow {
    matcher: String,
    matcher_ref: NodeRef,
    matcher_err: Option<ConversionError>,
    formatter: String,
    formatter_ref: NodeRef,
    formatter_err: Option<FormatterParseError>,
    parsed: Option<Result<TermDisplay, ConversionError>>,
}

impl TermDisplayRow {
    pub fn cmp_key(&self) -> impl Ord + '_ {
        match self.matcher.as_bytes() {
            [b'/', ..] => Err(1),
            [b'(', b'/', ..] => Err(0),
            [b'(', ..] => Ok((0, &self.matcher)),
            _ => Ok((1, &self.matcher)),
        }
    }
}

impl Component for TermDisplayComponent {
    type Message = TdcMsg;
    type Properties = TermDisplayComponentProps;

    fn create(ctx: &Context<Self>) -> Self {
        let mut tds: Vec<_> = ctx.props().td_ctx.all().map(|td| {
            let (matcher, formatter) = td.deparse_string();
            TermDisplayRow {
                matcher,
                matcher_ref: NodeRef::default(),
                matcher_err: None,
                formatter,
                formatter_ref: NodeRef::default(),
                formatter_err: None,
                parsed: Some(Ok(td.clone())),
            }
        }).collect();
        tds.sort_by(|a, b| a.cmp_key().cmp(&b.cmp_key()));
        let fallback = ctx.props().td_ctx.fallback();
        let mut self_ = Self {
            fallback: fallback.formatter().deparse_string(),
            fallback_ref: NodeRef::default(),
            fallback_parsed: Ok(fallback.clone()),
            tds,
            parsed: Some(Ok(ctx.props().td_ctx.clone())),
            modified: false,
            focused: None,
        };
        self_.check_last_td();
        self_
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        *self = Self::create(ctx);
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            TdcMsg::ChangedRow(idx, _matcher, _e) => {
                let td = &mut self.tds[idx.get()];
                td.try_parse();
                self.try_parse();
                self.modified = !self.parsed.as_ref().is_some_and(|p| p.as_ref().is_ok_and(|tdc| tdc == &ctx.props().td_ctx));

                if idx.get() == self.tds.len() - 1 {
                    self.check_last_td();
                }
                true
            }
            TdcMsg::ChangedFallback(_e) => {
                let fallback = self.fallback_ref.cast::<HtmlInputElement>().unwrap();
                self.fallback = fallback.value();
                self.fallback_parsed = self.fallback.parse::<FallbackFormatter>();
                self.try_parse();
                self.modified = !self.parsed.as_ref().is_some_and(|p| p.as_ref().is_ok_and(|tdc| tdc == &ctx.props().td_ctx));
                true
            }
            TdcMsg::Revert => {
                *self = Self::create(ctx);
                true
            }
            TdcMsg::Apply => {
                ctx.props().apply.emit(self.parsed.clone().unwrap().unwrap());
                false
            }
            TdcMsg::OnFocus(idx, matcher) => {
                self.focused = Some((idx, matcher));
                false
            }
            TdcMsg::OnBlur(idx, matcher) => {
                if self.focused == Some((idx, matcher)) {
                    self.focused = None;
                }
                false
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let tds = self.tds.iter().enumerate().map(|(i, td)| {
            let mut errors = Vec::new();
            let idx = NonMaxUsize::new(i).unwrap();
            let link = ctx.link().clone();
            let matcher_change = Callback::from(move |e: Event| {
                let link = link.clone();
                gloo::timers::callback::Timeout::new(10, move || link.send_message(TdcMsg::ChangedRow(idx, true, e))).forget();
            });
            let link = ctx.link().clone();
            let matcher_focus = Callback::from(move |_| {
                link.send_message(TdcMsg::OnFocus(idx, true));
            });
            let link = ctx.link().clone();
            let matcher_blur = Callback::from(move |_| {
                link.send_message(TdcMsg::OnBlur(idx, true));
            });
            let matcher_class = if td.matcher_err.is_some() { "td-matcher error" } else { "td-matcher" };
            td.matcher_err.as_ref().map(AnyError::Matcher).map(|e| errors.push(e));

            let link = ctx.link().clone();
            let formatter_change = Callback::from(move |e: Event| {
                let link = link.clone();
                gloo::timers::callback::Timeout::new(10, move || link.send_message(TdcMsg::ChangedRow(idx, false, e))).forget();
            });
            let link = ctx.link().clone();
            let formatter_focus = Callback::from(move |_| {
                link.send_message(TdcMsg::OnFocus(idx, false));
            });
            let link = ctx.link().clone();
            let formatter_blur = Callback::from(move |_| {
                link.send_message(TdcMsg::OnBlur(idx, false));
            });
            let formatter_class = if td.formatter_err.is_some() { "td-formatter error" } else { "td-formatter" };
            td.formatter_err.as_ref().map(AnyError::Formatter).map(|e| errors.push(e));

            let error = td.parsed.as_ref().is_some_and(|p| p.is_err());
            let class = if error { "td-row error" } else { "td-row" };
            td.parsed.as_ref().map(|p| p.as_ref().map_err(AnyError::TermDisplay).map_err(|e| errors.push(e)));
            yew::html! {
                <li {class}>
                    <input ref={&td.matcher_ref} type="text" class={matcher_class} value={td.matcher.clone()} onchange={matcher_change} onfocus={matcher_focus} onblur={matcher_blur} />
                    <input ref={&td.formatter_ref} type="text" class={formatter_class} value={td.formatter.clone()} onchange={formatter_change} onfocus={formatter_focus} onblur={formatter_blur} />
                    {error_tooltip(errors)}
                </li>
            }
        });
        let link = ctx.link().clone();
        let formatter_change = Callback::from(move |e: Event| {
            link.send_message(TdcMsg::ChangedFallback(e));
        });
        let formatter_class = if self.fallback_parsed.is_err() { "td-formatter error" } else { "td-formatter" };
        let fallback = yew::html! {
            <li class="td-row">
                <div class="td-matcher">{"Fallback:"}</div>
                <input ref={&self.fallback_ref} type="text" class={formatter_class} value={self.fallback.clone()} onchange={formatter_change} />
                {error_tooltip(self.fallback_parsed.as_ref().err().into_iter().map(AnyError::Fallback).collect())}
            </li>
        };
        let tds = [fallback].into_iter().chain(tds);
        let modified = self.modified;
        let can_apply = modified && self.fallback_parsed.is_ok() && self.tds.iter().all(|td|
            td.is_empty() || td.parsed.as_ref().is_some_and(|p| p.is_ok())
        );
        let link = ctx.link().clone();
        let apply = Callback::from(move |_| {
            if !can_apply {
                return;
            }
            link.send_message(TdcMsg::Apply);
        });
        let link = ctx.link().clone();
        let revert = Callback::from(move |_| {
            if !modified {
                return;
            }
            link.send_message(TdcMsg::Revert);
        });
        let reset = ctx.props().reset.clone();
        let reset = Callback::from(move |_| reset.emit(()));
        yew::html! {
            <><ul class="td">
                {for tds}
            </ul>
            <div class="td-buttons">
                <button onclick={reset}>{"Reset to default"}</button>
                <button disabled={!modified} onclick={revert}>{"Revert changes"}</button>
                <button disabled={!can_apply} onclick={apply}>{"Apply"}</button>
            </div>
            </>
        }
    }

    fn rendered(&mut self, _ctx: &Context<Self>, _first_render: bool) {
        if let Some((idx, matcher)) = self.focused {
            let td = &self.tds[idx.get()];
            let ref_ = if matcher { &td.matcher_ref } else { &td.formatter_ref };
            if let Some(element) = ref_.cast::<HtmlInputElement>() {
                element.focus().ok();
                element.select();
            }
        }
    }
}

impl TermDisplayComponent {
    pub fn try_parse(&mut self) {
        self.parsed = None;
        let Ok(fallback) = &self.fallback_parsed else {
            return;
        };
        let all_td_ok = self.tds.iter().all(|td| td.is_empty() || td.parsed.as_ref().is_some_and(|p| p.is_ok()));
        if !all_td_ok {
            return;
        }

        let tds = self.tds.iter().flat_map(|td| &td.parsed).map(|p| p.as_ref().unwrap().clone());
        let mut tdc: Result<TermDisplayContext, _> = tds.collect();
        if let Ok(tdc) = &mut tdc {
            tdc.set_fallback(fallback.clone());
        }
        self.parsed = Some(tdc);
    }

    pub fn check_last_td(&mut self) {
        if !self.tds.last().is_some_and(|td| td.is_empty()) {
            self.tds.push(TermDisplayRow {
                matcher: String::new(),
                matcher_ref: NodeRef::default(),
                matcher_err: None,
                formatter: String::new(),
                formatter_ref: NodeRef::default(),
                formatter_err: None,
                parsed: None,
            });
        }
    }
}

impl TermDisplayRow {
    pub fn try_parse(&mut self) -> Option<()> {
        let matcher = self.matcher_ref.cast::<HtmlInputElement>()?;
        self.matcher = matcher.value();
        let formatter = self.formatter_ref.cast::<HtmlInputElement>()?;
        self.formatter = formatter.value();

        let matcher = self.matcher.parse::<Matcher>();
        let formatter = self.formatter.parse::<Formatter>();

        self.matcher_err = None;
        self.formatter_err = None;
        self.parsed = None;

        match (matcher, formatter) {
            (Ok(matcher), Ok(formatter)) => {
                if !self.is_empty() {
                    self.parsed = Some(TermDisplay::new(matcher, formatter));
                }
            }
            (Err(matcher), Err(formatter)) => {
                self.matcher_err = Some(matcher);
                self.formatter_err = Some(formatter);
            }
            (Err(matcher), Ok(_)) => {
                self.matcher_err = Some(matcher);
            }
            (Ok(_), Err(formatter)) => {
                self.formatter_err = Some(formatter);
            }
        }
        Some(())
    }

    pub fn is_empty(&self) -> bool {
        self.matcher.is_empty() && self.formatter.is_empty()
    }
}

#[derive(Debug)]
pub enum AnyError<'a> {
    Matcher(&'a ConversionError),
    Formatter(&'a FormatterParseError),
    TermDisplay(&'a ConversionError),
    Fallback(&'a FallbackParseError),
}

impl fmt::Display for AnyError<'_> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        // TODO: add a proper display here
        write!(f, "{self:?}")
    }
}

pub fn error_tooltip(errors: Vec<AnyError<'_>>) -> Html {
    let title = errors.iter().map(AnyError::to_string).collect::<Vec<_>>().join("\n");
    let class = if errors.is_empty() { "td-error" } else { "td-error error" };
    yew::html! {
        <div {title} {class}>{if errors.is_empty() { "" } else { "❌" }}</div>
    }
}
