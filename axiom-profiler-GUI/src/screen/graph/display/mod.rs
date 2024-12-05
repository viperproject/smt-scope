use std::rc::Rc;

use crate::{
    results::{
        graph::graph_container::GraphContainer,
        node_info::{SelectedEdgesInfo, SelectedNodesInfo},
    },
    screen::{file::RcAnalysis, homepage::RcParser},
    state::{StateContext, StateProvider},
    utils::split_div::SplitDiv,
};
use indexmap::map::{Entry, IndexMap};
use material_yew::{icon::MatIcon, WeakComponentLink};
use smt_log_parser::{
    analysis::{RawNodeIndex, VisibleEdgeIndex},
    FxHashSet,
};
use wasm_bindgen::JsCast;
use yew::prelude::*;

use super::{visible::RenderedGraph, SelectionM};

pub struct GraphInfo {
    /// Which nodes from the ones that are selected should be collapsed
    collapsed_nodes: FxHashSet<RawNodeIndex>,
    collapsed_edges: FxHashSet<VisibleEdgeIndex>,

    generalized_terms: Vec<String>,
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

pub enum GraphInfoM {
    UserSelection(UserSelectionM),
    ToggleOpenNode(RawNodeIndex),
    ToggleOpenEdge(VisibleEdgeIndex),
    ShowGeneralizedTerms(Vec<String>),
    ShowMatchingLoopGraph(Option<MatchingLoopGraphData>),
    ContextUpdated(Rc<StateProvider>),
    MatchingLoopGraphAction(MatchingLoopGraphAction, MouseEvent, usize),
}

pub enum UserSelectionM {
    ToggleNode(RawNodeIndex),
    ToggleEdge(VisibleEdgeIndex),
    SelectAll,
    DeselectAll,
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
    // pub weak_link: WeakComponentLink<GraphInfo>,
    // pub node_info: Callback<(RawNodeIndex, bool, RcParser), NodeInfo>,
    // pub edge_info: Callback<(VisibleEdgeIndex, bool, RcParser), EdgeInfo>,
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub rendered: RenderedGraph,
    pub update_selected: Callback<SelectionM>,
    pub outdated: bool,

    pub svg_view: WeakComponentLink<GraphContainer>,
}

impl Component for GraphInfo {
    type Message = GraphInfoM;

    type Properties = GraphInfoProps;

