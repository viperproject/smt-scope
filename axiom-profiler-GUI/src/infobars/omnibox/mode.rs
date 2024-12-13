use yew::html::Scope;

use crate::{infobars::DropdownContext, screen::extra};

use super::{
    commands::{CommandSearchResults, CommandsContext},
    search::{OmniboxSearch, PickedSuggestion, SuggestionResults},
    Omnibox, OmniboxM,
};

use OmniboxMode::*;
use SearchKind::*;

pub enum OmniboxMode {
    Disabled,
    Search(Box<SearchMode>),
    Choose(Option<usize>),
}

impl OmniboxMode {
    pub fn new(omnibox: &extra::Omnibox, commands: &CommandsContext) -> Self {
        match omnibox {
            extra::Omnibox::Search(omnibox) => {
                commands.can_search(true);
                commands.can_select(false);
                Search(Box::new(SearchMode {
                    search: SearchMode::mk_search(omnibox),
                    input: String::new(),
                    kind: BlurNone,
                }))
            }
            extra::Omnibox::Choose(choose) => {
                commands.can_search(false);
                commands.can_select(true);
                Choose(choose.initial)
            }
            extra::Omnibox::Loading(..) | extra::Omnibox::Message(..) => {
                commands.can_search(false);
                commands.can_select(false);
                Disabled
            }
        }
    }

    pub fn update(&mut self, omnibox: &extra::Omnibox, commands: &CommandsContext) {
        match (&mut *self, omnibox) {
            (Search(sm), extra::Omnibox::Search(omnibox)) => {
                sm.update(omnibox, commands);
            }
            (Choose(selection), extra::Omnibox::Choose(select)) if selection.is_some() => {
                if selection.unwrap() >= select.choose_from {
                    *selection = select.initial;
                }
            }
            _ => *self = Self::new(omnibox, commands),
        }
    }

    pub fn update_commands(&mut self, commands: &CommandsContext) -> bool {
        match self {
            Search(sm) => sm.update_commands(commands),
            _ => false,
        }
    }

    pub fn focus(&mut self, commands: &CommandsContext) -> bool {
        match self {
            Search(sm) => sm.focus(commands),
            Disabled | Choose(..) => false,
        }
    }

    pub fn blur(&mut self) -> bool {
        match self {
            Search(sm) => sm.blur(),
            Disabled | Choose(..) => false,
        }
    }

    pub fn on_input(&mut self, commands: &CommandsContext, text: String) {
        match self {
            Disabled | Choose(..) => unreachable!(),
            Search(sm) => sm.on_input(commands, text),
        }
    }

    pub fn on_key(&mut self, link: &Scope<Omnibox>, commands: &CommandsContext, key: &str) -> bool {
        match self {
            Disabled | Choose(..) => unreachable!(),
            Search(sm) => sm.on_key(link, commands, key),
        }
    }

    pub fn pick(&mut self, omnibox: &extra::Omnibox, commands: &mut CommandsContext, ridx: usize) {
        match self {
            Disabled | Choose(..) => unreachable!(),
            Search(sm) => {
                let extra::Omnibox::Search(omnibox) = omnibox else {
                    unreachable!()
                };
                sm.pick(omnibox, commands, ridx)
            }
        }
    }

    pub fn select(&mut self, omnibox: &extra::Omnibox, left: bool) {
        match self {
            Disabled => unreachable!(),
            Search(sm) => {
                let extra::Omnibox::Search(omnibox) = omnibox else {
                    unreachable!()
                };
                sm.select(omnibox, left);
            }
            Choose(chosen) => {
                let extra::Omnibox::Choose(omnibox) = omnibox else {
                    unreachable!()
                };
                let Some(max_val) = omnibox.choose_from.checked_sub(1) else {
                    return;
                };

                let new = chosen
                    .map(|s| match (s, left) {
                        (0, true) => max_val,
                        (n, true) => n - 1,
                        (n, false) if n == max_val => 0,
                        (n, false) => n + 1,
                    })
                    .unwrap_or_default();
                *chosen = Some(new);
                omnibox.choose.emit(new);
            }
        }
    }
}

pub struct SearchMode {
    search: OmniboxSearch,
    pub input: String,
    pub kind: SearchKind,
}

