use fxhash::FxHashMap;
use gloo::timers::callback::{Interval, Timeout};
use material_yew::WeakComponentLink;
use smt_log_parser::parsers::z3::graph::{RawNodeIndex, VisibleEdgeIndex};
use wasm_bindgen::closure::Closure;
use wasm_bindgen::{JsCast, UnwrapThrowExt};
use wasm_timer::Instant;
use web_sys::{Element, HtmlInputElement, ResizeObserver, ResizeObserverEntry};
use yew::prelude::*;

use crate::commands::{Command, CommandRef, CommandsContext};
use crate::results::svg_result::RenderedGraph;
use crate::state::StateContext;
use crate::{CallbackRef, GlobalCallbacksContext, PagePosition, PrecisePosition};

use super::svg_graph::{Graph, Svg};

pub enum Msg {
    SetValueTo(f64),
    SetScrollTo((PrecisePosition, PrecisePosition)),
    Wheel(WheelEvent),
    Scroll(Event),
    MouseDown(MouseEvent),
    MouseMove(MouseEvent),
    MouseUp(MouseEvent),
    KeyDown(KeyboardEvent),
    KeyUp(KeyboardEvent),
    KeyHold(()),
    Resize(Vec<ResizeObserverEntry>),
    FocusSelection,
    ScrollZoomSelection(Vec<RawNodeIndex>, Vec<VisibleEdgeIndex>),
    ScrollSelection(Vec<RawNodeIndex>, Vec<VisibleEdgeIndex>),
}

pub struct GraphContainer {
    graph: Option<(Html, u32)>,
    window: GraphWindow,

    mouse_closures: Option<Closure<dyn Fn(MouseEvent)>>,
    resize_observer: Option<ResizeObserverPair>,
    drag_start: Option<(PagePosition, PagePosition, bool)>,
    zoom_factor: f64,
    zoom_factor_delta: f64,
    zoom_with_mouse: bool,
    held_keys: FxHashMap<String, (Instant, f64, Option<Instant>)>,
    timeout: Option<Interval>,
    _callback_refs: [CallbackRef; 4],
    _command_refs: [CommandRef; 1],
    _command_selection: [CommandRef; 2],
}

pub type ResizeObserverPair = (ResizeObserver, Closure<dyn Fn(Vec<ResizeObserverEntry>)>);

impl GraphContainer {
    pub fn set_zoom(&mut self, zoom_factor: f64, with_mouse: bool) {
        let zoom_factor = zoom_factor.min(5.0).max(0.005);
        self.zoom_factor_delta = zoom_factor / self.zoom_factor;
        self.zoom_with_mouse = with_mouse;
        self.zoom_factor = zoom_factor;
    }
}

#[derive(Debug, Clone, Default)]
struct GraphWindow {
    /// The scroll position
    graph_position: PrecisePosition,
    /// The scrollable area
    graph_dims: PrecisePosition,
    /// The window position
    window_position: PrecisePosition,
    /// The window size
    window_dims: PrecisePosition,
    /// Amount of scroll lost due to out of bounds scrolling
    scroll_loss: PrecisePosition,
    ignore_scroll: bool,
    scroll_window: NodeRef,
}

impl GraphWindow {
    fn scroll_by(&mut self, delta: PrecisePosition, save_loss: Option<f64>) {
        if delta.x == 0.0 && delta.y == 0.0 {
            return;
        }
        self.scroll_to(self.graph_position + delta, save_loss);
    }
    fn scroll_to(&mut self, pos: PrecisePosition, save_loss: Option<f64>) {
        if let Some(save_loss) = save_loss {
            self.scroll_loss *= save_loss;
        }
        let zero = PrecisePosition::default();
        let bounded = (pos + self.scroll_loss)
            .min(self.graph_dims - self.window_dims)
            .max(zero);
        if save_loss.is_some() {
            self.scroll_loss += pos - bounded;
            self.ignore_scroll = true;
        }
        self.update_scroll_position(bounded);
        self.scroll_window
            .cast::<Element>()
            .unwrap_throw()
            .scroll_to_with_x_and_y(bounded.x, bounded.y);
    }

    fn update_scroll_position(&mut self, graph_position: PrecisePosition) {
        self.graph_position = graph_position;
    }

