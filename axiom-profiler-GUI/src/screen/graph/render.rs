use std::rc::Rc;

use petgraph::{
    dot::{Config, Dot},
    visit::EdgeRef,
};
use smt_log_parser::{
    analysis::{visible::VisibleInstGraph, InstGraph, RawNodeIndex, VisibleEdgeIndex},
    display_with::DisplayCtxt,
    FxHashMap, FxHashSet, Z3Parser,
};
use viz_js::VizInstance;
use wasm_timer::Instant;

use crate::{
    configuration::ConfigurationContext,
    results::{
        filters::{Disabler, FilterOutputKind},
        svg_result::GraphDimensions,
    },
    screen::{
        graph::visible::{GraphState, RenderedGraph},
        graphviz::{DotEdgeProperties, DotNodeProperties},
        Scope,
    },
    state::StateContext,
    utils::colouring::QuantIdxToColourMap,
};

use super::{filter::RenderCommand, visible::RcVisibleGraph, Graph, GraphM};

impl Graph {
    pub(super) fn apply_filter(
        &mut self,
        parser: &Z3Parser,
        graph: &mut InstGraph,
        cmd: RenderCommand,
    ) -> (bool, bool, bool) {
        if cmd.is_full() {
            if self.disabler.modified() {
                Disabler::apply(self.disabler.disablers(), graph, parser);
            }
            graph.raw.reset_visibility_to(false);
            self.filter.no_effects.clear();
        }
        let mut modified = cmd.is_full();
        let mut update_view = cmd.is_full();

        for (can_select, idx, filter) in cmd.filters() {
            let output = filter.apply(graph, parser);
            log::trace!("Applied filter {filter:?} -> {output:?}");

            modified |= output.modified;
            if !output.modified {
                update_view = true;
                self.filter.no_effects.push(idx);
            }
            match output.kind {
                FilterOutputKind::SelectNodes(to_select) => {
                    if can_select {
                        update_view |= self.set_to_select(to_select);
                    }
                }
                FilterOutputKind::MatchingLoopGraph(ml_idx, graph) => {
                    update_view = true;
                    todo!()
                    // ctx.link().send_message(Msg::RenderMLGraph(ml_idx, graph));
                }
                FilterOutputKind::Other => (),
            }
        }
        (cmd.is_first(), modified, update_view)
    }

    fn set_to_select(&mut self, to_select: Vec<RawNodeIndex>) -> bool {
        let (modified, nodes) = match &mut self.state {
            Ok(_) => (false, &mut self.nodes_to_select),
            Err(rendered) => {
                let modified = !rendered.selected_edges.is_empty();
                rendered.selected_edges.clear();
                (modified, &mut rendered.selected_nodes)
            }
        };
        if to_select == *nodes {
            modified
        } else {
            *nodes = to_select;
            true
        }
    }

    pub(super) fn render_careful(
        &mut self,
        link: &Scope<Self>,
        parser: &Z3Parser,
        graph: &InstGraph,
        colour_map: &QuantIdxToColourMap,
        is_first: bool,
        from_undo: bool,
    ) -> bool {
        // If we applied a previous filter but did not give permission to render.
        drop(self.waiting.take());

        let visible = RcVisibleGraph::new(graph.to_visible());
        self.waiting = Some((from_undo, visible.clone()));
        let dimensions = GraphDimensions::of_graph(&visible);
        if dimensions <= self.filter.chain.get_permissions() || is_first {
            self.render(visible, link, parser, graph, colour_map)
        } else {
            self.graph_warning.show();
            true
        }
    }

