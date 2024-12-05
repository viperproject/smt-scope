use std::rc::Rc;

use crate::{
    screen::graph::RenderedGraph,
    state::{StateContext, StateProvider},
    utils::split_div::SplitDiv,
};
use indexmap::map::{Entry, IndexMap};
use material_yew::{icon::MatIcon, WeakComponentLink};
// use smt_log_parser::parsers::z3::inst_graph::{EdgeType, NodeInfo};
use smt_log_parser::analysis::{RawNodeIndex, VisibleEdgeIndex};
use wasm_bindgen::JsCast;
use yew::prelude::*;

use super::graph::graph_container;

pub struct GraphInfo {
    selected_nodes: IndexMap<RawNodeIndex, bool>,
    selected_edges: IndexMap<VisibleEdgeIndex, bool>,
    generalized_terms: Vec<String>,
    graph_container: WeakComponentLink<graph_container::GraphContainer>,
    displayed_matching_loop_graph: Option<MatchingLoopGraphData>,
    in_ml_viewer_mode: bool,
    ml_graph_div: NodeRef,
    _context_listener: ContextHandle<Rc<StateProvider>>,
}

fn toggle_selected<T: Copy + Eq + std::hash::Hash>(
    map: &mut IndexMap<T, bool>,
    entry: T,
) -> Vec<T> {
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
    ShowGeneralizedTerms(Vec<String>),
    ShowMatchingLoopGraph(Option<MatchingLoopGraphData>),
    ContextUpdated(Rc<StateProvider>),
    MatchingLoopGraphAction(MatchingLoopGraphAction, MouseEvent, usize),
}

pub enum MatchingLoopGraphData {
    ShowEmpty(usize),
    Show {
        ml_idx: usize,
        incomplete: bool,
        data: AttrValue,
    },
}

