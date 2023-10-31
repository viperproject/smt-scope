use yew::prelude::*;
use wasm_bindgen::prelude::Closure;
use wasm_bindgen::JsCast;
use web_sys::{Event, HtmlElement};
use yew::{function_component, html, use_effect_with, use_node_ref, Html};
use std::collections::BTreeMap;

use crate::input_state::{InputValue, IntegerInput};

#[derive(Properties, PartialEq, Default)]
pub struct GraphProps {
    pub svg_text: AttrValue,
    pub line_nr_of_node: BTreeMap<usize, usize>,
}

#[function_component(Graph)]
pub fn graph(props: &GraphProps) -> Html {
    // let graph_state = use_reducer(GraphState::default);
    let max_line_nr = use_reducer(InputValue::default);
    let svg_result = Html::from_html_unchecked(props.svg_text.clone());
    let div_ref = use_node_ref();

    // attach_event_listeners_to_nodes(div_ref, svg_text);
    {
        // Whenever SVG text changes, need to attach event listeners to new nodes 
        let div_ref = div_ref.clone();
        let svg_text = props.svg_text.clone();

        use_effect_with(svg_text, move |_| {
            web_sys::console::log_1(&"Using effect".into());
            let div = div_ref
                .cast::<HtmlElement>()
                .expect("div_ref not attached to div element");

            let listener = Closure::<dyn Fn(Event)>::wrap(Box::new(|_| {
                    web_sys::console::log_1(&"Clicked!".into());
                }));

            // Iterate through all nodes with class "node" and add a click event listener
            let descendant_nodes = div.get_elements_by_class_name("node");
            for i in 0..descendant_nodes.length() {
                if let Some(node) = descendant_nodes.item(i) {
                    node.add_event_listener_with_callback("click", listener.as_ref().unchecked_ref()).unwrap();
                }
            }

            move || {
                // Remove event listeners when the component is unmounted
                for i in 0..descendant_nodes.length() {
                    if let Some(node) = descendant_nodes.item(i) {
                        node.remove_event_listener_with_callback("click", listener.as_ref().unchecked_ref()).unwrap();
                    }
                }
            }
        });
    }
    // handle_max_line_nr_update(div_ref, max_line_nr, line_nr_of_node);
    {
        // Whenever max_line_nr is updated, need to conditionally render the nodes and edges
        let div_ref = div_ref.clone();
        // let max_line_nr = graph_state.max_line_nr.clone();
        let max_line_nr = max_line_nr.value.clone();
        let line_nr_of_node = props.line_nr_of_node.clone();

        use_effect_with(max_line_nr, move |&max_line_nr| {
            web_sys::console::log_1(&"Using effect due to max_line_nr change".into());
            let div = div_ref
                .cast::<HtmlElement>()
                .expect("div_ref not attached to div element");

            // Iterate through all nodes with class "node" set visibility depending on line_nr 
            let descendant_nodes = div.get_elements_by_class_name("node");
            for i in 0..descendant_nodes.length() {
                if let Some(node) = descendant_nodes.item(i) {
                    let text_element = node.query_selector("text").expect("Failed to select text element");
                    if let Some(text) = text_element {
                        if let Some(text_content) = text.text_content() {
                            let visibility = match text_content.parse::<u32>() {
                                Ok(line_nr) => if line_nr > max_line_nr {
                                    "hidden"
                                } else {
                                    "visible"
                                },
                                Err(_) => "visible" 
                            };
                            let _ = node.set_attribute("visibility", visibility); 
                        }
                        
                    }
                }
            }
            // Iterate through all elements with class "edge" set visibility depending on line_nr 
            let descendant_edges = div.get_elements_by_class_name("edge");
            for i in 0..descendant_edges.length() {
                if let Some(edge) = descendant_edges.item(i) {
                    let title_element = edge.query_selector("title").expect("Failed to select title element");
                    if let Some(title) = title_element {
                        if let Some(title_content) = title.text_content() {
                            let visibility = match parse_edge_title(&title_content) {
                                Some((from_node_idx, to_node_idx)) => {
                                    match (line_nr_of_node.get(&from_node_idx), line_nr_of_node.get(&to_node_idx)) {
                                        (Some(&from_node_line_nr), Some(&to_node_line_nr)) => {
                                            // if from_node_line_nr > graph_state.max_line_nr as usize || to_node_line_nr > graph_state.max_line_nr as usize {
                                            if from_node_line_nr as u32 > max_line_nr || to_node_line_nr as u32 > max_line_nr {
                                                web_sys::console::log_1(&"Hiding edge:".into());
                                                web_sys::console::log_1(&title_content.into());
                                                "hidden"
                                            } else {
                                                "visible"
                                            }
                                        },
                                        (_, _) => "visible"
                                    }
                                }, 
                                _ =>  "visible"
                            };
                            let _ = edge.set_attribute("visibility", visibility);
                        }
                    }
                }
            }
            move || {
                web_sys::console::log_1(&"Tearing down".into());
            }
        });
    }

    html! {
        <>
            <IntegerInput label={"Render graph up to line number: "} dependency={props.svg_text.clone()} input_value={max_line_nr} />
            <div ref={div_ref}>
                {svg_result}
            </div>
        </>
    }
}

fn parse_edge_title(input: &str) -> Option<(usize, usize)> {
    // Split the input string by "->" and parse the integers
    let parts: Vec<&str> = input.trim().split("->").collect();

    if parts.len() == 2 {
        let x = parts[0].trim().parse::<i32>();
        let y = parts[1].trim().parse::<i32>();

        // Check if parsing was successful
        match (x, y) {
            (Ok(x_val), Ok(y_val)) => Some((x_val as usize, y_val as usize)),
            _ => None,
        }
    } else {
        None
    }
}