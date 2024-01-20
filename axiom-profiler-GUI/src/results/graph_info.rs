use crate::RcParser;
use gloo::console::log;
use indexmap::map::IndexMap;
use material_yew::WeakComponentLink;
use petgraph::graph::{EdgeIndex, NodeIndex};
use smt_log_parser::parsers::z3::inst_graph::EdgeType;
use smt_log_parser::{
    items::BlameKind,
    parsers::z3::{
        inst_graph::{EdgeInfo, InstInfo},
        z3parser::Z3Parser,
    },
};
use std::rc::Rc;
use web_sys::HtmlElement;
use yew::{prelude::*, virtual_dom::VNode};

use super::graph::graph_container::GraphContainer;

pub struct GraphInfo {
    is_expanded_node: IndexMap<NodeIndex, bool>,
    selected_nodes: IndexMap<NodeIndex, InstInfo>,
    selected_nodes_ref: NodeRef,
    is_expanded_edge: IndexMap<EdgeIndex, bool>,
    selected_edges: IndexMap<EdgeIndex, EdgeInfo>,
    selected_edges_ref: NodeRef,
    ignore_term_ids: bool,
    matching_loop_graph: VNode,
}

pub enum Msg {
    UserSelectedNode(usize),
    UserSelectedEdge(usize),
    ToggleOpenNode(NodeIndex),
    ToggleOpenEdge(EdgeIndex),
    SelectNodes(Vec<NodeIndex>),
    DeselectAll,
    ToggleIgnoreTermIds,
    ShowMatchingLoopGraph(AttrValue),
}

