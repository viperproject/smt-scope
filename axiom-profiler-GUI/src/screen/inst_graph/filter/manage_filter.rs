use gloo::timers::callback::Timeout;
use material_yew::icon::MatIcon;
use smt_log_parser::items::QuantIdx;
use web_sys::{Element, HtmlElement, HtmlInputElement};
use yew::{
    function_component, html, Callback, Children, Component, Context, Html, NodeRef, Properties,
};

use crate::{mouse_position, screen::file::RcAnalysis, PREVENT_DEFAULT_DRAG_OVER};

use super::Filter;

pub enum Msg {
    OnDragStart(usize),
    OnDrag,
    OnDragEnd,
    MouseMove(usize),
    MouseLeave(usize),
}

pub struct DraggableList {
    drag: Option<DragState>,
    hover: Option<usize>,
    display: Vec<NodeRef>,
    delete_node: NodeRef,
}

#[derive(Debug, Clone, Copy)]
pub struct DragState {
    pub start_idx: usize,
    pub idx: usize,
    pub delete: bool,
}

impl DraggableList {
    pub fn hover(&self) -> Option<usize> {
        self.hover.filter(|_| self.drag.is_none())
    }

    pub fn find_drag_idx(&self, mouse_y: f64) -> usize {
        for (idx, display) in self.display.iter().enumerate() {
            let Some(node) = display.cast::<HtmlElement>() else {
                continue;
            };
            let rect = node.get_bounding_client_rect();
            if mouse_y <= rect.bottom() {
                return idx;
            }
        }
        self.display.len() - 1
    }

    pub fn drag_offset(&self, idx: usize) -> usize {
        self.drag.map_or(idx, |d| {
            if idx == d.idx {
                d.start_idx
            } else if d.idx < idx && idx <= d.start_idx {
                idx - 1
            } else if d.start_idx <= idx && idx < d.idx {
                idx + 1
            } else {
                idx
            }
        })
    }

    pub fn mouse_within(&self, idx: usize) -> bool {
        let pos = *mouse_position().read().unwrap();
        let Some(node) = self.display[idx].cast::<HtmlElement>() else {
            return false;
        };
        let rect = node.get_bounding_client_rect();
        rect.left() <= pos.x as f64
            && pos.x as f64 <= rect.right()
            && rect.top() <= pos.y as f64
            && pos.y as f64 <= rect.bottom()
    }
}

#[derive(Properties, PartialEq)]
pub struct DraggableListProps {
    pub classes: Vec<Option<&'static str>>,
    pub no_drag: Option<usize>,
    pub drag: Callback<Option<DragState>>,
    pub children: Children,
}

impl Component for DraggableList {
    type Message = Msg;
    type Properties = DraggableListProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            drag: None,
            hover: None,
            display: (0..ctx.props().children.len())
                .map(|_| NodeRef::default())
                .collect(),
            delete_node: NodeRef::default(),
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        if ctx.props().children.len() != old_props.children.len() {
            self.display
                .resize_with(ctx.props().children.len(), NodeRef::default);
        }
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::OnDragStart(idx) => {
                self.drag = Some(DragState {
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
                let Some(mut drag) = self.drag else {
                    return false;
                };
                let pos = *mouse_position().read().unwrap();
                let mouse_y = pos.y as f64;
                let new_idx = self.find_drag_idx(mouse_y);
                let mut changed = drag.idx != new_idx;
                drag.idx = new_idx;

                // Delete
                let mut new_delete = false;
                if drag.idx == 0 {
                    let header = self.delete_node.cast::<Element>();
                    if let Some(header_ref) = header {
                        let rect = header_ref.get_bounding_client_rect();
                        new_delete = rect.left() <= pos.x as f64
                            && pos.x as f64 <= rect.right()
                            && rect.top() <= pos.y as f64
                            && pos.y as f64 <= rect.bottom();
                    }
                }
                changed |= drag.delete != new_delete;
                drag.delete = new_delete;
                self.drag = Some(drag);

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
        let mut children: Vec<_> = ctx.props().children.iter().map(Some).collect();
        let display = (0..children.len()).map(|idx| {
            let child_idx = self.drag_offset(idx);
            let node = children[child_idx].take().unwrap();

            let external_class = self.drag.is_none().then(|| ctx.props().classes.get(idx).copied().flatten()).flatten();

            let draggable = !ctx.props().no_drag.is_some_and(|no_drag| no_drag == idx);
            let placeholder = NodeRef::default();
            let mut class = vec!["no-hover"];
            if self.drag.is_some_and(|d| d.idx == idx) {
                class.push("drag");
            } else if self.hover().is_some_and(|hover| hover == idx) {
                class.push("hover");
            };
            class.extend(external_class);
            let class = class.join(" ");

            let node_ref = self.display[idx].clone();
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
                link.send_message(Msg::OnDragStart(idx))
            });
            let ondrag = ctx.link().callback(|_| Msg::OnDrag);
            let ondragend = ctx.link().callback(|_| Msg::OnDragEnd);
            let onmousemove = ctx.link().callback(move |_| Msg::MouseMove(idx));
            let onmouseleave = ctx.link().callback(move |_| Msg::MouseLeave(idx));
            let placeholder = if draggable {
                html! {<div ref={placeholder} class={"placeholder"}>{node.clone()}</div>}
            } else {
                html! {}
            };
            html!{
                <li draggable={draggable.to_string()} ref={&self.display[idx]} {class} {ondragstart} {ondrag} {ondragend} {onmousemove} {onmouseleave}>
                    {node}
                    {placeholder}
                </li>}
        });
        let class = match self.drag {
            Some(DragState { delete: true, .. }) => "delete will-delete",
            Some(_) => "delete",
            None => "delete display-none",
        };
        html! {<>
            <li ref={&self.delete_node} class={class}><a draggable="false">
                <div class="material-icons"><MatIcon>{"delete"}</MatIcon></div>
                {"Delete"}
            </a></li>
            {for display}
        </>}
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
    pub analysis: RcAnalysis,
}

#[function_component]
pub fn ExistingFilter(props: &ExistingFilterProps) -> Html {
    let graph = props.analysis.borrow();
    let fc = |i| *graph.graph.raw[i].kind();
    let icon = props.filter.icon();
    let hover = props.filter.long_text(fc, true);
    let filter_text = props.filter.short_text(fc);
    let onclick = (!props.editing).then(|| props.onclick.clone());
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
        <a href="#" draggable="false" title={hover} {onclick}>
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
