use super::node_actions::NodeActions;
use crate::{utils::usize_input::UsizeInput, results::svg_result::DEFAULT_NODE_COUNT};
use gloo::console::log;
use petgraph::{stable_graph::NodeIndex, Direction, Graph};
use smt_log_parser::{
    items::QuantIdx,
    parsers::z3::inst_graph::{InstGraph, InstInfo, InstOrEquality, InstRank, NodeData, Order}, Z3Parser,
};
use std::fmt::Display;
use yew::prelude::*;

#[derive(Clone, Copy)]
pub enum Filter {
    MaxNodeIdx(usize),
    IgnoreTheorySolving,
    IgnoreQuantifier(Option<QuantIdx>),
    IgnoreAllButQuantifier(Option<QuantIdx>),
    ShowNeighbours(NodeIndex, Direction),
    VisitSourceTree(NodeIndex, bool),
    VisitSubTreeWithRoot(NodeIndex, bool),
    MaxDepth(usize),
    ShowLongestPath(NodeIndex),
    SelectNthMatchingLoop(usize),
    ShowMatchingLoopSubgraph,
    AnalyzeMatchingLoopWithEndNode(NodeIndex),
    ShowMatchingLoopGraph,
    ShowNHighestRanked(usize, InstRank),
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
            // Self::MaxBranching(max) => {
            //     write!(f, "Show the {} instantiations with the most children", max)
            // }
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
            Self::ShowMatchingLoopGraph => write!(f, "Showing matching loop graph of currently visible graph"),
            Self::ShowNHighestRanked(n, order) => {
                match order {
                    InstRank::Branching(Order::Ascending) => write!(f, "Show the {} instantiations with the least children", n),
                    InstRank::Branching(Order::Descending) => write!(f, "Show the {} instantiations with the most children", n),
                    InstRank::Cost(Order::Ascending) => write!(f, "Show the {} least expensive instantiations", n),
                    InstRank::Cost(Order::Descending) => write!(f, "Show the {} most expensive instantiations", n),
                    InstRank::Time(Order::Ascending) => write!(f, "Show the {} last instantiations", n),
                    InstRank::Time(Order::Descending) => write!(f, "Show the {} first instantiations", n),
                    InstRank::Depth(Order::Descending) => write!(f, "Show the {} least deep nodes", n),
                    InstRank::Depth(Order::Ascending) => write!(f, "Show the {} deepest nodes", n),
                }
            }
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
            Filter::ShowNeighbours(nidx, direction) => graph.show_neighbours(nidx, direction),
            Filter::VisitSubTreeWithRoot(nidx, retain) => graph.visit_descendants(nidx, retain),
            Filter::VisitSourceTree(nidx, retain) => graph.visit_ancestors(nidx, retain),
            Filter::MaxDepth(depth) => graph.retain_nodes(|node: &NodeData| node.min_depth.unwrap() <= depth),
            Filter::ShowLongestPath(nidx) => return FilterOutput::LongestPath(graph.show_longest_path_through(nidx)),
            Filter::SelectNthMatchingLoop(n) => return FilterOutput::MatchingLoopGraph(graph.show_nth_matching_loop(n, parser)),
            Filter::ShowMatchingLoopSubgraph => graph.show_matching_loop_subgraph(),
            Filter::AnalyzeMatchingLoopWithEndNode(endnode) => return FilterOutput::MatchingLoopGraph(graph.analyze_matching_loop_with_endnode(endnode, parser)),
            Filter::ShowMatchingLoopGraph => return FilterOutput::MatchingLoopGraph(graph.show_matching_loop_graph_of_visible_graph(parser)),
            Filter::ShowNHighestRanked(n, order) => graph.keep_n_highest_ranked(n, order),
        }
        FilterOutput::None
    }
}

pub struct GraphFilters {
    max_node_idx: usize,
    n_most_costly: usize,
    n_least_costly: usize,
    n_highest_branching: usize,
    max_depth: usize,
    selected_insts: Vec<InstInfo>,
    _selected_insts_listener: ContextHandle<Vec<InstInfo>>,
    n_first: usize,
    n_last: usize,
    n_deepest: usize,
    n_least_deep: usize,
}

#[derive(Properties, PartialEq)]
pub struct GraphFiltersProps {
    pub add_filters: Callback<Vec<Filter>>,
}

