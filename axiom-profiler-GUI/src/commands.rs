use std::{ops::Deref, rc::Rc, sync::Mutex};

use yew::{
    html, html::Scope, Callback, Children, Component, Context, ContextHandle, ContextProvider,
    Html, KeyboardEvent, Properties,
};

use crate::{CallbackRef, GlobalCallbacksContext};

// Public interface

pub trait CommandsContext {
    fn get_commands(
        &self,
        updated: Callback<Rc<Commands>>,
    ) -> Option<(Rc<Commands>, ContextHandle<Rc<Commands>>)>;
    fn get_commands_registerer(&self) -> Option<CommandRegisterer> {
        self.get_commands(Callback::noop())
            .map(|c| c.0.register.clone())
    }
}
impl<T: Component> CommandsContext for Scope<T> {
    fn get_commands(
        &self,
        updated: Callback<Rc<Commands>>,
    ) -> Option<(Rc<Commands>, ContextHandle<Rc<Commands>>)> {
        self.context(updated)
    }
}

#[derive(Clone)]
pub struct CommandRegisterer(Rc<dyn Fn(Command) -> CommandRef>);
impl Deref for CommandRegisterer {
    type Target = dyn Fn(Command) -> CommandRef;
    fn deref(&self) -> &Self::Target {
        &*self.0
    }
}