    fn read_scroll_position(&mut self) {
        if !self.ignore_scroll {
            self.scroll_loss = PrecisePosition::default();
        } else {
            self.ignore_scroll = false;
        }
        let scroll_window = self.scroll_window.cast::<Element>().unwrap_throw();
        let graph_position = PrecisePosition {
            x: scroll_window.scroll_left() as f64,
            y: scroll_window.scroll_top() as f64,
        };
        self.update_scroll_position(graph_position);
    }
    fn read_window_dimensions(&mut self) {
        let scroll_window = self.scroll_window.cast::<Element>().unwrap_throw();
        let rect = scroll_window.get_bounding_client_rect();
        let new_position = PrecisePosition {
            x: rect.x(),
            y: rect.y(),
        };
        self.window_position = new_position;
        let new_dims = PrecisePosition {
            x: rect.width(),
            y: rect.height(),
        };
        self.window_dims = new_dims;
    }
}

#[derive(Properties, PartialEq)]
pub struct GraphContainerProps {
    pub rendered: Option<RenderedGraph>,
    pub update_selected_nodes: Callback<RawNodeIndex>,
    pub update_selected_edges: Callback<VisibleEdgeIndex>,
    pub deselect_all: Callback<()>,
    pub select_all: Callback<()>,
    pub selected_nodes: Vec<RawNodeIndex>,
    pub selected_edges: Vec<VisibleEdgeIndex>,
    pub weak_link: WeakComponentLink<GraphContainer>,
}

impl Component for GraphContainer {
    type Message = Msg;
    type Properties = GraphContainerProps;

