mod add_filter;
mod apply;
mod chain;
mod display;
mod manage_filter;

use material_yew::icon::MatIcon;
use petgraph::Direction;
use smt_log_parser::{
    analysis::{InstGraph, RawNodeIndex},
    items::QuantIdx,
    Z3Parser,
};
use yew::{html, Callback, MouseEvent};

use crate::{
    screen::{
        extra::{
            Action, ElementKind, SidebarSection, SidebarSectionRef, SimpleButton, Topbar,
            TopbarMenu,
        },
        file::RcAnalysis,
        Scope,
    },
    utils::toggle_list::ToggleList,
};

use self::add_filter::AddFilter;

use super::{Graph, GraphDimensions, GraphM, GraphMode};

pub use chain::*;
pub use manage_filter::*;

pub const DEFAULT_NODE_COUNT: usize = 300;

pub const DEFAULT_FILTER_CHAIN: &[Filter] = &[
    Filter::HideUnitNodes,
    Filter::IgnoreTheorySolving,
    Filter::AllButExpensive(DEFAULT_NODE_COUNT),
];

pub const PROOF_FILTER_CHAIN: &[Filter] = &[
    Filter::HideUnitNodes,
    Filter::HideNonProof,
    Filter::AllButExpensive(DEFAULT_NODE_COUNT),
];

pub const CDCL_FILTER_CHAIN: &[Filter] = &[
    Filter::LimitDeadCdcl(DEFAULT_NODE_COUNT),
    Filter::LimitCdclNodes(5 * DEFAULT_NODE_COUNT),
];

pub const DEFAULT_DISABLER_CHAIN: &[(Disabler, bool)] = &[
    (Disabler::Smart, true),
    (Disabler::ENodes, false),
    (Disabler::GivenEqualities, false),
    (Disabler::AllEqualities, false),
];

pub const PROOF_DISABLER_CHAIN: &[(Disabler, bool)] =
    &[(Disabler::Smart, true), (Disabler::NonProof, false)];

pub const CDCL_DISABLER_CHAIN: &[(Disabler, bool)] = &[];

#[derive(Debug, Clone, PartialEq, Hash)]
pub enum Filter {
    MaxNodeIdx(usize),
    MinNodeIdx(usize),
    IgnoreTheorySolving,
    IgnoreQuantifier(Option<QuantIdx>),
    IgnoreAllButQuantifier(Option<QuantIdx>),
    AllButExpensive(usize),
    MaxBranching(usize),
    ShowNeighbours(RawNodeIndex, Direction),
    VisitSourceTree(RawNodeIndex, bool),
    VisitSubTreeWithRoot(RawNodeIndex, bool),
    MaxDepth(usize),
    ShowLongestPath(RawNodeIndex),
    ShowNamedQuantifier(String),
    SelectNthMatchingLoop(usize),
    ShowMatchingLoopSubgraph,

    HideUnitNodes,
    LimitProofNodes(usize),
    HideNonProof,
    ShowAsserted,
    ShowFalse,
    ShowNamedProof(String),

    LimitDeadCdcl(usize),
    LimitCdclNodes(usize),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Disabler {
    Smart,
    ENodes,
    GivenEqualities,
    AllEqualities,
    NonProof,
}

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

    pub fn can_reset(&self, initial: &[Filter]) -> bool {
        self.chain.new_filter_chain != initial
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
                self.chain.new_filter_chain[idx] = filter;
                self.chain.send_updates(link) || modified
            }
            FilterM::AddFilter(filter) => {
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
        let no_drag = self.selected_filter.or(self.edit_filter);
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
        reset: Option<Callback<()>>,
        mode: GraphMode,
    ) -> Topbar {
        let add_filter = AddFilter {
            parser,
            graph,
            new_filter,
        };

        let mut dropdown = add_filter.general(mode);
        dropdown.push(SimpleButton {
            icon: "restore",
            text: "Reset operations".to_string(),
            hover_text: Some("Reset all operations applied to the graph".to_string()),
            disabled: reset.is_none(),
            click: Action::MouseDown(reset.unwrap_or_default()),
        });
        let general = TopbarMenu {
            button_text: "View",
            dropdown,
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
    mode: GraphMode,
}

impl DisablersState {
    pub fn new(disablers: Vec<(Disabler, bool)>, mode: GraphMode) -> Self {
        DisablersState {
            disablers_modified: true,
            disablers,
            mode,
        }
    }

    pub fn toggle(&mut self, idx: usize) {
        self.disablers_modified = true;
        self.disablers[idx].1 = !self.disablers[idx].1;
    }

    pub fn modified(&mut self) -> bool {
        core::mem::replace(&mut self.disablers_modified, false)
    }

    pub fn apply(&mut self, graph: &mut InstGraph, parser: &Z3Parser) {
        if !self.modified() {
            return;
        }
        let non_trivial_disabled = self.disablers().any(|d| matches!(d, Disabler::Smart));
        graph.reset_disabled_to(parser, |node, graph| {
            // TODO: hardcoded disabling based on two modes, change this
            let n = &graph[node];
            if !self.mode.is_allowed(n.kind()) {
                return true;
            }
            if self.mode.is_proof() {
                if !n.proof.reaches_proof() {
                    return true;
                }
                if non_trivial_disabled && !n.proof.reaches_non_trivial_proof() {
                    return true;
                }
            }

            self.disablers().any(|d| d.disable(node, graph, parser))
        });
    }

    fn disablers(&self) -> impl Iterator<Item = Disabler> + Clone + '_ {
        self.disablers
            .iter()
            .copied()
            .filter(|(_, b)| *b)
            .map(|(d, _)| d)
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
