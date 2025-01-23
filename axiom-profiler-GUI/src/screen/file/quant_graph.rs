use std::{cmp::Reverse, rc::Rc};

use petgraph::{
    graph::{DiGraph, NodeIndex},
    visit::EdgeRef,
};
use smt_log_parser::{
    analysis::{LogInfo, QuantifierAnalysis},
    display_with::DisplayCtxt,
    formatter::TermDisplayContext,
    items::{PatternIdx, QuantIdx, QuantPat},
    F64Ord, FxHashMap, FxHashSet,
};
use yew::prelude::*;

use crate::{
    configuration::ConfigurationProvider,
    screen::{
        graphviz::{DotEdgeProperties, DotNodeProperties},
        homepage::{FileInfo, RcParser},
    },
    utils::{colouring::QuantIdxToColourMap, graphviz::Dot},
};

use super::RcAnalysis;

#[derive(Properties, Clone, PartialEq)]
pub struct QuantGraphProps {
    pub file: FileInfo,
    pub parser: RcParser,
    pub analysis: RcAnalysis,
}

#[function_component]
pub fn QuantGraph(props: &QuantGraphProps) -> Html {
    let analysis = props.analysis.borrow();
    let log_info = &props.parser.summary.log_info;
    let qpg = QuantPetGraph::new(log_info, &analysis.quants);

    let cfg = use_context::<Rc<ConfigurationProvider>>().unwrap();
    let term_display = use_context::<Rc<TermDisplayContext>>().unwrap();

    let colour_map = &props.parser.colour_map;
    let ctxt = DisplayCtxt {
        parser: &props.parser.parser.borrow(),
        term_display: &term_display,
        config: cfg.config.display,
    };
    let dot = qpg.dot(log_info, &analysis.quants, ctxt, colour_map);
    let filename = props.file.name.clone();
    let suffix = "_quants".to_string();
    html! {
        <Dot {dot} {filename} {suffix} scale={true} />
    }
}

struct QuantPetGraph {
    graph: DiGraph<QuantNode, QuantEdge>,
    max_percent: f64,
}

