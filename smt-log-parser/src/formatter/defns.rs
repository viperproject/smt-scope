use std::borrow::Cow;

use fxhash::FxHashMap;

use crate::NonMaxU32;

use super::{ConversionError, DeParseTrait, FallbackParseError, TdcError};

pub const CONTROL_CHARACTER: char = '$';
pub const SEPARATOR_CHARACTER: char = '|';
pub const DEFAULT_BIND_POWER: BindPower = 0;

#[derive(Default, Debug, Clone)]
pub struct TermDisplayContext {
    string_matchers: FxHashMap<(Cow<'static, str>, Option<NonMaxU32>), TermDisplay>,
    regex_matchers: Vec<TermDisplay>,
    regex_set: regex::RegexSet,
    fallback: FallbackFormatter,
}

pub type TermDisplayContextParts<'a> = (
    &'a FxHashMap<(Cow<'static, str>, Option<NonMaxU32>), TermDisplay>,
    &'a Vec<TermDisplay>,
    &'a FallbackFormatter,
);

impl FromIterator<TermDisplay> for Result<TermDisplayContext, TdcError> {
    fn from_iter<T: IntoIterator<Item = TermDisplay>>(iter: T) -> Self {
        let mut this = TermDisplayContext::default();
        this.append(iter.into_iter())?;
        Ok(this)
    }
}

impl TermDisplayContext {
    pub fn new(fallback: Formatter) -> Self {
        Self {
            string_matchers: Default::default(),
            regex_matchers: Default::default(),
            regex_set: Default::default(),
            fallback: FallbackFormatter(fallback),
        }
    }

    pub fn is_empty(&self) -> bool {
        self.string_matchers.is_empty() && self.regex_matchers.is_empty()
    }
    pub fn all(&self) -> impl Iterator<Item = &TermDisplay> {
        self.string_matchers.values().chain(&self.regex_matchers)
    }
    pub fn fallback(&self) -> &FallbackFormatter {
        &self.fallback
    }

