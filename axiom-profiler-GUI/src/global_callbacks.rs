use std::{ops::Deref, rc::Rc, sync::Mutex};
use wasm_bindgen::{closure::Closure, JsCast};
use yew::{
    html::Scope,
    prelude::{Context, Html},
    Callback, Children, Component, ContextProvider, DragEvent, Event, KeyboardEvent, MouseEvent,
    Properties,
};

// Public interface

pub trait GlobalCallbacksContext {
    fn get_callbacks_registerer(&self) -> Option<Rc<GlobalCallbacks>>;
}
impl<T: Component> GlobalCallbacksContext for Scope<T> {
    fn get_callbacks_registerer(&self) -> Option<Rc<GlobalCallbacks>> {
        self.context(Callback::noop()).map(|c| c.0)
    }
}

pub struct GlobalCallbacks {
    pub register_mouse_move: CallbackRegisterer<MouseEvent>,
    pub register_mouse_up: CallbackRegisterer<MouseEvent>,
    pub register_mouse_out: CallbackRegisterer<MouseEvent>,
    pub register_keyboard_down: CallbackRegisterer<KeyboardEvent>,
    pub register_keyboard_up: CallbackRegisterer<KeyboardEvent>,
    pub register_drag_over: CallbackRegisterer<DragEvent>,
    pub register_drag_enter: CallbackRegisterer<DragEvent>,
    pub register_drag_leave: CallbackRegisterer<DragEvent>,
    pub register_drop: CallbackRegisterer<DragEvent>,
    pub register_resize: CallbackRegisterer<Event>,
}
impl PartialEq for GlobalCallbacks {
    fn eq(&self, _: &Self) -> bool {
        true
    }
}

pub struct CallbackRegisterer<T: 'static>(Box<dyn Fn(Callback<T>) -> CallbackRef>);
impl<T> Deref for CallbackRegisterer<T> {
    type Target = Box<dyn Fn(Callback<T>) -> CallbackRef>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Drop for CallbackRef {
    fn drop(&mut self) {
        self.0();
    }
}
pub struct CallbackRef(Box<dyn Fn()>);

pub struct GlobalCallbacksProvider {
    mouse_move: CallbackHolder<MouseEvent>,
    mouse_up: CallbackHolder<MouseEvent>,
    mouse_out: CallbackHolder<MouseEvent>,
    keyboard_down: CallbackHolder<KeyboardEvent>,
    keyboard_up: CallbackHolder<KeyboardEvent>,
    drag_over: CallbackHolder<DragEvent>,
    drag_enter: CallbackHolder<DragEvent>,
    drag_leave: CallbackHolder<DragEvent>,
    drop: CallbackHolder<DragEvent>,
    resize: CallbackHolder<Event>,

