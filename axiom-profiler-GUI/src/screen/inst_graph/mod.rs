mod dimensions;
mod display;
pub mod filter;
mod render;
mod search;
mod visible;

use std::cell::Ref;

use filter::DisablersState;
use material_yew::{dialog::MatDialog, WeakComponentLink};
use smt_log_parser::{
    analysis::{visible::VisibleInstGraph, RawNodeIndex, VisibleEdgeIndex},
    Z3Parser,
};
use yew::{html, Html};

use crate::{
    infobars::{OmniboxMessage, OmniboxMessageKind},
    utils::split_div::SplitDivProps,
};

use super::{
    extra::{Omnibox, OmniboxLoading, Sidebar, Topbar},
    file::{AnalysisData, RcAnalysis},
    homepage::RcParser,
    maybe_rc::MaybeRc,
    Scope, Screen,
};

use self::{
    display::{GraphContainer, GraphInfo, SvgViewM},
    filter::{Disabler, Filter, FilterM, FiltersState, RenderCommand},
    render::warning::{Warning, WarningChoice},
    visible::GraphState,
};

pub use self::{
    dimensions::GraphDimensions,
    display::UserSelectionM,
    visible::{RcVisibleGraph, RenderedGraph},
};

#[derive(Clone, PartialEq)]
pub struct GraphProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub default_filters: Vec<Filter>,
    pub default_disablers: Vec<(Disabler, bool)>,
    pub extra: Option<GraphExtraProps>,
}

impl GraphProps {
    fn borrow(&self) -> (Ref<'_, Z3Parser>, Ref<'_, AnalysisData>) {
        (self.parser.parser.borrow(), self.analysis.borrow())
    }
}

#[derive(Clone, PartialEq)]
pub struct GraphExtraProps {
    pub split: SplitDivProps,
    pub swap_split: bool,
    pub info_top: Html,
}

pub struct Graph {
    state: Result<GraphState, RenderedGraph>,
    /// Either waiting for render or permissions (so the state could be either
    /// of the two)
    waiting: Option<(bool, RcVisibleGraph)>,

    filter: FiltersState,
    disabler: DisablersState,

    nodes_to_select: Vec<RawNodeIndex>,

    svg_view: WeakComponentLink<GraphContainer>,
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
    ResetFilters,
    ToggleDisabler(usize),

    Selection(SelectionM),
}

pub enum SelectionM {
    SetSelection(Vec<RawNodeIndex>, Vec<VisibleEdgeIndex>),
    ToggleNode(RawNodeIndex),
    SelectAndScrollTo(RawNodeIndex),
    ToggleEdge(VisibleEdgeIndex),
    DeselectAll,
}

impl Screen for Graph {
    type Message = GraphM;
    type Properties = GraphProps;