    fn create(ctx: &Context<Self>) -> Self {
        ctx.props()
            .weak_link
            .borrow_mut()
            .replace(ctx.link().clone());

        let graph = ctx.props().rendered.as_ref().map(|r| {
            (
                Html::from_html_unchecked(r.svg_text.clone()),
                r.graph.generation,
            )
        });

        // Global callbacks
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mouse_move_ref = (registerer.register_mouse_move)(ctx.link().callback(Msg::MouseMove));
        let mouse_up_ref = (registerer.register_mouse_up)(ctx.link().callback(Msg::MouseUp));
        let keydown = (registerer.register_keyboard_down)(ctx.link().callback(Msg::KeyDown));
        let keyup = (registerer.register_keyboard_up)(ctx.link().callback(Msg::KeyUp));
        let _callback_refs = [mouse_move_ref, mouse_up_ref, keydown, keyup];

        // Commands
        let commands = ctx.link().get_commands_registerer().unwrap();
        let select_all = Command {
            name: "Select all".to_string(),
            execute: ctx.props().select_all.clone(),
            keyboard_shortcut: vec!["Cmd", "a"],
            disabled: false,
        };
        let select_all = (commands)(select_all);
        let _command_refs = [select_all];
        let deselect_all = Command {
            name: "Deselect".to_string(),
            execute: ctx.props().deselect_all.clone(),
            keyboard_shortcut: vec!["Esc"],
            disabled: true,
        };
        let deselect_all = (commands)(deselect_all);
        let focus_selection = Command {
            name: "Focus selection".to_string(),
            execute: ctx.link().callback(|_| Msg::FocusSelection),
            keyboard_shortcut: vec!["f"],
            disabled: true,
        };
        let focus_selection = (commands)(focus_selection);
        let _command_selection = [deselect_all, focus_selection];

        let held_keys = FxHashMap::default();
        Self {
            graph,
            mouse_closures: None,
            resize_observer: None,
            drag_start: None,
            window: GraphWindow::default(),
            zoom_factor: 1.0,
            zoom_factor_delta: 1.0,
            zoom_with_mouse: false,
            held_keys,
            timeout: None,
            _callback_refs,
            _command_selection,
            _command_refs,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        self.zoom_factor_delta = 1.0;
        if self.graph.as_ref().map(|g| g.1)
            != ctx.props().rendered.as_ref().map(|r| r.graph.generation)
        {
            self.graph = ctx.props().rendered.as_ref().map(|r| {
                (
                    Html::from_html_unchecked(r.svg_text.clone()),
                    r.graph.generation,
                )
            });
        }
        let old_no_selection =
            old_props.selected_nodes.is_empty() && old_props.selected_edges.is_empty();
        let new_no_selection =
            ctx.props().selected_nodes.is_empty() && ctx.props().selected_edges.is_empty();
        if old_no_selection != new_no_selection {
            for c in &self._command_selection {
                c.set_disabled(new_no_selection);
            }
        }
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::SetValueTo(value) => {
                self.set_zoom(value, false);
                true
            }
            Msg::SetScrollTo((pos, graph_dims)) => {
                self.window.graph_dims = graph_dims;
                self.window.scroll_to(pos, Some(self.zoom_factor_delta));
                false
            }
            Msg::Wheel(ev) => {
                if ev.ctrl_key() {
                    ev.prevent_default();
                    let need_to_flip = ev.delta_y() >= 0.0;
                    // We need `delta < 0` such that the `powf` doesn't overflow
                    let delta = -ev.delta_y().abs() * SPREAD;
                    const SPREAD: f64 = 0.5;
                    let e_pow = std::f64::consts::E.powf(delta);
                    let sigmoid = (1.0 - e_pow) / (1.0 + e_pow);
                    const MAX_DEV: f64 = 0.1;
                    let factor = if need_to_flip {
                        1.0 - sigmoid * MAX_DEV
                    } else {
                        1.0 + sigmoid * MAX_DEV
                    };
                    self.set_zoom(self.zoom_factor * factor, true);
                    self.window.scroll_loss = PrecisePosition::default();
                    true
                } else {
                    ev.prevent_default();
                    let delta = PrecisePosition {
                        x: ev.delta_x(),
                        y: ev.delta_y(),
                    };
                    self.window.scroll_by(delta, None);
                    false
                }
            }
            Msg::Scroll(_) => {
                self.window.read_scroll_position();
                false
            }
            Msg::MouseDown(ev) => {
                let pos = PagePosition::from(&ev);
                self.drag_start = Some((pos, pos, false));
                false
            }
            Msg::MouseMove(ev) => {
                if ev.buttons() != 1 {
                    self.drag_start = None;
                } else if let Some((start, last, drag)) = &mut self.drag_start {
                    let pos = PagePosition::from(&ev);
                    if (start.x - pos.x).abs() > 5 || (start.y - pos.y).abs() > 5 {
                        *drag = true;
                        let last_last = *last;
                        *last = pos;
                        if !ev.shift_key() {
                            let delta = PrecisePosition {
                                x: (last_last.x - last.x) as f64,
                                y: (last_last.y - last.y) as f64,
                            };
                            self.window.scroll_by(delta, None);
                        }
                    }
                }
                false
            }
            Msg::MouseUp(_) => {
                if let Some((_, _, drag)) = self.drag_start.take() {
                    if !drag {
                        ctx.props().deselect_all.emit(());
                    }
                }
                false
            }
            Msg::Resize(_resizes) => {
                self.window.read_window_dimensions();
                self.window.read_scroll_position();
                // If we are not doing the initial resize where all the dims are setup
                // if !resizes.is_empty() { do_scrolling_here_if_necessary }
                false
            }
            Msg::KeyDown(ev) => {
                if ctx.link().get_state().unwrap().state.overlay_visible {
                    return false;
                }

                let key = ev.key();
                let plain = !ev.meta_key() && !ev.ctrl_key() && !ev.shift_key() && !ev.alt_key();
                match key.as_str() {
                    "a" if ev.meta_key() => {
                        ev.prevent_default();
                        ctx.props().select_all.emit(());
                        false
                    }
                    "f" if plain => {
                        ctx.link().send_message(Msg::FocusSelection);
                        false
                    }
                    "Escape" if plain => {
                        ctx.props().deselect_all.emit(());
                        false
                    }
                    "w" | "a" | "s" | "d" | "q" | "e" if plain => {
                        let (held, _, released) = self
                            .held_keys
                            .entry(key)
                            .or_insert_with(|| (Instant::now(), 0.0, None));
                        if let Some(released) = released.take() {
                            *held += released.elapsed();
                        }
                        self.timeout.get_or_insert_with(|| {
                            let hold = ctx.link().callback(Msg::KeyHold);
                            Interval::new(10, move || hold.emit(()))
                        });
                        false
                    }
                    _ => false,
                }
            }
            Msg::KeyUp(ev) => {
                let key = ev.key();
                if let Some((_, _, released)) = self.held_keys.get_mut(&key) {
                    released.get_or_insert_with(Instant::now);
                }
                false
            }
            Msg::KeyHold(()) => {
                if ctx.link().get_state().unwrap().state.overlay_visible {
                    return false;
                }

                let mut delta = PrecisePosition::default();
                let mut dz = 0.0;
                self.held_keys.retain(|key, (time, moved, released)| {
                    let held_for = released
                        .map(|released| released - *time)
                        .unwrap_or_else(|| time.elapsed());
                    let held_for = held_for.as_secs_f64();
                    let move_by = 2000.0
                        * (if held_for <= 1.0 {
                            held_for
                        } else {
                            held_for.powf(2.0)
                        });
                    debug_assert!(move_by >= *moved);
                    let move_delta = move_by - *moved;
                    *moved = move_by;
                    match key.as_str() {
                        "w" => delta.y -= move_delta,
                        "a" => delta.x -= move_delta,
                        "s" => delta.y += move_delta,
                        "d" => delta.x += move_delta,
                        "q" => dz -= move_delta,
                        "e" => dz += move_delta,
                        _ => (),
                    };
                    released.is_none()
                });
                self.window.scroll_by(delta, None);
                self.set_zoom(self.zoom_factor * 2.0_f64.powf(dz / 400.0), false);
                if self.held_keys.is_empty() {
                    self.timeout.take();
                }
                dz != 0.0
            }
            Msg::FocusSelection => {
                let msg = Msg::ScrollZoomSelection(
                    ctx.props().selected_nodes.clone(),
                    ctx.props().selected_edges.clone(),
                );
                ctx.link().send_message(msg);
                false
            }
            Msg::ScrollZoomSelection(selected_nodes, selected_edges) => {
                let Some((min, max)) = get_bounding_rect(&selected_nodes, &selected_edges) else {
                    return false;
                };
                // Zoom to fit the selected nodes
                let scale_x = self.window.window_dims.x / (max.x - min.x);
                let scale_y = self.window.window_dims.y / (max.y - min.y);
                let zoom_factor = self.zoom_factor * scale_x.min(scale_y);
                self.set_zoom(zoom_factor.min(1.0), false);
                // Call `Msg::ScrollSelection` in 10ms
                let link = ctx.link().clone();
                Timeout::new(10, move || {
                    link.send_message(Msg::ScrollSelection(selected_nodes, selected_edges))
                })
                .forget();
                true
            }
            Msg::ScrollSelection(selected_nodes, selected_edges) => {
                let Some((min, max)) = get_bounding_rect(&selected_nodes, &selected_edges) else {
                    return false;
                };
                let to_center = self.window.window_position + self.window.window_dims / 2.0;
                let delta = (min - to_center) / 2.0 + (max - to_center) / 2.0;
                // Scroll to the center of the selected nodes
                self.window.scroll_loss = PrecisePosition::default();
                self.window.scroll_by(delta, None);
                false
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let input = NodeRef::default();
        let set_value = {
            move |input_event: Event| {
                let target: HtmlInputElement = input_event
                    .target()
                    .unwrap_throw()
                    .dyn_into()
                    .unwrap_throw();
                match target.value().to_string().parse::<f64>() {
                    Ok(value) => Msg::SetValueTo(value),
                    Err(_) => Msg::SetValueTo(1.0),
                }
            }
        };
        let link = ctx.link().clone();
        let input_ref = input.clone();
        let set_value_on_enter = Callback::from(move |key_event: KeyboardEvent| {
            if key_event.key() == "Enter" {
                let target = input_ref.cast::<HtmlInputElement>().unwrap_throw();
                let msg = match target.value().parse::<f64>() {
                    Ok(value) => Msg::SetValueTo(value),
                    Err(_) => Msg::SetValueTo(1.0),
                };
                link.send_message(msg);
            }
        });
        let set_value_on_blur = ctx.link().callback(move |blur_event: FocusEvent| {
            let event: Event = blur_event.clone().into();
            set_value(event)
        });
        let onwheel = ctx.link().callback(Msg::Wheel);
        let onscroll = ctx.link().callback(Msg::Scroll);
        let zoom_factor = format!("{:.3}", self.zoom_factor);
        let idx = zoom_factor
            .chars()
            .rev()
            .position(|c| c != '0' && c != '.')
            .unwrap_or(zoom_factor.len() - 1);
        let zoom_factor = zoom_factor[0..zoom_factor.len() - idx].to_string();
        let set_scroll = ctx.link().callback(Msg::SetScrollTo);
        html! {
        <div ref={&self.window.scroll_window} style="height: 100%; overflow: auto; overscroll-behavior-x: none;" {onwheel} {onscroll}>
            <div style="position: absolute; bottom: 0; left: 0; z-index: 1;">
                <label for="input">{"Zoom factor: "}</label>
                <input ref={input} onkeypress={set_value_on_enter} onblur={set_value_on_blur} id="input" size="5" value={zoom_factor}/>
            </div>
            <Graph
                rendered={ctx.props().rendered.clone()}
                update_selected_nodes={&ctx.props().update_selected_nodes}
                update_selected_edges={&ctx.props().update_selected_edges}
                zoom_factor={self.zoom_factor}
                zoom_factor_delta={self.zoom_factor_delta}
                zoom_with_mouse={self.zoom_with_mouse}
                selected_nodes={ctx.props().selected_nodes.clone()}
                selected_edges={ctx.props().selected_edges.clone()}
                scroll_position={self.window.graph_position}
                set_scroll={set_scroll}
                scroll_window={self.window.scroll_window.clone()}
            ><Svg svg={self.graph.clone()}/></Graph>
        </div>
        }
    }

    fn rendered(&mut self, ctx: &Context<Self>, first_render: bool) {
        if first_render {
            let mouse_down = ctx.link().callback(Msg::MouseDown);
            let mouse_down: Closure<dyn Fn(MouseEvent)> =
                Closure::new(move |ev| mouse_down.emit(ev));
            // attach event listener to node
            let div = self.window.scroll_window.cast::<Element>().unwrap_throw();
            div.add_event_listener_with_callback("mousedown", mouse_down.as_ref().unchecked_ref())
                .unwrap_throw();
            self.mouse_closures = Some(mouse_down);

            // Resize observer
            let resize_closure = ctx.link().callback(Msg::Resize);
            resize_closure.emit(Vec::new());
            let resize_closure =
                Closure::new(move |entries: Vec<ResizeObserverEntry>| resize_closure.emit(entries));
            let observer =
                ResizeObserver::new(resize_closure.as_ref().unchecked_ref()).unwrap_throw();
            observer.observe(&div);
            self.resize_observer = Some((observer, resize_closure));
        }
    }

    fn destroy(&mut self, _ctx: &Context<Self>) {
        if let Some(mouse_down) = self.mouse_closures.take() {
            let div = self.window.scroll_window.cast::<Element>().unwrap_throw();
            div.remove_event_listener_with_callback(
                "mousedown",
                mouse_down.as_ref().unchecked_ref(),
            )
            .unwrap();
        }
        if let Some((observer, _closure)) = self.resize_observer.take() {
            observer.disconnect();
        }
    }
}

fn get_bounding_rect(
    nodes: &[RawNodeIndex],
    edges: &[VisibleEdgeIndex],
) -> Option<(PrecisePosition, PrecisePosition)> {
    let document = gloo::utils::document();
    let nodes = nodes
        .iter()
        .flat_map(|n| document.get_element_by_id(&format!("node_{}", n.0.index())))
        .map(|n| n.get_bounding_client_rect());
    let edges = edges
        .iter()
        .flat_map(|e| document.get_element_by_id(&format!("edge_{}", e.0.index())))
        .map(|e| e.get_bounding_client_rect());
    let all_selected: Vec<_> = nodes.chain(edges).collect();
    if all_selected.is_empty() {
        return None;
    }
    let min_x = all_selected
        .iter()
        .map(|r| r.left())
        .min_by(f64::total_cmp)
        .unwrap();
    let min_y = all_selected
        .iter()
        .map(|r| r.top())
        .min_by(f64::total_cmp)
        .unwrap();
    let min = PrecisePosition { x: min_x, y: min_y };
    let max_x = all_selected
        .iter()
        .map(|r| r.right())
        .max_by(f64::total_cmp)
        .unwrap();
    let max_y = all_selected
        .iter()
        .map(|r| r.bottom())
        .max_by(f64::total_cmp)
        .unwrap();
    let max = PrecisePosition { x: max_x, y: max_y };
    Some((min, max))
}
