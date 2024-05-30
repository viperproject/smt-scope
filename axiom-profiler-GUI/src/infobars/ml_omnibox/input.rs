use smt_log_parser::parsers::z3::graph::RawNodeIndex;
use web_sys::HtmlInputElement;
use yew::{
    function_component, html, use_effect_with_deps, use_mut_ref, AttrValue, Html, NodeRef,
    Properties,
};

use crate::utils::lookup::Kind;

use super::SearchAction;

#[derive(Properties, Clone, PartialEq)]
pub struct MlOmniboxInputProps {
    pub omnibox: NodeRef,
    pub placeholder: AttrValue,
    pub omnibox_disabled: bool,
    pub focused: bool,
    pub input: Option<String>,
}

#[function_component]
pub fn MlOmniboxInput(props: &MlOmniboxInputProps) -> Html {
    let focused = use_mut_ref(|| false);
    let old_focused = *focused.borrow();
    use_effect_with_deps(
        move |(omnibox, input, focused)| {
            if let Some(omnibox) = omnibox.cast::<HtmlInputElement>() {
                omnibox.set_value(input.as_ref().map(|s| s.as_str()).unwrap_or_default());
                if *focused != old_focused {
                    if *focused {
                        omnibox.focus().ok();
                        omnibox.select();
                    } else {
                        omnibox.blur().ok();
                    }
                }
            }
            || {}
        },
        (props.omnibox.clone(), props.input.clone(), props.focused),
    );
    *focused.borrow_mut() = props.focused;
    html! { <input ref={props.omnibox.clone()} placeholder={&props.placeholder} readonly={props.omnibox_disabled} disabled={props.omnibox_disabled} /> }
}

#[derive(Debug, PartialEq)]
pub struct SuggestionResult {
    pub query: String,
    pub indices: Vec<u32>,
    pub exact_match: Option<usize>,
    pub groups: Vec<SuggestionGroup>,
}

#[derive(Debug, PartialEq)]
pub struct SuggestionGroup {
    pub kind: Kind,
    pub start_idx: usize,
    pub suggestions: Vec<Suggestion>,
}

#[derive(Debug, PartialEq)]
pub struct Suggestion {
    pub name: String,
    pub name_idx: usize,
    pub score: u16,
    pub details: SearchAction,
}

#[derive(Debug)]
pub struct PickedSuggestion {
    pub name: String,
    pub suggestion_idx: usize,
    pub nodes: Vec<RawNodeIndex>,
    pub node_idx: Option<usize>,
    pub ml_idx: Option<usize>,
}

impl PickedSuggestion {
    pub fn default_simple(ml_idx: usize) -> Option<Self> {
        if ml_idx > 0 {
            Some(Self {
                name: "".to_string(),
                suggestion_idx: 0,
                nodes: vec![],
                node_idx: None,
                ml_idx: None,
            })
        } else {
            None
        }
    }
}
