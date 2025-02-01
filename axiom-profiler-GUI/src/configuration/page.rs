use std::rc::Rc;

use smt_log_parser::{display::SymbolReplacement, F64Ord, NonMaxU32};
use wasm_bindgen::JsCast;
use yew::{
    function_component, use_context, use_effect_with_deps, Callback, Event, Html, Properties,
};

use crate::{
    configuration::{Configuration, ConfigurationProvider, TermDisplayFlag},
    screen::homepage::FileInfo,
};

macro_rules! flag_widget {
    ($cfg:ident, $default:ident, $($access:ident).+, $title:expr, $description:expr, $($from:ident => $to:literal),* $(,)? $(| $(if $from_e:expr => $to_e:literal),+ $(,)?)?) => {
        {
            let id = stringify!(cfg.$($access).+);
            let curr = (($cfg).config.$($access).+);
            let curr_to = match curr {
                $($from => $to,)*
                $(
                    $(v if v == $from_e => $to_e,)+
                    _ => "other",
                )?
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
                $($from => $to,)*
                $(
                    $(v if v == &$from_e => $to_e,)+
                    v => todo!("default value not handled: {v:?}"),
                )?
            };
            let cfg_update = $cfg.update.clone();
            let onchange = Callback::from(move |e: Event| {
                e.prevent_default();
                let Some(target) = e.target().and_then(|t| t.dyn_into::<web_sys::HtmlSelectElement>().ok()) else {
                    return;
                };
                cfg_update.update(move |cfg| {
                    let new_value = match target.value().as_str() {
                        $($to => $from,)*
                        $(
                            $($to_e => $from_e,)+
                            "other" => curr,
                        )?
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
                        $(<option value={$to}>{if $to == default_to { concat!($to, " (default)") } else { $to }}</option>)*
                        $($(<option value={$to_e}>{if $to_e == default_to { concat!($to_e, " (default)") } else { $to_e }}</option>)+)?
                    </select>
                    <div class="description">{$description}</div>
                </div>
            }, effect, deps)
        }
    };
}

#[derive(Properties, Clone, PartialEq)]
pub struct FlagsProps {
    pub file: Option<FileInfo>,
}

#[function_component]
pub fn Flags(props: &FlagsProps) -> Html {
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
        false => "Disabled",
    );
    use_effect_with_deps(move |deps| effect(deps), deps);

    let (replace_symbols, effect, deps) = {
        use SymbolReplacement::*;
        flag_widget!(
            cfg,
            default,
            display.replace_symbols,
            "Symbol replacement",
            "Replace some symbols (e.g. \"not\", \"and\", \"<=\") in the UI with their corresponding mathematical or code representation.",
            Math => "Mathematical",
            Code => "Code",
            None => "Disabled",
        )
    };
    use_effect_with_deps(move |deps| effect(deps), deps);

    let (ast_depth_limit, effect, deps) = flag_widget!(
        cfg,
        default,
        display.ast_depth_limit,
        "Printing depth limit",
        "Stop printing terms once this AST depth has been reached. Only needed to avoid crashes with huge proof terms.", |
        if NonMaxU32::new(10) => "10",
        if NonMaxU32::new(20) => "20",
        if NonMaxU32::new(50) => "50",
        if NonMaxU32::new(100) => "100",
        if None => "Disabled"
    );
    use_effect_with_deps(move |deps| effect(deps), deps);

    let (summary_weighing, effect, deps) = flag_widget!(
        cfg,
        default,
        avg_weighing,
        "Average weighing",
        "When sorting by average, how much weight should be given to the total count. Currently only affects quantifier sorting on the summary screen. A weight of 0% means sorting exactly by the average, while N% means that anything with < N% of the total will be heavily down-ranked.", |
        if F64Ord(0.0) => "0%",
        if F64Ord(1.0) => "1%",
        if F64Ord(10.0) => "10%",
        if F64Ord(100.0) => "100%",
    );
    use_effect_with_deps(move |deps| effect(deps), deps);

    yew::html! {
        <div class="flags-page"><div class="flags-content">
            <h1>{"Configuration flags"}</h1>
            <button onclick={reset}>{"Reset configuration"}</button>
            {debug}
            {replace_symbols}
            {ast_depth_limit}
            {summary_weighing}
            <TermDisplayFlag cfg={cfg.clone()} file={props.file.clone()} />
        </div></div>
    }
}
