use crate::{configuration::{Configuration, ConfigurationContext, ConfigurationProvider}, utils::split_div::SplitDiv, RcParser};
use gloo::console::log;
use indexmap::map::{Entry, IndexMap};
use material_yew::WeakComponentLink;
use scraper::node;
// use smt_log_parser::parsers::z3::inst_graph::{EdgeType, NodeInfo};
use smt_log_parser::{
    display_with::DisplayConfiguration, items::BlameKind, parsers::z3::graph::{raw::NodeKind, RawNodeIndex, VisibleEdgeIndex}
    // parsers::z3::inst_graph::{EdgeInfo, InstInfo},
};
use web_sys::HtmlElement;
use yew::prelude::*;

use super::{graph::graph_container::GraphContainer, node_info::{SelectedEdgesInfo, SelectedNodesInfo}, svg_result::RenderedGraph};

pub struct GraphInfo {
    selected_nodes: IndexMap<RawNodeIndex, bool>,
    selected_edges: IndexMap<VisibleEdgeIndex, bool>,
    ignore_term_ids: bool,
    generalized_terms: Vec<String>,
    displayed_matching_loop_graph: Option<AttrValue>,
}

fn toggle_selected<T: Copy + Eq + std::hash::Hash>(map: &mut IndexMap<T, bool>, entry: T) -> Vec<T> {
    let added = match map.entry(entry) {
        Entry::Occupied(o) => {
            o.swap_remove();
            false
        }
        Entry::Vacant(v) => {
            v.insert(true);
            true
        }
    };
    if added {
        // When adding a single new node,
        // close all
        for (other, val) in map.iter_mut() {
            // except the added node
            if *other != entry {
                *val = false;
            }
        }
    }
    map.keys().copied().collect()
}

pub enum Msg {
    UserSelectedNode(RawNodeIndex),
    UserSelectedEdge(VisibleEdgeIndex),
    ToggleOpenNode(RawNodeIndex),
    ToggleOpenEdge(VisibleEdgeIndex),
    // SelectNodes(Vec<RawNodeIndex>),
    DeselectAll,
    ToggleIgnoreTermIds,
    ShowGeneralizedTerms(Vec<String>),
    ShowMatchingLoopGraph(AttrValue),
}

#[derive(Properties, PartialEq)]
pub struct GraphInfoProps {
    pub weak_link: WeakComponentLink<GraphInfo>,
    // pub node_info: Callback<(RawNodeIndex, bool, RcParser), NodeInfo>,
    // pub edge_info: Callback<(VisibleEdgeIndex, bool, RcParser), EdgeInfo>,
    // pub parser: RcParser,
    pub rendered: Option<RenderedGraph>,
    pub selected_nodes: Vec<RawNodeIndex>,
    pub update_selected_nodes: Callback<Vec<RawNodeIndex>>,
    pub selected_edges: Vec<VisibleEdgeIndex>,
    pub update_selected_edges: Callback<Vec<VisibleEdgeIndex>>,
    pub outdated: bool,
}

impl Component for GraphInfo {
    type Message = Msg;

    type Properties = GraphInfoProps;

