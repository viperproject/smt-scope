use std::str::FromStr;

use crate::NonMaxU32;

use super::{defns::*, defns_const::*, error::*};

macro_rules! map_opt {
    ($e:expr, $s:pat => $t:expr) => {
        match $e {
            Some($s) => Some($t),
            None => None,
        }
    };
    ($s:ident => $t:expr) => {
        map_opt!($s, $s => $t)
    };
    ($e:expr, $s:pat => $t:expr, $d:expr) => {
        match $e {
            Some($s) => $t,
            None => $d,
        }
    };
    ($s:ident => $t:expr, $d:expr) => {
        map_opt!($s, $s => $t, $d)
    };
    ($e:expr, Err($d:expr)) => {
        match $e {
            Some(s) => s,
            None => return Err($d),
        }
    };
}

macro_rules! map_res {
    ($e:expr) => {
        map_res!($e, s => s, err => return Err(err))
    };
    ($e:expr, $err:ident => $f:expr) => {
        map_res!($e, s => s, $err => return Err($f))
    };
    ($e:expr, $s:pat => $t:expr, $err:ident => $f:expr) => {
        match $e {
            Ok($s) => $t,
            Err($err) => $f,
        }
    };
}

// Const parsing

impl ChildIndex {
    pub const fn parse<'a>(s: &'a str, hash_prefix: bool) -> ResultFormatterConst<'a, Self> {
        let s = if hash_prefix {
            let tail = ConstOperations::strip_prefix(s, '#');
            map_opt!(tail, Err(ParseErrorConst::missing_hash(s)))
        } else {
            s
        };
        let index = map_res!(ConstOperations::parse_i32(s));
        Ok(Self(index))
    }
}

impl ChildRange {
    pub const fn parse<'a>(s: &'a str) -> ResultFormatterConst<'a, Self> {
        let split = ConstOperations::split_first(s, ':');
        let (from, to) = map_opt!(split, Err(ParseErrorConst::missing_range(s)));
        let from =  map_res!(ChildIndex::parse(from, true));
        let to =  map_res!(ChildIndex::parse(to, false));
        Ok(ChildRange { from, to })
    }
}

impl BindPowerPair {
    pub const fn parse<'a>(s: &'a str) -> ResultFormatterConst<'a, (bool, Self)> {
        let split = ConstOperations::split(s, ',');
        let (_, first, split) = split.next::<false>();
        let first =  map_res!(ConstOperations::parse_u32(first));
        let (second, split) = ConstOperations::split_more(split);
        let second = map_opt!(second => map_res!(ConstOperations::parse_u32(second)));
        match (second, split) {
            (.., Some(split)) => Err(ParseErrorConst::too_many_control(split)),
            (None, ..) => Ok((false, BindPowerPair::symmetric(first))),
            (Some(second), None) => Ok((true, BindPowerPair::asymmetric(first, second))),
        }
    }
}

impl SubFormatterSingle {
    pub const fn parse<'a>(s: &'a str) -> ResultFormatterConst<'a, Self> {
        let split = ConstOperations::split(s, SEPARATOR_CHARACTER);
        let (_, index, split) = split.next::<false>();
        let index = map_res!(ChildIndex::parse(index, true));
        let bind_power = map_opt!(
            split => map_res!(BindPowerPair::parse(split.remainder())).1,
            BindPowerPair::symmetric(DEFAULT_BIND_POWER)
        );
        Ok(Self { index, bind_power })
    }
}

