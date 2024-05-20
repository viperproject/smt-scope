use crate::{configuration::{Configuration, ConfigurationContext, ConfigurationProvider, PersistentConfiguration}, utils::split_div::SplitDiv, RcParser};
use indexmap::map::{Entry, IndexMap};
use material_yew::WeakComponentLink;
use scraper::node;
// use smt_log_parser::parsers::z3::inst_graph::{EdgeType, NodeInfo};
use smt_log_parser::{
    display_with::DisplayConfiguration, items::BlameKind, parsers::z3::graph::{raw::InstNodeKind, RawNodeIndex, VisibleEdgeIndex}
    // parsers::z3::inst_graph::{EdgeInfo, InstInfo},
};
use web_sys::HtmlElement;
use yew::prelude::*;

use super::{graph::graph_container, node_info::{SelectedEdgesInfo, SelectedNodesInfo}, svg_result::RenderedGraph};

pub struct GraphInfo {
    selected_nodes: IndexMap<RawNodeIndex, bool>,
    selected_edges: IndexMap<VisibleEdgeIndex, bool>,
    generalized_terms: Vec<String>,
    graph_container: WeakComponentLink<graph_container::GraphContainer>,
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
    ScrollZoomSelection,
    UserSelectedNode(RawNodeIndex),
    UserSelectedEdge(VisibleEdgeIndex),
    ToggleOpenNode(RawNodeIndex),
    ToggleOpenEdge(VisibleEdgeIndex),
    // SelectNodes(Vec<RawNodeIndex>),
    DeselectAll,
    SelectAll,
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
            generalized_terms: Vec::new(),
            graph_container: WeakComponentLink::default(),
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
            Msg::SelectAll => {
                if let Some(rendered) = &ctx.props().rendered {
                    self.selected_nodes = rendered.graph.graph.node_weights().map(|n| (n.idx, false)).collect();
                    self.selected_edges = rendered.graph.graph.edge_indices().map(VisibleEdgeIndex).map(|e| (e, false)).collect();
                    ctx.props().update_selected_nodes.emit(self.selected_nodes.keys().copied().collect());
                    ctx.props().update_selected_edges.emit(self.selected_edges.keys().copied().collect());
                    true
                } else {
                    false
                }
            }
            // Msg::SelectNodes(nodes) => {
            //     let selected_nodes = nodes.clone();
            //     self.selected_nodes.clear();
            //     self.selected_nodes.extend(nodes.into_iter().map(|n| (n, false)));
            //     ctx.props().update_selected_nodes.emit(selected_nodes);
            //     true
            // }
            Msg::ScrollZoomSelection => {
                let Some(graph_container) = &*self.graph_container.borrow() else {
                    return false;
                };
                let msg = graph_container::Msg::ScrollZoomSelection(self.selected_nodes.keys().copied().collect(), self.selected_edges.keys().copied().collect());
                graph_container.send_message(msg);
                false
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
        let ignore_term_ids = !ctx.link().get_configuration().unwrap().config.persistent.display.display_term_ids;
        let on_node_select = ctx.link().callback(Msg::UserSelectedNode);
        let on_edge_select = ctx.link().callback(Msg::UserSelectedEdge);
        let deselect_all = ctx.link().callback(|_| Msg::DeselectAll);
        let select_all = ctx.link().callback(|_| Msg::SelectAll);
        let generalized_terms = self.generalized_terms.iter().map(|term| html! {
            <li>{term}</li>
        });
        let outdated = ctx.props().outdated.then(|| html! {<div class="outdated"></div>});
        let hide_right_bar = self.selected_nodes.is_empty() && self.selected_edges.is_empty();
        let left_bound = if hide_right_bar { 1.0 } else { 0.3 };
        html! {
            <>
            <SplitDiv initial_position={0.7} {left_bound} right_bound={1.0} snap_positions={vec![0.3, 0.7, 1.0]}>
                <graph_container::GraphContainer
                    rendered={ctx.props().rendered.clone()}
                    update_selected_nodes={&on_node_select}
                    update_selected_edges={&on_edge_select}
                    {select_all}
                    {deselect_all}
                    selected_nodes={self.selected_nodes.keys().copied().collect::<Vec<RawNodeIndex>>()}
                    selected_edges={self.selected_edges.keys().copied().collect::<Vec<VisibleEdgeIndex>>()}
                    weak_link={self.graph_container.clone()}
                />

                <div style="width:100%; height:100%; overflow-wrap:anywhere; overflow:clip auto;">
                    <SelectedNodesInfo selected_nodes={self.selected_nodes.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} on_click={on_node_click} />
                    <SelectedEdgesInfo selected_edges={self.selected_edges.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} rendered={ctx.props().rendered.clone()} on_click={on_edge_click} />
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
