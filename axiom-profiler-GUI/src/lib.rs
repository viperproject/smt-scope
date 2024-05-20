use std::cell::RefCell;
use std::rc::Rc;
use std::sync::{Mutex, OnceLock, RwLock};

use commands::{Command, CommandRef, CommandsContext};
use configuration::View;
use fxhash::{FxHashMap, FxHashSet};
use gloo::timers::callback::Timeout;
use gloo_file::File;
use gloo_file::{callbacks::FileReader, FileList};
use material_yew::list::{MatListItem, SelectedDetail};
use material_yew::select::MatSelect;
use petgraph::visit::EdgeRef;
use results::graph_info;
use results::svg_result::{Msg as SVGMsg, QuantIdxToColourMap, RenderedGraph, RenderingState, SVGResult};
use smt_log_parser::parsers::z3::graph::raw::{InstEdgeKind, InstNodeKind, ProofEdgeKind, ProofNodeKind};
use smt_log_parser::parsers::z3::graph::{Graph, VisibleEdgeIndex, RawNodeIndex};
use smt_log_parser::parsers::z3::z3parser::Z3Parser;
use smt_log_parser::parsers::{ParseState, ReaderState};
use wasm_bindgen::closure::Closure;
use wasm_bindgen::JsCast;
use wasm_timer::Instant;
use web_sys::{HtmlElement, HtmlInputElement};
use yew::html::Scope;
use yew::prelude::*;
use yew_router::prelude::*;
use material_yew::{MatIcon, MatIconButton, MatDialog, WeakComponentLink};

use crate::commands::CommandsProvider;
use crate::configuration::{ConfigurationContext, ConfigurationProvider, Flags};
use crate::filters::FiltersState;
use crate::infobars::{OmnibarMessage, SearchActionResult, SidebarSectionHeader, Topbar};
use crate::results::svg_result::GraphState;
use crate::utils::{lookup::StringLookupZ3, overlay_page::{Overlay, SetVisibleCallback}};

pub use global_callbacks::{GlobalCallbacksProvider, CallbackRef, GlobalCallbacksContext};
pub use utils::position::*;

pub mod results;
mod utils;
mod infobars;
mod filters;
mod global_callbacks;
pub mod configuration;
pub mod homepage;
pub mod shortcuts;
pub mod commands;
pub mod file;

pub const GIT_DESCRIBE: &str = env!("VERGEN_GIT_DESCRIBE");
pub fn version() -> Option<semver::Version> {
    let version = GIT_DESCRIBE.strip_prefix("v")?;
    semver::Version::parse(version).ok().filter(|v| v.pre.is_empty())
}

const SIZE_NAMES: [&'static str; 5] = ["B", "KB", "MB", "GB", "TB"];
const ALLOW_HIDE_SIDEBAR_NO_FILE: bool = true;

pub static MOUSE_POSITION: OnceLock<RwLock<PagePosition>> = OnceLock::new();
pub fn mouse_position() -> &'static RwLock<PagePosition> {
    MOUSE_POSITION.get_or_init(|| RwLock::default())
}
pub static PREVENT_DEFAULT_DRAG_OVER: OnceLock<Mutex<bool>> = OnceLock::new();

pub enum Msg {
    File(Option<File>),
    LoadedFile(String, u64, Z3Parser, ParseState<bool>, bool),
    LoadingState(LoadingState),
    RenderedGraph(RenderedGraph),
    FailedOpening(String),
    ShowMessage(OmnibarMessage, u32),
    ClearMessage,
    SelectedNodes(Vec<RawNodeIndex>),
    SelectedEdges(Vec<VisibleEdgeIndex>),
    KeyDown(KeyboardEvent),
    ShowHelpToggled(bool),
    SearchMatchingLoops,
    ChangeViewTo(SelectedDetail),
}

#[derive(Debug, Clone, PartialEq)]
pub enum LoadingState {
    NoFileSelected,
    ReadingToString,
    StartParsing,
    Parsing(ParseProgress, Callback<()>),
    // Stopped early, cancelled?
    DoneParsing(bool, bool),
    Rendering(RenderingState, bool, bool),
    FileDisplayed,
}

