mod example;
mod file;
mod screen;

use std::cell::RefCell;
use std::rc::Rc;
use std::sync::Mutex;

use gloo::file::{callbacks::FileReader, File, FileList};
use gloo::net::http::Response;
use material_yew::{dialog::MatDialog, WeakComponentLink};
use smt_log_parser::parsers::ParseState;
use smt_log_parser::Z3Parser;
use web_sys::HtmlInputElement;
use yew::DragEvent;
use yew::{html, html::Scope, Callback, Html, NodeRef};

use crate::commands::{Command, CommandRef, CommandsContext, ShortcutKey};
use crate::configuration::Flags;
use crate::filters::byte_size_display;
use crate::infobars::{OmniboxMessage, OmniboxMessageKind};
use crate::results::svg_result::RenderingState;
use crate::screen::file::FileProps;
use crate::screen::Change;
use crate::state::FileInfo;
use crate::utils::overlay_page::{Overlay, SetVisibleCallback};
use crate::{CallbackRef, GlobalCallbacksContext, OmniboxContext, PREVENT_DEFAULT_DRAG_OVER};

use super::{extra::*, Manager, Screen};

pub use self::file::*;
use self::{example::Example, screen::HomepageScreen};

pub struct Homepage {
    file_select: NodeRef,
    stop_loading: Rc<RefCell<bool>>,
    file: Option<FileData>,
    reader: Option<FileReader>,
    progress: LoadingState,

    toggle_flags: SetVisibleCallback,
    overlay_visible: bool,
    navigation_section: SidebarSectionRef,

    nested_sidebar: Rc<Sidebar>,
    nested_topbar: Rc<Topbar>,
    nested_omnibox: Rc<Omnibox>,

    _callback_refs: [CallbackRef; 4],
    _command_refs: [CommandRef; 1],
}

impl Homepage {
    pub fn opened_file(&self) -> Option<(&FileInfo, &OpenedFileInfo)> {
        self.file
            .as_ref()
            .and_then(|file| file.opened.as_ref().map(|opened| (&file.file_info, opened)))
    }
}

pub enum HomepageM {
    OpenFile(Option<File>),
    OpenExample(Example),
    OpenedExample(Example, Response),
    LoadingState(LoadingState),
    FailedOpening(String),
    LoadedFile(Box<Z3Parser>, ParseState<bool>, bool),
    CloseFile,

    OverlayVisible(bool),

    NestedSidebar(Rc<Sidebar>),
    NestedTopbar(Rc<Topbar>),
    NestedOmnibox(Rc<Omnibox>),
}

impl Screen for Homepage {
    type Message = HomepageM;
    type Properties = WeakComponentLink<MatDialog>;

    fn create(link: &Scope<Manager>, _props: &Self::Properties) -> Self {
        let toggle_flags = SetVisibleCallback::default();

        // Callbacks

        let registerer = link.get_callbacks_registerer().unwrap();
        let pd = PREVENT_DEFAULT_DRAG_OVER.get_or_init(Mutex::default);
        let drag_over_ref = (registerer.register_drag_over)(Callback::from(|event: DragEvent| {
            let pd = *pd.lock().unwrap();
            if pd {
                event.prevent_default();
            }
        }));
        let [drag_enter_ref, drag_leave_ref, drop_ref] = Self::file_drag(&registerer, link);
        let _callback_refs = [drag_over_ref, drag_enter_ref, drag_leave_ref, drop_ref];

        // Commands

        let commands = link.get_commands_registerer().unwrap();
        let flags_visible_ref = toggle_flags.clone();
        let toggle_flags_cmd = Command {
            name: "Toggle flags page".to_string(),
            execute: Callback::from(move |_| {
                flags_visible_ref.borrow().emit(None);
            }),
            keyboard_shortcut: ShortcutKey::cmd(','),
            disabled: false,
        };
        let toggle_flags_cmd = (commands)(toggle_flags_cmd);
        let _command_refs = [toggle_flags_cmd];

        Self {
            file_select: NodeRef::default(),
            stop_loading: Default::default(),
            file: None,
            reader: None,
            progress: LoadingState::NoFileSelected,

            toggle_flags,
            overlay_visible: false,
            navigation_section: Default::default(),

            nested_sidebar: Default::default(),
            nested_topbar: Default::default(),
            nested_omnibox: Default::default(),

            _callback_refs,
            _command_refs,
        }
    }

