use std::cell::RefCell;
use std::rc::Rc;
use std::sync::{Mutex, OnceLock, RwLock};

use commands::{Command, CommandRef, CommandsContext, ShortcutKey};
use example::Example;
use filters::AddFilterSidebar;
use fxhash::{FxHashMap, FxHashSet};
use gloo::timers::callback::Timeout;
use gloo_file::callbacks::FileReader;
use gloo_file::File;
use gloo_net::http::Response;
use infobars::OmniboxMessageKind;
use material_yew::{MatDialog, MatIcon, MatIconButton, WeakComponentLink};
use petgraph::visit::EdgeRef;
use results::graph_info;
use results::svg_result::{Msg as SVGMsg, RenderedGraph, RenderingState, SVGResult};
use screen::{Change, Manager};
use smt_log_parser::analysis::{InstGraph, RawNodeIndex, VisibleEdgeIndex};
use smt_log_parser::parsers::z3::z3parser::Z3Parser;
use smt_log_parser::parsers::{ParseState, ReaderState};
use state::StateProvider;
use utils::colouring::QuantIdxToColourMap;
use wasm_timer::Instant;
use web_sys::HtmlElement;
use yew::html::Scope;
use yew::prelude::*;

use crate::commands::CommandsProvider;
use crate::configuration::ConfigurationProvider;
use crate::filters::FiltersState;

use crate::infobars::{OmniboxMessage, SearchActionResult, SidebarSectionHeader, Topbar};
use crate::results::filters::Filter;
use crate::results::svg_result::GraphState;
use crate::screen::extra;
use crate::state::StateProviderContext;
use crate::utils::{lookup::StringLookupZ3, overlay_page::SetVisibleCallback};

pub use global_callbacks::{CallbackRef, GlobalCallbacksContext, GlobalCallbacksProvider};
pub use utils::position::*;

pub mod commands;
pub mod configuration;
pub mod example;
pub mod file;
mod filters;
mod global_callbacks;
pub mod homepage;
mod infobars;
pub mod results;
pub mod screen;
pub mod shortcuts;
pub mod state;
mod utils;

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

impl OmniboxContext for Scope<Manager> {
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

const SIZE_NAMES: [&str; 5] = ["B", "KB", "MB", "GB", "TB"];
const ALLOW_HIDE_SIDEBAR_NO_FILE: bool = true;

pub static MOUSE_POSITION: OnceLock<RwLock<PagePosition>> = OnceLock::new();
pub fn mouse_position() -> &'static RwLock<PagePosition> {
    MOUSE_POSITION.get_or_init(RwLock::default)
}
pub static PREVENT_DEFAULT_DRAG_OVER: OnceLock<Mutex<bool>> = OnceLock::new();

pub enum Msg {
    File(Option<File>),
    OpenExample(Example),
    LoadWebResponse(Example, Response),
    LoadedFile(Box<Z3Parser>, ParseState<bool>, bool),
    LoadingState(LoadingState),
    RenderedGraph(RenderedGraph),
    FailedOpening(String),
    CloseFile,
    ShowMessage((OmniboxMessage, u32)),
    ClearMessage,
    SelectedNodes(Vec<RawNodeIndex>),
    SelectedEdges(Vec<VisibleEdgeIndex>),
    ShowHelpToggled(bool),
    ToggleSidebar,
    SearchMatchingLoops,
    StateChanged(Rc<StateProvider>),

    UpdateSidebar(Rc<extra::Sidebar>),
    UpdateTopbar(Rc<extra::Topbar>),
    UpdateOmnibox(Rc<extra::Omnibox>),
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
    file_size: Option<u64>,
    time: Instant,
    bytes_delta: Option<usize>,
    time_delta: Option<std::time::Duration>,
    speed: Option<f64>,
    memory_use: usize,
}
impl ParseProgress {
    pub fn new(reader: ReaderState, file_size: Option<u64>, memory_use: usize) -> Self {
        Self {
            reader,
            file_size,
            time: Instant::now(),
            bytes_delta: None,
            time_delta: None,
            speed: None,
            memory_use,
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
        self.speed = Some(
            old.speed
                .map(|old| (speed + SPEED_SMOOTHING * old) / (SPEED_SMOOTHING + 1.0))
                .unwrap_or(speed),
        );
    }
}

#[derive(Clone)]
pub struct OpenedFileInfo {
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
        std::mem::discriminant(&self.parser_state) == std::mem::discriminant(&other.parser_state)
            && self.selected_nodes == other.selected_nodes
            && self.selected_edges == other.selected_edges
            && self.rendered.as_ref().map(|r| r.graph.generation)
                == other.rendered.as_ref().map(|r| r.graph.generation)
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
            Ok(cb) => {
                for msg in msgs {
                    cb.emit(msg);
                }
            }
            Err(e) => e.extend(msgs),
        }
    }
}

