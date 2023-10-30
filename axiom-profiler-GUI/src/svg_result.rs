use yew::prelude::*;
use prototype::parsers::{z3parser1, LogParser, ParserSettings};
use viz_js::VizInstance;
use petgraph::dot::{Dot, Config};
use yew_hooks::prelude::*;
use crate::graph::{Graph, GraphProps};
use crate::input_state::{IntegerInput, InputValue};
use crate::toggle_switch::ToggleSwitch;

#[derive(Properties, PartialEq)]
pub struct SVGProps {
    pub trace_file_text: AttrValue,
}

#[function_component(SVGResult)]
pub fn svg_result(props: &SVGProps) -> Html {
    log::debug!("SVG result");
    let graph_props = use_state(|| GraphProps::default());
    let max_log_line_nr = use_reducer(InputValue::default);
    let max_instantiations = use_reducer(InputValue::default);
    let ignore_theory_inst = use_bool_toggle(true);

    let parse_log = {
        let graph_props = graph_props.clone();
        let trace_file_text = props.trace_file_text.clone();
        let max_log_line_nr = max_log_line_nr.value.clone();
        let max_instantiations = max_instantiations.value.clone();
        let ignore_theory_inst = *ignore_theory_inst.clone();
        Callback::from(move |_| {
            let graph_props = graph_props.clone();
            let trace_file_text = trace_file_text.clone();
            // let mut parser = z3parser1::Z3Parser1::new();
            let mut parser = z3parser1::new_with_settings(ParserSettings{
                max_line_nr: max_log_line_nr as u32, 
                max_instantiations: max_instantiations as u32, 
                ignore_theory_inst: ignore_theory_inst,
            });
            parser.process_log(trace_file_text);
            let qi_graph = parser.get_instantiation_graph();
            let dot_output = format!("{:?}", Dot::with_config(qi_graph, &[Config::EdgeNoLabel])); 
            log::debug!("use effect");
            wasm_bindgen_futures::spawn_local(
                async move {
                   let graphviz = VizInstance::new().await;
                    let svg = graphviz
                        .render_svg_element(dot_output, viz_js::Options::default())
                        .expect("Could not render graphviz");
                    let svg_text = svg.outer_html();
                    graph_props.set(GraphProps{svg_text: AttrValue::from(svg_text), line_nr_of_node: parser.line_nr_of_node});
                },
            );
        })
    };

    // this resets the graph-props whenever a new log-file has been uploaded
    let uploaded_log = props.trace_file_text.clone();
    use_effect_with(uploaded_log, { 
        let graph_props = graph_props.clone();
        move |_| {
        graph_props.set(GraphProps::default());
    }});

    html! {
        <>
            <div>
                <h2>{"Parser settings"}</h2>
                <IntegerInput label={"Parse log up to which line number? (optional)"} dependency={props.trace_file_text.clone()} input_value={max_log_line_nr} />
                <IntegerInput label={"Parse log up to how many instantiations? (optional)"} dependency={props.trace_file_text.clone()} input_value={max_instantiations} />
                <ToggleSwitch label={"Ignore theory-solving instantiations"} dependency={props.trace_file_text.clone()} toggle={ignore_theory_inst} />
                <button onclick={parse_log}>{"Parse log and render instantiation graph"}</button>
            </div>
            <h2>{"Instantiation graph"}</h2>
            <Graph svg_text={graph_props.svg_text.clone()} line_nr_of_node={graph_props.line_nr_of_node.clone()} /> 
        </>
    }
}

