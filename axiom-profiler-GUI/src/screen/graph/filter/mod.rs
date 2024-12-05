mod add_filter;
mod chain;
mod manage_filter;

use std::{cell::RefCell, num::NonZeroUsize, rc::Rc};

use material_yew::icon::MatIcon;
use smt_log_parser::{
    analysis::{InstGraph, RawNodeIndex},
    Z3Parser,
};
use yew::{html, Callback, Context, MouseEvent, NodeRef};

use crate::{
    commands::{Command, CommandRef, CommandsContext, ShortcutKey},
    results::{
        filters::{Disabler, Filter},
        svg_result::GraphDimensions,
    },
    screen::{
        extra::{ElementKind, SidebarSection, SidebarSectionRef, Topbar, TopbarMenu},
        file::RcAnalysis,
        Manager, Scope,
    },
    utils::toggle_list::ToggleList,
};

use self::add_filter::AddFilter;

use super::{Graph, GraphM};

pub use chain::*;
pub use manage_filter::*;

pub enum FilterM {
    Drag(Option<DragState>),
    SelectFilter(usize),
    Delete(usize),
    Edit(usize),
    EndEdit(usize, Filter),
    AddFilter(Filter),
}

pub struct FiltersState {
    pub chain: FilterChain,
    pub no_effects: Vec<usize>,

    dragging: bool,
    selected_filter: Option<usize>,
    edit_filter: Option<usize>,
}

impl FiltersState {
    pub fn new(initial: Vec<Filter>, permissions: GraphDimensions, link: &Scope<Graph>) -> Self {
        let chain = FilterChain::new(initial, permissions, link);
        FiltersState {
            chain,
            no_effects: Vec::new(),
            dragging: false,
            selected_filter: None,
            edit_filter: None,
        }
    }

    fn filter_chain(&self) -> impl Iterator<Item = (usize, bool, &Filter)> + '_ {
        let mut no_effect_idx = 0;
        self.chain
            .new_filter_chain
            .iter()
            .enumerate()
            .map(move |(idx, filter)| {
                let no_effect = self
                    .no_effects
                    .get(no_effect_idx)
                    .is_some_and(|i| *i == idx);
                if no_effect {
                    no_effect_idx += 1;
                }
                (idx, no_effect, filter)
            })
    }

    fn move_element<T>(arr: &mut [T], from: usize, to: usize) {
        use std::cmp::Ordering::*;
        match from.cmp(&to) {
            Equal => (),
            Less => arr[from..=to].rotate_left(1),
            Greater => arr[to..=from].rotate_right(1),
        }
    }

    pub fn update(&mut self, link: &Scope<Graph>, msg: FilterM) -> bool {
        match msg {
            FilterM::Drag(drag) => {
                self.dragging = drag.is_none();
                let Some(drag) = drag else {
                    self.edit_filter = None;
                    self.selected_filter = None;
                    // Drag start
                    return true;
                };
                if drag.delete {
                    self.chain.new_filter_chain.remove(drag.start_idx);
                } else {
                    Self::move_element(&mut self.chain.new_filter_chain, drag.start_idx, drag.idx);
                }
                self.chain.send_updates(link);
                true
            }
            FilterM::SelectFilter(idx) => {
                self.edit_filter = None;
                if self.selected_filter.is_some_and(|i| i == idx) {
                    self.selected_filter = None;
                } else {
                    self.selected_filter = Some(idx);
                }
                true
            }
            FilterM::Delete(idx) => {
                self.edit_filter = None;
                self.selected_filter = None;
                self.chain.new_filter_chain.remove(idx);
                self.chain.send_updates(link);
                true
            }
            FilterM::Edit(idx) => {
                self.selected_filter = None;
                self.edit_filter = Some(idx);
                true
            }
            FilterM::EndEdit(idx, filter) => {
                let mut modified = false;
                if self.edit_filter == Some(idx) {
                    self.edit_filter = None;
                    modified = true;
                }
                // TODO:
                // if let Filter::SelectNthMatchingLoop(n) = &filter {
                //     let state = ctx.link().get_state().unwrap();
                //     let graph = &state.state.parser.as_ref().unwrap().graph;
                //     if !graph.as_ref().is_some_and(|g| {
                //         (**g)
                //             .borrow()
                //             .found_matching_loops()
                //             .is_some_and(|(sure, maybe)| sure + maybe > *n)
                //     }) {
                //         return modified;
                //     }
                // }
                self.chain.new_filter_chain[idx] = filter;
                self.chain.send_updates(link) || modified
            }
            FilterM::AddFilter(filter) => {
                // TODO:
                // if let Filter::SelectNthMatchingLoop(n) = &filter {
                //     let state = ctx.link().get_state().unwrap();
                //     let graph = &state.state.parser.as_ref().unwrap().graph;
                //     // This relies on the fact that the graph is updated before the `AddFilter` is
                //     if !graph.as_ref().is_some_and(|g| {
                //         (**g)
                //             .borrow()
                //             .found_matching_loops()
                //             .is_some_and(|(sure, maybe)| sure + maybe > *n)
                //     }) {
                //         return false;
                //     }
                // }

                let edit = filter.is_editable();
                self.edit_filter = edit.then_some(self.chain.new_filter_chain.len());
                self.chain.new_filter_chain.push(filter);
                if !edit {
                    self.chain.send_updates(link);
                }
                true
            }
        }
    }

    pub fn sidebar(
        &self,
        dims: Option<GraphDimensions>,
        link: &Scope<Graph>,
        analysis: &RcAnalysis,
    ) -> SidebarSection {
        let dims = dims.unwrap_or_default();
        let class = if self.dragging { "display-none" } else { "" };
        let details = format!("{} node, {} edge", dims.node_count, dims.edge_count);
        let graph_info = ElementKind::Custom(html! {
            <li class={class}><a draggable="false" class="trace-file-name">{details}</a></li>
        });

        let drag = link.callback(|ds| GraphM::Filter(FilterM::Drag(ds)));

        let classes: Vec<_> = self
            .filter_chain()
            .map(|(idx, no_effect, _)| {
                (no_effect && !self.edit_filter.is_some_and(|i| idx == i)).then_some("no-effect")
            })
            .collect();
        let elements: Vec<_> = self.filter_chain().map(|(idx, _, filter)| {
            let onclick = link.callback(move |_| GraphM::Filter(FilterM::SelectFilter(idx)));
            let delete = link.callback(move |_| GraphM::Filter(FilterM::Delete(idx)));
            let edit = link.callback(move |_| GraphM::Filter(FilterM::Edit(idx)));
            let selected = self.selected_filter.is_some_and(|i| i == idx);
            let editing = self.edit_filter.is_some_and(|i| i == idx);
            let end_edit = link.callback(move |filter| GraphM::Filter(FilterM::EndEdit(idx, filter)));
            let analysis = analysis.clone();
            html!{<ExistingFilter filter={filter.clone()} {onclick} {selected} {editing} {delete} {edit} {end_edit} {analysis} />}
        }).collect();
        let no_drag = self.selected_filter.or_else(|| self.edit_filter);
        let list = ElementKind::Custom(html! {
            <DraggableList {classes} drag={drag} {no_drag}>
                {for elements}
            </DraggableList>
        });

        let elements = vec![graph_info, list];

        SidebarSection {
            ref_: SidebarSectionRef::default(),
            header_text: "Graph Operations",
            collapsed_text: "Operations applied to the graph".to_string(),
            elements,
        }
    }

    pub fn topbar(
        parser: &Z3Parser,
        graph: &InstGraph,
        new_filter: &Callback<Filter>,
        selected: &[RawNodeIndex],
    ) -> Topbar {
        let add_filter = AddFilter {
            parser,
            graph,
            new_filter,
        };

        let general = TopbarMenu {
            button_text: "View",
            dropdown: add_filter.general(),
        };
        let selection = TopbarMenu {
            button_text: "Selection",
            dropdown: add_filter.selection(selected),
        };
        vec![general, selection]
    }
}

