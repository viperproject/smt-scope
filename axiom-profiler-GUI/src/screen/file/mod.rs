mod analysis;
mod summary;

use std::rc::Rc;

use smt_log_parser::{analysis::InstGraph, formatter::TermDisplayContext, parsers::ParseState};
use yew::{html, ContextHandle, ContextProvider, Html};

use crate::{
    configuration::ConfigurationProvider,
    infobars::{OmniboxMessage, OmniboxMessageKind},
    screen::{inst_graph::Graph, ml::MatchingLoop},
    utils::display_byte::byte_size_display,
    OmniboxContext,
};

use super::{
    extra::{
        Action, ElementKind, Omnibox, OmniboxLoading, Sidebar, SidebarSection, SidebarSectionRef,
        SimpleButton, Topbar,
    },
    homepage::{FileInfo, ParseInfo, RcParser},
    inst_graph::{
        filter::{DEFAULT_DISABLER_CHAIN, DEFAULT_FILTER_CHAIN},
        GraphProps,
    },
    manager::{NestedScreen, NestedScreenM},
    maybe_rc::MaybeRc,
    ml::MatchingLoopProps,
    Scope, Screen,
};

pub use self::{analysis::*, summary::*};

#[derive(Clone, PartialEq)]
pub struct FileProps {
    pub file_info: FileInfo,
    pub parse_info: ParseInfo,
    pub parser: RcParser,
    pub overlay_visible: bool,
}

impl FileProps {
    pub fn timeout(&self) -> bool {
        self.parse_info.state.is_timeout()
    }

    fn is_same_file(&self, other: &Self) -> bool {
        self.file_info == other.file_info
            && self.parse_info == other.parse_info
            && self.parser == other.parser
    }
}

pub struct File {
    term_display: Rc<TermDisplayContext>,
    analysis: Result<AnalysisState, RcAnalysis>,
    current_trace: SidebarSection,

    view: ViewProps,
    nested_screen: NestedScreen,

    _handle: ContextHandle<Rc<ConfigurationProvider>>,
}

#[derive(Clone)]
enum ViewProps {
    Overview,
    Graph(GraphProps),
    MatchingLoop(MatchingLoopProps),
}

impl File {
    fn analysis(&self) -> Option<&RcAnalysis> {
        self.analysis.as_ref().err()
    }

    fn analysis_or_error(&self, link: &Scope<Self>, code: u16) -> Option<&RcAnalysis> {
        let analysis = self.analysis();
        if analysis.is_none() {
            let message = OmniboxMessage {
                message: format!("Internal error E{code}"),
                kind: OmniboxMessageKind::Error,
            };
            link.omnibox_message(message, 1000);
        }
        analysis
    }
}

pub enum FileM {
    StartAnalysis,
    ChangeView(ViewChoice),
    ConfigChanged(Rc<ConfigurationProvider>),

    NestedUpdate(NestedScreenM),
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
        let nested_screen = NestedScreen::new(link.callback(FileM::NestedUpdate));
        let (cfg, _handle) = link.context(link.callback(FileM::ConfigChanged)).unwrap();
        let term_display = cfg.config.term_display.for_file(&props.file_info);

        let current_trace = Self::current_trace(link, props);

        let link = link.clone();
        gloo::timers::callback::Timeout::new(10, move || {
            link.send_message(FileM::StartAnalysis);
        })
        .forget();

        let analysis = Ok(AnalysisState::ConstructingGraph);
        Self {
            term_display: Rc::new(term_display),
            analysis,
            current_trace,
            view: ViewProps::Overview,
            nested_screen,
            _handle,
        }
    }

    fn changed(
        &mut self,
        link: &Scope<Self>,
        props: &Self::Properties,
        old_props: &Self::Properties,
    ) -> bool {
        if !props.is_same_file(old_props) {
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

                let parser = props.parser.parser.borrow();
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
                    ViewChoice::Overview => ViewProps::Overview,
                    ViewChoice::Graph => {
                        let Some(analysis) = self.analysis_or_error(link, 12) else {
                            return false;
                        };
                        ViewProps::Graph(GraphProps {
                            parser: props.parser.clone(),
                            analysis: analysis.clone(),
                            default_filters: DEFAULT_FILTER_CHAIN.to_vec(),
                            default_disablers: DEFAULT_DISABLER_CHAIN.to_vec(),
                            extra: None,
                        })
                    }
                    ViewChoice::MatchingLoop => {
                        let Some(analysis) = self.analysis_or_error(link, 13) else {
                            return false;
                        };
                        ViewProps::MatchingLoop(MatchingLoopProps {
                            file: props.file_info.clone(),
                            parser: props.parser.clone(),
                            analysis: analysis.clone(),
                        })
                    }
                };
                self.view = view;
                true
            }
            FileM::ConfigChanged(cfg) => {
                self.term_display = Rc::new(cfg.config.term_display.for_file(&props.file_info));
                true
            }

            FileM::NestedUpdate(update) => {
                self.nested_screen.update(update);
                true
            }
        }
    }

    fn view(&self, _link: &Scope<Self>, props: &Self::Properties) -> Html {
        let screen = match self.view.clone() {
            ViewProps::Overview => {
                html! { <Summary parser={props.parser.clone()} /> }
            }
            ViewProps::Graph(initial) => self.nested_screen.view::<Graph>(initial),
            ViewProps::MatchingLoop(initial) => self.nested_screen.view::<MatchingLoop>(initial),
        };
        html! {<ContextProvider<Rc<TermDisplayContext>> context={self.term_display.clone()}>
            {screen}
        </ContextProvider<Rc<TermDisplayContext>>>}
    }

    #[allow(refining_impl_trait_reachable)]
    fn view_sidebar(&self, _link: &Scope<Self>, _props: &Self::Properties) -> Sidebar {
        [self.get_current_trace()]
            .into_iter()
            .chain(self.nested_screen.sidebar().iter().cloned())
            .collect()
    }

    #[allow(refining_impl_trait_reachable)]
    fn view_topbar(&self, _link: &Scope<Self>, _props: &Self::Properties) -> Rc<Topbar> {
        self.nested_screen.topbar().clone()
    }

    #[allow(refining_impl_trait_reachable)]
    fn view_omnibox(&self, _link: &Scope<Self>, props: &Self::Properties) -> MaybeRc<Omnibox> {
        let Ok(analysis) = &self.analysis else {
            let omnibox: Rc<Omnibox> = self.nested_screen.omnibox().clone();
            return omnibox.into();
        };
        match analysis {
            AnalysisState::ConstructingGraph => {
                let message = if props.timeout() {
                    "Analysing partial trace".to_string()
                } else {
                    "Analysing trace".to_string()
                };
                let loading = OmniboxLoading::indeterminate();
                Omnibox::Loading(OmniboxLoading {
                    icon: "pending",
                    icon_mousedown: None,
                    message,
                    loading,
                })
                .into()
            }
            AnalysisState::Failed(error) => Omnibox::Message(OmniboxMessage {
                message: error.clone(),
                kind: OmniboxMessageKind::Error,
            })
            .into(),
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
        let trace_info = match &props.parse_info.state {
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