    pub fn set_fallback(&mut self, formatter: FallbackFormatter) {
        self.fallback = formatter
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
                // SAFETY: though the lifetime is 'static in terms of the
                // compiler, the actual lifetime will end at the end of the
                // block.
                let s = unsafe { &*(s.as_str() as *const _) };
                self.string_matchers
                    .remove(&(Cow::Borrowed(s), matcher.children))
            }
            MatcherKind::Regex(r) => {
                let idx = self.regex_matchers.iter().position(|t| {
                    let MatcherKind::Regex(r2) = &t.matcher.kind else {
                        unreachable!()
                    };
                    r2.original() == r.original()
                })?;
                let removed = self.regex_matchers.remove(idx);
                self.calculate_regex_set();
                Some(removed)
            }
        }
    }

    /// Extends this context with another higher priority one. If there are any
    /// conflicts, we drop the conflicting entries from the `self` context!
    pub fn extend(&mut self, other: &Self) {
        for (k, v) in &other.string_matchers {
            self.string_matchers.insert(k.clone(), v.clone());
        }
        let must_recalculate = !other.regex_matchers.is_empty();
        let mut regex_matchers = other.regex_matchers.clone();
        regex_matchers.append(&mut self.regex_matchers);
        self.regex_matchers = regex_matchers;
        if must_recalculate {
            self.calculate_regex_set();
        }
    }

    /// Returns the formatter for the given string, defaulting to the fallback
    /// if none match. See [`Self::match_str_opt`] for more details.
    pub fn match_str<'a, 'b>(
        &'b self,
        haystack: &'a str,
        children: NonMaxU32,
    ) -> MatchResult<'a, 'b> {
        self.match_str_opt(haystack, children)
            .unwrap_or_else(|| MatchResult {
                haystack,
                captures: None,
                formatter: self.fallback().formatter(),
            })
    }

    /// Returns the formatter for the given string, if one exists. If multiple
    /// matchers match the string, then the first one is returned. The order is
    /// determined as `Matcher::Exact` first and then the first `Matcher::Regex`
    /// in the order provided when constructing `self`.
    pub fn match_str_opt<'a, 'b>(
        &'b self,
        haystack: &'a str,
        children: NonMaxU32,
    ) -> Option<MatchResult<'a, 'b>> {
        // SAFETY: though the lifetime is 'static in terms of the
        // compiler, the actual lifetime will end at the end of the
        // block.
        let static_key = unsafe { &*(haystack as *const _) };
        let string_match = self
            .string_matchers
            .get(&(Cow::Borrowed(static_key), Some(children)));
        let string_match =
            string_match.or_else(|| self.string_matchers.get(&(Cow::Borrowed(static_key), None)));
        if let Some(td) = string_match {
            Some(td.as_match_no_capture(haystack))
        } else {
            let mut matches = self
                .regex_set
                .matches(haystack)
                .into_iter()
                .map(|idx| &self.regex_matchers[idx])
                .filter(|td| !td.matcher.children.is_some_and(|c| c != children));
            // Fallback match in case of no matches which specify exact children
            let first = matches.next();
            let mut matches = first.iter().copied().chain(matches);
            let specific = matches.find(|td| td.matcher.children.is_some());
            let match_ = specific.or(first)?;
            Some(match_.as_match_capture(haystack))
        }
    }

    pub(super) fn to_parts(&self) -> TermDisplayContextParts {
        (&self.string_matchers, &self.regex_matchers, &self.fallback)
    }
    pub(super) fn from_parts(
        string_matchers: FxHashMap<(Cow<'static, str>, Option<NonMaxU32>), TermDisplay>,
        regex_matchers: Vec<TermDisplay>,
        fallback: FallbackFormatter,
    ) -> Self {
        let mut this = TermDisplayContext {
            string_matchers,
            regex_matchers,
            ..Default::default()
        };
        this.calculate_regex_set();
        this.fallback = fallback;
        this
    }

    fn push_inner(&mut self, term: TermDisplay) -> Result<bool, TdcError> {
        match &term.matcher.kind {
            MatcherKind::Exact(s) => {
                let k = (Cow::Owned(s.to_string()), term.matcher.children);
                let duplicate = self.string_matchers.insert(k, term);
                if let Some(duplicate) = duplicate {
                    let MatcherKind::Exact(s) = duplicate.matcher.kind else {
                        unreachable!()
                    };
                    Err(TdcError::DuplicateExactMatcher(
                        s,
                        duplicate.matcher.children,
                    ))
                } else {
                    Ok(false)
                }
            }
            MatcherKind::Regex(_) => {
                self.regex_matchers.push(term);
                Ok(true)
            }
        }
    }
    fn calculate_regex_set(&mut self) {
        self.regex_set = regex::RegexSet::new(self.regex_matchers.iter().map(|t| {
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
        self.string_matchers == other.string_matchers
            && self.regex_matchers == other.regex_matchers
            && self.fallback == other.fallback
    }
}
impl Eq for TermDisplayContext {}

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
            let MatcherKind::Regex(r) = &matcher.kind else {
                return Err(ConversionError::FormatterExpectsRegex(matcher, formatter));
            };
            if max_capture.get() as usize >= r.regex().captures_len() {
                return Err(ConversionError::RegexNotEnoughCaptures(matcher, formatter));
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
    pub children: Option<NonMaxU32>,
    pub kind: MatcherKind,
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MatcherKind {
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
            .flat_map(|o| match o {
                SubFormatter::Capture(c) => Some(*c),
                SubFormatter::Repeat(r) => (r.left_sep.max_capture.is_some()
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

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Default, Debug, Clone, PartialEq, Eq)]
pub struct FallbackFormatter(Formatter);

impl FallbackFormatter {
    /// Creates the fallback formatter. Returns `Ok` if successful, `Err`
    /// if the fallback formatter has a non-zero `max_capture`.
    pub fn new(formatter: Formatter) -> Result<Self, FallbackParseError> {
        if let Some(mc) = formatter.max_capture.filter(|mc| mc.get() > 0) {
            Err(FallbackParseError::MaxCaptureTooLarge(mc))
        } else {
            Ok(Self(formatter))
        }
    }
    pub fn formatter(&self) -> &Formatter {
        &self.0
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
pub enum SubFormatter {
    String(String),
    Single {
        index: ChildIndex,
        /// How strongly does the surrounding context bind the child?
        bind_power: BindPowerPair,
    },
    Repeat(SubFormatterRepeat),
    Capture(NonMaxU32),
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SubFormatterRepeat {
    pub from: ChildIndex,
    pub to: ChildIndex,
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
