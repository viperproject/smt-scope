use std::{collections::TryReserveError, num::ParseIntError};

use crate::items::{TermId, TermIdx, StackIdx, ENodeIdx, BlameKind, Fingerprint};

pub type Result<T> = std::result::Result<T, Error>;
pub type FResult<T> = std::result::Result<T, FatalError>;

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
    pub fn as_fatal(self) -> Option<FatalError> {
        match self {
            Self::Allocation(alloc) => Some(FatalError::Allocation(alloc)),
            _ => None,
        }
    }
}

#[derive(Debug)]
pub enum FatalError {
    Allocation(TryReserveError),
}
