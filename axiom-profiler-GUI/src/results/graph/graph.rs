use petgraph::graph::NodeIndex;
use wasm_bindgen::prelude::Closure;
use wasm_bindgen::JsCast;
use web_sys::{Event, HtmlElement, SvgsvgElement};
use yew::prelude::*;
use yew::{function_component, html, use_node_ref, Html};

const NODE_SHAPE: &str = "polygon";

#[derive(Properties, PartialEq, Default)]
pub struct GraphProps {
    pub svg_text: AttrValue,
    pub update_selected_nodes: Callback<usize>,
    pub update_selected_edges: Callback<usize>,
    pub deselect_all: Callback<()>,
    pub zoom_factor: f32,
    pub selected_nodes: Vec<NodeIndex>,
}

#[function_component(Graph)]
pub fn graph(props: &GraphProps) -> Html {
    let svg_result = Html::from_html_unchecked(props.svg_text.clone());
    let div_ref = use_node_ref();

    {
        let div_ref = div_ref.clone();
        let zoom_factor = props.zoom_factor;
        let svg_text = props.svg_text.clone();
        use_effect_with_deps(
            move |_| {
                let div = div_ref
                    .cast::<HtmlElement>()
                    .expect("div_ref not attached to div element");
                // setting the transform-origin to the top left corner of the surrounding div
                // we know there is only a single SVG element, hence can just take item(0)
                let svg_element = div.get_elements_by_tag_name("svg").item(0);
                if let Some(el) = svg_element {
                    let svg_el = el.dyn_into::<SvgsvgElement>().ok().unwrap();
                    let _ = svg_el.set_attribute("transform-origin", "top left");
                    web_sys::console::log_1(&"Updating the transform-attribute of svg to ".into());
                    web_sys::console::log_1(&zoom_factor.into());
                    let _ = svg_el.set_attribute(
                        "style",
                        format!("transform: scale({});", zoom_factor).as_str(),
                    );
                }
            },
            (svg_text, zoom_factor),
        )
    }

    {
        // Whenever SVG text changes, need to attach event listeners to new nodes
        let div_ref = div_ref.clone();
        let svg_text = props.svg_text.clone();
        let nodes_callback = props.update_selected_nodes.clone();
        let edges_callback = props.update_selected_edges.clone();
        let background_callback = props.deselect_all.clone();
        let selected_nodes: Vec<usize> = props
            .selected_nodes
            .iter()
            .map(|nidx| nidx.index())
            .collect();

        use_effect_with_deps(
            move |_| {
                web_sys::console::log_1(&"Using effect".into());
                let div = div_ref
                    .cast::<HtmlElement>()
                    .expect("div_ref not attached to div element");

                // attach event listener to surrounding polygon that makes all nodes unselected when clicked on it
                let background = div
                    .query_selector("svg > g > polygon")
                    .expect("Failed to select svg > g > polygon");
                let background_closure: Vec<Closure<dyn Fn(Event)>> =
                    if let Some(ref background_el) = background {
                        let callback = background_callback.clone();
                        let div = div.clone();
                        let closure: Closure<dyn Fn(Event)> = Closure::new(move |_: Event| {
                            let nodes = div.get_elements_by_class_name("node");
                            for i in 0..nodes.length() {
                                let node = nodes.item(i).unwrap();
                                let ellipse = node
                                    .query_selector(NODE_SHAPE)
                                    .expect("Failed to select ellipse")
                                    .unwrap();
                                let _ = ellipse.set_attribute("stroke-width", "1");
                            }
                            let edges = div.get_elements_by_class_name("edge direct");
                            for i in 0..edges.length() {
                                let edge = edges.item(i).unwrap();
                                let path = edge
                                    .query_selector("path")
                                    .expect("Failed to select path")
                                    .unwrap();
                                let _ = path.set_attribute("stroke-width", "1");
                            }
                            callback.emit(());
                        });
                        background_el
                            .add_event_listener_with_callback(
                                "click",
                                closure.as_ref().unchecked_ref(),
                            )
                            .unwrap();
                        vec![closure]
                    } else {
                        vec![]
                    };
                // construct event_listeners that emit node indices (contained in title tags)
                let descendant_nodes = div.get_elements_by_class_name("node");
                let node_closures: Vec<Closure<dyn Fn(Event)>> = (0..descendant_nodes.length())
                    .map(|i| {
                        // extract node_index from node to construct callback that emits it
                        let node = descendant_nodes.item(i).unwrap();
                        let ellipse = node
                            .query_selector(NODE_SHAPE)
                            .expect("Failed to select title element")
                            .unwrap();
                        let node_index = node
                            .id()
                            .strip_prefix("node")
                            .unwrap()
                            .parse::<usize>()
                            .unwrap();
                        if selected_nodes.contains(&node_index) {
                            let _ = ellipse.set_attribute("stroke-width", "3");
                        }
                        let callback = nodes_callback.clone();
                        let closure: Closure<dyn Fn(Event)> = Closure::new(move |_: Event| {
                            // the selected node should become bold whenever it's clicked on the first time
                            // after that it should also toggle between bold and normal when the user repeatedly
                            // clicks on the node
                            let current_stroke_width = ellipse.get_attribute("stroke-width");
                            match current_stroke_width {
                                None => {
                                    let _ = ellipse.set_attribute("stroke-width", "3");
                                }
                                Some(ref width) => match width.parse::<usize>() {
                                    Ok(1) => {
                                        let _ = ellipse.set_attribute("stroke-width", "3");
                                    }
                                    Ok(3) => {
                                        let _ = ellipse.set_attribute("stroke-width", "1");
                                    }
                                    _ => (),
                                },
                            };
                            callback.emit(node_index);
                        });
                        // attach event listener to node
                        node.add_event_listener_with_callback(
                            "click",
                            closure.as_ref().unchecked_ref(),
                        )
                        .unwrap();
                        closure
                    })
                    .collect();
                let direct_edges = div.get_elements_by_class_name("edge direct");
                let edge_closures: Vec<Closure<dyn Fn(Event)>> = (0..direct_edges.length())
                    .map(|i| {
                        // extract node_index from node to construct callback that emits it
                        let node = direct_edges.item(i).unwrap();
                        let path = node
                            .query_selector("path")
                            .expect("Failed to select title element")
                            .unwrap();
                        let edge_index = node
                            .id()
                            .strip_prefix("edge")
                            .unwrap()
                            .parse::<usize>()
                            .unwrap();
                        let callback = edges_callback.clone();
                        let closure: Closure<dyn Fn(Event)> = Closure::new(move |_: Event| {
                            log::debug!("Clicked on edge {}", edge_index);
                            let current_stroke_width = path.get_attribute("stroke-width");
                            match current_stroke_width {
                                None => {
                                    let _ = path.set_attribute("stroke-width", "3");
                                }
                                Some(ref width) => match width.parse::<usize>() {
                                    Ok(1) => {
                                        let _ = path.set_attribute("stroke-width", "3");
                                    }
                                    Ok(3) => {
                                        let _ = path.set_attribute("stroke-width", "1");
                                    }
                                    _ => (),
                                },
                            };
                            callback.emit(edge_index);
                        });
                        // attach event listener to node
                        node.add_event_listener_with_callback(
                            "click",
                            closure.as_ref().unchecked_ref(),
                        )
                        .unwrap();
                        closure
                    })
                    .collect();
                move || {
                    // Remove event listeners when the component is unmounted
                    if let Some(background_el) = background {
                        let closure = background_closure[0].as_ref();
                        background_el
                            .remove_event_listener_with_callback("click", closure.unchecked_ref())
                            .unwrap();
                    }
                    for i in 0..node_closures.len() {
                        if let Some(node) = descendant_nodes.item(i as u32) {
                            let closure = node_closures.as_slice()[i as usize].as_ref();
                            node.remove_event_listener_with_callback(
                                "click",
                                closure.unchecked_ref(),
                            )
                            .unwrap();
                        }
                    }
                    for i in 0..edge_closures.len() {
                        if let Some(edge) = direct_edges.item(i as u32) {
                            let closure = edge_closures.as_slice()[i as usize].as_ref();
                            edge.remove_event_listener_with_callback(
                                "click",
                                closure.unchecked_ref(),
                            )
                            .unwrap();
                        }
                    }
                }
            },
            svg_text,
        );
    }
    {
        let selected_nodes = props.selected_nodes.clone();
        let svg_text = props.svg_text.clone();
        // let selected_nodes: Vec<usize> = props.selected_nodes.iter().map(|nidx| nidx.index()).collect();
        let div_ref = div_ref.clone();
        use_effect_with_deps(
            {
                web_sys::console::log_1(&"Using effect due to changed selected nodes".into());
                let selected_nodes = selected_nodes.clone();
                move |_| {
                    let div = div_ref
                        .cast::<HtmlElement>()
                        .expect("div_ref not attached to div element");
                    let nodes = div.get_elements_by_class_name("node");
                    for i in 0..nodes.length() {
                        let node = nodes.item(i).unwrap();
                        let node_index = NodeIndex::new(
                            node.id()
                                .strip_prefix("node")
                                .unwrap()
                                .parse::<usize>()
                                .unwrap(),
                        );
                        let ellipse = node
                            .query_selector(NODE_SHAPE)
                            .expect("Failed to select ellipse")
                            .unwrap();
                        if selected_nodes.contains(&node_index) {
                            let _ = ellipse.set_attribute("stroke-width", "3");
                        } else {
                            let _ = ellipse.set_attribute("stroke-width", "1");
                        }
                    }
                }
            },
            (selected_nodes, svg_text),
        );
    }
    let deselect_all = {
        let callback = props.deselect_all.clone();
        let div_ref = div_ref.clone();
        Callback::from(move |_| {
            if let Some(div_el) = div_ref.cast::<HtmlElement>() {
                let nodes = div_el.get_elements_by_class_name("node");
                let edges = div_el.get_elements_by_class_name("edge direct");
                for i in 0..nodes.length() {
                    let node = nodes.item(i).unwrap();
                    let ellipse = node
                        .query_selector(NODE_SHAPE)
                        .expect("Failed to select ellipse")
                        .unwrap();
                    let _ = ellipse.set_attribute("stroke-width", "1");
                }
                for i in 0..edges.length() {
                    let edge = edges.item(i).unwrap();
                    let path = edge
                        .query_selector("path")
                        .expect("Failed to select path")
                        .unwrap();
                    let _ = path.set_attribute("stroke-width", "1");
                }
            }
            callback.emit(())
        })
    };
    html! {
        <>
            // this is a "background" div
            // when the user clicks on it, it deselect all previously selected nodes
            <div onclick={deselect_all} style="position: sticky; top: 0; left: 0; height: 87vh;"></div>
            <div ref={div_ref} style="position: absolute; top: 19px; left: 0; overflow: visible; width: 0; height: 0;">
                {svg_result}
            </div>
        </>
    }
}
