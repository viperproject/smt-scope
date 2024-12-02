use yew::{html, html::Scope, Html};

use super::Screen;

#[derive(Clone, PartialEq)]
pub struct MatchingLoopProps {}

pub struct MatchingLoop {}

pub enum MatchingLoopM {}

impl Screen for MatchingLoop {
    type Message = MatchingLoopM;
    type Properties = MatchingLoopProps;

    fn create(link: &Scope<super::Manager>, props: &Self::Properties) -> Self {
        Self {}
    }

    fn view(&self, link: &Scope<super::Manager>, props: &Self::Properties) -> Html {
        html! {"Matching loop"}
    }
}