    registerer: Rc<GlobalCallbacks>,
    onresize: Option<Closure<dyn Fn(Event)>>,
    onkeydown: Option<Closure<dyn Fn(KeyboardEvent)>>,
    onkeyup: Option<Closure<dyn Fn(KeyboardEvent)>>,
}

#[derive(Properties, PartialEq)]
pub struct GlobalCallbacksProviderProps {
    pub children: Children,
}

// Private

impl CallbackRegisterer<Event> {
    fn new(link: Scope<GlobalCallbacksProvider>, kind: EventKind) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Box::new(move |callback| {
            let mut id = id.lock().unwrap();
            let id_v = *id;
            *id += 1;
            drop(id);
            link.send_message(Msg::Register(kind, id_v, callback));
            let link = link.clone();
            CallbackRef(Box::new(move || {
                link.send_message(Msg::DeRegister(kind, id_v))
            }))
        }))
    }
}
impl CallbackRegisterer<MouseEvent> {
    fn new_mouse(link: Scope<GlobalCallbacksProvider>, kind: MouseEventKind) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Box::new(move |callback| {
            let mut id = id.lock().unwrap();
            let id_v = *id;
            *id += 1;
            drop(id);
            link.send_message(Msg::RegisterMouse(kind, id_v, callback));
            let link = link.clone();
            CallbackRef(Box::new(move || {
                link.send_message(Msg::DeRegisterMouse(kind, id_v))
            }))
        }))
    }
}
impl CallbackRegisterer<KeyboardEvent> {
    fn new_keyboard(link: Scope<GlobalCallbacksProvider>, kind: KeyboardEventKind) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Box::new(move |callback| {
            let mut id = id.lock().unwrap();
            let id_v = *id;
            *id += 1;
            drop(id);
            link.send_message(Msg::RegisterKeyboard(kind, id_v, callback));
            let link = link.clone();
            CallbackRef(Box::new(move || {
                link.send_message(Msg::DeRegisterKeyboard(kind, id_v))
            }))
        }))
    }
}
impl CallbackRegisterer<DragEvent> {
    fn new_drag(link: Scope<GlobalCallbacksProvider>, kind: DragEventKind) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Box::new(move |callback| {
            let mut id = id.lock().unwrap();
            let id_v = *id;
            *id += 1;
            drop(id);
            link.send_message(Msg::RegisterDrag(kind, id_v, callback));
            let link = link.clone();
            CallbackRef(Box::new(move || {
                link.send_message(Msg::DeRegisterDrag(kind, id_v))
            }))
        }))
    }
}

impl GlobalCallbacksProvider {
    fn get_mouse_mut(&mut self, kind: MouseEventKind) -> &mut CallbackHolder<MouseEvent> {
        match kind {
            MouseEventKind::Move => &mut self.mouse_move,
            MouseEventKind::Up => &mut self.mouse_up,
            MouseEventKind::Out => &mut self.mouse_out,
        }
    }
    fn get_keyboard_mut(&mut self, kind: KeyboardEventKind) -> &mut CallbackHolder<KeyboardEvent> {
        match kind {
            KeyboardEventKind::Down => &mut self.keyboard_down,
            KeyboardEventKind::Up => &mut self.keyboard_up,
        }
    }
    fn get_drag_mut(&mut self, kind: DragEventKind) -> &mut CallbackHolder<DragEvent> {
        match kind {
            DragEventKind::DragOver => &mut self.drag_over,
            DragEventKind::DragEnter => &mut self.drag_enter,
            DragEventKind::DragLeave => &mut self.drag_leave,
            DragEventKind::Drop => &mut self.drop,
        }
    }
    fn get_mut(&mut self, kind: EventKind) -> &mut CallbackHolder<Event> {
        match kind {
            EventKind::Resize => &mut self.resize,
        }
    }
}

#[derive(Debug, Copy, Clone)]
pub enum MouseEventKind {
    Move,
    Up,
    Out,
}

#[derive(Debug, Copy, Clone)]
pub enum KeyboardEventKind {
    Down,
    Up,
}

#[derive(Debug, Copy, Clone)]
pub enum DragEventKind {
    DragOver,
    DragEnter,
    DragLeave,
    Drop,
}

#[derive(Debug, Copy, Clone)]
pub enum EventKind {
    Resize,
}

pub enum Msg {
    RegisterMouse(MouseEventKind, usize, Callback<MouseEvent>),
    DeRegisterMouse(MouseEventKind, usize),
    OnMouse(MouseEventKind, MouseEvent),

    RegisterKeyboard(KeyboardEventKind, usize, Callback<KeyboardEvent>),
    DeRegisterKeyboard(KeyboardEventKind, usize),
    OnKeyboard(KeyboardEventKind, KeyboardEvent),

    RegisterDrag(DragEventKind, usize, Callback<DragEvent>),
    DeRegisterDrag(DragEventKind, usize),
    OnDrag(DragEventKind, DragEvent),

    Register(EventKind, usize, Callback<Event>),
    DeRegister(EventKind, usize),
    On(EventKind, Event),
}

struct CallbackHolder<T>(Vec<(usize, Callback<T>)>);
impl<T> Default for CallbackHolder<T> {
    fn default() -> Self {
        Self(Vec::default())
    }
}

