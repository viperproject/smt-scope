use material_yew::linear_progress::MatLinearProgress;
use smt_log_parser::analysis::RawNodeIndex;
use yew::{function_component, html, use_context, use_node_ref, Callback, Html, Properties};

use crate::{
    infobars::{
        ml_omnibox::MlOmnibox, DropdownButton, DropdownContainer, MenuButton, Omnibox,
        SearchActionResult,
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
}

#[function_component]
pub fn Topbar(props: &TopbarProps) -> Html {
    let ref_ = use_node_ref();

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
    let mut dropdown_left = Vec::new();
    if state.state.parser.is_some() {
        dropdown_left.push(html! {<DropdownButton idx={0}>
            <MenuButton label={"View"} />
            <div>{"Test1"}</div>
        </DropdownButton>});
        dropdown_left.push(html! {<DropdownButton idx={1}>
            <MenuButton label={"View"} />
            <div>{"Test2"}</div>
        </DropdownButton>});
    }
    let dropdown_right = html! {};
    html! {
    <div class={topbar_class}>
        <DropdownContainer><div class={if state.state.sidebar_closed { "menu-bar pad" } else { "menu-bar" }}>{for dropdown_left}</div></DropdownContainer>
        <div ref={&ref_} class="omnibox-outer"><DropdownContainer container_ref={ref_}>{omnibox}</DropdownContainer></div>
        <div class="menu-bar">{dropdown_right}</div>
        <div {class}><MatLinearProgress {closed} {indeterminate} {progress} {buffer}/></div>
    </div>
    }
}