    fn create(ctx: &Context<Self>) -> Self {
        let (state, context_listener) = ctx
            .link()
            .context(ctx.link().callback(GraphInfoM::ContextUpdated))
            .expect("No message context provided");
        Self {
            collapsed_nodes: FxHashSet::default(),
            collapsed_edges: FxHashSet::default(),
            generalized_terms: Vec::new(),
            displayed_matching_loop_graph: None,
            in_ml_viewer_mode: state.state.ml_viewer_mode,
            ml_graph_div: NodeRef::default(),
            _context_listener: context_listener,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            GraphInfoM::UserSelection(sel) => match sel {
                UserSelectionM::ToggleNode(node_index) => {
                    if !ctx.props().rendered.selected_nodes.contains(&node_index) {
                        self.collapsed_nodes = FxHashSet::from_iter(
                            ctx.props().rendered.selected_nodes.iter().copied(),
                        );
                    } else {
                        self.collapsed_nodes.remove(&node_index);
                    }
                    ctx.props()
                        .update_selected
                        .emit(SelectionM::ToggleNode(node_index));
                    true
                }
                UserSelectionM::ToggleEdge(edge_index) => {
                    if !ctx.props().rendered.selected_edges.contains(&edge_index) {
                        self.collapsed_edges = FxHashSet::from_iter(
                            ctx.props().rendered.selected_edges.iter().copied(),
                        );
                    } else {
                        self.collapsed_edges.remove(&edge_index);
                    }
                    ctx.props()
                        .update_selected
                        .emit(SelectionM::ToggleEdge(edge_index));
                    true
                }
                UserSelectionM::DeselectAll => {
                    self.collapsed_nodes.clear();
                    self.collapsed_edges.clear();
                    ctx.props().update_selected.emit(SelectionM::DeselectAll);
                    true
                }
                UserSelectionM::SelectAll => {
                    let graph = &ctx.props().rendered.graph.graph;
                    let nodes = graph.node_weights().map(|n| n.idx).collect();
                    let edges = graph.edge_indices().map(VisibleEdgeIndex).collect();
                    ctx.props()
                        .update_selected
                        .emit(SelectionM::SetSelection(nodes, edges));
                    false
                }
            },
            GraphInfoM::ToggleOpenNode(node) => {
                if !self.collapsed_nodes.insert(node) {
                    self.collapsed_nodes.remove(&node);
                }
                true
            }
            GraphInfoM::ToggleOpenEdge(edge) => {
                if !self.collapsed_edges.insert(edge) {
                    self.collapsed_edges.remove(&edge);
                }
                true
            }
            GraphInfoM::ShowGeneralizedTerms(terms) => {
                self.generalized_terms = terms;
                true
            }
            GraphInfoM::ShowMatchingLoopGraph(graph) => {
                self.displayed_matching_loop_graph = graph;
                true
            }
            GraphInfoM::ContextUpdated(msg) => {
                if self.in_ml_viewer_mode != msg.state.ml_viewer_mode {
                    self.in_ml_viewer_mode = msg.state.ml_viewer_mode;
                    true
                } else {
                    false
                }
            }
            GraphInfoM::MatchingLoopGraphAction(action, ev, ml_idx) => {
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
            Callback::from(move |node: RawNodeIndex| {
                link.send_message(GraphInfoM::ToggleOpenNode(node))
            })
        };
        let on_edge_click = {
            let link = ctx.link().clone();
            Callback::from(move |edge: VisibleEdgeIndex| {
                link.send_message(GraphInfoM::ToggleOpenEdge(edge))
            })
        };
        let _generalized_terms = self.generalized_terms.iter().map(|term| {
            html! {
                <li>{term}</li>
            }
        });
        let outdated = ctx
            .props()
            .outdated
            .then(|| html! {<div class="outdated"></div>});
        let hide_right_bar = ctx.props().rendered.selected_nodes.is_empty()
            && ctx.props().rendered.selected_edges.is_empty();
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
                    .callback(move |ev| GraphInfoM::MatchingLoopGraphAction(Download, ev, ml_idx));
                let share = ctx
                    .link()
                    .callback(move |ev| GraphInfoM::MatchingLoopGraphAction(Share, ev, ml_idx));

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
        let selected_nodes: Vec<_> = ctx
            .props()
            .rendered
            .selected_nodes
            .iter()
            .map(|n| (*n, !self.collapsed_nodes.contains(n)))
            .collect();
        let selected_edges: Vec<_> = ctx
            .props()
            .rendered
            .selected_edges
            .iter()
            .map(|e| (*e, !self.collapsed_edges.contains(e)))
            .collect();
        let parser = ctx.props().parser.clone();
        let analysis = ctx.props().analysis.clone();
        html! {
            <>
            <SplitDiv initial_position={0.7} {left_bound} right_bound={1.0} snap_positions={vec![0.3, 0.7, 1.0]}>
                <GraphContainer
                    rendered={ctx.props().rendered.clone()}
                    selection={ctx.link().callback(GraphInfoM::UserSelection)}
                    svg_view={ctx.props().svg_view.clone()}
                />

                <div style="width:100%; height:100%; overflow-wrap:anywhere; overflow:clip auto;">
                    <SelectedNodesInfo parser={parser.clone()} analysis={analysis.clone()} {selected_nodes} on_click={on_node_click} />
                    <SelectedEdgesInfo {parser} {analysis} {selected_edges} rendered={ctx.props().rendered.graph.clone()} on_click={on_edge_click} />
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
