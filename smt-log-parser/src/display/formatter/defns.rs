use std::{borrow::Cow, collections::hash_map::Entry};

use crate::NonMaxU32;

use super::{util::HashMapSerde, ConversionError, DeParseTrait, TdcError, TermSig};

pub const CONTROL_CHARACTER: char = '$';
pub const SEPARATOR_CHARACTER: char = '|';
pub const DEFAULT_BIND_POWER: BindPower = BindPower::MAX / 2;

#[derive(Default, Debug, Clone)]
pub struct TermDisplayContext {
    pub(super) inner: TermDisplayContextInner,
    regex_set: regex::RegexSet,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Default, Debug, Clone, PartialEq, Eq)]
pub struct TermDisplayContextInner {
    string_children_matchers: HashMapSerde<(Cow<'static, str>, NonMaxU32), SameMatcherKind>,
    string_matchers: HashMapSerde<String, TermDisplay>,
    regex_children_matchers: SameMatcherKind,
    regex_matchers: SameMatcherKind,
    wildcard_matchers: HashMapSerde<NonMaxU32, SameMatcherKind>,
    fallback: Option<TermDisplay>,
}

impl FromIterator<TermDisplay> for Result<TermDisplayContext, TdcError> {
    fn from_iter<T: IntoIterator<Item = TermDisplay>>(iter: T) -> Self {
        let mut this = TermDisplayContext::default();
        this.append(iter.into_iter())?;
        Ok(this)
    }
}

impl TermDisplayContext {
    pub fn is_empty(&self) -> bool {
        self.string_children_matchers.is_empty()
            && self.string_matchers.is_empty()
            && self.regex_children_matchers.0.is_empty()
            && self.regex_matchers.0.is_empty()
            && self.wildcard_matchers.is_empty()
            && self.fallback.is_none()
    }
    pub fn all(&self) -> impl Iterator<Item = &TermDisplay> {
        self.string_children_matchers
            .values()
            .flat_map(|v| v.0.iter())
            .chain(self.string_matchers.values())
            .chain(self.regex_children_matchers.0.iter())
            .chain(self.regex_matchers.0.iter())
            .chain(self.wildcard_matchers.values().flat_map(|v| v.0.iter()))
    }

    pub fn fallback(&self) -> Option<&TermDisplay> {
        self.fallback.as_ref()
    }
    pub fn set_fallback(&mut self, fallback: Option<TermDisplay>) {
        assert!(!fallback.as_ref().is_some_and(|f| !f.matcher.is_fallback()));
        self.fallback = fallback;
    }

    /// Appends multiple `TermDisplay` at once. This is more efficient than
    /// repeatedly calling `push` as matching set for all regexes is calculated
    /// only once.
    pub fn append(&mut self, terms: impl Iterator<Item = TermDisplay>) -> Result<(), TdcError> {
        let mut added_regex_matcher = false;
        for term in terms {
            added_regex_matcher |= self.push_inner(term)?;
        }
        if added_regex_matcher {
            self.calculate_regex_set();
        }
        Ok(())
    }

    pub fn push(&mut self, term: TermDisplay) -> Result<(), TdcError> {
        if self.push_inner(term)? {
            self.calculate_regex_set();
        }
        Ok(())
    }