#[derive(Properties, PartialEq)]
pub struct GraphInfoProps {
    pub weak_link: WeakComponentLink<GraphInfo>,
    pub node_info: Callback<(NodeIndex, bool, RcParser), InstInfo>,
    pub edge_info: Callback<(EdgeIndex, bool, RcParser), EdgeInfo>,
    pub parser: RcParser,
    pub svg_text: AttrValue,
    pub update_selected_nodes: Callback<Vec<InstInfo>>,
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
            is_expanded_node: IndexMap::new(),
            selected_nodes_ref: NodeRef::default(),
            selected_nodes: IndexMap::new(),
            is_expanded_edge: IndexMap::new(),
            selected_edges: IndexMap::new(),
            selected_edges_ref: NodeRef::default(),
            ignore_term_ids: true,
            matching_loop_graph: VNode::default(),
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::UserSelectedNode(node_index) => {
                let node_index = NodeIndex::new(node_index);
                if self.selected_nodes.get(&node_index).is_some() {
                    self.selected_nodes.shift_remove(&node_index);
                    self.is_expanded_node.remove(&node_index);
                } else {
                    let inst_info = ctx.props().node_info.emit((
                        node_index,
                        self.ignore_term_ids,
                        ctx.props().parser.clone(),
                    ));
                    self.selected_nodes.insert(node_index, inst_info);
                    // When adding a single new node,
                    // close all
                    for val in self.is_expanded_node.values_mut() {
                        *val = false;
                    }
                    // except the added node
                    self.is_expanded_node.insert(node_index, true);
                }
                ctx.props().update_selected_nodes.emit(
                    self.selected_nodes
                        .values()
                        .cloned()
                        .collect::<Vec<InstInfo>>(),
                );
                true
            }
            Msg::UserSelectedEdge(edge_index) => {
                let edge_index = EdgeIndex::new(edge_index);
                if self.selected_edges.get(&edge_index).is_some() {
                    self.selected_edges.shift_remove(&edge_index);
                    self.is_expanded_edge.remove(&edge_index);
                } else {
                    let edge_info = ctx.props().edge_info.emit((
                        edge_index,
                        self.ignore_term_ids,
                        ctx.props().parser.clone(),
                    ));
                    self.selected_edges.insert(edge_index, edge_info);
                    // When adding a single new edge,
                    // close all
                    for val in self.is_expanded_edge.values_mut() {
                        *val = false;
                    }
                    // except the added edge
                    self.is_expanded_edge.insert(edge_index, true);
                }
                true
            }
            Msg::ToggleOpenNode(node) => {
                let open_value = self.is_expanded_node.get_mut(&node).unwrap();
                *open_value = !*open_value;
                false
            }
            Msg::ToggleOpenEdge(edge) => {
                let open_value = self.is_expanded_edge.get_mut(&edge).unwrap();
                *open_value = !*open_value;
                false
            }
            Msg::DeselectAll => {
                log!(format!("Deselecting all selected nodes"));
                self.selected_nodes.clear();
                self.is_expanded_node.clear();
                self.selected_edges.clear();
                self.is_expanded_edge.clear();
                ctx.props().update_selected_nodes.emit(
                    self.selected_nodes
                        .values()
                        .cloned()
                        .collect::<Vec<InstInfo>>(),
                );
                true
            }
            Msg::SelectNodes(nodes) => {
                self.selected_nodes.clear();
                self.is_expanded_node.clear();
                for node in nodes {
                    let inst_info = ctx.props().node_info.emit((
                        node,
                        self.ignore_term_ids,
                        ctx.props().parser.clone(),
                    ));
                    self.selected_nodes.insert(node, inst_info);
                    self.is_expanded_node.insert(node, false);
                }
                ctx.props().update_selected_nodes.emit(
                    self.selected_nodes
                        .values()
                        .cloned()
                        .collect::<Vec<InstInfo>>(),
                );
                true
            }
            Msg::ToggleIgnoreTermIds => {
                self.ignore_term_ids = !self.ignore_term_ids;
                for node in self.selected_nodes.values_mut() {
                    let node_idx = node.node_index;
                    let updated_node = ctx.props().node_info.emit((
                        node_idx,
                        self.ignore_term_ids,
                        ctx.props().parser.clone(),
                    ));
                    *node = updated_node;
                }
                for edge in self.selected_edges.values_mut() {
                    let edge_idx = edge.orig_graph_idx;
                    let updated_dep = ctx.props().edge_info.emit((
                        edge_idx,
                        self.ignore_term_ids,
                        ctx.props().parser.clone(),
                    ));
                    *edge = updated_dep;
                }
                true
            }
            Msg::ShowMatchingLoopGraph(graph) => {
                self.matching_loop_graph = Html::from_html_unchecked(graph);
                true
            }
        }
    }

    fn rendered(&mut self, _ctx: &Context<Self>, _first_render: bool) {
        log!("Rendered details");
        let selected_nodes_details = self
            .selected_nodes_ref
            .cast::<HtmlElement>()
            .expect("not attached to div element");
        let node_details = selected_nodes_details.get_elements_by_tag_name("details");
        for i in 0..node_details.length() {
            log!(format!("There are {} nodes", node_details.length()));
            let node_detail = node_details.item(i).unwrap();
            let node_id = node_detail.id().parse::<usize>().unwrap();
            log!(format!("node_details contains node {}", node_id));
            if *self.is_expanded_node.get(&NodeIndex::new(node_id)).unwrap() {
                let _ = node_detail.set_attribute("open", "true");
            } else {
                let _ = node_detail.remove_attribute("open");
            }
        }
        let selected_edges_details = self
            .selected_edges_ref
            .cast::<HtmlElement>()
            .expect("not attached to div element");
        let edge_details = selected_edges_details.get_elements_by_tag_name("details");
        for i in 0..edge_details.length() {
            let edge_detail = edge_details.item(i).unwrap();
            let edge_id = edge_detail.id().parse::<usize>().unwrap();
            if *self.is_expanded_edge.get(&EdgeIndex::new(edge_id)).unwrap() {
                let _ = edge_detail.set_attribute("open", "true");
            } else {
                let _ = edge_detail.remove_attribute("open");
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let on_node_click = {
            let link = ctx.link().clone();
            Callback::from(move |node: NodeIndex| link.send_message(Msg::ToggleOpenNode(node)))
        };
        let on_edge_click = {
            let link = ctx.link().clone();
            Callback::from(move |edge: EdgeIndex| link.send_message(Msg::ToggleOpenEdge(edge)))
        };
        let toggle = ctx.link().callback(|_| Msg::ToggleIgnoreTermIds);
        let on_node_select = ctx.link().callback(Msg::UserSelectedNode);
        let on_edge_select = ctx.link().callback(Msg::UserSelectedEdge);
        let deselect_all = ctx.link().callback(|_| Msg::DeselectAll);
        html! {
            <>
            <GraphContainer
                svg_text={&ctx.props().svg_text.clone()}
                update_selected_nodes={&on_node_select}
                update_selected_edges={&on_edge_select}
                deselect_all={&deselect_all}
                selected_nodes={self.selected_nodes.keys().cloned().collect::<Vec<NodeIndex>>()}
            />
            <div style="flex: 30%; height: 87vh; overflow: auto;">
                <div style="position: sticky; top: 0px; left: 0px">
                    <label for="term_expander">{"Ignore term IDs "}</label>
                    <input type="checkbox" checked={self.ignore_term_ids} onclick={toggle} id="term_expander" />
                </div>
                <h2>{"Information about selected nodes:"}</h2>
                <div ref={self.selected_nodes_ref.clone()}>
                    <SelectedNodesInfo selected_nodes={self.selected_nodes.values().cloned().collect::<Vec<InstInfo>>()} on_click={on_node_click} />
                </div>
                <h2>{"Information about selected dependencies:"}</h2>
                <div ref={self.selected_edges_ref.clone()}>
                    <SelectedEdgesInfo selected_edges={self.selected_edges.values().cloned().collect::<Vec<EdgeInfo>>()} on_click={on_edge_click} />
                </div>
                <h2>{"Information about displayed matching loop:"}</h2>
                <div style="overflow: auto;">
                    {self.matching_loop_graph.clone()}
                </div>
            </div>

            </>
        }
    }
}

#[derive(Properties, PartialEq)]
struct SelectedNodesInfoProps {
    selected_nodes: Vec<InstInfo>,
    on_click: Callback<NodeIndex>,
}

#[function_component(SelectedNodesInfo)]
fn selected_nodes_info(
    SelectedNodesInfoProps {
        selected_nodes,
        on_click,
    }: &SelectedNodesInfoProps,
) -> Html {
    selected_nodes
        .iter()
        .map(|selected_inst| {
            let get_ul = |label: &str, items: &Vec<String>| html! {
                <>
                    <h4>{label}</h4>
                    <ul style="overflow: auto;">{for items.iter().map(|item| html!{<li>{item}</li>})}</ul>
                </>
            };
            let on_select = {
                let on_click = on_click.clone();
                let selected_inst = selected_inst.clone();
                Callback::from(move |_| {
                    on_click.emit(selected_inst.node_index)
                })
            };
            let z3_gen = selected_inst.z3_gen.map(|gen| format!(", Z3 generation {gen}")).unwrap_or_default();
            html! {
            <details id={format!("{}", selected_inst.node_index.index())} onclick={on_select}>
                <summary>{format!("Node {}", selected_inst.node_index.index())}</summary>
                <ul>
                    <li><h4>{"Instantiation number: "}</h4><p>{format!("{}", selected_inst.inst_idx)}</p></li>
                    <li><h4>{"Cost: "}</h4><p>{"Calculated "}{selected_inst.cost}{z3_gen}</p></li>
                    <li><h4>{"Instantiated formula: "}</h4><p style="overflow: auto;">{&selected_inst.formula}</p></li>
                    <li><h4>{"Quantifier: "}</h4><p style="overflow: auto;">{if let Some(ref quant) = selected_inst.quant {format!("q{}", quant)} else { String::new() }}</p></li>
                    <li>{get_ul("Blamed terms: ", &selected_inst.blamed_terms)}</li>
                    <li>{get_ul("Bound terms: ", &selected_inst.bound_terms)}</li>
                    <li>{get_ul("Yield terms: ", &selected_inst.yields_terms)}</li>
                    <li>{get_ul("Equality explanations: ", &selected_inst.equality_expls)}</li>
                    <li><h4>{"Resulting term: "}</h4><p style="overflow: auto;">{if let Some(ref val) = selected_inst.resulting_term {val.to_string()} else { String::new() }}</p></li>
                </ul>
            </details>
        }})
        .collect()
}

#[derive(Properties, PartialEq)]
struct SelectedEdgesInfoProps {
    selected_edges: Vec<EdgeInfo>,
    on_click: Callback<EdgeIndex>,
}

#[function_component(SelectedEdgesInfo)]
fn selected_edges_info(
    SelectedEdgesInfoProps {
        selected_edges,
        on_click,
    }: &SelectedEdgesInfoProps,
) -> Html {
    selected_edges
        .iter()
        .map(|selected_edge| {
            let on_select = {
                let on_click = on_click.clone();
                let selected_edge = selected_edge.clone();
                Callback::from(move |_| {
                    on_click.emit(selected_edge.orig_graph_idx)
                })
            };
            html! {
            <details id={format!("{}", selected_edge.orig_graph_idx.index())} onclick={on_select}>
                <summary>{format!("Dependency from {} to {}", selected_edge.from.index(), selected_edge.to.index())}</summary>
                {match selected_edge.edge_data {
                    BlameKind::Term { .. } => html! {
                        <div>
                        <h4>{"Blame term: "}</h4><p style="overflow: auto;">{selected_edge.blame_term.clone()}</p>
                        </div>
                    },
                    BlameKind::Equality { .. } => html! {
                        <div>
                        <h4>{"Equality: "}</h4><p style="overflow: auto;">{selected_edge.blame_term.clone()}</p>
                        </div>
                    },
                    _ => html! {}
                }}
            </details>
            }
        })
        .collect()
}
