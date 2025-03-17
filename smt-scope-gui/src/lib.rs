use std::sync::{Mutex, OnceLock, RwLock};

use gloo::timers::callback::Timeout;
use material_yew::{MatDialog, MatIconButton, WeakComponentLink};
use web_sys::HtmlElement;
use yew::html::Scope;
use yew::prelude::*;

use crate::commands::{Command, CommandRef, CommandsContext, CommandsProvider, ShortcutKey};
use crate::configuration::ConfigurationProvider;

use crate::infobars::{OmniboxMessage, OmniboxMessageKind, SidebarSectionHeader, Topbar};
use crate::screen::{
    extra,
    homepage::Homepage,
    manager::{NestedScreen, NestedScreenM},
    Manager, Screen,
};

pub use global_callbacks::{CallbackRef, GlobalCallbacksContext, GlobalCallbacksProvider};
pub use utils::position::*;

pub mod commands;
pub mod configuration;
mod global_callbacks;
mod infobars;
pub mod screen;
pub mod shortcuts;
mod utils;
pub mod worker;

#[derive(Clone, PartialEq)]
struct OmniboxMessageContext {
    send: Callback<(OmniboxMessage, u32)>,
    clear: Callback<()>,
}

pub trait OmniboxContext {
    /// Display `message` in the omnibox for `millis` milliseconds.
    fn omnibox_message(&self, message: OmniboxMessage, millis: u32);
    /// Clear any messages displayed in the omnibox.
    fn clear_omnibox(&self);
}

impl<S: Screen> OmniboxContext for Scope<Manager<S>> {
    fn omnibox_message(&self, message: OmniboxMessage, millis: u32) {
        let sender: OmniboxMessageContext = self.context(Callback::noop()).unwrap().0;
        sender.send.emit((message, millis));
    }
    fn clear_omnibox(&self) {
        let sender: OmniboxMessageContext = self.context(Callback::noop()).unwrap().0;
        sender.clear.emit(());
    }
}

pub const GIT_DESCRIBE: &str = env!("VERGEN_GIT_DESCRIBE");
pub fn version() -> Option<semver::Version> {
    let version = GIT_DESCRIBE.strip_prefix('v')?;
    semver::Version::parse(version)
        .ok()
        .filter(|v| v.pre.is_empty())
}

pub static MOUSE_POSITION: OnceLock<RwLock<PagePosition>> = OnceLock::new();
pub fn mouse_position() -> &'static RwLock<PagePosition> {
    MOUSE_POSITION.get_or_init(RwLock::default)
}
pub static PREVENT_DEFAULT_DRAG_OVER: OnceLock<Mutex<bool>> = OnceLock::new();

pub enum WindowM {
    ShowMessage((OmniboxMessage, u32)),
    ClearMessage,
    ShowHelpToggled(bool),
    ToggleSidebar,

    NestedUpdate(NestedScreenM),
}

pub struct Window {
    nested_screen: NestedScreen,
    sidebar_html: Vec<Html>,
    omc: OmniboxMessageContext,

    pending_ops: usize,
    message: Option<(Timeout, OmniboxMessage)>,
    help_dialog: WeakComponentLink<MatDialog>,
    sidebar_ref: NodeRef,
    sidebar_closed: bool,

    _callback_refs: [CallbackRef; 2],
    _command_refs: [CommandRef; 2],
}

impl Window {
    pub fn set_message(&mut self, link: &Scope<Self>, message: OmniboxMessage, millis: u32) {
        log::info!("Showing message: {message:?}");

        let clear_error = link.callback(|_| WindowM::ClearMessage);
        let message = (Timeout::new(millis, move || clear_error.emit(())), message);
        let old_message = self.message.replace(message);
        if let Some((timeout, _)) = old_message {
            timeout.cancel();
        }
    }
    pub fn clear_message(&mut self, error_only: bool) {
        if let Some((timeout, message)) = self.message.take() {
            if error_only && !matches!(message.kind, OmniboxMessageKind::Error) {
                self.message = Some((timeout, message));
            } else {
                timeout.cancel();
            }
        }
    }
}

impl Component for Window {
    type Message = WindowM;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        let help_dialog = WeakComponentLink::<MatDialog>::default();
        let nested_screen = NestedScreen::new(ctx.link().callback(WindowM::NestedUpdate));

        // Global Callbacks
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mouse_move_ref =
            (registerer.register_mouse_move)(Callback::from(|event: MouseEvent| {
                *mouse_position().write().unwrap() = PagePosition::from(&event);
            }));
        let drag_over_ref = (registerer.register_drag_over)(Callback::from(|event: DragEvent| {
            *mouse_position().write().unwrap() = PagePosition::from(&event);
        }));
        let _callback_refs = [mouse_move_ref, drag_over_ref];

