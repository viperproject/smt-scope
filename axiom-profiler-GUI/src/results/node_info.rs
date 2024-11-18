use std::rc::Rc;

use smt_log_parser::{
    analysis::{
        raw::{EdgeKind, Node, NodeKind},
        visible::{VisibleEdge, VisibleEdgeKind},
        InstGraph, RawNodeIndex, VisibleEdgeIndex,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::{MatchKind, TermIdx, VarNames},
    NonMaxU32,
};
use yew::{
    function_component, html, use_context, AttrValue, Callback, Html, MouseEvent, Properties,
};

use crate::{configuration::ConfigurationProvider, state::StateProvider};

use super::svg_result::RenderedGraph;

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
        self.node.kind().to_string()
    }
    pub fn kind(&self) -> &'static str {
        match *self.node.kind() {
            NodeKind::ENode(_) => "ENode",
            NodeKind::GivenEquality(..) => "Equality",
            NodeKind::TransEquality(_) => "Equality",
            NodeKind::ProofStep(_) => "Proof Step Result",
            NodeKind::Decision(_) => "Decision",
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
    pub fn description(&self, char_limit: Option<NonMaxU32>) -> Html {
        let description = self.tooltip(true, char_limit);
        let description = format!("<code>{description}</code>");
        Html::from_html_unchecked(AttrValue::from(description))
    }
    // TODO: rename
    pub fn tooltip(&self, html: bool, char_limit: Option<NonMaxU32>) -> String {
        let mut ctxt = DisplayCtxt {
            parser: self.ctxt.parser,
            term_display: self.ctxt.term_display,
            config: self.ctxt.config.clone(),
        };
        ctxt.config.html = html;
        ctxt.config.enode_char_limit = char_limit;
        ctxt.config.ast_depth_limit = NonMaxU32::new(5);
        match *self.node.kind() {
            NodeKind::ENode(enode) => {
                ctxt.config.enode_char_limit = ctxt
                    .config
                    .enode_char_limit
                    .and_then(|limit| NonMaxU32::new(limit.get() * 2));
                enode.with(&ctxt).to_string()
            }
            NodeKind::GivenEquality(eq, _) => eq.with(&ctxt).to_string(),
            NodeKind::TransEquality(eq) => eq.with(&ctxt).to_string(),
            NodeKind::ProofStep(ps) => ps.with(&ctxt).to_string(),
            NodeKind::Decision(dec) => dec.with(&ctxt).to_string(),
            NodeKind::Instantiation(inst) => match &ctxt.parser[ctxt.parser[inst].match_].kind {
                MatchKind::MBQI { quant, .. } => ctxt.parser[*quant].kind.with(&ctxt).to_string(),
                MatchKind::TheorySolving { axiom_id, .. } => {
                    let namespace = &ctxt.parser[axiom_id.namespace];
                    let id = axiom_id.id.map(|id| id.to_string()).unwrap_or_default();
                    format!("{namespace}[{id}]")
                }
                MatchKind::Axiom { axiom, .. } => ctxt.parser[*axiom].kind.with(&ctxt).to_string(),
                MatchKind::Quantifier { quant, .. } => {
                    ctxt.parser[*quant].kind.with(&ctxt).to_string()
                }
            },
        }
    }

    pub fn quantifier_body(&self) -> Option<String> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let quant_idx = self.ctxt.parser[self.ctxt.parser[inst].match_]
            .kind
            .quant_idx()?;
        Some(quant_idx.with(self.ctxt).to_string())
    }
    pub fn blame(&self) -> Option<Vec<(String, String, Vec<String>)>> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let match_ = &self.ctxt.parser[self.ctxt.parser[inst].match_];
        let mut qidx = match_.kind.quant_idx();
        let pattern = match_.kind.pattern()?;
        let trigger_matches = self.ctxt.parser[pattern]
            .child_ids
            .iter()
            .rev()
            .zip(match_.trigger_matches());
        let mut blame: Vec<_> = trigger_matches
            .map(|(trigger, matched)| {
                let trigger = trigger.with_data(self.ctxt, &mut qidx).to_string();
                let enode = matched.enode().with(self.ctxt).to_string();
                let equalities = matched
                    .equalities()
                    .map(|eq| eq.with(self.ctxt).to_string())
                    .collect();
                (trigger, enode, equalities)
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
                        VarNames::get_name(&self.ctxt.parser.strings, vars, idx, &self.ctxt.config);
                    format!("{name} ↦ {bound}")
                })
                .collect(),
        )
    }
    pub fn resulting_term(&self) -> Option<String> {
        let NodeKind::Instantiation(inst) = *self.node.kind() else {
            return None;
        };
        let resulting_term = self.ctxt.parser[inst].get_resulting_term()?;
        // The resulting term is of the form `quant-inst(¬(quant) ∨ (inst))`.
        let resulting_term_or = *self.ctxt.parser[resulting_term].child_ids.first()?;
        let resulting_term = *self.ctxt.parser[resulting_term_or].child_ids.get(1)?;
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
    pub fn prerequisites(&self) -> Option<Vec<String>> {
        let NodeKind::ProofStep(ps_idx) = *self.node.kind() else {
            return None;
        };
        let ps = &self.ctxt.parser[ps_idx];
        Some(
            ps.prerequisites
                .iter()
                .map(|pre| pre.with(self.ctxt).to_string())
                .collect(),
        )
    }
    pub fn proof_step_name(&self) -> Option<String> {
        let NodeKind::ProofStep(ps) = *self.node.kind() else {
            return None;
        };
        let ps_name = self.ctxt.parser[ps].name;
        Some(self.ctxt.parser.strings[*ps_name].to_string())
    }
    pub fn propagations(&self) -> Option<Vec<String>> {
        let NodeKind::Decision(dec_idx) = *self.node.kind() else {
            return None;
        };
        let dec = &self.ctxt.parser[dec_idx];
        Some(
            dec.clause_propagations
                .iter()
                // .map(|(cl, val)| format!("{} → {}", cl.with(self.ctxt), val))
                .map(|prop| {
                    format!(
                        "{} → {} on path {}",
                        prop.clause.with(self.ctxt),
                        prop.value,
                        prop.search_path
                    )
                })
                .collect(),
        )
    }
    pub fn results_in_conflict(&self) -> Option<&Option<Vec<(TermIdx, bool)>>> {
        let NodeKind::Decision(dec) = *self.node.kind() else {
            return None;
        };
        Some(&self.ctxt.parser[dec].results_in_conflict)
    }
}

