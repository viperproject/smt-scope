use std::rc::Rc;

use smt_log_parser::{
    analysis::{
        raw::{EdgeKind, Node, NodeKind},
        visible::{VisibleEdge, VisibleEdgeKind},
        InstGraph, RawNodeIndex, VisibleEdgeIndex,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
    items::{MatchKind, VarNames},
};
use yew::{
    function_component, html, use_context, AttrValue, Callback, Html, MouseEvent, Properties,
};

use crate::{
    configuration::ConfigurationProvider,
    screen::{
        file::RcAnalysis,
        graphviz::{DotEdgeProperties, DotNodeProperties},
        homepage::RcParser,
        inst_graph::RcVisibleGraph,
    },
};

#[derive(Properties, PartialEq)]
pub struct InfoLineProps {
    header: String,
    text: String,
    code: bool,
}
#[function_component]
pub fn InfoLine(InfoLineProps { header, text, code }: &InfoLineProps) -> Html {
    if *code {
        let text = format!("<code>{text}</code>");
        let text = Html::from_html_unchecked(AttrValue::from(text));
        html! {
            <li><h4 style="display: inline">{header}{": "}</h4>{text}</li>
        }
    } else {
        html! {
            <li><h4 style="display: inline">{header}{": "}</h4>{text}</li>
        }
    }
}

pub struct NodeInfo<'a, 'b> {
    pub node: &'a Node,
    pub ctxt: &'b DisplayCtxt<'b>,
}

impl<'a, 'b> NodeInfo<'a, 'b> {
    pub fn index(&self) -> String {
        self.node.kind().label(())
    }
    pub fn kind(&self) -> &'static str {
        match *self.node.kind() {
            NodeKind::ENode(_) => "ENode",
            NodeKind::GivenEquality(..) => "Equality",
            NodeKind::TransEquality(_) => "Equality",
            NodeKind::Instantiation(inst) => {
                match &self.ctxt.parser[self.ctxt.parser[inst].match_].kind {
                    MatchKind::MBQI { .. } => "MBQI",
                    MatchKind::TheorySolving { .. } => "Theory Solving",
                    MatchKind::Axiom { .. } => "Axiom",
                    MatchKind::Quantifier { .. } => "Quantifier",
                }
            }
        }
    }
    pub fn description(&self) -> Html {
        // TODO:
        // let description = self.node.kind().tooltip((*self.ctxt, true, char_limit));
        let description = self.node.kind().tooltip(self.ctxt.parser);
        let description = format!("<code>{description}</code>");
        Html::from_html_unchecked(AttrValue::from(description))
    }

    pub fn detail(&self) -> (&'static str, String) {
        match *self.node.kind() {
            NodeKind::Instantiation(inst) => {
                let match_ = &self.ctxt.parser[self.ctxt.parser[inst].match_];
                let detail = match_.kind.with(self.ctxt).to_string();
                ("Body", detail)
            }
            NodeKind::ENode(enode) => {
                let detail = enode.with(self.ctxt).to_string();
                ("Term", detail)
            }
            NodeKind::GivenEquality(eq, _) => {
                let detail = eq.with(self.ctxt).to_string();
                ("Equality", detail)
            }
            NodeKind::TransEquality(eq) => {
                let detail = eq.with(self.ctxt).to_string();
                ("Equality", detail)
            }
        }
    }
    pub fn blame(&self) -> Option<Vec<(String, String, Vec<String>)>> {
        let NodeKind::Instantiation(iidx) = *self.node.kind() else {
            return None;
        };
        let data = self.ctxt.parser.get_inst(iidx);
        let qpat = data.match_.kind.quant_pat()?;
        let pattern = self.ctxt.parser.get_pattern(qpat)?;
        let pattern_matches = self.ctxt.parser[pattern]
            .child_ids
            .iter()
            .rev()
            .zip(data.match_.pattern_matches());
        let mut blame: Vec<_> = pattern_matches
            .map(|(pattern, matched)| {
                let pattern = pattern
                    .with_data(self.ctxt, &mut Some(qpat.quant))
                    .to_string();
                let enode = matched.enode().with(self.ctxt).to_string();
                let equalities = matched
                    .equalities()
                    .filter(|&eq| self.ctxt.parser[eq].given_len != 0)
                    .map(|eq| eq.with(self.ctxt).to_string())
                    .collect();
                (pattern, enode, equalities)
            })
            .collect();
        blame.reverse();
        Some(blame)
    }
    pub fn bound_terms(&self) -> Option<Vec<String>> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let match_ = &self.ctxt.parser[self.ctxt.parser[inst].match_];
        let bound_terms = match_.kind.bound_terms(
            |enode| enode.with(self.ctxt).to_string(),
            |term| term.with(self.ctxt).to_string(),
        );
        let vars = match_
            .kind
            .quant_idx()
            .and_then(|quant| self.ctxt.parser[quant].vars.as_ref());
        Some(
            bound_terms
                .into_iter()
                .enumerate()
                .map(|(idx, bound)| {
                    let name =
                        VarNames::get_name(&self.ctxt.parser.strings, vars, idx, self.ctxt.config);
                    format!("{name} ↦ {bound}")
                })
                .collect(),
        )
    }
    pub fn resulting_term(&self) -> Option<String> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let resulting_term = self.ctxt.parser.get_instantiation_body(inst)?;
        Some(resulting_term.with(self.ctxt).to_string())
    }
    pub fn yield_terms(&self) -> Option<Vec<String>> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let yields_terms = self.ctxt.parser[inst].yields_terms.iter();
        Some(
            yields_terms
                .map(|term| term.with(self.ctxt).to_string())
                .collect(),
        )
    }
    pub fn extra_info(&self) -> Option<Vec<(&'static str, String)>> {
        let mut extra_info = Vec::new();
        if let Some(z3gen) = self
            .node
            .kind()
            .inst()
            .and_then(|i| self.ctxt.parser[i].z3_generation)
        {
            extra_info.push(("z3 gen", z3gen.to_string()));
        }
        if let Some(frame) = self.node.frame(self.ctxt.parser) {
            let frame = &self.ctxt.parser[frame];
            extra_info.push(("Frame", frame.active.to_string()));
        }
        (!extra_info.is_empty()).then_some(extra_info)
    }
}