    pub fn remove(&mut self, matcher: &Matcher) -> Option<TermDisplay> {
        match &matcher.kind {
            MatcherKind::Exact(s) => {
                if let Some(children) = matcher.children() {
                    // SAFETY: though the lifetime is 'static in terms of the
                    // compiler, the actual lifetime will end at the end of the
                    // block.
                    let s = unsafe { &*(s.as_str() as *const _) };
                    let Entry::Occupied(mut o) = self
                        .string_children_matchers
                        .entry((Cow::Borrowed(s), children))
                    else {
                        return None;
                    };
                    let removed = o.get_mut().remove(matcher)?;
                    if o.get().0.is_empty() {
                        o.remove();
                    }
                    Some(removed)
                } else {
                    self.string_matchers.remove(s)
                }
            }
            MatcherKind::Regex(..) => {
                let removed = if matcher.children().is_some() {
                    self.regex_children_matchers.remove(matcher)?
                } else {
                    self.regex_matchers.remove(matcher)?
                };
                self.calculate_regex_set();
                Some(removed)
            }
            MatcherKind::Wildcard => {
                if let Some(children) = matcher.children() {
                    let Entry::Occupied(mut o) = self.wildcard_matchers.entry(children) else {
                        return None;
                    };
                    let removed = o.get_mut().remove(matcher)?;
                    if o.get().0.is_empty() {
                        o.remove();
                    }
                    Some(removed)
                } else {
                    let fb = self.fallback.as_ref()?;
                    if fb.matcher == *matcher {
                        self.fallback.take()
                    } else {
                        None
                    }
                }
            }
        }
    }

    /// Extends this context with another higher priority one. If there are any
    /// conflicts, we drop the conflicting entries from the `self` context!
    pub fn extend(&mut self, other: &Self) {
        for (k, v) in other.string_children_matchers.iter() {
            self.string_children_matchers
                .entry(k.clone())
                .or_default()
                .extend(v);
        }
        for (k, v) in other.string_matchers.iter() {
            self.string_matchers.insert(k.clone(), v.clone());
        }
        let skip_recalculate =
            other.regex_children_matchers.0.is_empty() && other.regex_matchers.0.is_empty();
        if !skip_recalculate {
            self.regex_children_matchers
                .extend(&other.regex_children_matchers);
            self.regex_matchers.extend(&other.regex_matchers);
            self.calculate_regex_set();
        }
        for (k, v) in other.wildcard_matchers.iter() {
            self.wildcard_matchers.entry(*k).or_default().extend(v);
        }
        if let Some(fallback) = &other.fallback {
            self.fallback = Some(fallback.clone());
        }
    }

    /// Returns the formatter for the given string, defaulting to the fallback
    /// if none match. See [`Self::match_str_opt`] for more details.
    pub fn match_term<'a, 'b>(&'b self, term: TermSig<'a>) -> MatchResult<'a, 'b> {
        self.match_term_opt(term).unwrap_or_else(|| MatchResult {
            haystack: term.name(),
            captures: None,
            formatter: Formatter::s_expression(term.children()),
        })
    }

    /// Returns the formatter for the given string, if one exists. If multiple
    /// matchers match the string, then the first one is returned. The order is
    /// determined as `Matcher::Exact` first and then the first `Matcher::Regex`
    /// in the order provided when constructing `self`.
    pub fn match_term_opt<'a, 'b>(&'b self, term: TermSig<'a>) -> Option<MatchResult<'a, 'b>> {
        if let Some(mr) = self.match_term_string_children(term) {
            return Some(mr);
        }
        if let Some(mr) = self.match_term_string(term) {
            return Some(mr);
        }
        if let Some(mr) = self.match_term_regex(term) {
            return Some(mr);
        }
        if let Some(mr) = self.match_term_wildcard(term) {
            return Some(mr);
        }
        self.fallback
            .as_ref()
            .map(|td| td.as_match_no_capture(term.name()))
    }

    fn match_term_string_children<'a, 'b>(
        &'b self,
        term: TermSig<'a>,
    ) -> Option<MatchResult<'a, 'b>> {
        // SAFETY: though the lifetime is 'static in terms of the
        // compiler, the actual lifetime will end at the end of the
        // block.
        let static_key = unsafe { &*(term.name() as *const _) };
        let children = NonMaxU32::new(term.children() as u32).unwrap();
        let tds = self
            .string_children_matchers
            .get(&(Cow::Borrowed(static_key), children))?;
        SameMatcherKind::match_term_opt(tds.0.iter(), term)
    }

