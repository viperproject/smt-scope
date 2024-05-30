use core::fmt;
use std::{collections::TryReserveError, num::ParseIntError};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::items::{BlameKind, ENodeIdx, Fingerprint, StackIdx, TermId, TermIdx};

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
    pub fn as_result(&self) -> std::result::Result<&T, &U> {
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
    InvalidIdNumber(ParseIntError),
    InvalidIdHash(String),
    UnknownId(TermId),

    // Var parsing
    InvalidVar(ParseIntError),

    // Quantifier
    VarNamesListInconsistent, // attach var names
    VarNamesNoBar,
    UnknownQuantifierIdx(TermIdx),

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
    EnodePoppedFrame(StackIdx),
    InvalidGeneration(ParseIntError),
    EnodeRootMismatch(ENodeIdx, ENodeIdx),

    // Stack
    StackFrameNotPushed,
    InvalidFrameInteger(ParseIntError),

    // File IO
    FileRead(std::io::Error),

    Allocation(TryReserveError),
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

impl Error {
    pub fn is_allocation(&self) -> bool {
        matches!(self, Self::Allocation(_))
    }

    pub fn as_fatal(self) -> Option<FatalError> {
        match self {
            Self::Allocation(alloc) => Some(FatalError::Allocation(alloc)),
            _ => None,
        }
    }
}

#[derive(Debug, Clone)]
pub enum FatalError {
    Allocation(TryReserveError),
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
            Self::Io(err) => write!(f, "IO error: {err}"),
        }
    }
}
