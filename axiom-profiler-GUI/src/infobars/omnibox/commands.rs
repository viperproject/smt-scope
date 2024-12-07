use std::{cmp::{Ordering, Reverse}, rc::Rc};

use gloo::timers::callback::Timeout;
use yew::{html, Callback, Context, ContextHandle, Html, MouseEvent, NodeRef};

use crate::{
    commands::{Command, CommandId, CommandRef, Commands, Key, ShortcutKey},
    infobars::DropdownContext,
    utils::lookup::{HighlightedString, StringLookup},
};

use super::{Omnibox, OmniboxM};

const LAST_USED_DISPLAY: usize = 6;

pub struct CommandsContext {
    all_commands: StringLookupCommands,
    commands_used: usize,
    last_used: Vec<(CommandId, usize)>,

    prev_select: CommandRef,
    next_select: CommandRef,
    search: CommandRef,
    _handle: ContextHandle<Rc<Commands>>,
}

impl CommandsContext {
    pub fn new(ctx: &Context<Omnibox>) -> Self {
        use crate::commands::CommandsContext;
        let (commands, _handle) = ctx
            .link()
            .get_commands(ctx.link().callback(OmniboxM::CommandsUpdated))
            .unwrap();
        let all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
        let next_select = Command {
            name: "Go to next search result".to_string(),
            execute: ctx.link().callback(|_| OmniboxM::Select { left: false }),
            keyboard_shortcut: ShortcutKey::empty(Key::Enter),
            disabled: true,
        };
        let next_select = (commands.register)(next_select);
        let prev_select = Command {
            name: "Go to previous search result".to_string(),
            execute: ctx.link().callback(|_| OmniboxM::Select { left: true }),
            keyboard_shortcut: ShortcutKey::shift(Key::Enter),
            disabled: true,
        };
        let prev_select = (commands.register)(prev_select);
        let link = ctx.link().clone();
        let idx = ctx.props().idx;
        let search = Command {
            name: "Search".to_string(),
            execute: Callback::from(move |_| {
                let link = link.clone();
                Timeout::new(1, move || {
                    link.toggle_dropdown_idx(Some(true), idx);
                })
                .forget();
            }),
            keyboard_shortcut: ShortcutKey::cmd('s'),
            disabled: false,
        };
        let search = (commands.register)(search);

        Self {
            all_commands,
            commands_used: 0,
            last_used: Vec::new(),
            prev_select,
            next_select,
            search,
            _handle,
        }
    }

    pub fn update_commands(&mut self, commands: &Commands) {
        self.all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
    }

    pub fn search(&self, query: &str) -> CommandSearchResults {
        CommandSearchResults::new(query, &self.all_commands, &self.last_used)
    }

    pub fn can_select(&self, enabled: bool) {
        self.prev_select.set_disabled(!enabled);
        self.next_select.set_disabled(!enabled);
    }

    pub fn can_search(&self, enabled: bool) {
        self.search.set_disabled(!enabled);
    }

    pub fn use_command(&mut self, id: CommandId) {
        if let Some(old) = self.last_used.iter().position(|(i, _)| i == &id) {
            self.last_used.remove(old);
        }
        self.last_used.push((id, self.commands_used));
        self.commands_used += 1;
    }
}

#[derive(Debug, Clone, PartialEq)]
pub struct CommandSearchResults {
    pub query: String,
    pub indices: Vec<u32>,
    pub enabled_commands: usize,
    pub commands: Vec<CommandAction>,
}

impl CommandSearchResults {
    fn new(query: &str, search: &StringLookupCommands, last_used: &[(CommandId, usize)]) -> Self {
        let last_used = if last_used.len() < LAST_USED_DISPLAY {
            last_used
        } else {
            &last_used[last_used.len() - LAST_USED_DISPLAY..]
        };

        let mut enabled_commands = 0;
        let matches = search.get_fuzzy(query);
        let mut commands = matches
            .matches
            .into_iter()
            .enumerate()
            .flat_map(|(idx, (score, _, commands))| {
                enabled_commands += commands.iter().filter(|(_, c)| !c.disabled).count();
                commands.iter().cloned().map(move |(id, command)| {
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
        CommandSearchResults {
            query: query.to_string(),
            indices: matches.indices,
            enabled_commands,
            commands,
        }
    }

    pub fn as_html<'a, F: Fn(usize) -> Callback<MouseEvent> + 'a>(
        &'a self,
        highlighted: usize,
        scroll_into_view: &'a NodeRef,
        onmousedown: &'a F,
    ) -> impl Iterator<Item = Html> + 'a {
        let mut numbers = 0..;
        let mut next = move || numbers.next().unwrap();
        let query_len = self.query.len();

        self.commands.iter().map(move |command| {
            let i = (!command.command.disabled).then(&mut next);
            let highlighted = Some(highlighted) == i;
            let class = if highlighted {
                "omnibox-highlighted"
            } else if command.command.disabled {
                "omnibox-disabled"
            } else {
                "can-hover"
            };
            let scroll_into_view = highlighted
                .then(|| scroll_into_view.clone())
                .unwrap_or_default();

            let onmousedown = i.map(onmousedown);
            let start = command.idx * query_len;
            let name = HighlightedString(
                &command.command.name,
                &self.indices[start..start + query_len],
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
        self.ordering().cmp(&other.ordering())
    }
}
impl CommandAction {
    pub fn ordering(&self) -> impl Ord + '_ {
        (
            self.command.disabled,
            Reverse(self.last_used.map(|lu| usize::MAX - lu).unwrap_or_default()),
            Reverse(self.score),
            self.command.name.as_str(),
            self.id,
        )
    }
}

pub type StringLookupCommands = StringLookup<Vec<(CommandId, Command)>>;
impl StringLookupCommands {
    pub fn with_commands(commands: impl Iterator<Item = (CommandId, Command)>) -> Self {
        let mut lookup = Self::new();
        for command in commands {
            let entry = lookup.get_or_insert_default(command.1.name.as_str());
            entry.push(command);
        }
        lookup
    }
}
