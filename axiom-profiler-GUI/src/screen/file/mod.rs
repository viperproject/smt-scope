mod analysis;

use std::rc::Rc;

use smt_log_parser::{analysis::InstGraph, parsers::ParseState};
use yew::{html, Html};

use crate::{
    filters::byte_size_display,
    infobars::{OmniboxMessage, OmniboxMessageKind},
    results::filters::{DEFAULT_DISABLER_CHAIN, DEFAULT_FILTER_CHAIN},
    screen::{graph::Graph, ml::MatchingLoop},
    state::FileInfo,
    OmniboxContext,
};

use super::{
    extra::{
        Action, ElementKind, Omnibox, OmniboxLoading, Sidebar, SidebarSection, SidebarSectionRef,
        SimpleButton, Topbar,
    },
    graph::GraphProps,
    homepage::OpenedFileInfo,
    ml::MatchingLoopProps,
    Manager, Scope, Screen,
};

pub use self::analysis::*;

#[derive(Clone, PartialEq)]
pub struct FileProps {
    pub file_info: FileInfo,
    pub opened_file: OpenedFileInfo,
    pub overlay_visible: bool,
}

impl FileProps {
    pub fn timeout(&self) -> bool {
        self.opened_file.state.is_timeout()
    }
}

pub struct File {
    analysis: Result<AnalysisState, RcAnalysis>,
    current_trace: SidebarSection,

    view: Option<ViewProps>,
    nested_sidebar: Rc<Sidebar>,
    nested_topbar: Rc<Topbar>,
    nested_omnibox: Rc<Omnibox>,
}

#[derive(Clone)]
enum ViewProps {
    Graph(GraphProps),
    MatchingLoop(MatchingLoopProps),
}

impl File {
    fn analysis(&self) -> Option<&RcAnalysis> {
        self.analysis.as_ref().err()
    }
}

pub enum FileM {
    StartAnalysis,
    ChangeView(ViewChoice),

    NestedSidebar(Rc<Sidebar>),
    NestedTopbar(Rc<Topbar>),
    NestedOmnibox(Rc<Omnibox>),
}

pub enum ViewChoice {
    Overview,
    Graph,
    MatchingLoop,
}

impl Screen for File {
    type Message = FileM;
    type Properties = FileProps;

    fn create(link: &Scope<Self>, props: &Self::Properties) -> Self {
        let current_trace = Self::current_trace(link, props);

        let link = link.clone();
        gloo::timers::callback::Timeout::new(10, move || {
            link.send_message(FileM::StartAnalysis);
        })
        .forget();

        let analysis = Ok(AnalysisState::ConstructingGraph);
        Self {
            analysis,
            current_trace,
            view: None,
            nested_sidebar: Default::default(),
            nested_topbar: Default::default(),
            nested_omnibox: Default::default(),
        }
    }

    fn changed(
        &mut self,
        link: &Scope<Self>,
        props: &Self::Properties,
        old_props: &Self::Properties,
    ) -> bool {
        if props.file_info != old_props.file_info || props.opened_file != old_props.opened_file {
            *self = Self::create(link, props);
        }
        true
    }

    fn update(&mut self, link: &Scope<Self>, props: &Self::Properties, msg: Self::Message) -> bool {
        match msg {
            FileM::StartAnalysis => {
                let old =
                    core::mem::replace(&mut self.analysis, Ok(AnalysisState::ConstructingGraph));
                drop(old);

                let parser = props.opened_file.parser.parser.borrow();
                match InstGraph::new(&parser) {
                    Ok(graph) => {
                        let data = AnalysisData { graph };
                        self.analysis = Err(RcAnalysis::new(data));
                    }
                    Err(err) => {
                        log::error!("Failed constructing instantiation graph: {err:?}");
                        let error = if err.is_oom() {
                            "Out of memory, try stopping earlier".to_string()
                        } else {
                            // Should not be reachable
                            format!("Unexpected error: {err:?}")
                        };
                        self.analysis = Ok(AnalysisState::Failed(error));
                    }
                };
                true
            }
            FileM::ChangeView(view) => {
                let view = match view {
                    ViewChoice::Overview => return self.view.take().is_some(),
                    ViewChoice::Graph => {
                        let Some(analysis) = self.analysis() else {
                            let message = OmniboxMessage {
                                message: "Internal error E1".to_string(),
                                kind: OmniboxMessageKind::Error,
                            };
                            link.omnibox_message(message, 1000);
                            return false;
                        };
                        ViewProps::Graph(GraphProps {
                            parser: props.opened_file.parser.clone(),
                            analysis: analysis.clone(),
                            default_filters: DEFAULT_FILTER_CHAIN.to_vec(),
                            default_disablers: DEFAULT_DISABLER_CHAIN.to_vec(),
                        })
                    }
                    ViewChoice::MatchingLoop => ViewProps::MatchingLoop(MatchingLoopProps {}),
                };
                self.view = Some(view);
                true
            }

            FileM::NestedSidebar(sidebar) => {
                self.nested_sidebar = sidebar;
                true
            }
            FileM::NestedTopbar(topbar) => {
                self.nested_topbar = topbar;
                true
            }
            FileM::NestedOmnibox(omnibox) => {
                self.nested_omnibox = omnibox;
                true
            }
        }
    }

