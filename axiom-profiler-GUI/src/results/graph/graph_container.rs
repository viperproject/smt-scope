use petgraph::graph::NodeIndex;
use wasm_bindgen::{JsCast, UnwrapThrowExt};
use web_sys::Event;
use web_sys::HtmlInputElement;
use yew::prelude::*;

use super::svg_graph::Graph;

pub enum Msg {
    SetValueTo(f32),
    Noop,
}

pub struct GraphContainer {
    zoom_factor: f32,
}

#[derive(Properties, PartialEq)]
pub struct GraphContainerProps {
    pub svg_text: AttrValue,
    pub update_selected_nodes: Callback<usize>,
    pub update_selected_edges: Callback<usize>,
    pub deselect_all: Callback<()>,
    pub selected_nodes: Vec<NodeIndex>,
}

impl Component for GraphContainer {
    type Message = Msg;
    type Properties = GraphContainerProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self { zoom_factor: 1.0 }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::SetValueTo(value) => {
                self.zoom_factor = value;
                true
            }
            Msg::Noop => false,
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let set_value = {
            move |input_event: Event| {
                let target: HtmlInputElement = input_event
                    .target()
                    .unwrap_throw()
                    .dyn_into()
                    .unwrap_throw();
                match target.value().to_string().parse::<f32>() {
                    Ok(value) => {
                        // log::debug!("Setting the value to {}", value);
                        Msg::SetValueTo(value)
                    }
                    Err(_) => Msg::SetValueTo(1.0),
                }
            }
        };
        let set_value_on_enter = ctx.link().callback(move |key_event: KeyboardEvent| {
            if key_event.key() == "Enter" {
                let event: Event = key_event.clone().into();
                set_value(event)
            } else {
                Msg::Noop
            }
        });
        let set_value_on_blur = ctx.link().callback(move |blur_event: FocusEvent| {
            let event: Event = blur_event.clone().into();
            set_value(event)
        });
        html! {
        <div style="flex: 50%; height: 87vh; overflow: auto; position: relative;">
            <div style="position: sticky; top: 0px; left: 0px; z-index: 1;">
                <label for="input">{"Zoom factor: "}</label>
                <input onkeypress={set_value_on_enter} onblur={set_value_on_blur} id="input" placeholder="1"/>
            </div>
            <Graph
                svg_text={&ctx.props().svg_text}
                update_selected_nodes={&ctx.props().update_selected_nodes}
                update_selected_edges={&ctx.props().update_selected_edges}
                deselect_all={&ctx.props().deselect_all}
                zoom_factor={self.zoom_factor}
                selected_nodes={ctx.props().selected_nodes.clone()}
            />

        </div>
        }
    }
}
