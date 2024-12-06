use web_sys::HtmlInputElement;
use yew::{
    function_component, html, html::Scope, use_effect_with_deps, AttrValue, Callback, Children,
    Html, InputEvent, KeyboardEvent, MouseEvent, NodeRef, Properties,
};

use crate::{
    infobars::{DropdownButton, DropdownIdx, OmniboxMessage},
    screen::extra,
};

use super::{
    mode::{OmniboxMode, SearchKind, SearchMode},
    Omnibox, OmniboxM, OmniboxProps,
};

use ViewMode::*;

impl Omnibox {
    pub fn view_mode<'a>(&'a self, props: &'a OmniboxProps) -> ViewMode<'a> {
        if let Some(message) = &props.message {
            return Message(message);
        }
        match (&self.mode, &*props.omnibox) {
            (OmniboxMode::Disabled, extra::Omnibox::Message(message)) => Message(message),
            (OmniboxMode::Disabled, extra::Omnibox::Loading(loading)) => Loading(loading),
            (OmniboxMode::Search(search), extra::Omnibox::Search(omnibox)) => {
                Search(search, omnibox, self)
            }
            (OmniboxMode::Choose(chosen), extra::Omnibox::Choose(omnibox)) => {
                Choose(*chosen, omnibox)
            }
            _ => unreachable!(),
        }
    }
}

#[derive(Clone, Copy)]
pub enum ViewMode<'a> {
    Message(&'a OmniboxMessage),
    Loading(&'a extra::OmniboxLoading),
    Search(&'a SearchMode, &'a extra::OmniboxSearch, &'a Omnibox),
    Choose(Option<usize>, &'a extra::OmniboxChoose),
}

impl<'a> ViewMode<'a> {
    pub fn view(self, link: &Scope<Omnibox>, omnibox: &NodeRef, idx: DropdownIdx) -> Html {
        let icon = self.icon();
        let icon_mousedown = self.icon_mousedown().cloned();
        let icon = if let Some(callback) = icon_mousedown {
            let onclick = Callback::from(move |ev: MouseEvent| {
                ev.prevent_default();
            });
            let onmousedown = Callback::from(move |_| {
                callback.emit(());
            });
            html! { <a href="#" {onclick} {onmousedown}>{icon}</a> }
        } else {
            html! { {icon} }
        };

        let placeholder = self.placeholder().to_string();
        let oninput = link.callback(OmniboxM::Input);
        let onkeydown = link.callback(|ev: KeyboardEvent| {
            ev.stop_propagation();
            ev.cancel_bubble();
            OmniboxM::KeyDownTyping(ev)
        });
        let dropdown = self.dropdown(link).map(|inner| {
            html! {
                <div class="omnibox-popup" onkeydown={onkeydown.clone()} tabindex={"0"}>{inner}</div>
            }
        });

        let stepthrough = self.stepthrough().map(|(chosen, choose_from)| {
            let node_idx = chosen.map(|i| (i + 1).to_string()).unwrap_or_else(|| "?".to_string());
            let left = link.callback(|ev: MouseEvent| {
                ev.stop_propagation();
                ev.cancel_bubble();
                OmniboxM::Select { left: true }
            });
            let right = link.callback(|ev: MouseEvent| {
                ev.stop_propagation();
                ev.cancel_bubble();
                OmniboxM::Select { left: false }
            });
            html! {<>
                <div class="current">{node_idx}{" / "}{choose_from}</div>
                <button onmousedown={left}><i class="material-icons left">{"keyboard_arrow_left"}</i></button>
                <button onmousedown={right}><i class="material-icons right">{"keyboard_arrow_right"}</i></button>
            </>}
        });

        let input = self.input().map(|s| s.to_string());
        let disabled = input.is_none();
        let ontoggle = (!disabled).then(|| link.callback(OmniboxM::Focus));

        html! {
            <DropdownButton {idx} {ontoggle} enable_on_click={true} {disabled}>
                <div class="omnibox">
                    <div class="icon no-select">{icon}</div>
                    <OmniboxInput omnibox={omnibox.clone()} {placeholder} {input} {oninput} {onkeydown} />
                    <div class="stepthrough">{stepthrough}</div>
                </div>
                {dropdown}
            </DropdownButton>
        }
    }

    fn icon(self) -> &'static str {
        match self {
            Message(msg) => msg.kind.icon(),
            Loading(loading) => loading.icon,
            Search(search, ..) => search.icon(),
            Choose(_, select) => select.icon,
        }
    }

    fn placeholder(self) -> &'a str {
        match self {
            Message(msg) => msg.message.as_str(),
            Loading(loading) => loading.message.as_str(),
            Search(search, ..) => search.placeholder(),
            Choose(_, select) => select.message.as_str(),
        }
    }

    fn input(self) -> Option<&'a str> {
        match self {
            Message(..) | Loading(..) | Choose(..) => None,
            Search(search, ..) => Some(search.input.as_str()),
        }
    }

    fn icon_mousedown(self) -> Option<&'a Callback<()>> {
        match self {
            Message(..) | Search(..) => None,
            Loading(loading) => loading.icon_mousedown.as_ref(),
            Choose(_, select) => select.icon_mousedown.as_ref(),
        }
    }

    fn dropdown(self, link: &Scope<Omnibox>) -> Option<Html> {
        match self {
            Message(..) | Loading(..) | Choose(..) => None,
            Search(search, omnibox, container) => search.dropdown(link, omnibox, container),
        }
    }

    fn stepthrough(self) -> Option<(Option<usize>, usize)> {
        match self {
            Message(..) | Loading(..) => None,
            Search(search, omnibox, ..) => search.stepthrough(omnibox),
            Choose(chosen, select) => Some((chosen, select.choose_from)),
        }
    }
}

