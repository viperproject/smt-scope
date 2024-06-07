use std::rc::Rc;

use gloo::timers::callback::Timeout;
use material_yew::icon::MatIcon;
use smt_log_parser::items::QuantIdx;
use web_sys::{Element, HtmlElement, HtmlInputElement};
use yew::{
    function_component, html, use_context, Callback, Children, Component, Context, Html, NodeRef,
    Properties,
};

use crate::{
    mouse_position, results::filters::Filter, state::StateProvider, PREVENT_DEFAULT_DRAG_OVER,
};

pub enum Msg {
    OnDragStart(usize, usize),
    OnDrag,
    OnDragEnd,
    MouseMove(usize),
    MouseLeave(usize),
}

pub struct DraggableList {
    drag: Option<DragState>,
    hover: Option<usize>,
    display: Vec<DisplayElement>,
    hashes: Vec<u64>,
    selected: Option<usize>,
}

#[derive(Debug, Clone, Copy)]
pub struct DragState {
    pub orig_idx: usize,
    pub start_idx: usize,
    pub idx: usize,
    pub delete: bool,
}

struct DisplayElement {
    idx: usize,
    node: Html,
    node_ref: NodeRef,
}

impl DraggableList {
    pub fn hover(&self) -> Option<usize> {
        self.hover.filter(|_| self.drag.is_none())
    }
    pub fn get_pos(&self, idx: usize) -> Option<(f64, f64)> {
        let node = self.display.get(idx)?.node_ref.cast::<HtmlElement>()?;
        let rect = node.get_bounding_client_rect();
        Some((rect.top(), rect.bottom()))
    }
    pub fn mouse_within(&self, idx: usize) -> bool {
        let pos = *mouse_position().read().unwrap();
        let Some(display) = self.display.get(idx) else {
            return false;
        };
        let Some(node) = display.node_ref.cast::<HtmlElement>() else {
            return false;
        };
        let rect = node.get_bounding_client_rect();
        rect.left() <= pos.x as f64
            && pos.x as f64 <= rect.right()
            && rect.top() <= pos.y as f64
            && pos.y as f64 <= rect.bottom()
    }
    pub fn try_incr(&mut self, mouse_y: f64) -> bool {
        let Some(mut drag) = self.drag else {
            return false;
        };
        loop {
            let new_idx = drag.idx + 1;
            if new_idx >= self.display.len() {
                break;
            }
            let Some((pos, _)) = self.get_pos(new_idx) else {
                break;
            };
            // log::info!("Drag event down? {pos:?} vs {pos:?} ({drag:?})");
            if pos <= mouse_y {
                self.display.swap(drag.idx, new_idx);
                drag.idx = new_idx;
            } else {
                break;
            }
        }
        let old = self.drag.replace(drag).unwrap();
        old.idx != drag.idx
    }
    pub fn try_decr(&mut self, mouse_y: f64) -> bool {
        let Some(mut drag) = self.drag else {
            return false;
        };
        loop {
            if drag.idx == 0 {
                break;
            }
            let new_idx = drag.idx - 1;
            let Some((_, pos)) = self.get_pos(new_idx) else {
                break;
            };
            // log::info!("Drag event up? {pos:?} vs {pos:?} ({drag:?})");
            if mouse_y <= pos {
                self.display.swap(new_idx, drag.idx);
                drag.idx = new_idx;
            } else {
                break;
            }
        }
        let old = self.drag.replace(drag).unwrap();
        old.idx != drag.idx
    }
}

#[derive(Properties)]
pub struct DraggableListProps {
    pub hashes: Vec<u64>,
    pub drag: Callback<Option<DragState>>,
    pub will_delete: Callback<bool>,
    pub delete_node: NodeRef,
    pub selected: Option<usize>,
    pub editing: Option<usize>,
    pub children: Children,
}

impl PartialEq for DraggableListProps {
    fn eq(&self, other: &Self) -> bool {
        self.hashes == other.hashes
            && self.selected == other.selected
            && self.editing == other.editing
    }
}

