use material_yew::icon::MatIcon;
use viz_js::VizInstance;
use wasm_bindgen::JsCast;
use wasm_timer::Instant;
use web_sys::SvgsvgElement;
use yew::prelude::*;

#[derive(Properties, Clone, PartialEq)]
pub struct DotProps {
    pub dot: String,
    /// The filename of the opened log file.
    pub filename: String,
    /// The suffix to add to the filename.
    pub suffix: String,
    pub scale: bool,
}

#[function_component]
pub fn Dot(props: &DotProps) -> Html {
    let svg_state = use_state(|| None::<(String, SvgsvgElement)>);
    let Some((dot, svg)) = &*svg_state else {
        // log::info!("Rendering dot:\n{}", props.dot);
        let dot = props.dot.clone();
        let svg_state = svg_state.clone();
        wasm_bindgen_futures::spawn_local(async move {
            gloo_timers::future::TimeoutFuture::new(10).await;
            let graphviz = VizInstance::new().await;
            let options = viz_js::Options::default();

            let start = Instant::now();
            let svg = graphviz.render_svg_element(dot.clone(), options);
            let elapsed = start.elapsed();

            let svg = match svg {
                Ok(svg) => svg,
                Err(e) => {
                    log::error!("Failed to render dot ({e:?}):\n{dot}");
                    return;
                }
            };
            log::debug!(
                "Converting dot-String to SVG took {}ms",
                elapsed.as_millis()
            );
            svg_state.set(Some((dot, svg)));
        });
        return html! {<div class="dot"></div>};
    };
    if dot != &props.dot {
        svg_state.set(None);
        return html! {<div class="dot"></div>};
    }

    let name = props.filename.split('.').next().unwrap();
    let name = format!("{name}{}.svg", props.suffix);
    let (filename, svg_ref) = (name.clone(), svg.clone());
    let download = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
        DotAction::Download.action(&filename, &svg_ref);
    });
    let (filename, svg_ref) = (name.clone(), svg.clone());
    let share = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
        DotAction::Share.action(&filename, &svg_ref);
    });

    let download_share = html! {
        <><a href="#" class="dot-button download" title="Download" onclick={download}>
            <div class="material-icons"><MatIcon>{"download"}</MatIcon></div>
        </a>
        <a href="#" class="dot-button share" title="Share" onclick={share}>
            <div class="material-icons"><MatIcon>{"share"}</MatIcon></div>
        </a></>
    };

    let class = if props.scale {
        let _ = svg.set_attribute("height", "100%");
        let _ = svg.set_attribute("width", "100%");
        "dot scaled"
    } else {
        "dot"
    };
    let svg = Html::VRef(svg.clone().into());
    html! {<div {class}>
        {svg}
        <div class="dot-buttons">{download_share}</div>
    </div>}
}

pub enum DotAction {
    Download,
    Share,
}

impl DotAction {
    fn action(&self, filename: &str, svg: &SvgsvgElement) {
        let svg = svg.outer_html();
        let blob =
            web_sys::Blob::new_with_str_sequence(&vec![svg].into()).expect("Failed to create blob");
        match self {
            Self::Download => {
                let url = web_sys::Url::create_object_url_with_blob(&blob)
                    .expect("Failed to create object URL");
                let download = gloo::utils::document()
                    .create_element("a")
                    .expect("Failed to create element");
                let download = download
                    .dyn_into::<web_sys::HtmlAnchorElement>()
                    .expect("Failed to cast element");
                download.set_href(&url);
                download.set_download(filename);
                download.click();
                web_sys::Url::revoke_object_url(&url).expect("Failed to revoke object URL");
            }
            Self::Share => {
                let navigator = web_sys::window().unwrap().navigator();
                let data = web_sys::ShareData::new();
                data.set_title(filename);
                let file = web_sys::File::new_with_blob_sequence(&vec![blob].into(), filename)
                    .expect("Failed to create file");
                data.set_files(&js_sys::Array::of1(&file));
                let _share_promise = navigator.share_with_data(&data);
            }
        }
    }
}
