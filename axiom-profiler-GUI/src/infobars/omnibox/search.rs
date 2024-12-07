use std::cmp::Reverse;

use nucleo_matcher::Utf32String;
use yew::{html, Callback, Html, MouseEvent, NodeRef};

use crate::{
    screen::extra,
    utils::lookup::{HighlightedString, Matches, StringLookup},
};

pub type OmniboxSearch = StringLookup<Vec<(usize, usize)>>;

#[derive(Debug, Clone, Copy)]
pub struct PickedSuggestion {
    /// The index of the result of the search (the index is flattened)
    pub ridx: usize,
    /// The index of the choice within the result that we have currently picked.
    pub choice_idx: Option<usize>,
}

impl PickedSuggestion {
    pub fn index<'a>(
        self,
        results: &SuggestionResults,
        omnibox: &'a extra::OmniboxSearch,
    ) -> &'a extra::OmniboxSearchEntry {
        results.index(omnibox, self.ridx).unwrap()
    }
}

#[derive(Debug, PartialEq)]
pub struct SuggestionResults {
    pub query: Utf32String,
    pub indices: Vec<u32>,
    pub categories: Vec<SuggestionCategory>,
    pub exact_matches: Vec<usize>,
}

impl SuggestionResults {
    pub fn new(query: String, matches: Matches<'_, Vec<(usize, usize)>>) -> Self {
        let query = Utf32String::from(query);

        let mut categories: Vec<_> = Vec::new();
        for (midx, (score, matched, values)) in matches.matches.into_iter().enumerate() {
            let exact = matched == &query;

            for &(cidx, eidx) in values {
                while categories.len() <= cidx {
                    categories.push(SuggestionCategory::new(categories.len()));
                }
                let c = &mut categories[cidx];
                c.entries.push(SearchResult {
                    exact,
                    score,
                    eidx,
                    midx,
                });
            }
        }

        // Sort
        for c in &mut categories {
            c.entries.sort_by_key(|s| s.order(c.cidx));
        }
        categories.sort_by_key(|c| c.entries.first().map(|s| s.order(c.cidx)).ok_or(()));

        // Trim empty
        while categories.last().is_some_and(|c| c.entries.is_empty()) {
            categories.pop();
        }

        // Init offset
        let mut offset = 0;
        let mut exact_matches = Vec::new();
        for c in categories.iter_mut() {
            c.offset = offset;
            offset += c.entries.len();

            let ems = c
                .entries
                .iter()
                .take_while(|e| e.exact)
                .enumerate()
                .map(|(i, _e)| offset + i);
            exact_matches.extend(ems);
        }

        Self {
            query,
            indices: matches.indices,
            categories,
            exact_matches,
        }
    }

    pub fn len(&self) -> usize {
        self.categories
            .last()
            .map_or(0, |c| c.offset + c.entries.len())
    }

    pub fn exact_match(&self) -> Option<PickedSuggestion> {
        match *self.exact_matches.as_slice() {
            [] => None,
            [ridx] => Some(PickedSuggestion {
                ridx,
                choice_idx: None,
            }),
            _ => None,
        }
    }

    fn index<'a>(
        &self,
        omnibox: &'a extra::OmniboxSearch,
        ridx: usize,
    ) -> Option<&'a extra::OmniboxSearchEntry> {
        let mut n = ridx;
        for category in &self.categories {
            let Some(nn) = n.checked_sub(category.entries.len()) else {
                let eidx = category.entries[n].eidx;
                return Some(&omnibox[category.cidx].entries[eidx]);
            };
            n = nn;
        }
        None
    }

    fn indices(&self, entry: &SearchResult) -> &[u32] {
        let start = entry.midx * self.query.len();
        &self.indices[start..start + self.query.len()]
    }

    pub fn as_html<'a, F: Fn(usize) -> Callback<MouseEvent> + 'a>(
        &'a self,
        omnibox: &'a extra::OmniboxSearch,
        highlighted: usize,
        scroll_into_view: &'a NodeRef,
        onmousedown: &'a F,
    ) -> impl Iterator<Item = Html> + 'a {
        self.categories.iter().map(move |c| {
            let category = &omnibox[c.cidx];
            let entries = c.entries.iter().enumerate().map(|(i, e)| {
                let entry = &category.entries[e.eidx];
                let ridx = c.offset + i;
                let highlighted = highlighted == ridx;
                let class = if highlighted {
                    "omnibox-highlighted"
                } else {
                    "can-hover"
                };
                let scroll_into_view = highlighted
                    .then(|| scroll_into_view.clone())
                    .unwrap_or_default();
                let highlighted_name =
                    HighlightedString(&entry.search_text, self.indices(e)).into_html();
                let pre_text = Some(&entry.pre_text).filter(|s| !s.is_empty()).map(|s| {
                    html! {
                        <span class="option-arguments">{s}</span>
                    }
                });
                let post_text = Some(&entry.post_text).filter(|s| !s.is_empty()).map(|s| {
                    html! {
                        <span class="option-arguments">{s}</span>
                    }
                });
                html! {
                    <li ref={scroll_into_view} {class} onmousedown={onmousedown(ridx)}>
                        <span class="option-title">{pre_text}{highlighted_name}{post_text}</span>
                        // Uncomment to see fuzzy matching score: {" ("}{suggestion.score.to_string()}{")"}</span>
                        {entry.info.clone()}
                    </li>
                }
            });
            html! {
                <div>
                    <li class="group-header">
                        <span class="option-title">{&category.name}</span>
                    </li>
                    {for entries}
                </div>
            }
        })
    }
}

#[derive(Debug, PartialEq)]
pub struct SuggestionCategory {
    pub cidx: usize,
    /// The sum of the lengths of entries before
    pub offset: usize,
    entries: Vec<SearchResult>,
}

impl SuggestionCategory {
    pub fn new(cidx: usize) -> Self {
        Self {
            cidx,
            offset: 0,
            entries: Vec::new(),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
struct SearchResult {
    //// Whether the match was exact
    exact: bool,
    /// How good the match was, used for sorting
    score: u16,
    /// The index of the element within the category
    eidx: usize,
    /// The index of the matched string, used to retrieve highlighting indices
    /// later on.
    midx: usize,
}

impl SearchResult {
    pub fn order(self, cidx: usize) -> impl Ord {
        (Reverse(self.exact), Reverse(self.score), cidx, self.eidx)
    }
}
