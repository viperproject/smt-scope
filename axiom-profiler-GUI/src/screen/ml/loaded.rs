use std::rc::Rc;

use smt_log_parser::analysis::analysis::matching_loop;
use yew::{html, Html};

use crate::{
    screen::{
        extra::{Omnibox, OmniboxChoose},
        inst_graph::{
            filter::{Filter, DEFAULT_DISABLER_CHAIN},
            GraphExtraProps, GraphMode, GraphProps,
        },
        Scope,
    },
    utils::split_div::SplitDivProps,
};

use super::{render::MlgRenderer, MatchingLoop, MatchingLoopM, MatchingLoopProps, MlData};

pub struct MatchingLoopLoaded {
    pub omnibox: Rc<Omnibox>,
    pub rendering: Option<MatchingLoopRendering>,
}

pub struct MatchingLoopRendering {
    idx: usize,
    pub props: GraphProps,
}

impl MatchingLoopLoaded {
    pub fn new(
        link: &Scope<MatchingLoop>,
        props: &MatchingLoopProps,
        data: &matching_loop::MlData,
    ) -> Self {
        let ml_data = MlData::from(data);
        let message = match ml_data {
            MlData {
                sure_mls: 0,
                maybe_mls: 0,
            } => "No matching loops found".to_string(),
            MlData {
                sure_mls,
                maybe_mls: 0,
            } => format!("Found {sure_mls} matching loop(s)"),
            MlData {
                sure_mls: 0,
                maybe_mls,
            } => format!("Found {maybe_mls} repeating chain(s)"),
            MlData {
                sure_mls,
                maybe_mls,
            } => format!("Found {sure_mls} matching loop(s), {maybe_mls} repeating chain(s)"),
        };
        let choose_from = ml_data.sum();
        let initial = (choose_from != 0).then_some(0);
        let omnibox = OmniboxChoose {
            icon: "all_inclusive",
            icon_mousedown: None,
            message,
            initial,
            choose_from,
            choose: link.callback(MatchingLoopM::Choose),
        };
        let rendering = initial.map(|initial| {
            let props = GraphProps {
                parser: props.parser.clone(),
                analysis: props.analysis.clone(),
                default_filters: vec![Filter::SelectNthMatchingLoop(initial)],
                default_disablers: DEFAULT_DISABLER_CHAIN.to_vec(),
                extra: Some(GraphExtraProps {
                    split: SplitDivProps {
                        initial_position: 0.3,
                        left_bound: 0.0,
                        right_bound: 0.75,
                        snap_positions: vec![0.0, 0.3, 0.75],
                    },
                    swap_split: false,
                    info_top: Self::renderer(link, props, initial),
                }),
                mode: GraphMode::Inst,
            };
            MatchingLoopRendering {
                idx: initial,
                props,
            }
        });
        Self {
            omnibox: Rc::new(Omnibox::Choose(omnibox)),
            rendering,
        }
    }

    pub fn choose(&mut self, link: &Scope<MatchingLoop>, props: &MatchingLoopProps, idx: usize) {
        let Some(rendering) = &mut self.rendering else {
            log::error!("Received Choose message with no MLs found");
            return;
        };
        rendering.idx = idx;
        rendering.props.default_filters[0] = Filter::SelectNthMatchingLoop(idx);
        rendering.props.extra.as_mut().unwrap().info_top = Self::renderer(link, props, idx);
    }

    fn renderer(_link: &Scope<MatchingLoop>, props: &MatchingLoopProps, idx: usize) -> Html {
        let parser = props.parser.clone();
        let analysis = props.analysis.clone();
        let file = props.file.clone();
        html! { <MlgRenderer {parser} {analysis} {idx} {file} /> }
    }
}
