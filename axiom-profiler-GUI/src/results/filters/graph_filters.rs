use super::node_actions::NodeActions;
use crate::{utils::usize_input::UsizeInput, results::svg_result::DEFAULT_NODE_COUNT};
use gloo::console::log;
use petgraph::{stable_graph::NodeIndex, Direction, Graph};
use smt_log_parser::{
    items::QuantIdx,
    parsers::z3::inst_graph::{InstGraph, InstInfo, NodeData, InstOrEquality}, Z3Parser,
};
use std::fmt::Display;
use yew::prelude::*;

#[derive(Clone, Copy)]
pub enum Filter {
    MaxNodeIdx(usize),
    IgnoreTheorySolving,
    IgnoreQuantifier(Option<QuantIdx>),
    IgnoreAllButQuantifier(Option<QuantIdx>),
    MaxInsts(usize),
    MaxBranching(usize),
    ShowNeighbours(NodeIndex, Direction),
    VisitSourceTree(NodeIndex, bool),
    VisitSubTreeWithRoot(NodeIndex, bool),
    MaxDepth(usize),
    ShowLongestPath(NodeIndex),
    SelectNthMatchingLoop(usize),
    ShowMatchingLoopSubgraph,
    AnalyzeMatchingLoopWithEndNode(NodeIndex),
}

impl Display for Filter {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::MaxNodeIdx(node_idx) => write!(f, "Only show nodes up to index {}", node_idx),
            Self::IgnoreTheorySolving => write!(f, "Ignore theory solving instantiations"),
            Self::IgnoreQuantifier(None) => {
                write!(f, "Ignore instantiations without quantifier")
            }
            Self::IgnoreQuantifier(Some(qidx)) => {
                write!(f, "Ignore instantiations of quantifier {}", qidx)
            }
            Self::IgnoreAllButQuantifier(None) => {
                write!(f, "Ignore all instantiations without quantifier")
            }
            Self::IgnoreAllButQuantifier(Some(qidx)) => {
                write!(f, "Only show instantiations of quantifier {}", qidx)
            }
            Self::MaxInsts(max) => write!(f, "Show the {} most expensive instantiations", max),
            Self::MaxBranching(max) => {
                write!(f, "Show the {} instantiations with the most children", max)
            }
            Self::VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => write!(f, "Show node {} and its descendants", nidx.index()),
                false => write!(f, "Hide node {} and its descendants", nidx.index()),
            },
            Self::VisitSourceTree(nidx, retain) => match retain {
                true => write!(f, "Show node {} and its ancestors", nidx.index()),
                false => write!(f, "Hide node {} and its ancestors", nidx.index()),
            },
            Self::ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => write!(f, "Show the parents of node {}", nidx.index()),
                Direction::Outgoing => write!(f, "Show the children of node {}", nidx.index()),
            },
            Self::MaxDepth(depth) => write!(f, "Show nodes up to depth {}", depth),
            Self::ShowLongestPath(node) => {
                write!(f, "Showing longest path through node {}", node.index())
            }
            Self::SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    0 => "".to_string(),
                    1 => "2nd".to_string(),
                    2 => "3rd".to_string(),
                    n => (n+1).to_string() + "th",
                };
                write!(f, "Showing {} longest matching loop", ordinal)
            }
            Self::ShowMatchingLoopSubgraph => {
                write!(f, "Showing all potential matching loops")
            }
            Self::AnalyzeMatchingLoopWithEndNode(node) => write!(f, "Analyzing potential matching loop with end-node {}", node.index()),
        }
    }
}

pub enum FilterOutput {
    LongestPath(Vec<NodeIndex>),
    // MatchingLoopGeneralizedTerms(Vec<String>),
    MatchingLoopGraph(Graph<String, InstOrEquality>),
    None
}

impl Filter {
    pub fn apply(self: Filter, graph: &mut InstGraph, parser: &mut Z3Parser) -> FilterOutput {
        match self {
            Filter::MaxNodeIdx(max) => graph.retain_nodes(|node: &NodeData| node.orig_graph_idx.index() <= max),
            Filter::IgnoreTheorySolving => graph.retain_nodes(|node: &NodeData| !node.is_theory_inst),
            Filter::IgnoreQuantifier(qidx) => graph.retain_nodes(|node: &NodeData| node.mkind.quant_idx() != qidx),
            Filter::IgnoreAllButQuantifier(qidx) => graph.retain_nodes(|node: &NodeData| node.mkind.quant_idx() == qidx),
            Filter::MaxInsts(n) => graph.keep_n_most_costly(n),
            Filter::MaxBranching(n) => graph.keep_n_most_branching(n),
            Filter::ShowNeighbours(nidx, direction) => graph.show_neighbours(nidx, direction),
            Filter::VisitSubTreeWithRoot(nidx, retain) => graph.visit_descendants(nidx, retain),
            Filter::VisitSourceTree(nidx, retain) => graph.visit_ancestors(nidx, retain),
            Filter::MaxDepth(depth) => graph.retain_nodes(|node: &NodeData| node.min_depth.unwrap() <= depth),
            Filter::ShowLongestPath(nidx) => return FilterOutput::LongestPath(graph.show_longest_path_through(nidx)),
            Filter::SelectNthMatchingLoop(n) => return FilterOutput::MatchingLoopGraph(graph.show_nth_matching_loop(n, parser)),
            Filter::ShowMatchingLoopSubgraph => graph.show_matching_loop_subgraph(),
            Filter::AnalyzeMatchingLoopWithEndNode(endnode) => return FilterOutput::MatchingLoopGraph(graph.analyze_matching_loop_with_endnode(endnode, parser)),
        }
        FilterOutput::None
    }
}