impl Component for DraggableList {
    type Message = Msg;
    type Properties = DraggableListProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            drag: None,
            hover: None,
            display: ctx
                .props()
                .children
                .iter()
                .enumerate()
                .map(|(idx, element)| DisplayElement {
                    idx,
                    node: element.clone(),
                    node_ref: NodeRef::default(),
                })
                .collect(),
            hashes: ctx.props().hashes.clone(),
            selected: ctx.props().selected,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        self.hashes.clone_from(&ctx.props().hashes);
        self.selected = ctx.props().selected;
        self.display = ctx
            .props()
            .children
            .iter()
            .enumerate()
            .map(|(idx, element)| DisplayElement {
                idx,
                node: element.clone(),
                node_ref: NodeRef::default(),
            })
            .collect();
        self.drag = None;
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::OnDragStart(orig_idx, idx) => {
                self.drag = Some(DragState {
                    orig_idx,
                    start_idx: idx,
                    idx,
                    delete: false,
                });
                if let Some(mut pd) = PREVENT_DEFAULT_DRAG_OVER.get().and_then(|p| p.lock().ok()) {
                    *pd = false;
                }
                ctx.props().drag.emit(None);
                true
            }
            Msg::OnDrag => {
                let pos = *mouse_position().read().unwrap();
                let mouse_y = pos.y as f64;
                let mut changed = self.try_decr(mouse_y) || self.try_incr(mouse_y);
                let Some(drag) = &mut self.drag else {
                    return changed;
                };
                // Delete
                let mut new_delete = false;
                if drag.idx == 0 {
                    let header = ctx.props().delete_node.cast::<Element>();
                    if let Some(header_ref) = header {
                        let rect = header_ref.get_bounding_client_rect();
                        new_delete = rect.left() <= pos.x as f64
                            && pos.x as f64 <= rect.right()
                            && rect.top() <= pos.y as f64
                            && pos.y as f64 <= rect.bottom();
                    }
                }
                if drag.delete != new_delete {
                    ctx.props().will_delete.emit(new_delete);
                }
                changed |= drag.delete != new_delete;
                drag.delete = new_delete;

                // Fly-back animation enable or disable
                if let Some(mut pd) = PREVENT_DEFAULT_DRAG_OVER
                    .get()
                    .filter(|_| changed)
                    .and_then(|p| p.lock().ok())
                {
                    *pd = drag.start_idx != drag.idx || drag.delete;
                }
                changed
            }
            Msg::OnDragEnd => {
                if let Some(mut pd) = PREVENT_DEFAULT_DRAG_OVER.get().and_then(|p| p.lock().ok()) {
                    *pd = false;
                }
                let Some(drag) = self.drag.take() else {
                    return false;
                };
                // FIXME: the mouse position is not updated during the "fly-back" animation
                // and thus this may end up being wrong!
                if self.mouse_within(drag.idx) {
                    self.hover = Some(drag.idx);
                } else {
                    self.hover = None;
                }
                ctx.props().drag.emit(Some(drag));
                true
            }
            Msg::MouseMove(idx) => {
                let old = self.hover.replace(idx);
                old != self.hover
            }
            Msg::MouseLeave(idx) => {
                if self.hover.is_some_and(|old| old == idx) {
                    self.hover = None;
                    true
                } else {
                    false
                }
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let display = self.display.iter().enumerate().map(|(curr_idx, display)| {
            let is_selected = ctx.props().selected.is_some_and(|selected| selected == curr_idx);
            let is_editing = ctx.props().editing.is_some_and(|editing| editing == curr_idx);
            let draggable = !is_selected && !is_editing;
            let placeholder = NodeRef::default();
            let class = if self.drag.is_some_and(|d| d.idx == curr_idx) {
                "no-hover drag"
            } else if self.hover().is_some_and(|hover| hover == curr_idx) {
                "no-hover hover"
            } else {
                "no-hover"
            };
            let orig_idx = display.idx;
            let node_ref = display.node_ref.clone();
            let placeholder_ref = placeholder.clone();
            let link = ctx.link().clone();
            let ondragstart = Callback::from(move |e: web_sys::DragEvent| {
                if !draggable {
                    e.prevent_default();
                    return;
                }
                if let Some(dt) = e.data_transfer() {
                    let pos = *mouse_position().read().unwrap();
                    let node = node_ref.cast::<web_sys::Element>().unwrap();
                    let rect = node.get_bounding_client_rect();
                    let (x, y) = (pos.x as f64 - rect.left(), pos.y as f64 - rect.top());
                    dt.set_drag_image(&placeholder_ref.cast::<web_sys::Element>().unwrap(), x as i32, y as i32);
                }
                link.send_message(Msg::OnDragStart(orig_idx, curr_idx))
            });
            let ondrag = ctx.link().callback(|_| Msg::OnDrag);
            let ondragend = ctx.link().callback(|_| Msg::OnDragEnd);
            let onmousemove = ctx.link().callback(move |_| Msg::MouseMove(curr_idx));
            let onmouseleave = ctx.link().callback(move |_| Msg::MouseLeave(curr_idx));
            let placeholder = if draggable {
                html! {<div ref={placeholder} class={"placeholder"}>{display.node.clone()}</div>}
            } else {
                html! {}
            };
            html!{
                <li draggable={draggable.to_string()} ref={&display.node_ref} {class} {ondragstart} {ondrag} {ondragend} {onmousemove} {onmouseleave}>
                    {display.node.clone()}
                    {placeholder}
                </li>}
        });
        html! {
            {for display}
        }
    }
}

