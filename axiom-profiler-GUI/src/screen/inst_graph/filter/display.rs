use std::fmt::Display;

use petgraph::Direction;
use smt_log_parser::analysis::{raw::NodeKind, RawNodeIndex};

use super::{Disabler, Filter};

impl Filter {
    pub fn icon(&self) -> &'static str {
        match self {
            Filter::MaxNodeIdx(_) => "tag",
            Filter::MinNodeIdx(_) => "tag",
            Filter::IgnoreTheorySolving => "calculate",
            Filter::IgnoreQuantifier(_) => "do_not_disturb",
            Filter::IgnoreAllButQuantifier(_) => "disabled_visible",
            Filter::MaxInsts(_) => "attach_money",
            Filter::MaxBranching(_) => "panorama_horizontal",
            Filter::ShowNeighbours(_, _) => "supervisor_account",
            Filter::VisitSourceTree(_, _) => "arrow_upward",
            Filter::VisitSubTreeWithRoot(_, _) => "arrow_downward",
            Filter::MaxDepth(_) => "link",
            Filter::ShowLongestPath(_) => "route",
            Filter::ShowNamedQuantifier(_) => "fingerprint",
            Filter::SelectNthMatchingLoop(_) => "repeat_one",
            Filter::ShowMatchingLoopSubgraph => "repeat",
        }
    }
    pub fn short_text(&self, d: impl Fn(RawNodeIndex) -> NodeKind) -> String {
        match self {
            Self::MaxNodeIdx(node_idx) => format!("Hide all ≥ |{node_idx}|"),
            Self::MinNodeIdx(node_idx) => format!("Hide all < |{node_idx}|"),
            Self::IgnoreTheorySolving => "Hide theory solving".to_string(),
            Self::IgnoreQuantifier(None) => "Hide no quant".to_string(),
            Self::IgnoreQuantifier(Some(qidx)) => {
                format!("Hide quant |{qidx}|")
            }
            Self::IgnoreAllButQuantifier(None) => "Hide all quant".to_string(),
            Self::IgnoreAllButQuantifier(Some(qidx)) => {
                format!("Hide all but quant ${qidx:?}$")
            }
            Self::MaxInsts(max) => format!("Hide all but |{max}| expensive"),
            Self::MaxBranching(max) => {
                format!("Hide all but |{max}| high degree")
            }
            &Self::VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!("Show descendants of ${}$", d(nidx)),
                false => format!("Hide descendants of ${}$", d(nidx)),
            },
            &Self::VisitSourceTree(nidx, retain) => match retain {
                true => format!("Show ancestors of ${}$", d(nidx)),
                false => format!("Hide ancestors of ${}$", d(nidx)),
            },
            &Self::ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => format!("Show parents of ${}$", d(nidx)),
                Direction::Outgoing => format!("Show children of ${}$", d(nidx)),
            },
            Self::MaxDepth(depth) => format!("Hide all > depth |{depth}|"),
            &Self::ShowLongestPath(node) => {
                format!("Show longest path w/ ${}$", d(node))
            }
            Self::ShowNamedQuantifier(name) => {
                format!("Show quant \"{name}\"")
            }
            Self::SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    n if (n / 10) % 10 == 1 => "th",
                    n if n % 10 == 0 => "st",
                    n if n % 10 == 1 => "nd",
                    n if n % 10 == 2 => "rd",
                    _ => "th",
                };
                format!("Show only |{}{ordinal}| matching loop", n + 1)
            }
            Self::ShowMatchingLoopSubgraph => "S only likely matching loops".to_string(),
        }
    }
    pub fn long_text(&self, d: impl Fn(RawNodeIndex) -> NodeKind, applied: bool) -> String {
        let (hide, show) = if applied {
            ("Hiding", "Showing")
        } else {
            ("Hide", "Show")
        };
        match self {
            Self::MaxNodeIdx(node_idx) => {
                format!("{hide} all nodes {} and above", display(node_idx, applied))
            }
            Self::MinNodeIdx(node_idx) => {
                format!("{hide} all nodes below {}", display(node_idx, applied))
            }
            Self::IgnoreTheorySolving => format!("{hide} all nodes related to theory solving"),
            Self::IgnoreQuantifier(None) => {
                format!("{hide} all nodes without an associated quantifier")
            }
            Self::IgnoreQuantifier(Some(qidx)) => {
                format!("{hide} all nodes of quantifier {}", display(qidx, applied))
            }
            Self::IgnoreAllButQuantifier(None) => {
                format!("{hide} all nodes with an associated quantifier")
            }
            Self::IgnoreAllButQuantifier(Some(qidx)) => {
                format!(
                    "{hide} all nodes not associated to quantifier {}",
                    display(qidx, applied)
                )
            }
            Self::MaxInsts(max) => format!(
                "{hide} all but the {} most expensive nodes",
                display(max, applied)
            ),
            Self::MaxBranching(max) => {
                format!(
                    "{hide} all but {} nodes with the most children",
                    display(max, applied)
                )
            }
            &Self::VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its descendants",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its descendants",
                    display(d(nidx), applied)
                ),
            },
            &Self::VisitSourceTree(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
            },
            &Self::ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => {
                    format!("{show} the parents of node {}", display(d(nidx), applied))
                }
                Direction::Outgoing => {
                    format!("{show} the children of node {}", display(d(nidx), applied))
                }
            },
            Self::MaxDepth(depth) => {
                format!("{hide} all nodes above depth {}", display(depth, applied))
            }
            &Self::ShowLongestPath(node) => {
                format!(
                    "{show} only nodes on the longest path through node {}",
                    display(d(node), applied)
                )
            }
            Self::ShowNamedQuantifier(name) => {
                format!("{show} nodes of quantifier \"{}\"", display(name, applied))
            }
            Self::SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    0 => return "{show} only nodes in longest matching loop".to_string(),
                    n if (n / 10) % 10 == 1 => "th",
                    n if n % 10 == 0 => "st",
                    n if n % 10 == 1 => "nd",
                    n if n % 10 == 2 => "rd",
                    _ => "th",
                };
                format!(
                    "{show} only nodes in {}{ordinal} longest matching loop",
                    display(n + 1, applied)
                )
            }
            Self::ShowMatchingLoopSubgraph => {
                format!("{show} only nodes in any potential matching loop")
            }
        }
    }
}

impl Disabler {
    pub fn description(&self) -> &'static str {
        match self {
            Disabler::Smart => "trivial nodes",
            Disabler::ENodes => "yield terms",
            Disabler::GivenEqualities => "yield equalities",
            Disabler::AllEqualities => "all equalities",
        }
    }
    pub fn icon(&self) -> &'static str {
        match self {
            Disabler::Smart => "low_priority",
            Disabler::ENodes => "functions",
            Disabler::GivenEqualities => "compare_arrows",
            Disabler::AllEqualities => "compare_arrows",
        }
    }
}

fn display<T: Display>(t: T, applied: bool) -> String {
    if applied {
        t.to_string()
    } else {
        "_".to_string()
    }
}
