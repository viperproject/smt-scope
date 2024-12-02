use std::num::NonZeroUsize;

use yew::{html::Scope, Callback, Context};

use crate::{
    commands::{Command, CommandRef, CommandsContext, ShortcutKey},
    filters::FiltersState,
    results::filters::Filter,
    screen::Manager,
};

use super::GraphM;

pub struct FilterChain {
    pub(super) new_filter_chain: Vec<Filter>,
    filter_chain_history: Vec<Vec<Filter>>,
    filter_chain_history_idx: usize,
    undo: CommandRef,
    redo: CommandRef,
}

pub enum RenderCommand {
    Full { all: Vec<Filter>, first: bool },
    Partial { skipped: usize, extra: Vec<Filter> },
}

impl RenderCommand {
    pub fn is_first(&self) -> bool {
        matches!(self, Self::Full { first: true, .. })
    }
    pub fn is_full(&self) -> bool {
        matches!(self, Self::Full { .. })
    }
    pub fn filters(&self) -> impl Iterator<Item = (bool, usize, &Filter)> {
        let (can_select, skipped, filters) = match self {
            Self::Full { all, .. } => (false, 0, all),
            Self::Partial { skipped, extra } => (true, *skipped, extra),
        };
        filters.iter().enumerate().map(move |(idx, filter)| {
            (
                can_select && idx == filters.len() - 1,
                skipped + idx,
                filter,
            )
        })
    }
}

impl FilterChain {
    pub fn new(initial: Vec<Filter>, link: &Scope<Manager>) -> Self {
        let registerer = link.get_commands_registerer().unwrap();
        let undo = Command {
            name: "Undo".to_string(),
            execute: link.callback(|_| GraphM::UndoOperation(true)),
            keyboard_shortcut: ShortcutKey::undo(),
            disabled: true,
        };
        let undo = (*registerer)(undo);
        let redo = Command {
            name: "Redo".to_string(),
            execute: link.callback(|_| GraphM::UndoOperation(false)),
            keyboard_shortcut: ShortcutKey::redo(),
            disabled: true,
        };
        let redo = (*registerer)(redo);

        let self_ = Self {
            new_filter_chain: initial.clone(),
            filter_chain_history: vec![initial.clone()],
            filter_chain_history_idx: 0,
            undo,
            redo,
        };
        link.send_message(GraphM::RenderCommand(
            RenderCommand::Full {
                all: initial,
                first: true,
            },
            false,
        ));
        self_
    }

    fn applied_chain(&self) -> &Vec<Filter> {
        &self.filter_chain_history[self.filter_chain_history_idx]
    }

    fn rerender_command(from: &[Filter], to: &[Filter]) -> RenderCommand {
        if from.len() < to.len() && from == &to[..from.len()] {
            let skipped = from.len();
            RenderCommand::Partial {
                skipped,
                extra: to[skipped..].to_vec(),
            }
        } else {
            RenderCommand::Full {
                all: to.to_vec(),
                first: false,
            }
        }
    }

    fn send_render_command(&self, link: &Scope<Manager>, filter_only: bool) {
        let command = Self::rerender_command(self.applied_chain(), &self.new_filter_chain);
        link.send_message(GraphM::RenderCommand(command, filter_only));
    }

    pub fn update_history(&self) {
        self.undo.set_disabled(self.filter_chain_history_idx == 0);
        self.redo
            .set_disabled(self.filter_chain_history_idx + 1 >= self.filter_chain_history.len());
    }

    pub fn send_updates(&mut self, link: &Scope<Manager>) -> bool {
        if &self.new_filter_chain == self.applied_chain() {
            return false;
        }
        self.send_render_command(link, false);

        self.filter_chain_history_idx += 1;
        self.filter_chain_history
            .truncate(self.filter_chain_history_idx);
        self.filter_chain_history
            .push(self.new_filter_chain.clone());
        self.update_history();
        true
    }

    pub fn undo_operation(&mut self, link: &Scope<Manager>, undo: bool, filter_only: bool) -> bool {
        let new = if undo {
            if self.filter_chain_history_idx == 0 {
                log::error!("Undoing when no history");
                return false;
            };
            self.filter_chain_history_idx - 1
        } else {
            if self.filter_chain_history_idx + 1 >= self.filter_chain_history.len() {
                log::error!("Redoing when no future");
                return false;
            }
            self.filter_chain_history_idx + 1
        };
        self.new_filter_chain
            .clone_from(&self.filter_chain_history[new]);

        self.send_render_command(link, filter_only);

        self.filter_chain_history_idx = new;
        self.update_history();
        true
    }
}