pub enum MatchingLoopGraphAction {
    Download,
    Share,
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
        let (state, context_listener) = ctx
            .link()
            .context(ctx.link().callback(Msg::ContextUpdated))
            .expect("No message context provided");
        Self {
            selected_nodes: ctx
                .props()
                .selected_nodes
                .iter()
                .copied()
                .map(|n| (n, false))
                .collect(),
            selected_edges: ctx
                .props()
                .selected_edges
                .iter()
                .copied()
                .map(|e| (e, false))
                .collect(),
            generalized_terms: Vec::new(),
            graph_container: WeakComponentLink::default(),
            displayed_matching_loop_graph: None,
            in_ml_viewer_mode: state.state.ml_viewer_mode,
            ml_graph_div: NodeRef::default(),
            _context_listener: context_listener,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        self.selected_nodes = ctx
            .props()
            .selected_nodes
            .iter()
            .copied()
            .map(|n| (n, self.selected_nodes.get(&n).copied().unwrap_or_default()))
            .collect();
        self.selected_edges = ctx
            .props()
            .selected_edges
            .iter()
            .copied()
            .map(|e| (e, self.selected_edges.get(&e).copied().unwrap_or_default()))
            .collect();
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
                log::info!(
                    "Toggling node: {:?}, open: {} -> {}",
                    node,
                    *open_value,
                    !*open_value
                );
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
                // self.displayed_matching_loop_graph = None;
                true
            }
            Msg::SelectAll => {
                if let Some(rendered) = &ctx.props().rendered {
                    self.selected_nodes = rendered
                        .graph
                        .graph
                        .node_weights()
                        .map(|n| (n.idx, false))
                        .collect();
                    self.selected_edges = rendered
                        .graph
                        .graph
                        .edge_indices()
                        .map(VisibleEdgeIndex)
                        .map(|e| (e, false))
                        .collect();
                    ctx.props()
                        .update_selected_nodes
                        .emit(self.selected_nodes.keys().copied().collect());
                    ctx.props()
                        .update_selected_edges
                        .emit(self.selected_edges.keys().copied().collect());
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
            Msg::ShowGeneralizedTerms(terms) => {
                self.generalized_terms = terms;
                true
            }
            Msg::ShowMatchingLoopGraph(graph) => {
                self.displayed_matching_loop_graph = graph;
                true
            }
            Msg::ScrollZoomSelection => {
                let Some(graph_container) = &*self.graph_container.borrow() else {
                    return false;
                };
                let msg = graph_container::SvgViewM::ScrollZoomSelection(
                    self.selected_nodes.keys().copied().collect(),
                    self.selected_edges.keys().copied().collect(),
                );
                graph_container.send_message(msg);
                false
            }
            Msg::ContextUpdated(msg) => {
                if self.in_ml_viewer_mode != msg.state.ml_viewer_mode {
                    self.in_ml_viewer_mode = msg.state.ml_viewer_mode;
                    true
                } else {
                    false
                }
            }
            Msg::MatchingLoopGraphAction(action, ev, ml_idx) => {
                ev.prevent_default();
                let Some(graph) = self.ml_graph_div.cast::<web_sys::Element>() else {
                    return false;
                };
                let data = ctx.link().get_state().unwrap();
                let info = data.state.file_info.as_ref().unwrap();
                let filename = format!(
                    "{}_ml_{}.svg",
                    info.name.split('.').next().unwrap(),
                    ml_idx + 1
                );

                let svg = graph.inner_html();
                let blob = web_sys::Blob::new_with_str_sequence(&vec![svg].into())
                    .expect("Failed to create blob");
                use MatchingLoopGraphAction::*;
                match action {
                    Download => {
                        let url = web_sys::Url::create_object_url_with_blob(&blob)
                            .expect("Failed to create object URL");
                        let download = gloo::utils::document()
                            .create_element("a")
                            .expect("Failed to create element");
                        let download = download
                            .dyn_into::<web_sys::HtmlAnchorElement>()
                            .expect("Failed to cast element");
                        download.set_href(&url);
                        download.set_download(&filename);
                        download.click();
                        web_sys::Url::revoke_object_url(&url).expect("Failed to revoke object URL");
                        false
                    }
                    Share => {
                        let navigator = web_sys::window().unwrap().navigator();
                        let data = web_sys::ShareData::new();
                        data.set_title(&filename);
                        let file =
                            web_sys::File::new_with_blob_sequence(&vec![blob].into(), &filename)
                                .expect("Failed to create file");
                        data.set_files(&js_sys::Array::of1(&file));
                        let _share_promise = navigator.share_with_data(&data);
                        false
                    }
                }
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
            Callback::from(move |edge: VisibleEdgeIndex| {
                link.send_message(Msg::ToggleOpenEdge(edge))
            })
        };
        let on_node_select = ctx.link().callback(Msg::UserSelectedNode);
        let on_edge_select = ctx.link().callback(Msg::UserSelectedEdge);
        // let deselect_all = ctx.link().callback(|_| Msg::DeselectAll);
        // let select_all = ctx.link().callback(|_| Msg::SelectAll);
        let _generalized_terms = self.generalized_terms.iter().map(|term| {
            html! {
                <li>{term}</li>
            }
        });
        let outdated = ctx
            .props()
            .outdated
            .then(|| html! {<div class="outdated"></div>});
        let hide_right_bar = self.selected_nodes.is_empty() && self.selected_edges.is_empty();
        let left_bound = if self.in_ml_viewer_mode && self.displayed_matching_loop_graph.is_some() {
            0.15
        } else if !hide_right_bar {
            0.25
        } else {
            1.0
        };
        let ml_graph = match (&self.displayed_matching_loop_graph, self.in_ml_viewer_mode) {
            (Some(MatchingLoopGraphData::ShowEmpty(..)), true) => {
                html! { <h2>{"Failed to generalise repeating chain, likely not a matching loop."}</h2> }
            }
            (
                &Some(MatchingLoopGraphData::Show {
                    ml_idx,
                    incomplete,
                    ref data,
                }),
                true,
            ) => {
                use MatchingLoopGraphAction::*;
                let download = ctx
                    .link()
                    .callback(move |ev| Msg::MatchingLoopGraphAction(Download, ev, ml_idx));
                let share = ctx
                    .link()
                    .callback(move |ev| Msg::MatchingLoopGraphAction(Share, ev, ml_idx));

                let warning = if incomplete {
                    html! { <span class="warning" title="Error during graph construction, the graph is incomplete!">{"⚠️ Incomplete ⚠️"}</span> }
                } else {
                    html! {}
                };
                let download_share = html! {
                    <><a href="#" class="download" title="Download" onclick={download}>
                        <div class="material-icons"><MatIcon>{"download"}</MatIcon></div>
                    </a>
                    <a href="#" class="share" title="Share" onclick={share}>
                        <div class="material-icons"><MatIcon>{"share"}</MatIcon></div>
                    </a></>
                };
                html! {
                    <>
                        <h2>{"Generalised Matching Loop "}{download_share}{warning}</h2>
                        <div style="overflow-x: auto;" ref={&self.ml_graph_div}>{Html::from_html_unchecked(data.clone())}</div>
                    </>
                }
            }
            _ => html! {},
        };
        html! {
            <>
            <SplitDiv initial_position={0.7} {left_bound} right_bound={1.0} snap_positions={vec![0.3, 0.7, 1.0]}>
                // <graph_container::GraphContainer
                //     rendered={ctx.props().rendered.clone()}
                //     update_selected_nodes={&on_node_select}
                //     update_selected_edges={&on_edge_select}
                //     {select_all}
                //     {deselect_all}
                //     selected_nodes={self.selected_nodes.keys().copied().collect::<Vec<RawNodeIndex>>()}
                //     selected_edges={self.selected_edges.keys().copied().collect::<Vec<VisibleEdgeIndex>>()}
                //     weak_link={self.graph_container.clone()}
                // />

                <div style="width:100%; height:100%; overflow-wrap:anywhere; overflow:clip auto;">
                    // <SelectedNodesInfo selected_nodes={self.selected_nodes.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} on_click={on_node_click} />
                    // <SelectedEdgesInfo selected_edges={self.selected_edges.iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()} rendered={ctx.props().rendered.clone()} on_click={on_edge_click} />
                    {ml_graph}
                </div>
            </SplitDiv>
            {outdated}
            </>
        }
    }

    // fn rendered(&mut self, _ctx: &Context<Self>, _first_render: bool) {
    //     use wasm_bindgen::JsCast;
    //     use web_sys::{Element, SvgsvgElement};
    //     let c = self.ml_graph_container.cast::<Element>();
    //     let c = c.and_then(|c| c.get_elements_by_tag_name("svg").item(0));
    //     if let Some(el) = c {
    //         let svg_el = el.dyn_into::<SvgsvgElement>().ok().unwrap();
    //         if !svg_el.class_list().contains("cropped") {
    //             svg_el.class_list().add_1("cropped").ok();
    //             let mut view_box = svg_el.get_view_box().unwrap();
    //             view_box.y += 100.0;
    //             view_box.height -= 200.0;
    //             svg_el.set_view_box(view_box).unwrap();
    //             let height = svg_el.get_height().unwrap();
    //             svg_el.set_height(height - 200.0).unwrap();
    //         }
    //     }
    // }
}
