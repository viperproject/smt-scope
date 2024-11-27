use yew::{
    function_component, html, use_context, use_state_eq, Callback, Children, Html, MouseEvent,
    Properties,
};

use crate::infobars::DropdownCtxt;

use super::DropdownIdx;

#[derive(Properties, Clone, PartialEq)]
pub struct DropdownButtonProps {
    pub idx: DropdownIdx,
    pub enable_on_click: Option<()>,
    pub ontoggle: Option<Callback<bool>>,
    pub children: Children,
}

#[function_component]
pub fn DropdownButton(props: &DropdownButtonProps) -> Html {
    let idx = props.idx;
    let enable_on_click = props.enable_on_click.is_some();
    assert!(props.children.len() == 1 || props.children.len() == 2);
    let mut children = props.children.iter();
    let button = children.next().unwrap();

    let dropdown = use_context::<DropdownCtxt>().unwrap();

    let old_enabled = use_state_eq(|| false);
    if let Some(ontoggle) = &props.ontoggle {
        if *old_enabled != dropdown.enabled {
            ontoggle.emit(dropdown.enabled);
        }
        old_enabled.set(dropdown.enabled);
    }

    let dropdown_enabled = dropdown.enabled && dropdown.last_hovered.is_some_and(|lh| lh == idx);
    let dropdown_html = children.next().map(|c| {
        let class = if dropdown_enabled {
            "dropdown-popup"
        } else {
            "dropdown-popup display-none"
        };
        html! {<div class={class}>{c}</div>}
    });
    let set_dropdown = dropdown.set_dropdown;
    let onmousemove = Callback::from(move |_| set_dropdown.emit(idx));
    let toggle = dropdown.toggle;
    let onmousedown = Callback::from(move |_| {
        toggle.emit(enable_on_click.then_some(true));
    });

    let class = if dropdown_enabled {
        "display-contents hover"
    } else {
        "display-contents"
    };
    html! {<div class={"position-relative"}>
        <div {class} {onmousemove} {onmousedown}>{button}</div>
        {dropdown_html}
    </div>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct MenuButtonProps {
    pub label: String,
}

#[function_component]
pub fn MenuButton(props: &MenuButtonProps) -> Html {
    let onclick = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
    });
    html! {<a href="#" draggable="false" class="menu-button" {onclick}>{&props.label}</a>}
}
