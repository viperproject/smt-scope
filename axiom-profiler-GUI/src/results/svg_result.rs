use crate::{
    configuration::ConfigurationContext,
    filters,
    results::{
        filters::FilterOutput,
        graph_info::{GraphInfo, MatchingLoopGraphData, Msg as GraphInfoMsg},
        graphviz::{DotEdgeProperties, DotNodeProperties},
    },
    state::StateContext,
    OpenedFileInfo,
};

use super::{
    filters::{Disabler, Filter},
    render_warning::{Warning, WarningChoice},
    worker::Worker,
};
use material_yew::{dialog::MatDialog, WeakComponentLink};
use petgraph::{
    dot::{Config, Dot},
    visit::EdgeRef,
};
use smt_log_parser::{
    analysis::{
        analysis::matching_loop::MatchingLoop, visible::VisibleInstGraph, InstGraph, RawNodeIndex,
        VisibleEdgeIndex,
    },
    display_with::DisplayCtxt,
    NonMaxU32,
};
use std::{cell::RefCell, rc::Rc};
use viz_js::VizInstance;
use web_sys::window;
use yew::prelude::*;

pub const EDGE_LIMIT: usize = 2000;
pub const NODE_LIMIT: usize = 4000;
pub const DEFAULT_NODE_COUNT: usize = 300;
pub const AST_DEPTH_LIMIT: NonMaxU32 = unsafe { NonMaxU32::new_unchecked(5) };

#[derive(Clone)]
pub struct RenderedGraph {
    pub graph: Rc<VisibleInstGraph>,
    pub svg_text: AttrValue,
}

impl PartialEq for RenderedGraph {
    fn eq(&self, other: &Self) -> bool {
        self.graph.generation == other.graph.generation
    }
}
impl Eq for RenderedGraph {}

pub enum Msg {
    ConstructedGraph(Rc<RefCell<InstGraph>>),
    FailedConstructGraph(String),
    UpdateSvgText(AttrValue, VisibleInstGraph),
    SetPermission(GraphDimensions),
    SetDisabled(Vec<Disabler>),
    RenderGraph(bool),
    ApplyFilter(Filter),
    ResetGraph,
    UserPermission(WarningChoice),
    WorkerOutput(super::worker::WorkerOutput),
    RenderMLGraph(usize, MatchingLoop),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct GraphDimensions {
    pub node_count: usize,
    pub edge_count: usize,
}

#[derive(Debug, Clone, PartialEq)]
pub enum RenderingState {
    ConstructingGraph,
    ConstructedGraph,
    GraphToDot,
    RenderingGraph,
}

pub enum GraphState {
    Rendering(RenderingState),
    Constructed(RenderedGraph),
    Failed(String),
}

pub struct SVGResult {
    /// Calculated visible graph stored here to avoid recalculating it when
    /// waiting for user permission.
    calculated: Option<VisibleInstGraph>,
    /// The calculated graph is moved here once rendered.
    rendered: Option<RenderedGraph>,

    graph_warning: WeakComponentLink<MatDialog>,
    graph_dim: GraphDimensions,
    permissions: GraphDimensions,
    worker: Option<Box<dyn yew_agent::Bridge<Worker>>>,
    async_graph_and_filter_chain: bool,
    // selected_insts: Vec<RawNodeIndex>,
    // data: Option<SVGData>,
    queue: Vec<Msg>,
    constructed_graph: Option<Rc<RefCell<InstGraph>>>,
}

#[derive(Properties, PartialEq)]
pub struct SVGProps {
    pub file: OpenedFileInfo,
    pub progress: Callback<GraphState>,
    pub selected_nodes: Callback<Vec<RawNodeIndex>>,
    pub selected_edges: Callback<Vec<VisibleEdgeIndex>>,
    pub insts_info_link: WeakComponentLink<GraphInfo>,
}

impl Component for SVGResult {
    type Message = Msg;
    type Properties = SVGProps;

