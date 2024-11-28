use material_yew::linear_progress::MatLinearProgress;
use smt_log_parser::analysis::RawNodeIndex;
use yew::{
    function_component, html, use_context, use_node_ref, Callback, Html, NodeRef, Properties,
};

use crate::{
    infobars::{
        ml_omnibox::MlOmnibox, Dropdown, DropdownButton, DropdownContainer, History, MenuButton, Omnibox, SearchActionResult
    },
    state::StateProvider,
    utils::lookup::Kind,
    LoadingState,
};

#[derive(Debug, Clone, PartialEq)]
pub struct OmnibarMessage {
    pub message: String,
    pub is_error: bool,
}

#[derive(PartialEq, Properties)]
pub struct TopbarProps {
    pub progress: LoadingState,
    pub message: Option<OmnibarMessage>,
    pub search: Callback<String, Option<SearchActionResult>>,
    pub pick: Callback<(String, Kind), Option<Vec<RawNodeIndex>>>,
    pub select: Callback<RawNodeIndex>,
    pub pick_nth_ml: Callback<usize>,

    pub dropdowns: Vec<(String, Html)>,
}

#[function_component]
pub fn Topbar(props: &TopbarProps) -> Html {
    let mut class = "progress progress-anim";
    let mut closed = false;
    let mut indeterminate = false;
    let mut progress = 0.0;
    let mut buffer = 0.0;
    match &props.progress {
        LoadingState::NoFileSelected => {
            closed = true;
        }
        LoadingState::ReadingToString => indeterminate = true,
        LoadingState::StartParsing => indeterminate = true,
        LoadingState::Parsing(parsing, _) => {
            if let Some(size) = parsing.file_size {
                progress = (parsing.reader.bytes_read as f64 / size as f64) as f32;
            }
            buffer = 1.0;
        }
        LoadingState::DoneParsing(timeout, cancelled) => {
            if *timeout && !*cancelled {
                class = "progress progress-anim loading-bar-failed";
            }
            progress = 1.0;
            buffer = 1.0;
        }
        LoadingState::Rendering(..) => indeterminate = true,
        LoadingState::FileDisplayed => closed = true,
    };
    if props.message.as_ref().is_some_and(|m| m.is_error) {
        class = "progress progress-anim loading-bar-failed";
        progress = 1.0;
        buffer = 1.0;
        closed = false;
        indeterminate = false;
    }
    let state = use_context::<std::rc::Rc<StateProvider>>().expect("no ctx found");
    let ml_viewer_mode = state.state.ml_viewer_mode;
    let omnibox = if ml_viewer_mode {
        let ml_data = state.state.parser.as_ref().unwrap().ml_data.unwrap();
        html! {
            <MlOmnibox message={props.message.clone()} {ml_data} pick_nth_ml={props.pick_nth_ml.clone()} />
        }
    } else {
        html! {
            <Omnibox progress={props.progress.clone()} message={props.message.clone()} search={props.search.clone()} pick={props.pick.clone()} select={props.select.clone()} />
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
        <div {class}><MatLinearProgress {closed} {indeterminate} {progress} {buffer}/></div>
    </div>
    }
}
