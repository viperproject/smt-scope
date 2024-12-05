use std::sync::Mutex;

use fxhash::FxHashMap;
use nucleo_matcher::{Config, Matcher, Utf32String};
use yew::{html, Html};

pub struct StringLookup<T> {
    matcher: Mutex<Matcher>,
    values: FxHashMap<Utf32String, T>,
}

impl<T> Default for StringLookup<T> {
    fn default() -> Self {
        Self::new()
    }
}

impl<T: PartialEq> PartialEq for StringLookup<T> {
    fn eq(&self, other: &Self) -> bool {
        self.values == other.values
    }
}

impl<T> StringLookup<T> {
    pub fn new() -> Self {
        let config = Config::DEFAULT;
        let matcher = Matcher::new(config);
        Self {
            matcher: Mutex::new(matcher),
            values: Default::default(),
        }
    }
    pub fn get_or_insert_default(&mut self, key: &str) -> &mut T
    where
        T: Default,
    {
        self.get_or_insert(key, Default::default)
    }
    pub fn get_or_insert(&mut self, key: &str, default: impl FnOnce() -> T) -> &mut T {
        self.values
            .entry(Utf32String::from(key))
            .or_insert_with(default)
    }

    pub fn get_fuzzy<'a>(&'a self, needle: &str) -> Matches<'a, T> {
        let original_needle = needle;
        let needle = Utf32String::from(needle.to_lowercase());
        let needle = needle.slice(..);
        let mut indices = Vec::new();
        let mut matcher = self.matcher.lock().unwrap();
        let matches = self
            .values
            .iter()
            .flat_map(|(k, v)| {
                let k_slice = k.slice(..);
                matcher
                    .fuzzy_indices(k_slice, needle, &mut indices)
                    .map(|mut score| {
                        // Penalise the score where the characters don't exactly
                        // match (e.g. due to ascii normalisation or lowercasing).
                        // This is not ideal since we might not get the highest
                        // scoring match.
                        for (idx, char) in original_needle.char_indices() {
                            let idx = indices[indices.len() - needle.len() + idx];
                            if k_slice.get(idx) != char {
                                score = score.saturating_sub(1);
                            }
                        }
                        (score, k, v)
                    })
            })
            .collect();
        Matches { indices, matches }
    }
}

#[derive(Debug)]
pub struct HighlightedString<'a>(pub &'a str, pub &'a [u32]);
impl HighlightedString<'_> {
    pub fn into_html(self) -> Vec<Html> {
        let mut result = Vec::new();
        let mut last_start = 0;
        let mut next = 0;
        for &idx in self.1 {
            let idx = idx as usize;
            if idx != next {
                if last_start != next {
                    result.push(html! {<b>{&self.0[last_start..next]}</b>});
                }
                result.push(html! {{&self.0[next..idx]}});
                last_start = idx;
            }
            next = idx + 1;
        }
        result.push(html! {<b>{&self.0[last_start..next]}</b>});
        result.push(html! {{&self.0[next..]}});
        result
    }
}

#[derive(Debug)]
pub struct Matches<'a, T> {
    pub indices: Vec<u32>,
    pub matches: Vec<(u16, &'a Utf32String, &'a T)>,
}