pub struct FileDataComponent {
    sidebar: Rc<extra::Sidebar>,
    topbar: Rc<extra::Topbar>,
    omnibox: Rc<extra::Omnibox>,
    omc: OmniboxMessageContext,

    file: Option<OpenedFileInfo>,
    reader: Option<FileReader>,
    pending_ops: usize,
    progress: LoadingState,
    message: Option<(Timeout, OmniboxMessage)>,
    cancel: Rc<RefCell<bool>>,
    navigation_section: NodeRef,
    help_dialog: WeakComponentLink<MatDialog>,
    insts_info_link: WeakComponentLink<graph_info::GraphInfo>,
    filters_state_link: WeakComponentLink<FiltersState>,
    showing_help: bool,
    sidebar_ref: NodeRef,
    flags_visible: SetVisibleCallback,
    state: Rc<StateProvider>,
    _handle: ContextHandle<Rc<StateProvider>>,
    _callback_refs: [CallbackRef; 2],
    _command_refs: [CommandRef; 2],
}

impl FileDataComponent {
    pub fn set_message(&mut self, link: &Scope<Self>, message: OmniboxMessage, millis: u32) {
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
            if error_only && !matches!(message.kind, OmniboxMessageKind::Error) {
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
        let flags_visible = SetVisibleCallback::default();
        let (state, _handle) = ctx
            .link()
            .context(ctx.link().callback(Msg::StateChanged))
            .unwrap();

        // Global Callbacks
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mouse_move_ref =
            (registerer.register_mouse_move)(Callback::from(|event: MouseEvent| {
                *mouse_position().write().unwrap() = PagePosition::from(&event);
            }));
        let drag_over_ref = (registerer.register_drag_over)(Callback::from(|event: DragEvent| {
            *mouse_position().write().unwrap() = PagePosition::from(&event);
        }));
        let _callback_refs = [
            mouse_move_ref,
            drag_over_ref,
        ];

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
            execute: ctx.link().callback(move |()| Msg::ToggleSidebar),
            keyboard_shortcut: ShortcutKey::cmd('b'),
            disabled: false,
        };
        let hide_sidebar_cmd = (commands)(hide_sidebar_cmd);
        let _command_refs = [help_cmd, hide_sidebar_cmd];
        Self {
            sidebar: Rc::default(),
            topbar: Rc::default(),
            omnibox: Rc::default(),
            omc: OmniboxMessageContext {
                send: ctx.link().callback(Msg::ShowMessage),
                clear: ctx.link().callback(|_| Msg::ClearMessage),
            },

            file: None,
            reader: None,
            pending_ops: 0,
            progress: LoadingState::NoFileSelected,
            message: None,
            cancel: Rc::default(),
            navigation_section: NodeRef::default(),
            help_dialog,
            insts_info_link: WeakComponentLink::default(),
            filters_state_link: WeakComponentLink::default(),
            showing_help: false,
            sidebar_ref: NodeRef::default(),
            flags_visible,
            state,
            _handle,
            _callback_refs,
            _command_refs,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::UpdateSidebar(sidebar) => {
                self.sidebar = sidebar;
                true
            }
            Msg::UpdateTopbar(topbar) => {
                self.topbar = topbar;
                true
            }
            Msg::UpdateOmnibox(omnibox) => {
                self.omnibox = omnibox;
                true
            }
            Msg::File(file) => {
                let Some(file) = file else {
                    return false;
                };
                self.load_opened_file(file, ctx.link())
            }
            Msg::OpenExample(example) => {
                let file = gloo_net::http::Request::get(&example.file_path()).send();
                let link = ctx.link().clone();
                wasm_bindgen_futures::spawn_local(async move {
                    match file.await {
                        Ok(response) => link.send_message(Msg::LoadWebResponse(example, response)),
                        Err(e) => {
                            link.send_message(Msg::FailedOpening(format!("Failed to load: {e}")))
                        }
                    };
                });
                false
            }
            Msg::LoadWebResponse(example, response) => {
                self.load_example(example, response, ctx.link())
            }
            Msg::LoadingState(mut state) => {
                log::info!("New state \"{state:?}\"");
                if let (LoadingState::Parsing(parsing, _), LoadingState::Parsing(old, _)) =
                    (&mut state, &self.progress)
                {
                    parsing.delta(old);
                }
                self.progress = state;
                self.clear_message(true);
                true
            }
            Msg::RenderedGraph(rendered) => {
                ctx.link()
                    .send_message(Msg::LoadingState(LoadingState::FileDisplayed));
                if let Some(file) = &mut self.file {
                    let old_len = file.selected_nodes.len();
                    file.selected_nodes.retain(|n| rendered.graph.contains(*n));
                    if file.selected_nodes.len() != old_len {
                        ctx.link()
                            .send_message(Msg::SelectedNodes(file.selected_nodes.clone()));
                    }
                    if let Some(old) = &file.rendered {
                        let old_len = file.selected_edges.len();
                        // Update selected edges
                        let mut to_update: FxHashMap<_, _> = file
                            .selected_edges
                            .iter_mut()
                            .flat_map(|e| {
                                let old_edge = &old.graph[*e];
                                let different = !rendered
                                    .graph
                                    .graph
                                    .edge_weight(e.0)
                                    .is_some_and(|edge| edge == old_edge);
                                different.then_some((old_edge, e))
                            })
                            .collect();
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
                                let to_remove: FxHashSet<_> =
                                    to_update.into_values().map(|v| *v).collect();
                                file.selected_edges.retain(|e| !to_remove.contains(e));
                            }
                        }
                        if file.selected_edges.len() != old_len {
                            ctx.link()
                                .send_message(Msg::SelectedEdges(file.selected_edges.clone()));
                        }
                    }
                    file.rendered = Some(rendered);
                }
                true
            }
            Msg::FailedOpening(error) => {
                log::error!("Failed to open file: {error}");

                let message = OmniboxMessage {
                    message: error,
                    kind: OmniboxMessageKind::Error,
                };
                self.set_message(ctx.link(), message, 10000);

                ctx.link().send_message(Msg::CloseFile);

                if let Some(navigation_section) = self.navigation_section.cast::<web_sys::Element>()
                {
                    let _ = navigation_section.class_list().add_1("expanded");
                }
                false
            }
            Msg::CloseFile => {
                self.progress = LoadingState::NoFileSelected;
                let file = self.file.take();
                drop(file);
                self.state.close_file();
                true
            }
            Msg::ShowMessage((message, millis)) => {
                self.set_message(ctx.link(), message, millis);
                true
            }
            Msg::ClearMessage => {
                if let Some((timeout, _)) = self.message.take() {
                    timeout.cancel();
                }
                true
            }
            Msg::LoadedFile(parser, parser_state, parser_cancelled) => {
                drop(self.reader.take());
                let parser = RcParser::new(*parser);
                self.state.update_parser(move |p| {
                    *p = Some(parser);
                    true
                });
                let file = OpenedFileInfo {
                    parser_state,
                    parser_cancelled,
                    filter: WeakComponentLink::default(),
                    update: Rc::new(RefCell::new(Err(Vec::new()))),
                    selected_nodes: Vec::new(),
                    selected_edges: Vec::new(),
                    rendered: None,
                };
                self.file = Some(file);
                if let Some(navigation_section) = self.navigation_section.cast::<web_sys::Element>()
                {
                    let _ = navigation_section.class_list().remove_1("expanded");
                }
                true
            }
            Msg::SelectedNodes(nodes) => {
                let Some(file) = &mut self.file else {
                    return false;
                };
                file.selected_nodes = nodes;
                true
            }
            Msg::SelectedEdges(edges) => {
                let Some(file) = &mut self.file else {
                    return false;
                };
                file.selected_edges = edges;
                true
            }
            Msg::ShowHelpToggled(showing_help) => {
                self.showing_help = showing_help;
                false
            }
            Msg::ToggleSidebar => {
                let Some(sidebar) = self.sidebar_ref.cast::<HtmlElement>() else {
                    return false;
                };
                let sidebar_closed = self.state.state.sidebar_closed;
                let open_files = self.file.is_some();
                if !ALLOW_HIDE_SIDEBAR_NO_FILE && !sidebar_closed && !open_files {
                    return false;
                }
                if sidebar_closed {
                    sidebar.class_list().remove_1("hide-sidebar").ok();
                } else {
                    sidebar.class_list().add_1("hide-sidebar").ok();
                }
                self.state.set_sidebar_closed(!sidebar_closed);
                false
            }
            Msg::SearchMatchingLoops => {
                log::info!("Searching matching loops");
                if let Some(_file) = &mut self.file {
                    let parser = self.state.state.parser.as_ref().unwrap();
                    if let Some(g) = &parser.graph {
                        let mut g = g.borrow_mut();
                        let ml_data = g.search_matching_loops(&mut parser.parser.borrow_mut());
                        let ml_data = MlData {
                            sure_mls: ml_data.sure_mls,
                            maybe_mls: ml_data.maybe_mls,
                        };
                        self.state.update_parser(move |p| {
                            p.as_mut().unwrap().ml_data = Some(ml_data);
                            true
                        });
                        return true;
                    }
                }
                log::info!("Returning false");
                false
            }
            Msg::StateChanged(state) => {
                self.state = state;
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

        let mut dropdowns = Vec::new();
        let current_trace = match &self.file {
            Some(file) => {
                if !self.state.state.ml_viewer_mode {
                    let ml_data = self.state.state.parser.as_ref().unwrap().ml_data;
                    let filters_state_link = self.filters_state_link.clone();
                    let new_filter = Callback::from(move |f| {
                        let Some(filters_state_link) = &*filters_state_link.borrow() else {
                            return;
                        };
                        filters_state_link.send_message(filters::Msg::AddFilter(true, f));
                    });
                    let filters_state_link = self.filters_state_link.clone();
                    let reset = Callback::from(move |e: MouseEvent| {
                        e.prevent_default();
                        let Some(filters_state_link) = &*filters_state_link.borrow() else {
                            return;
                        };
                        filters_state_link.send_message(filters::Msg::ResetOperations);
                    });
                    dropdowns.push(("View".to_string(), html! {<>
                        <AddFilterSidebar {new_filter} {ml_data} nodes={Vec::new()} general_filters={true}/>
                        <li><a draggable="false" href="#" onclick={reset}><div class="material-icons"><MatIcon>{"restore"}</MatIcon></div>{"Reset operations"}</a></li>
                    </>}));

                    // Selected nodes
                    let filters_state_link = self.filters_state_link.clone();
                    let new_filter = Callback::from(move |f| {
                        let Some(filters_state_link) = &*filters_state_link.borrow() else {
                            return;
                        };
                        filters_state_link.send_message(filters::Msg::AddFilter(false, f));
                    });
                    dropdowns.push(("Selection".to_string(), html! {<>
                        <AddFilterSidebar {new_filter} nodes={file.selected_nodes.clone()} general_filters={false}/>
                    </>}));
                }

                let search_matching_loops = ctx.link().callback(|_| Msg::SearchMatchingLoops);
                html! {
                    <FiltersState file={file.clone()} search_matching_loops={search_matching_loops} weak_link={self.filters_state_link.clone()} />
                }
            }
            None => html! {},
        };

        let parser = self.state.state.parser.clone();
        let parser_ref = parser.clone();
        let visible = self
            .file
            .as_ref()
            .and_then(|f| f.rendered.as_ref().map(|r| r.graph.clone()));
        let visible_ref = visible.clone();
        let search = Callback::from(move |query: String| {
            let parser = parser_ref.as_ref()?;
            let matches = parser.lookup.get_fuzzy(&query);
            Some(SearchActionResult::new(
                query,
                matches,
                parser,
                visible_ref.as_deref(),
            ))
        });
        let pick = Callback::from(move |(name, kind): (String, _)| {
            let parser = parser.as_ref()?;
            let entry = parser.lookup.get_exact(&name)?.get(&kind)?;
            Some(entry.get_visible(&parser.graph.as_ref()?.borrow(), visible.as_deref()?))
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
        let filters_state_link = self.filters_state_link.clone();
        let pick_nth_ml = Callback::from({
            let _file = self.file.clone();
            move |n: usize| {
                let Some(filters_state_link) = &*filters_state_link.borrow() else {
                    return;
                };
                filters_state_link.send_message(crate::filters::Msg::ClearOperations);
                filters_state_link.send_message(crate::filters::Msg::AddFilter(
                    false,
                    Filter::SelectNthMatchingLoop(n),
                ));
            }
        });

        // Callbacks
        let toggle_sidebar = ctx.link().callback(move |ev: MouseEvent| {
            ev.prevent_default();
            Msg::ToggleSidebar
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
        let page_class = if at_homepage {
            "page home-page"
        } else {
            "page"
        };

        let sidebar_html = (*self.sidebar).clone();
        let sidebar_html = sidebar_html.into_iter().map(|s| {
            let elements = s.elements.into_iter().filter_map(|e| match e {
                extra::ElementKind::Simple(simple_button) => {
                    if simple_button.disabled {
                        return None;
                    }
                    let (href, onmousedown) = match simple_button.click {
                        extra::Action::Href(href) => (href, None),
                        extra::Action::MouseDown(callback) => {
                            ("#".to_string(), Some(Callback::from(move |ev: MouseEvent| {
                                ev.prevent_default();
                                callback.emit(());
                            })))
                        }
                    };
                    let id = simple_button.text.to_lowercase().replace(" ", "_");
                    Some(html! {
                        <li><a {id} {href} draggable="false" {onmousedown}><div class="material-icons"><MatIcon>{simple_button.icon}</MatIcon></div>{simple_button.text}</a></li>
                    })
                }
                extra::ElementKind::Custom(data) => Some(data),
            }).collect::<Html>();
            html! {
                <SidebarSectionHeader header_text={s.header_text} collapsed_text={s.collapsed_text}><ul>
                    {elements}
                </ul></SidebarSectionHeader>
            }
        }).collect::<Html>();

        let sidebar = ctx.link().callback(Msg::UpdateSidebar);
        let topbar = ctx.link().callback(Msg::UpdateTopbar);
        let omnibox = ctx.link().callback(Msg::UpdateOmnibox);
        let initial = Change::Homepage(self.help_dialog.clone());

        html! {<>
            <nav class="sidebar" ref={&self.sidebar_ref}>
                <header class={header_class}><img src="html/logo_side_small.png" class="brand"/><div class="sidebar-button" onmousedown={toggle_sidebar}><MatIconButton icon="menu"></MatIconButton></div></header>
                <div class="sidebar-scroll"><div class="sidebar-scroll-container">
                    {sidebar_html}
                    // {current_trace}
                    <div class="sidebar-footer">
                        <div title="Number of pending operations" class="dbg-info-square"><div>{"OPS"}</div><div>{self.pending_ops}</div></div>
                        <div title="Service Worker: Serving from cache not implemented yet." class="dbg-info-square amber"><div>{"SW"}</div><div>{"NA"}</div></div>
                        <div class="version"><a href={version_link} title="Channel: stable" target="_blank">{version_info}</a></div>
                    </div>
                </div></div>
            </nav>
            <Topbar omnibox={self.omnibox.clone()} {message} {search} {pick} {select} {pick_nth_ml} {dropdowns} />
            <div class="alerts"></div>
            <ContextProvider<OmniboxMessageContext> context={self.omc.clone()}>
            <div class={page_class}>
                // {page}
                <Manager {sidebar} {topbar} {omnibox} {initial} />
            </div>
            </ContextProvider<OmniboxMessageContext>>

            // Shortcuts dialog
            <shortcuts::Shortcuts noderef={self.help_dialog.clone()} {onopened} {onclosed}/>
        </>}
    }
}

#[function_component(App)]
pub fn app() -> Html {
    html! {
        <main><GlobalCallbacksProvider><ConfigurationProvider><CommandsProvider><StateProviderContext>
            <FileDataComponent/>
        </StateProviderContext></CommandsProvider></ConfigurationProvider></GlobalCallbacksProvider></main>
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
/// See documentation of `MlData` in the parser crate.
pub struct MlData {
    pub sure_mls: usize,
    pub maybe_mls: usize,
}

impl MlData {
    pub fn sum(self) -> usize {
        self.sure_mls + self.maybe_mls
    }
}

pub struct RcParser {
    parser: Rc<RefCell<Z3Parser>>,
    lookup: Rc<StringLookupZ3>,
    colour_map: Rc<QuantIdxToColourMap>,
    graph: Option<Rc<RefCell<InstGraph>>>,
    ml_data: Option<MlData>,
}

impl Clone for RcParser {
    fn clone(&self) -> Self {
        Self {
            parser: self.parser.clone(),
            lookup: self.lookup.clone(),
            colour_map: self.colour_map.clone(),
            graph: self.graph.clone(),
            ml_data: self.ml_data,
        }
    }
}

impl PartialEq for RcParser {
    fn eq(&self, other: &Self) -> bool {
        std::ptr::eq(&*self.parser, &*other.parser)
            && self.graph.is_some() == other.graph.is_some()
            && self.ml_data == other.ml_data
    }
}
impl Eq for RcParser {}

impl RcParser {
    fn new(parser: Z3Parser) -> Self {
        let colour_map = QuantIdxToColourMap::new(&parser);
        let lookup = StringLookupZ3::init(&parser);
        Self {
            parser: Rc::new(RefCell::new(parser)),
            lookup: Rc::new(lookup),
            colour_map: Rc::new(colour_map),
            graph: None,
            ml_data: None,
        }
    }
}