#[derive(PartialEq, Properties)]
pub struct ExistingFilterProps {
    pub filter: Filter,
    pub onclick: Callback<()>,
    pub delete: Callback<()>,
    pub edit: Callback<()>,
    pub end_edit: Callback<Filter>,
    pub selected: bool,
    pub editing: bool,
}

#[function_component]
pub fn ExistingFilter(props: &ExistingFilterProps) -> Html {
    let data = use_context::<Rc<StateProvider>>().unwrap();
    let graph = data.state.parser.as_ref().and_then(|p| p.graph.as_ref());
    let fc = |i| graph.as_ref().map(|g| *g.borrow().raw[i].kind()).unwrap();
    let icon = props.filter.icon();
    let hover = props.filter.long_text(fc, true);
    let filter_text = props.filter.short_text(fc);
    let onclick = Some(props.onclick.clone()).filter(|_| !props.editing);
    let onclick = Callback::from(move |e: web_sys::MouseEvent| {
        e.prevent_default();
        if let Some(oc) = onclick.as_ref() {
            oc.emit(())
        }
    });
    let overlay = props.selected.then(|| {
        let edit = props.filter.is_editable().then(|| {
            let edit = props.edit.clone();
            let edit = Callback::from(move |e: web_sys::MouseEvent| {
                e.prevent_default(); e.stop_propagation();
                edit.emit(());
            });
            html! {<a href="#" draggable="false" title={"Edit the parameters of this operation"} class="edit" onclick={edit}>{"Edit"}</a>}
        });
        let delete = props.delete.clone();
        let delete = Callback::from(move |e: web_sys::MouseEvent| {
            e.prevent_default(); e.stop_propagation();
            delete.emit(());
        });
        html! {<div class="overlay" onclick={onclick.clone()}>
            <a href="#" draggable="false" title={"Delete this operation"} class="delete" onclick={delete}>{"Delete"}</a>
            {edit}
            <a href="#" draggable="false" title={"Close this overlay"} class="cancel">{"Cancel"}</a>
        </div>}
    });
    let filter = props.filter.clone();
    let end_edit = props.end_edit.clone();
    let update = Callback::from(move |(v, s)| {
        let new_filter = filter.update(v, s);
        end_edit.emit(new_filter);
    });
    html! {
    <>
        <a href="#" draggable="false" title={hover} onclick={onclick}>
            <div class="material-icons small"><MatIcon>{icon}</MatIcon></div>
            <ExistingFilterText filter={filter_text} editing={props.editing} update={update} />
        </a>
        {overlay}
    </>
    }
}