#[derive(Properties, PartialEq)]
pub struct SelectedNodesInfoProps {
    pub selected_nodes: Vec<(RawNodeIndex, bool)>,
    pub on_click: Callback<RawNodeIndex>,
}

#[function_component]
pub fn SelectedNodesInfo(
    SelectedNodesInfoProps {
        selected_nodes,
        on_click,
    }: &SelectedNodesInfoProps,
) -> Html {
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let data = use_context::<Rc<StateProvider>>().unwrap();

    if selected_nodes.is_empty() {
        return html! {};
    }
    let parser = data.state.parser.as_ref().unwrap();
    let graph = parser.graph.as_ref().unwrap();
    let parser = &*parser.parser;
    let graph = graph.borrow();
    // TODO: make this a feature?
    let mut config = cfg.config.display.clone();
    config.ast_depth_limit = NonMaxU32::new(10);
    let ctxt = &DisplayCtxt {
        parser: &parser.borrow(),
        term_display: &data.state.term_display,
        config,
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
            let summary = format!("[{index}] {header_text}: ");
            let description = info.description((!open).then(|| NonMaxU32::new(10).unwrap()));
            let z3_gen = info.node.kind().inst().and_then(|i| (& *parser.borrow())[i].z3_generation).map(|g| format!(" (z3 gen {g})"));

            let quantifier_body = info.quantifier_body().map(|body| html! {
                <><InfoLine header="Body" text={body} code=true /><hr/></>
            });
            let blame: Option<Html> = info.blame().map(|blame| blame.into_iter().enumerate().map(|(idx, (trigger, enode, equalities))| {
                let equalities: Html = equalities.into_iter().map(|equality| html! {
                    <InfoLine header="Equality" text={equality} code=true />
                }).collect();
                html! {
                <>
                    <InfoLine header={format!("Trigger #{idx}")} text={trigger} code=true />
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
            let prerequisites = info.prerequisites().map(|prerequisites| {
                let requires: Html = prerequisites.into_iter().map(|prerequisite| html! {
                    <InfoLine header="Prerequisite" text={prerequisite} code=true />
                }).collect();
                html! { <>{requires}</> }
            });
            let proof_step_name = info.proof_step_name().map(|ps_name| {
                    html!{<InfoLine header="Proof Step Name" text={ps_name} code=true />}}); 
            let clause_propagations = info.propagations().map(|propagations| {
                let propagates: Html = propagations.into_iter().map(|propagation| html! {
                    <InfoLine header="Propagates" text={propagation} code=true />
                }).collect();
                html! { <>{propagates}</> }
            });
            let results_in_conflict = info.results_in_conflict().map(|conflict| {
                if let Some(conflict) = conflict {
                    let text = conflict.iter().map(|(term, value)| {
                        let value = if *value { "true" } else { "false" };
                        format!("{} → {}", term.with(ctxt).to_string(), value)
                    }).collect::<Vec<_>>().join(", ");
                    html!{<InfoLine header="CONFLICT! One must hold" {text} code=true />}
                } else {
                    html!{}
                }
            });
            let node_stats = match info.node.kind() {
                NodeKind::ProofStep(_) | NodeKind::Decision(_) => None,
                _ => {
                    Some(html! {
                    <>
                    <InfoLine header="Cost" text={format!("{:.1}{}", info.node.cost, z3_gen.unwrap_or_default())} code=false />
                    <InfoLine header="To Root" text={format!("short {}, long {}", info.node.fwd_depth.min, info.node.fwd_depth.max)} code=false />
                    <InfoLine header="To Leaf" text={format!("short {}, long {}", info.node.bwd_depth.min, info.node.bwd_depth.max)} code=false />
                    <InfoLine header="Degree" text={
                        format!("parents {}, children {}",
                            graph.raw.neighbors_directed(node, petgraph::Direction::Incoming).len(),
                            graph.raw.neighbors_directed(node, petgraph::Direction::Outgoing).len()
                        )
                    } code=false />
                    </>
                    }
                    )
                }
            };
            html! {
                <details {open}>
                <summary {onclick}>{summary}{description}</summary>
                <ul>
                    {quantifier_body}
                    {blame}
                    {bound_terms}
                    {resulting_term}
                    {yield_terms}
                    {node_stats}
                    {prerequisites}
                    {proof_step_name}
                    {clause_propagations}
                    {results_in_conflict}
                </ul>
                </details>
            }
        });
    html! {
    <>
        <h2>{"Selected Nodes"}</h2>
        <div>
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
        let is_indirect = self.edge.is_indirect(self.graph);
        let arrow = match is_indirect {
            true => "↝",
            false => "→",
        };
        let from = NodeInfo {
            node: &self.graph.raw[self.from],
            ctxt: self.ctxt,
        };
        let to = NodeInfo {
            node: &self.graph.raw[self.to],
            ctxt: self.ctxt,
        };
        format!("{} {arrow} {}", from.index(), to.index())
    }
    pub fn kind(&self) -> String {
        match self.kind {
            VisibleEdgeKind::Direct(_, EdgeKind::Yield) => "Yield".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::Blame { trigger_term }) => {
                format!("Blame trigger #{trigger_term}")
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
            VisibleEdgeKind::Direct(_, EdgeKind::ProofStep) => "Proof Step".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::Decision { assigned_to, .. }) => {
                format!("Assign {}", assigned_to)
            }
            // VisibleEdgeKind::Direct(_, EdgeKind::Decision(false)) => "Assign false".to_string(),
            VisibleEdgeKind::Direct(_, EdgeKind::BacktrackDecision) => "Backtrack".to_string(),
            VisibleEdgeKind::YieldBlame { trigger_term, .. } => {
                format!("Yield/Blame trigger #{trigger_term}")
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
        self.index()
    }
}

#[derive(Properties, PartialEq)]
pub struct SelectedEdgesInfoProps {
    pub selected_edges: Vec<(VisibleEdgeIndex, bool)>,
    pub rendered: Option<RenderedGraph>,
    pub on_click: Callback<VisibleEdgeIndex>,
}

#[function_component]
pub fn SelectedEdgesInfo(
    SelectedEdgesInfoProps {
        selected_edges,
        rendered,
        on_click,
    }: &SelectedEdgesInfoProps,
) -> Html {
    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let data = use_context::<Rc<StateProvider>>().unwrap();

    if selected_edges.is_empty() {
        return html! {};
    }
    let Some(rendered) = rendered else {
        return html! {};
    };
    let parser = data.state.parser.as_ref().unwrap();
    let graph = parser.graph.as_ref().unwrap();
    let parser = &*parser.parser;
    let graph = graph.borrow();
    let ctxt = &DisplayCtxt {
        parser: &parser.borrow(),
        term_display: &data.state.term_display,
        config: cfg.config.display.clone(),
    };

    let infos = selected_edges.iter().map(|&(edge, open)| {
        let onclick = {
            let on_click = on_click.clone();
            Callback::from(move |_| on_click.emit(edge))
        };
        let (from, to) = rendered.graph.graph.edge_endpoints(edge.0).unwrap();
        let (from, to) = (rendered.graph.graph[from].idx, rendered.graph.graph[to].idx);
        let edge = &rendered.graph[edge];
        let kind = &edge.kind(&graph);
        let info = EdgeInfo {
            edge,
            kind,
            from,
            to,
            graph: &graph,
            ctxt,
        };

        let summary = format!("[{}] {}", info.index(), info.kind());
        // Get info about blamed node
        let blame = graph.raw.index(info.kind.blame(&graph));
        let blame = NodeInfo {
            node: &graph.raw[blame],
            ctxt,
        };
        let blame = blame.tooltip(true, None);
        html! {
            <details {open} {onclick}>
                <summary>{summary}</summary>
                <ul>
                    <InfoLine header="Blamed" text={blame} code=true />
                </ul>
            </details>
        }
    });
    html! {
    <>
        <h2>{"Selected Dependencies"}</h2>
        <div>
            {for infos}
        </div>
    </>
    }
}