    fn create(ctx: &Context<Self>) -> Self {
        ctx.props()
            .weak_link
            .borrow_mut()
            .replace(ctx.link().clone());
        Self {
            selected_nodes: ctx.props().selected_nodes.iter().copied().map(|n| (n, false)).collect(),
            selected_edges: ctx.props().selected_edges.iter().copied().map(|e| (e, false)).collect(),
            ignore_term_ids: true,
            generalized_terms: Vec::new(),
            displayed_matching_loop_graph: None,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        self.selected_nodes = ctx.props().selected_nodes.iter().copied().map(|n|
            (n, self.selected_nodes.get(&n).copied().unwrap_or_default())
        ).collect();
        self.selected_edges = ctx.props().selected_edges.iter().copied().map(|e|
            (e, self.selected_edges.get(&e).copied().unwrap_or_default())
        ).collect();
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::UserSelectedNode(node_index) => {
                let selected_nodes = toggle_selected(&mut self.selected_nodes, node_index);
                ctx.props().update_selected_nodes.emit(selected_nodes);
                true
            }
            Msg::UserSelectedEdge(edge_index) => {
                let selected_edges = toggle_selected(&mut self.selected_edges, edge_index);
                ctx.props().update_selected_edges.emit(selected_edges);
                true
            }
            Msg::ToggleOpenNode(node) => {
                let open_value = self.selected_nodes.get_mut(&node).unwrap();
                log::info!("Toggling node: {:?}, open: {} -> {}", node, *open_value, !*open_value);
                *open_value = !*open_value;
                true
            }
            Msg::ToggleOpenEdge(edge) => {
                let open_value = self.selected_edges.get_mut(&edge).unwrap();
                *open_value = !*open_value;
                true
            }
            Msg::DeselectAll => {
                self.selected_nodes.clear();
                self.selected_edges.clear();
                ctx.props().update_selected_nodes.emit(Vec::new());
                ctx.props().update_selected_edges.emit(Vec::new());
                true
            }
            // Msg::SelectNodes(nodes) => {
            //     let selected_nodes = nodes.clone();
            //     self.selected_nodes.clear();
            //     self.selected_nodes.extend(nodes.into_iter().map(|n| (n, false)));
            //     ctx.props().update_selected_nodes.emit(selected_nodes);
            //     true
            // }
            Msg::ToggleIgnoreTermIds => {
                let cfg = ctx.link().get_configuration().unwrap();
                cfg.update.emit(Configuration {
                    display: DisplayConfiguration {
                        display_term_ids: !cfg.config.display.display_term_ids,
                        ..cfg.config.display
                    },
                    ..cfg.config
                });
                false
            }
            Msg::ShowGeneralizedTerms(terms) => {
                self.generalized_terms = terms;
                true
            }
            Msg::ShowMatchingLoopGraph(graph) => {
                log!("Showing ML graph");
                self.displayed_matching_loop_graph = Some(graph);
                true
            } 
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let on_node_click = {
            let link = ctx.link().clone();
            Callback::from(move |node: RawNodeIndex| link.send_message(Msg::ToggleOpenNode(node)))
        };
        let on_edge_click = {
            let link = ctx.link().clone();
            Callback::from(move |edge: VisibleEdgeIndex| link.send_message(Msg::ToggleOpenEdge(edge)))
        };
        let toggle = ctx.link().callback(|_| Msg::ToggleIgnoreTermIds);
        let on_node_select = ctx.link().callback(Msg::UserSelectedNode);
        let on_edge_select = ctx.link().callback(Msg::UserSelectedEdge);
        let deselect_all = ctx.link().callback(|_| Msg::DeselectAll);
        let generalized_terms = self.generalized_terms.iter().map(|term| html! {
            <li>{term}</li>
        });
        let outdated = ctx.props().outdated.then(|| html! {<div class="outdated"></div>});
        let hide_right_bar = self.selected_nodes.is_empty() && self.selected_edges.is_empty();
        let left_bound = if hide_right_bar { 1.0 } else { 0.3 };
        html! {
            <>
            <SplitDiv initial_position={0.7} {left_bound} right_bound={1.0} snap_positions={vec![0.3, 0.7, 1.0]}>
                <GraphContainer
                    rendered={ctx.props().rendered.clone()}
                    update_selected_nodes={&on_node_select}
                    update_selected_edges={&on_edge_select}
                    deselect_all={&deselect_all}
                    selected_nodes={self.selected_nodes.keys().copied().collect::<Vec<RawNodeIndex>>()}
                    selected_edges={self.selected_edges.keys().copied().collect::<Vec<VisibleEdgeIndex>>()}
                />

                <div style="width:100%; height:100%; overflow-wrap:anywhere; overflow:clip auto;">
                    <div style="position: sticky; top: 0px; left: 0px">
                        <label for="term_expander">{"Ignore term IDs "}</label>
                        <input type="checkbox" checked={self.ignore_term_ids} onclick={toggle} id="term_expander" />
                    </div>
                    <SelectedNodesInfo selected_nodes={self.selected_nodes.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} on_click={on_node_click} />
                    <SelectedEdgesInfo selected_edges={self.selected_edges.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} rendered={ctx.props().rendered.clone()} on_click={on_edge_click} />
                    { if let Some(graph) = &self.displayed_matching_loop_graph {
                        html!{
                            <>
                                <h2>{"Information on Displayed Matching Loop"}</h2>
                                <div>{Html::from_html_unchecked(graph.clone())}</div>
                            </>
                        }
                    } else {
                        html!{}
                    }}
                    // <DisplayedMLGraph displayed_ml_index={self.displayed_ml_index} rendered={ctx.props().rendered.clone()}/>
                    // TODO: re-add matching loops
                    // <h2>{"Information about displayed matching loop:"}</h2>
                    // <div>
                    //     <ul>{for generalized_terms}</ul>
                    // </div>
                </div>
            </SplitDiv>
            {outdated}
            </>
        }
    }
}