pub struct CommandRef(Box<dyn Fn()>, Box<dyn Fn(bool)>);
impl Drop for CommandRef {
    fn drop(&mut self) {
        self.0();
    }
}
impl CommandRef {
    pub fn set_disabled(&self, disabled: bool) {
        self.1(disabled)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct CommandId(usize);

#[derive(Clone)]
pub struct Commands {
    pub commands: Vec<(CommandId, Command)>,
    pub register: CommandRegisterer,
}
impl PartialEq for Commands {
    fn eq(&self, other: &Self) -> bool {
        self.commands == other.commands
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct Command {
    pub name: String,
    pub execute: Callback<()>,
    pub keyboard_shortcut: Shortcut,
    pub disabled: bool,
}

#[derive(Debug, Clone, PartialEq)]
pub enum Shortcut {
    /// Manually capture the keyboard shortcut yourself.
    Manual(Vec<&'static str>),
    /// Automatically capture the keyboard shortcut by the command handler.
    Automatic(ShortcutKey),
    None,
}

impl Shortcut {
    fn cmd() -> Html {
        html! {<span class="pf-keycap"><i class="material-icons">{"keyboard_command_key"}</i></span>}
    }
    fn alt() -> Html {
        html! {<span class="pf-keycap"><i class="material-icons">{"alt"}</i></span>}
    }
    fn ctrl() -> Html {
        html! {<span class="pf-keycap"><i class="material-icons">{"control"}</i></span>}
    }
    fn enter() -> Html {
        html! {<span class="pf-keycap"><i class="material-icons">{"keyboard_return"}</i></span>}
    }
    fn shift() -> Html {
        // html! {<span class="pf-keycap"><i class="material-icons">{"shift"}</i></span>}
        html! {<span class="pf-keycap">{"shift"}</span>}
    }
    fn key(char: char) -> Html {
        html! {<span class="pf-keycap">{char.to_uppercase()}</span>}
    }
    pub fn to_html(&self) -> Option<Html> {
        match self {
            Shortcut::Manual(s) => {
                let s = s.iter().map(|s| match *s {
                    "Cmd" => Self::cmd(),
                    "Alt" => Self::alt(),
                    "Ctrl" => Self::ctrl(),
                    "Enter" => Self::enter(),
                    s if s.len() == 1 => Self::key(s.chars().next().unwrap()),
                    s => html! {<span class="pf-keycap">{s.to_lowercase()}</span>},
                });
                Some(html! { <span class="hotkey">{for s}</span> })
            }
            Shortcut::Automatic(shortcut_key) => {
                let mut s = Vec::new();
                if shortcut_key.cmd {
                    s.push(Self::cmd());
                }
                if shortcut_key.ctrl {
                    s.push(Self::ctrl());
                }
                if shortcut_key.alt {
                    s.push(Self::alt());
                }
                if shortcut_key.shift {
                    s.push(Self::shift());
                }
                match shortcut_key.key {
                    Key::Escape => s.push(html! {<span class="pf-keycap">{"esc"}</span>}),
                    Key::Enter => s.push(Self::enter()),
                    Key::Char(c) => s.push(Self::key(c)),
                }
                Some(html! { <span class="hotkey">{for s}</span> })
            }
            Shortcut::None => None,
        }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct ShortcutKey {
    pub key: Key,
    pub cmd: bool,
    pub ctrl: bool,
    pub alt: bool,
    pub shift: bool,
}

impl ShortcutKey {
    pub const fn automatic(key: Key, cmd: bool, ctrl: bool, alt: bool, shift: bool) -> Shortcut {
        Shortcut::Automatic(Self {
            key,
            cmd,
            ctrl,
            alt,
            shift,
        })
    }

    pub fn empty<K: Into<Key>>(key: K) -> Shortcut {
        Self::automatic(key.into(), false, false, false, false)
    }
    pub fn cmd<K: Into<Key>>(key: K) -> Shortcut {
        Self::automatic(key.into(), true, false, false, false)
    }
    pub fn ctrl<K: Into<Key>>(key: K) -> Shortcut {
        Self::automatic(key.into(), false, true, false, false)
    }
    pub fn alt<K: Into<Key>>(key: K) -> Shortcut {
        Self::automatic(key.into(), false, false, true, false)
    }
    pub fn shift<K: Into<Key>>(key: K) -> Shortcut {
        Self::automatic(key.into(), false, false, false, true)
    }

    pub const fn undo() -> Shortcut {
        Self::automatic(Key::Char('z'), true, false, false, false)
    }
    pub const fn redo() -> Shortcut {
        Self::automatic(Key::Char('z'), true, false, false, true)
    }
}

impl TryFrom<&KeyboardEvent> for ShortcutKey {
    type Error = String;
    fn try_from(value: &KeyboardEvent) -> Result<Self, Self::Error> {
        let cmd = value.meta_key();
        let ctrl = value.ctrl_key();
        let alt = value.alt_key();
        let shift = value.shift_key();
        let key = value.key();
        let key = match key.as_str() {
            "Escape" => Key::Escape,
            "Enter" => Key::Enter,
            s if s.len() == 1 => Key::Char(s.chars().next().unwrap()),
            _ => return Err(key),
        };
        Ok(Self {
            key,
            cmd,
            ctrl,
            alt,
            shift,
        })
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Key {
    Escape,
    Enter,
    Char(char),
}

impl From<char> for Key {
    fn from(c: char) -> Self {
        Self::Char(c)
    }
}

// Private interface

impl CommandRegisterer {
    fn new(link: Scope<CommandsProvider>) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Rc::new(move |command| {
            CommandRegisterer::mk_command_ref(&link, &id, command)
        }))
    }

    fn mk_command_ref(
        link: &Scope<CommandsProvider>,
        id: &Mutex<usize>,
        command: Command,
    ) -> CommandRef {
        let mut id = id.lock().unwrap();
        let id_v = CommandId(*id);
        *id += 1;
        drop(id);
        link.send_message(Msg::Register(id_v, command));
        let link_ref = link.clone();
        let deregister = Box::new(move || link_ref.send_message(Msg::DeRegister(id_v)));
        let link_ref = link.clone();
        let set_disabled =
            Box::new(move |disabled| link_ref.send_message(Msg::SetDisabled(id_v, disabled)));
        CommandRef(deregister, set_disabled)
    }
}

// Provider

#[allow(dead_code)]
pub struct CommandsProvider(Commands, CallbackRef);

#[derive(Properties, PartialEq)]
pub struct CommandsProviderProps {
    pub children: Children,
}

pub enum Msg {
    Register(CommandId, Command),
    DeRegister(CommandId),
    SetDisabled(CommandId, bool),
    KeyDownGlobal(KeyboardEvent),
}

impl Component for CommandsProvider {
    type Message = Msg;
    type Properties = CommandsProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let keydown = (registerer.register_keyboard_down)(ctx.link().callback(Msg::KeyDownGlobal));

        let commands = Commands {
            commands: Vec::new(),
            register: CommandRegisterer::new(ctx.link().clone()),
        };
        Self(commands, keydown)
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Register(id, command) => {
                self.0.commands.push((id, command));
                true
            }
            Msg::DeRegister(id) => {
                let command = self.0.commands.iter().position(|(i, _)| i == &id).unwrap();
                self.0.commands.swap_remove(command);
                true
            }
            Msg::SetDisabled(id, disabled) => {
                let command = self.0.commands.iter_mut().find(|(i, _)| i == &id).unwrap();
                if command.1.disabled == disabled {
                    return false;
                }
                command.1.disabled = disabled;
                true
            }
            Msg::KeyDownGlobal(ev) => {
                let Ok(key) = ShortcutKey::try_from(&ev) else {
                    return false;
                };
                for (_, cmd) in &self.0.commands {
                    if cmd.disabled {
                        continue;
                    }
                    let Shortcut::Automatic(shortcut) = &cmd.keyboard_shortcut else {
                        continue;
                    };
                    if shortcut == &key {
                        ev.prevent_default();
                        cmd.execute.emit(());
                    }
                }
                false
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        yew::html! {
            <ContextProvider<Rc<Commands>> context={Rc::new(self.0.clone())}>
                {for ctx.props().children.iter()}
            </ContextProvider<Rc<Commands>>>
        }
    }
}
