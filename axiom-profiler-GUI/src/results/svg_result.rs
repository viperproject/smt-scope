use crate::{
    configuration::ConfigurationContext,
    filters,
    results::{
        filters::FilterOutput,
        graph_info::{GraphInfo, Msg as GraphInfoMsg},
        node_info::{EdgeInfo, NodeInfo},
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
use palette::{encoding::Srgb, white_point::D65, FromColor, Hsluv, Hsv, LuvHue};
use petgraph::{
    dot::{Config, Dot},
    visit::EdgeRef,
};
use smt_log_parser::{
    analysis::{
        analysis::matching_loop::{MLGraphNode, MatchingLoop},
        raw::NodeKind,
        visible::VisibleInstGraph,
        InstGraph, RawNodeIndex, VisibleEdgeIndex,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::QuantIdx,
    NonMaxU32,
};
use std::{cell::RefCell, num::NonZeroUsize, rc::Rc};
use viz_js::VizInstance;
use web_sys::window;
use yew::prelude::*;

pub const EDGE_LIMIT: usize = 2000;
pub const NODE_LIMIT: usize = 4000;
pub const DEFAULT_NODE_COUNT: usize = 300;
pub const NODE_COLOUR_SATURATION: f64 = 0.4;
pub const NODE_COLOUR_VALUE: f64 = 0.95;
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
    RenderGraph,
    ApplyFilter(Filter),
    ResetGraph,
    UserPermission(WarningChoice),
    WorkerOutput(super::worker::WorkerOutput),
    RenderMLGraph(MatchingLoop),
    // UpdateSelectedNodes(Vec<RawNodeIndex>),
    // SearchMatchingLoops,
    // SelectNthMatchingLoop(usize),
    // ShowMatchingLoopSubgraph,
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
                    FilterOutput::MatchingLoopGraph(graph) => {
                        ctx.link().send_message(Msg::RenderMLGraph(graph));
                        false
                    }
                    FilterOutput::None => false,
                }
            }
            // Msg::SearchMatchingLoops => {
            //     inst_graph.search_matching_loops();
            //     ctx.link().send_message(Msg::SelectNthMatchingLoop(0));
            //     true
            // }
            // Msg::SelectNthMatchingLoop(n) => {
            //     self.filter_chain_link
            //         .borrow()
            //         .clone()
            //         .unwrap()
            //         .send_message(FilterChainMsg::AddFilters(vec![Filter::SelectNthMatchingLoop(n)]));
            //     false
            // }
            // Msg::ShowMatchingLoopSubgraph => {
            //     self.filter_chain_link
            //         .borrow()
            //         .clone()
            //         .unwrap()
            //         .send_message(FilterChainMsg::AddFilters(vec![Filter::ShowMatchingLoopSubgraph]));
            //     false
            // }
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
            Msg::RenderGraph => {
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
                    let ctxt = &DisplayCtxt {
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
                        "digraph {{\n{}\n{:?}\n}}",
                        settings.join("\n"),
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
                                let kind = &edge.kind(inst_graph);
                                let info = EdgeInfo {
                                    edge,
                                    kind,
                                    from,
                                    to,
                                    graph: &*inst_graph,
                                    ctxt,
                                };
                                let tooltip = info.tooltip();
                                let is_indirect = edge_data.weight().is_indirect(inst_graph);
                                let style = match is_indirect {
                                    true => "dashed",
                                    false => "solid",
                                };
                                let class = match is_indirect {
                                    true => "indirect",
                                    false => "direct",
                                };
                                let arrowhead = match kind.blame(inst_graph) {
                                    NodeKind::GivenEquality(..) | NodeKind::TransEquality(_) => {
                                        "empty"
                                    }
                                    _ => "normal",
                                };
                                format!(
                                    "id=edge_{} tooltip=\"{tooltip}\" style={style} class={class} arrowhead={arrowhead}",
                                    // For edges the `id` is the `VisibleEdgeIndex` from the VisibleGraph!
                                    edge_data.id().index(),
                                )
                            },
                            &|_, (_, data)| {
                                let node_data = &inst_graph.raw[data.idx];
                                let info = NodeInfo {
                                    node: node_data,
                                    ctxt,
                                };
                                let tooltip = info.tooltip(false, None);
                                let mut style = Some("filled");
                                let mut shape = None;
                                let mut fillcolor = Some("white".to_string());
                                let label = node_data.kind().to_string();
                                match node_data.kind() {
                                    NodeKind::Instantiation(inst) => {
                                        let mkind = &(&*parser.borrow())
                                            [(&*parser.borrow())[*inst].match_]
                                            .kind;
                                        style = Some(if mkind.is_mbqi() {
                                            "filled,dashed"
                                        } else {
                                            "filled"
                                        });
                                        let s = match (data.hidden_children, data.hidden_parents) {
                                            (0, 0) => "box",
                                            (0, _) => "house",
                                            (_, 0) => "invhouse",
                                            (_, _) => "diamond",
                                        };
                                        shape = Some(s);
                                        let hue =
                                            rc_parser.colour_map.get_rbg_hue(mkind.quant_idx())
                                                / 360.0;
                                        fillcolor = Some(format!(
                                            "{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}"
                                        ));
                                    }
                                    NodeKind::ENode(..) => {
                                        fillcolor = Some("lightgrey".to_string());
                                    }
                                    _ => (),
                                };
                                let idx = data.idx.0.index();
                                let style =
                                    style.map(|s| format!(" style=\"{s}\"")).unwrap_or_default();
                                let shape =
                                    shape.map(|s| format!(" shape={s}")).unwrap_or_default();
                                let fillcolor = fillcolor
                                    .map(|s| format!(" fillcolor=\"{s}\""))
                                    .unwrap_or_default();
                                // For nodes the `id` is the `RawNodeIndex` from the original graph!
                                format!("id=node_{idx} tooltip=\"{tooltip}\" label=\"{label}\"{style}{shape}{fillcolor}")
                            },
                        )
                    );
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
                    self.graph_warning.show();
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
                        .send_message(filters::Msg::UndoOperation);
                    false
                }
                WarningChoice::Apply => {
                    self.async_graph_and_filter_chain = true;
                    true
                }
                WarningChoice::Render => {
                    ctx.link().send_message(Msg::SetPermission(self.graph_dim));
                    ctx.link().send_message(Msg::RenderGraph);
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
            Msg::RenderMLGraph(graph) => {
                let Some((_, Some(graph))) = graph.graph else {
                    return false;
                };
                let cfg = ctx.link().get_configuration().unwrap();
                let mut ctxt = DisplayCtxt {
                    parser: &parser.borrow(),
                    term_display: &data.state.term_display,
                    config: cfg.config.display,
                };
                ctxt.config.html = false;

                // Performance observations (default value is in [])
                //  - splines=false -> 38s | [splines=true] -> ??
                //  - nslimit=2 -> 7s | nslimit=4 -> 9s | nslimit=7 -> 11.5s | nslimit=10 -> 14s | [nslimit=INT_MAX] -> 38s
                //  - [mclimit=1] -> 7s | mclimit=0.5 -> 4s (with nslimit=2)
                // `ranksep` dictates the distance between ranks (rows) in the graph,
                // it should be set dynamically based on the average number of children
                // per node out of all nodes with at least one child.
                let settings = [
                    "ranksep=1.0;",
                    "splines=true;",
                    "nslimit=6;",
                    "mclimit=0.6;",
                ];
                let dot_output = format!(
                    "digraph {{\n{}\n{:?}\n}}",
                    settings.join("\n"),
                    Dot::with_attr_getters(
                        &*graph,
                        &[
                            Config::EdgeNoLabel,
                            Config::NodeNoLabel,
                            Config::GraphContentOnly
                        ],
                        &|_, edge| format!("label=\"{:?}\"", edge.weight()),
                        &|_, (_, node_data)| {
                            format!(
                                "label=\"{}\" shape=\"{}\" style=filled fillcolor=\"{}\"",
                                match *node_data {
                                    MLGraphNode::QI(ref sig) => format!(
                                        "{}: {}",
                                        rc_parser.parser.borrow()[sig.quantifier].kind.with(&ctxt),
                                        sig.pattern.with(&ctxt)
                                    ),
                                    MLGraphNode::FixedENode(matched_term) =>
                                        format!("{}", matched_term.with(&ctxt)),
                                    MLGraphNode::RecurringENode(matched_term, input) => {
                                        let mut ctxt = ctxt;
                                        ctxt.config.input = Some(input);
                                        format!("{} ({input})", matched_term.with(&ctxt))
                                    }
                                    MLGraphNode::FixedEquality(from, to) =>
                                        format!("{} = {}", from.with(&ctxt), to.with(&ctxt)),
                                    MLGraphNode::RecurringEquality(from, to, input) => {
                                        let mut ctxt = ctxt;
                                        ctxt.config.input = Some(input);
                                        format!(
                                            "{} = {} ({input})",
                                            from.with(&ctxt),
                                            to.with(&ctxt)
                                        )
                                    }
                                },
                                "box",
                                match &node_data {
                                    MLGraphNode::QI(sig) => {
                                        let hue =
                                            rc_parser.colour_map.get_rbg_hue(Some(sig.quantifier))
                                                / 360.0;
                                        format!(
                                            "{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}"
                                        )
                                    }
                                    MLGraphNode::FixedENode(..)
                                    | MLGraphNode::RecurringENode(..) => "lightgrey".to_string(),
                                    MLGraphNode::FixedEquality(..)
                                    | MLGraphNode::RecurringEquality(..) => "white".to_string(),
                                }
                            )
                        },
                    )
                );
                log::info!("GRAPH SVG:\n{}", dot_output);
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
                        .send_message(GraphInfoMsg::ShowMatchingLoopGraph(AttrValue::from(
                            svg_text,
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

#[derive(Debug, Clone, Copy)]
pub struct QuantIdxToColourMap {
    total_count: usize,
    non_quant_insts: bool,
    coprime: NonZeroUsize,
    shift: usize,
}

impl QuantIdxToColourMap {
    pub fn new(quant_count: usize, non_quant_insts: bool) -> Self {
        let total_count = quant_count + non_quant_insts as usize;
        Self {
            total_count,
            non_quant_insts,
            coprime: Self::find_coprime(total_count),
            // Currently `idx == 0` will always have the same hue of 0, if we do
            // not want this behavior pick a random number here instead.
            shift: 0,
        }
    }

    pub fn get(&self, qidx: Option<QuantIdx>) -> LuvHue<f64> {
        debug_assert!(self.non_quant_insts || qidx.is_some());
        let idx = qidx
            .map(usize::from)
            .map(|q| q + self.non_quant_insts as usize)
            .unwrap_or_default();
        // debug_assert!(idx < idx);
        let idx_perm = (idx * self.coprime.get() + self.shift) % self.total_count;
        LuvHue::new(360. * idx_perm as f64 / self.total_count as f64)
    }
    pub fn get_rbg_hue(&self, qidx: Option<QuantIdx>) -> f64 {
        let hue = self.get(qidx);
        let colour = Hsluv::<D65, f64>::new(hue, 100.0, 50.0);
        let colour = Hsv::<Srgb, f64>::from_color(colour);
        colour.hue.into_positive_degrees()
    }
    // pub fn get_for_quant_idx(&self, mkind: QuantIdx) -> LuvHue<f64> {
    //     let qidx = Some(mkind);
    //     debug_assert!(self.non_quant_insts || qidx.is_some());
    //     let idx = qidx
    //         .map(usize::from)
    //         .map(|q| q + self.non_quant_insts as usize)
    //         .unwrap_or_default();
    //     // debug_assert!(idx < idx);
    //     let idx_perm = (idx * self.coprime.get() + self.shift) % self.total_count;
    //     LuvHue::new(360. * idx_perm as f64 / self.total_count as f64)
    // }
    // pub fn get_graphviz_hue_for_quant_idx(&self, mkind: QuantIdx) -> f64 {
    //     let hue = self.get_for_quant_idx(mkind);
    //     let colour = Hsluv::<D65, f64>::new(hue, 100.0, 50.0);
    //     let colour = Hsv::<Srgb, f64>::from_color(colour);
    //     colour.hue.into_positive_degrees() / 360.0
    // }

    #[allow(clippy::out_of_bounds_indexing)]
    fn find_coprime(n: usize) -> NonZeroUsize {
        // Workaround since `unwrap` isn't allowed in const functions.
        const ONE: NonZeroUsize = match NonZeroUsize::new(1) {
            Some(nz) => nz,
            None => [][0],
        };
        // We try to find a coprime at around `n.30303...` to achieve a period
        // of around 10 distinct colours for subsequent indices:
        // 0.303, 0.606, 0.909, 0.212, 0.515, 0.818, 0.121, 0.424, 0.727, 0.030.
        // That is, we get a group of 10 colours that are at least 0.1 apart,
        // and then recursively 10 groups of 10 which are at least 0.01 apart, etc.
        let aim = (n as u128)
            .checked_mul(99 + 30)
            .map(|aim| aim / 99 - 1)
            .and_then(|aim| usize::try_from(aim).ok());
        let Some(mut aim) = aim.and_then(NonZeroUsize::new) else {
            return ONE;
        };
        let Some(n) = NonZeroUsize::new(n) else {
            return ONE;
        };
        use gcd::Gcd;
        while n.gcd(aim) != ONE {
            let Some(new) = aim.checked_add(1) else {
                return ONE;
            };
            aim = new;
        }
        aim
    }
}