    fn match_term_string<'a, 'b>(&'b self, term: TermSig<'a>) -> Option<MatchResult<'a, 'b>> {
        let td = self.string_matchers.get(term.name())?;
        Some(td.as_match_no_capture(term.name()))
    }

    fn match_term_regex<'a, 'b>(&'b self, term: TermSig<'a>) -> Option<MatchResult<'a, 'b>> {
        let children = term.children();
        let mut non_child_match = None;
        let matches = self.regex_set.matches(term.name());
        let matches = matches
            .into_iter()
            .take_while(|&idx| {
                if let Some(nc) = idx.checked_sub(self.regex_children_matchers.0.len()) {
                    non_child_match = Some(nc);
                    false
                } else {
                    true
                }
            })
            .map(|idx| &self.regex_children_matchers.0[idx])
            .filter(|td| td.matcher.children().unwrap().get() as usize == children);
        if let Some(td) = SameMatcherKind::match_term_opt(matches, term) {
            return Some(td);
        }
        non_child_match.map(|idx| self.regex_matchers.0[idx].as_match_capture(term.name()))
    }

    fn match_term_wildcard<'a, 'b>(&'b self, term: TermSig<'a>) -> Option<MatchResult<'a, 'b>> {
        let children = NonMaxU32::new(term.children() as u32).unwrap();
        let tds = self.wildcard_matchers.get(&children)?;
        SameMatcherKind::match_term_opt(tds.0.iter(), term)
    }

    #[cfg(feature = "serde")]
    pub(super) fn from_inner(inner: TermDisplayContextInner) -> Self {
        let mut self_ = TermDisplayContext {
            inner,
            ..Default::default()
        };
        self_.calculate_regex_set();
        self_
    }

    fn push_inner(&mut self, term: TermDisplay) -> Result<bool, TdcError> {
        let regex = matches!(term.matcher.kind, MatcherKind::Regex(..));
        match &term.matcher.kind {
            MatcherKind::Exact(s) => {
                if let Some(children) = term.matcher.children() {
                    self.string_children_matchers
                        .entry((Cow::Owned(s.to_string()), children))
                        .or_default()
                        .push(term)?;
                } else {
                    let Entry::Vacant(v) = self.string_matchers.entry(s.to_string()) else {
                        return Err(TdcError::DuplicateMatcher(term.matcher));
                    };
                    v.insert(term);
                }
            }
            MatcherKind::Regex(_) => {
                if term.matcher.children().is_some() {
                    self.regex_children_matchers.push(term)?;
                } else {
                    self.regex_matchers.push(term)?;
                }
            }
            MatcherKind::Wildcard => {
                if let Some(children) = term.matcher.children() {
                    self.wildcard_matchers
                        .entry(children)
                        .or_default()
                        .push(term)?;
                } else {
                    if let Some(duplicate) = self.fallback.take() {
                        return Err(TdcError::DuplicateMatcher(duplicate.matcher));
                    }
                    self.fallback = Some(term);
                }
            }
        };
        Ok(regex)
    }
    fn calculate_regex_set(&mut self) {
        let regex = self
            .regex_children_matchers
            .0
            .iter()
            .chain(self.regex_matchers.0.iter());
        self.regex_set = regex::RegexSet::new(regex.map(|t| {
            let MatcherKind::Regex(r) = &t.matcher.kind else {
                unreachable!()
            };
            r.original()
        }))
        .unwrap();
    }
}

impl PartialEq for TermDisplayContext {
    fn eq(&self, other: &Self) -> bool {
        self.inner == other.inner
    }
}
impl Eq for TermDisplayContext {}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Default, Debug, Clone, PartialEq, Eq)]
struct SameMatcherKind(Vec<TermDisplay>);

impl SameMatcherKind {
    pub fn remove(&mut self, matcher: &Matcher) -> Option<TermDisplay> {
        let to_remove = self.0.iter().position(|t| t.matcher == *matcher)?;
        Some(self.0.remove(to_remove))
    }

    pub fn extend(&mut self, other: &Self) {
        self.0.splice(0..0, other.0.iter().cloned());
    }