#[derive(Debug, Clone, PartialEq)]
pub struct ParseProgress {
    reader: ReaderState,
    file_size: u64,
    time: Instant,
    bytes_delta: Option<usize>,
    time_delta: Option<std::time::Duration>,
    speed: Option<f64>,
}
impl ParseProgress {
    pub fn new(reader: ReaderState, file_size: u64) -> Self {
        Self {
            reader,
            file_size,
            time: Instant::now(),
            bytes_delta: None,
            time_delta: None,
            speed: None,
        }
    }
    pub fn delta(&mut self, old: &Self) {
        assert!(self.reader.bytes_read > old.reader.bytes_read);
        if self.reader.bytes_read < old.reader.bytes_read {
            *self = old.clone();
            return;
        }
        // Value >= 0.0, the higher the value the more smoothed out the speed is
        // (but also takes longer to react to changes in speed)
        const SPEED_SMOOTHING: f64 = 10.0;
        let bytes_delta = self.reader.bytes_read - old.reader.bytes_read;
        self.bytes_delta = Some(bytes_delta);
        let time_delta = self.time - old.time;
        self.time_delta = Some(time_delta);
        let speed = bytes_delta as f64 / time_delta.as_secs_f64();
        self.speed = Some(old.speed.map(|old| (speed + SPEED_SMOOTHING * old) / (SPEED_SMOOTHING + 1.0)).unwrap_or(speed));
    }
}

#[derive(Clone)]
pub struct OpenedFileInfo {
    file_name: String,
    file_size: u64,
    parser_state: ParseState<bool>,
    parser_cancelled: bool,
    update: Rc<RefCell<Result<Callback<SVGMsg>, Vec<SVGMsg>>>>,
    filter: WeakComponentLink<FiltersState>,
    selected_nodes: Vec<RawNodeIndex>,
    selected_edges: Vec<VisibleEdgeIndex>,
    rendered: Option<RenderedGraph>,
}

impl PartialEq for OpenedFileInfo {
    fn eq(&self, other: &Self) -> bool {
        self.file_name == other.file_name
            && self.file_size == other.file_size
            && std::mem::discriminant(&self.parser_state) == std::mem::discriminant(&other.parser_state)
            && self.selected_nodes == other.selected_nodes
            && self.selected_edges == other.selected_edges
            && self.rendered.as_ref().map(|r| r.graph.generation) == other.rendered.as_ref().map(|r| r.graph.generation)
    }
}

impl OpenedFileInfo {
    pub fn send_update(&self, msg: SVGMsg) {
        match &mut *self.update.borrow_mut() {
            Ok(cb) => cb.emit(msg),
            Err(e) => e.push(msg),
        }
    }
    pub fn send_updates(&self, msgs: impl Iterator<Item = SVGMsg>) {
        match &mut *self.update.borrow_mut() {
            Ok(cb) => for msg in msgs {
                cb.emit(msg);
            },
            Err(e) => e.extend(msgs),
        }
    }
}

pub struct FileDataComponent {
    file_select: NodeRef,
    file: Option<OpenedFileInfo>,
    reader: Option<FileReader>,
    pending_ops: usize,
    progress: LoadingState,
    message: Option<(Timeout, OmnibarMessage)>,
    cancel: Rc<RefCell<bool>>,
    navigation_section: NodeRef,
    help_dialog: WeakComponentLink<MatDialog>,
    insts_info_link: WeakComponentLink<graph_info::GraphInfo>,
    showing_help: bool,
    omnibox: NodeRef,
    sidebar_button: NodeRef,
    flags_visible: SetVisibleCallback,
    _callback_refs: [CallbackRef; 6],
    _command_refs: [CommandRef; 4],
}