#[derive(Properties, PartialEq)]
pub struct SelectedNodesInfoProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub selected_nodes: Vec<(RawNodeIndex, bool)>,
    pub on_click: Callback<RawNodeIndex>,
}

#[function_component]
pub fn SelectedNodesInfo(
    SelectedNodesInfoProps {
        parser,
        analysis,
        selected_nodes,
        on_click,
    }: &SelectedNodesInfoProps,
) -> Html {
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    if selected_nodes.is_empty() {
        return html! {};
    }
    let parser = parser.parser.borrow();
    let parser = &*parser;
    let graph = analysis.borrow();
    let graph = &graph.graph;
    let ctxt = &DisplayCtxt {
        parser,
        term_display: &term_display,
        config: cfg.config.display,
    };

    let infos = selected_nodes
        .iter()
        .map(|&(node, open)| {
            let onclick = {
                let on_click = on_click.clone();
                Callback::from(move |e: MouseEvent| {
                    e.prevent_default();
                    on_click.emit(node)
                })
            };
            let info = NodeInfo { node: &graph.raw[node], ctxt };
            let index = info.index();
            let header_text = info.kind();
            let summary = format!("[{index}] {header_text} ");
            let description = info.description();
            let (detail_header, detail) = info.detail();

            let blame: Option<Html> = info.blame().map(|blame| blame.into_iter().enumerate().map(|(idx, (pattern, enode, equalities))| {
                let equalities: Html = equalities.into_iter().map(|equality| html! {
                    <InfoLine header="Equality" text={equality} code=true />
                }).collect();
                html! {
                <>
                    <InfoLine header={format!("Trigger #{idx}")} text={pattern} code=true />
                    <InfoLine header="Matched" text={enode} code=true />
                    {equalities}
                <hr/></>
                }
            }).collect());
            let bound_terms = info.bound_terms().map(|terms| {
                let bound: Html = terms.into_iter().map(|term| html! {
                    <InfoLine header="Bound" text={term} code=true />
                }).collect();
                html! { <>{bound}<hr/></> }
            });
            let resulting_term = info.resulting_term().map(|term| html! {
                <><InfoLine header="Resulting Term" text={term} code=true /><hr/></>
            });
            let yield_terms = info.yield_terms().map(|terms| {
                let yields: Html = terms.into_iter().map(|term| html! {
                    <InfoLine header="Yield" text={term} code=true />
                }).collect();
                html! { <>{yields}<hr/></> }
            });
            let extra_info = info.extra_info().map(|extra_info| {
                let extra_info: Html = extra_info.into_iter().map(|(header, info)| html! {
                    <InfoLine {header} text={info} code=true />
                }).collect();
                html! { <>{extra_info}<hr/></> }
            });
            html! {
                <details {open}>
                <summary {onclick}>{summary}{description}</summary>
                <ul class="selected-info">
                    <InfoLine header={detail_header} text={detail} code=true />
                    <hr/>
                    {blame}
                    {bound_terms}
                    {resulting_term}
                    {yield_terms}
                    {extra_info}
                    <InfoLine header="Cost"     text={format!("{:.1}", info.node.cost)} code=false />
                    <InfoLine header="To Root"  text={format!("short {}, long {}", info.node.fwd_depth.min, info.node.fwd_depth.max)} code=false />
                    <InfoLine header="To Leaf"  text={format!("short {}, long {}", info.node.bwd_depth.min, info.node.bwd_depth.max)} code=false />
                    <InfoLine header="Degree"   text={
                        format!("parents {}, children {}",
                            graph.raw[node].parents.count,
                            graph.raw[node].children.count
                        )
                    } code=false />
                </ul>
                </details>
            }
        });
    html! {
    <>
        <h2>{"Selected Nodes"}</h2>
        <div class="selected-info-box">
            {for infos}
        </div>
    </>
    }
}

