use std::{cell::RefCell, ops::Deref, rc::Rc};

use gloo::file::File;
use gloo_net::http::Response;
use smt_log_parser::{
    parsers::{AsyncBufferRead, AsyncParser, ParseState, ReaderState, StreamParser},
    LogParser, Z3Parser,
};
use wasm_bindgen::JsCast;
use wasm_streams::ReadableStream;
use wasm_timer::Instant;
use web_sys::DataTransfer;
use yew::{Callback, DragEvent};

use crate::{
    global_callbacks::GlobalCallbacks,
    infobars::{OmniboxMessage, OmniboxMessageKind},
    screen::{homepage::HomepageM, Manager, Scope},
    state::FileInfo,
    utils::colouring::QuantIdxToColourMap,
    CallbackRef, OmniboxContext, PREVENT_DEFAULT_DRAG_OVER,
};

use super::{example::Example, Homepage};

#[derive(Clone)]
pub struct RcParser(Rc<Parser>);

impl PartialEq for RcParser {
    fn eq(&self, other: &Self) -> bool {
        Rc::ptr_eq(&self.0, &other.0)
    }
}

impl Deref for RcParser {
    type Target = Parser;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl RcParser {
    pub fn new(parser: Z3Parser) -> Self {
        let colour_map = QuantIdxToColourMap::new(&parser);
        // let lookup = StringLookupZ3::init(&parser);
        let parser = Parser {
            parser: RefCell::new(parser),
            // lookup,
            colour_map,
        };
        Self(Rc::new(parser))
    }
}

pub struct Parser {
    pub parser: RefCell<Z3Parser>,
    // pub lookup: StringLookupZ3,
    pub colour_map: QuantIdxToColourMap,
}

#[derive(Debug, Clone, PartialEq, Default)]
pub enum LoadingState {
    #[default]
    NoFileSelected,
    ReadingToString,
    StartParsing,
    Parsing(ParseProgress, Callback<()>),
    /// Stopped early, cancelled?
    DoneParsing(bool, bool),
    FileDisplayed,
}

#[derive(Debug, Clone, PartialEq)]
pub struct ParseProgress {
    pub reader: ReaderState,
    pub file_size: Option<u64>,
    time: Instant,
    bytes_delta: Option<usize>,
    time_delta: Option<std::time::Duration>,
    pub speed: Option<f64>,
    pub memory_use: usize,
}

impl ParseProgress {
    fn new(reader: ReaderState, file_size: Option<u64>, memory_use: usize) -> Self {
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
pub struct FileData {
    pub file_info: FileInfo,
    pub opened: Option<OpenedFileInfo>,
}

#[derive(Clone)]
pub struct OpenedFileInfo {
    pub parser: RcParser,
    pub state: ParseState<bool>,
    pub cancelled: bool,
}

impl PartialEq for OpenedFileInfo {
    fn eq(&self, other: &Self) -> bool {
        self.parser == other.parser
            && core::mem::discriminant(&self.state) == core::mem::discriminant(&other.state)
            && self.cancelled == other.cancelled
    }
}

impl Homepage {
    const BROWSER_MEM_LIMIT: usize = 2 * 1024 * 1024 * 1024;
    const MAX_PARSE_BYTES: usize = Self::BROWSER_MEM_LIMIT / 2;

    pub(super) fn file_drag(registerer: &GlobalCallbacks, link: &Scope<Self>) -> [CallbackRef; 3] {
        /// Detects if a file is being dragged over the window
        fn file_drag(event: &DragEvent) -> bool {
            event
                .data_transfer()
                .as_ref()
                .map(DataTransfer::types)
                .is_some_and(|types| {
                    types
                        .iter()
                        .flat_map(|ty| ty.as_string())
                        .any(|ty| ty == "Files")
                })
        }
        let last_drag_target = Rc::new(RefCell::new(None));
        let last_drag_target_ref = last_drag_target.clone();
        let drag_enter_ref =
            (registerer.register_drag_enter)(Callback::from(move |event: DragEvent| {
                *last_drag_target_ref.borrow_mut() = event.target();
                if file_drag(&event) {
                    if let Some(mut pd) =
                        PREVENT_DEFAULT_DRAG_OVER.get().and_then(|p| p.lock().ok())
                    {
                        *pd = true;
                    }
                    event.prevent_default();
                    if let Some(body) = gloo::utils::document().get_element_by_id("body") {
                        body.class_list().add_1("filedrag").ok();
                    }
                }
            }));
        fn drag_end() {
            if let Some(body) = gloo::utils::document().get_element_by_id("body") {
                if body.class_list().contains("filedrag") {
                    if let Some(mut pd) =
                        PREVENT_DEFAULT_DRAG_OVER.get().and_then(|p| p.lock().ok())
                    {
                        *pd = false;
                    }
                    body.class_list().remove_1("filedrag").ok();
                }
            }
        }
        let drag_leave_ref =
            (registerer.register_drag_leave)(Callback::from(move |event: DragEvent| {
                if file_drag(&event) && *last_drag_target.borrow() == event.target() {
                    drag_end();
                }
            }));
        let link = link.clone();
        let drop_ref = (registerer.register_drop)(Callback::from(move |event: DragEvent| {
            if file_drag(&event) {
                event.prevent_default();
                drag_end();
                let file = event
                    .data_transfer()
                    .as_ref()
                    .and_then(DataTransfer::files)
                    .and_then(|files| (files.length() == 1).then(|| files.get(0).unwrap()))
                    .map(File::from);
                link.send_message(HomepageM::OpenFile(file));
            }
        }));
        [drag_enter_ref, drag_leave_ref, drop_ref]
    }

    fn pre_open_file(&mut self, file_info: FileInfo, link: &Scope<Self>) {
        // hide the flags page if shown
        self.toggle_flags.borrow().emit(Some(false));
        link.clear_omnibox();

        drop(self.file.take());
        drop(self.reader.take());
        self.file = Some(FileData {
            file_info,
            opened: None,
        });
    }

    pub(super) fn load_example(
        &mut self,
        example: Example,
        response: Response,
        link: &Scope<Self>,
    ) -> bool {
        let size = response
            .headers()
            .get("Content-Length")
            .and_then(|s| s.parse().ok());
        let file_info = FileInfo {
            name: example.file_name(),
            size,
        };
        self.pre_open_file(file_info, link);

        *self.stop_loading.borrow_mut() = false;
        let stop_loading = self.stop_loading.clone();
        let link = link.clone();

        match response
            .body()
            .map(|body| ReadableStream::from_raw(body).try_into_async_read())
        {
            Some(Ok(stream)) => {
                link.send_message(HomepageM::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_async(stream.buffer());
                wasm_bindgen_futures::spawn_local(async move {
                    Self::parse_async(parser, stop_loading, size, link, None).await
                });
            }
            None | Some(Err(..)) => wasm_bindgen_futures::spawn_local(async move {
                let text_data = match response.text().await {
                    Ok(text) => text,
                    Err(err) => {
                        link.send_message(HomepageM::FailedOpening(err.to_string()));
                        return;
                    }
                };
                let memory_use = text_data.len() + 64 * 1024 * 1024;
                let remaining_memory = Self::BROWSER_MEM_LIMIT.saturating_sub(memory_use);

                link.send_message(HomepageM::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_str(&text_data);
                Self::parse_stream(parser, stop_loading, size, link, Some(remaining_memory)).await
            }),
        }

        true
    }

    pub(super) fn load_opened_file(&mut self, file: File, link: &Scope<Self>) -> bool {
        let file_info = FileInfo {
            name: file.name(),
            size: Some(file.size()),
        };
        self.pre_open_file(file_info.clone(), link);

        *self.stop_loading.borrow_mut() = false;
        let stop_loading = self.stop_loading.clone();
        let link = link.clone();

        log::info!("Selected file \"{}\"", file_info.name);
        // Turn into stream
        let blob: &web_sys::Blob = file.as_ref();
        let stream = ReadableStream::from_raw(blob.stream().unchecked_into());
        match stream.try_into_async_read() {
            Ok(stream) => {
                link.send_message(HomepageM::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_async(stream.buffer());
                wasm_bindgen_futures::spawn_local(async move {
                    Self::parse_async(parser, stop_loading, file_info.size, link, None).await
                });
            }
            Err((_err, _stream)) => {
                log::info!("Loading to string \"{}\"", file_info.name);
                link.send_message(HomepageM::LoadingState(LoadingState::ReadingToString));
                let reader = gloo::file::callbacks::read_as_text(&file, move |res| {
                    let text_data = match res {
                        Ok(res) => res,
                        Err(err) => {
                            link.send_message(HomepageM::FailedOpening(err.to_string()));
                            return;
                        }
                    };
                    let remaining_memory =
                        Self::BROWSER_MEM_LIMIT - text_data.len() - 64 * 1024 * 1024;

                    log::info!("Parsing \"{}\"", file_info.name);
                    link.send_message(HomepageM::LoadingState(LoadingState::StartParsing));
                    wasm_bindgen_futures::spawn_local(async move {
                        let parser = Z3Parser::from_str(&text_data);
                        Self::parse_stream(
                            parser,
                            stop_loading,
                            file_info.size,
                            link,
                            Some(remaining_memory),
                        )
                        .await
                    });
                });
                self.reader = Some(reader);
            }
        };
        true
    }

    #[duplicate::duplicate_item(
        parse          EitherParser   IS_STREAM add_await(code);
        [parse_stream] [StreamParser] [true]    [code];
        [parse_async]  [AsyncParser]  [false]   [code.await];
    )]
    async fn parse(
        mut parser: EitherParser<'_, Z3Parser>,
        stop_loading: Rc<RefCell<bool>>,
        size: Option<u64>,
        link: Scope<Self>,
        use_mem_limit: Option<usize>,
    ) {
        let limited_by_async = use_mem_limit.is_some_and(|l| l < Self::MAX_PARSE_BYTES);
        let use_mem_limit = if limited_by_async {
            use_mem_limit.unwrap()
        } else {
            Self::MAX_PARSE_BYTES
        };

        let finished = loop {
            let mut lines_to_read = 100_000;
            let finished = add_await([parser.process_until(|_, _| {
                lines_to_read -= 1;
                let pause = lines_to_read == 0;
                (pause || *stop_loading.borrow()).then_some(pause)
            })]);
            let ParseState::Paused(true, state) = finished else {
                break finished;
            };
            use mem_dbg::MemSize;
            let mem_size = parser.parser().mem_size(mem_dbg::SizeFlags::empty());
            if mem_size > use_mem_limit {
                break finished;
            }
            let parsing = ParseProgress::new(state, size, mem_size);
            let stop_loading = stop_loading.clone();
            link.send_message(HomepageM::LoadingState(LoadingState::Parsing(
                parsing,
                Callback::from(move |_| {
                    *stop_loading.borrow_mut() = true;
                }),
            )));
            gloo::timers::future::TimeoutFuture::new(0).await;
        };
        let stop_loading = *stop_loading.borrow();
        match finished {
            ParseState::Paused(..) if !stop_loading => {
                let addendum = if limited_by_async {
                    ", use Chrome or Firefox to increase this limit"
                } else {
                    " due to browser memory limit"
                };
                let message = OmniboxMessage {
                    message: format!(
                        "Stopped parsing at {}MB{addendum}",
                        use_mem_limit / 1024 / 1024,
                    ),
                    kind: OmniboxMessageKind::Warning,
                };
                let message_time = if limited_by_async { 6000 } else { 3000 };
                link.omnibox_message(message, message_time);
            }
            ParseState::Error(err) => {
                link.send_message(HomepageM::FailedOpening(err.to_string()));
                return;
            }
            _ => (),
        }
        link.send_message(HomepageM::LoadingState(LoadingState::DoneParsing(
            finished.is_timeout(),
            stop_loading,
        )));
        link.send_message(HomepageM::LoadedFile(
            Box::new(parser.take_parser()),
            finished,
            stop_loading,
        ))
    }
}
