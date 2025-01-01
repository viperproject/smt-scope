use std::cmp::Reverse;

use smt_log_parser::{
    analysis::{raw::NodeKind, InstGraph, RawNodeIndex},
    items::{ENodeIdx, EqTransIdx, QuantIdx, TermIdx},
    FxHashMap, IString, Z3Parser,
};
use yew::html;

use crate::{
    screen::{
        extra::{OmniboxSearch, OmniboxSearchCategory, OmniboxSearchEntry},
        inst_graph::{GraphM, SelectionM},
        Scope,
    },
    utils::colouring::{QuantColourBox, QuantIdxToColourMap},
};

use super::Graph;

#[derive(Default)]
struct EntryCounter {
    last: Option<RawNodeIndex>,
    visible: Vec<RawNodeIndex>,
    hidden: usize,
}

impl EntryCounter {
    fn insert(&mut self, idx: RawNodeIndex, visible: bool) {
        if self.last.is_some_and(|last| last == idx) {
            return;
        }
        self.last = Some(idx);
        if visible {
            self.visible.push(idx);
        } else {
            self.hidden += 1;
        }
    }
    fn total(&self) -> usize {
        self.visible.len() + self.hidden
    }
}

impl Graph {
    pub fn omnibox_search(
        link: &Scope<Self>,
        parser: &Z3Parser,
        graph: &InstGraph,
        colour_map: &QuantIdxToColourMap,
    ) -> OmniboxSearch {
        let mut quantifiers = FxHashMap::<QuantIdx, EntryCounter>::default();
        let mut terms = FxHashMap::<(IString, usize), EntryCounter>::default();
        fn handle_term<const EXPECT_APP: bool>(
            parser: &Z3Parser,
            terms: &mut FxHashMap<(IString, usize), EntryCounter>,
            tidx: TermIdx,
            idx: RawNodeIndex,
            visible: bool,
        ) {
            // TODO: display meaning in search?
            if let Some(_meaning) = parser.meaning(tidx) {}
            let term = &parser[tidx];
            let Some(name) = term.kind.app_name() else {
                if EXPECT_APP {
                    log::error!("ENode without name: {:?}", term);
                }
                return;
            };
            terms
                .entry((name, term.child_ids.len()))
                .or_default()
                .insert(idx, visible);
        }
        fn handle_eq(parser: &Z3Parser, eq: EqTransIdx, mut handle_enode: impl FnMut(ENodeIdx)) {
            let (from, to) = parser.from_to(eq);
            handle_enode(from);
            handle_enode(to);
        }

        for idx in graph.subgraphs.topo_node_indices() {
            let node = &graph.raw[idx];
            if node.disabled() {
                continue;
            }
            let visible = node.visible();
            let mut handle_enode = |enode: ENodeIdx| {
                handle_term::<true>(parser, &mut terms, parser[enode].owner, idx, visible)
            };

            match *node.kind() {
                NodeKind::Instantiation(iidx) => {
                    let inst = &parser[iidx];
                    let match_ = &parser[inst.match_];
                    if let Some(qidx) = match_.kind.quant_idx() {
                        quantifiers.entry(qidx).or_default().insert(idx, visible);
                    }
                    for &yt in inst.yields_terms.iter() {
                        handle_enode(yt);
                    }
                    for blame in match_.pattern_matches() {
                        handle_enode(blame.enode());
                        for eq in blame.equalities() {
                            handle_eq(parser, eq, &mut handle_enode);
                        }
                    }
                }
                NodeKind::ENode(eidx) => handle_enode(eidx),
                NodeKind::GivenEquality(eq, _) => {
                    let eq = &parser[eq];
                    handle_enode(eq.from());
                    handle_enode(eq.to());
                }
                NodeKind::TransEquality(eq) => {
                    handle_eq(parser, eq, handle_enode);
                }
                NodeKind::Proof(pidx) => {
                    handle_term::<false>(parser, &mut terms, parser[pidx].result, idx, visible)
                }
                NodeKind::Cdcl(cdcl) => {
                    for assign in parser[cdcl].get_assignments() {
                        handle_term::<false>(parser, &mut terms, assign.literal, idx, visible);
                    }
                }
            }
        }

        let mut quantifiers = quantifiers.into_iter().filter_map(|(qidx, counter)| {
            let search_text = parser[qidx].kind.name(&parser.strings)?;
            let hue = colour_map.get_rbg_hue(Some(qidx));
            Some(OmniboxSearchEntry {
                pre_text: String::new(),
                search_text: search_text.to_string(),
                post_text: String::new(),
                info: html! {<>
                    <QuantColourBox margin_right={true} {hue} />
                    {counter.visible.len().to_string()}{" shown / "}{counter.total().to_string()}
                </>},
                select_from: counter.visible.len(),
                select: link.callback(move |idx| GraphM::Selection(SelectionM::SelectAndScrollTo(counter.visible[idx]))),
            })
        }).collect::<Vec<_>>();
        quantifiers.sort_by(|a, b| a.order().cmp(&b.order()));
        let quantifiers = OmniboxSearchCategory {
            name: "Quantifiers".to_string(),
            entries: quantifiers,
        };

        let mut terms = terms.into_iter().map(|((name, children), counter)| {
            let search_text = parser[name].to_string();
            let post_text = (0..children).map(|_| " _").chain([")"]).collect();
            OmniboxSearchEntry {
                pre_text: "(".to_string(),
                search_text,
                post_text,
                info: html! {<>
                    {counter.visible.len().to_string()}{" shown / "}{counter.total().to_string()}
                </>},
                select_from: counter.visible.len(),
                select: link.callback(move |idx| GraphM::Selection(SelectionM::SelectAndScrollTo(counter.visible[idx]))),
            }
        }).collect::<Vec<_>>();
        terms.sort_by(|a, b| a.order().cmp(&b.order()));
        let terms = OmniboxSearchCategory {
            name: "Terms".to_string(),
            entries: terms,
        };
        if quantifiers
            .entries
            .first()
            .is_some_and(|f| f.select_from > 0)
        {
            vec![quantifiers, terms]
        } else {
            vec![terms, quantifiers]
        }
    }
}

impl OmniboxSearchEntry {
    fn order(&self) -> impl Ord + '_ {
        (Reverse(self.select_from), self.search_text.as_str())
    }
}
