use wasm_bindgen::JsCast;
use yew::{
    html, Callback, Children, Component, Context, ContextProvider, KeyboardEvent, MouseEvent,
    NodeRef, Properties,
};

use crate::{CallbackRef, GlobalCallbacksContext};

pub type DropdownIdx = u32;

#[derive(Clone, PartialEq)]
pub struct DropdownCtxt {
    pub enabled: bool,
    pub toggle: Callback<Option<bool>>,

    pub last_hovered: Option<DropdownIdx>,
    pub set_dropdown: Callback<DropdownIdx>,
}

pub trait DropdownContext {
    fn get_toggle(&self) -> Option<Callback<Option<bool>>>;
}
impl<T: Component> DropdownContext for html::Scope<T> {
    fn get_toggle(&self) -> Option<Callback<Option<bool>>> {
        self.context(Callback::noop())
            .map(|(c, _): (DropdownCtxt, _)| c.toggle)
    }
}

pub enum DropdownMsg {
    Toggle(Option<bool>),
    Set(DropdownIdx),
    MouseDownGlobal(MouseEvent),
    KeyDownGlobal(KeyboardEvent),
}

#[derive(Properties, Clone, PartialEq)]
pub struct DropdownProps {
    pub children: Children,
    pub container_ref: Option<NodeRef>,
}

pub struct DropdownContainer {
    context: DropdownCtxt,
    container_ref: NodeRef,
    _callback_refs: Option<[CallbackRef; 2]>,
}

impl DropdownContainer {
    pub fn enable(&mut self, ctx: &Context<Self>) -> bool {
        if self.context.enabled {
            return false;
        }
        self.context.enabled = true;
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mousedown =
            (registerer.register_mouse_down)(ctx.link().callback(DropdownMsg::MouseDownGlobal));
        let keydown =
            (registerer.register_keyboard_down)(ctx.link().callback(DropdownMsg::KeyDownGlobal));
        self._callback_refs = Some([mousedown, keydown]);
        true
    }

    pub fn disable(&mut self) -> bool {
        if !self.context.enabled {
            return false;
        }
        self.context.enabled = false;
        self._callback_refs = None;
        true
    }
}

impl Component for DropdownContainer {
    type Message = DropdownMsg;

    type Properties = DropdownProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            context: DropdownCtxt {
                enabled: false,
                last_hovered: None,
                toggle: ctx.link().callback(DropdownMsg::Toggle),
                set_dropdown: ctx.link().callback(DropdownMsg::Set),
            },
            container_ref: ctx.props().container_ref.clone().unwrap_or_default(),
            _callback_refs: None,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            DropdownMsg::Toggle(set) => match set {
                Some(true) => self.enable(ctx),
                Some(false) => self.disable(),
                None if self.context.enabled => self.disable(),
                None => self.enable(ctx),
            },
            DropdownMsg::Set(tgt) => {
                self.context.last_hovered = Some(tgt);
                true
            }
            DropdownMsg::MouseDownGlobal(ev) => {
                if !self.context.enabled {
                    return false;
                }
                let Some(container) = self.container_ref.get() else {
                    return false;
                };
                let Ok(target) = ev.target().map(|t| t.dyn_into()).transpose() else {
                    return false;
                };
                if container.contains(target.as_ref()) {
                    return false;
                };
                self.disable()
            }
            DropdownMsg::KeyDownGlobal(ev) => {
                if !self.context.enabled {
                    return false;
                }
                if ev.key() != "Escape" {
                    return false;
                }
                self.disable()
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> yew::Html {
        let inner = html! {
            <ContextProvider<DropdownCtxt> context={self.context.clone()}>
                {for ctx.props().children.iter()}
            </ContextProvider<DropdownCtxt>>
        };
        if ctx.props().container_ref.is_none() {
            html! {<div ref={self.container_ref.clone()} class="display-contents">{inner}</div>}
        } else {
            inner
        }
    }
}
