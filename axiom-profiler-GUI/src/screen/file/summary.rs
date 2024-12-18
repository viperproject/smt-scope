use std::{borrow::Cow, cmp::Reverse, fmt::Debug, rc::Rc};

use num_format::{Locale, ToFormattedString};
use smt_log_parser::{
    analysis::LogInfo,
    display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
    items::QuantIdx,
    F64Ord, NonMaxU32, Z3Parser,
};
use yew::prelude::*;

use crate::{
    configuration::ConfigurationProvider,
    screen::homepage::{FileInfo, RcParser},
    utils::{
        colouring::{QuantColourBox, QuantIdxToColourMap},
        tab::{Detail, DetailContainer, TreeList},
    },
};

use super::{quant_graph::QuantGraph, RcAnalysis};

const DISPLAY_TOP_N: usize = 8;

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
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    let mut config = cfg.config.display;
    config.ast_depth_limit = NonMaxU32::new(3);
    let inner = SummaryPropsInner {
        parser: props.parser.clone(),
        analysis: props.analysis.clone(),
        term_display: term_display.clone(),
        config,
    };

    let graph = props.analysis.clone().map(|analysis| {
        let file = props.file.clone();
        html! {
            <div class="quant-graph">
                <QuantGraph parser={props.parser.clone()} {analysis} {file} />
            </div>
        }
    });

    html! {<div class="summary">
        <DetailContainer>
            <Metrics ..inner.clone() />
            <MostQuants ..inner.clone() />
            <CostQuants ..inner.clone() />
            <CostProofs ..inner.clone() />
            <CostCdcl ..inner />
        </DetailContainer>
        {graph}
    </div>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct SummaryPropsInner {
    pub parser: RcParser,
    pub analysis: Option<RcAnalysis>,
    pub term_display: Rc<TermDisplayContext>,
    pub config: DisplayConfiguration,
}

impl SummaryPropsInner {
    pub fn ctxt<'a>(&'a self, parser: &'a Z3Parser) -> DisplayCtxt<'a> {
        DisplayCtxt {
            parser,
            term_display: &self.term_display,
            config: self.config,
        }
    }
}

#[function_component]
pub fn Metrics(props: &SummaryPropsInner) -> Html {
    let summary = &props.parser.summary;
    let inst = summary.log_info.inst;
    let match_ = summary.log_info.match_;

    let details = vec![
        (
            format_to_html(inst.insts),
            html! {<>{ "Instantiations" }<br /><ul class="tree-sublist">
                    <li>{ format_to_html(match_.mbqi) }{ " mbqi" }</li>
                    <li>{ format_to_html(match_.theory_solving) }{ " theory solving" }</li>
                    <li>{ format_to_html(match_.axioms) }{ " internal axiom" }</li>
                    <li>{ format_to_html(match_.quantifiers) }{ " quantifier" }</li>
            </ul></>},
        ),
        (format_to_html(inst.enodes), html! { "Enodes" }),
        (
            format_to_html(inst.geqs_nontrivial()),
            html! { "Proved equalities" },
        ),
        (
            format_to_html(inst.treqs_nontrivial()),
            html! { "Used equalities" },
        ),
        (format_to_html(inst.proofs), html! { "Proof steps" }),
        (
            format_to_html(inst.proofs_nt_nq),
            html! { "Non-trivial proof steps" },
        ),
        (format_to_html(inst.cdcls), html! { "CDCL tree nodes" }),
    ];

    html! {<Detail title="Metrics" hover="Absolute numbers of various events.">
        <TreeList elements={details} />
    </Detail>}
}

#[function_component]
pub fn MostQuants(props: &SummaryPropsInner) -> Html {
    let parser = props.parser.parser.borrow();
    let summary = &props.parser.summary;
    let colours = &props.parser.colour_map;

    let quants = summary.log_info.quants_iter();
    let quants = quants_ordered::<_, true>(&parser, colours, quants);
    let quants = quants
        .iter()
        .take(DISPLAY_TOP_N)
        .take_while(|(.., c)| *c > 0);
    let quants = quants.map(|(q, hue, c)| {
        let left = format_to_html(*c);
        let right = html! { <div class="info-box-row">{ format!("{q}") }<QuantColourBox {hue} /></div> };
        (left, right)
    }).collect::<Vec<_>>();

    html! {<Detail title="Most instantiated quantifiers" hover="The quantifiers which have been instantiated the most.">
        <TreeList elements={quants} />
    </Detail>}
}

#[function_component]
pub fn CostQuants(props: &SummaryPropsInner) -> Html {
    props.analysis.as_ref().map(|analysis| {
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let colours = &props.parser.colour_map;

        let costs = analysis.quants.quants_costs().map(|(q, c)| (q, F64Ord(c)));
        let costs = quants_ordered::<_, true>(&parser, colours, costs);
        let costs = costs.iter().take(DISPLAY_TOP_N).take_while(|(.., c)| c.0 > 0.0);
        let costs = costs.map(|(q, hue, c)| {
            let left = format_to_html(c.0 as u64);
            let right = html! { <div class="info-box-row">{ format!("{q}") }<QuantColourBox {hue} /></div> };
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Most expensive quantifiers" hover="The quantifiers upon which the most instantiations depend.">
            <TreeList elements={costs} />
        </Detail>}
    }).unwrap_or_default()
}

#[function_component]
pub fn CostProofs(props: &SummaryPropsInner) -> Html {
    props.analysis.as_ref().map(|analysis| {
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let ctxt = props.ctxt(&parser);
        let proofs = analysis.proofs.hypothesis_cost.iter().take(DISPLAY_TOP_N);
        let proofs = proofs.map(|&(p, c)| {
            let p = format!("<code class=\"margin-left-half\">{}</code>", parser[p].result.with(&ctxt));
            let right = Html::from_html_unchecked(p.into());
            let left = format_to_html(c as u64);
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Most expensive hypotheses" hover="The hypotheses which were the most expensive to contradict." tip="Try providing their negation directly.">
            <TreeList elements={proofs} />
        </Detail>}
    }).unwrap_or_default()
}

#[function_component]
pub fn CostCdcl(props: &SummaryPropsInner) -> Html {
    let parser = props.parser.parser.borrow();
    let ctxt = props.ctxt(&parser);
    let cdcl = props.parser.cdcl.uncut_assigns.iter().take(DISPLAY_TOP_N);
    let cdcl = cdcl
        .map(|&(p, c)| {
            let p = format!("<code class=\"margin-left-half\">{}</code>", p.with(&ctxt));
            let right = Html::from_html_unchecked(p.into());
            let left = format_to_html(c);
            (left, right)
        })
        .collect::<Vec<_>>();
    html! {<Detail title="Most common assignments" hover="The CDCL assignments which didn't lead to a conflict." tip="Try assigning the truth value directly.">
        <TreeList elements={cdcl} />
    </Detail>}
}

fn format_to_html<F: ToFormattedString>(f: F) -> Html {
    html! {{ f.to_formatted_string(&Locale::en) }}
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
            // log::info!("{name}: {hue:?} | {c:?}");
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
