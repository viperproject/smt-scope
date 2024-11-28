use std::{cmp::Ordering, rc::Rc};

use fxhash::FxHashMap;
use gloo::timers::callback::Timeout;
use smt_log_parser::analysis::{visible::VisibleInstGraph, RawNodeIndex};
use web_sys::{HtmlElement, HtmlInputElement};
use yew::{
    html, prelude::Context, AttrValue, Callback, Component, ContextHandle, Html, InputEvent,
    KeyboardEvent, MouseEvent, NodeRef, Properties,
};

use crate::{
    commands::{Command, CommandId, CommandRef, Commands, CommandsContext, Key, ShortcutKey},
    filters::byte_size_display,
    infobars::{topbar::OmnibarMessage, DropdownButton},
    results::svg_result::RenderingState,
    utils::lookup::{CommandsWithName, Entry, Kind, Matches, StringLookupCommands},
    LoadingState, RcParser,
};

use self::input::{HighlightedString, OmniboxInput, PickedSuggestion, SuggestionResult};

use super::DropdownContext;

pub mod input;

const LAST_USED_DISPLAY: usize = 6;

#[derive(Properties, Clone, PartialEq)]
pub struct OmniboxProps {
    pub progress: LoadingState,
    pub message: Option<OmnibarMessage>,
    pub search: Callback<String, Option<SearchActionResult>>,
    pub pick: Callback<(String, Kind), Option<Vec<RawNodeIndex>>>,
    pub select: Callback<RawNodeIndex>,
}

pub enum Msg {
    Input(InputEvent),
    KeyDownTyping(KeyboardEvent),
    Picked(usize),
    Select { left: bool },
    Focus(bool),
    CommandsUpdated(Rc<Commands>),
}

pub struct Omnibox {
    omnibox: NodeRef,
    command_mode: bool,
    input: Option<String>,
    highlighted: usize,
    picked: Option<PickedSuggestion>,
    actions: Option<SuggestionResult>,
    all_commands: StringLookupCommands,
    commands: Option<CommandSearchResult>,
    commands_used: usize,
    last_used: Vec<(CommandId, usize)>,
    scroll_container: NodeRef,
    scroll_into_view: NodeRef,
    _handle: ContextHandle<Rc<Commands>>,
    _commands_search: [CommandRef; 3],
}

impl Omnibox {
    pub fn set_picked(&mut self, picked: Option<PickedSuggestion>) {
        if self.picked.is_none() && picked.is_none() {
            return;
        }
        if self.picked.is_none() != picked.is_none() {
            self._commands_search[0].set_disabled(picked.is_none());
            self._commands_search[1].set_disabled(picked.is_none());
        }
        self.picked = picked;
    }
}

impl Component for Omnibox {
    type Message = Msg;
    type Properties = OmniboxProps;