    pub(super) fn render(
        &mut self,
        visible: RcVisibleGraph,
        link: &Scope<Self>,
        parser: &Z3Parser,
        graph: &InstGraph,
        colour_map: &QuantIdxToColourMap,
    ) -> bool {
        let search = Self::omnibox_search(link, parser, graph, colour_map);
        let (selected_nodes, selected_edges) = self.update_selected(&visible);
        let dimensions = GraphDimensions::of_graph(&visible);

        log::debug!("Rendering graph with {dimensions:?}");
        let new_permissions = dimensions.max(Self::default_permissions());
        self.filter.chain.set_permissions(new_permissions);

        // TODO: this has no effect, we'll update the state again slightly
        // further down the control chain.
        self.state = Ok(GraphState::GraphToDot);
        let filtered_graph = &visible.graph;
        let cfg = link.get_configuration().unwrap();
        let data = link.get_state().unwrap();
        let ctxt = DisplayCtxt {
            parser,
            term_display: &data.state.term_display,
            config: cfg.config.display,
        };

        // Performance observations (default value is in [])
        //  - splines=false -> 38s | [splines=true] -> ??
        //  - nslimit=2 -> 7s | nslimit=4 -> 9s | nslimit=7 -> 11.5s | nslimit=10 -> 14s | [nslimit=INT_MAX] -> 38s
        //  - [mclimit=1] -> 7s | mclimit=0.5 -> 4s (with nslimit=2)
        // `ranksep` dictates the distance between ranks (rows) in the graph,
        // it should be set dynamically based on the average number of children
        // per node out of all nodes with at least one child.
        let settings = [
            "ranksep=1.0;",
            "splines=false;",
            "nslimit=6;",
            "mclimit=0.6;",
            // TODO: explore this as an option, alternatively allow
            // displaying only some subgraphs.
            // "pack=32;",
            // "packMode=\"graph\";",
        ];
        let dot_output = format!(
            "digraph {{\n    {}\n{:?}}}",
            settings.join("\n    "),
            Dot::with_attr_getters(
                filtered_graph,
                &[
                    Config::EdgeNoLabel,
                    Config::NodeNoLabel,
                    Config::GraphContentOnly
                ],
                &|fg, edge_data| {
                    let (from, to) = (fg[edge_data.source()].idx, fg[edge_data.target()].idx);
                    let edge = edge_data.weight();
                    let is_indirect = edge.is_indirect(graph);
                    let blame = edge.kind(graph).blame(graph);
                    let (from, to) = (graph.raw[from].kind(), graph.raw[to].kind());
                    let all = edge.all(
                        (),
                        (is_indirect, *from, *to),
                        is_indirect,
                        is_indirect,
                        blame,
                        (),
                    );
                    // For edges the `id` is the `VisibleEdgeIndex` from the VisibleGraph!
                    format!("id=edge_{} {all}", edge_data.id().index())
                },
                &|_, (_, data)| {
                    let idx = data.idx.0.index();
                    let node_data = &graph.raw[data.idx];
                    let all = node_data.kind().all(
                        (),
                        (ctxt, false, None),
                        ctxt.parser,
                        (data.hidden_parents, data.hidden_children),
                        (ctxt.parser, colour_map),
                        (),
                        (),
                    );
                    // For nodes the `id` is the `RawNodeIndex` from the original graph!
                    format!("id=node_{idx} {all}")
                },
            )
        );
        // log::debug!("Graph DOT:\n{dot_output}");
        self.state = Ok(GraphState::RenderingGraph);
        let link = link.clone();
        wasm_bindgen_futures::spawn_local(async move {
            gloo_timers::future::TimeoutFuture::new(10).await;
            let graphviz = VizInstance::new().await;
            let options = viz_js::Options::default();
            // options.engine = "twopi".to_string();

            let start = Instant::now();
            let svg = match graphviz.render_svg_element(dot_output, options) {
                Ok(svg) => svg,
                Err(e) => {
                    link.send_message(GraphM::RenderFailed(format!("Graphviz error: {e:?}")));
                    return;
                }
            };
            let elapsed = start.elapsed();
            log::info!(
                "Graph: Converting dot-String to SVG took {} seconds",
                elapsed.as_secs()
            );
            let rendered = RenderedGraph {
                graph: visible,
                svg,
                selected_nodes,
                selected_edges,
                search: Rc::new(search),
            };
            link.send_message(GraphM::RenderedGraph(rendered));
        });
        true
    }

    fn update_selected(
        &mut self,
        visible: &VisibleInstGraph,
    ) -> (Vec<RawNodeIndex>, Vec<VisibleEdgeIndex>) {
        let mut selected_nodes = core::mem::take(&mut self.nodes_to_select);
        let Err(old) = &self.state else {
            return (selected_nodes, Vec::new());
        };
        selected_nodes.extend(
            old.selected_nodes
                .iter()
                .copied()
                .filter(|i_idx| visible.contains(*i_idx)),
        );

        // Update selected edges
        let mut selected_edges = old.selected_edges.clone();

        let mut to_update: FxHashMap<_, _> = selected_edges
            .iter_mut()
            .flat_map(|e| {
                let old_edge = &old.graph[*e];
                let different = !visible
                    .graph
                    .edge_weight(e.0)
                    .is_some_and(|edge| edge == old_edge);
                different.then_some((old_edge, e))
            })
            .collect();
        if !to_update.is_empty() {
            for new_edge in visible.graph.edge_references() {
                if let Some(e) = to_update.remove(new_edge.weight()) {
                    *e = VisibleEdgeIndex(new_edge.id());
                    if to_update.is_empty() {
                        break;
                    }
                }
            }
            if !to_update.is_empty() {
                let to_remove: FxHashSet<_> = to_update.into_values().map(|v| *v).collect();
                selected_edges.retain(|e| !to_remove.contains(e));
            }
        }
        (selected_nodes, selected_edges)
    }
}
