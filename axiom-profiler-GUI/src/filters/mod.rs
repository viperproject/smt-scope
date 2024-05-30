mod add_filter;
mod manage_filter;

use std::fmt::Display;

use material_yew::icon::MatIcon;
use petgraph::Direction;
use smt_log_parser::parsers::{
    z3::graph::{raw::NodeKind, RawNodeIndex},
    ParseState,
};
use yew::{html, Callback, Component, Context, Html, MouseEvent, NodeRef, Properties};

use crate::{
    filters::{
        add_filter::AddFilterSidebar,
        manage_filter::{DraggableList, ExistingFilter},
    },
    infobars::SidebarSectionHeader,
    results::{
        filters::{Disabler, Filter, DEFAULT_DISABLER_CHAIN, DEFAULT_FILTER_CHAIN},
        svg_result::Msg as SVGMsg,
    },
    state::StateContext,
    utils::toggle_list::ToggleList,
    OpenedFileInfo, SIZE_NAMES,
};

use self::manage_filter::DragState;
use material_yew::WeakComponentLink;

#[derive(Properties, PartialEq)]
pub struct FiltersInput {
    pub file: OpenedFileInfo,
    pub search_matching_loops: Callback<()>,
    pub weak_link: WeakComponentLink<FiltersState>,
}

pub enum Msg {
    WillDelete(bool),
    Drag(Option<DragState>),
    ResetOperations,
    UndoOperation,
    SelectFilter(usize),
    Delete(usize),
    Edit(usize),
    EndEdit(usize, Filter),
    AddFilter(bool, Filter),
    ToggleDisabler(usize),
    ToggleMlViewerMode,
}

pub struct FiltersState {
    dragging: bool,
    delete_node: NodeRef,
    will_delete: bool,
    disabler_chain: Vec<(Disabler, bool)>,
    filter_chain: Vec<Filter>,
    applied_filter_chain: Vec<Filter>,
    prev_filter_chain: Vec<Filter>,
    selected_filter: Option<usize>,
    edit_filter: Option<usize>,
    global_section: NodeRef,
}

impl FiltersState {
    fn rerender_msgs(&self) -> impl Iterator<Item = SVGMsg> + '_ {
        [SVGMsg::ResetGraph]
            .into_iter()
            .chain(self.filter_chain.iter().cloned().map(SVGMsg::ApplyFilter))
            .chain([SVGMsg::RenderGraph])
    }
    pub fn send_updates(&mut self, file: &OpenedFileInfo, history: bool) -> bool {
        if self.applied_filter_chain == self.filter_chain {
            return false;
        }
        if history {
            self.prev_filter_chain
                .clone_from(&self.applied_filter_chain);
        }
        self.applied_filter_chain.clone_from(&self.filter_chain);
        file.send_updates(self.rerender_msgs());
        true
    }
    pub fn reset_disabled(&mut self, file: &OpenedFileInfo) {
        let msg = SVGMsg::SetDisabled(
            self.disabler_chain
                .iter()
                .filter(|&(_d, b)| *b)
                .map(|(d, _b)| *d)
                .collect(),
        );
        let msgs = self.rerender_msgs();
        file.send_updates(std::iter::once(msg).chain(msgs));
    }
}

impl Component for FiltersState {
    type Message = Msg;
    type Properties = FiltersInput;

