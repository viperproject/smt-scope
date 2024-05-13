use std::{cmp::Ordering, rc::Rc};

use fxhash::FxHashMap;
use gloo::console::log;
use smt_log_parser::parsers::z3::graph::{visible::VisibleInstGraph, RawNodeIndex};
use web_sys::{HtmlElement, HtmlInputElement};
use yew::{html, prelude::Context, AttrValue, Callback, Component, ContextHandle, Html, InputEvent, KeyboardEvent, MouseEvent, NodeRef, Properties};

use crate::{commands::{Command, CommandId, CommandRef, Commands, CommandsContext}, configuration::ConfigurationProvider, infobars::topbar::OmnibarMessage, results::svg_result::RenderingState, utils::lookup::{CommandsWithName, Entry, Kind, Matches, StringLookupCommands}, CallbackRef, GlobalCallbacksContext, LoadingState, RcParser, SIZE_NAMES};

use self::input::{MlOmniboxInput, PickedSuggestion, SuggestionResult, HighlightedString};

pub mod input;

const LAST_USED_DISPLAY: usize = 6;

#[derive(Properties, Clone, PartialEq)]
pub struct MlOmniboxProps {
    pub progress: LoadingState,
    pub message: Option<OmnibarMessage>,
    pub omnibox: NodeRef,
    pub found_mls: Option<usize>,
    pub pick_nth_ml: Callback<usize>,
}

pub enum Msg {
    KeyDownGlobal(KeyboardEvent),
    Select { left: bool },
    CommandsUpdated(Rc<Commands>),
    ContextUpdated(Rc<ConfigurationProvider>),
}

pub struct MlOmnibox {
    focused: bool,
    command_mode: bool,
    input: Option<String>,
    highlighted: usize,
    picked: Option<PickedSuggestion>,
    actions: Option<SuggestionResult>,
    all_commands: StringLookupCommands,
    commands: Option<CommandSearchResult>,
    scroll_container: NodeRef,
    scroll_into_view: NodeRef,
    _handle: ContextHandle<Rc<Commands>>,
    _callback_refs: [CallbackRef; 1],
    _commands_search: [CommandRef; 2],
    is_in_ml_viewer_mode: bool,
    _context_listener: ContextHandle<Rc<ConfigurationProvider>>,
}

impl MlOmnibox {
    pub fn set_picked(&mut self, picked: Option<PickedSuggestion>) {
        if self.picked.is_none() && picked.is_none() {
            return;
        }
        if self.picked.is_none() != picked.is_none() {
            for cmd in &self._commands_search {
                cmd.set_disabled(picked.is_none());
            }
        }
        self.picked = picked;
    }
}

impl Component for MlOmnibox {
    type Message = Msg;
    type Properties = MlOmniboxProps;