impl FileDataComponent {
    pub fn set_message(&mut self, link: &Scope<Self>, message: OmnibarMessage, millis: u32) {
        log::info!("Showing message: {message:?}");

        let clear_error = link.callback(|_| Msg::ClearMessage);
        let message = (Timeout::new(millis, move || clear_error.emit(())), message);
        let old_message = self.message.replace(message);
        if let Some((timeout, _)) = old_message {
            timeout.cancel();
        }
    }
    pub fn clear_message(&mut self, error_only: bool) {
        if let Some((timeout, message)) = self.message.take() {
            if error_only && !message.is_error {
                self.message = Some((timeout, message));
            } else {
                timeout.cancel();
            }
        }
    }
}

impl Component for FileDataComponent {
    type Message = Msg;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        let help_dialog = WeakComponentLink::<MatDialog>::default();
        let sidebar_button = NodeRef::default();
        let omnibox = NodeRef::default();
        let flags_visible = SetVisibleCallback::default();

        // Global Callbacks
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mouse_move_ref = (registerer.register_mouse_move)(Callback::from(|event: MouseEvent| {
            *mouse_position().write().unwrap() = PagePosition::from(&event);
        }));
        let pd = PREVENT_DEFAULT_DRAG_OVER.get_or_init(|| Mutex::default());
        let drag_over_ref = (registerer.register_drag_over)(Callback::from(|event: DragEvent| {
            *mouse_position().write().unwrap() = PagePosition::from(&event);
            let pd = *pd.lock().unwrap();
            if pd {
                event.prevent_default();
            }
        }));
        let [drag_enter_ref, drag_leave_ref, drop_ref] = Self::file_drag(&registerer, ctx.link());
        let keydown = (registerer.register_keyboard_down)(ctx.link().callback(Msg::KeyDown));
        let _callback_refs = [mouse_move_ref, drag_over_ref, drag_enter_ref, drag_leave_ref, drop_ref, keydown];

