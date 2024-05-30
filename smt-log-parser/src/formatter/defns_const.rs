use crate::NonMaxU32;

use super::{defns::*, ConversionError, FormatterParseError};

#[derive(Debug)]
pub struct TermDisplayConst<'a> {
    pub matcher: MatcherConst<'a>,
    pub formatter: FormatterConst<'a>,
}

impl TryFrom<TermDisplayConst<'_>> for TermDisplay {
    type Error = ConversionError;
    fn try_from(t: TermDisplayConst) -> Result<Self, Self::Error> {
        let matcher = Matcher::try_from(t.matcher)?;
        let formatter = Formatter::try_from(t.formatter)?;
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
            MatcherKindConst::Exact => MatcherKind::Exact(m.data.to_string()),
            MatcherKindConst::Regex => {
                MatcherKind::Regex(RegexMatcher::new(format!("^(?:{})$", m.data))?)
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

impl TryFrom<FormatterConst<'_>> for Formatter {
    type Error = FormatterParseError;
    fn try_from(f: FormatterConst<'_>) -> Result<Self, Self::Error> {
        let outputs: Vec<_> = f
            .outputs
            .into_iter()
            .map_while(|o| o)
            .map(SubFormatter::try_from)
            .collect::<Result<_, _>>()?;
        let mut self_ = Self {
            bind_power: f.bind_power,
            outputs,
            max_capture: None,
        };
        self_.calculate_max_capture();
        Ok(self_)
    }
}

impl<'a> FormatterConst<'a> {
    /// Shallow max capture calculation.
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

impl TryFrom<SubFormatterConst<'_>> for SubFormatter {
    type Error = FormatterParseError;
    fn try_from(sub: SubFormatterConst<'_>) -> Result<Self, Self::Error> {
        let sf = match sub {
            SubFormatterConst::String(s) => {
                let c = s.control_deduplicate.then_some(CONTROL_CHARACTER);
                let data = deduplicate_character(s.data, c);
                SubFormatter::String(data)
            }
            SubFormatterConst::Single(s) => SubFormatter::Single {
                index: s.index,
                bind_power: s.bind_power,
            },
            SubFormatterConst::Repeat(s) => SubFormatter::Repeat(s.try_into()?),
            SubFormatterConst::Capture(idx) => SubFormatter::Capture(idx),
        };
        Ok(sf)
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

impl TryFrom<SubFormatterRepeatConst<'_>> for SubFormatterRepeat {
    type Error = FormatterParseError;
    fn try_from(sub: SubFormatterRepeatConst<'_>) -> Result<Self, Self::Error> {
        let left_sep = String::from(sub.left_sep);
        let left_sep = left_sep.parse::<Formatter>()?;
        let middle_sep = String::from(sub.middle_sep);
        let middle_sep = middle_sep.parse::<Formatter>()?;
        let right_sep = String::from(sub.right_sep);
        let right_sep = right_sep.parse::<Formatter>()?;
        Ok(Self {
            from: sub.range.from,
            to: sub.range.to,
            left_sep,
            middle_sep,
            right_sep,
            left: sub.left,
            middle: sub.middle,
            right: sub.right,
        })
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
        let c = sep.separator_deduplicate.then_some(SEPARATOR_CHARACTER);
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
