use yew::{function_component, html, Html};

fn new_features() -> Vec<Html> {
    vec![
        // html!{<li>{"New updated "}<a href="LINK_TO_DOCS" class="pf-anchor">{"tabs"}</a>{" are extensible and user friendly."}</li>},
    ]
}

fn hints() -> Vec<Html> {
    vec![
        html! {<div>{"Drag a log file onto this window to open it."}</div>},
        html! {<div>{"Press "}<div class="keycap">{"?"}</div>{" to toggle the help popup."}</div>},
        html! {<div>{"Drag and drop operations to reorder them."}</div>},
    ]
}

#[function_component]
pub fn HomepageHints() -> Html {
    let new_features = new_features();
    let new_features = if !new_features.is_empty() {
        {
            html! {
                <div class="home-page-hints">
                    <div class="tagline">{"New!"}</div>
                    <ul>{for new_features}</ul>
                </div>
            }
        }
    } else {
        Default::default()
    };
    let hints = hints();
    let hints = if !hints.is_empty() {
        {
            let random = (js_sys::Math::random() * hints.len() as f64).floor() as usize;
            html! {
                <div class="home-page-hints">
                    <div class="hintline">{"Hint"}</div>
                    <div class="hint">{hints[random].clone()}</div>
                </div>
            }
        }
    } else {
        Default::default()
    };
    html! {<>{new_features}{hints}</>}
}

#[function_component]
pub fn HomepageScreen() -> Html {
    #[cfg(not(feature = "tauri"))]
    let chanel_select = html! {<super::version::ChanelSelect />};
    #[cfg(feature = "tauri")]
    let chanel_select = html! {};
    html! {
        <div class="home-page"><div class="home-page-center">
            <div class="home-page-title">
                <img src="html/logo_square.png" class="logo" /></div>
            <HomepageHints />
            {chanel_select}
        // Can add a footer here
        </div><a href="#" target="_blank" class="footer">{""}</a></div>
    }
}