        // Commands
        let commands = ctx.link().get_commands_registerer().unwrap();
        let omnibox_ref = omnibox.clone();
        let search_cmd = Command {
            name: "Search".to_string(),
            execute: Callback::from(move |_| {
                let omnibox_ref = omnibox_ref.clone();
                Timeout::new(10, move || { omnibox_ref.cast::<HtmlElement>().map(|omnibox| omnibox.focus().ok()); }).forget();
            }),
            keyboard_shortcut: vec!["Cmd", "s"],
            disabled: false,
        };
        let search_cmd = (commands)(search_cmd);
        let help_dialog_ref = help_dialog.clone();
        let help_cmd = Command {
            name: "Show help".to_string(),
            execute: Callback::from(move |_| help_dialog_ref.show()),
            keyboard_shortcut: vec!["?"],
            disabled: false,
        };
        let help_cmd = (commands)(help_cmd);
        let sidebar_button_ref = sidebar_button.clone();
        let hide_sidebar_cmd = Command {
            name: "Toggle left sidebar".to_string(),
            execute: Callback::from(move |_| {
                sidebar_button_ref.cast::<HtmlElement>().map(|b| b.click());
            }),
            keyboard_shortcut: vec!["Cmd", "b"],
            disabled: false,
        };
        let hide_sidebar_cmd = (commands)(hide_sidebar_cmd);
        let flags_visible_ref = flags_visible.clone();
        let toggle_flags_cmd = Command {
            name: "Toggle flags page".to_string(),
            execute: Callback::from(move |_| {
                flags_visible_ref.borrow().emit(None);
            }),
            keyboard_shortcut: vec!["Cmd", ","],
            disabled: false,
        };
        let toggle_flags_cmd = (commands)(toggle_flags_cmd);
        let _command_refs = [help_cmd, hide_sidebar_cmd, search_cmd, toggle_flags_cmd];
        Self {
            file_select: NodeRef::default(),
            file: None,
            reader: None,
            pending_ops: 0,
            progress: LoadingState::NoFileSelected,
            message: None,
            cancel: Rc::default(),
            navigation_section: NodeRef::default(),
            help_dialog,
            insts_info_link: WeakComponentLink::default(),
            showing_help: false,
            omnibox,
            sidebar_button,
            flags_visible,
            _callback_refs,
            _command_refs,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::File(file) => {
                let Some(file) = file else {
                    return false;
                };
                // remove any old parser in the configuration
                let cfg = ctx.link().get_configuration().unwrap();
                cfg.update_parser(|p| p.take().is_some());
                // hide the flags page if shown
                self.flags_visible.borrow().emit(Some(false));

                self.load_opened_file(file, ctx.link())
            }
            Msg::LoadingState(mut state) => {
                log::info!("New state \"{state:?}\"");
                if let (LoadingState::Parsing(parsing, _), LoadingState::Parsing(old, _)) = (&mut state, &self.progress) {
                    parsing.delta(old);
                }
                self.progress = state;
                self.clear_message(true);
                true
            }
            Msg::RenderedGraph(rendered) => {
                ctx.link().send_message(Msg::LoadingState(LoadingState::FileDisplayed));
                if let Some(file) = &mut self.file {
                    let old_len = file.selected_nodes.len();
                    file.selected_nodes.retain(|n| rendered.graph.contains(*n));
                    if file.selected_nodes.len() != old_len {
                        ctx.link().send_message(Msg::SelectedNodes(file.selected_nodes.clone()));
                    }
                    if let Some(old) = &file.rendered {
                        let old_len = file.selected_edges.len();
                        // Update selected edges
                        let mut to_update: FxHashMap<_, _> = file.selected_edges.iter_mut().flat_map(|e| {
                            let old_edge = &old.graph[*e];
                            let different = !rendered.graph.graph.edge_weight(e.0).is_some_and(|edge| edge == old_edge);
                            different.then(|| (old_edge, e))
                        }).collect();
                        if !to_update.is_empty() {
                            for new_edge in rendered.graph.graph.edge_references() {
                                if let Some(e) = to_update.remove(new_edge.weight()) {
                                    *e = VisibleEdgeIndex(new_edge.id());
                                    if to_update.is_empty() {
                                        break;
                                    }
                                }
                            }
                            if !to_update.is_empty() {
                                let to_remove: FxHashSet<_> = to_update.into_iter().map(|(_, v)| *v).collect();
                                file.selected_edges.retain(|e| !to_remove.contains(e));
                            }
                        }
                        if file.selected_edges.len() != old_len {
                            ctx.link().send_message(Msg::SelectedEdges(file.selected_edges.clone()));
                        }
                    }
                    file.rendered = Some(rendered);
                }
                true
            }
            Msg::FailedOpening(error) => {
                let message = OmnibarMessage { message: error, is_error: true };
                self.set_message(ctx.link(), message, 10000);

                self.progress = LoadingState::NoFileSelected;
                let file = self.file.take();
                drop(file);
                let cfg = ctx.link().get_configuration().unwrap();
                cfg.update_parser(|p| p.take().is_some());

                if let Some(navigation_section) = self.navigation_section.cast::<web_sys::Element>() {
                    let _ = navigation_section.class_list().add_1("expanded");
                }
                true
            }
            Msg::ShowMessage(message, millis) => {
                self.set_message(ctx.link(), message, millis);
                true
            }
            Msg::ClearMessage => {
                self.message.take();
                true
            }
            Msg::LoadedFile(file_name, file_size, parser, parser_state, parser_cancelled) => {
                log::info!("Processing \"{file_name}\"");
                drop(self.reader.take());
                let parser = RcParser::new(parser);
                let cfg = ctx.link().get_configuration().unwrap();
                cfg.update_parser(move |p| {
                    *p = Some(parser);
                    true
                });
                let file = OpenedFileInfo {
                    file_name,
                    file_size,
                    parser_state,
                    parser_cancelled,
                    filter: WeakComponentLink::default(),
                    update: Rc::new(RefCell::new(Err(Vec::new()))),
                    selected_nodes: Vec::new(),
                    selected_edges: Vec::new(),
                    rendered: None,
                };
                self.file = Some(file);
                if let Some(navigation_section) = self.navigation_section.cast::<web_sys::Element>() {
                    let _ = navigation_section.class_list().remove_1("expanded");
                }
                true
            }
            Msg::SelectedNodes(nodes) => {
                let Some(file) = &mut self.file else {
                    return false
                };
                file.selected_nodes = nodes;
                true
            }
            Msg::SelectedEdges(edges) => {
                let Some(file) = &mut self.file else {
                    return false
                };
                file.selected_edges = edges;
                true
            }
            Msg::ShowHelpToggled(showing_help) => {
                self.showing_help = showing_help;
                false
            }
            Msg::KeyDown(event) => match event.key().as_str() {
                "?" => {
                    if self.showing_help {
                        self.help_dialog.close();
                    } else {
                        self.help_dialog.show();
                    }
                    false
                }
                "s" => {
                    if event.meta_key() {
                        event.prevent_default();
                        self.omnibox.cast::<HtmlElement>().and_then(|omnibox| omnibox.focus().ok());
                    }
                    false
                }
                "b" => {
                    if event.meta_key() {
                        event.prevent_default();
                        if let Some(sidebar_button) = self.sidebar_button.cast::<HtmlElement>() {
                            sidebar_button.click()
                        }
                    }
                    false
                }
                "," => {
                    if event.meta_key() {
                        event.prevent_default();
                        self.flags_visible.borrow().emit(None);
                    }
                    false
                }
                _ => false,
            }
            Msg::SearchMatchingLoops => {
                if let Some(file) = &mut self.file {
                    // TODO: re-add finding matching loops
                    // if let Some(g) = file.parser.graph.borrow_mut().as_mut() {
                    //     file.parser.found_mls = Some(g.search_matching_loops());
                    //     return true;
                    // }
                }
                false
            }
            Msg::ChangeViewTo(selected) => {
                match selected.index {
                    material_yew::list::ListIndex::Single(Some(idx)) => {
                        let selected_view = match idx {
                            0 => View::QuantInsts,
                            1 => View::ProofSteps,
                            _ => unreachable!()
                        };
                        let link = ctx.link().clone();
                        let cfg = link.get_configuration().unwrap();
                        cfg.update.update(|cfg| { cfg.view = selected_view; true });
                    },
                    _ => (),
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
            "https://github.com/viperproject/axiom-profiler-2/tree/{}",
            env!("VERGEN_GIT_SHA")
        );
        let is_canary = version().is_none();

        let sidebar = NodeRef::default();

        let current_trace = match &self.file {
            Some(file) => {
                let search_matching_loops = ctx.link().callback(|_| Msg::SearchMatchingLoops);
                let link = ctx.link().clone();
                let cfg = link.get_configuration().unwrap();
                match cfg.config.view {
                    View::QuantInsts => html!{
                    <FiltersState file={file.clone()} search_matching_loops={search_matching_loops}/>
                },
                    View::ProofSteps => html!{},
                }
            }
            None => html!{},
        };
        let change_view = ctx.link().callback(Msg::ChangeViewTo); 
        let view_selector = match &self.file {
            Some(_) => {
                html! {
                <li>
                    <MatSelect label="View" onselected={change_view}>
                        <MatListItem value="0" selected=true>{"Quantifier instantiations"}</MatListItem>
                        <MatListItem value="1">{"Proof steps"}</MatListItem>
                    </MatSelect>
                </li>
                }
            }
            None => html!{},
        };

        let cfg = ctx.link().get_configuration().unwrap();
        let parser = cfg.config.parser.clone();
        let parser_ref = parser.clone();
        let visible = self.file.as_ref().and_then(|f| f.rendered.as_ref().map(|r| r.graph.clone()));
        let visible_ref = visible.clone();
        let search = Callback::from(move |query: String| {
            let Some(parser) = parser_ref.as_ref() else {
                return None
            };
            let matches = parser.lookup.get_fuzzy(&query);
            Some(SearchActionResult::new(query, matches, parser, visible_ref.as_deref()))
        });
        let pick = Callback::from(move |(name, kind): (String, _)| {
            let parser = parser.as_ref()?;
            let entry = parser.lookup.get_exact(&name)?.get(&kind)?;
            Some(entry.get_visible(&*parser.graph.as_ref()?.borrow(), visible.as_deref()?))
        });
        let insts_info_link = self.insts_info_link.clone();
        let select = Callback::from(move |idx: RawNodeIndex| {
            let Some(insts_info_link) = &*insts_info_link.borrow() else {
                return;
            };
            insts_info_link.send_message(graph_info::Msg::DeselectAll);
            insts_info_link.send_message(graph_info::Msg::UserSelectedNode(idx));
            insts_info_link.send_message(graph_info::Msg::ScrollZoomSelection);
        });

        // Callbacks
        let file_select_ref = self.file_select.clone();
        let on_change = ctx.link().callback(move |_| {
            let files = file_select_ref.cast::<HtmlInputElement>().unwrap().files();
            Msg::File(files.map(FileList::from).and_then(|files|
                (files.len() == 1).then(|| files[0].clone())
            ))
        });
        let sidebar_ref = sidebar.clone();
        let open_files = self.file.is_some();
        let hide_sidebar = Callback::from(move |_| {
            if let Some(sidebar) = sidebar_ref.cast::<HtmlElement>() {
                if ALLOW_HIDE_SIDEBAR_NO_FILE || sidebar.class_list().contains("hide-sidebar") || open_files {
                    sidebar.class_list().toggle("hide-sidebar").ok();
                }
            }
        });
        let help_dialog_clone = self.help_dialog.clone();
        let show_shortcuts = Callback::from(move |click: MouseEvent| {
            click.prevent_default();
            help_dialog_clone.show();
        });
        let onopened = ctx.link().callback(|_| Msg::ShowHelpToggled(true));
        let onclosed = ctx.link().callback(|_| Msg::ShowHelpToggled(false));
        let at_homepage = self.file.is_none();
        let page = self.file.as_ref().map(|f| {
            let (timeout, cancel) = (f.parser_state.is_timeout(), f.parser_cancelled);
            let progress = ctx.link().callback(move |rs| match rs {
                GraphState::Rendering(rs) => Msg::LoadingState(LoadingState::Rendering(rs, timeout, cancel)),
                GraphState::Constructed(rendered) => Msg::RenderedGraph(rendered),
                GraphState::Failed(error) => Msg::FailedOpening(error),
            });
            let selected_nodes = ctx.link().callback(Msg::SelectedNodes);
            let selected_edges = ctx.link().callback(Msg::SelectedEdges);
            html! {<SVGResult file={f.clone()} {progress} {selected_nodes} {selected_edges} insts_info_link={self.insts_info_link.clone()}/>}
        }).unwrap_or_else(|| {
            html!{<homepage::Homepage {is_canary}/>}
        });
        let message = self.message.as_ref().map(|(_, message)| message).cloned();
        let header_class = if is_canary { "canary" } else { "stable" };
        let page_class = if at_homepage { "page home-page" } else { "page" };
        let flags_visible = self.flags_visible.clone();
        let toggle_settings = Callback::from(move |click: MouseEvent| {
            click.prevent_default();
            flags_visible.borrow().emit(None);
        });
        html! {
<>
    <nav class="sidebar" ref={sidebar}>
        <header class={header_class}><img src="html/logo_side_small.png" class="brand"/><div ref={&self.sidebar_button} class="sidebar-button" onclick={hide_sidebar}><MatIconButton icon="menu"></MatIconButton></div></header>
        <input type="file" ref={&self.file_select} class="trace_file" accept=".log" onchange={on_change} multiple=false/>
        <div class="sidebar-scroll"><div class="sidebar-scroll-container">
            <SidebarSectionHeader header_text="Navigation" collapsed_text="Open a new trace" section={self.navigation_section.clone()}><ul>
                <li><a href="#" draggable="false" id="open_trace_file"><div class="material-icons"><MatIcon>{"folder_open"}</MatIcon></div>{"Open trace file"}</a></li>
                {view_selector}
            </ul></SidebarSectionHeader>
            {current_trace}
            <SidebarSectionHeader header_text="Support" collapsed_text="Documentation & Bugs"><ul>
                <li><a href="#" draggable="false" onclick={show_shortcuts} id="keyboard_shortcuts"><div class="material-icons"><MatIcon>{"help"}</MatIcon></div>{"Keyboard shortcuts"}</a></li>
                <li><a href="https://github.com/viperproject/axiom-profiler-2/blob/main/README.md" target="_blank" id="documentation"><div class="material-icons"><MatIcon>{"find_in_page"}</MatIcon></div>{"Documentation"}</a></li>
                <li><a href="#" draggable="false" onclick={toggle_settings} id="flags"><div class="material-icons"><MatIcon>{"emoji_flags"}</MatIcon></div>{"Flags"}</a></li>
                <li><a href="https://github.com/viperproject/axiom-profiler-2/issues/new" target="_blank" id="report_a_bug"><div class="material-icons"><MatIcon>{"bug_report"}</MatIcon></div>{"Report a bug"}</a></li>
            </ul></SidebarSectionHeader>
            <div class="sidebar-footer">
                <div title="Number of pending operations" class="dbg-info-square"><div>{"OPS"}</div><div>{self.pending_ops}</div></div>
                <div title="Service Worker: Serving from cache. Ready for offline use" class="dbg-info-square amber"><div>{"SW"}</div><div>{"NA"}</div></div>
                <div class="version"><a href={version_link} title="Channel: stable" target="_blank">{version_info}</a></div>
            </div>
        </div></div>
    </nav>
    <div class="topbar">
        <Topbar progress={self.progress.clone()} {message} omnibox={self.omnibox.clone()} {search} {pick} {select} />
    </div>
    <div class="alerts"></div>
    <div class={page_class}>
        {page}
        <Overlay set_visible={self.flags_visible.clone()}><Flags /></Overlay>
    </div>

    // Shortcuts dialog
    <shortcuts::Shortcuts noderef={self.help_dialog.clone()} {onopened} {onclosed}/>
</>
        }
    }

    fn rendered(&mut self, _ctx: &Context<Self>, first_render: bool) {
        if first_render {
            // Do this instead of `onclick` when creating `open_trace_file`
            // above. Otherwise we run into the error here:
            // https://github.com/leptos-rs/leptos/issues/2104 due to the `.click()`.
            let input = self.file_select.cast::<HtmlInputElement>().unwrap();
            let closure: Closure<dyn Fn(MouseEvent)> = Closure::new(move |e: MouseEvent| {
                e.prevent_default(); input.click();
            });
            let div = gloo::utils::document().get_element_by_id("open_trace_file").unwrap();
            div.add_event_listener_with_callback(
                "click",
                closure.as_ref().unchecked_ref(),
            ).unwrap();
            closure.forget();
        }
    }
}

#[function_component(App)]
pub fn app() -> Html {
    html! {
        <main><GlobalCallbacksProvider><CommandsProvider>
            <ConfigurationProvider><FileDataComponent/></ConfigurationProvider>
        </CommandsProvider></GlobalCallbacksProvider></main>
    }
}

pub struct RcParser {
    parser: Rc<Z3Parser>,
    lookup: Rc<StringLookupZ3>,
    colour_map: QuantIdxToColourMap,
    graph: Option<Rc<RefCell<Graph<InstNodeKind, InstEdgeKind>>>>,
    found_mls: Option<usize>,
}

impl Clone for RcParser {
    fn clone(&self) -> Self {
        Self {
            parser: self.parser.clone(),
            lookup: self.lookup.clone(),
            colour_map: self.colour_map,
            graph: self.graph.clone(),
            found_mls: self.found_mls,
        }
    }
}

impl PartialEq for RcParser {
    fn eq(&self, other: &Self) -> bool {
        std::ptr::eq(&*self.parser, &*other.parser)
        && self.graph.is_some() == other.graph.is_some()
        && self.found_mls == other.found_mls
    }
}
impl Eq for RcParser {}

impl RcParser {
    fn new(parser: Z3Parser) -> Self {
        let (quant_count, non_quant_insts) = parser.quant_count_incl_theory_solving();
        let colour_map = QuantIdxToColourMap::new(quant_count, non_quant_insts);
        let lookup = StringLookupZ3::init(&parser);
        Self {
            parser: Rc::new(parser),
            lookup: Rc::new(lookup),
            colour_map,
            graph: None,
            found_mls: None,
        }
    }
}
