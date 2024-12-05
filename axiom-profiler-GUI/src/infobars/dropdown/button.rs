use yew::{
    function_component, html, use_context, use_effect_with_deps, use_state_eq, Callback, Children,
    Html, MouseEvent, Properties,
};

use crate::infobars::DropdownCtxt;

use super::DropdownIdx;

#[derive(Properties, Clone, PartialEq)]
pub struct DropdownButtonProps {
    pub idx: DropdownIdx,
    pub disabled: Option<bool>,
    pub enable_on_click: Option<bool>,
    pub ontoggle: Option<Callback<bool>>,
    pub children: Children,
}

#[derive(Clone, Copy)]
struct Bool(bool);
impl PartialEq for Bool {
    fn eq(&self, _: &Self) -> bool {
        true
    }
}

#[function_component]
pub fn DropdownButton(props: &DropdownButtonProps) -> Html {
    let disabled = props.disabled.unwrap_or_default();
    let dropdown = use_context::<DropdownCtxt>().unwrap();
    let last_hovered = dropdown.enabled && dropdown.last_hovered.is_some_and(|lh| lh == props.idx);

    let last_hovered_state = use_state_eq(|| Bool(false));
    last_hovered_state.set(Bool(last_hovered));

    use_effect_with_deps(
        move |(last_hovered, toggle)| {
            let last_hovered = last_hovered.clone();
            let toggle = toggle.clone();
            move || {
                if last_hovered.0 {
                    toggle.emit(Some(false));
                }
            }
        },
        (last_hovered_state.clone(), dropdown.toggle.clone()),
    );

    if disabled && dropdown.enabled && last_hovered {
        dropdown.toggle.emit(Some(false));
    }
    let enable_on_click = props.enable_on_click.unwrap_or_default();
    assert!(props.children.len() == 1 || props.children.len() == 2);
    let mut children = props.children.iter();
    let button = children.next().unwrap();

    let old_enabled = use_state_eq(|| false);
    if let Some(ontoggle) = &props.ontoggle {
        if *old_enabled != dropdown.enabled {
            ontoggle.emit(dropdown.enabled);
        }
    }
    old_enabled.set(dropdown.enabled);

    let dropdown_html = children.next();
    let dropdown_enabled = !disabled && dropdown.enabled && last_hovered && dropdown_html.is_some();
    let class = if dropdown_enabled {
        "dropdown-popup"
    } else {
        "dropdown-popup display-none"
    };
    let dropdown_html = html! {<div {class}>{dropdown_html}</div>};

    let enabled_and_not_hovered = !disabled && !last_hovered;
    let onmousemove = enabled_and_not_hovered.then(|| {
        let set_dropdown = dropdown.set_dropdown;
        let idx = props.idx;
        Callback::from(move |_| set_dropdown.emit(Some(idx)))
    });
    let click_no_effect = enable_on_click && dropdown.enabled;
    let onmousedown = (!disabled && !click_no_effect).then(|| {
        let toggle = dropdown.toggle;
        let enable_on_click = enable_on_click.then_some(true);
        Callback::from(move |_| toggle.emit(enable_on_click))
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
