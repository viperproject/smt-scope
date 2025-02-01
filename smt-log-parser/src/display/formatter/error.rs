use crate::NonMaxU32;

use super::{ConstSplit, Formatter, Matcher};

#[derive(Debug, Clone)]
pub enum TdcError {
    DuplicateMatcher(Matcher),
}

#[derive(Debug, Clone)]
pub enum FallbackParseError {
    MaxCaptureTooLarge(NonMaxU32),
    FormatterParseError(FormatterParseError),
}

#[derive(Debug)]
pub enum ConversionError {
    FormatterExpectsRegex(Matcher, Formatter),
    RegexNotEnoughCaptures(Matcher, Formatter),
}

pub type FormatterParseError = ParseError<FormatterError>;
pub type MatcherParseError = ParseError<MatcherError>;
pub type ParseErr = ParseError<EitherError>;

#[derive(Debug, Clone)]
pub struct ParseError<T> {
    pub s: String,
    pub kind: T,
}

impl<T> From<ParseErrorConst<'_, T>> for ParseError<T> {
    fn from(err: ParseErrorConst<'_, T>) -> Self {
        Self {
            s: err.s.to_owned(),
            kind: err.kind,
        }
    }
}

pub type ResultFormatterConst<'a, T> = Result<T, ParseErrorConst<'a, FormatterError>>;
pub type ResultMatcherConst<'a, T> = Result<T, ParseErrorConst<'a, MatcherError>>;
pub type ResultConst<'a, T> = Result<T, ParseErrorConst<'a, EitherError>>;

#[derive(Debug)]
pub struct ParseErrorConst<'a, T> {
    pub s: &'a str,
    pub kind: T,
}

#[derive(Debug, Clone)]
pub enum FormatterError {
    MissingHash,
    MissingRange,
    MissingControl(&'static str),
    TooManyControl(char),
    UnexpectedPair,
    IncorrectControl,
    InvalidNumber,
    CaptureOverflow,
}

impl FormatterError {
    #[allow(clippy::no_effect)]
    pub const fn const_error<T>(&self, error: bool) -> T {
        use FormatterError::*;
        match self {
            MissingHash => [()][error as usize],
            MissingRange => [()][error as usize],
            MissingControl(_) => [()][error as usize],
            TooManyControl(_) => [()][error as usize],
            UnexpectedPair => [()][error as usize],
            IncorrectControl => [()][error as usize],
            InvalidNumber => [()][error as usize],
            CaptureOverflow => [()][error as usize],
        };
        loop {
            [()][!error as usize];
        }
    }
}

impl<'a> ParseErrorConst<'a, FormatterError> {
    pub(super) const fn missing_hash(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::MissingHash,
        }
    }
    pub(super) const fn invalid_number(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::InvalidNumber,
        }
    }
    pub(super) const fn missing_range(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::MissingRange,
        }
    }
    pub(super) const fn missing_control(s: &'a str, expected: &'static str) -> Self {
        Self {
            s,
            kind: FormatterError::MissingControl(expected),
        }
    }
    pub(super) const fn too_many_control(split: ConstSplit<'a, 1>) -> Self {
        Self {
            s: split.remainder(),
            kind: FormatterError::TooManyControl(split.control()),
        }
    }
    pub(super) const fn unexpected_pair(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::UnexpectedPair,
        }
    }
    pub(super) const fn incorrect_control(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::IncorrectControl,
        }
    }
    pub(super) const fn capture_overflow(s: &'a str) -> Self {
        Self {
            s,
            kind: FormatterError::CaptureOverflow,
        }
    }
}

#[derive(Debug, Clone)]
pub enum MatcherError {
    MissingName,
    InvalidEnd,
    RegexError(regex::Error),
}

impl<'a> ParseErrorConst<'a, MatcherError> {
    pub(super) const fn missing_name(s: &'a str) -> Self {
        Self {
            s,
            kind: MatcherError::MissingName,
        }
    }
    pub(super) const fn invalid_end(s: &'a str) -> Self {
        Self {
            s,
            kind: MatcherError::InvalidEnd,
        }
    }
    pub(super) const fn regex(s: &'a str, e: regex::Error) -> Self {
        Self {
            s,
            kind: MatcherError::RegexError(e),
        }
    }
}

#[derive(Debug)]
pub enum EitherError {
    Formatter(FormatterError),
    Matcher(MatcherError),
    InvalidCapture,
    ConversionError(ConversionError),
}

impl<'a> ParseErrorConst<'a, EitherError> {
    pub(super) const fn formatter(err: ParseErrorConst<'a, FormatterError>) -> Self {
        Self {
            s: err.s,
            kind: EitherError::Formatter(err.kind),
        }
    }
    pub(super) fn matcher(err: ParseErrorConst<'a, MatcherError>) -> Self {
        Self {
            s: err.s,
            kind: EitherError::Matcher(err.kind),
        }
    }

    pub(super) const fn invalid_capture(s: &'a str) -> Self {
        Self {
            s,
            kind: EitherError::InvalidCapture,
        }
    }
    pub(super) fn formatter_nc(s: &'a str, err: ParseError<FormatterError>) -> Self {
        Self {
            s,
            kind: EitherError::Formatter(err.kind),
        }
    }
    pub(super) const fn conversion(s: &'a str, err: ConversionError) -> Self {
        Self {
            s,
            kind: EitherError::ConversionError(err),
        }
    }
}
