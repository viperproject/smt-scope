use petgraph::Direction::{Incoming, Outgoing};
use smt_log_parser::parsers::z3::inst_graph::InstInfo;
use yew::prelude::*;

use super::graph_filters::Filter;

#[derive(Properties, PartialEq)]
pub struct NodeActionsProps {
    pub selected_nodes: Vec<InstInfo>,
    pub action: Callback<Vec<Filter>>,
}

#[function_component(NodeActions)]
pub fn node_actions(props: &NodeActionsProps) -> Html {
    let callback_from = |filter_for_inst: Box<dyn Fn(&InstInfo) -> Filter>| {
        let callback = props.action.clone();
        let selected_insts = props.selected_nodes.clone();
        Callback::from(move |_| {
            let filters: Vec<Filter> = selected_insts.iter().map(&filter_for_inst).collect();
            callback.emit(filters);
        })
    };
    let show_subtree = callback_from(Box::new(|inst: &InstInfo| {
        Filter::VisitSubTreeWithRoot(inst.node_index, true)
    }));
    let hide_subtree = callback_from(Box::new(|inst: &InstInfo| {
        Filter::VisitSubTreeWithRoot(inst.node_index, false)
    }));
    let show_children = callback_from(Box::new(|inst: &InstInfo| {
        Filter::ShowNeighbours(inst.node_index, Outgoing)
    }));
    let show_parents = callback_from(Box::new(|inst: &InstInfo| {
        Filter::ShowNeighbours(inst.node_index, Incoming)
    }));
    let show_source_tree = callback_from(Box::new(|inst: &InstInfo| {
        Filter::VisitSourceTree(inst.node_index, true)
    }));
    let hide_source_tree = callback_from(Box::new(|inst: &InstInfo| {
        Filter::VisitSourceTree(inst.node_index, false)
    }));
    let ignore_quantifier = callback_from(Box::new(|inst: &InstInfo| {
        Filter::IgnoreQuantifier(inst.mkind.quant_idx())
    }));
    let ignore_all_but_quantifier = callback_from(Box::new(|inst: &InstInfo| {
        Filter::IgnoreAllButQuantifier(inst.mkind.quant_idx())
    }));
    let show_longest_path = callback_from(Box::new(|inst: &InstInfo| {
        Filter::ShowLongestPath(inst.node_index)
    }));
    let analyze_matching_loop_with_endnode = callback_from(Box::new(|inst: &InstInfo| {
        Filter::AnalyzeMatchingLoopWithEndNode(inst.node_index)
    }));
    html! {
    <>
        <h4>{"You have selected some nodes. Here are possible actions (applied to all selected nodes):"}</h4>
        <div>
            <button onclick={show_subtree}>{"Show subtree with this root"}</button>
            <button onclick={hide_subtree}>{"Hide subtree with this root"}</button>
        </div>
        <div>
            <button onclick={show_children}>{"Show children"}</button>
            <button onclick={show_parents}>{"Show parents"}</button>
        </div>
        <div>
            <button onclick={show_source_tree}>{"Show ancestors"}</button>
            <button onclick={hide_source_tree}>{"Hide ancestors"}</button>
        </div>
        <div>
            <button onclick={ignore_quantifier}>{"Ignore all nodes of this quantifier"}</button>
        </div>
        <div>
            <button onclick={ignore_all_but_quantifier}>{"Only show this quantifier"}</button>
        </div>
        <div>
            <button onclick={show_longest_path}>{"Show longest path through last selected node"}</button>
        </div>
        <div>
            <button onclick={analyze_matching_loop_with_endnode}>{"Analyze matching loop with endnode being the last selected node"}</button>
        </div>
    </>
    }
}