    fn create(ctx: &Context<Self>) -> Self {
        // Global callbacks
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let keydown = (registerer.register_keyboard_down)(ctx.link().callback(Msg::KeyDownGlobal));
        let _callback_refs = [keydown];

        // Commands
        let (commands, _handle) = ctx.link().get_commands(ctx.link().callback(Msg::CommandsUpdated)).unwrap();
        let all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
        let next_search = Command {
            name: "Go to next search result".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: false }),
            keyboard_shortcut: vec!["Enter"],
            disabled: true
        };
        let next_search = (commands.register)(next_search);
        let prev_search = Command {
            name: "Go to previous search result".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: true }),
            keyboard_shortcut: vec!["Shift", "Enter"],
            disabled: true
        };
        let prev_search = (commands.register)(prev_search);
        let _commands_search = [next_search, prev_search];
        let (msg, context_listener) = ctx
            .link()
            .context(ctx.link().callback(Msg::ContextUpdated))
            .expect("No message context provided");
        log!(format!("Creating MlOmnibox component with is_in_viewre_mode = {}", msg.config.persistent.ml_viewer_mode));
        Self {
            focused: false,
            command_mode: false,
            input: None,
            highlighted: 0,
            picked: PickedSuggestion::default_simple(),
            actions: None,
            all_commands,
            commands: None,
            scroll_container: NodeRef::default(),
            scroll_into_view: NodeRef::default(),
            _handle,
            _callback_refs,
            _commands_search,
            is_in_ml_viewer_mode: msg.config.persistent.ml_viewer_mode,
            _context_listener: context_listener,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        if ctx.props() == old_props {
            return false;
        }
        if ctx.props().progress != old_props.progress && !self.is_in_ml_viewer_mode {
            self.focused = false;
            self.command_mode = false;
            self.input = None;
            self.highlighted = 0;
            self.picked = None;
            self.actions = None;
            self.commands = None;
        }
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::KeyDownGlobal(ev) => match ev.key().as_str() {
                "Enter" => {
                    ctx.link().send_message(Msg::Select { left: ev.shift_key() });
                    false
                }
                _ => false,
            },
            Msg::Select { left } => {
                let Some(picked) = &mut self.picked else {
                    return false;
                };
                let number = picked.ml_idx.map(|i|
                    if left {
                        if i == 0 { ctx.props().found_mls.unwrap() - 1 } else { i - 1 } 
                    } else {
                        if i + 1 == ctx.props().found_mls.unwrap() { 0 } else { i + 1 }
                    }
                ).unwrap_or_default();
                picked.ml_idx = Some(number);
                ctx.props().pick_nth_ml.emit(picked.ml_idx.unwrap());
                true
            }
            Msg::CommandsUpdated(commands) => {
                self.all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
                self.command_mode
            }
            Msg::ContextUpdated(msg) => {
                log!(format!("Setting self.is_in_ml_viewer_mode to {}", msg.config.persistent.ml_viewer_mode));
                if self.is_in_ml_viewer_mode != msg.config.persistent.ml_viewer_mode {
                    self.is_in_ml_viewer_mode = msg.config.persistent.ml_viewer_mode;
                    self.picked = PickedSuggestion::default_simple();
                    true
                } else {
                    false
                } 
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        log!("In view()");
        let mut omnibox_info = ctx.props().message.as_ref().map(|m| AttrValue::from(m.message.clone()));
        let mut icon = ctx.props().message.as_ref().is_some_and(|m| m.is_error).then(|| "error");
        let mut callback = None;

        match &ctx.props().progress {
            LoadingState::NoFileSelected => (),
            LoadingState::ReadingToString => {
                omnibox_info = Some(AttrValue::from("Loading trace"));
            }
            LoadingState::StartParsing => {
                omnibox_info = Some(AttrValue::from("Parsing trace"));
            }
            LoadingState::Parsing(parsing, cancel) => {
                icon = Some("stop_circle");
                callback = Some(cancel);
                let progress = parsing.reader.bytes_read as f64 / parsing.file_size as f64;
                let info = if let Some(mut speed) = &parsing.speed {
                    let mut idx = 0;
                    while speed >= 10_000.0 && idx + 1 < SIZE_NAMES.len() {
                        speed /= 1024.0;
                        idx += 1;
                    }
                    format!("Parsing trace {:.0}% - {:.0} {}/s", progress * 100.0, speed, SIZE_NAMES[idx])
                } else {
                    format!("Parsing trace {:.0}%", progress * 100.0)
                };
                omnibox_info = Some(AttrValue::from(info));
            }
            LoadingState::DoneParsing(..) => (),
            LoadingState::Rendering(RenderingState::ConstructingGraph, timeout, _) |
            LoadingState::Rendering(RenderingState::ConstructedGraph, timeout, _) => {
                if *timeout {
                    omnibox_info = Some(AttrValue::from("Analysing partial trace"));
                } else {
                    omnibox_info = Some(AttrValue::from("Analysing trace"));
                }
            }
            LoadingState::Rendering(RenderingState::GraphToDot | RenderingState::RenderingGraph, _, _) => {
                omnibox_info = Some(AttrValue::from("Rendering trace"));
            }
            LoadingState::FileDisplayed => (),
        };
        let omnibox_disabled = omnibox_info.is_some();
        let icon = icon.unwrap_or_else(|| {
            if omnibox_disabled { "info" }
            else if self.command_mode { "chevron_right" }
            else { "search" }
        });
        let icon = if let Some(callback) = callback {
            let callback = callback.clone();
            let onclick = Callback::from(move |click: MouseEvent| {
                click.prevent_default();
                callback.emit(());
            });
            html! { <a href="#" onclick={onclick}>{icon}</a> }
        } else {
            html! { {icon} }
        };
        let placeholder = 
            omnibox_info.unwrap_or_else(|| if self.command_mode {
                AttrValue::from("Filter commands...")
            } else if !self.is_in_ml_viewer_mode {
                AttrValue::from("Search or type '>' for commands")
            } else {
                match ctx.props().found_mls.unwrap() {
                    0 => AttrValue::from(format!("No matching loops found")),
                    1 => AttrValue::from(format!("Found {} potential matching loop", ctx.props().found_mls.unwrap())),
                    n => AttrValue::from(format!("Found {} potential matching loops", n)),
                }
            });
        let onkeyup = Callback::from(|ev: KeyboardEvent| {
            ev.stop_propagation(); ev.cancel_bubble();
        });
        let test = if !self.is_in_ml_viewer_mode { self.picked.as_ref().map(|picked| {
            log!("1: Creating test-VNode in view()");
                let node_idx = picked.node_idx.map(|i| (i + 1).to_string()).unwrap_or_else(|| "?".to_string());
                let left = ctx.link().callback(|_| Msg::Select { left: true });
                let right = ctx.link().callback(|_| Msg::Select { left: false });
                html! {
                <>
                    <div class="current">{node_idx}{" / "}{picked.nodes.len()}</div>
                    <button onclick={left}><i class="material-icons left">{"keyboard_arrow_left"}</i></button>
                    <button onclick={right}><i class="material-icons right">{"keyboard_arrow_right"}</i></button>
                </>
                }
        }) } else { self.picked.as_ref().map(|picked| {
            log!("2: Creating test-VNode in view()");
            let ml_idx = picked.ml_idx.map(|i| (i + 1).to_string()).unwrap_or_else(|| "?".to_string());
            let left = ctx.link().callback(|_| Msg::Select { left: true });
            let right = ctx.link().callback(|_| Msg::Select { left: false });
            html! {
            <>
                <div class="current">{ml_idx}{" / "}{ctx.props().found_mls.unwrap()}</div>
                <button onclick={left}><i class="material-icons left">{"keyboard_arrow_left"}</i></button>
                <button onclick={right}><i class="material-icons right">{"keyboard_arrow_right"}</i></button>
            </>
            }
        })
        };
        let omnibox = ctx.props().omnibox.clone();
        let input = (!omnibox_disabled).then(|| self.input.clone()).unwrap_or_default();
        html! {
            <div class="omnibox" {onkeyup}>
                <div class="icon">{icon}</div>
                <MlOmniboxInput {omnibox} {placeholder} omnibox_disabled={true} focused={self.focused} {input} />
                <div class="stepthrough">{test}</div>
            </div>
        }
    }
    fn rendered(&mut self, _ctx: &Context<Self>, _first_render: bool) {
        let Some(scroll_into_view) = self.scroll_into_view.cast::<HtmlElement>() else {
            return;
        };
        let Some(scroll_container) = self.scroll_container.cast::<HtmlElement>() else {
            return;
        };
        let selected_rect = scroll_into_view.get_bounding_client_rect();
        let container_rect = scroll_container.get_bounding_client_rect();
        let scroll_up = (selected_rect.top() - selected_rect.height()) - container_rect.top();
        if scroll_up < 0.0 {
            scroll_container.scroll_by_with_x_and_y(0.0, scroll_up);
        } else {
            let scroll_down = selected_rect.bottom() - container_rect.bottom();
            if scroll_down > 0.0 {
                scroll_container.scroll_by_with_x_and_y(0.0, scroll_down);
            }
        }
    }
}

