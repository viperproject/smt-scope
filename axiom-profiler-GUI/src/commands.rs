use std::{ops::Deref, rc::Rc, sync::Mutex};

use yew::{
    html::Scope, Callback, Children, Component, Context, ContextHandle, ContextProvider, Html,
    Properties,
};

// Public interface

pub trait CommandsContext {
    fn get_commands(
        &self,
        updated: Callback<Rc<Commands>>,
    ) -> Option<(Rc<Commands>, ContextHandle<Rc<Commands>>)>;
    fn get_commands_registerer(&self) -> Option<CommandRegisterer> {
        self.get_commands(Callback::noop()).map(|c| c.0.register)
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

#[derive(Clone, Copy)]
pub struct CommandRegisterer(&'static dyn Fn(Command) -> CommandRef);
impl Deref for CommandRegisterer {
    type Target = &'static dyn Fn(Command) -> CommandRef;
    fn deref(&self) -> &Self::Target {
        &self.0
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
    pub keyboard_shortcut: Vec<&'static str>,
    pub disabled: bool,
}

// Private interface

impl CommandRegisterer {
    fn new(link: Scope<CommandsProvider>) -> Self {
        let id = Mutex::<usize>::new(0);
        Self(Box::leak(Box::new(move |command| {
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
        })))
    }
}

// Provider

pub struct CommandsProvider(Commands);

#[derive(Properties, PartialEq)]
pub struct CommandsProviderProps {
    pub children: Children,
}

pub enum Msg {
    Register(CommandId, Command),
    DeRegister(CommandId),
    SetDisabled(CommandId, bool),
}

impl Component for CommandsProvider {
    type Message = Msg;
    type Properties = CommandsProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let commands = Commands {
            commands: Vec::new(),
            register: CommandRegisterer::new(ctx.link().clone()),
        };
        Self(commands)
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
                command.1.disabled = disabled;
                true
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