    fn create(link: &Scope<Self>, props: &Self::Properties) -> Self {
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
            svg_view: WeakComponentLink::default(),
            graph_warning: WeakComponentLink::default(),
        }
    }

    fn changed(
        &mut self,
        link: &Scope<Self>,
        props: &Self::Properties,
        old_props: &Self::Properties,
    ) -> bool {
        if props.parser != old_props.parser || props.analysis != old_props.analysis {
            *self = Self::create(link, props);
            return true;
        }
        let disablers_changed = props.default_disablers != old_props.default_disablers;
        if disablers_changed {
            self.disabler = DisablersState::new(props.default_disablers.clone());
        }
        if props.default_filters != old_props.default_filters {
            self.filter = FiltersState::new(
                props.default_filters.clone(),
                Self::default_permissions(),
                link,
            );
        } else if disablers_changed {
            self.filter.chain.rerender(link, true);
        }
        true
    }

    fn update(&mut self, link: &Scope<Self>, props: &Self::Properties, msg: Self::Message) -> bool {
        match msg {
            GraphM::RenderCommand {
                cmd,
                filter_only,
                from_undo,
            } => {
                let parser = props.parser.parser.borrow();
                let mut analysis = props.analysis.borrow_mut();

                let (is_first, modified, update_view) =
                    self.apply_filter(&parser, &mut analysis.graph, cmd);
                if !modified || filter_only {
                    return update_view;
                }
                self.render_careful(
                    link,
                    &parser,
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
                    let (parser, analysis) = props.borrow();
                    self.render(
                        visible,
                        link,
                        &parser,
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
            GraphM::ResetFilters => {
                self.filter = FiltersState::new(
                    props.default_filters.clone(),
                    Self::default_permissions(),
                    link,
                );
                true
            }
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
                    SelectionM::SelectAndScrollTo(node) => {
                        if let Some(svg) = &*self.svg_view.borrow() {
                            rendered.selected_nodes.clear();
                            rendered.selected_edges.clear();
                            rendered.selected_nodes.push(node);
                            svg.send_message(SvgViewM::ScrollZoomSelection(
                                rendered.selected_nodes.clone(),
                                rendered.selected_edges.clone(),
                            ));
                            true
                        } else {
                            false
                        }
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
                        if rendered.selected_nodes.is_empty() && rendered.selected_edges.is_empty()
                        {
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

    fn view(&self, link: &Scope<Self>, props: &Self::Properties) -> Html {
        let Some(rendered) = self.rendered_graph() else {
            return html! {};
        };
        let dimensions = self
            .waiting()
            .map_or(rendered.dims(), GraphDimensions::of_graph);
        html! {<>
            <GraphInfo
                parser={props.parser.clone()}
                analysis={props.analysis.clone()}
                rendered={rendered.clone()}
                outdated={self.waiting.is_some()}
                update_selected={link.callback(GraphM::Selection)}
                svg_view={self.svg_view.clone()}
                extra={props.extra.clone()}
            />
            <Warning noderef={self.graph_warning.clone()} onclosed={link.callback(GraphM::UserPermission)} {dimensions}/>
        </>}
    }

    #[allow(refining_impl_trait)]
    fn view_sidebar(&self, link: &Scope<Self>, props: &Self::Properties) -> Sidebar {
        let waiting = self.waiting().map(GraphDimensions::of_graph);
        let rendered = self.rendered_graph().map(RenderedGraph::dims);
        let dims = waiting.or(rendered);
        vec![
            self.filter.sidebar(dims, link, &props.analysis),
            self.disabler.sidebar(link),
        ]
    }

    #[allow(refining_impl_trait)]
    fn view_topbar(&self, link: &Scope<Self>, props: &Self::Properties) -> Topbar {
        let (parser, analysis) = props.borrow();
        let selected = self
            .rendered_graph()
            .map(|r| r.selected_nodes.as_slice())
            .unwrap_or_default();
        let can_reset = self.filter.can_reset(&props.default_filters);
        let reset = can_reset.then(|| link.callback(|()| GraphM::ResetFilters));
        FiltersState::topbar(
            &parser,
            &analysis.graph,
            &link.callback(|f| GraphM::Filter(FilterM::AddFilter(f))),
            selected,
            reset,
        )
    }

    #[allow(refining_impl_trait)]
    fn view_omnibox(&self, _link: &Scope<Self>, _props: &Self::Properties) -> MaybeRc<Omnibox> {
        match &self.state {
            Ok(GraphState::GraphToDot | GraphState::RenderingGraph) => {
                let message = "Rendering trace".to_string();
                let mut loading = OmniboxLoading::indeterminate();
                loading.progress = 1.0;
                Omnibox::Loading(OmniboxLoading {
                    icon: "pending",
                    icon_mousedown: None,
                    message,
                    loading,
                })
                .into()
            }
            Ok(GraphState::Failed(error)) => Omnibox::Message(OmniboxMessage {
                message: error.clone(),
                kind: OmniboxMessageKind::Error,
            })
            .into(),
            Err(rendered) => rendered.search.clone().into(),
        }
    }
}