    fn create(ctx: &Context<Self>) -> Self {
        // Commands
        let (commands, _handle) = ctx
            .link()
            .get_commands(ctx.link().callback(Msg::CommandsUpdated))
            .unwrap();
        let all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
        let next_search = Command {
            name: "Go to next search result".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: false }),
            keyboard_shortcut: ShortcutKey::empty(Key::Enter),
            disabled: true,
        };
        let next_search = (commands.register)(next_search);
        let prev_search = Command {
            name: "Go to previous search result".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: true }),
            keyboard_shortcut: ShortcutKey::shift(Key::Enter),
            disabled: true,
        };
        let prev_search = (commands.register)(prev_search);
        let link = ctx.link().clone();
        let search_cmd = Command {
            name: "Search".to_string(),
            execute: Callback::from(move |_| {
                let link = link.clone();
                Timeout::new(1, move || {
                    link.get_toggle().unwrap().emit(Some(true));
                })
                .forget();
            }),
            keyboard_shortcut: ShortcutKey::cmd('s'),
            disabled: false,
        };
        let search_cmd = (commands.register)(search_cmd);
        let _commands_search = [next_search, prev_search, search_cmd];

        Self {
            omnibox: NodeRef::default(),
            command_mode: false,
            input: None,
            highlighted: 0,
            picked: None,
            actions: None,
            all_commands,
            commands: None,
            commands_used: 0,
            last_used: Vec::new(),
            scroll_container: NodeRef::default(),
            scroll_into_view: NodeRef::default(),
            _handle,
            _commands_search,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        if ctx.props().progress != old_props.progress {
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
            Msg::KeyDownTyping(ev) => match ev.key().as_str() {
                "Backspace" => {
                    if self.input.is_some() {
                        return false;
                    }
                    if self.command_mode {
                        self.highlighted = 0;
                        self.command_mode = false;
                        ctx.link().send_message(Msg::Focus(true));
                        true
                    } else {
                        self.highlighted = 0;
                        ctx.link().get_toggle().unwrap().emit(Some(false));
                        true
                    }
                }
                "Escape" => {
                    self.highlighted = 0;
                    self.command_mode = false;
                    ctx.link().get_toggle().unwrap().emit(Some(false));
                    self.actions = None;
                    self.input = None;
                    true
                }
                "Enter" => {
                    ctx.link().send_message(Msg::Picked(self.highlighted));
                    false
                }
                "ArrowUp" => {
                    if self.highlighted == 0 {
                        return false;
                    }
                    ev.prevent_default();
                    self.highlighted -= 1;
                    true
                }
                "ArrowDown" => {
                    let max_val = if self.command_mode {
                        self.commands
                            .as_ref()
                            .map(|c| c.enabled_commands)
                            .unwrap_or_default()
                    } else {
                        self.actions
                            .as_ref()
                            .map(SuggestionResult::suggestion_count)
                            .unwrap_or_default()
                    };
                    if self.highlighted + 1 >= max_val {
                        return false;
                    }
                    ev.prevent_default();
                    self.highlighted += 1;
                    true
                }
                _ => false,
            },
            Msg::Input(_ev) => {
                self.highlighted = 0;
                let query = self
                    .omnibox
                    .cast::<HtmlInputElement>()
                    .map(|r| r.value())
                    .unwrap_or_default();

                if self.command_mode {
                    self.set_picked(None);
                    self.input = Some(query).filter(|q| !q.is_empty());

                    let input = self.input.as_deref().unwrap_or_default();
                    self.commands =
                        CommandSearchResult::new(input, &self.all_commands, &self.last_used);
                } else if query == ">" {
                    self.command_mode = true;

                    self.actions = None;
                    self.set_picked(None);
                    self.input = None;
                    if let Some(omnibox) = self.omnibox.cast::<HtmlInputElement>() {
                        omnibox.set_value("");
                    }
                    self.commands =
                        CommandSearchResult::new("", &self.all_commands, &self.last_used);
                } else {
                    self.input = Some(query).filter(|q| !q.is_empty());

                    let input = self.input.as_deref().unwrap_or_default();
                    self.actions = ctx
                        .props()
                        .search
                        .emit(input.to_string())
                        .map(SuggestionResult::new);
                    self.set_picked(PickedSuggestion::default(
                        self.actions.as_ref(),
                        &ctx.props().pick,
                    ));
                }
                true
            }
            Msg::Focus(focused) => {
                self.highlighted = self
                    .picked
                    .as_ref()
                    .map(|s| s.suggestion_idx)
                    .unwrap_or_default();
                if let Some(omnibox) = self.omnibox.cast::<HtmlInputElement>() {
                    if focused {
                        omnibox.focus().ok();
                        omnibox.select();
                    } else {
                        omnibox.blur().ok();
                    }
                }
                if focused {
                    let input = self.input.as_deref().unwrap_or_default();
                    let new_actions = ctx
                        .props()
                        .search
                        .emit(input.to_string())
                        .map(SuggestionResult::new);
                    let old_actions = std::mem::replace(&mut self.actions, new_actions);
                    if old_actions != self.actions {
                        self.set_picked(PickedSuggestion::default(
                            self.actions.as_ref(),
                            &ctx.props().pick,
                        ));
                    }
                } else if self.command_mode {
                    self.command_mode = false;
                    self.input = None;
                }
                true
            }
            Msg::Picked(idx) => {
                ctx.link().get_toggle().unwrap().emit(Some(false));
                if self.command_mode {
                    if let Some(c) = self.commands.as_ref().and_then(|c| c.commands.get(idx)) {
                        if let Some(old) = self.last_used.iter().position(|(id, _)| id == &c.id) {
                            self.last_used.remove(old);
                        }
                        self.last_used.push((c.id, self.commands_used));
                        self.commands_used += 1;
                        c.command.execute.emit(());
                    }
                    false
                } else {
                    self.set_picked(
                        self.actions
                            .as_ref()
                            .and_then(|sr| PickedSuggestion::new(idx, sr, &ctx.props().pick)),
                    );
                    self.input = self.picked.as_ref().map(|s| s.name.clone());
                    true
                }
            }
            Msg::Select { left } => {
                let Some(picked) = &mut self.picked else {
                    return false;
                };
                if picked.nodes.is_empty() {
                    return false;
                }
                let number = picked
                    .node_idx
                    .map(|i| {
                        if left {
                            if i == 0 {
                                picked.nodes.len() - 1
                            } else {
                                i - 1
                            }
                        } else if i + 1 == picked.nodes.len() {
                            0
                        } else {
                            i + 1
                        }
                    })
                    .unwrap_or_default();
                picked.node_idx = Some(number);
                ctx.props().select.emit(picked.nodes[number]);
                true
            }
            Msg::CommandsUpdated(commands) => {
                self.all_commands =
                    StringLookupCommands::with_commands(commands.commands.iter().cloned());
                self.command_mode
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let mut omnibox_info = ctx
            .props()
            .message
            .as_ref()
            .map(|m| AttrValue::from(m.message.clone()));
        let mut icon = ctx
            .props()
            .message
            .as_ref()
            .is_some_and(|m| m.is_error)
            .then_some("error");
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
                let progress = parsing
                    .file_size
                    .map(|size| {
                        let progress = parsing.reader.bytes_read as f64 / size as f64;
                        format!("{:.0}%", progress * 100.0)
                    })
                    .unwrap_or_else(|| "?".to_string());
                let speed = parsing
                    .speed
                    .map(byte_size_display)
                    .map(|(speed, unit)| format!(" - {speed:.0} {unit}/s",));
                let (memory_use, unit) = byte_size_display(parsing.memory_use as f64);
                let info = format!(
                    "Parsing trace {progress}{} | Use {memory_use:.0}{unit}",
                    speed.unwrap_or_default()
                );
                omnibox_info = Some(AttrValue::from(info));
            }
            LoadingState::DoneParsing(..) => (),
            LoadingState::Rendering(RenderingState::ConstructingGraph, timeout, _)
            | LoadingState::Rendering(RenderingState::ConstructedGraph, timeout, _) => {
                if *timeout {
                    omnibox_info = Some(AttrValue::from("Analysing partial trace"));
                } else {
                    omnibox_info = Some(AttrValue::from("Analysing trace"));
                }
            }
            LoadingState::Rendering(
                RenderingState::GraphToDot | RenderingState::RenderingGraph,
                _,
                _,
            ) => {
                omnibox_info = Some(AttrValue::from("Rendering trace"));
            }
            LoadingState::FileDisplayed => (),
        };
        let omnibox_disabled = omnibox_info.is_some();
        let icon = icon.unwrap_or({
            if omnibox_disabled {
                "info"
            } else if self.command_mode {
                "chevron_right"
            } else {
                "search"
            }
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
        let placeholder = omnibox_info.unwrap_or_else(|| {
            if self.command_mode {
                AttrValue::from("Filter commands...")
            } else {
                AttrValue::from("Search or type '>' for commands")
            }
        });
        let oninput = ctx.link().callback(Msg::Input);
        let onkeydown = ctx.link().callback(|ev: KeyboardEvent| {
            ev.stop_propagation();
            ev.cancel_bubble();
            Msg::KeyDownTyping(ev)
        });

        let dropdown = self.command_mode || self.input.is_some() || self.actions.is_some();
        let dropdown = dropdown.then(|| {
            let onmousedown = |idx| {
                let link = ctx.link().clone();
                Callback::from(move |ev: MouseEvent| {
                    if ev.button() != 0 || ev.ctrl_key() || ev.meta_key() || ev.alt_key() {
                        return;
                    }
                    link.send_message(Msg::Picked(idx));
                })
            };
            let inner = if self.command_mode {
                let idx = &mut 0;
                let commands = self.commands.as_ref().map(|commands| {
                    let query_len = commands.query.len();
                    commands.commands.iter().map(move |command| {
                        let i = (!command.command.disabled).then(|| {
                            let i = *idx;
                            *idx += 1;
                            i
                        });
                        let highlighted = Some(self.highlighted) == i;
                        let class = if highlighted {
                            "omnibox-highlighted"
                        } else if command.command.disabled {
                            "omnibox-disabled"
                        } else {
                            "can-hover"
                        };
                        let scroll_into_view = highlighted
                            .then(|| self.scroll_into_view.clone())
                            .unwrap_or_default();

                        let onmousedown = i.map(onmousedown);
                        let start = command.idx * query_len;
                        let name = HighlightedString(
                            &command.command.name,
                            &commands.indices[start..start + query_len],
                        )
                        .into_html();
                        let last_used = command
                            .last_used
                            .map(|_| html! { <span class="tag">{"recently used"}</span> });
                        let keyboard_shortcut = command.command.keyboard_shortcut.to_html();
                        html! {
                            <li ref={scroll_into_view} {class} {onmousedown}>
                                <span class="option-title">{name}</span>
                                {last_used}
                                {keyboard_shortcut}
                            </li>
                        }
                    })
                });
                self.wrapper(commands)
            } else {
                self.wrapper(SuggestionResult::as_html(
                    self.actions.as_ref(),
                    self.highlighted,
                    &self.scroll_into_view,
                    onmousedown,
                ))
            };
            html! {
                <div class="omnibox-popup" onkeydown={onkeydown.clone()} tabindex={"0"}>{inner}</div>
            }
        });
        let stepthrough = self.picked.as_ref().map(|picked| {
            let node_idx = picked.node_idx.map(|i| (i + 1).to_string()).unwrap_or_else(|| "?".to_string());
            let left = ctx.link().callback(|ev: MouseEvent| {
                ev.stop_propagation();
                ev.cancel_bubble();
                Msg::Select { left: true }
            });
            let right = ctx.link().callback(|ev: MouseEvent| {
                ev.stop_propagation();
                ev.cancel_bubble();
                Msg::Select { left: false }
            });
            html! {
            <>
                <div class="current">{node_idx}{" / "}{picked.nodes.len()}</div>
                <button onmousedown={left}><i class="material-icons left">{"keyboard_arrow_left"}</i></button>
                <button onmousedown={right}><i class="material-icons right">{"keyboard_arrow_right"}</i></button>
            </>
            }
        });

        let omnibox = self.omnibox.clone();
        let input = (!omnibox_disabled)
            .then(|| self.input.clone())
            .unwrap_or_default();
        html! {
            <DropdownButton idx={0} ontoggle={ctx.link().callback(Msg::Focus)} enable_on_click={()}>
                <div class="omnibox">
                    <div class="icon">{icon}</div>
                    <OmniboxInput {omnibox} {placeholder} {omnibox_disabled} {input} {oninput} {onkeydown} />
                    <div class="stepthrough">{stepthrough}</div>
                </div>
                {dropdown}
            </DropdownButton>
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

impl SearchActionResult {
    pub fn new(
        query: String,
        matches: Matches<'_, FxHashMap<Kind, Entry>>,
        parser: &RcParser,
        visible: Option<&VisibleInstGraph>,
    ) -> Self {
        let groups = matches
            .matches
            .into_iter()
            .enumerate()
            .map(|(idx, (score, matched, values))| {
                let actions = values
                    .iter()
                    .map(|(kind, entry)| {
                        let visible = if let (Some(graph), Some(visible)) = (&parser.graph, visible)
                        {
                            entry.count_visible(&graph.borrow(), visible)
                        } else {
                            0
                        };
                        let hue = entry
                            .qidx
                            .map(|qidx| parser.colour_map.get_rbg_hue(Some(qidx)));
                        let arguments = entry
                            .tidx
                            .map(|tidx| (&*parser.parser.borrow())[tidx].child_ids.len());
                        SearchAction {
                            count: entry.count(),
                            visible,
                            kind: *kind,
                            hue,
                            arguments,
                        }
                    })
                    .collect();
                SearchActionGroup {
                    score,
                    idx,
                    name: matched.to_string(),
                    actions,
                }
            })
            .collect();
        SearchActionResult {
            query,
            indices: matches.indices,
            groups,
        }
    }
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

impl CommandSearchResult {
    fn new(
        query: &str,
        search: &StringLookupCommands,
        last_used: &[(CommandId, usize)],
    ) -> Option<Self> {
        let last_used = if last_used.len() < LAST_USED_DISPLAY {
            last_used
        } else {
            &last_used[last_used.len() - LAST_USED_DISPLAY..]
        };

        let mut enabled_commands = 0;
        let matches = search.get_fuzzy(query);
        Some(matches)
            .filter(|matches| !matches.matches.is_empty())
            .map(|matches| {
                let mut commands = matches
                    .matches
                    .into_iter()
                    .enumerate()
                    .flat_map(|(idx, (score, _, commands))| {
                        let commands = match commands {
                            CommandsWithName::Single(single) => vec![single.clone()],
                            CommandsWithName::Multiple(many) => many.clone(),
                        };
                        enabled_commands += commands.iter().filter(|(_, c)| !c.disabled).count();
                        commands.into_iter().map(move |(id, command)| {
                            let last_used = last_used
                                .iter()
                                .rev()
                                .position(|(last_id, _)| last_id == &id);
                            CommandAction {
                                idx,
                                score,
                                id,
                                command,
                                last_used,
                            }
                        })
                    })
                    .collect::<Vec<_>>();
                commands.sort();
                CommandSearchResult {
                    query: query.to_string(),
                    indices: matches.indices,
                    enabled_commands,
                    commands,
                }
            })
    }
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
        self.ordering()
            .cmp(&other.ordering())
    }
}
impl CommandAction {
    pub fn ordering(&self) -> (bool, usize, u16, &str, CommandId) {
        (
            self.command.disabled,
            usize::MAX - self.last_used.map(|lu| usize::MAX - lu).unwrap_or_default(),
            u16::MAX - self.score,
            self.command.name.as_str(),
            self.id,
        )
    }
}

impl Omnibox {
    fn wrapper(&self, inner: Option<impl Iterator<Item = Html>>) -> Html {
        inner.map(|inner| html! {
                <div class="omnibox-dropdown"><div ref={&self.scroll_container} class="omnibox-options-container">{for inner}</div>
                    <div class="omnibox-dropdown-footer">
                        <section><span class="dd-keycap"><i class="icon">{"arrow_upward"}</i></span>{" "}<span class="dd-keycap"><i class="icon">{"arrow_downward"}</i></span>{" to navigate"}</section>
                        <section><span class="dd-keycap"><i class="icon">{"keyboard_return"}</i></span>{" to "}{if self.command_mode { "use" } else {"select"}}</section>
                        <section><span class="dd-keycap">{"esc"}</span>{" to dismiss"}</section>
                    </div>
                </div>
            })
            .unwrap_or_else(||{
                let is_filtering = self.actions.as_ref().map(|s| !s.query.is_empty()).unwrap_or_default();
                html! {
                        <div class="omnibox-empty-state">
                            <i class="material-icons">{"search"}</i>
                            <div class="omnibox-empty-state-title">{"No "}{if is_filtering { "matching " } else { "" }}{if self.command_mode { "commands" } else { "results" }}{"..."}</div>
                            <div class="omnibox-empty-state-content"></div>
                        </div>
                    }
                }
            )
    }
}