pub struct EdgeInfo<'a, 'b> {
    pub edge: &'a VisibleEdge,
    pub kind: &'a VisibleEdgeKind,
    pub from: RawNodeIndex,
    pub to: RawNodeIndex,
    pub graph: &'a InstGraph,
    pub ctxt: &'b DisplayCtxt<'b>,
}

impl<'a, 'b> EdgeInfo<'a, 'b> {
    pub fn index(&self) -> String {
        self.tooltip()
    }
    pub fn kind(&self) -> String {
        match self.kind {
            VisibleEdgeKind::Direct(_, EdgeKind::Yield) => "Yield".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::Blame { pattern_term }) => {
                format!("Blame pattern #{pattern_term}")
            }
            VisibleEdgeKind::Direct(_, EdgeKind::BlameEq { .. }) => "Blame Equality".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::EqualityFact) => "Equality Fact".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::EqualityCongruence) => {
                "Equality Congruence".to_string()
            }
            VisibleEdgeKind::Direct(_, EdgeKind::TEqualitySimple { forward }) => format!(
                "Simple {}Equality",
                (!forward).then_some("Reverse ").unwrap_or_default()
            ),
            VisibleEdgeKind::Direct(_, EdgeKind::TEqualityTransitive { forward }) => format!(
                "Transitive {}Equality",
                (!forward).then_some("Reverse ").unwrap_or_default()
            ),
            VisibleEdgeKind::YieldBlame { pattern_term, .. } => {
                format!("Yield/Blame pattern #{pattern_term}")
            }
            VisibleEdgeKind::YieldEq(_) => "Yield Equality".to_string(),
            VisibleEdgeKind::YieldBlameEq { .. } => "Yield/Blame Equality".to_string(),
            VisibleEdgeKind::YieldEqOther(_) => "Yield Equality Other".to_string(),
            VisibleEdgeKind::ENodeEq(_) => "ENode Equality".to_string(),
            VisibleEdgeKind::ENodeBlameEq { .. } => "ENode/Blame Equality".to_string(),
            VisibleEdgeKind::ENodeEqOther(_) => "ENode Equality Other".to_string(),
            VisibleEdgeKind::Unknown(start, end) => {
                let ctxt = self.ctxt;
                let hidden_from = self.graph.raw.graph.edge_endpoints(start.0).unwrap().1;
                let hidden_to = self.graph.raw.graph.edge_endpoints(end.0).unwrap().0;
                let hidden_from = NodeInfo {
                    node: &self.graph.raw.graph[hidden_from],
                    ctxt,
                };
                let hidden_to = NodeInfo {
                    node: &self.graph.raw.graph[hidden_to],
                    ctxt,
                };
                format!("Compound {} to {}", hidden_from.kind(), hidden_to.kind())
            }
        }
    }
    pub fn tooltip(&self) -> String {
        let is_indirect = self.edge.is_indirect(self.graph);
        let from = self.graph.raw[self.from].kind();
        let to = self.graph.raw[self.to].kind();
        self.edge.tooltip((is_indirect, *from, *to))
    }
}

#[derive(Properties, PartialEq)]
pub struct SelectedEdgesInfoProps {
    pub parser: RcParser,
    pub analysis: RcAnalysis,
    pub selected_edges: Vec<(VisibleEdgeIndex, bool)>,
    pub rendered: RcVisibleGraph,
    pub on_click: Callback<VisibleEdgeIndex>,
}

#[function_component]
pub fn SelectedEdgesInfo(
    SelectedEdgesInfoProps {
        parser,
        analysis,
        selected_edges,
        rendered,
        on_click,
    }: &SelectedEdgesInfoProps,
) -> Html {
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    if selected_edges.is_empty() {
        return html! {};
    }
    let parser = parser.parser.borrow();
    let parser = &*parser;
    let graph = analysis.borrow();
    let graph = &graph.graph;
    let ctxt = &DisplayCtxt {
        parser,
        term_display: &term_display,
        config: cfg.config.display,
    };

    let infos = selected_edges.iter().map(|&(edge, open)| {
        let onclick = {
            let on_click = on_click.clone();
            Callback::from(move |_| on_click.emit(edge))
        };
        let (from, to) = rendered.graph.edge_endpoints(edge.0).unwrap();
        let (from, to) = (rendered.graph[from].idx, rendered.graph[to].idx);
        let edge = &rendered[edge];
        let kind = &edge.kind(graph);
        let info = EdgeInfo {
            edge,
            kind,
            from,
            to,
            graph,
            ctxt,
        };

        let summary = format!("[{}] {}", info.index(), info.kind());
        // Get info about blamed node
        let blame = graph.raw.index(info.kind.blame(graph));
        // TODO:
        // let blame = graph.raw[blame].kind().tooltip((*ctxt, true, None));
        let blame = graph.raw[blame].kind().tooltip(ctxt.parser);
        html! {
            <details {open} {onclick}>
                <summary>{summary}</summary>
                <ul class="selected-info">
                    <InfoLine header="Blamed" text={blame} code=true />
                </ul>
            </details>
        }
    });
    html! {
    <>
        <h2>{"Selected Dependencies"}</h2>
        <div class="selected-info-box">
            {for infos}
        </div>
    </>
    }
}
