use material_yew::icon::MatIcon;
use wasm_bindgen::JsCast;
use yew::{function_component, html, Callback, Html, MouseEvent, Properties};

use crate::screen::homepage::FileInfo;

use MlgAction::*;

use super::MlgrOutput;

impl MlgViewer {
    pub fn no_graph() -> Html {
        html! { <h2>{"Failed to generalise repeating chain, might not be a matching loop."}</h2> }
    }
}

#[derive(Properties, Clone, PartialEq)]
pub struct MlgvProps {
    pub file: FileInfo,
    pub data: Option<MlgrOutput>,
}

#[function_component]
pub fn MlgViewer(props: &MlgvProps) -> Html {
    let Some(data) = &props.data else {
        return html! {};
    };
    let props_ref = props.clone();
    let download = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
        MlgViewer::action(&props_ref, Download);
    });
    let props_ref = props.clone();
    let share = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
        MlgViewer::action(&props_ref, Share);
    });

    let warning = if data.incomplete {
        html! { <span class="warning" title="Error during graph construction, the graph is incomplete!">{"⚠️ Incomplete ⚠️"}</span> }
    } else {
        html! {}
    };
    let download_share = html! {
        <><a href="#" class="download" title="Download" onclick={download}>
            <div class="material-icons"><MatIcon>{"download"}</MatIcon></div>
        </a>
        <a href="#" class="share" title="Share" onclick={share}>
            <div class="material-icons"><MatIcon>{"share"}</MatIcon></div>
        </a></>
    };
    let svg = Html::VRef(data.svg.clone().into());
    html! {
        <>
            <h2>{"Generalised Matching Loop "}{download_share}{warning}</h2>
            <div style="overflow-x: auto;">{svg}</div>
        </>
    }
}

pub enum MlgAction {
    Download,
    Share,
}

impl MlgViewer {
    fn action(props: &MlgvProps, action: MlgAction) {
        let data = props.data.as_ref().unwrap();
        let filename = format!(
            "{}_ml_{}.svg",
            props.file.name.split('.').next().unwrap(),
            data.idx + 1
        );

        let svg = data.svg.inner_html();
        let blob =
            web_sys::Blob::new_with_str_sequence(&vec![svg].into()).expect("Failed to create blob");
        match action {
            Download => {
                let url = web_sys::Url::create_object_url_with_blob(&blob)
                    .expect("Failed to create object URL");
                let download = gloo::utils::document()
                    .create_element("a")
                    .expect("Failed to create element");
                let download = download
                    .dyn_into::<web_sys::HtmlAnchorElement>()
                    .expect("Failed to cast element");
                download.set_href(&url);
                download.set_download(&filename);
                download.click();
                web_sys::Url::revoke_object_url(&url).expect("Failed to revoke object URL");
            }
            Share => {
                let navigator = web_sys::window().unwrap().navigator();
                let data = web_sys::ShareData::new();
                data.set_title(&filename);
                let file = web_sys::File::new_with_blob_sequence(&vec![blob].into(), &filename)
                    .expect("Failed to create file");
                data.set_files(&js_sys::Array::of1(&file));
                let _share_promise = navigator.share_with_data(&data);
            }
        }
    }
}
