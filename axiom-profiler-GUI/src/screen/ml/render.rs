use std::rc::Rc;

use smt_log_parser::{
    analysis::analysis::matching_loop::MlGraph, display::DisplayCtxt, display::TermDisplayContext,
};
use yew::{function_component, html, use_context, Html, Properties};

use crate::{
    configuration::ConfigurationProvider,
    screen::{
        file::RcAnalysis,
        graphviz::{DotEdgeProperties, DotNodeProperties},
        homepage::{FileInfo, RcParser},
    },
    utils::{colouring::QuantIdxToColourMap, graphviz::Dot, tab::Tab},
};

#[derive(Properties, Clone)]
pub struct MlgrProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub idx: usize,
    pub file: FileInfo,
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
        return html! { <h2>{"Failed to generalise repeating chain, might not be a matching loop."}</h2> };
    };

    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    let mut ctxt = DisplayCtxt {
        parser: &props.parser.parser.borrow(),
        term_display: &term_display,
        config: cfg.config.display,
    };
    ctxt.config.font_tag = true;
    let dot = MlgRenderer::generate_dot(graph, ctxt, &props.parser.colour_map);
    log::debug!("ML Graph DOT:\n{dot}");

    let warning = if graph.graph_incomplete {
        html! { <span class="warning" title="Error during graph construction, the graph is incomplete!">{"⚠️ Incomplete ⚠️"}</span> }
    } else {
        html! {}
    };

    let filename = props.file.name.clone();
    let suffix = format!("_ml_{}", props.idx + 1);
    html! {<Tab title="Matching Loop">
        {warning}
        <Dot {dot} {filename} {suffix} scale={false} />
    </Tab>}
}

impl MlgRenderer {
    fn generate_dot(
        graph: &MlGraph,
        ctxt: DisplayCtxt<'_>,
        colour_map: &QuantIdxToColourMap,
    ) -> String {
        use petgraph::dot::{Config, Dot};
        let settings = ["ranksep=0.5;", "splines=true;"];
        let dot = format!(
            "{:?}",
            Dot::with_attr_getters(
                &*graph.data,
                &[
                    Config::EdgeNoLabel,
                    Config::NodeNoLabel,
                    Config::GraphContentOnly,
                ],
                &|_, edge| edge
                    .weight()
                    .all(ctxt.config.debug, (), (), (), (), (), (), (), ()),
                &|_, (_, node_data)| {
                    node_data.all(ctxt, (), ctxt, (), (), colour_map, (), (), ())
                },
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
            "digraph {{{join}{}{join}{cluster_in}{join}{cluster_fixed}{join}{cluster_out}\n{}\n}}",
            settings.join(join),
            outside.join("\n"),
        )
    }
}
