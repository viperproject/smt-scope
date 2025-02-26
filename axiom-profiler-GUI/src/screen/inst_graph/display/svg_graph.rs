use fxhash::FxHashSet;
use petgraph::graph::{EdgeIndex, NodeIndex};
use smt_log_parser::analysis::{RawNodeIndex, VisibleEdgeIndex};
use wasm_bindgen::prelude::Closure;
use wasm_bindgen::JsCast;
use web_sys::{Element, SvgsvgElement};
use yew::prelude::*;
use yew::{function_component, html};

use crate::screen::inst_graph::RenderedGraph;
use crate::utils::svg::{SvgHelper, ViewBox};
use crate::{mouse_position, PrecisePosition};

#[derive(Properties, PartialEq)]
pub struct GraphProps {
    pub rendered: RenderedGraph,
    pub on_rerender: Callback<()>,
    pub update_selected_nodes: Callback<RawNodeIndex>,
    pub update_selected_edges: Callback<VisibleEdgeIndex>,
    pub zoom_factor: f64,
    pub zoom_factor_delta: f64,
    pub zoom_with_mouse: bool,
    pub scroll_position: PrecisePosition,
    pub set_scroll: Callback<(PrecisePosition, PrecisePosition)>,
    pub scroll_window: NodeRef,
    pub children: Children,
}