    fn view(&self, link: &Scope<Self>, _props: &Self::Properties) -> Html {
        let Some(view_props) = &self.view else {
            return html! {"Overview"};
        };
        let sidebar = link.callback(FileM::NestedSidebar);
        let topbar = link.callback(FileM::NestedTopbar);
        let omnibox = link.callback(FileM::NestedOmnibox);
        match view_props.clone() {
            ViewProps::Graph(initial) => {
                html! {<Manager<Graph> {sidebar} {topbar} {omnibox} {initial} />}
            }
            ViewProps::MatchingLoop(initial) => {
                html! {<Manager<MatchingLoop> {sidebar} {topbar} {omnibox} {initial} />}
            }
        }
    }

    fn view_sidebar(&self, _link: &Scope<Self>, _props: &Self::Properties) -> Sidebar {
        [self.get_current_trace()]
            .into_iter()
            .chain(self.nested_sidebar.iter().cloned())
            .collect()
    }

    fn view_topbar(&self, _link: &Scope<Self>, _props: &Self::Properties) -> Topbar {
        (*self.nested_topbar).clone()
    }

    fn view_omnibox(&self, _link: &Scope<Self>, props: &Self::Properties) -> Omnibox {
        let Ok(analysis) = &self.analysis else {
            return (*self.nested_omnibox).clone();
        };
        match analysis {
            AnalysisState::ConstructingGraph => {
                let message = if props.timeout() {
                    "Analysing partial trace".to_string()
                } else {
                    "Analysing trace".to_string()
                };
                let mut loading = OmniboxLoading::indeterminate();
                loading.progress = 1.0;
                Omnibox::Loading(OmniboxLoading {
                    icon: "pending",
                    icon_mousedown: None,
                    message,
                    loading,
                })
            }
            AnalysisState::Failed(error) => Omnibox::Message(OmniboxMessage {
                message: error.clone(),
                kind: OmniboxMessageKind::Error,
            }),
        }
    }
}

impl File {
    fn get_current_trace(&self) -> SidebarSection {
        let analysed = self.analysis().is_some();
        let mut current_trace = self.current_trace.clone();
        for elem in current_trace.elements.iter_mut().skip(2) {
            let ElementKind::Simple(elem) = elem else {
                unreachable!()
            };
            elem.disabled = !analysed;
        }
        current_trace
    }

    fn current_trace(link: &Scope<Self>, props: &<Self as Screen>::Properties) -> SidebarSection {
        let size = props
            .file_info
            .size
            .map(|size| {
                let (size, unit) = byte_size_display(size as f64);
                format!("{size:.0} {unit}")
            })
            .unwrap_or_else(|| "?".to_string());
        let trace_info = match &props.opened_file.state {
            ParseState::Paused(_, state) => {
                let (parse_size, parse_unit) = byte_size_display(state.bytes_read as f64);
                format!(
                    "{} ({parse_size:.0} {parse_unit}/{size})",
                    props.file_info.name
                )
            }
            ParseState::Completed { .. } => format!("{} ({size})", props.file_info.name),
            ParseState::Error(err) => format!("{} (error {err:?})", props.file_info.name),
        };
        let trace_info = html! {
            <li><a draggable="false" class="trace-file-name">{trace_info}</a></li>
        };

        SidebarSection {
            ref_: SidebarSectionRef::default(),
            header_text: "Analysis",
            collapsed_text: "Select analysis view".to_string(),
            elements: vec![
                ElementKind::Custom(trace_info),
                ElementKind::Simple(SimpleButton {
                    icon: "summarize",
                    text: "Summary".to_string(),
                    hover_text: Some("View with summary of analysed file".to_string()),
                    disabled: false,
                    click: Action::MouseDown(
                        link.callback(|()| FileM::ChangeView(ViewChoice::Overview)),
                    ),
                }),
                ElementKind::Simple(SimpleButton {
                    icon: "account_tree",
                    text: "Instantiation graph".to_string(),
                    hover_text: Some("View with quantifier instantiation graph".to_string()),
                    disabled: true,
                    click: Action::MouseDown(
                        link.callback(|()| FileM::ChangeView(ViewChoice::Graph)),
                    ),
                }),
                ElementKind::Simple(SimpleButton {
                    icon: "all_inclusive",
                    text: "Matching loops".to_string(),
                    hover_text: Some("View with found matching loops".to_string()),
                    disabled: true,
                    click: Action::MouseDown(
                        link.callback(|()| FileM::ChangeView(ViewChoice::MatchingLoop)),
                    ),
                }),
            ],
        }
    }
}
