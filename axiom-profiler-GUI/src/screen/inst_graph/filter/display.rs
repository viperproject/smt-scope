use std::fmt::Display;

use petgraph::Direction;
use smt_log_parser::analysis::{raw::NodeKind, RawNodeIndex};

use super::{Disabler, Filter};

impl Filter {
    pub fn icon(&self) -> &'static str {
        use Filter::*;
        match self {
            MaxNodeIdx(_) => "tag",
            MinNodeIdx(_) => "tag",
            IgnoreTheorySolving => "calculate",
            IgnoreQuantifier(_) => "do_not_disturb",
            IgnoreAllButQuantifier(_) => "disabled_visible",
            AllButExpensive(_) => "attach_money",
            MaxBranching(_) => "panorama_horizontal",
            ShowNeighbours(_, _) => "supervisor_account",
            VisitSourceTree(_, _) => "arrow_upward",
            VisitSubTreeWithRoot(_, _) => "arrow_downward",
            MaxDepth(_) => "link",
            ShowLongestPath(_) => "route",
            ShowNamedQuantifier(_) => "fingerprint",
            SelectNthMatchingLoop(_) => "repeat_one",
            ShowMatchingLoopSubgraph => "repeat",
            HideUnitNodes => "mode_standby",
            LimitProofNodes(_) => "functions",
            HideNonProof => "center_focus_strong",
        }
    }
    pub fn short_text(&self, d: impl Fn(RawNodeIndex) -> Option<NodeKind>) -> String {
        let d = move |idx| d(idx).map(|k| k.to_string()).unwrap_or_else(|| "?".to_string());
        use Filter::*;
        match self {
            MaxNodeIdx(node_idx) => format!("Hide all ≥ |{node_idx}|"),
            MinNodeIdx(node_idx) => format!("Hide all < |{node_idx}|"),
            IgnoreTheorySolving => "Hide theory solving".to_string(),
            IgnoreQuantifier(None) => "Hide no quant".to_string(),
            IgnoreQuantifier(Some(qidx)) => {
                format!("Hide quant |{qidx}|")
            }
            IgnoreAllButQuantifier(None) => "Hide all quant".to_string(),
            IgnoreAllButQuantifier(Some(qidx)) => {
                format!("Hide all but quant ${qidx:?}$")
            }
            AllButExpensive(max) => format!("Hide all but |{max}| expensive"),
            MaxBranching(max) => {
                format!("Hide all but |{max}| high degree")
            }
            &VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!("Show descendants of ${}$", d(nidx)),
                false => format!("Hide descendants of ${}$", d(nidx)),
            },
            &VisitSourceTree(nidx, retain) => match retain {
                true => format!("Show ancestors of ${}$", d(nidx)),
                false => format!("Hide ancestors of ${}$", d(nidx)),
            },
            &ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => format!("Show parents of ${}$", d(nidx)),
                Direction::Outgoing => format!("Show children of ${}$", d(nidx)),
            },
            MaxDepth(depth) => format!("Hide all > depth |{depth}|"),
            &ShowLongestPath(node) => {
                format!("Show longest path w/ ${}$", d(node))
            }
            ShowNamedQuantifier(name) => {
                format!("Show quant \"{name}\"")
            }
            SelectNthMatchingLoop(n) => {
                let ordinal = match n {
                    n if (n / 10) % 10 == 1 => "th",
                    n if n % 10 == 0 => "st",
                    n if n % 10 == 1 => "nd",
                    n if n % 10 == 2 => "rd",
                    _ => "th",
                };
                format!("Show only |{}{ordinal}| matching loop", n + 1)
            }
            ShowMatchingLoopSubgraph => "S only likely matching loops".to_string(),
            HideUnitNodes => "Hide unit nodes".to_string(),
            LimitProofNodes(max) => format!("Hide all but |{max}| proofs"),
            HideNonProof => "Hide non-proof nodes".to_string(),
        }
    }
    pub fn long_text(&self, d: impl Fn(RawNodeIndex) -> Option<NodeKind>, applied: bool) -> String {
        let d = move |idx| d(idx).map(|k| k.to_string()).unwrap_or_else(|| "?".to_string());
        let (hide, show) = if applied {
            ("Hiding", "Showing")
        } else {
            ("Hide", "Show")
        };
        use Filter::*;
        match self {
            MaxNodeIdx(node_idx) => {
                format!("{hide} all nodes {} and above", display(node_idx, applied))
            }
            MinNodeIdx(node_idx) => {
                format!("{hide} all nodes below {}", display(node_idx, applied))
            }
            IgnoreTheorySolving => format!("{hide} all nodes related to theory solving"),
            IgnoreQuantifier(None) => {
                format!("{hide} all nodes without an associated quantifier")
            }
            IgnoreQuantifier(Some(qidx)) => {
                format!("{hide} all nodes of quantifier {}", display(qidx, applied))
            }
            IgnoreAllButQuantifier(None) => {
                format!("{hide} all nodes with an associated quantifier")
            }
            IgnoreAllButQuantifier(Some(qidx)) => {
                format!(
                    "{hide} all nodes not associated to quantifier {}",
                    display(qidx, applied)
                )
            }
            AllButExpensive(max) => format!(
                "{hide} all but the {} most expensive nodes (ignoring proofs)",
                display(max, applied)
            ),
            MaxBranching(max) => {
                format!(
                    "{hide} all but {} nodes with the most children",
                    display(max, applied)
                )
            }
            &VisitSubTreeWithRoot(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its descendants",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its descendants",
                    display(d(nidx), applied)
                ),
            },
            &VisitSourceTree(nidx, retain) => match retain {
                true => format!(
                    "{show} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
                false => format!(
                    "{hide} node {} and its ancestors",
                    display(d(nidx), applied)
                ),
            },
            &ShowNeighbours(nidx, direction) => match direction {
                Direction::Incoming => {
                    format!("{show} the parents of node {}", display(d(nidx), applied))
                }
                Direction::Outgoing => {
                    format!("{show} the children of node {}", display(d(nidx), applied))
                }
            },
            MaxDepth(depth) => {
                format!("{hide} all nodes above depth {}", display(depth, applied))
            }
            &ShowLongestPath(node) => {
                format!(
                    "{show} only nodes on the longest path through node {}",
                    display(d(node), applied)
                )
            }
            ShowNamedQuantifier(name) => {
                format!("{show} nodes of quantifier \"{}\"", display(name, applied))
            }
            SelectNthMatchingLoop(n) => {
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
            ShowMatchingLoopSubgraph => {
                format!("{show} only nodes in any potential matching loop")
            }
            HideUnitNodes => {
                format!("{hide} all nodes without parents or children, except instantiation nodes and some proof nodes")
            }
            LimitProofNodes(max) => {
                format!("{hide} all but {} proof steps", display(max, applied))
            }
            HideNonProof => {
                format!("{hide} all non-proof nodes (instantiation nodes which are immediate parents cannot be hidden)")
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
            Disabler::NonProof => "non-proof nodes",
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