    fn update(
        &mut self,
        link: &Scope<Manager>,
        _props: &Self::Properties,
        msg: Self::Message,
    ) -> bool {
        match msg {
            HomepageM::OpenFile(file) => {
                let Some(file) = file else {
                    return false;
                };
                self.load_opened_file(file, link)
            }
            HomepageM::OpenExample(example) => {
                let file = gloo_net::http::Request::get(&example.file_path()).send();
                let link = link.clone();
                wasm_bindgen_futures::spawn_local(async move {
                    match file.await {
                        Ok(response) => {
                            link.send_message(HomepageM::OpenedExample(example, response))
                        }
                        Err(e) => link
                            .send_message(HomepageM::FailedOpening(format!("Failed to load: {e}"))),
                    };
                });
                false
            }
            HomepageM::OpenedExample(example, response) => {
                self.load_example(example, response, link)
            }
            HomepageM::LoadingState(mut state) => {
                log::info!("New state \"{state:?}\"");
                if let (LoadingState::Parsing(parsing, _), LoadingState::Parsing(old, _)) =
                    (&mut state, &self.progress)
                {
                    parsing.delta(old);
                }
                self.progress = state;
                true
            }
            HomepageM::FailedOpening(error) => {
                log::error!("Failed to open file: {error}");

                let message = OmniboxMessage {
                    message: error,
                    kind: OmniboxMessageKind::Error,
                };
                link.omnibox_message(message, 10000);

                link.send_message(HomepageM::CloseFile);
                let _ = self.navigation_section.expand();
                false
            }
            HomepageM::LoadedFile(parser, state, cancelled) => {
                drop(self.reader.take());
                let Some(file) = &mut self.file else {
                    link.send_message(HomepageM::FailedOpening(
                        "Internal error, no file info found".to_string(),
                    ));
                    return false;
                };
                if file.opened.is_some() {
                    link.send_message(HomepageM::FailedOpening(
                        "Internal error, file already loaded".to_string(),
                    ));
                    return false;
                }

                file.opened = Some(OpenedFileInfo {
                    parser: RcParser::new(*parser),
                    state,
                    cancelled,
                });
                let _ = self.navigation_section.collapse();
                true
            }
            HomepageM::CloseFile => {
                self.progress = LoadingState::NoFileSelected;
                let file = self.file.take();
                drop(file);
                true
            }

            HomepageM::OverlayVisible(visible) => {
                self.overlay_visible = visible;
                true
            }

            HomepageM::NestedSidebar(sidebar) => {
                self.nested_sidebar = sidebar;
                true
            }
            HomepageM::NestedTopbar(topbar) => {
                self.nested_topbar = topbar;
                true
            }
            HomepageM::NestedOmnibox(omnibox) => {
                self.nested_omnibox = omnibox;
                true
            }
        }
    }

    fn view(&self, link: &Scope<Manager>, _props: &Self::Properties) -> Html {
        let file_select = self.file_select.clone();
        let onchange = link.callback(move |_| {
            let files = file_select.cast::<HtmlInputElement>().unwrap().files();
            HomepageM::OpenFile(
                files
                    .map(FileList::from)
                    .and_then(|files| (files.len() == 1).then(|| files[0].clone())),
            )
        });

        let flags_visible_changed = link.callback(HomepageM::OverlayVisible);

        let screen = match self.opened_file() {
            Some((info, opened)) => {
                let sidebar = link.callback(HomepageM::NestedSidebar);
                let topbar = link.callback(HomepageM::NestedTopbar);
                let omnibox = link.callback(HomepageM::NestedOmnibox);
                let props = FileProps {
                    file_info: info.clone(),
                    opened_file: opened.clone(),
                    overlay_visible: self.overlay_visible,
                };
                let initial = Change::File(props);
                html! {<Manager {sidebar} {topbar} {omnibox} {initial} />}
            }
            _ => html! {<HomepageScreen />},
        };

        html! {<>
            <input type="file" ref={&self.file_select} class="trace_file" accept=".log" {onchange} multiple=false/>
            {screen}
            <Overlay visible_changed={flags_visible_changed} set_visible={self.toggle_flags.clone()}><Flags /></Overlay>
        </>}
    }

