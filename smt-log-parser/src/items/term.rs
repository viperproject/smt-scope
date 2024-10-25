#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{Error, FxHashMap, IString, NonMaxU32, Result, StringTable};

use super::{ProofIdx, QuantIdx, TermIdx};

/// A Z3 term and associated data.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct Term {
    pub id: Option<TermId>,
    pub kind: TermKind,
    // Reduces memory usage compared to a Vec
    pub child_ids: Box<[TermIdx]>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TermKind {
    Var(usize),
    App(IString),
    Quant(QuantIdx),
    Generalised,
}

impl TermKind {
    pub(crate) fn parse_var(value: &str) -> Result<TermKind> {
        value
            .parse::<usize>()
            .map(TermKind::Var)
            .map_err(Error::InvalidVar)
    }
    pub fn quant_idx(&self) -> Option<QuantIdx> {
        match self {
            Self::Quant(idx) => Some(*idx),
            _ => None,
        }
    }
    pub fn app_name(&self) -> Option<IString> {
        match self {
            Self::App(name) => Some(*name),
            _ => None,
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Clone, Copy, Hash)]
pub struct Meaning {
    /// The theory in which the value should be interpreted (e.g. `bv`)
    pub theory: IString,
    /// The value of the term (e.g. `#x0000000000000001` or `#b1`)
    pub value: IString,
}

/// Returned when indexing with `TermIdx`
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, PartialEq, Eq, Clone, Hash)]
pub struct TermAndMeaning<'a> {
    pub term: &'a Term,
    pub meaning: Option<&'a Meaning>,
}

/// A Z3 quantifier and associated data.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub struct Quantifier {
    pub kind: QuantKind,
    pub num_vars: usize,
    pub term: TermIdx,
    pub vars: Option<VarNames>,
}

/// Represents an ID string of the form `name!id`.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub enum QuantKind {
    Lambda(Box<[ProofIdx]>),
    NamedQuant(IString),
    /// Represents a name string of the form `name!id`
    UnnamedQuant {
        name: IString,
        id: usize,
    },
}

impl QuantKind {
    /// Splits an ID string into name and ID number (if unnamed).
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")    
    pub(crate) fn parse(strings: &mut StringTable, value: &str) -> Self {
        let mut split = value.split('!');
        let name = split.next().expect(value);
        split
            .next()
            .and_then(|id| id.parse::<usize>().ok())
            .map(|id| Self::UnnamedQuant {
                name: IString(strings.get_or_intern(name)),
                id,
            })
            .unwrap_or_else(|| Self::NamedQuant(IString(strings.get_or_intern(value))))
    }
    pub fn user_name(&self) -> Option<IString> {
        match self {
            Self::NamedQuant(name) => Some(*name),
            _ => None,
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub enum VarNames {
    TypeOnly(Box<[IString]>),
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

/// Represents an ID string of the form `name#id` or `name#`.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, Default, Hash, PartialEq, Eq)]
pub struct TermId {
    pub namespace: IString,
    pub id: Option<NonMaxU32>,
}
impl TermId {
    /// Splits an ID string into namespace and ID number.
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")
    pub fn parse(strings: &mut StringTable, value: &str) -> Result<Self> {
        let hash_idx = value.bytes().position(|b| b == b'#');
        let hash_idx = hash_idx.ok_or_else(|| Error::InvalidIdHash(value.to_string()))?;
        let namespace = IString(strings.get_or_intern(&value[..hash_idx]));
        let id = &value[hash_idx + 1..];
        let id = match id {
            "" => None,
            id => Some(NonMaxU32::new(id.parse::<u32>().map_err(Error::InvalidIdNumber)?).unwrap()),
        };
        Ok(Self { namespace, id })
    }
    pub fn order(&self) -> u32 {
        self.id.map(|id| id.get() + 1).unwrap_or_default()
    }
}

/// Remapping from `TermId` to `TermIdx`. We want to have a single flat vector
/// of terms but `TermId`s don't map to this nicely, additionally the `TermId`s
/// may repeat and so we want to map to the latest current `TermIdx`. Has a
/// special fast path for the common empty namespace case.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct TermIdToIdxMap<K: Copy> {
    empty_string: IString,
    empty_namespace: Vec<Option<K>>,
    namespace_map: FxHashMap<IString, Vec<Option<K>>>,
}
impl<K: Copy> TermIdToIdxMap<K> {
    pub fn new(strings: &mut StringTable) -> Self {
        Self {
            empty_string: IString(strings.get_or_intern_static("")),
            empty_namespace: Vec::new(),
            namespace_map: FxHashMap::default(),
        }
    }
    fn get_vec_mut(&mut self, namespace: IString) -> Result<&mut Vec<Option<K>>> {
        if self.empty_string == namespace {
            // Special handling of common case for empty namespace
            Ok(&mut self.empty_namespace)
        } else {
            self.namespace_map.try_reserve(1)?;
            Ok(self.namespace_map.entry(namespace).or_default())
        }
    }
    pub fn register_term(&mut self, id: TermId, idx: K) -> Result<()> {
        let id_idx = id.order() as usize;
        let vec = self.get_vec_mut(id.namespace)?;
        if id_idx >= vec.len() {
            let new_len = id_idx + 1;
            vec.try_reserve(new_len - vec.len())?;
            vec.resize(new_len, None);
        }
        // The `id` of two different terms may clash and so we may remove
        // a `TermIdx` from the map. This is fine since we want future uses of
        // `id` to refer to the new term and not the old one.
        vec[id_idx].replace(idx);
        Ok(())
    }
    fn get_vec(&self, namespace: IString) -> Option<&Vec<Option<K>>> {
        if self.empty_string == namespace {
            Some(&self.empty_namespace)
        } else {
            self.namespace_map.get(&namespace)
        }
    }
    pub fn get_term(&self, id: &TermId) -> Option<K> {
        self.get_vec(id.namespace)
            .and_then(|vec| vec.get(id.order() as usize).and_then(|x| x.as_ref()))
            .copied()
    }
}
