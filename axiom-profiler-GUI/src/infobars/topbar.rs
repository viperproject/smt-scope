use std::rc::Rc;

use material_yew::linear_progress::{LinearProgressProps, MatLinearProgress};
use smt_log_parser::analysis::RawNodeIndex;
use yew::{function_component, html, use_context, use_node_ref, Callback, Html, Properties};

use crate::{
    infobars::{
        ml_omnibox::MlOmnibox, Dropdown, DropdownButton, DropdownContainer, History, MenuButton,
        Omnibox, SearchActionResult,
    },
    screen::extra,
    state::StateProvider,
    utils::lookup::Kind,
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

#[derive(PartialEq, Properties)]
pub struct TopbarProps {
    pub omnibox: Rc<extra::Omnibox>,
    pub message: Option<OmniboxMessage>,

    pub search: Callback<String, Option<SearchActionResult>>,
    pub pick: Callback<(String, Kind), Option<Vec<RawNodeIndex>>>,
    pub select: Callback<RawNodeIndex>,
    pub pick_nth_ml: Callback<usize>,
    pub dropdowns: Vec<(&'static str, Html)>,
}

#[function_component]
pub fn Topbar(props: &TopbarProps) -> Html {
    let class;
    let loading_bar = if let Some(message) = &props.message {
        let colour_props = LinearProgressProps {
            indeterminate: false,
            progress: 1.0,
            buffer: 1.0,
            reverse: false,
            closed: false,
        };
        match message.kind {
            OmniboxMessageKind::Info => {
                class = "progress progress-anim loading-bar-info";
                props.omnibox.progress.clone()
            }
            OmniboxMessageKind::Warning => {
                class = "progress progress-anim loading-bar-warning";
                colour_props
            }
            OmniboxMessageKind::Error => {
                class = "progress progress-anim lloading-bar-error";
                colour_props
            }
        }
    } else {
        class = "progress progress-anim";
        props.omnibox.progress.clone()
    };
    // log::info!("Topbar {loading_bar:?} ({class})");

    let state = use_context::<std::rc::Rc<StateProvider>>().expect("no ctx found");
    let ml_viewer_mode = state.state.ml_viewer_mode;
    let omnibox = if ml_viewer_mode {
        let ml_data = state.state.parser.as_ref().unwrap().ml_data.unwrap();
        html! {
            <MlOmnibox message={props.message.clone()} {ml_data} pick_nth_ml={props.pick_nth_ml.clone()} />
        }
    } else {
        html! {
            <Omnibox omnibox={props.omnibox.clone()} message={props.message.clone()} search={props.search.clone()} pick={props.pick.clone()} select={props.select.clone()} />
        }
    };
    let topbar_class = if ml_viewer_mode {
        "topbar ml-mode"
    } else {
        "topbar"
    };
    let (dl, dm, dr) = (use_node_ref(), use_node_ref(), use_node_ref());
    let mut dropdown_left = Vec::<Html>::new();
    let mut dropdown_right = Vec::<Html>::new();
    for (idx, (label, html)) in props.dropdowns.iter().enumerate() {
        dropdown_left.push(html! {<DropdownButton idx={idx as u32}>
            <MenuButton label={label.clone()} />
            <Dropdown>{html.clone()}</Dropdown>
        </DropdownButton>});
    }
    dropdown_right.push(html! {<History />});
    let dl_class = if state.state.sidebar_closed {
        "menu-bar pad"
    } else {
        "menu-bar"
    };
    html! {
    <div class={topbar_class}>
        <div ref={&dl} class={dl_class}>     <DropdownContainer container_ref={dl}>{for dropdown_left} </DropdownContainer></div>
        <div ref={&dm} class="omnibox-outer"><DropdownContainer container_ref={dm}>{omnibox}           </DropdownContainer></div>
        <div ref={&dr} class="menu-bar">     <DropdownContainer container_ref={dr}>{for dropdown_right}</DropdownContainer></div>
        <div {class}><MatLinearProgress ..loading_bar/></div>
    </div>
    }
}