impl Component for GlobalCallbacksProvider {
    type Message = Msg;
    type Properties = GlobalCallbacksProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let registerer = GlobalCallbacks {
            register_mouse_move: CallbackRegisterer::new_mouse(
                ctx.link().clone(),
                MouseEventKind::Move,
            ),
            register_mouse_up: CallbackRegisterer::new_mouse(
                ctx.link().clone(),
                MouseEventKind::Up,
            ),
            register_mouse_out: CallbackRegisterer::new_mouse(
                ctx.link().clone(),
                MouseEventKind::Out,
            ),
            register_keyboard_down: CallbackRegisterer::new_keyboard(
                ctx.link().clone(),
                KeyboardEventKind::Down,
            ),
            register_keyboard_up: CallbackRegisterer::new_keyboard(
                ctx.link().clone(),
                KeyboardEventKind::Up,
            ),
            register_drag_over: CallbackRegisterer::new_drag(
                ctx.link().clone(),
                DragEventKind::DragOver,
            ),
            register_drag_enter: CallbackRegisterer::new_drag(
                ctx.link().clone(),
                DragEventKind::DragEnter,
            ),
            register_drag_leave: CallbackRegisterer::new_drag(
                ctx.link().clone(),
                DragEventKind::DragLeave,
            ),
            register_drop: CallbackRegisterer::new_drag(ctx.link().clone(), DragEventKind::Drop),
            register_resize: CallbackRegisterer::new(ctx.link().clone(), EventKind::Resize),
        };
        Self {
            mouse_move: CallbackHolder::default(),
            mouse_up: CallbackHolder::default(),
            mouse_out: CallbackHolder::default(),
            keyboard_down: CallbackHolder::default(),
            keyboard_up: CallbackHolder::default(),
            drag_over: CallbackHolder::default(),
            drag_enter: CallbackHolder::default(),
            drag_leave: CallbackHolder::default(),
            drop: CallbackHolder::default(),
            resize: CallbackHolder::default(),

            registerer: Rc::new(registerer),
            onresize: None,
            onkeydown: None,
            onkeyup: None,
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::RegisterMouse(kind, id, cb) => self.get_mouse_mut(kind).0.push((id, cb)),
            Msg::DeRegisterMouse(kind, id) => {
                let cbh = self.get_mouse_mut(kind);
                let idx = cbh.0.iter().position(|(i, _)| *i == id).unwrap();
                cbh.0.swap_remove(idx);
            }
            Msg::OnMouse(kind, ev) => {
                for (_, cb) in &self.get_mouse_mut(kind).0 {
                    cb.emit(ev.clone());
                }
            }
            Msg::RegisterKeyboard(kind, id, cb) => self.get_keyboard_mut(kind).0.push((id, cb)),
            Msg::DeRegisterKeyboard(kind, id) => {
                let cbh = self.get_keyboard_mut(kind);
                let idx = cbh.0.iter().position(|(i, _)| *i == id).unwrap();
                cbh.0.swap_remove(idx);
            }
            Msg::OnKeyboard(kind, ev) => {
                for (_, cb) in &self.get_keyboard_mut(kind).0 {
                    cb.emit(ev.clone());
                }
            }
            Msg::RegisterDrag(kind, id, cb) => self.get_drag_mut(kind).0.push((id, cb)),
            Msg::DeRegisterDrag(kind, id) => {
                let cbh = self.get_drag_mut(kind);
                let idx = cbh.0.iter().position(|(i, _)| *i == id).unwrap();
                cbh.0.swap_remove(idx);
            }
            Msg::OnDrag(kind, ev) => {
                for (_, cb) in &self.get_drag_mut(kind).0 {
                    cb.emit(ev.clone());
                }
            }
            Msg::Register(kind, id, cb) => self.get_mut(kind).0.push((id, cb)),
            Msg::DeRegister(kind, id) => {
                let cbh = self.get_mut(kind);
                let idx = cbh.0.iter().position(|(i, _)| *i == id).unwrap();
                cbh.0.swap_remove(idx);
            }
            Msg::On(kind, ev) => {
                for (_, cb) in &self.get_mut(kind).0 {
                    cb.emit(ev.clone());
                }
            }
        }
        false
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let onmousemove = ctx
            .link()
            .callback(|ev: MouseEvent| Msg::OnMouse(MouseEventKind::Move, ev));
        let onmouseup = ctx
            .link()
            .callback(|ev: MouseEvent| Msg::OnMouse(MouseEventKind::Up, ev));
        let onmouseout = ctx
            .link()
            .callback(|ev: MouseEvent| Msg::OnMouse(MouseEventKind::Out, ev));
        let ondragover = ctx
            .link()
            .callback(|ev: DragEvent| Msg::OnDrag(DragEventKind::DragOver, ev));
        let ondragenter = ctx
            .link()
            .callback(|ev: DragEvent| Msg::OnDrag(DragEventKind::DragEnter, ev));
        let ondragleave = ctx
            .link()
            .callback(|ev: DragEvent| Msg::OnDrag(DragEventKind::DragLeave, ev));
        let ondrop = ctx
            .link()
            .callback(|ev: DragEvent| Msg::OnDrag(DragEventKind::Drop, ev));
        yew::html! {
            <div id="body" style="position=absolute; top: 0; left: 0; width: 100%; height: 100%" {onmousemove} {onmouseup} {onmouseout} {ondragover} {ondragenter} {ondragleave} {ondrop}>
                <ContextProvider<Rc<GlobalCallbacks>> context={self.registerer.clone()}>
                    {for ctx.props().children.iter()}
                </ContextProvider<Rc<GlobalCallbacks>>>
            </div>
        }
    }

    fn rendered(&mut self, ctx: &Context<Self>, first_render: bool) {
        if first_render {
            let window = web_sys::window().unwrap();

            let link = ctx.link().clone();
            let onresize: Closure<dyn Fn(Event)> =
                Closure::new(move |ev: Event| link.send_message(Msg::On(EventKind::Resize, ev)));
            window
                .add_event_listener_with_callback("resize", onresize.as_ref().unchecked_ref())
                .unwrap();
            self.onresize = Some(onresize);

            let link = ctx.link().clone();
            let onkeydown: Closure<dyn Fn(KeyboardEvent)> =
                Closure::new(move |ev: KeyboardEvent| {
                    link.send_message(Msg::OnKeyboard(KeyboardEventKind::Down, ev))
                });
            window
                .add_event_listener_with_callback("keydown", onkeydown.as_ref().unchecked_ref())
                .unwrap();
            self.onkeydown = Some(onkeydown);

            let link = ctx.link().clone();
            let onkeyup: Closure<dyn Fn(KeyboardEvent)> = Closure::new(move |ev: KeyboardEvent| {
                link.send_message(Msg::OnKeyboard(KeyboardEventKind::Up, ev))
            });
            window
                .add_event_listener_with_callback("keyup", onkeyup.as_ref().unchecked_ref())
                .unwrap();
            self.onkeyup = Some(onkeyup);
        }
    }
    fn destroy(&mut self, _ctx: &Context<Self>) {
        if let Some(onresize) = self.onresize.take() {
            let window = web_sys::window().unwrap();
            window
                .remove_event_listener_with_callback("resize", onresize.as_ref().unchecked_ref())
                .unwrap();
        }
        if let Some(onkeydown) = self.onkeydown.take() {
            let window = web_sys::window().unwrap();
            window
                .remove_event_listener_with_callback("keydown", onkeydown.as_ref().unchecked_ref())
                .unwrap();
        }
        if let Some(onkeyup) = self.onkeyup.take() {
            let window = web_sys::window().unwrap();
            window
                .remove_event_listener_with_callback("keyup", onkeyup.as_ref().unchecked_ref())
                .unwrap();
        }
    }
}
