use std::rc::Rc;

use petgraph::dot::{Config, Dot};
use smt_log_parser::{
    analysis::analysis::matching_loop::MlGraph, display_with::DisplayCtxt,
    formatter::TermDisplayContext,
};
use viz_js::VizInstance;
use wasm_timer::Instant;
use web_sys::SvgsvgElement;
use yew::{function_component, html, use_context, Callback, Html, Properties};

use crate::{
    configuration::ConfigurationProvider,
    screen::{
        file::RcAnalysis,
        graphviz::{DotEdgeProperties, DotNodeProperties},
        homepage::RcParser,
    },
    utils::colouring::QuantIdxToColourMap,
};

use super::graph::MlgViewer;

#[derive(Clone, PartialEq)]
pub struct MlgrOutput {
    pub incomplete: bool,
    pub idx: usize,
    pub svg: SvgsvgElement,
}

#[derive(Properties, Clone)]
pub struct MlgrProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub idx: usize,
    pub rendered: Callback<MlgrOutput>,
}

impl PartialEq for MlgrProps {
    fn eq(&self, other: &Self) -> bool {
        self.idx == other.idx
    }
}

#[function_component]
pub fn MlgRenderer(props: &MlgrProps) -> Html {
    let Some(data) = &props.analysis.borrow().graph.analysis.ml_data else {
        return html! { "Error E289" };
    };
    let Some(ml) = data.matching_loops.get(props.idx) else {
        return html! { "Error E290" };
    };
    let Some(graph) = &ml.graph else {
        return MlgViewer::no_graph();
    };

    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    let mut ctxt = DisplayCtxt {
        parser: &props.parser.parser.borrow(),
        term_display: &term_display,
        config: cfg.config.display,
    };
    ctxt.config.font_tag = true;
    let dot_output = MlgRenderer::generate_dot(graph, ctxt, &props.parser.colour_map);
    log::trace!("ML Graph DOT:\n{dot_output}");

    let rendered = props.rendered.clone();
    let idx = props.idx;
    let incomplete = graph.graph_incomplete;
    wasm_bindgen_futures::spawn_local(async move {
        gloo_timers::future::TimeoutFuture::new(10).await;
        let graphviz = VizInstance::new().await;
        let options = viz_js::Options::default();
        let start = Instant::now();
        let svg = graphviz
            .render_svg_element(dot_output, options)
            .expect("Could not render graphviz");
        let elapsed = start.elapsed();
        log::trace!(
            "ML-Graph: Converting dot-String to SVG took {} seconds",
            elapsed.as_secs()
        );
        rendered.emit(MlgrOutput {
            incomplete,
            idx,
            svg,
        });
    });

    html! {}
}

impl MlgRenderer {
    fn generate_dot(
        graph: &MlGraph,
        ctxt: DisplayCtxt<'_>,
        colour_map: &QuantIdxToColourMap,
    ) -> String {
        let settings = ["ranksep=0.5;", "splines=true;"];
        let dot = format!(
            "{:?}",
            Dot::with_attr_getters(
                &*graph.data,
                &[
                    Config::EdgeNoLabel,
                    Config::NodeNoLabel,
                    Config::GraphContentOnly
                ],
                &|_, edge| edge.weight().all(ctxt.config.debug, (), (), (), (), ()),
                &|_, (_, node_data)| { node_data.all(ctxt, ctxt, (), (), colour_map, (), ()) },
            )
        );
        let mut inputs = Vec::new();
        let mut fixeds = Vec::new();
        let mut outputs = Vec::new();
        let mut outside = Vec::new();
        for line in dot.lines() {
            let idx = line.find("class=\"");
            let class = idx.and_then(|idx| line[idx + 7..].split('"').next());
            match class {
                Some("input") => inputs.push(line),
                Some("fixed") => fixeds.push(line),
                Some("output") => outputs.push(line),
                _ => outside.push(line),
            }
        }
        let join = "\n    ";
        let cluster = |name, colour, middle| {
            format!("subgraph cluster_{name} {{{join}    style=filled{join}    color={colour}{join}{middle}{join}}}")
        };

        let cluster_in = cluster("in", "aliceblue", inputs.join(join));
        let cluster_fixed = cluster("fixed", "gray96", fixeds.join(join));
        let cluster_out = cluster("out", "aliceblue", outputs.join(join));
        format!(
            "digraph {{{join}{}{join}{cluster_in}{join}{cluster_fixed}{join}{cluster_out}{join}{}\n}}",
            settings.join(join),
            outside.join("\n"),
        )
    }
}
