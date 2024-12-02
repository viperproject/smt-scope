use std::rc::Rc;

use gloo::utils::window;
use petgraph::{
    dot::{Config, Dot},
    visit::EdgeRef,
};
use smt_log_parser::{
    analysis::{visible::VisibleInstGraph, InstGraph},
    display_with::DisplayCtxt,
    Z3Parser,
};
use viz_js::VizInstance;
use wasm_timer::Instant;
use yew::{html::Scope, AttrValue};

use crate::{
    configuration::ConfigurationContext,
    results::{
        filters::FilterOutputKind,
        graphviz::{DotEdgeProperties, DotNodeProperties},
        svg_result::GraphDimensions,
    },
    screen::{
        graph::visible::{GraphState, RenderedGraph},
        Manager, Screen,
    },
    state::StateContext,
    utils::colouring::QuantIdxToColourMap,
};

use super::{filter::RenderCommand, Graph, GraphM};

impl Graph {
    pub(super) fn apply_filter(
        &mut self,
        parser: &Z3Parser,
        graph: &mut InstGraph,
        cmd: RenderCommand,
    ) -> (bool, bool, bool) {
        if cmd.is_full() {
            graph.raw.reset_visibility_to(false);
            self.filter.no_effects.clear();
        }
        let mut modified = false;
        let mut update_view = false;

        for (can_select, idx, filter) in cmd.filters() {
            let output = filter.apply(graph, parser);
            log::trace!("Applied filter {filter:?} -> {output:?}");

            modified |= output.modified;
            if !output.modified {
                self.filter.no_effects.push(idx);
            }
            match output.kind {
                FilterOutputKind::SelectNodes(to_select) => {
                    if can_select
                        && (!self.selected_edges.is_empty() || self.selected_nodes != to_select)
                    {
                        update_view = true;
                        self.selected_edges.clear();
                        self.selected_nodes = to_select;
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

    pub(super) fn render_careful(
        &mut self,
        link: &Scope<Manager>,
        parser: &Z3Parser,
        graph: &InstGraph,
        colour_map: &QuantIdxToColourMap,
        is_first: bool,
    ) -> bool {
        // If we applied a previous filter but did not give permission to render.
        drop(self.waiting.take());

        let visible = Rc::new(graph.to_visible());
        self.waiting = Some(Rc::clone(&visible));
        let dimensions = GraphDimensions::of_graph(&visible);
        if dimensions <= self.permissions || is_first {
            self.render(visible, link, parser, graph, colour_map)
        } else {
            self.graph_warning.show();
            true
        }
    }

    pub(super) fn render(
        &mut self,
        visible: Rc<VisibleInstGraph>,
        link: &Scope<Manager>,
        parser: &Z3Parser,
        graph: &InstGraph,
        colour_map: &QuantIdxToColourMap,
    ) -> bool {
        let dimensions = GraphDimensions::of_graph(&visible);

        log::debug!("Rendering graph with {dimensions:?}");
        self.permissions = dimensions.max(GraphDimensions::default_permissions());

        // self.async_graph_and_filter_chain = false;

        // TODO: this has no effect, we'll update the state again slightly
        // further down the control chain.
        self.state = Ok(GraphState::GraphToDot);
        let filtered_graph = &visible.graph;
        let cfg = link.get_configuration().unwrap();
        let data = link.get_state().unwrap();
        let ctxt = DisplayCtxt {
            parser: &*parser,
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
            let svg = graphviz
                .render_svg_element(dot_output, options)
                .expect("Could not render graphviz");
            let elapsed = start.elapsed();
            log::info!(
                "Graph: Converting dot-String to SVG took {} seconds",
                elapsed.as_secs()
            );
            let svg_text = AttrValue::from(svg.outer_html());
            let rendered = RenderedGraph {
                graph: visible,
                svg_text,
            };
            link.send_message(GraphM::RenderedGraph(rendered));
        });
        true
    }
}
