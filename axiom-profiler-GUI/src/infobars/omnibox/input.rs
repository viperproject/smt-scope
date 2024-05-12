use fxhash::FxHashMap;
use smt_log_parser::parsers::z3::graph::RawNodeIndex;
use web_sys::HtmlInputElement;
use yew::{function_component, html, use_effect_with_deps, use_mut_ref, AttrValue, Callback, FocusEvent, Html, InputEvent, MouseEvent, NodeRef, Properties};

use crate::utils::lookup::Kind;

use super::SearchAction;

#[derive(Properties, Clone, PartialEq)]
pub struct OmniboxInputProps {
    pub omnibox: NodeRef,
    pub placeholder: AttrValue,
    pub omnibox_disabled: bool,
    pub focused: bool,
    pub input: Option<String>,
    pub onfocusin: Callback<FocusEvent>,
    pub onfocusout: Callback<FocusEvent>,
    pub oninput: Callback<InputEvent>,
}

#[function_component]
pub fn OmniboxInput(props: &OmniboxInputProps) -> Html {
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
    html!{ <input ref={props.omnibox.clone()} placeholder={&props.placeholder} readonly={props.omnibox_disabled} disabled={props.omnibox_disabled} onfocusin={&props.onfocusin} onfocusout={&props.onfocusout} oninput={&props.oninput}/> }
}

#[derive(Debug)]
pub struct HighlightedString<'a>(pub &'a str, pub &'a [u32]);
impl HighlightedString<'_> {
    pub fn to_html(self) -> Html {
        let mut result = Vec::new();
        let mut last_start = 0;
        let mut next = 0;
        for &idx in self.1 {
            let idx = idx as usize;
            if idx != next {
                if last_start != next {
                    result.push(html! {<b>{&self.0[last_start..next]}</b>});
                }
                result.push(html! {{&self.0[next..idx]}});
                last_start = idx;
            }
            next = idx + 1;
        }
        result.push(html! {<b>{&self.0[last_start..next]}</b>});
        result.push(html! {{&self.0[next..]}});
        html! {{for result}}
    }
}

#[derive(Debug, PartialEq)]
pub struct SuggestionResult {
    pub query: String,
    pub indices: Vec<u32>,
    pub exact_match: Option<usize>,
    pub groups: Vec<SuggestionGroup>,
}