    fn view_sidebar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Sidebar {
        let file_select = self.file_select.clone();
        let open_file = Callback::from(move |_| {
            let input = file_select.cast::<HtmlInputElement>().unwrap();
            input.click();
        });

        let open_file = ElementKind::Simple(SimpleButton {
            icon: "folder_open",
            text: "Open trace file".to_string(),
            disabled: false,
            click: Action::MouseDown(open_file),
        });
        let examples = Example::elements(link);
        let close_file = ElementKind::Simple(SimpleButton {
            icon: "close",
            text: "Close file".to_string(),
            disabled: self.file.is_none(),
            click: Action::MouseDown(link.callback(|()| HomepageM::CloseFile)),
        });

        let help_dialog = props.clone();
        let show_shortcuts = Callback::from(move |()| {
            help_dialog.show();
        });

        let toggle_flags = self.toggle_flags.clone();
        let toggle_flags = Callback::from(move |()| {
            toggle_flags.borrow().emit(None);
        });

        let naviagation = SidebarSection {
            ref_: self.navigation_section.clone(),
            header_text: "Navigation",
            collapsed_text: "Open a new trace".to_string(),
            elements: [open_file]
                .into_iter()
                .chain(examples)
                .chain([close_file])
                .collect(),
        };
        let support = SidebarSection {
            ref_: Default::default(),
            header_text: "Support",
            collapsed_text: "Documentation & Bugs".to_string(),
            elements: vec![
                ElementKind::Simple(SimpleButton {
                    icon: "help",
                    text: "Keyboard shortcuts".to_string(),
                    disabled: false,
                    click: Action::MouseDown(show_shortcuts),
                }),
                ElementKind::Simple(SimpleButton {
                    icon: "find_in_page",
                    text: "Documentation".to_string(),
                    disabled: false,
                    click: Action::Href(
                        "https://github.com/viperproject/axiom-profiler-2/blob/main/README.md"
                            .to_string(),
                    ),
                }),
                ElementKind::Simple(SimpleButton {
                    icon: "emoji_flags",
                    text: "Flags".to_string(),
                    disabled: false,
                    click: Action::MouseDown(toggle_flags),
                }),
                ElementKind::Simple(SimpleButton {
                    icon: "bug_report",
                    text: "Report a bug".to_string(),
                    disabled: false,
                    click: Action::Href(
                        "https://github.com/viperproject/axiom-profiler-2/issues/new".to_string(),
                    ),
                }),
            ],
        };
        [naviagation]
            .into_iter()
            .chain(self.nested_sidebar.iter().cloned())
            .chain([support])
            .collect()
    }

    fn view_topbar(&self, _link: &Scope<Manager>, _props: &Self::Properties) -> Topbar {
        (*self.nested_topbar).clone()
    }

    fn view_omnibox(&self, _link: &Scope<Manager>, _props: &Self::Properties) -> Omnibox {
        if self.opened_file().is_some() {
            (*self.nested_omnibox).clone()
        } else {
            let mut omnibox = Omnibox::default();

            match &self.progress {
                LoadingState::NoFileSelected => (),
                LoadingState::ReadingToString => {
                    omnibox.placeholder = "Loading trace".to_string();
                    omnibox.progress.indeterminate = true;
                    omnibox.progress.closed = false;
                }
                LoadingState::StartParsing => {
                    omnibox.placeholder = "Parsing trace".to_string();
                    omnibox.progress.progress = 0.0;
                    omnibox.progress.closed = false;
                }
                LoadingState::Parsing(parsing, cancel) => {
                    omnibox.icon = "stop_circle";
                    omnibox.icon_mousedown = Some(cancel.clone());

                    let progress = parsing
                        .file_size
                        .map(|size| {
                            let progress = parsing.reader.bytes_read as f64 / size as f64;
                            format!("{:.0}%", progress * 100.0)
                        })
                        .unwrap_or_else(|| "?".to_string());
                    let speed = parsing
                        .speed
                        .map(byte_size_display)
                        .map(|(speed, unit)| format!(" - {speed:.0} {unit}/s",));
                    let (memory_use, unit) = byte_size_display(parsing.memory_use as f64);
                    let info = format!(
                        "Parsing trace {progress}{} | Use {memory_use:.0}{unit}",
                        speed.unwrap_or_default()
                    );
                    omnibox.placeholder = info;

                    if let Some(size) = parsing.file_size {
                        omnibox.progress.progress =
                            (parsing.reader.bytes_read as f64 / size as f64) as f32;
                    } else {
                        omnibox.progress.indeterminate = true;
                    }
                    omnibox.progress.closed = false;
                }
                LoadingState::DoneParsing(..) => {
                    omnibox.progress.progress = 1.0;
                    omnibox.progress.closed = false;
                }
                // TODO: move this to the file screen
                LoadingState::Rendering(render_state, timeout, _) => {
                    match render_state {
                        RenderingState::ConstructingGraph | RenderingState::ConstructedGraph => {
                            if *timeout {
                                omnibox.placeholder = "Analysing partial trace".to_string();
                            } else {
                                omnibox.placeholder = "Analysing trace".to_string();
                            }
                        }
                        RenderingState::GraphToDot | RenderingState::RenderingGraph => {
                            omnibox.placeholder = "Rendering trace".to_string()
                        }
                    }
                    omnibox.progress.progress = 1.0;
                    omnibox.progress.indeterminate = true;
                    omnibox.progress.closed = false;
                }
                LoadingState::FileDisplayed => omnibox.progress.progress = 1.0,
            };
            omnibox.disabled = !matches!(
                self.progress,
                LoadingState::NoFileSelected | LoadingState::FileDisplayed
            );
            omnibox
        }
    }
}
