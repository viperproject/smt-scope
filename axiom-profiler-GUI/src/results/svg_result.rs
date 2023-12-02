use crate::results;

use self::colors::HSVColour;
use super::{filters::{
    filter_chain::{FilterChain, Msg as FilterChainMsg},
    graph_filters::Filter,
}, worker::Worker};
use super::graph::graph_container::GraphContainer;
use fxhash::FxHashMap;
use material_yew::WeakComponentLink;
use num_format::{Locale, ToFormattedString};
use petgraph::dot::{Config, Dot};
use petgraph::graph::NodeIndex;
use smt_log_parser::{
    items::QuantIdx,
    parsers::{
        z3::{
            inst_graph::{EdgeType, InstGraph, InstInfo},
            z3parser::Z3Parser,
        },
        LogParser,
    },
};
use std::num::NonZeroUsize;
use web_sys::window;
use yew::prelude::*;

pub const EDGE_LIMIT: usize = 500;
pub const DEFAULT_NODE_COUNT: usize = 125;

pub enum Msg {
    UpdateSvgText(AttrValue),
    UpdateSelectedNodes(usize),
    RenderGraph(UserPermission),
    ApplyFilter(Filter),
    ResetGraph,
    GetUserPermission,
    WorkerOutput(super::worker::WorkerOutput),
}

pub struct UserPermission {
    permission: bool,
}

impl Default for UserPermission {
    fn default() -> Self {
        Self { permission: false }
    }
}

impl From<bool> for UserPermission {
    fn from(value: bool) -> Self {
        Self { permission: value }
    }
}

struct GraphDimensions {
    node_count: usize,
    edge_count: usize,
    prev_edge_count: Option<usize>,
}

pub struct SVGResult {
    parser: Z3Parser,
    colour_map: QuantIdxToColourMap,
    inst_graph: InstGraph,
    svg_text: AttrValue,
    selected_insts: FxHashMap<NodeIndex, InstInfo>,
    filter_chain_link: WeakComponentLink<FilterChain>,
    on_node_select: Callback<usize>,
    graph_dim: GraphDimensions,
    worker: Option<Box<dyn yew_agent::Bridge<Worker>>>,
}

#[derive(Properties, PartialEq)]
pub struct SVGProps {
    pub trace_file_text: AttrValue,
}

impl Component for SVGResult {
    type Message = Msg;
    type Properties = SVGProps;

