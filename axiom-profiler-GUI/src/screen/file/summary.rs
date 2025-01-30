use std::{borrow::Cow, cmp::Reverse, fmt::Debug, rc::Rc};

use num_format::{Locale, ToFormattedString};
use smt_log_parser::{
    analysis::{CdclAnalysis, LogInfo, RedundancyAnalysis},
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

// TODO: make configurable
const DISPLAY_TOP_N: usize = 250;

pub struct SummaryAnalysis {
    pub log_info: LogInfo,
    pub cdcl: CdclAnalysis,
    pub redundancy: RedundancyAnalysis,
}

impl SummaryAnalysis {
    pub fn new(parser: &Z3Parser) -> Self {
        Self {
            log_info: LogInfo::new(parser),
            cdcl: CdclAnalysis::new(parser),
            redundancy: RedundancyAnalysis::new(parser),
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

    let inner = SummaryPropsInner {
        parser: props.parser.clone(),
        analysis: props.analysis.clone(),
        term_display: term_display.clone(),
        config: cfg.config.display,
        avg_weighing: cfg.config.avg_weighing.0,
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
        <article class="pf-content"><DetailContainer>
            <Metrics ..inner.clone() />
            <MostQuants ..inner.clone() />
            <CostQuants ..inner.clone() />
            <MultQuants ..inner.clone() />
        </DetailContainer>
        <DetailContainer>
            <CostLemmas ..inner.clone() />
            <CostCdcl ..inner />
        </DetailContainer>
        </article>
        {graph}
    </div>}
}

#[derive(Properties, Clone, PartialEq)]
pub struct SummaryPropsInner {
    pub parser: RcParser,
    pub analysis: Option<RcAnalysis>,
    pub term_display: Rc<TermDisplayContext>,
    pub config: DisplayConfiguration,
    pub avg_weighing: f64,
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

    let quants = summary.log_info.quants_iter().map(|(q, c)| (q, (), c));
    let quants = quants_ordered::<(), _, true>(&parser, colours, quants);
    let quants = quants
        .iter()
        .take(DISPLAY_TOP_N)
        .take_while(|(.., c)| *c > 0);
    let quants = quants.map(|(q, hue, (), c)| {
        let left = format_to_html(*c);
        let right = html! { <div class="info-box-row"><QuantColourBox margin_right={true} {hue} />{ format!("{q}") }</div> };
        (left, right)
    }).collect::<Vec<_>>();

    html! {<Detail title="Instantiation count" hover="The quantifiers which have been instantiated the most.">
        <TreeList elements={quants} />
    </Detail>}
}

#[function_component]
pub fn CostQuants(props: &SummaryPropsInner) -> Html {
    props.analysis.as_ref().map(|analysis| {
        let log_info = &props.parser.summary.log_info;
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let colours = &props.parser.colour_map;
        let offset = log_info.match_.quantifiers as f64 * props.avg_weighing / 100.;

        let costs = analysis.quants.quants_costs().map(|(q, c)| {
            let qis = log_info.quant_insts(q);
            if qis == 0 {
                (q, 0.0, F64Ord(0.0))
            } else {
                (q, c / qis as f64, F64Ord(c / (qis as f64 + offset)))
            }
        });
        let costs = quants_ordered::<_, _, true>(&parser, colours, costs);
        let costs = costs.iter().take(DISPLAY_TOP_N).take_while(|(.., c)| c.0 > 0.0);
        let costs = costs.map(|(q, hue, c, _)| {
            let left = html!{{ format!("{c:.1}") }};
            let right = html! { <div class="info-box-row"><QuantColourBox margin_right={true} {hue} />{ format!("{q}") }</div> };
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Average cost" hover="The quantifiers upon which the most instantiations causally depend. See average weighing flag.">
            <TreeList elements={costs} />
        </Detail>}
    }).unwrap_or_default()
}

#[function_component]
pub fn MultQuants(props: &SummaryPropsInner) -> Html {
    let log_info = &props.parser.summary.log_info;
    let redundancy = &props.parser.summary.redundancy;
    let parser = props.parser.parser.borrow();
    let colours = &props.parser.colour_map;
    let offset = log_info.match_.quantifiers as f64 * props.avg_weighing / 100.;

    let mults = redundancy.per_quant.iter_enumerated().map(|(q, c)| {
        let qis = log_info.quant_insts(q.quant);
        let mult = c.input_multiplicativity();
        let ord = mult * qis as f64 / (qis as f64 + offset);
        (q.quant, (mult, q), F64Ord(ord))
    });
    let mults = quants_ordered::<_, _, true>(&parser, colours, mults);
    let mults = mults
        .iter()
        .take(DISPLAY_TOP_N)
        .take_while(|(.., c)| c.0 > 0.0);
    let mults = mults.map(|(q, hue, (c, qpat), _)| {
        let left = html!{{ format!("{c:.1}") }};
        let pat = if let Some(pat) = qpat.pat {
            if parser.patterns(qpat.quant).is_some_and(|pats| pats.len() > 1) {
                format!(" {{ {} }}", usize::from(pat) + 1)
            } else {
                String::new()
            }
        } else {
            " {{ MBQI }}".to_string()
        };
        let right = html! { <div class="info-box-row"><QuantColourBox margin_right={true} {hue} />{ format!("{q}{pat}") }</div> };
        (left, right)
    }).collect::<Vec<_>>();
    html! {<Detail title="Multiplicativity" hover="The quantifiers which the highest multiplicative factor M, i.e. those that take N terms and turn them into N*M instantiations. See average weighing flag.">
        <TreeList elements={mults} />
    </Detail>}
}

#[function_component]
pub fn CostLemmas(props: &SummaryPropsInner) -> Html {
    props.analysis.as_ref().map(|analysis| {
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let lemmas = analysis.proofs.lemmas_cost.iter().take(DISPLAY_TOP_N);
        let lemmas = lemmas.map(|&(l, c)| {
            let left = format_to_html(c as u64);
            let right = collapsed_expanded(l, props.ctxt(&parser));
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Most expensive lemmas" hover="The lemmas which were the most expensive to prove (by contradiction)." tip="Try providing them directly.">
            <TreeList elements={lemmas} />
        </Detail>}
    }).unwrap_or_default()
}

#[function_component]
pub fn CostCdcl(props: &SummaryPropsInner) -> Html {
    let parser = props.parser.parser.borrow();
    let assignments = props.parser.summary.cdcl.assignments.iter();
    let mut assignments = assignments
        .filter(|(_, (t, f))| t.count > 0 && f.count > 0)
        .collect::<Vec<_>>();
    assignments.sort_unstable_by_key(|&(term, (t, f))| (Reverse(t.cost + f.cost), term));
    let assignments = assignments.into_iter().take(DISPLAY_TOP_N);
    let cdcl = assignments
        .map(|(&term, &(t, f))| {
            let tc = format_to_html(t.cost);
            let fc = format_to_html(f.cost);
            let right = collapsed_expanded(term, props.ctxt(&parser));
            (html! { <>{tc}{" | "}{fc}</> }, right)
        })
        .collect::<Vec<_>>();
    html! {<Detail title="Most explored assignments" hover="The CDCL assignments which took the most effort to explore. The two numbers indicate effort when assigned `true | false`.">
        <TreeList elements={cdcl} />
    </Detail>}
}

fn format_to_html<F: ToFormattedString>(f: F) -> Html {
    html! {{ f.to_formatted_string(&Locale::en) }}
}

fn quants_ordered<'a, D, T: Ord + Copy + Debug, const REVERSE: bool>(
    parser: &'a Z3Parser,
    colour_map: &QuantIdxToColourMap,
    quants: impl Iterator<Item = (QuantIdx, D, T)>,
) -> Vec<(Cow<'a, str>, Option<f64>, D, T)> {
    let mut quants = quants
        .filter_map(|(q, d, c)| {
            let name = parser[q].kind.name(&parser.strings)?;
            let hue = colour_map.get_rbg_hue(Some(q));
            // log::info!("{name}: {hue:?} | {c:?}");
            Some((name, hue, d, c))
        })
        .collect::<Vec<_>>();
    if REVERSE {
        quants.sort_by_key(|(.., c)| Reverse(*c));
    } else {
        quants.sort_by_key(|(.., c)| *c);
    }
    quants
}

fn collapsed_expanded<'a, D: Default>(
    display: impl DisplayWithCtxt<DisplayCtxt<'a>, D> + Copy,
    mut ctxt: DisplayCtxt<'a>,
) -> Html {
    let expanded = format!("<code>{}</code>", display.with(&ctxt));
    ctxt.config.ast_depth_limit = NonMaxU32::new(2);
    let collapsed = format!("<code>{}</code>", display.with(&ctxt));
    if expanded == collapsed {
        Html::from_html_unchecked(expanded.into())
    } else {
        let expanded = Html::from_html_unchecked(expanded.into());
        let collapsed = Html::from_html_unchecked(collapsed.into());
        html! {<ExpandOnFocus {collapsed} {expanded} />}
    }
}

#[derive(Properties, Clone, PartialEq)]
pub struct EofProps {
    pub collapsed: Html,
    pub expanded: Html,
}

#[function_component]
pub fn ExpandOnFocus(props: &EofProps) -> Html {
    let focused = use_state_eq(|| false);
    let f = *focused;
    let focused_ref = focused.clone();
    let onblur = Callback::from(move |_| focused_ref.set(false));
    let onmousedown = Callback::from(move |_| {
        let focused_ref = focused.clone();
        gloo::timers::callback::Timeout::new(1, move || focused_ref.set(!f)).forget();
    });
    html! {<div tabindex="0" class="expand-collapse" {onmousedown} {onblur}>
        {if f { props.expanded.clone() } else { props.collapsed.clone() }}
    </div>}
}
