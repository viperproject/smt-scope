use std::rc::Rc;

use gloo::timers::callback::Timeout;
use web_sys::{HtmlElement, HtmlInputElement};
use yew::{prelude::Context, Component, Html, InputEvent, KeyboardEvent, NodeRef, Properties};

use crate::{commands::Commands, infobars::topbar::OmniboxMessage, screen::extra};

use self::{commands::CommandsContext, mode::OmniboxMode};

use super::{DropdownContext, DropdownIdx};

mod commands;
mod mode;
mod search;
mod view;

#[derive(Properties, Clone, PartialEq)]
pub struct OmniboxProps {
    pub omnibox: Rc<extra::Omnibox>,
    pub message: Option<OmniboxMessage>,
    pub idx: DropdownIdx,
}

pub enum OmniboxM {
    Input(InputEvent),
    KeyDownTyping(KeyboardEvent),
    Picked(usize),
    Select { left: bool },
    Focus(bool),
    CommandsUpdated(Rc<Commands>),
}

pub struct Omnibox {
    omnibox: NodeRef,
    mode: OmniboxMode,
    commands: CommandsContext,
    scroll_container: NodeRef,
    scroll_into_view: NodeRef,
}

impl Component for Omnibox {
    type Message = OmniboxM;
    type Properties = OmniboxProps;

    fn create(ctx: &Context<Self>) -> Self {
        let commands = CommandsContext::new(ctx);
        let mode = OmniboxMode::new(&ctx.props().omnibox, &commands);
        Self {
            omnibox: NodeRef::default(),
            mode,
            commands,
            scroll_container: NodeRef::default(),
            scroll_into_view: NodeRef::default(),
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        if !Rc::ptr_eq(&ctx.props().omnibox, &old_props.omnibox) {
            self.mode.update(&ctx.props().omnibox, &self.commands);
        }
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            OmniboxM::KeyDownTyping(ev) => {
                ev.stop_propagation();
                ev.cancel_bubble();
                let changed = self
                    .mode
                    .on_key(ctx.link(), &self.commands, ev.key().as_str());
                if changed {
                    ev.prevent_default();
                }
                changed
            }
            OmniboxM::Input(_ev) => {
                let omnibox = self.omnibox.cast::<HtmlInputElement>();
                let text = omnibox.map(|r| r.value()).unwrap_or_default();
                self.mode.on_input(&self.commands, text);
                true
            }
            OmniboxM::Focus(focused) => {
                let change_focus = if focused {
                    self.mode.focus(&self.commands)
                } else {
                    self.mode.blur()
                };

                if change_focus {
                    // Delay omnibox focus/blur as the `omnibox` NodeRef is about to be updated.
                    let omnibox = self.omnibox.clone();
                    Timeout::new(1, move || {
                        let Some(omnibox) = omnibox.cast::<HtmlInputElement>() else {
                            return;
                        };
                        if focused {
                            omnibox.focus().ok();
                            omnibox.select();
                        } else {
                            omnibox.blur().ok();
                        }
                    })
                    .forget();
                }

                change_focus
            }
            OmniboxM::Picked(ridx) => {
                self.mode
                    .pick(&ctx.props().omnibox, &mut self.commands, ridx);
                ctx.link()
                    .toggle_dropdown(Some(false))
                    .expect("Internal error E191: failed to disable dropdown");
                true
            }
            OmniboxM::Select { left } => {
                self.mode.select(&ctx.props().omnibox, left);
                true
            }
            OmniboxM::CommandsUpdated(commands) => {
                self.commands.update_commands(&commands);
                self.mode.update_commands(&self.commands)
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        self.view_mode(ctx.props())
            .view(ctx.link(), &self.omnibox, ctx.props().idx)
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
