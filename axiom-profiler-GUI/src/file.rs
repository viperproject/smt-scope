use std::{cell::RefCell, rc::Rc};

use gloo::file::File;
use gloo_net::http::Response;
use smt_log_parser::{
    parsers::{AsyncBufferRead, ParseState},
    LogParser, Z3Parser,
};
use wasm_bindgen::JsCast;
use wasm_streams::ReadableStream;
use web_sys::DataTransfer;
use yew::{html::Scope, Callback, DragEvent};

use crate::{
    example::Example,
    global_callbacks::GlobalCallbacks,
    infobars::OmnibarMessage,
    state::{FileInfo, StateContext},
    CallbackRef, FileDataComponent, LoadingState, Msg, ParseProgress, PREVENT_DEFAULT_DRAG_OVER,
};

impl FileDataComponent {
    pub fn file_drag(
        registerer: &GlobalCallbacks,
        link: &Scope<FileDataComponent>,
    ) -> [CallbackRef; 3] {
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
                link.send_message(Msg::File(file));
            }
        }));
        [drag_enter_ref, drag_leave_ref, drop_ref]
    }

    pub fn pre_open_file(
        &mut self,
        name: String,
        size: Option<u64>,
        link: &Scope<FileDataComponent>,
    ) -> bool {
        // remove any old parser in the state
        let state = link.get_state().unwrap();
        state.close_file();
        state.update_file_info(move |info| {
            *info = Some(FileInfo { name, size });
            true
        });

        // hide the flags page if shown
        self.flags_visible.borrow().emit(Some(false));

        let changed = self.file.is_some();
        drop(self.file.take());
        drop(self.reader.take());
        changed
    }

    pub fn load_example(
        &mut self,
        example: Example,
        response: Response,
        link: &Scope<FileDataComponent>,
    ) -> bool {
        let size = response
            .headers()
            .get("Content-Length")
            .and_then(|s| s.parse().ok());
        let changed = self.pre_open_file(example.file_name(), size, link);

        *self.cancel.borrow_mut() = false;
        let cancel = self.cancel.clone();
        let link = link.clone();

        match response
            .body()
            .map(|body| ReadableStream::from_raw(body).try_into_async_read())
        {
            Some(Ok(stream)) => {
                link.send_message(Msg::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_async(stream.buffer());
                wasm_bindgen_futures::spawn_local(async move {
                    Self::parse_async(
                        parser,
                        cancel,
                        size,
                        link,
                        1024 * 1024 * 1024,
                        "Stopped parsing at 1GB",
                    )
                    .await
                });
            }
            None | Some(Err(..)) => wasm_bindgen_futures::spawn_local(async move {
                let text_data = match response.text().await {
                    Ok(text) => text,
                    Err(err) => {
                        link.send_message(Msg::FailedOpening(err.to_string()));
                        return;
                    }
                };

                link.send_message(Msg::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_str(&text_data);
                Self::parse_stream(
                    parser,
                    cancel,
                    size,
                    link,
                    512 * 1024 * 1024,
                    "Stopped parsing at 500MB, use Chrome or Firefox to increase this limit",
                )
                .await
            }),
        }

        changed
    }

    pub fn load_opened_file(&mut self, file: File, link: &Scope<FileDataComponent>) -> bool {
        let file_name = file.name();
        let file_size = file.size();
        let changed = self.pre_open_file(file_name.clone(), Some(file_size), link);

        *self.cancel.borrow_mut() = false;
        let cancel = self.cancel.clone();
        let link = link.clone();

        log::info!("Selected file \"{file_name}\"");
        // Turn into stream
        let blob: &web_sys::Blob = file.as_ref();
        let stream = ReadableStream::from_raw(blob.stream().unchecked_into());
        match stream.try_into_async_read() {
            Ok(stream) => {
                link.send_message(Msg::LoadingState(LoadingState::StartParsing));
                let parser = Z3Parser::from_async(stream.buffer());
                wasm_bindgen_futures::spawn_local(async move {
                    Self::parse_async(
                        parser,
                        cancel,
                        Some(file_size),
                        link,
                        1024 * 1024 * 1024,
                        "Stopped parsing at 1GB",
                    )
                    .await
                });
            }
            Err((_err, _stream)) => {
                log::info!("Loading to string \"{file_name}\"");
                link.send_message(Msg::LoadingState(LoadingState::ReadingToString));
                let reader = gloo::file::callbacks::read_as_text(&file, move |res| {
                    let text_data = match res {
                        Ok(res) => res,
                        Err(err) => {
                            link.send_message(Msg::FailedOpening(err.to_string()));
                            return;
                        }
                    };
                    log::info!("Parsing \"{file_name}\"");
                    link.send_message(Msg::LoadingState(LoadingState::StartParsing));
                    wasm_bindgen_futures::spawn_local(async move {
                        let parser = Z3Parser::from_str(&text_data);
                        Self::parse_stream(parser, cancel, Some(file_size), link, 512 * 1024 * 1024, "Stopped parsing at 500MB, use Chrome or Firefox to increase this limit").await
                    });
                });
                self.reader = Some(reader);
            }
        };
        changed
    }

    #[duplicate::duplicate_item(
        parse          EitherParser   add_await(code);
        [parse_stream] [StreamParser] [code];
        [parse_async]  [AsyncParser]  [code.await];
    )]
    async fn parse(
        mut parser: smt_log_parser::parsers::EitherParser<'_, Z3Parser>,
        cancel: Rc<RefCell<bool>>,
        size: Option<u64>,
        link: yew::html::Scope<FileDataComponent>,
        use_mem_limit: usize,
        mem_limit_msg: &str,
    ) {
        let finished = loop {
            let mut lines_to_read = 100_000;
            let finished = add_await([parser.process_until(|_, _| {
                lines_to_read -= 1;
                let pause = lines_to_read == 0;
                (pause || *cancel.borrow()).then_some(pause)
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
            let cancel = cancel.clone();
            link.send_message(Msg::LoadingState(LoadingState::Parsing(
                parsing,
                Callback::from(move |_| {
                    *cancel.borrow_mut() = true;
                }),
            )));
            gloo::timers::future::TimeoutFuture::new(0).await;
        };
        let cancel = *cancel.borrow();
        match finished {
            ParseState::Paused(..) if !cancel => {
                let message = OmnibarMessage {
                    message: mem_limit_msg.to_string(),
                    is_error: false,
                };
                link.send_message(Msg::ShowMessage(message, 8000));
            }
            ParseState::Error(err) => {
                link.send_message(Msg::FailedOpening(err.to_string()));
                return;
            }
            _ => (),
        }
        link.send_message(Msg::LoadingState(LoadingState::DoneParsing(
            finished.is_timeout(),
            cancel,
        )));
        link.send_message(Msg::LoadedFile(
            Box::new(parser.take_parser()),
            finished,
            cancel,
        ))
    }
}
