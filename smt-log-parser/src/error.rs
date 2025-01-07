use core::fmt;
use std::{collections::TryReserveError, num::ParseIntError};

use lasso::LassoError;
#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::items::{BlameKind, ENodeIdx, Fingerprint, QuantIdx, TermId, TermIdx};

pub type Result<T> = std::result::Result<T, Error>;
pub type FResult<T> = std::result::Result<T, FatalError>;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Either<T, U> {
    Left(T),
    Right(U),
}
impl<T, U> Either<T, U> {
    pub fn into_result(self) -> std::result::Result<T, U> {
        match self {
            Self::Left(t) => Ok(t),
            Self::Right(u) => Err(u),
        }
    }
}

#[derive(Debug)]
pub enum Error {
    UnknownLine(String),
    UnexpectedNewline,
    ExpectedNewline(String),
    UnexpectedEnd,

    // Version
    InvalidVersion(semver::Error),

    // Id parsing
    InvalidIdNumber(nonmax::ParseIntError),
    InvalidIdHash(String),
    UnknownId(TermId),

    // Var parsing
    InvalidVar(ParseIntError),

    // Meaning parsing
    ParseBigUintError(num::bigint::ParseBigIntError),
    ParseError(String),

    // Quantifier
    VarNamesListInconsistent, // attach var names
    VarNamesNoBar,
    UnknownQuantifierIdx(TermIdx),
    NonNullLambdaName(String),
    InvalidQVarInteger(ParseIntError),
    NewMatchOnLambda(QuantIdx),
    UnknownPatternIdx(TermIdx),
    SubpatTooFewBlame(usize),
    // Z3 BUG: https://github.com/viperproject/axiom-profiler-2/issues/63
    SubpatUnknownBlame(String),

    // Inst discovered
    /// theory-solving non-rewrite axiom should blame valid enodes
    NonRewriteAxiomInvalidEnode(TermIdx),
    /// theory-solving rewrite axiom should only have one term
    RewriteAxiomMultipleTerms1(TermIdx),
    RewriteAxiomMultipleTerms2(Vec<BlameKind>),
    UnknownInstMethod(String),

    // Instance
    UnmatchedEndOfInstance,

    TupleMissingParens,
    UnequalTupleForms(u8, u8),

    // Fingerprint
    InvalidFingerprint(ParseIntError),
    UnknownFingerprint(Fingerprint),

    // Enode
    UnknownEnode(TermIdx),
    InvalidGeneration(nonmax::ParseIntError),
    EnodeRootMismatch(ENodeIdx, ENodeIdx),

    // Stack
    StackFrameNotPushed,
    PopConflictMismatch,
    InvalidFrameInteger(ParseIntError),

    // Proof
    ProvedVar(TermIdx),

    // CDCL
    NoConflict,
    BoolLiteral,
    BoolLiteralNotP,
    InvalidBoolLiteral(nonmax::ParseIntError),
    UnknownJustification(String),
    MissingColonJustification,

    // File IO
    FileRead(std::io::Error),

    Allocation(TryReserveError),
    Lasso(LassoError),

    /// Unused, kept for debugging to see error line instead of simply panicking
    /// at `debug_assert`.
    Debug,
}

impl From<semver::Error> for Error {
    fn from(err: semver::Error) -> Self {
        Self::InvalidVersion(err)
    }
}

impl From<TryReserveError> for Error {
    fn from(err: TryReserveError) -> Self {
        Self::Allocation(err)
    }
}

impl From<LassoError> for Error {
    fn from(value: LassoError) -> Self {
        Self::Lasso(value)
    }
}

impl Error {
    pub fn is_oom(&self) -> bool {
        matches!(self, Self::Allocation(_) | Self::Lasso(_))
    }

    pub fn as_fatal(self) -> Option<FatalError> {
        match self {
            Self::Allocation(alloc) => Some(FatalError::Allocation(alloc)),
            Self::Lasso(lasso) => Some(FatalError::Lasso(lasso)),
            _ => None,
        }
    }
}

#[derive(Debug, Clone)]
pub enum FatalError {
    Allocation(TryReserveError),
    Lasso(LassoError),
    Io(std::rc::Rc<std::io::Error>),
}

impl From<std::io::Error> for FatalError {
    fn from(err: std::io::Error) -> Self {
        Self::Io(std::rc::Rc::new(err))
    }
}

impl fmt::Display for FatalError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Allocation(alloc) => write!(f, "Allocation error: {alloc}"),
            Self::Lasso(lasso) => write!(f, "String interning error: {lasso}"),
            Self::Io(err) => write!(f, "IO error: {err}"),
        }
    }
}
