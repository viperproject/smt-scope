use std::{
    cmp::Ordering,
    ops::{Deref, DerefMut},
    rc::Rc,
};

use fxhash::FxHashMap;
use gloo::timers::callback::Timeout;
use smt_log_parser::analysis::{visible::VisibleInstGraph, RawNodeIndex};
use web_sys::{HtmlElement, HtmlInputElement};
use yew::{
    function_component, html, prelude::Context, Callback, Children, Component, ContextHandle, Html,
    InputEvent, KeyboardEvent, MouseEvent, NodeRef, Properties,
};

use crate::{
    commands::{Command, CommandId, CommandRef, Commands, Key, ShortcutKey},
    infobars::{topbar::OmniboxMessage, DropdownButton, OmniboxMessageKind},
    screen::extra,
    RcParser,
};

use self::{
    commands::CommandsContext,
    mode::{OmniboxMode, SearchMode},
    search::SuggestionResults,
};

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
        self.mode.update(&ctx.props().omnibox, &self.commands);
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            OmniboxM::KeyDownTyping(ev) => {
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

// #[derive(Debug)]
// pub struct SearchActionResult {
//     pub query: String,
//     pub indices: Vec<u32>,
//     pub groups: Vec<SearchActionGroup>,
// }

// impl SearchActionResult {
//     pub fn new(
//         query: String,
//         matches: Matches<'_, FxHashMap<Kind, Entry>>,
//         parser: &RcParser,
//         visible: Option<&VisibleInstGraph>,
//     ) -> Self {
//         let groups = matches
//             .matches
//             .into_iter()
//             .enumerate()
//             .map(|(idx, (score, matched, values))| {
//                 let actions = values
//                     .iter()
//                     .map(|(kind, entry)| {
//                         let visible = if let (Some(graph), Some(visible)) = (&parser.graph, visible)
//                         {
//                             entry.count_visible(&graph.borrow(), visible)
//                         } else {
//                             0
//                         };
//                         let hue = entry
//                             .qidx
//                             .map(|qidx| parser.colour_map.get_rbg_hue(Some(qidx)));
//                         let arguments = entry
//                             .tidx
//                             .map(|tidx| (&*parser.parser.borrow())[tidx].child_ids.len());
//                         SearchAction {
//                             count: entry.count(),
//                             visible,
//                             kind: *kind,
//                             hue,
//                             arguments,
//                         }
//                     })
//                     .collect();
//                 SearchActionGroup {
//                     score,
//                     idx,
//                     name: matched.to_string(),
//                     actions,
//                 }
//             })
//             .collect();
//         SearchActionResult {
//             query,
//             indices: matches.indices,
//             groups,
//         }
//     }
// }

// #[derive(Debug)]
// pub struct SearchActionGroup {
//     pub score: u16,
//     pub idx: usize,
//     pub name: String,
//     pub actions: Vec<SearchAction>,
// }

// #[derive(Debug, Clone, Copy, PartialEq)]
// pub struct SearchAction {
//     pub count: usize,
//     pub visible: usize,
//     pub kind: crate::utils::lookup::Kind,
//     pub hue: Option<f64>,
//     pub arguments: Option<usize>,
// }
