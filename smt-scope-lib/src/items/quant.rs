use std::{
    borrow::Cow,
    ops::{Index, IndexMut},
};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BoxSlice, IString, NonMaxU32, StringTable, TiVec};

use super::{PatternIdx, ProofIdx, QuantIdx, TermIdx};

/// A Z3 quantifier and associated data.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub struct Quantifier {
    pub kind: QuantKind,
    pub num_vars: NonMaxU32,
    pub term: TermIdx,
    pub vars: Option<VarNames>,
}

impl Quantifier {
    pub fn is_lambda(&self) -> bool {
        matches!(self.kind, QuantKind::Lambda(_))
    }
}

/// Represents an ID string of the form `name!id`.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum QuantKind {
    Lambda(BoxSlice<ProofIdx>),
    NamedQuant(IString),
    /// Represents a name string of the form `name!id`
    UnnamedQuant {
        name: IString,
        id: usize,
    },
}

impl QuantKind {
    pub(crate) fn parse(strings: &mut StringTable, value: &str) -> Self {
        match QuantKindParse::parse(value) {
            QuantKindParse::Named(name) => Self::NamedQuant(IString(strings.get_or_intern(name))),
            QuantKindParse::Unnamed { name, id } => Self::UnnamedQuant {
                name: IString(strings.get_or_intern(name)),
                id,
            },
        }
    }

    pub fn parse_existing(strings: &StringTable, value: &str) -> Option<Self> {
        match QuantKindParse::parse(value) {
            QuantKindParse::Named(name) => Some(Self::NamedQuant(IString(strings.get(name)?))),
            QuantKindParse::Unnamed { name, id } => Some(Self::UnnamedQuant {
                name: IString(strings.get(name)?),
                id,
            }),
        }
    }

    pub fn user_name(&self) -> Option<IString> {
        match self {
            Self::NamedQuant(name) => Some(*name),
            _ => None,
        }
    }

    pub fn name<'a>(&self, strings: &'a StringTable) -> Option<Cow<'a, str>> {
        match self {
            Self::NamedQuant(name) => Some(Cow::Borrowed(&strings[**name])),
            Self::UnnamedQuant { name, id } => {
                Some(Cow::Owned(format!("{}!{id}", &strings[**name])))
            }
            Self::Lambda(_) => None,
        }
    }
}

enum QuantKindParse<'a> {
    Named(&'a str),
    Unnamed { name: &'a str, id: usize },
}

impl<'a> QuantKindParse<'a> {
    /// Splits an ID string into name and ID number (if unnamed).
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")
    fn parse(value: &'a str) -> Self {
        let mut split = value.split('!');
        let name = split.next().expect(value);
        split
            .next()
            .and_then(|id| id.parse::<usize>().ok())
            .map_or(Self::Named(value), |id| Self::Unnamed { name, id })
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub enum VarNames {
    TypeOnly(BoxSlice<IString>),
    NameAndType(Box<[(IString, IString)]>),
}
impl VarNames {
    pub fn get_type<'a>(
        strings: &'a StringTable,
        this: Option<&Self>,
        idx: usize,
    ) -> Option<&'a str> {
        this.as_ref().map(|this| {
            let ty = match this {
                Self::TypeOnly(names) => names[idx],
                Self::NameAndType(names) => names[idx].1,
            };
            &strings[*ty]
        })
    }

    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }
    pub fn len(&self) -> usize {
        match self {
            Self::TypeOnly(names) => names.len(),
            Self::NameAndType(names) => names.len(),
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct QuantPat {
    pub quant: QuantIdx,
    pub pat: Option<PatternIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct QuantPatVec<T>(pub TiVec<QuantIdx, PatVec<T>>);

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub struct PatVec<T> {
    pub(crate) mbqi: T,
    pub(crate) pats: TiVec<PatternIdx, T>,
}

impl<T> Index<QuantPat> for QuantPatVec<T> {
    type Output = T;
    fn index(&self, index: QuantPat) -> &Self::Output {
        &self.0[index.quant][index.pat]
    }
}

impl<T> IndexMut<QuantPat> for QuantPatVec<T> {
    fn index_mut(&mut self, index: QuantPat) -> &mut Self::Output {
        &mut self.0[index.quant][index.pat]
    }
}

impl<T> QuantPatVec<T> {
    pub fn iter_enumerated(&self) -> impl Iterator<Item = (QuantPat, &T)> {
        let quants = self.0.iter_enumerated();
        quants.flat_map(move |(quant, data)| {
            data.iter_enumerated()
                .map(move |(pat, data)| (QuantPat { quant, pat }, data))
        })
    }
}

impl<T> Index<Option<PatternIdx>> for PatVec<T> {
    type Output = T;
    fn index(&self, index: Option<PatternIdx>) -> &Self::Output {
        if let Some(pattern) = index {
            &self.pats[pattern]
        } else {
            &self.mbqi
        }
    }
}

impl<T> IndexMut<Option<PatternIdx>> for PatVec<T> {
    fn index_mut(&mut self, index: Option<PatternIdx>) -> &mut Self::Output {
        if let Some(pattern) = index {
            &mut self.pats[pattern]
        } else {
            &mut self.mbqi
        }
    }
}

impl<T> PatVec<T> {
    pub fn iter_enumerated(&self) -> impl Iterator<Item = (Option<PatternIdx>, &T)> {
        let mbqi = core::iter::once((None, &self.mbqi));
        let pats = self.pats.iter_enumerated();
        let pats = pats.map(|(pat, data)| (Some(pat), data));
        mbqi.chain(pats)
    }
}