    fn create(ctx: &Context<Self>) -> Self {
        ctx.props()
            .weak_link
            .borrow_mut()
            .replace(ctx.link().clone());
        *ctx.props().file.filter.borrow_mut() = Some(ctx.link().clone());
        let disabler_chain = DEFAULT_DISABLER_CHAIN.to_vec();
        let filter_chain = DEFAULT_FILTER_CHAIN.to_vec();
        let prev_filter_chain = filter_chain.clone();
        let applied_filter_chain = filter_chain.clone();
        let mut self_ = Self {
            disabler_chain,
            filter_chain,
            prev_filter_chain,
            applied_filter_chain,
            dragging: false,
            delete_node: NodeRef::default(),
            will_delete: false,
            selected_filter: None,
            edit_filter: None,
            global_section: NodeRef::default(),
        };
        self_.reset_disabled(&ctx.props().file);
        self_
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::WillDelete(will_delete) => {
                let changed = self.will_delete != will_delete;
                self.will_delete = will_delete;
                changed
            }
            Msg::Drag(drag) => {
                self.dragging = drag.is_none();
                self.will_delete = false;
                let Some(drag) = drag else {
                    // Drag start
                    return true;
                };
                if drag.delete {
                    self.filter_chain.remove(drag.start_idx);
                } else {
                    self.filter_chain.swap(drag.start_idx, drag.idx);
                }
                self.send_updates(&ctx.props().file, true);
                true
            }
            Msg::ResetOperations => {
                self.filter_chain = DEFAULT_FILTER_CHAIN.to_vec();
                self.send_updates(&ctx.props().file, true)
            }
            Msg::UndoOperation => {
                self.filter_chain.clone_from(&self.prev_filter_chain);
                self.send_updates(&ctx.props().file, true)
            }
            Msg::SelectFilter(idx) => {
                self.edit_filter = None;
                if self.selected_filter.is_some_and(|i| i == idx) {
                    self.selected_filter = None;
                } else {
                    self.selected_filter = Some(idx);
                }
                true
            }
            Msg::Delete(idx) => {
                self.edit_filter = None;
                self.selected_filter = None;
                self.filter_chain.remove(idx);
                self.send_updates(&ctx.props().file, true);
                true
            }
            Msg::Edit(idx) => {
                self.selected_filter = None;
                self.edit_filter = Some(idx);
                true
            }
            Msg::EndEdit(idx, filter) => {
                let mut modified = false;
                if self.edit_filter == Some(idx) {
                    self.edit_filter = None;
                    modified = true;
                }
                if let Filter::SelectNthMatchingLoop(n) = &filter {
                    let state = ctx.link().get_state().unwrap();
                    let graph = &state.state.parser.as_ref().unwrap().graph;
                    if !graph.as_ref().is_some_and(|g| {
                        (**g)
                            .borrow()
                            .found_matching_loops()
                            .is_some_and(|mls| mls > *n)
                    }) {
                        return modified;
                    }
                }
                self.filter_chain[idx] = filter;
                self.send_updates(&ctx.props().file, true) || modified
            }
            Msg::AddFilter(edit, filter) => {
                if let Filter::SelectNthMatchingLoop(n) = &filter {
                    let state = ctx.link().get_state().unwrap();
                    let graph = &state.state.parser.as_ref().unwrap().graph;
                    // This relies on the fact that the graph is updated before the `AddFilter` is
                    if !graph.as_ref().is_some_and(|g| {
                        (**g)
                            .borrow()
                            .found_matching_loops()
                            .is_some_and(|mls| mls > *n)
                    }) {
                        return false;
                    }
                }
                self.prev_filter_chain.clone_from(&self.filter_chain);
                self.edit_filter = edit.then_some(self.filter_chain.len());
                self.filter_chain.push(filter);
                if !edit {
                    self.send_updates(&ctx.props().file, true);
                }
                true
            }
            Msg::ToggleDisabler(idx) => {
                self.disabler_chain[idx].1 = !self.disabler_chain[idx].1;
                self.reset_disabled(&ctx.props().file);
                false
            }
            Msg::ToggleMlViewerMode => {
                let search_matching_loops = ctx.props().search_matching_loops.clone();

                let state = ctx.link().get_state().unwrap();
                let found_mls = &state.state.parser.as_ref().unwrap().found_mls;
                if found_mls.is_none() {
                    search_matching_loops.emit(());
                }
                state.set_ml_viewer_mode(!state.state.ml_viewer_mode);
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let data = ctx.link().get_state().unwrap();
        let info = data.state.file_info.as_ref().unwrap();
        let file = &ctx.props().file;
        let (size, unit) = file_size_display(info.size);
        let details = match &file.parser_state {
            ParseState::Paused(_, state) => {
                let (parse_size, parse_unit) = file_size_display(state.bytes_read as u64);
                format!("{} ({parse_size} {parse_unit}/{size} {unit})", info.name)
            }
            ParseState::Completed { .. } => format!("{} ({size} {unit})", info.name),
            ParseState::Error(err) => format!("{} (error {err:?})", info.name),
        };
        // Existing ops
        let elem_hashes: Vec<_> = self.filter_chain.iter().map(Filter::get_hash).collect();
        let elements: Vec<_> = self.filter_chain.iter().enumerate().map(|(idx, filter)| {
            let onclick = ctx.link().callback(move |_| Msg::SelectFilter(idx));
            let delete = ctx.link().callback(move |_| Msg::Delete(idx));
            let edit = ctx.link().callback(move |_| Msg::Edit(idx));
            let selected = self.selected_filter.is_some_and(|i| i == idx);
            let editing = self.edit_filter.is_some_and(|i| i == idx);
            let end_edit = ctx.link().callback(move |filter| Msg::EndEdit(idx, filter));
            html!{<ExistingFilter filter={filter.clone()} onclick={onclick} selected={selected} editing={editing} delete={delete} edit={edit} end_edit={end_edit} />}
        }).collect();
        let drag = ctx.link().callback(Msg::Drag);
        let will_delete = ctx.link().callback(Msg::WillDelete);

        let state = ctx.link().get_state().unwrap();
        let found_mls = &state.state.parser.as_ref().unwrap().found_mls;
        let toggle_ml_viewer_mode = ctx.link().callback(|ev: MouseEvent| {
            ev.prevent_default();
            Msg::ToggleMlViewerMode
        });
        let ml_viewer_mode = if state.state.ml_viewer_mode {
            html! {
                <li><a draggable="false" href="#" onclick={toggle_ml_viewer_mode}><div class="material-icons"><MatIcon>{"close"}</MatIcon></div>{"Exit matching loop viewer"}</a></li>
            }
        } else {
            html! {
                <li><a draggable="false" href="#" onclick={toggle_ml_viewer_mode}><div class="material-icons"><MatIcon>{"loop"}</MatIcon></div>{"View matching loops"}</a></li>
            }
        };
        let reset = ctx.link().callback(|e: MouseEvent| {
            e.prevent_default();
            Msg::ResetOperations
        });
        let undo = self.prev_filter_chain != self.filter_chain;
        let undo = undo.then(|| {
            let undo = ctx.link().callback(|e: MouseEvent| {
                e.prevent_default();
                Msg::UndoOperation
            });
            html! {
                <li><a draggable="false" href="#" onclick={undo}>
                    <div class="material-icons"><MatIcon>{"undo"}</MatIcon></div>{"Undo modification"}
                </a></li>
            }
        });
        let new_filter = ctx.link().callback(|f| Msg::AddFilter(true, f));

        // Selected nodes
        let selected_nodes = !ctx.props().file.selected_nodes.is_empty();
        let selected_nodes = selected_nodes.then(|| {
            let new_filter = ctx.link().callback(|f| Msg::AddFilter(false, f));
            let nodes = ctx.props().file.selected_nodes.clone();
            let header = format!(
                "Selected {} Node{}",
                nodes.len(),
                if nodes.len() == 1 { "" } else { "s" }
            );
            let collapsed_text = format!(
                "Actions on the {} selected node{}",
                nodes.len(),
                if nodes.len() == 1 { "" } else { "s" }
            );
            html! {
                <SidebarSectionHeader header_text={header} collapsed_text={collapsed_text}><ul>
                    <AddFilterSidebar {new_filter} {nodes} general_filters={false}/>
                </ul></SidebarSectionHeader>
            }
        });

        // Operations
        let class = match (self.dragging, self.will_delete) {
            (true, true) => "delete will-delete",
            (true, false) => "delete",
            _ => "delete hidden",
        };
        let dragging = html! {
            <li ref={&self.delete_node} class={class}><a draggable="false">
                <div class="material-icons"><MatIcon>{"delete"}</MatIcon></div>
                {"Delete"}
            </a></li>
        };
        let graph_details = file.rendered.as_ref().map(|g| {
            let class = if self.dragging { "hidden" } else { "" };
            let mls = found_mls.map(|mls| format!(", {mls} mtch loops")).unwrap_or_default();
            let details = format!("{} nodes, {} edges{mls}", g.graph.graph.node_count(), g.graph.graph.edge_count());
            html! { <li class={class}><a draggable="false" class="trace-file-name">{details}</a></li> }
        });
        // Disablers
        let toggle = ctx.link().callback(Msg::ToggleDisabler);
        let selected: Vec<_> = DEFAULT_DISABLER_CHAIN.iter().map(|(_, b)| *b).collect();
        let disablers = self.disabler_chain.iter().map(|(d, b)| {
            let onclick = Callback::from(move |e: MouseEvent| e.prevent_default());
            let action = if *b { "Enable " } else { "Disable " };
            let icon = if *b { "visibility_off" } else { "visibility" };
            html! { <a draggable="false" href="#" {onclick} class="disabler">
                <div class="material-icons"><MatIcon>{icon}</MatIcon></div>{action}{d.description()}
            </a> }
        });
        html! {
        <>
            <SidebarSectionHeader header_text="Current Trace" collapsed_text="Actions on the current trace"><ul>
                <li><a draggable="false" class="trace-file-name">{details}</a></li>
                <AddFilterSidebar new_filter={new_filter} found_mls={found_mls} nodes={Vec::new()} general_filters={true}/>
                {ml_viewer_mode}
                <li><a draggable="false" href="#" onclick={reset}><div class="material-icons"><MatIcon>{"restore"}</MatIcon></div>{"Reset operations"}</a></li>
                {undo}
            </ul></SidebarSectionHeader>
            {selected_nodes}
            <SidebarSectionHeader header_text={"Graph Operations"} collapsed_text={"Operations applied to the graph"}><ul>
                {graph_details}
                {dragging}
                <DraggableList hashes={elem_hashes} drag={drag} will_delete={will_delete} delete_node={self.delete_node.clone()} selected={self.selected_filter} editing={self.edit_filter}>
                    {for elements}
                </DraggableList>
            </ul></SidebarSectionHeader>
            <SidebarSectionHeader header_text={"Global Operations"} collapsed_text={"Enable/Disable nodes by category"} section={self.global_section.clone()}><ul>
            <ToggleList {toggle} {selected}>
                {for disablers}
            </ToggleList>
            </ul></SidebarSectionHeader>
        </>
        }
    }

    fn rendered(&mut self, _ctx: &Context<Self>, first_render: bool) {
        if first_render {
            if let Some(global_section) = self.global_section.cast::<web_sys::Element>() {
                let _ = global_section.class_list().remove_1("expanded");
            }
        }
    }
}

fn file_size_display(mut size: u64) -> (u64, &'static str) {
    let mut idx = 0;
    while size >= 10_000 && idx + 1 < SIZE_NAMES.len() {
        size /= 1024;
        idx += 1;
    }
    (size, SIZE_NAMES[idx])
}

impl Filter {
    pub fn icon(&self) -> &'static str {
        match self {
            Filter::MaxNodeIdx(_) => "tag",
            Filter::MinNodeIdx(_) => "tag",
            Filter::IgnoreTheorySolving => "calculate",
            Filter::IgnoreQuantifier(_) => "do_not_disturb",
            Filter::IgnoreAllButQuantifier(_) => "disabled_visible",
            Filter::MaxInsts(_) => "attach_money",
            Filter::MaxBranching(_) => "panorama_horizontal",
            Filter::ShowNeighbours(_, _) => "supervisor_account",
            Filter::VisitSourceTree(_, _) => "arrow_upward",
            Filter::VisitSubTreeWithRoot(_, _) => "arrow_downward",
            Filter::MaxDepth(_) => "link",
            Filter::ShowLongestPath(_) => "route",
            Filter::ShowNamedQuantifier(_) => "fingerprint",
            Filter::SelectNthMatchingLoop(_) => "repeat_one",
            Filter::ShowMatchingLoopSubgraph => "repeat",
        }
    }
    pub fn short_text(&self, d: impl Fn(RawNodeIndex) -> NodeKind) -> String {
        match self {
            Self::MaxNodeIdx(node_idx) => format!("Hide all ≥ |{node_idx}|"),
            Self::MinNodeIdx(node_idx) => format!("Hide all < |{node_idx}|"),
            Self::IgnoreTheorySolving => "Hide theory solving".to_string(),
            Self::IgnoreQuantifier(None) => "Hide no quant".to_string(),
            Self::IgnoreQuantifier(Some(qidx)) => {
                format!("Hide quant |{qidx}|")
            }
            Self::IgnoreAllButQuantifier(None) => "Hide all quant".to_string(),
            Self::IgnoreAllButQuantifier(Some(qidx)) => {
                format!("Hide all but quant ${qidx:?}$")
            }
            Self::MaxInsts(max) => format!("Hide all but |{max}| expensive"),
            Self::MaxBranching(max) => {
                format!("Hide all but |{max}| high degree")
            }
            &Self::VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!("Show descendants of ${}$", d(nidx)),
                false => format!("Hide descendants of ${}$", d(nidx)),
            },
            &Self::VisitSourceTree(nidx, retain) => match retain {
                true => format!("Show ancestors of ${}$", d(nidx)),
                false => format!("Hide ancestors of ${}$", d(nidx)),
            },
            &Self::ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => format!("Show parents of ${}$", d(nidx)),
                Direction::Outgoing => format!("Show children of ${}$", d(nidx)),
            },
            Self::MaxDepth(depth) => format!("Hide all > depth |{depth}|"),
            &Self::ShowLongestPath(node) => {
                format!("Show longest path w/ ${}$", d(node))
            }
            Self::ShowNamedQuantifier(name) => {
                format!("Show quant \"{name}\"")
            }
            Self::SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    n if (n / 10) % 10 == 1 => "th",
                    n if n % 10 == 0 => "st",
                    n if n % 10 == 1 => "nd",
                    n if n % 10 == 2 => "rd",
                    _ => "th",
                };
                format!("Show only |{}{ordinal}| matching loop", n + 1)
            }
            Self::ShowMatchingLoopSubgraph => "S only likely matching loops".to_string(),
        }
    }
    pub fn long_text(&self, d: impl Fn(RawNodeIndex) -> NodeKind, applied: bool) -> String {
        let (hide, show) = if applied {
            ("Hiding", "Showing")
        } else {
            ("Hide", "Show")
        };
        match self {
            Self::MaxNodeIdx(node_idx) => {
                format!("{hide} all nodes {} and above", display(node_idx, applied))
            }
            Self::MinNodeIdx(node_idx) => {
                format!("{hide} all nodes below {}", display(node_idx, applied))
            }
            Self::IgnoreTheorySolving => format!("{hide} all nodes related to theory solving"),
            Self::IgnoreQuantifier(None) => {
                format!("{hide} all nodes without an associated quantifier")
            }
            Self::IgnoreQuantifier(Some(qidx)) => {
                format!("{hide} all nodes of quantifier {}", display(qidx, applied))
            }
            Self::IgnoreAllButQuantifier(None) => {
                format!("{hide} all nodes with an associated quantifier")
            }
            Self::IgnoreAllButQuantifier(Some(qidx)) => {
                format!(
                    "{hide} all nodes not associated to quantifier {}",
                    display(qidx, applied)
                )
            }
            Self::MaxInsts(max) => format!(
                "{hide} all but the {} most expensive nodes",
                display(max, applied)
            ),
            Self::MaxBranching(max) => {
                format!(
                    "{hide} all but {} nodes with the most children",
                    display(max, applied)
                )
            }
            &Self::VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its descendants",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its descendants",
                    display(d(nidx), applied)
                ),
            },
            &Self::VisitSourceTree(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
            },
            &Self::ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => {
                    format!("{show} the parents of node {}", display(d(nidx), applied))
                }
                Direction::Outgoing => {
                    format!("{show} the children of node {}", display(d(nidx), applied))
                }
            },
            Self::MaxDepth(depth) => {
                format!("{hide} all nodes above depth {}", display(depth, applied))
            }
            &Self::ShowLongestPath(node) => {
                format!(
                    "{show} only nodes on the longest path through node {}",
                    display(d(node), applied)
                )
            }
            Self::ShowNamedQuantifier(name) => {
                format!("{show} nodes of quantifier \"{}\"", display(name, applied))
            }
            Self::SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    0 => return "{show} only nodes in longest matching loop".to_string(),
                    n if (n / 10) % 10 == 1 => "th",
                    n if n % 10 == 0 => "st",
                    n if n % 10 == 1 => "nd",
                    n if n % 10 == 2 => "rd",
                    _ => "th",
                };
                format!(
                    "{show} only nodes in {}{ordinal} longest matching loop",
                    display(n + 1, applied)
                )
            }
            Self::ShowMatchingLoopSubgraph => {
                format!("{show} only nodes in any potential matching loop")
            }
        }
    }
}

fn display<T: Display>(t: T, applied: bool) -> String {
    if applied {
        t.to_string()
    } else {
        "_".to_string()
    }
}
