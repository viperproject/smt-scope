mod data;
mod loaded;
mod render;

use gloo::timers::callback::Timeout;
use yew::{html, Html};

use crate::screen::{inst_graph::Graph, Manager};

use super::{
    extra::Omnibox,
    file::RcAnalysis,
    homepage::{FileInfo, RcParser},
    maybe_rc::MaybeRc,
    Scope, Screen,
};

pub use self::{data::MlData, loaded::MatchingLoopLoaded};

#[derive(Clone, PartialEq)]
pub struct MatchingLoopProps {
    pub file: FileInfo,
    pub parser: RcParser,
    pub analysis: RcAnalysis,
}

pub enum MatchingLoop {
    Loading,
    Loaded(MatchingLoopLoaded),
}

pub enum MatchingLoopM {
    Search,
    Choose(usize),
}

impl Screen for MatchingLoop {
    type Message = MatchingLoopM;
    type Properties = MatchingLoopProps;

    fn create(link: &Scope<Self>, props: &Self::Properties) -> Self {
        if let Some(data) = &props.analysis.borrow().graph.analysis.ml_data {
            Self::Loaded(MatchingLoopLoaded::new(link, props, data))
        } else {
            let link = link.clone();
            Timeout::new(1, move || {
                link.send_message(MatchingLoopM::Search);
            })
            .forget();
            Self::Loading
        }
    }

    fn changed(
        &mut self,
        link: &Scope<Self>,
        props: &Self::Properties,
        _old_props: &Self::Properties,
    ) -> bool {
        *self = Self::create(link, props);
        true
    }

    fn update(&mut self, link: &Scope<Self>, props: &Self::Properties, msg: Self::Message) -> bool {
        match msg {
            MatchingLoopM::Search => {
                let mut parser = props.parser.parser.borrow_mut();
                let mut analysis = props.analysis.borrow_mut();
                let data = analysis.graph.search_matching_loops(&mut parser);
                *self = Self::Loaded(MatchingLoopLoaded::new(link, props, data));
                true
            }
            MatchingLoopM::Choose(idx) => {
                let Self::Loaded(self_) = self else {
                    log::error!("Received Choose message in Loading state");
                    return false;
                };
                self_.choose(link, props, idx);
                true
            }
        }
    }

    fn view(&self, _link: &Scope<Self>, _props: &Self::Properties) -> Html {
        let Self::Loaded(MatchingLoopLoaded {
            rendering: Some(rendering),
            ..
        }) = self
        else {
            return html! {};
        };
        let initial = rendering.props.clone();
        html! {<Manager<Graph> {initial} />}
    }

    #[allow(refining_impl_trait)]
    fn view_omnibox(&self, _link: &Scope<Self>, _props: &Self::Properties) -> MaybeRc<Omnibox> {
        let Self::Loaded(self_) = self else {
            return Omnibox::loading_indeterminate("Analysing matching loops".to_string()).into();
        };
        self_.omnibox.clone().into()
    }
}
