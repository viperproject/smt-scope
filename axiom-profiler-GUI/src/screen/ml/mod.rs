use yew::{html, Html};

use super::{Scope, Screen};

#[derive(Clone, PartialEq)]
pub struct MatchingLoopProps {}

pub struct MatchingLoop {}

pub enum MatchingLoopM {}

impl Screen for MatchingLoop {
    type Message = MatchingLoopM;
    type Properties = MatchingLoopProps;

    fn create(link: &Scope<Self>, props: &Self::Properties) -> Self {
        Self {}
    }

    fn view(&self, link: &Scope<Self>, props: &Self::Properties) -> Html {
        html! {"Matching loop"}
    }
}