impl Filter {
    pub fn is_editable(&self) -> bool {
        !matches!(
            self,
            Filter::IgnoreTheorySolving
                | Filter::ShowMatchingLoopSubgraph
                | Filter::IgnoreQuantifier(None)
                | Filter::IgnoreAllButQuantifier(None)
                | Filter::ShowNeighbours(..)
                | Filter::VisitSourceTree(..)
                | Filter::VisitSubTreeWithRoot(..)
                | Filter::ShowLongestPath(..)
        )
    }
    pub fn update(&self, new_data: Vec<usize>, new_strings: Vec<String>) -> Filter {
        match self {
            Filter::MaxNodeIdx(_) => Filter::MaxNodeIdx(new_data[0]),
            Filter::MinNodeIdx(_) => Filter::MinNodeIdx(new_data[0]),
            Filter::IgnoreTheorySolving => Filter::IgnoreTheorySolving,
            Filter::IgnoreQuantifier(_) => {
                Filter::IgnoreQuantifier(Some(QuantIdx::from(new_data[0])))
            }
            Filter::IgnoreAllButQuantifier(_) => {
                Filter::IgnoreAllButQuantifier(Some(QuantIdx::from(new_data[0])))
            }
            Filter::MaxInsts(_) => Filter::MaxInsts(new_data[0]),
            Filter::MaxBranching(_) => Filter::MaxBranching(new_data[0]),
            Filter::ShowNeighbours(old, dir) => Filter::ShowNeighbours(*old, *dir),
            Filter::VisitSourceTree(old, retain) => Filter::VisitSourceTree(*old, *retain),
            Filter::VisitSubTreeWithRoot(old, retain) => {
                Filter::VisitSubTreeWithRoot(*old, *retain)
            }
            Filter::MaxDepth(_) => Filter::MaxDepth(new_data[0]),
            Filter::ShowLongestPath(old) => Filter::ShowLongestPath(*old),
            Filter::ShowNamedQuantifier(_) => Filter::ShowNamedQuantifier(new_strings[0].clone()),
            Filter::SelectNthMatchingLoop(_) => {
                Filter::SelectNthMatchingLoop(new_data[0].max(1) - 1)
            }
            Filter::ShowMatchingLoopSubgraph => Filter::ShowMatchingLoopSubgraph,
            Filter::ShowProofSteps => Filter::ShowProofSteps,
            Filter::IgnoreTrivialProofSteps => Filter::IgnoreTrivialProofSteps,
            Filter::ShowOnlyFalseProofSteps => Filter::ShowOnlyFalseProofSteps,
            Filter::ShowNamedProofStep(_) => Filter::ShowNamedProofStep(new_strings[0].clone()),
        }
    }
}

#[derive(PartialEq, Properties)]
pub struct ExistingFilterTextProps {
    pub filter: String,
    pub editing: bool,
    pub update: Callback<(Vec<usize>, Vec<String>)>,
}

struct ExistingFilterText {
    inputs: Vec<(char, NodeRef)>,
    focus: Option<usize>,
    was_editing: bool,
}

enum FilterTextMsg {
    Focus(usize),
    FocusOut(usize),
    UpdateCheck,
}

impl Component for ExistingFilterText {
    type Message = FilterTextMsg;
    type Properties = ExistingFilterTextProps;