pub struct DisablersState {
    disablers_modified: bool,
    disablers: Vec<(Disabler, bool)>,
}

impl DisablersState {
    pub fn new(disablers: Vec<(Disabler, bool)>) -> Self {
        DisablersState {
            disablers_modified: true,
            disablers,
        }
    }

    pub fn toggle(&mut self, idx: usize) {
        self.disablers_modified = true;
        self.disablers[idx].1 = !self.disablers[idx].1;
    }

    pub fn modified(&mut self) -> bool {
        core::mem::replace(&mut self.disablers_modified, false)
    }

    pub fn disablers(&self) -> impl Iterator<Item = Disabler> + Clone + '_ {
        self.disablers
            .iter()
            .filter(|(_, b)| *b)
            .map(|(d, _)| d)
            .copied()
    }

    pub fn sidebar(&self, link: &Scope<Graph>) -> SidebarSection {
        let toggle = link.callback(GraphM::ToggleDisabler);
        let selected: Vec<_> = self.disablers.iter().map(|(_, b)| *b).collect();
        let disablers = self.disablers.iter().map(|(d, b)| {
            let onclick = Callback::from(move |e: MouseEvent| e.prevent_default());
            let action = if *b { "Enable " } else { "Disable " };
            let icon = if *b { "visibility_off" } else { "visibility" };
            html! { <a draggable="false" href="#" {onclick} class="disabler">
                <div class="material-icons"><MatIcon>{icon}</MatIcon></div>{action}{d.description()}
            </a> }
        });
        let disablers = html! {
            <ToggleList {toggle} {selected}>
                {for disablers}
            </ToggleList>
        };
        SidebarSection {
            ref_: SidebarSectionRef::default(),
            header_text: "Global Operations",
            collapsed_text: "Enable/Disable nodes by category".to_string(),
            elements: vec![ElementKind::Custom(disablers)],
        }
    }
}