        // Commands
        let commands = ctx.link().get_commands_registerer().unwrap();
        let help_dialog_ref = help_dialog.clone();
        let help_cmd = Command {
            name: "Show help".to_string(),
            execute: Callback::from(move |_| help_dialog_ref.show()),
            keyboard_shortcut: ShortcutKey::empty('?'),
            disabled: false,
        };
        let help_cmd = (commands)(help_cmd);
        let hide_sidebar_cmd = Command {
            name: "Toggle left sidebar".to_string(),
            execute: ctx.link().callback(move |()| WindowM::ToggleSidebar),
            keyboard_shortcut: ShortcutKey::cmd('b'),
            disabled: false,
        };
        let hide_sidebar_cmd = (commands)(hide_sidebar_cmd);
        let _command_refs = [help_cmd, hide_sidebar_cmd];
        Self {
            nested_screen,
            sidebar_html: Vec::new(),
            omc: OmniboxMessageContext {
                send: ctx.link().callback(WindowM::ShowMessage),
                clear: ctx.link().callback(|_| WindowM::ClearMessage),
            },

            pending_ops: 0,
            message: None,
            help_dialog,
            sidebar_ref: NodeRef::default(),
            sidebar_closed: false,

            _callback_refs,
            _command_refs,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            WindowM::NestedUpdate(update) => {
                let old = self.nested_screen.update(update);
                if let NestedScreenM::Sidebar(old) = old {
                    let sidebar_html = core::mem::take(&mut self.sidebar_html);
                    let mut sidebar_html: Vec<_> = old.iter().zip(sidebar_html).collect();

                    let sidebar = self.nested_screen.sidebar();
                    let sidebar_html = (**sidebar).clone().into_iter().map(|s| {
                        let idx = sidebar_html.iter().position(|(o, _)| *o == &s);
                        if let Some(idx) = idx {
                            return sidebar_html.swap_remove(idx).1;
                        }

                        let elements = s.elements.into_iter().filter_map(|e| match e {
                            extra::ElementKind::Simple(simple_button) => if simple_button.disabled {
                                None
                            } else {
                                Some(simple_button.to_html())
                            },
                            extra::ElementKind::Custom(data) => Some(data),
                        }).collect::<Html>();
                        html! {
                            <SidebarSectionHeader section={s.ref_.clone()} header_text={s.header_text} collapsed_text={s.collapsed_text}><ul>
                                {elements}
                            </ul></SidebarSectionHeader>
                        }
                    }).collect();
                    self.sidebar_html = sidebar_html;
                }
                true
            }

            WindowM::ShowMessage((message, millis)) => {
                self.set_message(ctx.link(), message, millis);
                true
            }
            WindowM::ClearMessage => {
                if let Some((timeout, _)) = self.message.take() {
                    timeout.cancel();
                }
                true
            }

            WindowM::ShowHelpToggled(..) => false,
            WindowM::ToggleSidebar => {
                let Some(sidebar) = self.sidebar_ref.cast::<HtmlElement>() else {
                    return false;
                };
                self.sidebar_closed = !self.sidebar_closed;
                if self.sidebar_closed {
                    sidebar.class_list().add_1("hide-sidebar").ok();
                } else {
                    sidebar.class_list().remove_1("hide-sidebar").ok();
                }
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        // Parse the timestamp at compile time
        let timestamp =
            chrono::DateTime::parse_from_rfc3339(env!("VERGEN_GIT_COMMIT_TIMESTAMP")).unwrap();
        // Format using https://docs.rs/chrono/latest/chrono/format/strftime/index.html
        let version_info = format!(
            "{} ({})",
            env!("VERGEN_GIT_DESCRIBE"),
            timestamp.format("%H:%M %-d %b %y")
        );
        let version_link = format!(
            "https://github.com/viperproject/smt-scope/tree/{}",
            env!("VERGEN_GIT_SHA")
        );
        let is_canary = version().is_none();
        let header_class = if is_canary { "canary" } else { "stable" };

        // Callbacks

        let toggle_sidebar = ctx.link().callback(move |ev: MouseEvent| {
            ev.prevent_default();
            WindowM::ToggleSidebar
        });
        let onopened = ctx.link().callback(|_| WindowM::ShowHelpToggled(true));
        let onclosed = ctx.link().callback(|_| WindowM::ShowHelpToggled(false));

        // Topbar/omnibar

        let topbar = self.nested_screen.topbar().clone();
        let omnibox = self.nested_screen.omnibox().clone();
        let message = self.message.as_ref().map(|(_, message)| message).cloned();
        let sidebar_closed = self.sidebar_closed;

        // Sidebar

        let sidebar_html: Html = self.sidebar_html.clone().into_iter().collect();

        // Main page

        let initial = self.help_dialog.clone();
        let homepage = self.nested_screen.view::<Homepage>(initial);

        html! {<>
            <nav class="sidebar" ref={&self.sidebar_ref}>
                <header class={header_class}><img src="html/logo_side_small.png" class="brand"/><div class="sidebar-button" onmousedown={toggle_sidebar}><MatIconButton icon="menu"></MatIconButton></div></header>
                <div class="sidebar-scroll"><div class="sidebar-scroll-container">
                    {sidebar_html}
                    <div class="sidebar-footer">
                        <div title="Number of pending operations" class="dbg-info-square"><div>{"OPS"}</div><div>{self.pending_ops}</div></div>
                        <div title="Service Worker: Serving from cache not implemented yet." class="dbg-info-square amber"><div>{"SW"}</div><div>{"NA"}</div></div>
                        <div class="version"><a href={version_link} title="Channel: stable" target="_blank">{version_info}</a></div>
                    </div>
                </div></div>
            </nav>
            <Topbar {topbar} {omnibox} {message} {sidebar_closed} />
            <div class="alerts"></div>

            <ContextProvider<OmniboxMessageContext> context={self.omc.clone()}>
                <div class="page">{homepage}</div>
            </ContextProvider<OmniboxMessageContext>>

            // Shortcuts dialog
            <shortcuts::Shortcuts noderef={self.help_dialog.clone()} {onopened} {onclosed}/>
        </>}
    }
}

#[function_component]
pub fn App() -> Html {
    html! {
        <main><GlobalCallbacksProvider><ConfigurationProvider><CommandsProvider>
            <Window/>
        </CommandsProvider></ConfigurationProvider></GlobalCallbacksProvider></main>
    }
}
