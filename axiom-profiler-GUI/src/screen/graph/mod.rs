mod display;
mod filter;
mod render;
mod visible;

use std::rc::Rc;

use material_yew::{dialog::MatDialog, WeakComponentLink};
use smt_log_parser::analysis::{visible::VisibleInstGraph, RawNodeIndex, VisibleEdgeIndex};
use yew::{html, html::Scope, Html};

use crate::{
    results::{
        filters::{Filter, FilterOutput, FilterOutputKind},
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
}

pub struct Graph {
    state: Result<GraphState, RenderedGraph>,
    /// Either waiting for render or permissions (so the state could be either
    /// of the two)
    waiting: Option<Rc<VisibleInstGraph>>,

    filter: FiltersState,
    /// The maximum dimensions I have permission to render
    permissions: GraphDimensions,

    selected_nodes: Vec<RawNodeIndex>,
    selected_edges: Vec<VisibleEdgeIndex>,

    graph_warning: WeakComponentLink<MatDialog>,
}

impl Graph {
    fn rendered_graph(&self) -> Option<&RenderedGraph> {
        self.state.as_ref().err()
    }
}

pub enum GraphM {
    RenderCommand(RenderCommand, bool),
    UndoOperation(bool),
    UserPermission(WarningChoice),
    RenderedGraph(RenderedGraph),
    Filter(FilterM),

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
            filter: FiltersState::new(props.default_filters.clone(), link),
            permissions: GraphDimensions::default_permissions(),
            selected_nodes: Vec::new(),
            selected_edges: Vec::new(),
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
            self.filter = FiltersState::new(props.default_filters.clone(), link);
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
            GraphM::RenderCommand(cmd, filter_only) => {
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
                )
            }
            GraphM::UndoOperation(undo) => self.filter.chain.undo_operation(link, undo, false),
            GraphM::UserPermission(choice) => match choice {
                WarningChoice::Cancel => {
                    assert!(self.rendered_graph().is_some());
                    let Some(_) = self.waiting.take() else {
                        log::error!("UserPermission: could not find graph-to-render to cancel");
                        return false;
                    };
                    self.filter.chain.undo_operation(link, true, true);
                    true
                }
                WarningChoice::Apply => false,
                WarningChoice::Render => {
                    let Some(visible) = self.waiting.take() else {
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
            GraphM::RenderedGraph(rendered) => {
                drop(self.waiting.take());
                self.state = Err(rendered);
                true
            }
            GraphM::Filter(filter) => self.filter.update(link, filter),
            GraphM::Selection(sel) => match sel {
                SelectionM::SetSelection(nodes, edges) => {
                    if self.selected_nodes == nodes && self.selected_edges == edges {
                        return false;
                    }
                    self.selected_nodes = nodes;
                    self.selected_edges = edges;
                    true
                }
                SelectionM::ToggleNode(node) => {
                    let idx = self.selected_nodes.iter().position(|&n| n == node);
                    if let Some(idx) = idx {
                        self.selected_nodes.remove(idx);
                    } else {
                        self.selected_nodes.push(node);
                    }
                    true
                }
                SelectionM::ToggleEdge(edge) => {
                    let idx = self.selected_edges.iter().position(|&e| e == edge);
                    if let Some(idx) = idx {
                        self.selected_edges.remove(idx);
                    } else {
                        self.selected_edges.push(edge);
                    }
                    true
                }
                SelectionM::DeselectAll => {
                    if self.selected_nodes.is_empty() && self.selected_edges.is_empty() {
                        return false;
                    }
                    self.selected_nodes.clear();
                    self.selected_edges.clear();
                    true
                }
            },
        }
    }

    fn view(&self, link: &Scope<Manager>, props: &Self::Properties) -> Html {
        let Some(rendered) = self.rendered_graph() else {
            return html! {};
        };
        let dimensions = self
            .waiting
            .as_deref()
            .map(GraphDimensions::of_graph)
            .unwrap_or(rendered.dims());
        html! {<>
            <GraphInfo
                parser={props.parser.clone()}
                analysis={props.analysis.clone()}
                rendered={rendered.clone()}
                outdated={self.waiting.is_some()}
                selected_nodes={self.selected_nodes.clone()}
                selected_edges={self.selected_edges.clone()}
                update_selected={link.callback(GraphM::Selection)}
            />
            <Warning noderef={self.graph_warning.clone()} onclosed={link.callback(GraphM::UserPermission)} {dimensions}/>
        </>}
    }

    fn view_sidebar(&self, link: &Scope<Manager>, _props: &Self::Properties) -> Sidebar {
        let waiting = self.waiting.as_deref().map(GraphDimensions::of_graph);
        let rendered = self.rendered_graph().map(RenderedGraph::dims);
        let dims = waiting.or(rendered);
        vec![self.filter.sidebar(dims, link)]
    }

    fn view_topbar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Topbar {
        // TODO
        vec![]
    }

    fn view_omnibox(&self, _link: &Scope<Manager>, _props: &Self::Properties) -> Omnibox {
        let mut omnibox = Omnibox::default();
        match &self.state {
            Ok(GraphState::GraphToDot | GraphState::RenderingGraph) => {
                omnibox.disabled = true;
                omnibox.placeholder = "Rendering trace".to_string();
                omnibox.progress.indeterminate = true;
                omnibox.progress.closed = false;
            }
            Err(_) => (),
        }
        omnibox
    }
}