impl<'a> SubFormatterRepeatConst<'a> {
    pub const fn parse(s: &'a str) -> ResultFormatterConst<'a, Self> {
        let split = ConstOperations::split(s, CONTROL_CHARACTER);
        let (_, left, sep) = split.next::<false>();

        // $(`a:b|n|m,o,|p`$
        let left = ConstOperations::split(left, SEPARATOR_CHARACTER);
        let (_, range, split) = left.next::<false>();
        let range = map_res!(ChildRange::parse(range));
        let (left, middle, right) = map_res!(Self::parse_triple(split));

        // $`(|, |)`)$
        let mut left_sep = SubFormatterRepeatSeparator::default();
        let mut middle_sep = SubFormatterRepeatSeparator::default();
        let mut right_sep = SubFormatterRepeatSeparator::default();
        if let Some(sep) = sep {
            let sep = ConstOperations::split(sep.remainder(), SEPARATOR_CHARACTER);
            let (separator_deduplicate, separator, sep) = sep.next::<true>();
            if let Some(sep_two) = sep {
                left_sep.separator_deduplicate = separator_deduplicate;
                left_sep.separator = separator;
                let (separator_deduplicate, separator, sep) = sep_two.next::<true>();
                let sep = map_opt!(sep => sep, return Err(ParseErrorConst::too_many_control(sep_two)));
                middle_sep.separator_deduplicate = separator_deduplicate;
                middle_sep.separator = separator;
                let (separator_deduplicate, separator, sep) = sep.next::<true>();
                #[allow(unreachable_code)]
                { map_opt!(sep => return Err(ParseErrorConst::too_many_control(sep))); }
                right_sep.separator_deduplicate = separator_deduplicate;
                right_sep.separator = separator;
            } else {
                middle_sep.separator_deduplicate = separator_deduplicate;
                middle_sep.separator = separator;
            }
        }
        Ok(Self {
            range,
            left_sep,
            middle_sep,
            right_sep,
            left,
            middle,
            right,
        })
    }
    /// Could have any of: ``, `n`, `n,n`, `n|n`, `n,n|n`, `n|n,n`, `n|n|n`, `n|n,n|n`
    const fn parse_triple(split: Option<ConstSplit<'a, 1>>) -> ResultFormatterConst<'a, (BindPower, BindPowerPair, BindPower)> {
        const DEFAULT: BindPowerPair = BindPowerPair::symmetric(DEFAULT_BIND_POWER);
        let split = map_opt!(split => split, return Ok((DEFAULT_BIND_POWER, DEFAULT, DEFAULT_BIND_POWER)));
        let (_, first, split) = split.next::<false>();
        let (pair, fst) = map_res!(BindPowerPair::parse(first));
        if pair {
            // `n,n` or `n,n|n`
            let split = map_opt!(split => split, return Ok((DEFAULT_BIND_POWER, fst, DEFAULT_BIND_POWER)));
            let (_, second, split) = split.next::<false>();
            #[allow(unreachable_code)]
            { map_opt!(split => return Err(ParseErrorConst::too_many_control(split))); }
            let (pair, snd) = map_res!(BindPowerPair::parse(second));
            return if pair {
                Err(ParseErrorConst::unexpected_pair(second))
            } else {
                // snd.left == snd.right
                let snd = snd.left;
                Ok((DEFAULT_BIND_POWER, fst, snd))
            }
        }
        // fst.left == fst.right
        let split = map_opt!(split => split, return Ok((fst.left, fst, fst.right)));
        let fst = fst.left;
        // `n|n`, `n|n,n`, `n|n|n` or `n|n,n|n`
        let (_, second, split) = split.next::<false>();
        let (pair, snd) = map_res!(BindPowerPair::parse(second));
        let split = map_opt!(split => split, return Ok(if pair {
            (fst, snd, DEFAULT_BIND_POWER)
        } else {
            // snd.left == snd.right
            let snd = snd.left;
            (fst, DEFAULT, snd)
        }));
        // `n|n|n` or `n|n,n|n`
        let (_, third, split) = split.next::<false>();
        #[allow(unreachable_code)]
        { map_opt!(split => return Err(ParseErrorConst::too_many_control(split))); }
        let (pair, thrd) = map_res!(BindPowerPair::parse(third));
        if pair {
            Err(ParseErrorConst::unexpected_pair(third))
        } else {
            // thrd.left == thrd.right
            let thrd = thrd.left;
            Ok((fst, snd, thrd))
        }
    }
}

impl<'a> SubFormatterConst<'a> {
    pub const fn parse_control(s: &'a str) -> ResultFormatterConst<'a, (Self, &'a str)> {
        if let Some(s) = ConstOperations::strip_prefix(s, '[') {
            let split = ConstOperations::split_2(s, ']', CONTROL_CHARACTER);
            let (_, control, split) = split.next::<false>();
            let split = map_opt!(split, Err(ParseErrorConst::missing_control(s, "]$")));
            let control = map_res!(SubFormatterSingle::parse(control));
            return Ok((Self::Single(control), split.remainder()))
        }
        if let Some(s) = ConstOperations::strip_prefix(s, '(') {
            let split = ConstOperations::split_2(s, ')', CONTROL_CHARACTER);
            let (_, control, split) = split.next::<false>();
            let split = map_opt!(split, Err(ParseErrorConst::missing_control(s, ")$")));
            let control = map_res!(SubFormatterRepeatConst::parse(control));
            return Ok((Self::Repeat(control), split.remainder()))
        }
        if let Some(s) = ConstOperations::strip_prefix(s, '{') {
            let split = ConstOperations::split_2(s, '}', CONTROL_CHARACTER);
            let (_, inner, split) = split.next::<false>();
            let split = map_opt!(split, Err(ParseErrorConst::missing_control(s, "}$")));
            let capture = map_res!(ConstOperations::parse_u32(inner));
            if capture >= i32::MIN as u32 {
                return Err(ParseErrorConst::capture_overflow(inner));
            }
            let capture = map_opt!(NonMaxU32::new(capture), s => s, loop {});
            return Ok((Self::Capture(capture), split.remainder()))
        }
        Err(ParseErrorConst::incorrect_control(s))
    }
    pub const fn parse_one(s: &'a str) -> ResultFormatterConst<'a, (Option<SubFormatterString<'a>>, Option<(Self, &'a str)>)> {
        let split = ConstOperations::split(s, CONTROL_CHARACTER);
        let (control_deduplicate, first, rest) = split.next::<true>();
        let first = if first.is_empty() {
            None
        } else {
            Some(SubFormatterString { data: first, control_deduplicate })
        };
        let rest = map_opt!(rest => map_res!(Self::parse_control(rest.remainder())));
        Ok((first, rest))
    }
}

impl<'a> FormatterConst<'a> {
    const INIT: Option<SubFormatterConst<'a>> = None;
    pub const fn parse(full: &'a str) -> ResultFormatterConst<'a, Self> {
        let mut s = full;
        let mut bind_power = BindPowerPair::symmetric(DEFAULT_BIND_POWER);
        if let Some(rest) = ConstOperations::strip_prefix(s, CONTROL_CHARACTER) {
            let (left, rest) = map_opt!(ConstOperations::split_first(rest, CONTROL_CHARACTER), Err(ParseErrorConst::missing_control(rest, "$")));
            let left = map_res!(ConstOperations::parse_u32(left));
            bind_power.left = left;
            s = rest;
        }
        if let Some(rest) = ConstOperations::strip_suffix(s, CONTROL_CHARACTER) {
            let (right, rest) = map_opt!(ConstOperations::split_last(rest, CONTROL_CHARACTER), Err(ParseErrorConst::missing_control(rest, "$")));
            let right = map_res!(ConstOperations::parse_u32(right));
            bind_power.right = right;
            s = rest;
        }

        let mut outputs = [Self::INIT; 64];
        let mut idx = 0;
        loop {
            let (str, ctrl) = map_res!(SubFormatterConst::parse_one(s));
            if let Some(str) = str {
                outputs[idx] = Some(SubFormatterConst::String(str));
                idx += 1;
            }
            let Some((ctrl, rest)) = ctrl else {
                break;
            };
            outputs[idx] = Some(ctrl);
            idx += 1;
            s = rest;
        }
        Ok(Self { bind_power, outputs })
    }
}

impl<'a> MatcherConst<'a> {
    pub const fn parse(s: &'a str) -> ResultMatcherConst<'a, Self> {
        let (s, children) = map_res!(Self::parse_children(s));
        let regex = map_opt!(ConstOperations::strip_prefix(s, '/'), s => ConstOperations::strip_suffix(s, '/'), None);
        let (data, kind) = if let Some(regex) = regex {
            (regex, MatcherKindConst::Regex)
        } else {
            (s, MatcherKindConst::Exact)
        };
        Ok(Self { data, children, kind })
    }
    pub const fn parse_children(s: &'a str) -> ResultMatcherConst<'a, (&'a str, Option<NonMaxU32>)> {
        let mut has_bracket = true;
        let s = map_opt!(ConstOperations::strip_prefix(s, '('), s => s, { has_bracket = false; s });
        let mut s = match ConstOperations::strip_suffix(s, ')') {
            Some(s) if has_bracket => s,
            None if !has_bracket => return Ok((s, None)),
            Some(s) =>
                return Err(ParseErrorConst::invalid_children_spec(s)),
            None => return Err(ParseErrorConst::invalid_children_spec(s)),
        };
        let mut children = NonMaxU32::ZERO;
        while let Some(rest) = ConstOperations::strip_suffix(s, '_') {
            let Some(rest) = ConstOperations::strip_suffix(rest, ' ') else { break };
            let new = NonMaxU32::new(children.get() + 1);
            children = map_opt!(new, Err(ParseErrorConst::invalid_children_spec(s)));
            s = rest;
        }
        Ok((s, Some(children)))
    }
}

impl<'a> TermDisplayConst<'a> {
    pub const fn parse(m: &'a str, f: &'a str) -> ResultConst<'a, Self> {
        let matcher = map_res!(MatcherConst::parse(m), err => ParseErrorConst::matcher(err));
        let formatter = map_res!(FormatterConst::parse(f), err => ParseErrorConst::formatter(err));
        if matches!(matcher.kind, MatcherKindConst::Exact) && formatter.max_capture().is_some() {
            return Err(ParseErrorConst::invalid_capture(m));
        }
        Ok(Self { matcher, formatter })
    }
}

// Non-const parsing

impl FromStr for ChildIndex {
    type Err = FormatterParseError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Ok(Self::parse(s, true)?)
    }
}

impl FromStr for ChildRange {
    type Err = FormatterParseError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Ok(Self::parse(s)?)
    }
}

impl FromStr for SubFormatterSingle {
    type Err = FormatterParseError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Ok(Self::parse(s)?)
    }
}

impl FromStr for SubFormatterRepeat {
    type Err = FormatterParseError;
    fn from_str<'a>(s: &'a str) -> Result<Self, Self::Err> {
        let self_ = SubFormatterRepeatConst::parse(s)?;
        Ok(self_.into())
    }
}

impl FromStr for Formatter {
    type Err = FormatterParseError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Ok(FormatterConst::parse(s)?.into())
    }
}

