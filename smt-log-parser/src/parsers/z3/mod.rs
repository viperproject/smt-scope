use std::fmt::Debug;

use super::{LogParser, LogParserHelper};
use crate::{Error, FResult, Result};

mod blame;
mod bugs;
pub mod egraph;
pub mod inst;
pub mod inter_line;
/// Original Z3 log parser. Works with Z3 v.4.12.1, should work with other versions
/// as long as the log format is the same for the important line cases.
/// Compare with the log files in the `logs/` folder to see if this is the case.
pub mod parse;
pub mod stack;
pub mod stm2;
pub mod synthetic;
pub mod terms;
mod z3parser;

pub use z3parser::*;

impl<T: Z3LogParser + LogParserHelper> LogParser for T {
    fn is_line_start(&mut self, first_byte: u8) -> bool {
        first_byte == b'['
    }

    fn process_line(&mut self, line: &str, line_no: usize) -> FResult<bool> {
        // Much faster than `split_whitespace` or `split(' ')` since it works on
        // [u8] instead of [char] and so doesn't need to convert to UTF-8.
        let mut split = line.split_ascii_whitespace();
        let Some(first) = split.next() else {
            return Ok(true);
        };
        self.newline();
        let parse = match first {
            // match the line case
            "[tool-version]" => self.version_info(split),
            "[mk-quant]" => self.mk_quant(split),
            "[mk-lambda]" => self.mk_lambda(split),
            "[mk-var]" => self.mk_var(split),
            "[mk-app]" => self.mk_app(split),
            "[mk-proof]" => self.mk_proof(split),
            "[attach-meaning]" => self.attach_meaning(split),
            "[attach-var-names]" => self.attach_var_names(split),
            "[attach-enode]" => self.attach_enode(split),
            "[eq-expl]" => self.eq_expl(split),
            "[new-match]" => self.new_match(split),
            "[inst-discovered]" => self.inst_discovered(split),
            "[instance]" => self.instance(split),
            "[end-of-instance]" => self.end_of_instance(split),
            "[decide-and-or]" => self.decide_and_or(split),
            "[decide]" => self.decide(split),
            "[assign]" => self.assign(split),
            "[push]" => self.push(split),
            "[pop]" => self.pop(split),
            "[begin-check]" => self.begin_check(split),
            "[query-done]" => self.query_done(split),
            "[eof]" => return Ok(false),
            "[resolve-process]" => self.resolve_process(split),
            "[resolve-lit]" => self.resolve_lit(split),
            "[conflict]" => self.conflict(split),
            _ => Err(Error::UnknownLine(first.to_owned())),
        };
        match parse {
            Ok(()) => Ok(true),
            Err(err) => {
                eprintln!("Error parsing line {line_no} ({err:?}): {line:?}");
                // Fail in debug mode, we should never get here
                debug_assert!(false);
                match err.as_fatal() {
                    Some(err) => Err(err),
                    None => Ok(true),
                }
            }
        }
    }

    fn end_of_file(&mut self) {
        self.eof();
    }
}

const DEFAULT: Result<()> = Ok(());
pub trait Z3LogParser {
    fn newline(&mut self) {}

    /* Methods to handle each line case of Z3 logs.
     `l` is a line split with spaces as delimiters,
     and `l0` is the raw line (used only when )
    */
    fn version_info<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn mk_quant<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn mk_lambda<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn mk_var<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn mk_app<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn mk_proof<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn attach_meaning<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn attach_var_names<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn attach_enode<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn eq_expl<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn new_match<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn inst_discovered<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn end_of_instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn push<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn pop<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()>;
    fn eof(&mut self);

    // unused in original parser
    fn decide_and_or<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn decide<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn assign<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn begin_check<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn query_done<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn resolve_process<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn resolve_lit<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
    fn conflict<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        DEFAULT
    }
}

/// Type of solver and version number
#[derive(Debug, PartialEq, Default)]
pub enum VersionInfo {
    #[default]
    None,
    Present {
        solver: String,
        version: semver::Version,
    },
}
impl VersionInfo {
    pub fn solver(&self) -> Option<&str> {
        match self {
            VersionInfo::Present { solver, .. } => Some(solver),
            VersionInfo::None => None,
        }
    }
    pub fn version(&self) -> Option<&semver::Version> {
        match self {
            VersionInfo::Present { version, .. } => Some(version),
            VersionInfo::None => None,
        }
    }
    pub fn is_version(&self, major: u64, minor: u64, patch: u64) -> bool {
        self.version()
            .is_some_and(|v| v == &semver::Version::new(major, minor, patch))
    }

    pub fn is_version_minor(&self, major: u64, minor: u64) -> bool {
        self.version().is_some_and(|v| {
            &semver::Version::new(major, minor, 0) <= v
                && v <= &semver::Version::new(major, minor, u64::MAX)
        })
    }

    pub fn is_ge_version(&self, major: u64, minor: u64, patch: u64) -> bool {
        self.version()
            .is_some_and(|v| v >= &semver::Version::new(major, minor, patch))
    }

    pub fn is_le_version(&self, major: u64, minor: u64, patch: u64) -> bool {
        self.version()
            .is_some_and(|v| v <= &semver::Version::new(major, minor, patch))
    }
}
