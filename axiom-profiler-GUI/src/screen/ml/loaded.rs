use std::rc::Rc;

use smt_log_parser::analysis::analysis::matching_loop;
use yew::{html, Html};

use crate::{
    screen::{
        extra::{Omnibox, OmniboxChoose},
        homepage::FileInfo,
        inst_graph::{
            filter::{Filter, DEFAULT_DISABLER_CHAIN},
            GraphExtraProps, GraphProps,
        },
        Scope,
    },
    utils::split_div::SplitDivProps,
};

use super::{
    graph::MlgViewer, render::MlgRenderer, MatchingLoop, MatchingLoopM, MatchingLoopProps, MlData,
    MlgrOutput,
};

pub struct MatchingLoopLoaded {
    pub omnibox: Rc<Omnibox>,
    pub rendering: Option<MatchingLoopRendering>,
}

pub struct MatchingLoopRendering {
    renderer: Html,
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
            let renderer = Self::renderer(link, props, initial);
            let props = GraphProps {
                parser: props.parser.clone(),
                analysis: props.analysis.clone(),
                default_filters: vec![Filter::SelectNthMatchingLoop(initial)],
                default_disablers: DEFAULT_DISABLER_CHAIN.to_vec(),
                extra: Some(GraphExtraProps {
                    split: SplitDivProps {
                        initial_position: 0.5,
                        left_bound: 0.0,
                        right_bound: 0.75,
                        snap_positions: vec![0.0, 0.5, 0.75],
                    },
                    swap_split: false,
                    info_top: html! {<>
                        {renderer.clone()}
                        <MlgViewer file={props.file.clone()} data={None} />
                    </>},
                }),
            };
            MatchingLoopRendering {
                renderer,
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
        rendering.renderer = Self::renderer(link, props, idx);
        rendering.idx = idx;
        rendering.props.default_filters[0] = Filter::SelectNthMatchingLoop(idx);
        rendering.props.extra.as_mut().unwrap().info_top = html! {<>
            {rendering.renderer.clone()}
            <MlgViewer file={props.file.clone()} data={None} />
        </>};
    }

    pub fn rendered(&mut self, file: FileInfo, data: MlgrOutput) -> bool {
        let Some(rendering) = &mut self.rendering else {
            log::error!("Received Render message with no MLs found");
            return false;
        };
        if rendering.idx != data.idx {
            return false;
        }
        rendering.props.extra.as_mut().unwrap().info_top = html! {<>
            {rendering.renderer.clone()}
            <MlgViewer {file} data={Some(data)} />
        </>};
        true
    }

    fn renderer(link: &Scope<MatchingLoop>, props: &MatchingLoopProps, idx: usize) -> Html {
        let parser = props.parser.clone();
        let analysis = props.analysis.clone();
        let rendered = link.callback(MatchingLoopM::Rendered);
        html! { <MlgRenderer {parser} {analysis} {idx} {rendered}  /> }
    }
}
