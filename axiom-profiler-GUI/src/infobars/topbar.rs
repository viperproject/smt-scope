use std::rc::Rc;

use material_yew::linear_progress::{LinearProgressProps, MatLinearProgress};
use yew::{function_component, html, use_node_ref, Html, Properties};

use crate::{
    infobars::{Dropdown, DropdownButton, DropdownContainer, History, MenuButton, Omnibox},
    screen::extra::{self, OmniboxLoading, SimpleButton},
    // state::StateProvider,
};

#[derive(Debug, Clone, PartialEq)]
pub struct OmniboxMessage {
    pub message: String,
    pub kind: OmniboxMessageKind,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum OmniboxMessageKind {
    Info,
    Warning,
    Error,
}

impl OmniboxMessageKind {
    pub fn icon(&self) -> &'static str {
        match self {
            OmniboxMessageKind::Info => "info",
            OmniboxMessageKind::Warning => "warning",
            OmniboxMessageKind::Error => "error",
        }
    }
}

#[derive(PartialEq, Properties)]
pub struct TopbarProps {
    pub topbar: Rc<extra::Topbar>,
    pub omnibox: Rc<extra::Omnibox>,
    pub message: Option<OmniboxMessage>,
    pub sidebar_closed: bool,
}

#[function_component]
pub fn Topbar(props: &TopbarProps) -> Html {
    let (loading_bar, class) = match (props.message.as_ref(), &*props.omnibox) {
        (Some(msg), _) | (None, extra::Omnibox::Message(msg)) => {
            let loading_bar = LinearProgressProps {
                indeterminate: false,
                progress: 1.0,
                buffer: 1.0,
                reverse: false,
                closed: false,
            };
            let class = match msg.kind {
                OmniboxMessageKind::Info => "progress progress-anim loading-bar-info",
                OmniboxMessageKind::Warning => "progress progress-anim loading-bar-warning",
                OmniboxMessageKind::Error => "progress progress-anim loading-bar-error",
            };
            (loading_bar, class)
        }
        (None, extra::Omnibox::Loading(loading)) => {
            (loading.loading.clone(), "progress progress-anim")
        }
        _ => {
            let mut loading_bar = OmniboxLoading::indeterminate();
            loading_bar.closed = true;
            (loading_bar, "progress progress-anim")
        }
    };

    let (dl, dm, dr) = (use_node_ref(), use_node_ref(), use_node_ref());
    let mut dropdown_left = Vec::<Html>::new();
    let mut dropdown_right = Vec::<Html>::new();

    for (idx, topbar_menu) in props.topbar.iter().enumerate() {
        let elements = topbar_menu
            .dropdown
            .clone()
            .into_iter()
            .map(SimpleButton::to_html)
            .collect::<Html>();
        dropdown_left.push(html! {<DropdownButton idx={idx as u32}>
            <MenuButton label={topbar_menu.button_text} />
            <Dropdown>{elements}</Dropdown>
        </DropdownButton>});
    }
    dropdown_right.push(html! {<History />});

    let dl_class = if props.sidebar_closed {
        "menu-bar pad"
    } else {
        "menu-bar"
    };
    html! {
    <div class="topbar">
        <div ref={&dl} class={dl_class}>     <DropdownContainer container_ref={dl}>{for dropdown_left} </DropdownContainer></div>
        <div ref={&dm} class="omnibox-outer"><DropdownContainer container_ref={dm}>
                            <Omnibox omnibox={props.omnibox.clone()} message={props.message.clone()} idx={0} /></DropdownContainer></div>
        <div ref={&dr} class="menu-bar">     <DropdownContainer container_ref={dr}>{for dropdown_right}</DropdownContainer></div>
        <div {class}><MatLinearProgress ..loading_bar/></div>
    </div>
    }
}