impl SearchMode {
    fn icon(&self) -> &'static str {
        match self.kind {
            SearchKind::FocusCommand { .. } => "chevron_right",
            _ => "search",
        }
    }

    fn placeholder(&self) -> &'static str {
        match self.kind {
            SearchKind::FocusCommand { .. } => "Filter commands...",
            _ => "Search or type '>' for commands",
        }
    }

    fn dropdown(
        &self,
        link: &Scope<Omnibox>,
        omnibox: &extra::OmniboxSearch,
        container: &Omnibox,
    ) -> Option<Html> {
        let onmousedown = |idx| {
            let link = link.clone();
            Callback::from(move |ev: MouseEvent| {
                if ev.button() != 0 || ev.ctrl_key() || ev.meta_key() || ev.alt_key() {
                    return;
                }
                link.send_message(OmniboxM::Picked(idx));
            })
        };
        let is_filtering = !self.input.is_empty();

        use SearchKind::*;
        match &self.kind {
            BlurNone | BlurSelecting { .. } => None,
            FocusSearch { .. } if omnibox.is_empty() => None,
            FocusSearch {
                highlighted,
                results,
                ..
            } => {
                let suggestions = results.as_html(
                    omnibox,
                    *highlighted,
                    &container.scroll_into_view,
                    &onmousedown,
                );
                Some(
                    html! { <DropdownWrapper {is_filtering} command_mode={false} scroll_container={&container.scroll_container}>{for suggestions}</DropdownWrapper> },
                )
            }
            FocusCommand {
                highlighted,
                results,
            } => {
                let commands =
                    results.as_html(*highlighted, &container.scroll_into_view, &onmousedown);
                Some(
                    html! { <DropdownWrapper {is_filtering} command_mode={true} scroll_container={&container.scroll_container}>{for commands}</DropdownWrapper> },
                )
            }
        }
    }

    fn stepthrough(&self, omnibox: &extra::OmniboxSearch) -> Option<(Option<usize>, usize)> {
        let (results, select) = self.kind.get_chosen()?;
        let entry = select.index(results, omnibox);
        Some((select.choice_idx, entry.select_from))
    }
}

#[derive(Properties, Clone, PartialEq)]
struct WrapperProps {
    is_filtering: bool,
    command_mode: bool,
    scroll_container: NodeRef,
    children: Children,
}

#[function_component]
fn DropdownWrapper(props: &WrapperProps) -> Html {
    if props.children.is_empty() {
        html! {
            <div class="omnibox-empty-state">
                <i class="material-icons">{"search"}</i>
                <div class="omnibox-empty-state-title">{"No "}{if props.is_filtering { "matching " } else { "" }}{if props.command_mode { "commands" } else { "results" }}{"..."}</div>
                <div class="omnibox-empty-state-content"></div>
            </div>
        }
    } else {
        html! {
            <div class="omnibox-dropdown"><div ref={&props.scroll_container} class="omnibox-options-container">{props.children.clone()}</div>
                <div class="omnibox-dropdown-footer">
                    <section><span class="dd-keycap"><i class="icon">{"arrow_upward"}</i></span>{" "}<span class="dd-keycap"><i class="icon">{"arrow_downward"}</i></span>{" to navigate"}</section>
                    <section><span class="dd-keycap"><i class="icon">{"keyboard_return"}</i></span>{" to "}{if props.command_mode { "use" } else {"select"}}</section>
                    <section><span class="dd-keycap">{"esc"}</span>{" to dismiss"}</section>
                </div>
            </div>
        }
    }
}

#[derive(Properties, Clone, PartialEq)]
pub struct OmniboxInputProps {
    pub omnibox: NodeRef,
    pub placeholder: AttrValue,
    pub input: Option<String>,
    pub onkeydown: Callback<KeyboardEvent>,
    pub oninput: Callback<InputEvent>,
}

#[function_component]
pub fn OmniboxInput(props: &OmniboxInputProps) -> Html {
    use_effect_with_deps(
        move |(omnibox, input)| {
            if let Some(omnibox) = omnibox.cast::<HtmlInputElement>() {
                omnibox.set_value(input.as_ref().map(|s| s.as_str()).unwrap_or_default());
            }
            || {}
        },
        (props.omnibox.clone(), props.input.clone()),
    );
    let disabled = props.input.is_none();
    html! { <input ref={&props.omnibox} placeholder={&props.placeholder} readonly={disabled} disabled={disabled} onkeydown={&props.onkeydown} oninput={&props.oninput} /> }
}
