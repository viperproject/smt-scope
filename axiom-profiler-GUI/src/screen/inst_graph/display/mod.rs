mod graph_container;
mod node_info;
mod svg_graph;

use crate::{
    screen::{file::RcAnalysis, homepage::RcParser},
    utils::split_div::{SplitDiv, SplitDivProps},
};
use material_yew::WeakComponentLink;
use smt_log_parser::{
    analysis::{RawNodeIndex, VisibleEdgeIndex},
    FxHashSet,
};
use yew::prelude::*;

use self::node_info::{SelectedEdgesInfo, SelectedNodesInfo};
use super::{visible::RenderedGraph, GraphExtraProps, SelectionM};

pub use self::graph_container::{GraphContainer, SvgViewM};

pub struct GraphInfo {
    /// Which nodes from the ones that are selected should be collapsed
    collapsed_nodes: FxHashSet<RawNodeIndex>,
    collapsed_edges: FxHashSet<VisibleEdgeIndex>,
}

pub enum GraphInfoM {
    UserSelection(UserSelectionM),
    ToggleOpenNode(RawNodeIndex),
    ToggleOpenEdge(VisibleEdgeIndex),
}

pub enum UserSelectionM {
    ToggleNode(RawNodeIndex),
    ToggleEdge(VisibleEdgeIndex),
    SelectAll,
    DeselectAll,
}

#[derive(Properties, PartialEq)]
pub struct GraphInfoProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub rendered: RenderedGraph,
    pub update_selected: Callback<SelectionM>,
    pub outdated: bool,

    pub svg_view: WeakComponentLink<GraphContainer>,
    pub extra: Option<GraphExtraProps>,
}

impl Component for GraphInfo {
    type Message = GraphInfoM;

    type Properties = GraphInfoProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            collapsed_nodes: FxHashSet::default(),
            collapsed_edges: FxHashSet::default(),
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
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let rendered = &ctx.props().rendered;
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
        let outdated = ctx
            .props()
            .outdated
            .then(|| html! {<div class="outdated"></div>});
        let selected_nodes: Vec<_> = rendered
            .selected_nodes
            .iter()
            .map(|n| (*n, !self.collapsed_nodes.contains(n)))
            .collect();
        let selected_edges: Vec<_> = rendered
            .selected_edges
            .iter()
            .map(|e| (*e, !self.collapsed_edges.contains(e)))
            .collect();
        let parser = ctx.props().parser.clone();
        let analysis = ctx.props().analysis.clone();
        let extra = ctx.props().extra.clone();
        let extra = extra.unwrap_or_else(|| {
            let mut split = SplitDivProps {
                initial_position: 0.7,
                left_bound: 1.0,
                right_bound: 1.0,
                snap_positions: Vec::new(),
            };
            let hide_right_bar =
                rendered.selected_nodes.is_empty() && rendered.selected_edges.is_empty();
            if !hide_right_bar {
                split.left_bound = 0.25;
                split.snap_positions =
                    vec![split.left_bound, split.initial_position, split.right_bound];
            }
            GraphExtraProps {
                split,
                swap_split: false,
                info_top: Default::default(),
            }
        });
        let graph = html! {
            <GraphContainer
                rendered={ctx.props().rendered.clone()}
                selection={ctx.link().callback(GraphInfoM::UserSelection)}
                svg_view={ctx.props().svg_view.clone()}
            />
        };
        let info = html! {
            <div class="graph-info">
                {extra.info_top}
                <SelectedNodesInfo parser={parser.clone()} analysis={analysis.clone()} {selected_nodes} on_click={on_node_click} />
                <SelectedEdgesInfo {parser} {analysis} {selected_edges} rendered={ctx.props().rendered.graph.clone()} on_click={on_edge_click} />
            </div>
        };
        let (left, right) = if extra.swap_split {
            (info, graph)
        } else {
            (graph, info)
        };
        html! {
            <>
            <SplitDiv inner={extra.split}>
                {left}
                {right}
            </SplitDiv>
            {outdated}
            </>
        }
    }
}