pub enum Msg {
    SetMaxNodeIdx(usize),
    SetNMostCostly(usize),
    SetNLeastCostly(usize),
    SetNHighestBranching(usize),
    SetMaxDepth(usize),
    SelectedInstsUpdated(Vec<InstInfo>),
    SetNFirst(usize),
    SetNLast(usize),
    SetNDeepest(usize),
    SetNLeastDeep(usize),
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
            Msg::SetNMostCostly(to) => {
                self.n_most_costly = to;
                true
            }
            Msg::SetNLeastCostly(to) => {
                self.n_least_costly = to;
                true
            }
            Msg::SetNHighestBranching(to) => {
                self.n_highest_branching = to;
                true
            }
            Msg::SetNFirst(to) => {
                self.n_first = to;
                true
            }
            Msg::SetNLast(to) => {
                self.n_last = to;
                true
            }
            Msg::SetNDeepest(to) => {
                self.n_deepest = to;
                true
            }
            Msg::SetNLeastDeep(to) => {
                self.n_least_deep = to;
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
        let (selected_insts, _selected_insts_listener) = ctx
            .link()
            .context(ctx.link().callback(Msg::SelectedInstsUpdated))
            .expect("No context provided");
        Self {
            max_node_idx: usize::MAX,
            n_most_costly: DEFAULT_NODE_COUNT,
            n_least_costly: DEFAULT_NODE_COUNT,
            n_highest_branching: usize::MAX,
            max_depth: usize::MAX,
            selected_insts,
            _selected_insts_listener,
            n_first: DEFAULT_NODE_COUNT,
            n_last: DEFAULT_NODE_COUNT,
            n_deepest: DEFAULT_NODE_COUNT,
            n_least_deep: DEFAULT_NODE_COUNT,
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
            let max_instantiations = self.n_most_costly;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(max_instantiations, InstRank::Cost(Order::Descending))]))
        };
        let add_min_insts_filter = {
            let callback = ctx.props().add_filters.clone();
            let min_instantiations = self.n_least_costly;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(min_instantiations, InstRank::Cost(Order::Ascending))]))
        };
        let add_max_branching_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_branching = self.n_highest_branching;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(max_branching, InstRank::Branching(Order::Descending))]))
        };
        let add_max_depth_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_depth = self.max_depth;
            Callback::from(move |_| callback.emit(vec![Filter::MaxDepth(max_depth)]))
        };
        let matching_loop_graph = {
            let callback = ctx.props().add_filters.clone();
            Callback::from(move |_| callback.emit(vec![Filter::ShowMatchingLoopGraph]))
        };
        let add_n_first_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_instantiations = self.n_first;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(max_instantiations, InstRank::Time(Order::Descending))]))
        };
        let add_n_last_filter = {
            let callback = ctx.props().add_filters.clone();
            let min_instantiations = self.n_last;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(min_instantiations, InstRank::Time(Order::Ascending))]))
        };
        let add_n_deepest_filter = {
            let callback = ctx.props().add_filters.clone();
            let max_instantiations = self.n_deepest;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(max_instantiations, InstRank::Depth(Order::Ascending))]))
        };
        let add_n_least_deep_filter = {
            let callback = ctx.props().add_filters.clone();
            let min_instantiations = self.n_least_deep;
            Callback::from(move |_| callback.emit(vec![Filter::ShowNHighestRanked(min_instantiations, InstRank::Depth(Order::Descending))]))
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
                        set_value={ctx.link().callback(Msg::SetNMostCostly)}
                    />
                    <button onclick={add_max_insts_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n least expensive instantiations where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNLeastCostly)}
                    />
                    <button onclick={add_min_insts_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n instantiations with most children where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNHighestBranching)}
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
                <div>
                    <UsizeInput
                        label={"Render the n first instantiations where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNFirst)}
                    />
                    <button onclick={add_n_first_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n last instantiations where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNLast)}
                    />
                    <button onclick={add_n_last_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n deepest nodes where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNDeepest)}
                    />
                    <button onclick={add_n_deepest_filter}>{"Add"}</button>
                </div>
                <div>
                    <UsizeInput
                        label={"Render the n least deep nodes where n = "}
                        placeholder={""}
                        set_value={ctx.link().callback(Msg::SetNLeastDeep)}
                    />
                    <button onclick={add_n_least_deep_filter}>{"Add"}</button>
                </div>
                <div>
                    <label for="matching_loop_graph">{"Generate matching loop graph"}</label>
                    <button onclick={matching_loop_graph} id="matching_loop_graph">{"Add"}</button>
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