impl QuantPetGraph {
    pub fn new(log_info: &LogInfo, quants: &QuantifierAnalysis) -> Self {
        let mut reverse_quant = FxHashMap::<QuantIdx, NodeIndex>::default();
        let mut reverse_subpat = FxHashMap::<(QuantPat, usize), NodeIndex>::default();
        let mut graph = DiGraph::new();
        let total = (log_info.inst.insts - log_info.match_.theory_solving) as f64;
        let mut max_percent = 0.1_f64;

        // Add per-quantifier nodes

        for (quant, data) in log_info.quants.0 .0.iter_enumerated() {
            let non_zero = || data.iter_enumerated().filter(|(_, c)| **c > 0);
            let pats_with_insts = non_zero().count();
            let kind = match pats_with_insts {
                0 => continue,
                1 => {
                    if let Some(pat) = non_zero().next().unwrap().0 {
                        QuantKind::Semi(pat)
                    } else {
                        QuantKind::Full
                    }
                }
                _ => QuantKind::Full,
            };

            let quant_count = non_zero().map(|(_, c)| *c).sum::<usize>();
            let percent = (100. * quant_count as f64) / total;
            max_percent = max_percent.max(percent);
            let node = QuantNode {
                quant,
                kind: QuantNodeKind::Quant(kind),
                count: quant_count,
                percent,
            };
            let qn = graph.add_node(node);
            reverse_quant.insert(quant, qn);

            for (pat, &count) in non_zero() {
                let percent = node.percent * (count as f64 / quant_count as f64);
                let qpat = QuantPat { quant, pat };
                let data = &quants[qpat];
                let (input, ek) = match (data.direct_deps.len(), kind) {
                    // `QuantKind::Full/Semi` and `QuantPatKind::Single`
                    (1, kind) => {
                        let kind = QuantPatKind::Single {
                            is_single_pat: matches!(kind, QuantKind::Semi(..)),
                        };
                        let node = QuantNode {
                            quant,
                            kind: QuantNodeKind::QuantPat(qpat, kind),
                            count,
                            percent,
                        };
                        let sn = graph.add_node(node);
                        let edge = QuantEdge {
                            kind: QuantEdgeKind::QuantPatToQuant,
                            count,
                            percent,
                        };
                        graph.add_edge(sn, qn, edge);
                        reverse_subpat.insert((qpat, 0), sn);
                        continue;
                    }
                    // `QuantKind::Semi` and `QuantPatKind::Full`
                    (_, QuantKind::Semi(..)) => (
                        qn,
                        QuantEdge {
                            kind: QuantEdgeKind::SubPatToQuant,
                            count,
                            percent,
                        },
                    ),
                    // `QuantKind::Full` and `QuantPatKind::Full`
                    (_, QuantKind::Full) => {
                        let node = QuantNode {
                            quant,
                            kind: QuantNodeKind::QuantPat(qpat, QuantPatKind::Full),
                            count,
                            percent,
                        };
                        let qpn = graph.add_node(node);
                        let edge = QuantEdge {
                            kind: QuantEdgeKind::QuantPatToQuant,
                            count,
                            percent,
                        };
                        graph.add_edge(qpn, qn, edge);
                        (
                            qpn,
                            QuantEdge {
                                kind: QuantEdgeKind::SubPatToQuantPat,
                                count,
                                percent,
                            },
                        )
                    }
                };
                // `QuantPatKind::Full`
                for (subpat, _) in data.direct_deps.iter().enumerate() {
                    let node = QuantNode {
                        quant,
                        kind: QuantNodeKind::SubPat(pat.unwrap(), subpat),
                        count,
                        percent,
                    };
                    let sn = graph.add_node(node);
                    graph.add_edge(sn, input, ek);
                    reverse_subpat.insert((qpat, subpat), sn);
                }
            }
        }

        // Add dependencies between quantifiers

        for (qpat, data) in quants.iter_enumerated() {
            if data.direct_deps.is_empty() {
                continue;
            }
            for (subpat, data) in data.direct_deps.iter().enumerate() {
                let total = data.enode.values().sum::<u32>() + data.eqs.values().sum::<u32>();
                let total = total as f64;

                let sn = reverse_subpat[&(qpat, subpat)];
                let sn_percent = graph[sn].percent;

                for (quant, &count) in data.enode.iter() {
                    let Some(quant) = quant else {
                        continue;
                    };
                    let pn = reverse_quant[quant];
                    let edge = QuantEdge {
                        kind: QuantEdgeKind::Yield,
                        count: count as usize,
                        percent: sn_percent * (count as f64 / total),
                    };
                    graph.add_edge(pn, sn, edge);
                }
                for (quants, &count) in data.eqs.iter() {
                    if quants.is_empty() {
                        continue;
                    }
                    let percent = sn_percent * ((count as f64 / quants.len() as f64) / total);
                    for quant in quants.iter() {
                        let pn = reverse_quant[quant];
                        let mut added = None;
                        for edge in graph.edges_connecting(pn, sn) {
                            if matches!(edge.weight().kind, QuantEdgeKind::YieldEq) {
                                added = Some(edge.id());
                                break;
                            }
                        }
                        if let Some(added) = added {
                            graph[added].count += count as usize;
                            graph[added].percent += percent;
                        } else {
                            let edge = QuantEdge {
                                kind: QuantEdgeKind::YieldEq,
                                count: count as usize,
                                percent,
                            };
                            graph.add_edge(pn, sn, edge);
                        }
                    }
                }
            }
        }

        Self { graph, max_percent }
    }

