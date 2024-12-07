use std::cmp::Reverse;

use smt_log_parser::{analysis::LogInfo, Z3Parser};
use yew::prelude::*;

use crate::screen::homepage::RcParser;


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
    pub parser: RcParser,
}

#[function_component]
pub fn Summary(props: &SummaryProps) -> Html {
    let parser = props.parser.parser.borrow();
    let summary = &props.parser.summary;
    let inst = summary.log_info.inst;
    let match_ = summary.log_info.match_;

    let mut quants = summary
        .log_info
        .quants_iter()
        .filter_map(|(q, c)| parser[q].kind.name(&parser.strings).zip(Some(c)))
        .collect::<Vec<_>>();
    quants.sort_by_key(|(_, c)| Reverse(*c));
    let quants_to_show = quants.len().min(5);
    let quants = &quants[..quants_to_show];

    html! {
        <ul>
            <li>{ format!("{} quantifier instantiations", inst.insts) }</li>
            <li>{ format!("{} enodes", inst.enodes) }</li>
            <li>{ format!("{} proved equalities", inst.geqs_nontrivial()) }</li>
            <li>{ format!("{} used equalities", inst.treqs_nontrivial()) }</li>
        </ul>
    }
}