impl FromStr for FallbackFormatter {
    type Err = FallbackParseError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        FallbackFormatter::new(s.parse().map_err(FallbackParseError::FormatterParseError)?)
    }
}

impl FromStr for Matcher {
    type Err = ConversionError;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Ok(MatcherConst::parse(s).map_err(ParseError::from)?.try_into()?)
    }
}

// Helpers for const parsing

#[derive(Debug, Clone, Copy)]
pub(super) struct ConstSplit<'a, const N: usize>(&'a str, [u8; N]);

struct Check<const SKIP_DOUBLE: bool, const N: usize>;
impl<const SKIP_DOUBLE: bool, const N: usize> Check<SKIP_DOUBLE, N> {
    const CHECK_N_SIZE: () = {
        ["N must be 1 or 2"][!(N == 1 || N == 2) as usize];
        ["N must be 1 when SKIP_DOUBLE"][!(N == 1 || !SKIP_DOUBLE) as usize];
    };
}

impl<'a, const N: usize> ConstSplit<'a, N> {
    const fn next<const SKIP_DOUBLE: bool>(self) -> (bool, &'a str, Option<Self>) {
        let _ = Check::<SKIP_DOUBLE, N>::CHECK_N_SIZE;

        let full = self.0.as_bytes();
        let mut s = full;
        let mut skipped = false;
        let mut idx = 0;
        let reached_sep = loop {
            match s {
                [] => break None,
                [b, n, r @ ..] if N == 1 && SKIP_DOUBLE && *b == self.1[0] && *n == self.1[0] => {
                    skipped = true;
                    idx += 2;
                    s = r;
                }
                [b, r @ ..] if N == 1 => {
                    s = r;
                    if *b == self.1[0] {
                        break Some(idx);
                    }
                    idx += 1;
                }
                [_] if N >= 2 => break None,
                [b1, r @ ..] if N >= 2 => {
                    s = r;
                    if *b1 == self.1[0] {
                        let [b2, r @ ..] = r else { loop {} };
                        if *b2 == self.1[1] {
                            s = r;
                            break Some(idx);
                        }
                    }
                    idx += 1;
                }
                _ => loop {}
            }
        };
        match reached_sep {
            Some(reached_sep) => {
                let (part, _) = full.split_at(reached_sep);
                let part = unsafe {
                    std::str::from_utf8_unchecked(part)
                };
                let rest = unsafe {
                    std::str::from_utf8_unchecked(s)
                };
                (skipped, part, Some(ConstSplit(rest, self.1)))
            }
            None => (skipped, self.0, None),
        }
    }
    const fn prev<const SKIP_DOUBLE: bool>(self) -> (bool, &'a str, Option<Self>) {
        let _ = Check::<SKIP_DOUBLE, N>::CHECK_N_SIZE;

        let full = self.0.as_bytes();
        let mut s = full;
        let mut skipped = false;
        let mut idx = s.len();
        let reached_sep = loop {
            match s {
                [] => break None,
                [r @ .., b, n] if N == 1 && SKIP_DOUBLE && *b == self.1[0] && *n == self.1[0] => {
                    skipped = true;
                    idx -= 2;
                    s = r;
                }
                [r @ .., b] if N == 1 => {
                    s = r;
                    if *b == self.1[0] {
                        break Some(idx);
                    }
                    idx -= 1;
                }
                [_] if N >= 2 => break None,
                [r @ .., b2] if N >= 2 => {
                    s = r;
                    if *b2 == self.1[1] {
                        let [r @ .., b1] = r else { loop {} };
                        if *b1 == self.1[1] {
                            s = r;
                            break Some(idx);
                        }
                    }
                    idx -= 1;
                }
                _ => loop {}
            }
        };
        match reached_sep {
            Some(reached_sep) => {
                let (_, part) = full.split_at(reached_sep);
                let part = unsafe {
                    std::str::from_utf8_unchecked(part)
                };
                let rest = unsafe {
                    std::str::from_utf8_unchecked(s)
                };
                (skipped, part, Some(ConstSplit(rest, self.1)))
            }
            None => (skipped, self.0, None),
        }
    }
    pub(super) const fn remainder(self) -> &'a str {
        self.0
    }
}
impl ConstSplit<'_, 1> {
    pub(super) const fn control(self) -> char {
        self.1[0] as char
    }
}