    fn create(ctx: &Context<Self>) -> Self {
        {
            let mut update = (*ctx.props().file.update).borrow_mut();
            let old = std::mem::replace(&mut *update, Ok(ctx.link().callback(|msg| msg)));
            if let Err(old) = old {
                ctx.link().send_message_batch(old);
            }
        }
        ctx.props()
            .progress
            .emit(GraphState::Rendering(RenderingState::ConstructingGraph));
        let link = ctx.link().clone();
        wasm_bindgen_futures::spawn_local(async move {
            gloo::timers::future::TimeoutFuture::new(10).await;
            let data = link.get_state().unwrap();
            let parser = data.state.parser.as_ref().unwrap();
            let inst_graph = match InstGraph::new(&parser.parser.borrow()) {
                Ok(inst_graph) => inst_graph,
                Err(err) => {
                    log::error!("Failed constructing instantiation graph: {err:?}");
                    let error = if err.is_oom() {
                        "Out of memory, try stopping earlier".to_string()
                    } else {
                        // Should not be reachable
                        format!("Unexpected error: {err:?}")
                    };
                    link.send_message(Msg::FailedConstructGraph(error));
                    return;
                }
            };
            let inst_graph = Rc::new(RefCell::new(inst_graph));
            let inst_graph_ref = inst_graph.clone();
            data.update_graph(|p| {
                p.graph = Some(inst_graph_ref);
                true
            });
            link.send_message(Msg::ConstructedGraph(inst_graph));
        });
        Self {
            calculated: None,
            rendered: None,
            graph_warning: WeakComponentLink::default(),
            graph_dim: GraphDimensions {
                node_count: 0,
                edge_count: 0,
            },
            permissions: GraphDimensions {
                node_count: NODE_LIMIT,
                edge_count: EDGE_LIMIT,
            },
            worker: Some(Self::create_worker(ctx.link().clone())),
            async_graph_and_filter_chain: false,
            // selected_insts: Vec::new(),
            // data: None,
            queue: Vec::new(),
            constructed_graph: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::ConstructedGraph(parser) => {
                self.constructed_graph = Some(parser);
                let queue = std::mem::take(&mut self.queue);
                ctx.props()
                    .progress
                    .emit(GraphState::Rendering(RenderingState::ConstructedGraph));
                ctx.link().send_message_batch(queue);
                return true;
            }
            Msg::FailedConstructGraph(error) => {
                ctx.props().progress.emit(GraphState::Failed(error));
                return false;
            }
            _ => (),
        }
        let Some(inst_graph) = &self.constructed_graph else {
            self.queue.push(msg);
            return false;
        };
        let data = ctx.link().get_state().unwrap();
        let rc_parser = data.state.parser.as_ref().unwrap();
        let parser = &rc_parser.parser;
        let mut inst_graph = (**inst_graph).borrow_mut();
        let inst_graph = &mut *inst_graph;
        match msg {
            Msg::ConstructedGraph(_) => unreachable!(),
            Msg::FailedConstructGraph(_) => unreachable!(),
            Msg::WorkerOutput(_out) => false,
            Msg::ApplyFilter(filter) => {
                log::debug!("Applying filter {:?}", filter);
                let config = |parser| {
                    let cfg = ctx.link().get_configuration().unwrap();
                    DisplayCtxt {
                        parser,
                        term_display: &data.state.term_display,
                        config: cfg.config.display,
                    }
                };
                match filter.apply(inst_graph, &parser.borrow(), config) {
                    FilterOutput::LongestPath(path) => {
                        ctx.props().selected_nodes.emit(path);
                        // self.insts_info_link
                        //     .borrow()
                        //     .as_ref()
                        //     .unwrap()
                        //     .send_message(GraphInfoMsg::SelectNodes(path));
                        false
                    }
                    FilterOutput::MatchingLoopGeneralizedTerms(gen_terms) => {
                        ctx.props()
                            .insts_info_link
                            .borrow()
                            .as_ref()
                            .unwrap()
                            .send_message(GraphInfoMsg::ShowGeneralizedTerms(gen_terms));
                        false
                    }
                    FilterOutput::MatchingLoopGraph(ml_idx, graph) => {
                        ctx.link().send_message(Msg::RenderMLGraph(ml_idx, graph));
                        false
                    }
                    FilterOutput::None => false,
                }
            }
            Msg::ResetGraph => {
                inst_graph.raw.reset_visibility_to(false);
                false
            }
            Msg::SetPermission(dim) => {
                self.permissions = dim;
                false
            }
            Msg::SetDisabled(disablers) => {
                Disabler::apply(disablers.iter().copied(), inst_graph, &parser.borrow());
                false
            }
            Msg::RenderGraph(first) => {
                if self
                    .rendered
                    .as_ref()
                    .is_some_and(|r| inst_graph.visible_unchanged(&r.graph))
                {
                    return false;
                }
                let calculated = self
                    .calculated
                    .take()
                    .filter(|c| inst_graph.visible_unchanged(c));
                let calculated = calculated.unwrap_or_else(|| inst_graph.to_visible());
                let (node_count, edge_count) =
                    (calculated.graph.node_count(), calculated.graph.edge_count());
                self.graph_dim.node_count = node_count;
                self.graph_dim.edge_count = edge_count;
                if edge_count <= self.permissions.edge_count
                    && node_count <= self.permissions.node_count
                {
                    log::debug!(
                        "Rendering graph with {} nodes and {} edges",
                        node_count,
                        edge_count
                    );
                    self.permissions.edge_count = edge_count.max(EDGE_LIMIT);
                    self.permissions.node_count = node_count.max(NODE_LIMIT);

                    self.async_graph_and_filter_chain = false;
                    ctx.props()
                        .progress
                        .emit(GraphState::Rendering(RenderingState::GraphToDot));
                    let filtered_graph = &calculated.graph;
                    let cfg = ctx.link().get_configuration().unwrap();
                    let ctxt = DisplayCtxt {
                        parser: &parser.borrow(),
                        term_display: &data.state.term_display,
                        config: cfg.config.display,
                    };

                    // Performance observations (default value is in [])
                    //  - splines=false -> 38s | [splines=true] -> ??
                    //  - nslimit=2 -> 7s | nslimit=4 -> 9s | nslimit=7 -> 11.5s | nslimit=10 -> 14s | [nslimit=INT_MAX] -> 38s
                    //  - [mclimit=1] -> 7s | mclimit=0.5 -> 4s (with nslimit=2)
                    // `ranksep` dictates the distance between ranks (rows) in the graph,
                    // it should be set dynamically based on the average number of children
                    // per node out of all nodes with at least one child.
                    let settings = [
                        "ranksep=1.0;",
                        "splines=false;",
                        "nslimit=6;",
                        "mclimit=0.6;",
                        // TODO: explore this as an option, alternatively allow
                        // displaying only some subgraphs.
                        // "pack=32;",
                        // "packMode=\"graph\";",
                    ];
                    let dot_output = format!(
                        "digraph {{\n    {}\n{:?}}}",
                        settings.join("\n    "),
                        Dot::with_attr_getters(
                            filtered_graph,
                            &[
                                Config::EdgeNoLabel,
                                Config::NodeNoLabel,
                                Config::GraphContentOnly
                            ],
                            &|fg, edge_data| {
                                let (from, to) =
                                    (fg[edge_data.source()].idx, fg[edge_data.target()].idx);
                                let edge = edge_data.weight();
                                let is_indirect = edge.is_indirect(inst_graph);
                                let blame = edge.kind(inst_graph).blame(inst_graph);
                                let (from, to) =
                                    (inst_graph.raw[from].kind(), inst_graph.raw[to].kind());
                                let all = edge.all(
                                    (),
                                    (is_indirect, *from, *to),
                                    is_indirect,
                                    is_indirect,
                                    blame,
                                    (),
                                );
                                // For edges the `id` is the `VisibleEdgeIndex` from the VisibleGraph!
                                format!("id=edge_{} {all}", edge_data.id().index())
                            },
                            &|_, (_, data)| {
                                let idx = data.idx.0.index();
                                let node_data = &inst_graph.raw[data.idx];
                                let all = node_data.kind().all(
                                    (),
                                    (ctxt, false, None),
                                    ctxt.parser,
                                    (data.hidden_parents, data.hidden_children),
                                    (ctxt.parser, &rc_parser.colour_map),
                                    (),
                                    (),
                                );
                                // For nodes the `id` is the `RawNodeIndex` from the original graph!
                                format!("id=node_{idx} {all}")
                            },
                        )
                    );
                    // log::debug!("Graph DOT:\n{dot_output}");
                    ctx.props()
                        .progress
                        .emit(GraphState::Rendering(RenderingState::RenderingGraph));
                    let link = ctx.link().clone();
                    wasm_bindgen_futures::spawn_local(async move {
                        gloo_timers::future::TimeoutFuture::new(10).await;
                        let graphviz = VizInstance::new().await;
                        let options = viz_js::Options::default();
                        // options.engine = "twopi".to_string();
                        let window = window().expect("should have a window in this context");
                        let performance = window
                            .performance()
                            .expect("should have a performance object");
                        let start_timestamp = performance.now();
                        let svg = graphviz
                            .render_svg_element(dot_output, options)
                            .expect("Could not render graphviz");
                        let end_timestamp = performance.now();
                        let elapsed_seconds = (end_timestamp - start_timestamp) / 1000.0;
                        log::info!(
                            "Graph: Converting dot-String to SVG took {} seconds",
                            elapsed_seconds
                        );
                        let svg_text = svg.outer_html();
                        link.send_message(Msg::UpdateSvgText(
                            AttrValue::from(svg_text),
                            calculated,
                        ));
                    });
                    // only need to re-render once the new SVG has been set
                    false
                } else {
                    self.calculated = Some(calculated);
                    if first {
                        // We can run into an issue where `graph_warning` hasn't
                        // been initialised if this case is triggered during the
                        // first render. In this case we delay the warning.
                        // TODO: improve this asap
                        let warning = self.graph_warning.clone();
                        gloo_timers::callback::Timeout::new(1, move || warning.show()).forget();
                    } else {
                        self.graph_warning.show();
                    }
                    true
                }
            }
            Msg::UserPermission(choice) => match choice {
                WarningChoice::Cancel => {
                    ctx.props()
                        .file
                        .filter
                        .borrow()
                        .as_ref()
                        .unwrap()
                        .send_message(filters::Msg::UndoOperation(true));
                    false
                }
                WarningChoice::Apply => {
                    self.async_graph_and_filter_chain = true;
                    true
                }
                WarningChoice::Render => {
                    ctx.link().send_message(Msg::SetPermission(self.graph_dim));
                    ctx.link().send_message(Msg::RenderGraph(false));
                    false
                }
            },
            Msg::UpdateSvgText(svg_text, rendered) => {
                let rendered = RenderedGraph {
                    graph: Rc::new(rendered),
                    svg_text,
                };
                self.rendered = Some(rendered.clone());
                ctx.props().progress.emit(GraphState::Constructed(rendered));
                true
            }
            Msg::RenderMLGraph(ml_idx, graph) => {
                let Some(graph) = graph.graph else {
                    let link = ctx.props().insts_info_link.borrow();
                    link.as_ref()
                        .unwrap()
                        .send_message(GraphInfoMsg::ShowMatchingLoopGraph(Some(
                            MatchingLoopGraphData::ShowEmpty(ml_idx),
                        )));
                    return false;
                };
                let cfg = ctx.link().get_configuration().unwrap();
                let mut ctxt = DisplayCtxt {
                    parser: &parser.borrow(),
                    term_display: &data.state.term_display,
                    config: cfg.config.display,
                };
                ctxt.config.font_tag = true;

                let settings = ["ranksep=0.5;", "splines=true;"];
                let dot = format!(
                    "{:?}",
                    Dot::with_attr_getters(
                        &*graph.data,
                        &[
                            Config::EdgeNoLabel,
                            Config::NodeNoLabel,
                            Config::GraphContentOnly
                        ],
                        &|_, edge| edge.weight().all(ctxt.config.debug, (), (), (), (), ()),
                        &|_, (_, node_data)| {
                            node_data.all(ctxt, ctxt, (), (), &rc_parser.colour_map, (), ())
                        },
                    )
                );
                let mut inputs = Vec::new();
                let mut fixeds = Vec::new();
                let mut outputs = Vec::new();
                let mut outside = Vec::new();
                for line in dot.lines() {
                    let idx = line.find("class=\"");
                    let class = idx.and_then(|idx| line[idx + 7..].split('"').next());
                    match class {
                        Some("input") => inputs.push(line),
                        Some("fixed") => fixeds.push(line),
                        Some("output") => outputs.push(line),
                        _ => outside.push(line),
                    }
                }
                let join = "\n    ";
                let cluster = |name, colour, middle| {
                    format!("subgraph cluster_{name} {{{join}    style=filled{join}    color={colour}{join}{middle}{join}}}")
                };
                // let cluster = |name, colour, middle|
                //     format!("subgraph cluster_{name} {{{join}    style=filled{join}    color={colour}{join}    {{{join}    rank=same{join}    rankdir=LR{join}{middle}{join}    }}{join}}}");

                let cluster_in = cluster("in", "aliceblue", inputs.join(join));
                let cluster_fixed = cluster("fixed", "gray96", fixeds.join(join));
                let cluster_out = cluster("out", "aliceblue", outputs.join(join));
                let dot_output = format!(
                    "digraph {{{join}{}{join}{cluster_in}{join}{cluster_fixed}{join}{cluster_out}{join}{}\n}}",
                    settings.join(join),
                    outside.join("\n"),
                );
                log::debug!("ML Graph DOT:\n{dot_output}");
                ctx.props()
                    .progress
                    .emit(GraphState::Rendering(RenderingState::RenderingGraph));
                let link = ctx.props().insts_info_link.borrow().clone();
                wasm_bindgen_futures::spawn_local(async move {
                    gloo_timers::future::TimeoutFuture::new(10).await;
                    let graphviz = VizInstance::new().await;
                    let options = viz_js::Options::default();
                    // options.engine = "twopi".to_string();
                    let window = window().expect("should have a window in this context");
                    let performance = window
                        .performance()
                        .expect("should have a performance object");
                    let start_timestamp = performance.now();
                    let svg = graphviz
                        .render_svg_element(dot_output, options)
                        .expect("Could not render graphviz");
                    let end_timestamp = performance.now();
                    let elapsed_seconds = (end_timestamp - start_timestamp) / 1000.0;
                    log::info!(
                        "ML-graph: Converting dot-String to SVG took {} seconds",
                        elapsed_seconds
                    );
                    let svg_text = svg.outer_html();
                    link.unwrap()
                        .send_message(GraphInfoMsg::ShowMatchingLoopGraph(Some(
                            MatchingLoopGraphData::Show {
                                ml_idx,
                                incomplete: graph.graph_incomplete,
                                data: AttrValue::from(svg_text),
                            },
                        )));
                });
                // only need to re-render once the new SVG has been set
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        if self.constructed_graph.is_none() {
            return html! {};
        };
        html! {
            <><GraphInfo
                weak_link={ctx.props().insts_info_link.clone()}
                // node_info={data.get_node_info.clone()}
                // edge_info={data.get_edge_info.clone()}
                // parser={ctx.props().file.parser.clone()}
                rendered={self.rendered.clone()}
                outdated={self.async_graph_and_filter_chain}
                selected_nodes={ctx.props().file.selected_nodes.clone()}
                update_selected_nodes={ctx.props().selected_nodes.clone()}
                selected_edges={ctx.props().file.selected_edges.clone()}
                update_selected_edges={ctx.props().selected_edges.clone()}
            />
            <Warning noderef={self.graph_warning.clone()} onclosed={ctx.link().callback(Msg::UserPermission)} dimensions={self.graph_dim}/></>
        }
    }
}

impl SVGResult {
    /// Deletes the old worker with its queue of messages and creates a new one.
    /// Any enqueued work will still continue to run (there is no way to cancel this
    /// at the moment, see https://github.com/rustwasm/gloo/issues/408) but will not
    /// send a `WorkerOutput` message on completion.
    pub fn reset_worker(&mut self, link: yew::html::Scope<Self>) {
        // The old worker is dropped when overwritten here. Not sure we need the option?
        self.worker = Some(Self::create_worker(link));
    }
    /// Sends an input to the worker to process.
    pub fn send_worker_input(&mut self, input: super::worker::WorkerInput) {
        self.worker.as_mut().unwrap().send(input);
    }

    /// Used internally.
    fn create_worker(link: yew::html::Scope<Self>) -> Box<dyn yew_agent::Bridge<Worker>> {
        use yew_agent::Bridged;
        let cb = std::rc::Rc::new(move |e| link.send_message(Msg::WorkerOutput(e)));
        Worker::bridge(cb)
    }
}
