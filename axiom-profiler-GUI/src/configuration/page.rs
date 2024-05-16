use std::{borrow::Cow, rc::Rc};

use smt_log_parser::{display_with::SymbolReplacement, formatter::{self, DeParseTrait, Formatter, Matcher, TermDisplay, TermDisplayContext}, NonMaxUsize};
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

    let term_display_file = file.map(|f| term_display.per_file.get(f).map(Cow::Borrowed).unwrap_or_default());
    let term_display_file = term_display_file.as_ref().map(|td| {
        let f = file.unwrap();
        let cfg = props.cfg.clone();
        let file = f.clone();
        let default = default.per_file.remove(&file).unwrap_or_default();
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
    fallback_parsed: Option<Formatter>,
    tds: Vec<TermDisplayRow>,
    modified: bool,
    apply_valid: bool,
}

pub enum TdcMsg {
    ChangedMatcher(NonMaxUsize, Event),
    ChangedFormatter(Option<NonMaxUsize>, Event),
    Revert,
}

#[derive(Properties, PartialEq)]
struct TermDisplayComponentProps {
    pub td_ctx: TermDisplayContext,
    pub apply: Callback<TermDisplayContext>,
    pub reset: Callback<()>,
}

struct TermDisplayRow {
    matcher: String,
    matcher_ref: NodeRef,
    matcher_err: Option<()>,
    formatter: String,
    formatter_ref: NodeRef,
    parsed: Option<TermDisplay>,
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
            let matcher = td.matcher.deparse_string();
            let formatter = td.formatter.deparse_string();
            TermDisplayRow {
                matcher,
                matcher_ref: NodeRef::default(),
                matcher_err: None,
                formatter,
                formatter_ref: NodeRef::default(),
                parsed: Some(td.clone()),
            }
        }).collect();
        tds.sort_by(|a, b| a.cmp_key().cmp(&b.cmp_key()));
        tds.push(TermDisplayRow {
            matcher: String::new(),
            matcher_ref: NodeRef::default(),
            matcher_err: None,
            formatter: String::new(),
            formatter_ref: NodeRef::default(),
            parsed: None,
        });
        let fallback = ctx.props().td_ctx.fallback();
        Self {
            fallback: fallback.deparse_string(),
            fallback_ref: NodeRef::default(),
            fallback_parsed: Some(fallback.clone()),
            tds,
            modified: false,
            apply_valid: true,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        *self = Self::create(ctx);
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            TdcMsg::ChangedMatcher(_, _) => todo!(),
            TdcMsg::ChangedFormatter(_, _) => todo!(),
            TdcMsg::Revert => {
                *self = Self::create(ctx);
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let tds = self.tds.iter().enumerate().map(|(i, td)| {
            let idx = NonMaxUsize::new(i).unwrap();
            let link = ctx.link().clone();
            let matcher_change = Callback::from(move |e: Event| {
                link.send_message(TdcMsg::ChangedMatcher(idx, e));
            });
            let link = ctx.link().clone();
            let formatter_change = Callback::from(move |e: Event| {
                link.send_message(TdcMsg::ChangedFormatter(Some(idx), e));
            });
            let error = td.parsed.is_none() && i != self.tds.len() - 1;
            let class = if error { "td-row error" } else { "td-row" };
            yew::html! {
                <li {class}>
                    <input ref={&td.matcher_ref} type="text" class="td-matcher" value={td.matcher.clone()} onchange={matcher_change} />
                    <input ref={&td.formatter_ref} type="text" class="td-formatter" value={td.formatter.clone()} onchange={formatter_change} />
                </li>
            }
        });
        let link = ctx.link().clone();
        let formatter_change = Callback::from(move |e: Event| {
            link.send_message(TdcMsg::ChangedFormatter(None, e));
        });
        let fallback = yew::html! {
            <li class="td-row">
                <div class="td-matcher">{"Fallback:"}</div>
                <input ref={&self.fallback_ref} type="text" class="td-formatter" value={self.fallback.clone()} onchange={formatter_change} />
            </li>
        };
        let tds = [fallback].into_iter().chain(tds);
        let apply = ctx.props().apply.clone();
        let modified = self.modified;
        let can_apply = modified && self.apply_valid;
        let apply = Callback::from(move |_| {
            if !can_apply {
                return;
            }
            log::info!("Applying term display");
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
}

impl TermDisplayRow {
    pub fn try_parse(&self) -> Option<TermDisplay> {
        let matcher = self.matcher_ref.cast::<HtmlInputElement>()?;
        let matcher = matcher.value();
        let matcher = self.matcher.parse::<Matcher>().ok()?;
        let formatter = self.formatter_ref.cast::<HtmlInputElement>()?;
        let formatter = formatter.value();
        let formatter = formatter.parse::<Formatter>().ok()?;
        Some(TermDisplay { matcher, formatter })
    }
}