impl SuggestionResult {
    pub fn new(search: super::SearchActionResult) -> Self {
        let mut groups_map: FxHashMap<Kind, &mut SuggestionGroup> = FxHashMap::default();
        let mut groups = Vec::new();
        for group in search.groups {
            for action in group.actions {
                let entry = groups_map.entry(action.kind).or_insert_with_key(|key| {
                    groups.push(SuggestionGroup { kind: *key, start_idx: 0, suggestions: Vec::new() });
                    let last = groups.last_mut().unwrap();
                    unsafe { &mut *(last as *mut _) }
                });
                entry.suggestions.push(Suggestion {
                    name: group.name.clone(),
                    name_idx: group.idx,
                    score: group.score,
                    details: action,
                });
            }
        }
        for group in &mut groups {
            group.suggestions.sort_by_key(|suggestion| (u16::MAX - suggestion.score, usize::MAX - suggestion.details.visible, usize::MAX - suggestion.details.count));
        }
        groups.sort_by_key(|group| (u16::MAX - group.suggestions.first().map(|suggestion| suggestion.score).unwrap_or_default(), group.kind));
        let mut suggestions = 0;
        let mut exact_match = None;
        let mut double_match = false;
        for group in &mut groups {
            group.start_idx = suggestions;
            suggestions += group.suggestions.len();
            let mut max_score = 1;
            let new_match = group.suggestions.iter().take_while(|suggestion| {
                let higher = suggestion.score >= max_score;
                max_score = suggestion.score;
                higher
            }).enumerate().find_map(|(i, suggestion)| (suggestion.name == search.query).then(|| group.start_idx + i));
            double_match |= new_match.is_some() && exact_match.is_some();
            exact_match = exact_match.or(new_match);
        }
        if double_match {
            exact_match = None;
        }
        Self {
            query: search.query,
            indices: search.indices,
            exact_match,
            groups,
        }
    }
    pub fn suggestion_count(&self) -> usize {
        self.groups.last().map_or(0, |group| group.start_idx + group.suggestions.len())
    }
    pub fn groups(&self) -> Option<impl Iterator<Item = (&SuggestionGroup, impl Iterator<Item = (&[u32], &Suggestion)>)> + '_> {
        let non_empty = !self.groups.is_empty();
        non_empty.then(|| {
            let query_len = self.query.len();
            self.groups.iter().map(move |group| {
                (group, group.suggestions.iter().map(move |suggestion| {
                    let start = suggestion.name_idx * query_len;
                    (&self.indices[start..start + query_len], suggestion)
                }))
            })
        })
    }
    pub fn get_nth(&self, n: usize) -> Option<(&SuggestionGroup, &Suggestion)> {
        let mut n = n;
        for group in &self.groups {
            if n < group.suggestions.len() {
                return Some((group, &group.suggestions[n]));
            }
            n -= group.suggestions.len();
        }
        None
    }

    pub fn as_html<'a>(self_: Option<&'a Self>, highlighted: usize, scroll_into_view: &'a NodeRef, onclick: impl Fn(usize) -> Callback<MouseEvent> + 'a) -> Option<impl Iterator<Item = Html> + 'a> {
        let groups = self_.and_then(SuggestionResult::groups);
        groups.map(move |groups| {
            groups.map(move |(group, suggestions)| {
                let suggestions = suggestions.enumerate().map(|(i, (indices, suggestion))| {
                    let i = group.start_idx + i;
                    let highlighted = highlighted == i;
                    let class = if highlighted { "omnibox-highlighted" } else { "can-hover" };
                    let scroll_into_view = highlighted.then(|| scroll_into_view.clone()).unwrap_or_default();
                    let onmousedown = onclick(i);
                    let highlighted_name = HighlightedString(&suggestion.name, indices).to_html();
                    let highlighted_name = if let Some(arguments) = suggestion.details.arguments {
                        html! {
                            <><span class="option-arguments">{"("}</span>{highlighted_name}<span class="option-arguments">{for (0..arguments).map(|_| " _")}{")"}</span></>
                        }
                    } else {
                        highlighted_name
                    };
                    let colour = suggestion.details.hue.map(|hue| html! {
                        <div class="node-colour" style={format!("background-color: hsl({hue}, 79%, 76%)")}></div>
                    });
                    html! {
                        <li ref={scroll_into_view} {class} {onmousedown}>
                            <span class="option-title">{highlighted_name}</span>// Uncomment to see fuzzy matching score: {" ("}{suggestion.score.to_string()}{")"}</span>
                            {colour}{suggestion.details.visible.to_string()}{" shown / "}{suggestion.details.count.to_string()}
                        </li>
                    }
                });
                html! {
                    <div>
                        <li class="group-header">
                            <span class="option-title">{group.kind.name()}</span>
                        </li>
                        {for suggestions}
                    </div>
                }
            })
        })
    }
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
    pub fn new(suggestion_idx: usize, sr: &SuggestionResult, pick: &Callback<(String, Kind), Option<Vec<RawNodeIndex>>>) -> Option<Self> {
        sr.get_nth(suggestion_idx).and_then(|(group, suggestion)| {
            pick.emit((suggestion.name.clone(), group.kind)).map(|nodes| Self {
                name: suggestion.name.clone(),
                suggestion_idx,
                nodes,
                node_idx: None,
                ml_idx: None,
            })
        })
    }
    pub fn default(sr: Option<&SuggestionResult>, pick: &Callback<(String, Kind), Option<Vec<RawNodeIndex>>>) -> Option<Self> {
        sr.and_then(|sr| sr.exact_match.and_then(|suggestion_idx| Self::new(suggestion_idx, sr, pick)))
    }
    pub fn default_simple() -> Option<Self> {
        Some(Self {
            name: "".to_string(),
            suggestion_idx: 0,
            nodes: vec![],
            node_idx: None,
            ml_idx: None,
        })
    }
}