struct ConstOperations;
impl ConstOperations {
    const fn char_as_ascii(c: char) -> u8 {
        ["Character must be an ASCII byte"][!c.is_ascii() as usize];
        c as u8
    }

    const fn strip_prefix(s: &str, prefix: char) -> Option<&str> {
        let prefix = Self::char_as_ascii(prefix);
        match s.as_bytes() {
            [b, s @ ..] if *b == prefix =>
                Some(unsafe { std::str::from_utf8_unchecked(s) }),
            _ => None,
        }
    }
    const fn strip_suffix(s: &str, suffix: char) -> Option<&str> {
        let suffix = Self::char_as_ascii(suffix);
        match s.as_bytes() {
            [s @ .., b] if *b == suffix =>
                Some(unsafe { std::str::from_utf8_unchecked(s) }),
            _ => None,
        }
    }

    const fn split<'a>(s: &'a str, sep: char) -> ConstSplit<'a, 1> {
        let sep = Self::char_as_ascii(sep);
        ConstSplit(s, [sep])
    }
    const fn split_2<'a>(s: &'a str, sep1: char, sep2: char) -> ConstSplit<'a, 2> {
        let sep1 = Self::char_as_ascii(sep1);
        let sep2 = Self::char_as_ascii(sep2);
        ConstSplit(s, [sep1, sep2])
    }

    const fn split_more<'a, const N: usize>(s: Option<ConstSplit<'a, N>>) -> (Option<&'a str>, Option<ConstSplit<'a, N>>) {
        map_opt!(s => {
            let (_, part, split) = s.next::<false>();
            (Some(part), split)
        }, (None, None))
    }
    const fn split_first(s: &'_ str, sep: char) -> Option<(&'_ str, &'_ str)> {
        let split = Self::split(s, sep);
        let (_, first, split) = split.next::<false>();
        map_opt!(split => (first, split.remainder()))
    }
    const fn split_last(s: &'_ str, sep: char) -> Option<(&'_ str, &'_ str)> {
        let split = Self::split(s, sep);
        let (_, last, split) = split.prev::<false>();
        map_opt!(split => (last, split.remainder()))
    }

    const fn parse_i32<'a>(full: &'a str) -> ResultFormatterConst<'a, i32> {
        let neg = Self::strip_prefix(full, '-');
        let is_neg = neg.is_some();
        let s = map_opt!(neg => neg, full);
        if s.is_empty() {
            return Err(ParseErrorConst::invalid_number(full))
        }
        let leading_zero = Self::strip_prefix(s, '0');
        if let Some(leading_zero) = leading_zero {
            return if is_neg || !leading_zero.is_empty() {
                Err(ParseErrorConst::invalid_number(s))
            } else {
                Ok(0)
            }
        }
        let mut s = s.as_bytes();

        let mut num = 0;
        while !s.is_empty() {
            match s {
                [b @ b'0'..=b'9', r @ ..] => {
                    num = num * 10;
                    let delta = (*b - b'0') as i32;
                    if is_neg {
                        num -= delta;
                    } else {
                        num += delta;
                    }
                    s = r;
                }
                _ => {
                    let s = unsafe { std::str::from_utf8_unchecked(s) };
                    return Err(ParseErrorConst::invalid_number(s))
                }
            }
        };
        Ok(num)
    }
    const fn parse_u32<'a>(full: &'a str) -> ResultFormatterConst<'a, u32> {
        let data = map_res!(Self::parse_i32(full));
        Ok(data as u32)
    }
}