pub struct GraphFilters {
    max_node_idx: usize,
    max_instantiations: usize,
    max_branching: usize,
    max_depth: usize,
    selected_insts: Vec<InstInfo>,
    _selected_insts_listener: ContextHandle<Vec<InstInfo>>,
}

#[derive(Properties, PartialEq)]
pub struct GraphFiltersProps {
    pub add_filters: Callback<Vec<Filter>>,
}

pub enum Msg {
    SetMaxNodeIdx(usize),
    SetMaxInsts(usize),
    SetMaxBranching(usize),
    SetMaxDepth(usize),
    SelectedInstsUpdated(Vec<InstInfo>),
}

impl Component for GraphFilters {
    type Message = Msg;
    type Properties = GraphFiltersProps;

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::SetMaxNodeIdx(to) => {
                self.max_node_idx = to;
                true
            }
            Msg::SetMaxInsts(to) => {
                self.max_instantiations = to;
                true
            }
            Msg::SetMaxBranching(to) => {
                self.max_branching = to;
                true
            }
            Msg::SetMaxDepth(to) => {
                self.max_depth = to;
                true
            }
            Msg::SelectedInstsUpdated(selected_insts) => {
                self.selected_insts = selected_insts;
                true
            }
        }
    }

    fn create(ctx: &Context<Self>) -> Self {
        log!("Creating GraphFilters component");
        let (selected_insts, _selected_insts_listener) = ctx
            .link()
            .context(ctx.link().callback(Msg::SelectedInstsUpdated))
            .expect("No context provided");
        Self {
            max_node_idx: usize::MAX,
            max_instantiations: DEFAULT_NODE_COUNT,
            max_branching: usize::MAX,
            max_depth: usize::MAX,
            selected_insts,
            _selected_insts_listener,
        }
    }
    fn view(&self, ctx: &Context<Self>) -> Html {
        let add_max_line_nr_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_node_idx = self.max_node_idx;
            Callback::from(move |_| callback.emit(vec![Filter::MaxNodeIdx(max_node_idx)]))
        };
        let add_theory_filter = {
            let callback = ctx.props().add_filters.clone();
            Callback::from(move |_| callback.emit(vec![Filter::IgnoreTheorySolving]))
        };
        let add_max_insts_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_instantiations = self.max_instantiations;
            Callback::from(move |_| callback.emit(vec![Filter::MaxInsts(max_instantiations)]))
        };
        let add_max_branching_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_branching = self.max_branching;
            Callback::from(move |_| callback.emit(vec![Filter::MaxBranching(max_branching)]))
        };
        let add_max_depth_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_depth = self.max_depth;
            Callback::from(move |_| callback.emit(vec![Filter::MaxDepth(max_depth)]))
        };
        html! {
            <div>
                <h2>{"Add (optional) filters:"}</h2>
                <div>
                    <UsizeInput
                        label={"Only show nodes up to index "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetMaxNodeIdx)}
                    />
                    <button onclick={add_max_line_nr_filter}>{"Add"}</button>
                </div>
                <div>
                    <label for="theory_button">{"Ignore theory-solving instantiations"}</label>
                    <button onclick={add_theory_filter} id="theory_button">{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n most expensive instantiations where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetMaxInsts)}
                    />
                    <button onclick={add_max_insts_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n instantiations with most children where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetMaxBranching)}
                    />
                    <button onclick={add_max_branching_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render up to depth "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetMaxDepth)}
                    />
                    <button onclick={add_max_depth_filter}>{"Add"}</button>
                </div>
                {if !self.selected_insts.is_empty() {
                    html! {
                        <NodeActions selected_nodes={self.selected_insts.clone()} action={ctx.props().add_filters.clone()} />
                    }
                } else {
                    html! {}
                }}
            </div>
        }
    }
}