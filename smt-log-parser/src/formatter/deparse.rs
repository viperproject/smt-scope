use core::fmt;

use super::defns::*;

pub struct DeParse<D: DeParseTrait>(pub D);

impl<D: DeParseTrait> fmt::Display for DeParse<D> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.deparse(f)
    }
}

pub trait DeParseTrait: Copy {
    fn deparse_string(self) -> String {
        DeParse(self).to_string()
    }
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result;
}

impl DeParseTrait for &'_ Matcher {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        if self.children.is_some() {
            write!(f, "(")?;
        }
        self.kind.deparse(f)?;
        if let Some(children) = &self.children {
            for _ in 0..children.get() {
                write!(f, " _")?;
            }
            write!(f, ")")?;
        }
        Ok(())
    }
}

impl DeParseTrait for &'_ MatcherKind {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            MatcherKind::Exact(s) =>
                write!(f, "{s}"),
            MatcherKind::Regex(r) => {
                write!(f, "/")?;
                let original = r.original();
                let no_prefix = original.strip_prefix("^(?:").unwrap_or(original);
                let no_suffix = no_prefix.strip_suffix(")$").unwrap_or(no_prefix);
                write!(f, "{no_suffix}")?;
                write!(f, "/")
            }
        }
    }
}

impl DeParseTrait for &'_ Formatter {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        if self.bind_power.left != DEFAULT_BIND_POWER {
            write!(f, "{CONTROL_CHARACTER}{}{CONTROL_CHARACTER}", self.bind_power.left as i32)?;
        }
        for o in &self.outputs {
            o.deparse(f)?;
        }
        if self.bind_power.right != DEFAULT_BIND_POWER {
            write!(f, "{CONTROL_CHARACTER}{}{CONTROL_CHARACTER}", self.bind_power.right as i32)?;
        }
        Ok(())
    }
}

impl DeParseTrait for &'_ SubFormatter {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            SubFormatter::String(s) =>
                write!(f, "{}", duplicate_character(s, CONTROL_CHARACTER)),
            SubFormatter::Single { index, bind_power } =>
                write!(f, "{CONTROL_CHARACTER}[#{}{SEPARATOR_CHARACTER}{}]{CONTROL_CHARACTER}", index.0, DeParse(bind_power)),
            SubFormatter::Repeat(r) => {
                write!(f, "{CONTROL_CHARACTER}(")?;
                r.deparse(f)?;
                write!(f, "){CONTROL_CHARACTER}")
            }
            SubFormatter::Capture(c) =>
                write!(f, "{CONTROL_CHARACTER}{{{c}}}{CONTROL_CHARACTER}"),
        }
    }
}

fn duplicate_character(s: &str, c: char) -> String {
    s.replace(c, &String::from_iter([c, c].into_iter()))
}

impl DeParseTrait for &'_ BindPowerPair {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        if self.left == self.right {
            write!(f, "{}", self.left as i32)
        } else {
            write!(f, "{},{}", self.left as i32, self.right as i32)
        }
    }
}

impl DeParseTrait for &'_ SubFormatterRepeat {
    fn deparse(self, f: &mut fmt::Formatter) -> fmt::Result {
        let from = self.from.0;
        let to = self.to.0;
        let left = self.left as i32;
        let middle = DeParse(&self.middle);
        let right = self.right as i32;
        write!(f, "#{from}:{to}{SEPARATOR_CHARACTER}{left}{SEPARATOR_CHARACTER}{middle}{SEPARATOR_CHARACTER}{right}{CONTROL_CHARACTER}")?;
        let left_sep = duplicate_character(&DeParse(&self.left_sep).to_string(), SEPARATOR_CHARACTER);
        write!(f, "{left_sep}")?;
        write!(f, "{SEPARATOR_CHARACTER}")?;
        let middle_sep = duplicate_character(&DeParse(&self.middle_sep).to_string(), SEPARATOR_CHARACTER);
        write!(f, "{middle_sep}")?;
        write!(f, "{SEPARATOR_CHARACTER}")?;
        let right_sep = duplicate_character(&DeParse(&self.right_sep).to_string(), SEPARATOR_CHARACTER);
        write!(f, "{right_sep}")?;
        Ok(())
    }
}