impl SearchMode {
    fn update(&mut self, omnibox: &extra::OmniboxSearch, commands: &CommandsContext) {
        let new = Self::mk_search(omnibox);
        if new == self.search {
            return;
        }
        self.search = new;

        match self.kind {
            BlurNone if self.input.is_empty() => return,
            FocusCommand { .. } => return,
            _ => (),
        }

        let matches = self.search.get_fuzzy(&self.input);
        let results = SuggestionResults::new(self.input.clone(), matches);
        let new_select = results.exact_match();
        match (&mut self.kind, new_select) {
            (FocusCommand { .. }, _) => unreachable!(),
            // Select same
            (BlurNone, None) => (),
            (
                BlurSelecting {
                    results: old_results,
                    select,
                },
                Some(new_select),
            ) => {
                *old_results = results;
                *select = new_select;
            }
            // Select different
            (BlurNone, Some(select)) => {
                commands.can_select(true);
                self.kind = BlurSelecting { results, select };
            }
            (BlurSelecting { .. }, None) => {
                commands.can_select(false);
                self.kind = BlurNone;
            }
            // Focus
            (FocusSearch { .. }, _) => {
                self.handle_focus_search_new(commands, results);
            }
        }
    }

    fn update_commands(&mut self, commands: &CommandsContext) -> bool {
        match &mut self.kind {
            FocusCommand {
                results,
                highlighted,
            } => {
                let new = commands.search(&self.input);
                if new == *results {
                    return false;
                }
                *results = new;
                *highlighted = 0;
                true
            }
            _ => false,
        }
    }

    fn focus(&mut self, commands: &CommandsContext) -> bool {
        match self.kind {
            BlurSelecting { .. } => {
                let old = core::mem::replace(&mut self.kind, BlurNone);
                let BlurSelecting { results, select } = old else {
                    unreachable!()
                };
                self.kind = FocusSearch {
                    highlighted: select.ridx,
                    results,
                    select: Some(select),
                };
                true
            }
            BlurNone => {
                self.move_to_focus_search(commands);
                true
            }
            FocusSearch { .. } | FocusCommand { .. } => {
                log::error!("Trying to focus a mode which is already focused!");
                false
            }
        }
    }

    fn blur(&mut self) -> bool {
        match self.kind {
            FocusSearch { .. } => {
                let old = core::mem::replace(&mut self.kind, BlurNone);
                let FocusSearch {
                    results, select, ..
                } = old
                else {
                    unreachable!()
                };
                if let Some(select) = select {
                    self.kind = BlurSelecting { results, select };
                }
                true
            }
            FocusCommand { .. } => {
                self.input = String::new();
                self.kind = BlurNone;
                true
            }
            BlurNone | BlurSelecting { .. } => {
                log::error!("Trying to blur a mode which is already blurred!");
                false
            }
        }
    }

    fn on_input(&mut self, commands: &CommandsContext, text: String) {
        match &mut self.kind {
            BlurNone | BlurSelecting { .. } => unreachable!(),
            FocusSearch { .. } => {
                self.input = text;

                let matches = self.search.get_fuzzy(&self.input);
                let results = SuggestionResults::new(self.input.clone(), matches);
                self.handle_focus_search_new(commands, results);
            }
            FocusCommand {
                highlighted,
                results,
            } => {
                self.input = text;

                *results = commands.search(&self.input);
                *highlighted = 0;
            }
        }
    }

    fn on_key(&mut self, link: &Scope<Omnibox>, commands: &CommandsContext, key: &str) -> bool {
        let (search, highlighted, max_val) = match &mut self.kind {
            BlurNone | BlurSelecting { .. } => unreachable!(),
            FocusSearch {
                highlighted,
                results,
                ..
            } => (true, highlighted, results.len()),
            FocusCommand {
                highlighted,
                results,
            } => (false, highlighted, results.enabled_commands),
        };

        match key {
            "Backspace" if self.input.is_empty() && !search => {
                assert!(matches!(self.kind, FocusCommand { .. }));
                self.move_to_focus_search(commands)
            }
            "Escape" => match self.kind {
                FocusCommand { .. } => {
                    self.input = String::new();
                    self.move_to_focus_search(commands)
                }
                FocusSearch { .. } => link
                    .toggle_dropdown(Some(false))
                    .expect("Internal error E190: failed to disable dropdown"),
                BlurNone | BlurSelecting { .. } => unreachable!(),
            },
            "Enter" => {
                link.send_message(OmniboxM::Picked(*highlighted));
                return false;
            }
            ">" if self.input.is_empty() && search => self.move_to_empty_command(commands),
            "ArrowUp" => *highlighted = highlighted.saturating_sub(1),
            "ArrowDown" => *highlighted = highlighted.saturating_add(1).min(max_val),
            _ => return false,
        };
        true
    }

