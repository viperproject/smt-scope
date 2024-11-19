use std::rc::Rc;

use smt_log_parser::display_with::SymbolReplacement;
use wasm_bindgen::JsCast;
use yew::{function_component, use_context, use_effect_with_deps, Callback, Event, Html};

use crate::configuration::{Configuration, ConfigurationProvider, TermDisplayFlag};

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
                        $(<option value={$to}>{if $to == default_to { concat!($to, " (default)") } else { $to }}</option>)+
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
    let (debug, effect, deps) = flag_widget!(
        cfg,
        default,
        display.debug,
        "Debug mode",
        "Display extra information useful for developers of this tool. For example, shows the IDs (e.g. `#123`) of the terms as they appear in the log file.",
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
            {debug}
            {replace_symbols}
            <TermDisplayFlag cfg={cfg.clone()} />
        </div></div>
    }
}