#[function_component]
pub fn Graph(props: &GraphProps) -> Html {
    let generation = props.rendered.graph.generation;
    {
        let svg_el = props.rendered.svg.clone();
        let zoom_factor = props.zoom_factor;
        let zoom_factor_delta = props.zoom_factor_delta;
        let zoom_with_mouse = props.zoom_with_mouse;
        let centered = use_state(|| false);
        let mut scroll_position = props.scroll_position;
        let scroll_window = props.scroll_window.clone();
        let set_scroll = props.set_scroll.clone();
        use_effect_with_deps(
            move |&(_generation, zoom_factor)| {
                let view_box = svg_el.get_view_box().unwrap();
                let (svg_width, svg_height) = (
                    view_box.width + 2.0 * view_box.x,
                    view_box.height + 2.0 * view_box.y,
                );

                let scroll_window = scroll_window.cast::<Element>().unwrap();
                let rect = scroll_window.get_bounding_client_rect();
                let (sw_x, sw_y, sw_w, sw_h) = (rect.x(), rect.y(), rect.width(), rect.height());

                const MARGIN: f64 = 128.0;
                let (svg_width, svg_height) = (svg_width + 2.0 * MARGIN, svg_height + 2.0 * MARGIN);
                let view_box = ViewBox {
                    x: -MARGIN,
                    y: -MARGIN,
                    width: svg_width,
                    height: svg_height,
                };
                svg_el.set_view_box(view_box).unwrap();

                let new_scroll = {
                    let (x, y) = if zoom_with_mouse {
                        let mouse = *mouse_position().read().unwrap();
                        let (x, y) = (mouse.x as f64 - sw_x, mouse.y as f64 - sw_y);
                        // How much of the edge should go to zooming in there
                        const EDGE_ZOOM_BOUNDARY: f64 = 0.15;
                        let (lower_x, upper_x) =
                            (sw_w * EDGE_ZOOM_BOUNDARY, sw_w * (1.0 - EDGE_ZOOM_BOUNDARY));
                        let (lower_y, upper_y) =
                            (sw_h * EDGE_ZOOM_BOUNDARY, sw_h * (1.0 - EDGE_ZOOM_BOUNDARY));
                        match (x < lower_x, x > upper_x, y < lower_y, y > upper_y) {
                            (true, false, true, false) => (0.0, 0.0),
                            (false, true, true, false) => (sw_w, 0.0),
                            (true, false, false, true) => (0.0, sw_h),
                            (false, true, false, true) => (sw_w, sw_h),
                            _ => (x, y),
                        }
                    } else {
                        (sw_w / 2.0, sw_h / 2.0)
                    };

                    if !*centered {
                        // On first render, we want to center the graph
                        centered.set(true);
                        scroll_position = PrecisePosition {
                            x: MARGIN - 10.0,
                            y: MARGIN - 10.0,
                        };
                    }
                    let zoom_factor_delta_chg = 1.0 - (1.0 / zoom_factor_delta);
                    let (width, height) = (x * zoom_factor_delta_chg, y * zoom_factor_delta_chg);
                    let left = (scroll_position.x + width) * zoom_factor_delta;
                    let top = (scroll_position.y + height) * zoom_factor_delta;
                    PrecisePosition { x: left, y: top }
                };

                let (scaled_width, scaled_height) =
                    (svg_width * zoom_factor, svg_height * zoom_factor);
                let _ = svg_el.set_attribute("width", scaled_width.to_string().as_str());
                let _ = svg_el.set_attribute("height", scaled_height.to_string().as_str());
                let graph_dims = PrecisePosition {
                    x: scaled_width,
                    y: scaled_height,
                };
                set_scroll.emit((new_scroll, graph_dims));
            },
            (generation, zoom_factor),
        )
    }

    {
        // Whenever selected nodes change, we want to update the visual representation of the nodes
        let div = props.rendered.svg.clone();
        let selected_nodes: FxHashSet<_> = props.rendered.selected_nodes.iter().copied().collect();

        use_effect_with_deps(
            move |(_generation, selected_nodes)| {
                let descendant_nodes = div.get_elements_by_class_name("node");
                for i in 0..descendant_nodes.length() {
                    let node = descendant_nodes.item(i).unwrap();
                    let _ = node.class_list().add_1("clickable");
                    let idx = node.id().strip_prefix("node_").unwrap().parse::<usize>();
                    let idx = RawNodeIndex(NodeIndex::new(idx.unwrap()));
                    if selected_nodes.contains(&idx) {
                        let _ = node.class_list().add_1("selected");
                    } else {
                        let _ = node.class_list().remove_1("selected");
                    }
                }
            },
            (generation, selected_nodes),
        );
    }

    {
        // Whenever selected edges change, we want to update the visual representation of the edges
        let div = props.rendered.svg.clone();
        let selected_edges: FxHashSet<_> = props.rendered.selected_edges.iter().copied().collect();

        use_effect_with_deps(
            move |(_generation, selected_edges)| {
                let descendant_edges = div.get_elements_by_class_name("edge");
                for i in 0..descendant_edges.length() {
                    let edge = descendant_edges.item(i).unwrap();
                    let _ = edge.class_list().add_1("clickable");
                    let idx = edge.id().strip_prefix("edge_").unwrap().parse::<usize>();
                    let idx = VisibleEdgeIndex(EdgeIndex::new(idx.unwrap()));
                    if selected_edges.contains(&idx) {
                        let _ = edge.class_list().add_1("selected");
                    } else {
                        let _ = edge.class_list().remove_1("selected");
                    }
                }
            },
            (generation, selected_edges),
        );
    }

    {
        let nodes_callback = props.update_selected_nodes.clone();
        let edges_callback = props.update_selected_edges.clone();
        let on_rerender = props.on_rerender.clone();

        let div = props.rendered.svg.clone();
        use_effect_with_deps(
            move |_generation| {
                on_rerender.emit(());

                // construct event_listeners that emit node indices (contained in title tags)
                let descendant_nodes = div.get_elements_by_class_name("node");
                let node_closures: Vec<_> = (0..descendant_nodes.length())
                    .map(|i| {
                        // extract node_index from node to construct callback that emits it
                        let node = descendant_nodes.item(i).unwrap();
                        // Create a duplicate of the node which is transparent
                        // to make it more clickable, especially when it gets
                        // gets selected and the original node becomes larger.
                        let node_shape = node
                            .get_elements_by_tag_name("polygon")
                            .item(0)
                            .or_else(|| node.get_elements_by_tag_name("ellipse").item(0));
                        if let Some(node_shape) = node_shape {
                            if let Some(parent) = node_shape.parent_node() {
                                if let Some(duplicate) = node_shape
                                    .clone_node()
                                    .ok()
                                    .and_then(|e| e.dyn_into::<Element>().ok())
                                {
                                    let _ = parent.append_child(&duplicate);
                                    duplicate.set_attribute("stroke-width", "5").unwrap();
                                    duplicate.set_attribute("stroke", "transparent").unwrap();
                                    duplicate.set_attribute("fill", "transparent").unwrap();
                                }
                            }
                        }
                        let idx = node.id().strip_prefix("node_").unwrap().parse::<usize>();
                        let idx = RawNodeIndex(NodeIndex::new(idx.unwrap()));
                        // attach event listener to node
                        let callback = nodes_callback.clone();
                        let mousedown: Closure<dyn Fn(Event)> = Closure::new(move |e: Event| {
                            e.cancel_bubble();
                            e.stop_propagation();
                            callback.emit(idx);
                        });
                        node.add_event_listener_with_callback(
                            "mousedown",
                            mousedown.as_ref().unchecked_ref(),
                        )
                        .unwrap();
                        let callback = nodes_callback.clone();
                        let mouseover: Closure<dyn Fn(Event)> = Closure::new(move |e: Event| {
                            let Ok(e) = e.dyn_into::<web_sys::MouseEvent>() else {
                                return;
                            };
                            if e.buttons() == 1 && e.shift_key() {
                                callback.emit(idx)
                            }
                        });
                        node.add_event_listener_with_callback(
                            "mouseover",
                            mouseover.as_ref().unchecked_ref(),
                        )
                        .unwrap();
                        (mousedown, mouseover)
                    })
                    .collect();
                let direct_edges = div.get_elements_by_class_name("edge");
                let edge_closures: Vec<_> = (0..direct_edges.length())
                    .map(|i| {
                        // extract edge_index from edge to construct callback that emits it
                        let edge = direct_edges.item(i).unwrap();
                        // Create a duplicate of the edge which is transparent
                        // to make it more clickable.
                        let mut edge_hover_select = edge.clone();
                        if let Some(edge_path) = edge.get_elements_by_tag_name("path").item(0) {
                            if let Some(parent) = edge_path.parent_node() {
                                if let Some(duplicate) = edge_path
                                    .clone_node()
                                    .ok()
                                    .and_then(|e| e.dyn_into::<Element>().ok())
                                {
                                    let _ = parent.append_child(&duplicate);
                                    duplicate.set_attribute("stroke-width", "15").unwrap();
                                    duplicate.set_attribute("stroke", "transparent").unwrap();
                                    duplicate.remove_attribute("stroke-dasharray").ok();
                                    edge_hover_select = duplicate;
                                }
                            }
                        }
                        let idx = edge.id().strip_prefix("edge_").unwrap().parse::<usize>();
                        let idx = VisibleEdgeIndex(EdgeIndex::new(idx.unwrap()));
                        // attach event listener to edge
                        let callback = edges_callback.clone();
                        let mousedown: Closure<dyn Fn(Event)> = Closure::new(move |e: Event| {
                            e.cancel_bubble();
                            e.stop_propagation();
                            callback.emit(idx);
                        });
                        edge.add_event_listener_with_callback(
                            "mousedown",
                            mousedown.as_ref().unchecked_ref(),
                        )
                        .unwrap();
                        let callback = edges_callback.clone();
                        let mouseover: Closure<dyn Fn(Event)> = Closure::new(move |e: Event| {
                            let Ok(e) = e.dyn_into::<web_sys::MouseEvent>() else {
                                return;
                            };
                            if e.buttons() == 1 && e.shift_key() {
                                callback.emit(idx)
                            }
                        });
                        // Attach this event only to the edge and not the whole
                        // `edge` (including the arrowhead) because then we get
                        // two mousover events when moving from path to arrowhead.
                        edge_hover_select
                            .add_event_listener_with_callback(
                                "mouseover",
                                mouseover.as_ref().unchecked_ref(),
                            )
                            .unwrap();
                        (mousedown, mouseover, edge_hover_select)
                    })
                    .collect();
                move || {
                    for (i, (mousedown, mouseover)) in node_closures.iter().enumerate() {
                        if let Some(node) = descendant_nodes.item(i as u32) {
                            node.remove_event_listener_with_callback(
                                "mousedown",
                                mousedown.as_ref().unchecked_ref(),
                            )
                            .unwrap();
                            node.remove_event_listener_with_callback(
                                "mouseover",
                                mouseover.as_ref().unchecked_ref(),
                            )
                            .unwrap();
                        }
                    }
                    for (i, (mousedown, mouseover, edge_hover_select)) in
                        edge_closures.iter().enumerate()
                    {
                        if let Some(edge) = direct_edges.item(i as u32) {
                            edge.remove_event_listener_with_callback(
                                "mousedown",
                                mousedown.as_ref().unchecked_ref(),
                            )
                            .unwrap();
                            edge_hover_select
                                .remove_event_listener_with_callback(
                                    "mouseover",
                                    mouseover.as_ref().unchecked_ref(),
                                )
                                .unwrap();
                        }
                    }
                }
            },
            generation,
        );
    }

    html! {
        <div class="no-select">
            {props.children.clone()}
        </div>
    }
}

#[derive(Properties)]
pub struct SvgProps {
    pub svg: (SvgsvgElement, u32),
}
impl PartialEq for SvgProps {
    fn eq(&self, other: &Self) -> bool {
        self.svg.1 == other.svg.1
    }
}

#[function_component]
pub fn Svg(props: &SvgProps) -> Html {
    let svg = props.svg.0.clone();
    Html::VRef(svg.into())
}
