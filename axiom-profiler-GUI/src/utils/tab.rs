use yew::prelude::*;

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

// TODO: add detail boxes for selected info

// #[derive(Properties, Clone, PartialEq)]
// pub struct DetailProps {
//     pub title: String,
//     pub children: Children,
// }

// #[function_component]
// pub fn Detail(props: &DetailProps) -> Html {
//     html! {<section class="pf-section">
//         <header><h1>{&props.title}</h1></header>
//         <article>{props.children.clone()}</article>
//     </section>}
// }

// #[derive(Properties, Clone, PartialEq)]
// pub struct DetailContainerProps {
//     pub children: Children,
// }

// #[function_component]
// pub fn DetailContainer(props: &DetailContainerProps) -> Html {
//     html! {<article class="pf-content"><div class="pf-grid-layout">
//         {props.children.clone()}
//     </div></article>}
// }
