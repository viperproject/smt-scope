use yew::prelude::*;

// Tab

#[derive(Properties, Clone, PartialEq)]
pub struct TabProps {
    pub title: String,
    pub children: Children,
}

#[function_component]
pub fn Tab(props: &TabProps) -> Html {
    html! {<div class="tab-holder">
        <div class="handle"><div class="tabs">
            <div class="tab" active=""><span class="pf-tab-title">{&props.title}</span></div>
        </div></div>
        <section class="pf-details-shell pf-fill-parent">{props.children.clone()}</section>
    </div>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct TabContainerProps {
    pub children: Children,
}

#[function_component]
pub fn TabContainer(props: &TabContainerProps) -> Html {
    html! {<div class="details-panel-container">
        {props.children.clone()}
    </div>}
}

// Detail

#[derive(Properties, Clone, PartialEq)]
pub struct DetailProps {
    pub title: String,
    pub hover: Option<String>,
    pub tip: Option<String>,
    pub children: Children,
}

#[function_component]
pub fn Detail(props: &DetailProps) -> Html {
    html! {<section class="pf-section">
        <header>
            <h1 title={props.hover.clone()}>{&props.title}</h1>
            {props.tip.as_ref().map(|tip| html! {<i class="pf-tip">{tip}</i>})}
        </header>
        <article>{props.children.clone()}</article>
    </section>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct DetailContainerProps {
    pub children: Children,
}

#[function_component]
pub fn DetailContainer(props: &DetailContainerProps) -> Html {
    html! {<article class="pf-content"><div class="pf-grid-layout">
        {props.children.clone()}
    </div></article>}
}

// Tree

#[derive(Properties, Clone, PartialEq)]
pub struct TreeListProps {
    pub elements: Vec<(Html, Html)>,
}

#[function_component]
pub fn TreeList(props: &TreeListProps) -> Html {
    html! {<div class="pf-tree">
        {for props.elements.iter().cloned().map(|(left, right)| html! {
            <div class="pf-tree-node">
                <div class="pf-tree-left"><span class="pf-tree-gutter"></span>{left}</div>
                <div class="pf-tree-right">{right}</div>
            </div>
        })}
    </div>}
}
