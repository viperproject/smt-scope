use std::{borrow::Cow, cmp::Reverse, fmt::Debug};

use smt_log_parser::{analysis::LogInfo, items::QuantIdx, F64Ord, Z3Parser};
use yew::prelude::*;

use crate::{
    screen::homepage::{FileInfo, RcParser},
    utils::colouring::{QuantColourBox, QuantIdxToColourMap},
};

use super::{quant_graph::QuantGraph, RcAnalysis};

pub struct SummaryAnalysis {
    pub log_info: LogInfo,
}

impl SummaryAnalysis {
    pub fn new(parser: &Z3Parser) -> Self {
        Self {
            log_info: LogInfo::new(parser),
        }
    }
}

#[derive(Properties, Clone, PartialEq)]
pub struct SummaryProps {
    pub file: FileInfo,
    pub parser: RcParser,
    pub analysis: Option<RcAnalysis>,
}

#[function_component]
pub fn Summary(props: &SummaryProps) -> Html {
    let colours = &props.parser.colour_map;
    let parser = props.parser.parser.borrow();
    let summary = &props.parser.summary;
    let inst = summary.log_info.inst;
    let match_ = summary.log_info.match_;
    let metrics = html! {<div class="info-box">
        <h2>{ "Metrics" }</h2>
        <ul>
            <li>{ format!("{} instantiations", inst.insts) }<ul>
                <li>{ format!("{} mbqi", match_.mbqi) }</li>
                <li>{ format!("{} theory solving", match_.theory_solving) }</li>
                <li>{ format!("{} internal axiom", match_.axioms) }</li>
                <li>{ format!("{} quantifier", match_.quantifiers) }</li>
            </ul></li>
            <li>{ format!("{} enodes", inst.enodes) }</li>
            <li>{ format!("{} proved equalities", inst.geqs_nontrivial()) }</li>
            <li>{ format!("{} used equalities", inst.treqs_nontrivial()) }</li>
        </ul>
    </div>};

    let quants = summary.log_info.quants_iter();
    let quants = quants_ordered::<_, true>(&parser, colours, quants);
    let quants = quants.iter().take(5).take_while(|(.., c)| *c > 0);
    let quants = quants.map(|(q, hue, c)| {
        html! { <li><div class="info-box-row">{ format!("{c}: {q}") }<QuantColourBox {hue} /></div></li> }
    });

    let most_quants = html! {<div class="info-box">
        <h2 title="The quantifiers which have been instantiated the most.">{ "Most instantiated quantifiers" }</h2>
        <ul>
            { for quants }
        </ul>
    </div>};

    let analysis = props.analysis.as_ref();
    let analysis = analysis.map(|analysis| {
        let analysis = analysis.borrow();
        let costs = analysis.quants.quants_costs().map(|(q, c)| (q, F64Ord(c)));
        let costs = quants_ordered::<_, true>(&parser, colours, costs);
        let costs = costs.iter().take(5).take_while(|(.., c)| c.0 > 0.0);
        let costs = costs.map(|(q, hue, c)| {
            html! { <li><div class="info-box-row">{ format!("{:.0}: {q}", c.0) }<QuantColourBox {hue} /></div></li> }
        });
        let cost_quants = html! {<div class="info-box">
            <h2 title="The quantifiers upon which the most instantiations depend.">{ "Most expensive quantifiers" }</h2>
            <ul>
                { for costs }
            </ul>
        </div>};

        html! {<>
            { cost_quants }
        </>}
    });
    let graph = props.analysis.clone().map(|analysis| {
        let file = props.file.clone();
        html! {
            <div class="quant-graph">
                <QuantGraph parser={props.parser.clone()} {analysis} {file} />
            </div>
        }
    });

    html! {<div class="summary">
        <div class="info-boxes">
            { metrics }
            { most_quants }
            { analysis }
        </div>
        {graph}
    </div>}
}

fn quants_ordered<'a, T: Ord + Copy + Debug, const REVERSE: bool>(
    parser: &'a Z3Parser,
    colour_map: &QuantIdxToColourMap,
    quants: impl Iterator<Item = (QuantIdx, T)>,
) -> Vec<(Cow<'a, str>, Option<f64>, T)> {
    let mut quants = quants
        .filter_map(|(q, c)| {
            let name = parser[q].kind.name(&parser.strings)?;
            let hue = colour_map.get_rbg_hue(Some(q));
            log::info!("{name}: {hue:?} | {c:?}");
            Some((name, hue, c))
        })
        .collect::<Vec<_>>();
    if REVERSE {
        quants.sort_by_key(|(.., c)| Reverse(*c));
    } else {
        quants.sort_by_key(|(.., c)| *c);
    }
    quants
}
