use material_yew::linear_progress::MatLinearProgress;
use smt_log_parser::parsers::z3::graph::RawNodeIndex;
use yew::{function_component, html, use_context, Callback, Html, NodeRef, Properties};

use crate::{configuration::ConfigurationProvider, infobars::{ml_omnibox::MlOmnibox, Omnibox, SearchActionResult}, utils::lookup::Kind, LoadingState};

#[derive(Debug, Clone, PartialEq)]
pub struct OmnibarMessage {
    pub message: String,
    pub is_error: bool,
}

#[derive(PartialEq, Properties)]
pub struct TopbarProps {
    pub progress: LoadingState,
    pub message: Option<OmnibarMessage>,
    pub omnibox: NodeRef,
    pub search: Callback<String, Option<SearchActionResult>>,
    pub pick: Callback<(String, Kind), Option<Vec<RawNodeIndex>>>,
    pub select: Callback<RawNodeIndex>,
    pub found_mls: Option<usize>,
    pub pick_nth_ml: Callback<usize>,
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
        LoadingState::ReadingToString =>
            indeterminate = true,
        LoadingState::StartParsing =>
            indeterminate = true,
        LoadingState::Parsing(parsing, _) => {
            progress = (parsing.reader.bytes_read as f64 / parsing.file_size as f64) as f32;
            buffer = 1.0;
        }
        LoadingState::DoneParsing(timeout, cancelled) => {
            if *timeout && !*cancelled {
                class = "progress progress-anim loading-bar-failed";
            }
            progress = 1.0;
            buffer = 1.0;
        }
        LoadingState::Rendering(..) =>
            indeterminate = true,
        LoadingState::FileDisplayed =>
            closed = true,
    };
    if props.message.as_ref().is_some_and(|m| m.is_error) {
        class = "progress progress-anim loading-bar-failed";
        progress = 1.0;
        buffer = 1.0;
        closed = false;
        indeterminate = false;
    }
    let ml_viewer_mode = use_context::<std::rc::Rc<ConfigurationProvider> >().expect("no ctx found");
    let omnibox = if ml_viewer_mode.config.persistent.ml_viewer_mode {
        html! {
            <MlOmnibox progress={props.progress.clone()} message={props.message.clone()} omnibox={props.omnibox.clone()} pick={props.pick.clone()} select={props.select.clone()} found_mls={props.found_mls} pick_nth_ml={props.pick_nth_ml.clone()} />
        }
    } else {
        html! {
            <Omnibox progress={props.progress.clone()} message={props.message.clone()} omnibox={props.omnibox.clone()} search={props.search.clone()} pick={props.pick.clone()} select={props.select.clone()} />
        }
    };
    html! {
    <>
        {omnibox}
        <div {class}><MatLinearProgress {closed} {indeterminate} {progress} {buffer}/></div>
    </>
    }
}
