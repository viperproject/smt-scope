mod display;
mod filter;
mod render;
mod visible;

use std::rc::Rc;

use filter::DisablersState;
use material_yew::{dialog::MatDialog, WeakComponentLink};
use smt_log_parser::analysis::{visible::VisibleInstGraph, RawNodeIndex, VisibleEdgeIndex};
use yew::{html, html::Scope, Html};

use crate::{
    results::{
        filters::{Disabler, Filter, FilterOutput, FilterOutputKind},
        render_warning::{Warning, WarningChoice},
        svg_result::GraphDimensions,
    },
    screen::extra::{ElementKind, SidebarSection, SidebarSectionRef},
};

use super::{
    extra::{Omnibox, Sidebar, Topbar},
    file::RcAnalysis,
    homepage::RcParser,
    Manager, Screen,
};

use self::{
    display::GraphInfo,
    filter::{FilterM, FiltersState, RenderCommand},
    visible::{GraphState, RenderedGraph},
};

pub use self::display::UserSelectionM;

#[derive(Clone, PartialEq)]
pub struct GraphProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub default_filters: Vec<Filter>,
    pub default_disablers: Vec<(Disabler, bool)>,
}

pub struct Graph {
    state: Result<GraphState, RenderedGraph>,
    /// Either waiting for render or permissions (so the state could be either
    /// of the two)
    waiting: Option<(bool, Rc<VisibleInstGraph>)>,

    filter: FiltersState,
    disabler: DisablersState,

    nodes_to_select: Vec<RawNodeIndex>,

    graph_warning: WeakComponentLink<MatDialog>,
}

impl Graph {
    fn rendered_graph(&self) -> Option<&RenderedGraph> {
        self.state.as_ref().err()
    }
    fn waiting(&self) -> Option<&VisibleInstGraph> {
        self.waiting.as_ref().map(|(_, g)| &**g)
    }
    fn default_permissions() -> GraphDimensions {
        GraphDimensions::default_permissions()
    }
}

pub enum GraphM {
    RenderCommand {
        cmd: RenderCommand,
        filter_only: bool,
        from_undo: bool,
    },
    UndoOperation(bool),
    UserPermission(WarningChoice),
    RenderFailed(String),
    RenderedGraph(RenderedGraph),
    Filter(FilterM),
    ToggleDisabler(usize),

    Selection(SelectionM),
}

pub enum SelectionM {
    SetSelection(Vec<RawNodeIndex>, Vec<VisibleEdgeIndex>),
    ToggleNode(RawNodeIndex),
    ToggleEdge(VisibleEdgeIndex),
    DeselectAll,
}

impl Screen for Graph {
    type Message = GraphM;
    type Properties = GraphProps;

    fn create(link: &Scope<Manager>, props: &Self::Properties) -> Self {
        // let link = link.clone();
        // gloo::timers::callback::Timeout::new(10, move || {
        //     link.send_message(GraphM::RenderInitial);
        // })
        // .forget();

        Self {
            state: Ok(GraphState::GraphToDot),
            waiting: None,
            filter: FiltersState::new(
                props.default_filters.clone(),
                Self::default_permissions(),
                link,
            ),
            disabler: DisablersState::new(props.default_disablers.clone()),
            nodes_to_select: Vec::new(),
            graph_warning: WeakComponentLink::default(),
        }
    }

    fn changed(
        &mut self,
        link: &Scope<Manager>,
        props: &Self::Properties,
        old_props: &Self::Properties,
    ) -> bool {
        if props.parser != old_props.parser || props.analysis != old_props.analysis {
            *self = Self::create(link, props);
        } else if props.default_filters != old_props.default_filters {
            self.filter = FiltersState::new(
                props.default_filters.clone(),
                Self::default_permissions(),
                link,
            );
        }
        true
    }

