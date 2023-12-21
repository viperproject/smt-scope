use super::node_actions::NodeActions;
use crate::utils::input_state::{InputValue, UsizeInput};
use petgraph::{stable_graph::NodeIndex, Direction};
use smt_log_parser::{
    items::QuantIdx,
    parsers::z3::inst_graph::{InstGraph, InstInfo, NodeData},
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
    ShowMatchingLoops,
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
            Self::ShowMatchingLoops => write!(f, "Showing matching loops"),
        }
    }
}

impl Filter {
    pub fn apply(self: Filter, graph: &mut InstGraph) -> Option<Vec<NodeIndex>> {
        match self {
            Filter::MaxNodeIdx(max) => graph
                .retain_nodes(|node: &NodeData| node.orig_graph_idx.index() <= max),
            Filter::IgnoreTheorySolving => {
                graph.retain_nodes(|node: &NodeData| !node.is_theory_inst)
            }
            Filter::IgnoreQuantifier(qidx) => {
                graph.retain_nodes(|node: &NodeData| node.mkind.quant_idx() != qidx)
            }
            Filter::IgnoreAllButQuantifier(qidx) => {
                graph.retain_nodes(|node: &NodeData| node.mkind.quant_idx() == qidx)
            }
            Filter::MaxInsts(n) => graph.keep_n_most_costly(n),
            Filter::MaxBranching(n) => graph.keep_n_most_branching(n),
            Filter::ShowNeighbours(nidx, direction) => graph.show_neighbours(nidx, direction),
            Filter::VisitSubTreeWithRoot(nidx, retain) => graph.visit_descendants(nidx, retain),
            Filter::VisitSourceTree(nidx, retain) => graph.visit_ancestors(nidx, retain),
            Filter::MaxDepth(depth) => {
                graph.retain_nodes(|node: &NodeData| node.min_depth.unwrap() <= depth)
            }
            Filter::ShowLongestPath(nidx) => return Some(graph.show_longest_path_through(nidx)),
            Filter::ShowMatchingLoops => graph.show_matching_loops(),
        }
        None
    }
}

#[derive(Properties, PartialEq)]
pub struct GraphFilterProps {
    pub add_filters: Callback<Vec<Filter>>,
    pub dependency: *const smt_log_parser::Z3Parser,
}

#[function_component(GraphFilter)]
pub fn graph_filter(props: &GraphFilterProps) -> Html {
    let max_node_idx = use_reducer(InputValue::default);
    let max_instantiations = use_reducer(InputValue::default);
    let max_branching = use_reducer(InputValue::default);
    let max_depth = use_reducer(InputValue::default);
    let selected_insts = use_context::<Vec<InstInfo>>().expect("no ctx found");

    let add_max_line_nr_filter = {
        let max_node_idx = max_node_idx.clone();
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::MaxNodeIdx(max_node_idx.value)]))
    };
    let add_theory_filter = {
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::IgnoreTheorySolving]))
    };
    let add_max_insts_filter = {
        let max_instantiations = max_instantiations.clone();
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::MaxInsts(max_instantiations.value)]))
    };
    let add_max_branching_filter = {
        let max_branching = max_branching.clone();
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::MaxBranching(max_branching.value)]))
    };
    let add_max_depth_filter = {
        let max_depth = max_depth.clone();
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::MaxDepth(max_depth.value)]))
    };
    let show_matching_loops = {
        let callback = props.add_filters.clone();
        Callback::from(move |_| callback.emit(vec![Filter::ShowMatchingLoops]))
    };
    html! {
        <div>
            <h2>{"Add (optional) filters:"}</h2>
            <div>
                <UsizeInput
                    label={"Only show nodes up to index "}
                    dependency={props.dependency}
                    input_value={max_node_idx}
                    default_value={usize::MAX}
                    placeholder={""}
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
                    dependency={props.dependency}
                    input_value={max_instantiations}
                    default_value={super::super::svg_result::DEFAULT_NODE_COUNT}
                    placeholder={""}
                />
                <button onclick={add_max_insts_filter}>{"Add"}</button>
            </div>
            <div>
                <UsizeInput
                    label={"Render the n instantiations with most children where n = "}
                    dependency={props.dependency}
                    input_value={max_branching}
                    default_value={usize::MAX}
                    placeholder={""}
                />
                <button onclick={add_max_branching_filter}>{"Add"}</button>
            </div>
            <div>
                <UsizeInput
                    label={"Render up to depth "}
                    dependency={props.dependency}
                    input_value={max_depth}
                    default_value={usize::MAX}
                    placeholder={""}
                />
                <button onclick={add_max_depth_filter}>{"Add"}</button>
            </div>
            <div>
                <label for="matching_loops">{"Show matching loops"}</label>
                <button onclick={show_matching_loops} id="matching_loops">{"Add"}</button>
            </div>
            {if !selected_insts.is_empty() {
                html! {
                    <NodeActions selected_nodes={selected_insts} action={props.add_filters.clone()} />
                }
            } else {
                html! {}
            }}
            // <SelectDropDown
            //     label={"Select a layout engine:"}
            //     options={layout_engines}
            //     selected_option={layout_engine}
            // />
            // <button onclick={update_settings}>{"Render graph"}</button>
        </div>

    }
}
