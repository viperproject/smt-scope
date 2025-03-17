use yew::{function_component, use_context, Callback, Children, Properties};

use crate::infobars::DropdownCtxt;

#[derive(Properties, Clone, PartialEq)]
pub struct DropdownProps {
    pub children: Children,
}

#[function_component]
pub fn Dropdown(props: &DropdownProps) -> yew::Html {
    let dropdown = use_context::<DropdownCtxt>().unwrap();
    let onclick = Callback::from(move |_| {
        dropdown.toggle.emit(None);
    });
    yew::html! {
        <ul {onclick}>{props.children.clone()}</ul>
    }
}
