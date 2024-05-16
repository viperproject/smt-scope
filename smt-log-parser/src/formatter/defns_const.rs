use crate::NonMaxU32;

use super::{defns::*, ConversionError};

#[derive(Debug)]
pub struct TermDisplayConst<'a> {
    pub matcher: MatcherConst<'a>,
    pub formatter: FormatterConst<'a>,
}

impl TryFrom<TermDisplayConst<'_>> for TermDisplay {
    type Error = ConversionError;
    fn try_from(t: TermDisplayConst) -> Result<Self, Self::Error> {
        let matcher = Matcher::try_from(t.matcher)?;
        let formatter = Formatter::from(t.formatter);
        Self::new(matcher, formatter)
    }
}

#[derive(Debug)]
pub struct MatcherConst<'a> {
    pub data: &'a str,
    pub children: Option<NonMaxU32>,
    pub kind: MatcherKindConst,
}

#[derive(Debug)]
pub enum MatcherKindConst {
    Exact,
    Regex,
}

impl TryFrom<MatcherConst<'_>> for Matcher {
    type Error = regex::Error;
    fn try_from(m: MatcherConst<'_>) -> Result<Self, Self::Error> {
        let kind = match m.kind {
            MatcherKindConst::Exact =>
                MatcherKind::Exact(m.data.to_string()),
            MatcherKindConst::Regex => {
                let regex = match (m.data.chars().next(), m.data.chars().last()) {
                    (Some('^'), Some('$')) => m.data.to_string(),
                    (Some('^'), _) => format!("{}$", m.data),
                    (_, Some('$')) => format!("^{}", m.data),
                    _ => format!("^{}$", m.data),
                };
                MatcherKind::Regex(RegexMatcher::new(regex)?)
            }
        };
        Ok(Matcher {
            children: m.children,
            kind,
        })
    }
}

#[derive(Debug)]
pub struct FormatterConst<'a> {
    /// How strongly does the formatter bind its output from the left? Bracketed
    /// outputs generally have a higher binding power than non-bracketed ones.
    /// For example `{ ... }` can have a higher binding power, while `... + ...`
    /// would typically have a lower binding power.
    pub bind_power: BindPowerPair,

    /// The formatter's output
    pub outputs: [Option<SubFormatterConst<'a>>; 64],
}

impl From<FormatterConst<'_>> for Formatter {
    fn from(f: FormatterConst<'_>) -> Self {
        let max_capture = f.max_capture();
        let outputs: Vec<_> = f.outputs.into_iter().map_while(|o| o).map(|o| o.into()).collect();
        Self {
            bind_power: f.bind_power,
            outputs,
            max_capture,
        }
    }
}

impl<'a> FormatterConst<'a> {
    pub const fn max_capture(&self) -> Option<NonMaxU32> {
        let mut max_capture = None::<NonMaxU32>;
        let mut idx = 0;
        while idx < self.outputs.len() {
            let Some(output) = &self.outputs[idx] else {
                break;
            };
            if let SubFormatterConst::Capture(idx) = output {
                max_capture = match max_capture {
                    Some(max) if max.get() >= idx.get() => Some(max),
                    _ => Some(*idx),
                };
            }
            idx += 1;
        }
        max_capture
    }
}

#[derive(Debug)]
pub enum SubFormatterConst<'a> {
    /// A simple string output, will be printed literally.
    String(SubFormatterString<'a>),
    /// 
    Single(SubFormatterSingle),
    Repeat(SubFormatterRepeatConst<'a>),
    Capture(NonMaxU32),
}

impl From<SubFormatterConst<'_>> for SubFormatter {
    fn from(sub: SubFormatterConst<'_>) -> Self {
        match sub {
            SubFormatterConst::String(s) => {
                let c = s.control_deduplicate.then(|| CONTROL_CHARACTER);
                let data = deduplicate_character(s.data, c);
                SubFormatter::String(data)
            }
            SubFormatterConst::Single(s) => SubFormatter::Single {
                index: s.index,
                bind_power: s.bind_power,
            },
            SubFormatterConst::Repeat(s) => SubFormatter::Repeat(s.into()),
            SubFormatterConst::Capture(idx) => SubFormatter::Capture(idx),
        }
    }
}

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SubFormatterSingle {
    pub index: ChildIndex,
    /// How strongly does the surrounding context bind the child?
    pub bind_power: BindPowerPair,
}

#[derive(Debug)]
pub struct SubFormatterString<'a> {
    pub data: &'a str,
    pub control_deduplicate: bool,
}

#[derive(Debug)]
pub struct SubFormatterRepeatConst<'a> {
    pub range: ChildRange,
    pub left_sep: SubFormatterRepeatSeparator<'a>,
    pub middle_sep: SubFormatterRepeatSeparator<'a>,
    pub right_sep: SubFormatterRepeatSeparator<'a>,
    pub left: BindPower,
    pub middle: BindPowerPair,
    pub right: BindPower,
}

impl From<SubFormatterRepeatConst<'_>> for SubFormatterRepeat {
    fn from(sub: SubFormatterRepeatConst<'_>) -> Self {
        Self {
            from: sub.range.from,
            to: sub.range.to,
            left_sep: sub.left_sep.into(),
            middle_sep: sub.middle_sep.into(),
            right_sep: sub.right_sep.into(),
            left: sub.left,
            middle: sub.middle,
            right: sub.right,
        }
    }
}

#[derive(Debug)]
pub struct SubFormatterRepeatSeparator<'a> {
    /// Does the separator contain `SEPARATOR_CHARACTER`s that should be
    /// deduplicated?
    pub separator_deduplicate: bool,
    pub separator: &'a str,
}

impl From<SubFormatterRepeatSeparator<'_>> for String {
    fn from(sep: SubFormatterRepeatSeparator<'_>) -> Self {
        let c = sep.separator_deduplicate.then(|| SEPARATOR_CHARACTER);
        deduplicate_character(sep.separator, c)
    }
}

impl SubFormatterRepeatSeparator<'static> {
    pub const fn default() -> Self {
        Self {
            separator_deduplicate: false,
            separator: "",
        }
    }
}

#[derive(Debug)]
pub struct ChildRange {
    pub from: ChildIndex,
    pub to: ChildIndex,
}

fn deduplicate_character(s: &str, c: Option<char>) -> String {
    if let Some(c) = c {
        let mut to: [u8; 4] = [0; 4];
        let to = c.encode_utf8(&mut to);
        s.replace([c, c], to)
    } else {
        s.to_string()
    }
}
