use smt_log_parser::{
    analysis::{raw::NodeKind, InstGraph, RawNodeIndex},
    items::{ENodeIdx, EqTransIdx, QuantIdx},
    FxHashMap, IString, Z3Parser,
};
use yew::html;

use crate::{
    screen::{
        extra::{OmniboxSearch, OmniboxSearchCategory, OmniboxSearchEntry},
        graph::{GraphM, SelectionM},
        Scope,
    },
    utils::colouring::QuantIdxToColourMap,
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
        fn handle_term(
            parser: &Z3Parser,
            terms: &mut FxHashMap<(IString, usize), EntryCounter>,
            eidx: ENodeIdx,
            idx: RawNodeIndex,
            visible: bool,
        ) {
            let tidx = parser[eidx].owner;
            // TODO: display meaning in search?
            if let Some(_meaning) = parser.meaning(tidx) {}
            let term = &parser[parser[eidx].owner];
            let Some(name) = term.kind.app_name() else {
                return;
            };
            terms
                .entry((name, term.child_ids.len()))
                .or_default()
                .insert(idx, visible);
        }
        fn handle_eq(
            parser: &Z3Parser,
            terms: &mut FxHashMap<(IString, usize), EntryCounter>,
            eq: EqTransIdx,
            idx: RawNodeIndex,
            visible: bool,
        ) {
            let (from, to) = parser.from_to(eq);
            handle_term(parser, terms, from, idx, visible);
            handle_term(parser, terms, to, idx, visible);
        }

        for idx in graph.subgraphs.topo_node_indices() {
            let node = &graph.raw[idx];
            if node.disabled() {
                continue;
            }
            let visible = node.visible();

            match *node.kind() {
                NodeKind::Instantiation(iidx) => {
                    let inst = &parser[iidx];
                    let match_ = &parser[inst.match_];
                    if let Some(qidx) = match_.kind.quant_idx() {
                        quantifiers.entry(qidx).or_default().insert(idx, visible);
                    }
                    for &yt in inst.yields_terms.iter() {
                        handle_term(parser, &mut terms, yt, idx, visible);
                    }
                    for blame in match_.trigger_matches() {
                        handle_term(parser, &mut terms, blame.enode(), idx, visible);
                        for eq in blame.equalities() {
                            handle_eq(parser, &mut terms, eq, idx, visible);
                        }
                    }
                }
                NodeKind::ENode(eidx) => handle_term(parser, &mut terms, eidx, idx, visible),
                NodeKind::GivenEquality(eq, _) => {
                    let eq = &parser[eq];
                    handle_term(parser, &mut terms, eq.from(), idx, visible);
                    handle_term(parser, &mut terms, eq.to(), idx, visible);
                }
                NodeKind::TransEquality(eq) => {
                    handle_eq(parser, &mut terms, eq, idx, visible);
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
                    <div class="node-colour" style={format!("background-color: hsl({hue}, 79%, 76%)")}></div>
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
        vec![quantifiers, terms]
    }
}

impl OmniboxSearchEntry {
    fn order(&self) -> impl Ord + '_ {
        (usize::MAX - self.select_from, self.search_text.as_str())
    }
}