#[derive(Debug)]
pub struct SearchActionResult {
    pub query: String,
    pub indices: Vec<u32>,
    pub groups: Vec<SearchActionGroup>,
}

#[derive(Debug)]
pub struct SearchActionGroup {
    pub score: u16,
    pub idx: usize,
    pub name: String,
    pub actions: Vec<SearchAction>,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SearchAction {
    pub count: usize,
    pub visible: usize,
    pub kind: crate::utils::lookup::Kind,
    pub hue: Option<f64>,
    pub arguments: Option<usize>,
}


#[derive(Debug, Clone, PartialEq)]
pub struct CommandSearchResult {
    pub query: String,
    pub indices: Vec<u32>,
    pub enabled_commands: usize,
    pub commands: Vec<CommandAction>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct CommandAction {
    pub idx: usize,
    pub score: u16,
    pub id: CommandId,
    pub last_used: Option<usize>,
    pub command: Command,
}

impl Eq for CommandAction {}
impl PartialOrd for CommandAction {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}
impl Ord for CommandAction {
    fn cmp(&self, other: &Self) -> Ordering {
        let last_used_order = |lu: Option<usize>| usize::MAX - lu.map(|lu| usize::MAX - lu).unwrap_or_default();
        (self.command.disabled, last_used_order(self.last_used), u16::MAX - self.score, self.command.name.as_str(), self.id)
            .cmp(&(other.command.disabled, last_used_order(other.last_used), u16::MAX - other.score, other.command.name.as_str(), other.id))
    }
}

