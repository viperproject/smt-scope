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

    let inner = SummaryPropsInner {
        parser: props.parser.clone(),
        analysis: props.analysis.clone(),
        term_display: term_display.clone(),
        config: cfg.config.display,
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
        </DetailContainer><DetailContainer>
            <CostLemmas ..inner.clone() />
            <CostCdcl ..inner />
        </DetailContainer></article>
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
        let log_info = &props.parser.summary.log_info;
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let colours = &props.parser.colour_map;

        let costs = analysis.quants.quants_costs().map(|(q, c)| {
            let qis = log_info.quant_insts(q);
            if qis == 0 {
                (q, F64Ord(0.0))
            } else {
                (q, F64Ord(c / qis as f64))
            }
        });
        let costs = quants_ordered::<_, true>(&parser, colours, costs);
        let costs = costs.iter().take(DISPLAY_TOP_N).take_while(|(.., c)| c.0 > 0.0);
        let costs = costs.map(|(q, hue, c)| {
            let left = html!{{ format!("{:.1}", c.0) }};
            let right = html! { <div class="info-box-row">{ format!("{q}") }<QuantColourBox {hue} /></div> };
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Most expensive quantifiers" hover="The quantifiers upon which the most instantiations depend.">
            <TreeList elements={costs} />
        </Detail>}
    }).unwrap_or_default()
}

#[function_component]
pub fn MultQuants(props: &SummaryPropsInner) -> Html {
    props.analysis.as_ref().map(|analysis| {
        let log_info = &props.parser.summary.log_info;
        let parser = props.parser.parser.borrow();
        let analysis = analysis.borrow();
        let colours = &props.parser.colour_map;

        let mults = analysis.quants.quants_children().map(|(q, c)| {
            let qis = log_info.quant_insts(q);
            if qis == 0 {
                (q, F64Ord(0.0))
            } else {
                (q, F64Ord(c / qis as f64))
            }
        });
        let mults = quants_ordered::<_, true>(&parser, colours, mults);
        let mults = mults.iter().take(DISPLAY_TOP_N).take_while(|(.., c)| c.0 > 0.0);
        let mults = mults.map(|(q, hue, c)| {
            let left = html!{{ format!("{:.1}", c.0) }};
            let right = html! { <div class="info-box-row">{ format!("{q}") }<QuantColourBox {hue} /></div> };
            (left, right)
        }).collect::<Vec<_>>();
        html! {<Detail title="Multiplicative quantifiers" hover="The quantifiers which the highest multiplicative factor, i.e. those that on average directly cause N other instantiations.">
            <TreeList elements={mults} />
        </Detail>}
    }).unwrap_or_default()
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
    let cdcl = props.parser.cdcl.uncut_assigns.iter().take(DISPLAY_TOP_N);
    let cdcl = cdcl
        .map(|&(p, c)| {
            let left = format_to_html(c);
            let right = collapsed_expanded(p, props.ctxt(&parser));
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

    let moved = use_mut_ref(|| false);
    let moved_ref = moved.clone();
    let onmousedown = Callback::from(move |_| *moved_ref.borrow_mut() = false);
    let moved_ref = moved.clone();
    let onmousemove = Callback::from(move |_| *moved_ref.borrow_mut() = true);
    let (focused_ref, moved_ref) = (focused, moved);
    let onmouseup = Callback::from(move |_| {
        if !*moved_ref.borrow() {
            focused_ref.set(!f)
        }
    });
    html! {<div tabindex="0" class="expand-collapse" {onmousedown} {onmousemove} {onmouseup} {onblur}>
        {if f { props.expanded.clone() } else { props.collapsed.clone() }}
    </div>}
}