    fn pick(
        &mut self,
        omnibox: &extra::OmniboxSearch,
        commands: &mut CommandsContext,
        ridx: usize,
    ) {
        // Do not switch mode, that will be done by the blur which gets called
        // due to closing the dropdown.
        match &mut self.kind {
            BlurNone | BlurSelecting { .. } => unreachable!(),
            FocusSearch {
                results, select, ..
            } => {
                let default = PickedSuggestion {
                    ridx,
                    choice_idx: None,
                };
                let new = select.filter(|s| s.ridx == ridx).unwrap_or(default);
                *select = Some(new);
                commands.can_select(true);

                let entry = new.index(results, omnibox);
                self.input = entry.search_text.clone();
            }
            FocusCommand { results, .. } => {
                let mut enabled = results.commands.iter().filter(|c| !c.command.disabled);
                let Some(c) = enabled.nth(ridx) else {
                    return;
                };
                commands.use_command(c.id);
                c.command.execute.emit(());
            }
        }
    }

    fn select(&mut self, omnibox: &extra::OmniboxSearch, left: bool) {
        let Some((results, select)) = self.kind.get_chosen_mut() else {
            unreachable!()
        };
        let result = select.index(results, omnibox);
        let Some(max_val) = result.select_from.checked_sub(1) else {
            return;
        };

        let new = select
            .choice_idx
            .map(|s| match (s, left) {
                (0, true) => max_val,
                (n, true) => n - 1,
                (n, false) if n == max_val => 0,
                (n, false) => n + 1,
            })
            .unwrap_or_default();
        select.choice_idx = Some(new);
        result.select.emit(new);
    }

    // Internal methods

    fn move_to_focus_search(&mut self, commands: &CommandsContext) {
        let matches = self.search.get_fuzzy(&self.input);
        let results = SuggestionResults::new(self.input.clone(), matches);

        let select = results.exact_match();
        let highlighted = select.map(|s| s.ridx).unwrap_or_default();
        match &mut self.kind {
            BlurNone | FocusCommand { .. } => {
                if select.is_some() {
                    commands.can_select(true);
                }
                self.kind = FocusSearch {
                    highlighted,
                    results,
                    select,
                };
            }
            FocusSearch { .. } | BlurSelecting { .. } => unreachable!(),
        }
    }

    fn move_to_empty_command(&mut self, commands: &CommandsContext) {
        let FocusSearch { select, .. } = self.kind else {
            unreachable!()
        };
        if select.is_some() {
            commands.can_select(false);
        }
        self.kind = FocusCommand {
            highlighted: 0,
            results: commands.search(""),
        };
    }

    fn handle_focus_search_new(&mut self, commands: &CommandsContext, results: SuggestionResults) {
        let select = results.exact_match();
        let highlighted = select.map(|s| s.ridx).unwrap_or_default();
        let FocusSearch {
            highlighted: oh,
            results: or,
            select: os,
        } = &mut self.kind
        else {
            unreachable!()
        };
        *oh = highlighted;
        *or = results;
        Self::set_select(commands, os, select);
    }

    fn set_select(
        commands: &CommandsContext,
        old: &mut Option<PickedSuggestion>,
        new: Option<PickedSuggestion>,
    ) {
        let old = core::mem::replace(old, new);
        if old.is_some() != new.is_some() {
            commands.can_select(new.is_some());
        }
    }

    fn mk_search(omnibox: &extra::OmniboxSearch) -> OmniboxSearch {
        let mut search = OmniboxSearch::default();
        for (cidx, category) in omnibox.iter().enumerate() {
            for (eidx, entry) in category.entries.iter().enumerate() {
                let entry = search.get_or_insert_default(&entry.search_text);
                entry.push((cidx, eidx));
            }
        }
        search
    }
}

#[derive(Debug)]
pub enum SearchKind {
    BlurNone,
    BlurSelecting {
        results: SuggestionResults,
        select: PickedSuggestion,
    },
    FocusSearch {
        highlighted: usize,
        results: SuggestionResults,
        select: Option<PickedSuggestion>,
    },
    FocusCommand {
        highlighted: usize,
        results: CommandSearchResults,
    },
}

impl SearchKind {
    pub fn get_chosen(&self) -> Option<(&SuggestionResults, PickedSuggestion)> {
        match self {
            BlurSelecting { results, select }
            | FocusSearch {
                results,
                select: Some(select),
                ..
            } => Some((results, *select)),
            BlurNone | FocusCommand { .. } | FocusSearch { select: None, .. } => None,
        }
    }

    pub fn get_chosen_mut(&mut self) -> Option<(&mut SuggestionResults, &mut PickedSuggestion)> {
        match self {
            BlurSelecting { results, select }
            | FocusSearch {
                results,
                select: Some(select),
                ..
            } => Some((results, select)),
            BlurNone | FocusCommand { .. } | FocusSearch { select: None, .. } => None,
        }
    }
}