    fn push(&mut self, term: TermDisplay) -> Result<(), TdcError> {
        if self.0.iter().any(|t| t.matcher == term.matcher) {
            return Err(TdcError::DuplicateMatcher(term.matcher));
        }
        self.0.push(term);
        Ok(())
    }

    pub fn match_term_opt<'a, 'b>(
        mut tds: impl Iterator<Item = &'b TermDisplay>,
        term: TermSig<'a>,
    ) -> Option<MatchResult<'a, 'b>> {
        tds.find(|td| td.matcher.matches(term))
            .map(|td| td.as_match_no_capture(term.name()))
    }
}

pub struct MatchResult<'a, 'b> {
    pub haystack: &'a str,
    pub captures: Option<regex::Captures<'a>>,
    pub formatter: &'b Formatter,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct TermDisplay {
    pub(crate) matcher: Matcher,
    pub(crate) formatter: Formatter,
}

impl TermDisplay {
    pub const fn empty() -> Self {
        Self {
            matcher: Matcher {
                children: None,
                kind: MatcherKind::Exact(String::new()),
            },
            formatter: Formatter {
                bind_power: BindPowerPair::symmetric(DEFAULT_BIND_POWER),
                outputs: Vec::new(),
                max_capture: None,
            },
        }
    }

    pub fn new(matcher: Matcher, formatter: Formatter) -> Result<Self, ConversionError> {
        if let Some(max_capture) = formatter.max_capture {
            match &matcher.kind {
                MatcherKind::Exact(..) => {
                    return Err(ConversionError::FormatterExpectsRegex(matcher, formatter));
                }
                MatcherKind::Regex(r) => {
                    if max_capture.get() as usize >= r.regex().captures_len() {
                        return Err(ConversionError::RegexNotEnoughCaptures(matcher, formatter));
                    }
                }
                MatcherKind::Wildcard => {
                    if max_capture.get() != 0 {
                        return Err(ConversionError::RegexNotEnoughCaptures(matcher, formatter));
                    }
                }
            }
        }
        Ok(Self { matcher, formatter })
    }
    pub fn deparse_string(&self) -> (String, String) {
        (
            self.matcher.deparse_string(),
            self.formatter.deparse_string(),
        )
    }

    pub fn is_empty(&self) -> bool {
        self == &Self::empty()
    }