    fn update(
        &mut self,
        link: &Scope<Manager>,
        props: &Self::Properties,
        msg: Self::Message,
    ) -> bool {
        match msg {
            GraphM::RenderCommand {
                cmd,
                filter_only,
                from_undo,
            } => {
                let parser = props.parser.parser.borrow();
                let mut analysis = props.analysis.borrow_mut();

                let (is_first, modified, update_view) =
                    self.apply_filter(&*parser, &mut analysis.graph, cmd);
                if !modified || filter_only {
                    return update_view;
                }
                self.render_careful(
                    link,
                    &*parser,
                    &analysis.graph,
                    &props.parser.colour_map,
                    is_first,
                    from_undo,
                )
            }
            GraphM::UndoOperation(undo) => self.filter.chain.undo_operation(link, undo, false),
            GraphM::UserPermission(choice) => match choice {
                WarningChoice::Cancel => {
                    assert!(self.rendered_graph().is_some());
                    let Some((from_undo, _)) = self.waiting.take() else {
                        log::error!("UserPermission: could not find graph-to-render to cancel");
                        return false;
                    };
                    self.filter.chain.undo_operation(link, !from_undo, true);
                    true
                }
                WarningChoice::Apply => false,
                WarningChoice::Render => {
                    let Some((_, visible)) = self.waiting.take() else {
                        log::error!("UserPermission: could not find graph-to-render to apply");
                        return false;
                    };
                    let parser = props.parser.parser.borrow();
                    let analysis = props.analysis.borrow();
                    self.render(
                        visible,
                        link,
                        &*parser,
                        &analysis.graph,
                        &props.parser.colour_map,
                    )
                }
            },
            GraphM::RenderFailed(err) => {
                log::error!("Error rendering graph: {err}");
                self.state = Ok(GraphState::Failed(err));
                true
            }
            GraphM::RenderedGraph(rendered) => {
                drop(self.waiting.take());
                self.state = Err(rendered);
                true
            }
            GraphM::Filter(filter) => self.filter.update(link, filter),
            GraphM::ToggleDisabler(idx) => {
                self.disabler.toggle(idx);
                self.filter.chain.rerender(link, false);
                true
            }
            GraphM::Selection(sel) => {
                let Err(rendered) = &mut self.state else {
                    return false;
                };
                match sel {
                    SelectionM::SetSelection(nodes, edges) => {
                        if rendered.selected_nodes == nodes && rendered.selected_edges == edges {
                            return false;
                        }
                        rendered.selected_nodes = nodes;
                        rendered.selected_edges = edges;
                        true
                    }
                    SelectionM::ToggleNode(node) => {
                        let idx = rendered.selected_nodes.iter().position(|&n| n == node);
                        if let Some(idx) = idx {
                            rendered.selected_nodes.remove(idx);
                        } else {
                            rendered.selected_nodes.push(node);
                        }
                        true
                    }
                    SelectionM::ToggleEdge(edge) => {
                        let idx = rendered.selected_edges.iter().position(|&e| e == edge);
                        if let Some(idx) = idx {
                            rendered.selected_edges.remove(idx);
                        } else {
                            rendered.selected_edges.push(edge);
                        }
                        true
                    }
                    SelectionM::DeselectAll => {
                        if rendered.selected_nodes.is_empty() && rendered.selected_edges.is_empty() {
                            return false;
                        }
                        rendered.selected_nodes.clear();
                        rendered.selected_edges.clear();
                        true
                    }
                }
            }
        }
    }

    fn view(&self, link: &Scope<Manager>, props: &Self::Properties) -> Html {
        let Some(rendered) = self.rendered_graph() else {
            return html! {};
        };
        let dimensions = self
            .waiting()
            .map(GraphDimensions::of_graph)
            .unwrap_or(rendered.dims());
        html! {<>
            <GraphInfo
                parser={props.parser.clone()}
                analysis={props.analysis.clone()}
                rendered={rendered.clone()}
                outdated={self.waiting.is_some()}
                selected_nodes={rendered.selected_nodes.clone()}
                selected_edges={rendered.selected_edges.clone()}
                update_selected={link.callback(GraphM::Selection)}
            />
            <Warning noderef={self.graph_warning.clone()} onclosed={link.callback(GraphM::UserPermission)} {dimensions}/>
        </>}
    }

    fn view_sidebar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Sidebar {
        let waiting = self.waiting().map(GraphDimensions::of_graph);
        let rendered = self.rendered_graph().map(RenderedGraph::dims);
        let dims = waiting.or(rendered);
        vec![self.filter.sidebar(dims, link, &props.analysis), self.disabler.sidebar(link)]
    }

    fn view_topbar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Topbar {
        let parser = props.parser.parser.borrow();
        let graph = props.analysis.borrow();
        let selected = self.rendered_graph().map(|r| r.selected_nodes.as_slice()).unwrap_or_default();
        FiltersState::topbar(
            &*parser,
            &graph.graph,
            &link.callback(|f| GraphM::Filter(FilterM::AddFilter(f))),
            selected,
        )
    }

    fn view_omnibox(&self, _link: &Scope<Manager>, _props: &Self::Properties) -> Omnibox {
        let mut omnibox = Omnibox::default();
        omnibox.disabled = self.state.is_ok();
        match &self.state {
            Ok(GraphState::GraphToDot | GraphState::RenderingGraph) => {
                omnibox.placeholder = "Rendering trace".to_string();
                omnibox.progress.indeterminate = true;
                omnibox.progress.closed = false;
            }
            Ok(GraphState::Failed(err)) => {
                omnibox.icon = "error";
                omnibox.placeholder = err.clone();
            }
            Err(_) => (),
        }
        omnibox
    }
}
