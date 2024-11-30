use std::{cmp::Ordering, rc::Rc};

use web_sys::HtmlElement;
use yew::{
    html, prelude::Context, AttrValue, Callback, Component, ContextHandle, Html, KeyboardEvent,
    NodeRef, Properties,
};

use crate::{
    commands::{Command, CommandId, CommandRef, Commands, CommandsContext, Key, ShortcutKey},
    infobars::{topbar::OmniboxMessage, OmniboxMessageKind},
    utils::lookup::StringLookupCommands,
    MlData,
};

use self::input::{MlOmniboxInput, PickedSuggestion};

pub mod input;

#[derive(Properties, Clone, PartialEq)]
pub struct MlOmniboxProps {
    pub message: Option<OmniboxMessage>,
    pub ml_data: MlData,
    pub pick_nth_ml: Callback<usize>,
}

pub enum Msg {
    Select { left: bool },
    CommandsUpdated(Rc<Commands>),
}

pub struct MlOmnibox {
    focused: bool,
    command_mode: bool,
    input: Option<String>,
    picked: Option<PickedSuggestion>,
    all_commands: StringLookupCommands,
    scroll_container: NodeRef,
    scroll_into_view: NodeRef,
    _handle: ContextHandle<Rc<Commands>>,
    _commands_search: [CommandRef; 2],
}

impl Component for MlOmnibox {
    type Message = Msg;
    type Properties = MlOmniboxProps;

    fn create(ctx: &Context<Self>) -> Self {
        // Commands
        let (commands, _handle) = ctx
            .link()
            .get_commands(ctx.link().callback(Msg::CommandsUpdated))
            .unwrap();
        let all_commands = StringLookupCommands::with_commands(commands.commands.iter().cloned());
        let disabled = ctx.props().ml_data.sum() == 0;
        let next_search = Command {
            name: "Go to next matching loop".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: false }),
            keyboard_shortcut: ShortcutKey::empty(Key::Enter),
            disabled,
        };
        let next_search = (commands.register)(next_search);
        let prev_search = Command {
            name: "Go to previous matching loop".to_string(),
            execute: ctx.link().callback(|_| Msg::Select { left: true }),
            keyboard_shortcut: ShortcutKey::shift(Key::Enter),
            disabled,
        };
        let prev_search = (commands.register)(prev_search);
        let _commands_search = [next_search, prev_search];
        Self {
            focused: false,
            command_mode: false,
            input: None,
            picked: PickedSuggestion::default_simple(ctx.props().ml_data),
            all_commands,
            scroll_container: NodeRef::default(),
            scroll_into_view: NodeRef::default(),
            _handle,
            _commands_search,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Select { left } => {
                let Some(picked) = &mut self.picked else {
                    return false;
                };
                let number = picked
                    .ml_idx
                    .map(|i| {
                        if left {
                            if i == 0 {
                                ctx.props().ml_data.sum() - 1
                            } else {
                                i - 1
                            }
                        } else if i + 1 == ctx.props().ml_data.sum() {
                            0
                        } else {
                            i + 1
                        }
                    })
                    .unwrap_or_default();
                picked.ml_idx = Some(number);
                ctx.props().pick_nth_ml.emit(picked.ml_idx.unwrap());
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
        let omnibox_info = ctx
            .props()
            .message
            .as_ref()
            .map(|m| AttrValue::from(m.message.clone()));
        let icon = ctx
            .props()
            .message
            .as_ref()
            .is_some_and(|m| matches!(m.kind, OmniboxMessageKind::Error))
            .then_some("error");

        let omnibox_disabled = omnibox_info.is_some();
        let icon = icon.unwrap_or({
            if omnibox_disabled {
                "info"
            } else if self.command_mode {
                "chevron_right"
            } else {
                "loop"
            }
        });
        let icon = html! { {icon} };
        let placeholder = omnibox_info.unwrap_or_else(|| {
            if self.command_mode {
                return AttrValue::from("Filter commands...");
            };
            let text = match ctx.props().ml_data {
                MlData {
                    sure_mls: 0,
                    maybe_mls: 0,
                } => "No matching loops found".to_string(),
                MlData {
                    sure_mls,
                    maybe_mls: 0,
                } => format!("Found {sure_mls} matching loop(s)"),
                MlData {
                    sure_mls: 0,
                    maybe_mls,
                } => format!("Found {maybe_mls} repeating chain(s)"),
                MlData {
                    sure_mls,
                    maybe_mls,
                } => format!("Found {sure_mls} matching loop(s), {maybe_mls} repeating chain(s)"),
            };
            AttrValue::from(text)
        });
        let onkeyup = Callback::from(|ev: KeyboardEvent| {
            ev.stop_propagation();
            ev.cancel_bubble();
        });
        let stepthrough = if ctx.props().ml_data.sum() > 0 {
            self.picked.as_ref().map(|picked| {
            let ml_idx = picked.ml_idx.map(|i| (i + 1).to_string()).unwrap_or_else(|| "?".to_string());
            let left = ctx.link().callback(|_| Msg::Select { left: true });
            let right = ctx.link().callback(|_| Msg::Select { left: false });
            html! {
            <>
                <div class="current">{ml_idx}{" / "}{ctx.props().ml_data.sum()}</div>
                <button onclick={left}><i class="material-icons left">{"keyboard_arrow_left"}</i></button>
                <button onclick={right}><i class="material-icons right">{"keyboard_arrow_right"}</i></button>
            </>
            }
        })
        } else {
            None
        };
        let input = (!omnibox_disabled)
            .then(|| self.input.clone())
            .unwrap_or_default();
        html! {
            <div class="omnibox" {onkeyup}>
                <div class="icon">{icon}</div>
                <MlOmniboxInput {placeholder} omnibox_disabled={true} focused={self.focused} {input} />
                <div class="stepthrough">{stepthrough}</div>
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
        let last_used_order =
            |lu: Option<usize>| usize::MAX - lu.map(|lu| usize::MAX - lu).unwrap_or_default();
        (
            self.command.disabled,
            last_used_order(self.last_used),
            u16::MAX - self.score,
            self.command.name.as_str(),
            self.id,
        )
            .cmp(&(
                other.command.disabled,
                last_used_order(other.last_used),
                u16::MAX - other.score,
                other.command.name.as_str(),
                other.id,
            ))
    }
}
