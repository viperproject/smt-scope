use chrono::{DateTime, Utc};
use gloo::storage::Storage;
use yew::{
    function_component, html, prelude::Context, Callback, Component, Html, NodeRef, Properties,
};

fn new_features() -> Vec<Html> {
    vec![
        // html!{<li>{"New updated "}<a href="LINK_TO_DOCS" class="pf-anchor">{"tabs"}</a>{" are extensible and user friendly."}</li>},
    ]
}

fn hints() -> Vec<Html> {
    vec![
        html! {<div>{"Drag a log file onto this window to open it."}</div>},
        html! {<div>{"Press "}<div class="keycap">{"?"}</div>{" to toggle the help popup."}</div>},
    ]
}

#[function_component]
pub fn HomepageHints() -> Html {
    let new_features = new_features();
    let new_features = (!new_features.is_empty())
        .then(|| {
            html! {
                <div class="home-page-hints">
                    <div class="tagline">{"New!"}</div>
                    <ul>{for new_features}</ul>
                </div>
            }
        })
        .unwrap_or_default();
    let hints = hints();
    let hints = (!hints.is_empty())
        .then(|| {
            let random = (js_sys::Math::random() * hints.len() as f64).floor() as usize;
            html! {
                <div class="home-page-hints">
                    <div class="hintline">{"Hint"}</div>
                    <div class="hint">{hints[random].clone()}</div>
                </div>
            }
        })
        .unwrap_or_default();
    html! {<>{new_features}{hints}</>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct HomepageProps {
    pub is_canary: bool,
}

pub struct Homepage {
    versions: Vec<VersionEntry>,
    fieldset_hover: bool,
}

pub enum HomepageMessage {
    Versions(Vec<VersionEntry>),
    FieldsetHover(bool),
}

impl Component for Homepage {
    type Message = HomepageMessage;
    type Properties = HomepageProps;

    fn create(ctx: &Context<Self>) -> Self {
        let curr_time = Utc::now();
        let cached = gloo::storage::LocalStorage::get::<VersionStorage>("versions");
        let cached = cached
            .ok()
            .filter(|v| curr_time - v.date < chrono::Duration::minutes(30));
        let versions = if let Some(cached) = cached {
            cached.versions
        } else {
            let link = ctx.link().clone();
            wasm_bindgen_futures::spawn_local(async move {
                let Ok(response) = gloo::net::http::Request::get(
                    "https://api.github.com/repos/viperproject/axiom-profiler-2/git/refs/tags/v",
                )
                .send()
                .await
                else {
                    return;
                };
                let Ok(versions) = response.json::<Vec<VersionEntry>>().await else {
                    return;
                };
                let storage = VersionStorage {
                    versions,
                    date: curr_time,
                };
                gloo::storage::LocalStorage::set::<&VersionStorage>("versions", &storage).ok();
                link.send_message(HomepageMessage::Versions(storage.versions));
            });
            Vec::new()
        };
        Self {
            versions,
            fieldset_hover: false,
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            HomepageMessage::Versions(versions) => {
                self.versions = versions;
                true
            }
            HomepageMessage::FieldsetHover(mut fieldset_hover) => {
                fieldset_hover =
                    fieldset_hover && (!self.versions.is_empty() || crate::version().is_some());
                let changed = self.fieldset_hover != fieldset_hover;
                self.fieldset_hover = fieldset_hover;
                changed
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let is_canary = ctx.props().is_canary;
        let stable = Callback::from(move |_| {
            if is_canary {
                gloo::utils::window()
                    .location()
                    .set_href("/axiom-profiler-2/")
                    .unwrap();
            }
        });
        let canary = Callback::from(move |_| {
            if !is_canary {
                gloo::utils::window()
                    .location()
                    .set_href("/axiom-profiler-2/canary/")
                    .unwrap();
            }
        });
        let switch_text = if is_canary {
            "Feeling cautious? Switch to the reliable Stable version"
        } else {
            "Feeling adventurous? Try the bleeding edge Canary version"
        };
        let fieldset_hover = self.fieldset_hover.then(|| {
            let this_version = crate::version();
            let mut this_version_index = None;
            let mut versions = self.versions.iter()
                .flat_map(|v| v.version().map(|version| (version, v)))
                .enumerate()
                .map(|(i, (version, v))| {
                    if Some(&version) == this_version.as_ref() {
                        this_version_index = Some(i);
                    }
                    (version, v.version_text().unwrap().to_string())
                }).collect::<Vec<_>>();
            if let (Some(this_version), None) = (this_version, this_version_index) {
                versions.push((this_version, crate::GIT_DESCRIBE.to_string()));
            }
            let last_idx = versions.len() - 1;
            let this_version_index = this_version_index.unwrap_or(last_idx);
            let style = format!("height: {}px; top: -{}px", versions.len() * 40, this_version_index * 40);

            let inputs = versions.into_iter().enumerate().rev().map(|(i, (version, version_text))| {
                let id = format!("chan_{version}");
                let onclick = Callback::from(move |_| {
                    if is_canary || this_version_index != i {
                        let href = if i == last_idx {
                            String::from("/axiom-profiler-2/")
                        } else {
                            format!("/axiom-profiler-2/{version_text}")
                        };
                        gloo::utils::window().location().set_href(&href).ok();
                    }
                });
                let noderef = NodeRef::default();
                let noderef_clone = noderef.clone();
                let onmousemove = Callback::from(move |_| {
                    noderef_clone.cast::<web_sys::Element>().unwrap().class_list().add_1("hover").unwrap();
                });
                let noderef_clone = noderef.clone();
                let onmouseleave = Callback::from(move |_| {
                    noderef_clone.cast::<web_sys::Element>().unwrap().class_list().remove_1("hover").unwrap();
                });
                let class = (!is_canary && this_version_index == i).then_some("current").unwrap_or_default();
                html! {
                    <><input type="radio" name="chan" id={id.clone()} /><label ref={noderef} {class} for={id} {onclick} {onmousemove} {onmouseleave}>{version}</label></>
                }
            });
            let unset_hover = ctx.link().callback(|_| HomepageMessage::FieldsetHover(false));
            let highlight = (!is_canary).then(|| {
                let style = format!("top: {}px", this_version_index * 40);
                html! { <div id="inner-highlight" class="highlight" {style}></div> }
            });
            html! {
                <fieldset {style} onmouseleave={unset_hover}>
                    {for inputs}
                    {highlight}
                </fieldset>
            }
        });
        let set_hover = ctx
            .link()
            .callback(|_| HomepageMessage::FieldsetHover(true));
        html! {
            <><div class="home-page-center">
                <div class="home-page-title">
                    <img src="html/logo_small.png" class="logo" />{"Axiom Profiler"}</div>
                <HomepageHints />
                <div class="channel-select">
                    <div>{switch_text}</div>
                    <fieldset>
                        <input type="radio" name="chan" id="chan_stable" checked={!is_canary} />
                        <label for="chan_stable" onclick={stable} onmousemove={set_hover}>{"stable"}</label>
                        <input type="radio" name="chan" id="chan_canary" checked={is_canary} />
                        <label for="chan_canary" onclick={canary}>{"canary"}</label>
                        {fieldset_hover}
                        <div class="highlight"></div>
                    </fieldset>
                </div>
            // Can add a footer here
            </div><a href="#" target="_blank" class="footer">{""}</a></>
        }
    }
}

#[derive(Debug, Clone, serde::Deserialize, serde::Serialize)]
pub struct VersionStorage {
    versions: Vec<VersionEntry>,
    date: DateTime<Utc>,
}

#[derive(Debug, Clone, serde::Deserialize, serde::Serialize)]
pub struct VersionEntry {
    pub r#ref: String,
    pub node_id: String,
    pub url: String,
    pub object: VersionObject,
}

impl VersionEntry {
    pub fn version_text(&self) -> Option<&str> {
        self.r#ref.strip_prefix("refs/tags/")
    }
    pub fn version(&self) -> Option<semver::Version> {
        let version = self.version_text()?.strip_prefix('v')?;
        semver::Version::parse(version).ok()
    }
}

#[derive(Debug, Clone, serde::Deserialize, serde::Serialize)]
pub struct VersionObject {
    pub sha: String,
    pub r#type: String,
    pub url: String,
}

#[allow(dead_code)]
fn test_versions() -> Vec<VersionEntry> {
    let v0_1_0 = VersionEntry {
        r#ref: "refs/tags/v0.1.0".to_string(),
        node_id: "REF_kwDOKNVs07ByZWZzL3RhZ3MvdjAuMS4w".to_string(),
        url: "https://api.github.com/repos/viperproject/axiom-profiler-2/git/refs/tags/v0.1.0".to_string(),
        object: VersionObject {
            sha: "cf6cf11427abd96a26037f6c47422b7506f890ef".to_string(),
            r#type: "tag".to_string(),
            url: "https://api.github.com/repos/viperproject/axiom-profiler-2/git/tags/cf6cf11427abd96a26037f6c47422b7506f890ef".to_string(),
        },
    };
    let v0_1_3 = VersionEntry {
        r#ref: "refs/tags/v0.1.3".to_string(),
        node_id: "REF_kwDOKNVs07ByZWZzL3RhZ3MvdjAuMS4z".to_string(),
        url: "https://api.github.com/repos/viperproject/axiom-profiler-2/git/refs/tags/v0.1.3".to_string(),
        object: VersionObject {
            sha: "68babe1a367cbafb71d92b798784c87d3131a57f".to_string(),
            r#type: "tag".to_string(),
            url: "https://api.github.com/repos/viperproject/axiom-profiler-2/git/tags/68babe1a367cbafb71d92b798784c87d3131a57f".to_string(),
        },
    };
    vec![v0_1_0, v0_1_3]
}
