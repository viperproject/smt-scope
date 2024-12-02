mod chain;
mod manage_filter;

use std::num::NonZeroUsize;

use material_yew::icon::MatIcon;
use yew::{html, html::Scope, Callback, Context, NodeRef};

use crate::{
    commands::{Command, CommandRef, CommandsContext, ShortcutKey},
    results::{
        filters::{Disabler, Filter},
        svg_result::GraphDimensions,
    },
    screen::{
        extra::{ElementKind, SidebarSection, SidebarSectionRef},
        Manager,
    },
};

use super::GraphM;

pub use chain::*;
pub use manage_filter::*;

pub enum FilterM {
    Drag(Option<DragState>),
    WillDelete(bool),
    SelectFilter(usize),
    Delete(usize),
    Edit(usize),
    EndEdit(usize, Filter),
}

pub struct FiltersState {
    pub chain: FilterChain,
    pub no_effects: Vec<usize>,

    delete_node: NodeRef,
    global_section: NodeRef,
    dragging: bool,
    will_delete: bool,
    selected_filter: Option<usize>,
    edit_filter: Option<usize>,
}

impl FiltersState {
    pub fn new(initial: Vec<Filter>, permissions: GraphDimensions, link: &Scope<Manager>) -> Self {
        let chain = FilterChain::new(initial, permissions, link);
        let delete_node = NodeRef::default();
        let global_section = NodeRef::default();
        FiltersState {
            chain,
            no_effects: Vec::new(),
            delete_node,
            global_section,
            dragging: false,
            will_delete: false,
            selected_filter: None,
            edit_filter: None,
        }
    }

    pub fn update(&mut self, link: &Scope<Manager>, msg: FilterM) -> bool {
        match msg {
            FilterM::WillDelete(will_delete) => {
                let changed = self.will_delete != will_delete;
                self.will_delete = will_delete;
                changed
            }
            FilterM::Drag(drag) => {
                self.dragging = drag.is_none();
                self.will_delete = false;
                let Some(drag) = drag else {
                    // Drag start
                    return true;
                };
                if drag.delete {
                    self.chain.new_filter_chain.remove(drag.start_idx);
                } else {
                    self.chain.new_filter_chain.swap(drag.start_idx, drag.idx);
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
        }
    }

    pub fn sidebar(&self, dims: Option<GraphDimensions>, link: &Scope<Manager>) -> SidebarSection {
        let dims = dims.unwrap_or_default();
        let class = if self.dragging { "display-none" } else { "" };
        let details = format!("{} node, {} edge", dims.node_count, dims.edge_count);
        let graph_info = ElementKind::Custom(html! {
            <li class={class}><a draggable="false" class="trace-file-name">{details}</a></li>
        });

        let class = match (self.dragging, self.will_delete) {
            (true, true) => "delete will-delete",
            (true, false) => "delete",
            _ => "delete display-none",
        };
        let dragging = ElementKind::Custom(html! {
            <li ref={&self.delete_node} class={class}><a draggable="false">
                <div class="material-icons"><MatIcon>{"delete"}</MatIcon></div>
                {"Delete"}
            </a></li>
        });

        let drag = link.callback(|ds| GraphM::Filter(FilterM::Drag(ds)));
        let will_delete =
            link.callback(|will_delete| GraphM::Filter(FilterM::WillDelete(will_delete)));
        let elem_hashes: Vec<_> = self
            .chain
            .new_filter_chain
            .iter()
            .map(Filter::get_hash)
            .collect();
        let elements: Vec<_> = self.chain.new_filter_chain.iter().enumerate().map(|(idx, filter)| {
            let onclick = link.callback(move |_| GraphM::Filter(FilterM::SelectFilter(idx)));
            let delete = link.callback(move |_| GraphM::Filter(FilterM::Delete(idx)));
            let edit = link.callback(move |_| GraphM::Filter(FilterM::Edit(idx)));
            let selected = self.selected_filter.is_some_and(|i| i == idx);
            let editing = self.edit_filter.is_some_and(|i| i == idx);
            let end_edit = link.callback(move |filter| GraphM::Filter(FilterM::EndEdit(idx, filter)));
            html!{<ExistingFilter filter={filter.clone()} onclick={onclick} selected={selected} editing={editing} delete={delete} edit={edit} end_edit={end_edit} />}
        }).collect();
        let list = ElementKind::Custom(html! {
            <DraggableList hashes={elem_hashes} drag={drag} will_delete={will_delete} delete_node={self.delete_node.clone()} selected={self.selected_filter} editing={self.edit_filter}>
                {for elements}
            </DraggableList>
        });

        let elements = vec![graph_info, dragging, list];

        SidebarSection {
            ref_: SidebarSectionRef::default(),
            header_text: "Graph Operations",
            collapsed_text: "Operations applied to the graph".to_string(),
            elements,
        }
    }
}

pub struct DisablersState {
    disabler_chain: Vec<(Disabler, bool)>,
}

impl DisablersState {
    pub fn reset_disabled(&mut self, link: &Scope<Manager>) {
        // let msg = SVGMsg::SetDisabled(
        //     self.disabler_chain
        //         .iter()
        //         .filter(|&(_d, b)| *b)
        //         .map(|(d, _b)| *d)
        //         .collect(),
        // );
        // let msgs = self.chain.rerender_msgs(first);
        // file.send_updates(std::iter::once(msg).chain(msgs));
    }
}
