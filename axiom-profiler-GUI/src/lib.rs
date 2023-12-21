use gloo_file::{callbacks::FileReader, FileList};
use results::svg_result::SVGResult;
use smt_log_parser::parsers::z3::z3parser::Z3Parser;
use smt_log_parser::parsers::{AsyncBufferRead, AsyncCursorRead, AsyncParser, LogParser};
use wasm_bindgen::JsCast;
use wasm_streams::ReadableStream;
use web_sys::{Event, HtmlInputElement};
use yew::prelude::*;
use yew_router::prelude::*;

// use crate::svg_result::SVGResult;

// mod filter_chain;
// mod graph;
// mod graph_filters;
// mod input_state;
// mod selected_node;
// mod svg_result;
// mod toggle_switch;
// mod graph_container;
pub mod results;
mod utils;
// mod select_dropdown;
pub enum Msg {
    LoadedFile(String, Z3Parser),
    Files(Option<FileList>),
}

pub struct FileDataComponent {
    files: Vec<RcParser>,
    readers: Vec<FileReader>,
}

impl Component for FileDataComponent {
    type Message = Msg;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            files: Vec::new(),
            readers: Vec::new(),
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Files(files) => {
                let Some(files) = files else {
                    return false;
                };
                let changed = !self.files.is_empty() || !self.readers.is_empty();
                self.files.clear();
                self.readers.clear();
                log::info!("Files selected: {}", files.len());
                for file in files.into_iter() {
                    let file_name = file.name();
                    // Turn into stream
                    let blob: &web_sys::Blob = file.as_ref();
                    let stream = ReadableStream::from_raw(blob.stream().unchecked_into());
                    match stream.try_into_async_read() {
                        Ok(stream) => {
                            let link = ctx.link().clone();
                            let parser = Z3Parser::from_async(stream.buffer());
                            wasm_bindgen_futures::spawn_local(async move {
                                log::info!("Parsing: {file_name}");
                                let parser = parser.process_all().await;
                                link.send_message(Msg::LoadedFile(file_name, parser))
                            });
                        }
                        Err((_err, _stream)) => {
                            let link = ctx.link().clone();
                            let reader = gloo_file::callbacks::read_as_bytes(file, move |res| {
                                log::info!("Loading to string: {file_name}");
                                let text_data =
                                    String::from_utf8(res.expect("failed to read file")).unwrap();
                                log::info!("Parsing: {file_name}");
                                let parser = Z3Parser::from_str(&text_data).process_all();
                                link.send_message(Msg::LoadedFile(file_name, parser))
                            });
                            self.readers.push(reader);
                        }
                    };
                }
                changed
            }
            Msg::LoadedFile(file_name, parser) => {
                log::info!("Processing: {file_name}");
                self.files.push(RcParser::new(parser));
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let on_change = ctx.link().callback(move |e: Event| {
            let files = e.target_dyn_into::<HtmlInputElement>().unwrap().files();
            Msg::Files(files.map(FileList::from))
        });
        // Parse the timestamp at compile time
        let timestamp =
            chrono::DateTime::parse_from_rfc3339(env!("VERGEN_GIT_COMMIT_TIMESTAMP")).unwrap();
        // Format using https://docs.rs/chrono/latest/chrono/format/strftime/index.html
        let version_info = format!(
            "{} ({})",
            env!("VERGEN_GIT_DESCRIBE"),
            timestamp.format("%-d %b %y %H:%M")
        );
        html! {
            <div>
                <div style="height: 13vh;">
                    <div style="display: flex; justify-content: space-between; padding: 0;">
                        <h1>{"Axiom Profiler"}</h1>

                        <p><small>{version_info}</small></p>
                    </div>
                    <div>
                        <input type="file" accept=".log" onchange={on_change} multiple=false/>
                    </div>
                </div>
                <div style="display: flex; ">
                    { for self.files.iter().map(|f| Self::view_file(RcParser::clone(f)))}
                </div>
            </div>
        }
    }
}

impl FileDataComponent {
    fn view_file(data: RcParser) -> Html {
        log::debug!("Viewing file");
        html! {
            <SVGResult parser={data}/>
        }
    }
}

#[function_component(App)]
pub fn app() -> Html {
    html! {
        <>
        // <div>
            // <h1>{"Axiom Profiler"}</h1>
            <FileDataComponent/>
        // </div>
        </>
    }
}

#[function_component(Test)]
fn test() -> Html {
    html! {
        <div>
        <h1>{"test"}</h1>
        </div>
    }
}

#[derive(Routable, Clone, PartialEq)]
enum Route {
    #[at("/")]
    App,
    #[at("/test")]
    Test,
}

pub struct RcParser(std::rc::Rc<Z3Parser>);

impl std::ops::Deref for RcParser {
    type Target = Z3Parser;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Clone for RcParser {
    fn clone(&self) -> Self {
        Self(self.0.clone())
    }
}

impl PartialEq for RcParser {
    fn eq(&self, other: &Self) -> bool {
        std::ptr::eq(&*self.0, &*other.0)
    }
}

impl RcParser {
    fn new(parser: Z3Parser) -> Self {
        Self(std::rc::Rc::new(parser))
    }
    pub(crate) fn as_ptr(&self) -> *const Z3Parser {
        std::rc::Rc::as_ptr(&self.0)
    }
}