    /// Call this when you already know that `self.matcher` matches `haystack`.
    pub const fn as_match_no_capture<'a>(&self, haystack: &'a str) -> MatchResult<'a, '_> {
        MatchResult {
            haystack,
            captures: None,
            formatter: &self.formatter,
        }
    }

    /// Call this when you already know that `self.matcher` matches `haystack`.
    pub fn as_match_capture<'a>(&self, haystack: &'a str) -> MatchResult<'a, '_> {
        let MatcherKind::Regex(r) = &self.matcher.kind else {
            unreachable!()
        };
        let Some(max_capture) = self.formatter.max_capture else {
            return self.as_match_no_capture(haystack);
        };
        let captures = r.regex().captures(haystack).unwrap();
        debug_assert!(captures.len() > max_capture.get() as usize);
        MatchResult {
            haystack,
            captures: Some(captures),
            formatter: &self.formatter,
        }
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Matcher {
    pub kind: MatcherKind,
    pub children: Option<Vec<Matcher>>,
}

impl Matcher {
    pub fn fallback() -> Self {
        Self {
            kind: MatcherKind::Wildcard,
            children: None,
        }
    }

    pub fn is_fallback(&self) -> bool {
        *self == Self::fallback()
    }

    pub fn children(&self) -> Option<NonMaxU32> {
        self.children
            .as_ref()
            .map(|c| NonMaxU32::new(c.len() as u32).unwrap())
    }

    pub fn matches(&self, term: TermSig) -> bool {
        let Some(children) = &self.children else {
            unreachable!()
        };
        assert_eq!(children.len(), term.children());
        for (i, child) in children.iter().enumerate() {
            let st = term.child(i);
            if !child.matches_inner(st) {
                return false;
            }
        }
        true
    }

    fn matches_inner(&self, term: Option<TermSig>) -> bool {
        if matches!(self.kind, MatcherKind::Wildcard) && self.children.is_none() {
            return true;
        }
        let Some(term) = term else {
            return false;
        };
        let can_match = match &self.kind {
            MatcherKind::Exact(s) => s == term.name(),
            MatcherKind::Regex(r) => r.regex().is_match(term.name()),
            MatcherKind::Wildcard => true,
        };
        can_match && self.matches(term)
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MatcherKind {
    Wildcard,
    Exact(String),
    Regex(RegexMatcher),
}

#[derive(Debug, Clone)]
pub struct RegexMatcher {
    original: String,
    regex: regex::Regex,
}
impl RegexMatcher {
    pub fn new(original: String) -> Result<Self, regex::Error> {
        let regex = regex::Regex::new(&original)?;
        Ok(Self { original, regex })
    }
    pub fn original(&self) -> &String {
        &self.original
    }
    pub fn regex(&self) -> &regex::Regex {
        &self.regex
    }
}

impl PartialEq for RegexMatcher {
    fn eq(&self, other: &Self) -> bool {
        self.original == other.original
    }
}
impl Eq for RegexMatcher {}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Formatter {
    /// How strongly does the formatter bind its output from the left? Bracketed
    /// outputs generally have a higher binding power than non-bracketed ones.
    /// For example `{ ... }` can have a higher binding power, while `... + ...`
    /// would typically have a lower binding power.
    pub bind_power: BindPowerPair,

    /// The formatter's output
    pub outputs: Vec<SubFormatter>,

    /// The maximum value of any stored `SubFormatter::Capture`.
    pub max_capture: Option<NonMaxU32>,
}

impl Formatter {
    pub fn calculate_max_capture(&mut self) {
        self.max_capture = self
            .outputs
            .iter()
            .flat_map(|o| match &o.kind {
                SubFormatterKind::Capture(c) => Some(*c),
                SubFormatterKind::Repeat(r) => (r.left_sep.max_capture.is_some()
                    || r.middle_sep.max_capture.is_some()
                    || r.right_sep.max_capture.is_some())
                .then(|| {
                    r.left_sep.max_capture.unwrap_or_default().max(
                        r.middle_sep
                            .max_capture
                            .unwrap_or_default()
                            .max(r.right_sep.max_capture.unwrap_or_default()),
                    )
                }),
                _ => None,
            })
            .max();
    }
}

pub type BindPower = u32;

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct BindPowerPair {
    pub left: BindPower,
    pub right: BindPower,
}
impl BindPowerPair {
    pub const fn symmetric(power: BindPower) -> Self {
        Self {
            left: power,
            right: power,
        }
    }
    pub const fn asymmetric(left: BindPower, right: BindPower) -> Self {
        Self { left, right }
    }
    pub const fn is_smaller(&self, other: &Self) -> bool {
        self.left < other.left || self.right < other.right
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SubFormatter {
    pub path: Vec<ChildIndex>,
    pub kind: SubFormatterKind,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SubFormatterKind {
    String(String),
    Single {
        index: ChildIndex,
        /// How strongly does the surrounding context bind the child?
        bind_power: BindPowerPair,
    },
    Repeat {
        from: ChildIndex,
        to: ChildIndex,
        formatter: RepeatFormatter,
    },
    Capture(NonMaxU32),
}

impl SubFormatter {
    pub(super) fn no_path(kind: SubFormatterKind) -> Self {
        Self { path: Vec::new(), kind }
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RepeatFormatter {
    pub left_sep: Formatter,
    pub middle_sep: Formatter,
    pub right_sep: Formatter,
    pub left: BindPower,
    pub middle: BindPowerPair,
    pub right: BindPower,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ChildIndex(pub i32);