    pub fn dot(
        &self,
        log_info: &LogInfo,
        quants: &QuantifierAnalysis,
        mut ctxt: DisplayCtxt<'_>,
        colour_map: &QuantIdxToColourMap,
    ) -> String {
        use petgraph::dot::{Config, Dot};

        let mut top_instd = log_info.quants_iter().collect::<Vec<_>>();
        top_instd.sort_by_key(|&(q, c)| (Reverse(c), q));
        let mut top_costs = quants.quants_costs().collect::<Vec<_>>();
        top_costs.sort_by_key(|&(q, c)| (Reverse(F64Ord(c)), q));
        let mut showing_quants = FxHashSet::default();
        for ((qi, _), (qc, _)) in top_instd.into_iter().zip(top_costs) {
            showing_quants.insert(qi);
            showing_quants.insert(qc);
            if showing_quants.len() >= 10 {
                break;
            }
        }
        let filtered_graph = petgraph::visit::NodeFiltered::from_fn(&self.graph, |n| {
            showing_quants.contains(&self.graph[n].quant)
        });

        ctxt.config.font_tag = true;
        let total = self.graph.node_count();
        // Range from 0.1 to 0.5 between 1 and 100 nodes, does not go above 1.0
        let max_width = 1. - (1. / ((total + 10) as f64).log10());
        // How much should we increase everyone's width if the max percent is really
        // small? If 1 then the max width will always be the same for the
        // max_percent node (regardless of if that's 100% or 1%), if 0 then the
        // max_percent has no effect.
        const MAX_PERCENT_WEIGHT: f64 = 0.5;
        let a = 1. / MAX_PERCENT_WEIGHT.powi(4) - 1.;
        let max_percent_mul = (100. / (self.max_percent + a)) + (a / (a + 100.));
        let max_width = 40. * max_width * max_percent_mul;

        // If we want to use a different engine other than `dot`, use: overlap="false"
        // nodesep=0.5
        let dot = format!(
            "{:?}",
            Dot::with_attr_getters(
                &filtered_graph,
                &[
                    Config::EdgeNoLabel,
                    Config::NodeNoLabel,
                    Config::GraphContentOnly
                ],
                &|_, edge| edge.weight().all(
                    (),
                    (),
                    (),
                    (),
                    (),
                    max_width,
                    (),
                    max_width,
                    (&self.graph[edge.source()], &self.graph[edge.target()])
                ),
                &|_, (_, node_data)| {
                    node_data.all(ctxt, max_width, ctxt, (), (), colour_map, (), (), max_width)
                },
            )
        );
        let mut dot = dot.lines().collect::<Vec<_>>();
        let mut nodes = FxHashMap::<_, Vec<_>>::default();
        dot.retain(|&line| {
            let idx = line.find("class=\"");
            let class = idx.and_then(|idx| line[idx + 7..].split('"').next());
            if let Some(class) = class {
                nodes.entry(class).or_default().push(line);
            }
            class.is_none()
        });
        let subgraphs = nodes
            .into_iter()
            .fold(String::new(), |mut f, (quant, lines)| {
                use std::fmt::Write;
                let _ = write!(
                    f,
                    "    subgraph cluster_{quant} {{\n        style=invis\n    {}\n    }}\n",
                    lines.join("\n    ")
                );
                f
            });
        let others = dot.join("\n");
        format!("digraph {{\n{subgraphs}{others}\n}}")
    }
}

#[derive(Debug, Clone, Copy)]
pub struct QuantNode {
    pub quant: QuantIdx,
    pub kind: QuantNodeKind,
    pub count: usize,
    pub percent: f64,
}

impl QuantNode {
    /// Can this node kind have incoming `QuantEdge::Yield/YieldEq` edges?
    pub fn can_have_deps(&self) -> bool {
        use QuantNodeKind::*;
        matches!(
            self.kind,
            QuantPat(_, QuantPatKind::Single { .. }) | SubPat(..)
        )
    }
}

#[derive(Debug, Clone, Copy)]
pub enum QuantNodeKind {
    Quant(QuantKind),
    QuantPat(QuantPat, QuantPatKind),
    SubPat(PatternIdx, usize),
}

#[derive(Debug, Clone, Copy)]
pub enum QuantKind {
    /// Has multiple patterns with instantiations, or the only instantiation is
    /// through MBQI.
    Full,
    /// Has a single pattern.
    Semi(PatternIdx),
}

#[derive(Debug, Clone, Copy)]
pub enum QuantPatKind {
    /// Has multiple subpatterns or is MBQI
    Full,
    /// Has a single subpattern.
    Single { is_single_pat: bool },
}

#[derive(Debug, Clone, Copy)]
pub struct QuantEdge {
    pub kind: QuantEdgeKind,
    pub count: usize,
    pub percent: f64,
}

impl QuantEdge {
    pub fn is_eq(&self) -> bool {
        matches!(self.kind, QuantEdgeKind::YieldEq)
    }
}

#[derive(Debug, Clone, Copy)]
pub enum QuantEdgeKind {
    Yield,
    YieldEq,
    SubPatToQuantPat,
    SubPatToQuant,
    QuantPatToQuant,
}
