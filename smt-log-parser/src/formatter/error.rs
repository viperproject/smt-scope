use super::{ConstSplit, Matcher, Formatter};

#[derive(Debug)]
pub enum ConversionError {
    Regex(regex::Error),
    FormatterExpectsRegex(Matcher, Formatter),
    RegexNotEnoughCaptures(Matcher, Formatter),
    MatcherError(MatcherParseError),
}

impl From<regex::Error> for ConversionError {
    fn from(err: regex::Error) -> Self {
        Self::Regex(err)
    }
}

impl From<MatcherParseError> for ConversionError {
    fn from(err: MatcherParseError) -> Self {
        Self::MatcherError(err)
    }
}

pub type FormatterParseError = ParseError<FormatterError>;
pub type MatcherParseError = ParseError<MatcherError>;

#[derive(Debug)]
pub struct ParseError<T> {
    pub s: String,
    pub kind: T,
}

impl<T> From<ParseErrorConst<'_, T>> for ParseError<T> {
    fn from(err: ParseErrorConst<'_, T>) -> Self {
        Self { s: err.s.to_owned(), kind: err.kind }
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

#[derive(Debug)]
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
        [()][!error as usize];
        loop {}
    }
}

impl<'a> ParseErrorConst<'a, FormatterError> {
    pub(super) const fn missing_hash(s: &'a str) -> Self {
        Self { s, kind: FormatterError::MissingHash }
    }
    pub(super) const fn invalid_number(s: &'a str) -> Self {
        Self { s, kind: FormatterError::InvalidNumber }
    }
    pub(super) const fn missing_range(s: &'a str) -> Self {
        Self { s, kind: FormatterError::MissingRange }
    }
    pub(super) const fn missing_control(s: &'a str, expected: &'static str) -> Self {
        Self { s, kind: FormatterError::MissingControl(expected) }
    }
    pub(super) const fn too_many_control(split: ConstSplit<'a, 1>) -> Self {
        Self { s: split.remainder(), kind: FormatterError::TooManyControl(split.control()) }
    }
    pub(super) const fn unexpected_pair(s: &'a str) -> Self {
        Self { s, kind: FormatterError::UnexpectedPair }
    }
    pub(super) const fn incorrect_control(s: &'a str) -> Self {
        Self { s, kind: FormatterError::IncorrectControl }
    }
    pub(super) const fn capture_overflow(s: &'a str) -> Self {
        Self { s, kind: FormatterError::CaptureOverflow }
    }
}

#[derive(Debug)]
pub enum MatcherError {
    InvalidChildrenSpec,
}

impl MatcherError {
    pub const fn const_error<T>(&self, error: bool) -> T {
        use MatcherError::*;
        match self {
            InvalidChildrenSpec => [()][error as usize],
        };
        [()][!error as usize];
        loop {}
    }
}

impl<'a> ParseErrorConst<'a, MatcherError> {
    pub(super) const fn invalid_children_spec(s: &'a str) -> Self {
        Self { s, kind: MatcherError::InvalidChildrenSpec }
    }
}

pub enum EitherError {
    Formatter(FormatterError),
    Matcher(MatcherError),
    InvalidCapture,
}

impl EitherError {
    pub const fn const_error<T>(&self, error: bool) -> T {
        use EitherError::*;
        match self {
            Formatter(err) => err.const_error(error),
            Matcher(err) => err.const_error(error),
            InvalidCapture => [()][error as usize],
        };
        [()][!error as usize];
        loop {}
    }
}

impl<'a> ParseErrorConst<'a, EitherError> {
    pub(super) const fn formatter(err: ParseErrorConst<'a, FormatterError>) -> Self {
        Self { s: err.s, kind: EitherError::Formatter(err.kind) }
    }
    pub(super) const fn matcher(err: ParseErrorConst<'a, MatcherError>) -> Self {
        Self { s: err.s, kind: EitherError::Matcher(err.kind) }
    }

    pub(super) const fn invalid_capture(s: &'a str) -> Self {
        Self { s, kind: EitherError::InvalidCapture }
    }
}