    fn create(ctx: &Context<Self>) -> Self {
        let inputs = ctx
            .props()
            .filter
            .chars()
            .filter(|&c| c == '|' || c == '"' || c == '$')
            .enumerate()
            .filter(|(idx, _)| idx % 2 == 0)
            .map(|(_, c)| (c, NodeRef::default()))
            .collect();
        Self {
            inputs,
            focus: None,
            was_editing: false,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        self.was_editing = old_props.editing;
        if ctx.props().filter == old_props.filter {
            return true;
        }
        *self = Self::create(ctx);
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            FilterTextMsg::Focus(idx) => {
                self.focus = Some(idx);
                true
            }
            FilterTextMsg::FocusOut(idx) => {
                if self.focus == Some(idx) {
                    self.focus = None;
                    let link = ctx.link().clone();
                    Timeout::new(100, move || {
                        link.send_message(FilterTextMsg::UpdateCheck);
                    })
                    .forget();
                }
                false
            }
            FilterTextMsg::UpdateCheck => {
                if self.focus.is_none() {
                    let (s, v): (Vec<_>, Vec<_>) = self.inputs.iter().partition(|(c, _)| *c == '"');
                    let v = v
                        .into_iter()
                        .map(|(_, input)| {
                            // FIXME: this unwrap can sometimes panic, why?
                            let input = input.cast::<HtmlInputElement>().unwrap();
                            input
                                .value()
                                .chars()
                                .filter(|c| c.is_ascii_digit())
                                .collect::<String>()
                                .parse::<usize>()
                                .ok()
                        })
                        .collect::<Option<_>>();
                    if let Some(v) = v {
                        let s = s
                            .into_iter()
                            .map(|(_, input)| {
                                let input = input.cast::<HtmlInputElement>().unwrap();
                                input.value()
                            })
                            .collect();
                        ctx.props().update.emit((v, s));
                    }
                }
                false
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        if ctx.props().editing && self.inputs.is_empty() {
            ctx.link().send_message(FilterTextMsg::UpdateCheck);
        }

        let text = ctx
            .props()
            .filter
            .split(['|', '"', '$'])
            .map(|s| s.replace("Hide ", "H ").replace("Show ", "S "));
        if !ctx.props().editing {
            html! { {for text} }
        } else {
            let text = text.enumerate().map(|(idx, text)| {
                if idx % 2 == 0 {
                    html! {{text}}
                } else {
                    let (c, input) = self.inputs[idx / 2].clone();
                    const INPUT_SHRINK: usize = 0;
                    let typ = if c == '"' { "text" } else { "tel" };
                    let prefix = (c == '$').then(|| text.chars().next().unwrap());
                    let input_ref = input.clone();
                    let oninput = Callback::from(move |_| {
                        let input = input_ref.cast::<HtmlInputElement>().unwrap();
                        if c == '"' {
                            let value = input.value();
                            input.set_size(value.len().max(1) as u32);
                        } else {
                            let value = prefix.into_iter().chain(input.value().chars().filter(|c| c.is_ascii_digit())).collect::<String>();
                            input.set_value(&value);
                            input.set_size((value.len().max(1 + INPUT_SHRINK) - INPUT_SHRINK) as u32);
                        };
                    });
                    let onfocus = ctx.link().callback(move |_| {
                        FilterTextMsg::Focus(idx / 2)
                    });
                    let onblur = ctx.link().callback(move |_| {
                        FilterTextMsg::FocusOut(idx / 2)
                    });
                    let input_ref = input.clone();
                    let onkeypress = Callback::from(move |e: web_sys::KeyboardEvent| {
                        if e.key() == "Enter" {
                            let _ = input_ref.cast::<HtmlInputElement>().unwrap().blur();
                        }
                    });
                    let size; let value;
                    if c == '"' {
                        value = text;
                        size = Some(value.len().max(1).to_string());
                    } else {
                        value = prefix.into_iter().chain(text.chars().filter(|c| c.is_ascii_digit())).collect::<String>();
                        size = Some((value.len().max(1 + INPUT_SHRINK) - INPUT_SHRINK).to_string());
                    };
                    html! {
                        <input ref={input} size={size} type={typ} value={value} oninput={oninput} onfocus={onfocus} onblur={onblur} onkeypress={onkeypress} />
                    }
                }
            });
            html! { {for text} }
        }
    }

    fn rendered(&mut self, ctx: &Context<Self>, _first_render: bool) {
        if !self.was_editing && ctx.props().editing {
            self.was_editing = true;
            if let Some((_, input)) = self.inputs.first() {
                let input = input.cast::<HtmlInputElement>().unwrap();
                let _ = input.focus();
                input.select();
            }
        }
    }
}
