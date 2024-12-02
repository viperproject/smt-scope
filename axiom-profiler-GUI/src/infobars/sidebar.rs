use material_yew::icon::MatIcon;
use web_sys::HtmlElement;
use yew::{function_component, html, use_effect, Callback, Children, Html, NodeRef, Properties};

use crate::screen::extra::SidebarSectionRef;

#[derive(PartialEq, Properties)]
pub struct SidebarSectionHeaderProps {
    pub header_text: String,
    pub collapsed_text: String,
    pub icon: Option<String>,
    pub header_class: Option<String>,
    pub header_ref: Option<String>,
    pub section: SidebarSectionRef,
    pub children: Children,
}

#[function_component]
pub fn SidebarSectionHeader(props: &SidebarSectionHeaderProps) -> Html {
    let expanded = if props.section.expanded() {
        "expanded"
    } else {
        ""
    };

    let section_ref = props.section.clone();
    use_effect(move || {
        let _ = section_ref.set();
    });

    let section_ref = props.section.clone();
    let collapse = Callback::from(move |_| {
        let _ = section_ref.toggle();
    });
    let icon = props
        .icon
        .as_ref()
        .map(|icon| html! {<div class="material-icons"><MatIcon>{icon}</MatIcon></div>});
    let class = format!(
        "section-header {}",
        props.header_class.as_deref().unwrap_or_default()
    );
    let header_ref = props.header_ref.clone().unwrap_or_default();
    html! {
        <section class={expanded} ref={props.section.ref_()}>
            <div {class} id={header_ref} onclick={collapse}><h1 title={props.collapsed_text.clone()}>{icon}{&props.header_text}</h1><h2>{&props.collapsed_text}</h2></div>
            <div class="section-content">{props.children.clone()}</div>
        </section>
    }
}