    fn create(ctx: &Context<Self>) -> Self {
        log::debug!("Creating SVGResult component");
        let parser = Z3Parser::from_str(&ctx.props().trace_file_text).process_all();
        let inst_graph = InstGraph::from(&parser);
        let total_nr_of_quants = parser.total_nr_of_quants();
        let colour_map = QuantIdxToColourMap::from(total_nr_of_quants);
        Self {
            parser,
            colour_map,
            inst_graph,
            svg_text: AttrValue::default(),
            selected_insts: FxHashMap::default(),
            filter_chain_link: WeakComponentLink::default(),
            on_node_select: ctx.link().callback(Msg::UpdateSelectedNodes),
            graph_dim: GraphDimensions {
                node_count: 0,
                edge_count: 0,
                prev_edge_count: None,
            },
            worker: Some(Self::create_worker(ctx.link().clone())),
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::WorkerOutput(out) => {
                ctx.link().send_message(Msg::UpdateSvgText(AttrValue::from(out.svg_text)));
                false
            }
            Msg::ApplyFilter(filter) => {
                log::debug!("Applying filter {}", filter);
                filter.apply(&mut self.inst_graph);
                false
            }
            Msg::ResetGraph => {
                log::debug!("Resetting graph");
                self.inst_graph.reset();
                false
            }
            Msg::RenderGraph(UserPermission { permission }) => {
                let (node_count, edge_count) = self.inst_graph.retain_visible_nodes_and_reconnect();
                self.graph_dim.node_count = node_count;
                self.graph_dim.edge_count = edge_count;
                let safe_to_render = if let Some(prev_edge_count) = self.graph_dim.prev_edge_count {
                    edge_count <= prev_edge_count || edge_count <= EDGE_LIMIT
                } else {
                    // initially the node-count is 125 so it should be safe to render regardless of the
                    // number of edges
                    // we are using the fact that only initially the self.prev_edge_count is None
                    true
                };
                if safe_to_render || permission {
                    self.graph_dim.prev_edge_count = Some(edge_count);
                    log::debug!("Rendering graph");
                    let filtered_graph = &self.inst_graph.visible_graph;

                    // Performance observations (default value is in [])
                    //  - splines=false -> 38s | [splines=true] -> ??
                    //  - nslimit=2 -> 7s | nslimit=4 -> 9s | nslimit=7 -> 11.5s | nslimit=10 -> 14s | [nslimit=INT_MAX] -> 38s
                    //  - [mclimit=1] -> 7s | mclimit=0.5 -> 4s (with nslimit=2)
                    // `ranksep` dictates the distance between ranks (rows) in the graph,
                    // it should be set dynamically based on the average number of children
                    // per node out of all nodes with at least one child.
                    let settings = ["ranksep=1.0;", "splines=false;", "nslimit=6;", "mclimit=0.6;"];
                    let dot_output = format!(
                        "digraph {{\n{}\n{:?}\n}}",
                        settings.join("\n"),
                        Dot::with_attr_getters(
                            filtered_graph,
                            &[Config::EdgeNoLabel, Config::NodeNoLabel, Config::GraphContentOnly],
                            &|_, edge_data| format!(
                                "style={}",
                                match edge_data.weight().edge_type {
                                    EdgeType::Direct => "solid",
                                    EdgeType::Indirect => "dashed",
                                }
                            ),
                            &|_, (_, node_data)| {
                                format!("label=\"{}\" style=filled shape=oval fillcolor=\"{}\" fontcolor=black gradientangle=90",
                                        // node_idx.index(),
                                        node_data.orig_graph_idx.index(),
                                        match (self.inst_graph.node_has_filtered_children(node_data.orig_graph_idx), 
                                               self.inst_graph.node_has_filtered_parents(node_data.orig_graph_idx)) {
                                            (false, false) => format!("{}", self.colour_map.get(&node_data.quant_idx, 0.7)),
                                            (false, true) => format!("{}:{}", self.colour_map.get(&node_data.quant_idx, 1.0), self.colour_map.get(&node_data.quant_idx, 0.1)),
                                            (true, false) => format!("{}:{}", self.colour_map.get(&node_data.quant_idx, 0.1), self.colour_map.get(&node_data.quant_idx, 1.0)),
                                            (true, true) => format!("{}", self.colour_map.get(&node_data.quant_idx, 0.3)),
                                        },
                                    )
                            },
                        )
                    );
                    log::debug!("Finished building dot output");
                    let link = ctx.link().clone();
                    self.reset_worker(link);
                    self.send_worker_input(results::worker::WorkerInput { dot_file: dot_output });
                    // only need to re-render once the new SVG has been set
                    false
                } else {
                    ctx.link().send_message(Msg::GetUserPermission);
                    false
                }
            }
            Msg::GetUserPermission => {
                log::debug!("Getting user permission");
                let window = window().unwrap();
                let node_count = self.graph_dim.node_count.to_formatted_string(&Locale::en);
                let edge_count = self.graph_dim.edge_count.to_formatted_string(&Locale::en);
                let message = format!("Warning: The graph you are about to render contains {} nodes and {} edges, rendering might be slow. Do you want to proceed?", node_count, edge_count);
                let result = window.confirm_with_message(&message);
                match result {
                    Ok(true) => {
                        // if the user wishes to render the current graph, we do so
                        log::debug!("Got user permission");
                        ctx.link()
                            .send_message(Msg::RenderGraph(UserPermission::from(true)));
                        false
                    }
                    Ok(false) => {
                        log::debug!("Didn't get user permission");
                        // this resets the filter chain to the filter chain that we had
                        // right before adding the filter that caused too many nodes
                        // to be added to the graph
                        self.filter_chain_link
                            .borrow()
                            .clone()
                            .unwrap()
                            .send_message(FilterChainMsg::SetToPrevious);
                        false
                    }
                    Err(_) => {
                        // Handle the case where an error occurred
                        false
                    }
                }
            }
            Msg::UpdateSvgText(svg_text) => {
                log::debug!("Updating svg text");
                if svg_text != self.svg_text {
                    self.svg_text = svg_text;
                    self.selected_insts.clear();
                    true
                } else {
                    false
                }
            }
            Msg::UpdateSelectedNodes(index) => {
                log::debug!("Updating selected node");
                let selected_inst = self
                    .inst_graph
                    .get_instantiation_info(index, &self.parser)
                    .unwrap();
                let selected_inst_node_index = selected_inst.node_index;
                if !self.selected_insts.contains_key(&selected_inst_node_index) {
                    self.selected_insts
                        .insert(selected_inst_node_index, selected_inst);
                } else {
                    self.selected_insts.remove(&selected_inst_node_index);
                }
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        // let on_node_select = ctx.link().callback(Msg::UpdateSelectedNode);
        let node_and_edge_count_preview = html! {
            <h4>{format!{"The filtered graph contains {} nodes and {} edges", self.graph_dim.node_count, self.graph_dim.edge_count}}</h4>
        };
        let apply_filter = ctx.link().callback(Msg::ApplyFilter);
        let reset_graph = ctx.link().callback(|_| Msg::ResetGraph);
        let render_graph = ctx.link().callback(Msg::RenderGraph);
        html! {
            <>
                <div style="flex: 30%; height: 85vh; overflow-y: auto; ">
                <ContextProvider<Vec<InstInfo>> context={self.selected_insts.values().cloned().collect::<Vec<InstInfo>>()} >
                    <FilterChain
                        apply_filter={apply_filter.clone()}
                        reset_graph={reset_graph.clone()}
                        render_graph={render_graph.clone()}
                        weak_link={self.filter_chain_link.clone()}
                        dependency={ctx.props().trace_file_text.clone()}
                    />
                </ContextProvider<Vec<InstInfo>>>
                {node_and_edge_count_preview}
                </div>
                <GraphContainer
                    svg_text={&self.svg_text}
                    update_selected_node={&self.on_node_select}
                />
            </>
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
        let cb = std::rc::Rc::new(
            move |e| link.send_message(Msg::WorkerOutput(e))
        );
        Worker::bridge(cb)
    }
}

struct QuantIdxToColourMap {
    total_nr_of_quants: usize,
    coprime: NonZeroUsize,
    shift: usize,
}

impl QuantIdxToColourMap {
    pub fn from(total_nr_of_quants: usize) -> Self {
        Self {
            total_nr_of_quants,
            coprime: Self::find_coprime(total_nr_of_quants),
            // Currently `idx == 0` will always have the same hue of 0, if we do
            // not want this behavior pick a random number here instead.
            shift: 0,
        }
    }

    pub fn get(&self, qidx: &QuantIdx, sat: f64) -> HSVColour {
        let idx = usize::from(*qidx);
        debug_assert!(idx < self.total_nr_of_quants);
        let idx_perm = (idx * self.coprime.get() + self.shift) % self.total_nr_of_quants;
        HSVColour {
            hue: idx_perm as f64 / self.total_nr_of_quants as f64,
            sat,
            val: 0.95,
        }
    }

    fn find_coprime(n: usize) -> NonZeroUsize {
        // Workaround since `unwrap` isn't allowed in const functions.
        const ONE: NonZeroUsize = match NonZeroUsize::new(1) {
            Some(nz) => nz,
            None => [][0],
        };
        let nz = NonZeroUsize::new(n);
        if let Some(nz) = nz {
            primal::Primes::all()
                // Start from 13 since the smaller ones don't permute so nicely.
                .skip(5)
                // SAFETY: returned primes will never be zero.
                .map(|p| unsafe { NonZeroUsize::new_unchecked(p) })
                // Find the first prime that is coprime to `nz`.
                .find(|&prime| nz.get() % prime.get() != 0)
                // Will always succeed since any prime larger than `nz / 2` is
                // coprime. Terminates since `nz != 0`.
                .unwrap()
        } else {
            ONE
        }
    }
}

/// Private module for generating colors
mod colors {
    use std::fmt;

    #[derive(Clone, Copy)]
    pub struct HSVColour {
        pub hue: f64,
        pub sat: f64,
        pub val: f64,
    }

    impl fmt::Display for HSVColour {
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            write!(f, "{} {} {}", self.hue, self.sat, self.val)
        }
    }
}
