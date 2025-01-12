use core::{fmt, hash};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BoxSlice, Error, FxHashMap, IString, NonMaxU32, Result, StringTable};

use super::{QuantIdx, TermIdx};

/// A Z3 term and associated data.
#[derive(Clone)]
pub struct Term {
    pub id: TermId,
    /// Required such that `size_of::<Term>() == size_of::<AnyTerm>()` (rustc
    /// cannot use the padding from `TermInfo` to put the discriminant bits from
    /// `AnyTerm` but it can use the spare bits from this enum).
    _padding: Option<()>,
    info: TermInfo,
    kind: TermKindInner,
    /// Takes up `2 * size_of::<usize>()` space and avoids heap allocation for
    /// lens <= 1.
    pub child_ids: BoxSlice<TermIdx>,
}

impl Term {
    #[allow(clippy::no_effect)]
    pub(crate) const CHECK_SIZE: bool = {
        let sizeof_eq = core::mem::size_of::<Term>() == core::mem::size_of::<SafeTerm>();
        [(); 1][!sizeof_eq as usize];
        true
    };

    pub fn new(id: TermId, kind: TermKind, child_ids: BoxSlice<TermIdx>, has_var: bool) -> Self {
        let _ = Self::CHECK_SIZE;
        let mut info = TermInfo::default();
        if has_var {
            info |= TermInfo::HasVar;
        }
        let kind = match kind {
            TermKind::Var(var) => {
                info |= TermInfo::KindVar;
                TermKindInner { var }
            }
            TermKind::App(app) => {
                info |= TermInfo::KindApp;
                TermKindInner { app }
            }
            TermKind::Quant(quant) => TermKindInner { quant },
        };
        Self {
            id,
            _padding: None,
            info,
            kind,
            child_ids,
        }
    }

    pub fn kind(&self) -> TermKind {
        if self.info.contains(TermInfo::KindVar) {
            TermKind::Var(unsafe { self.kind.var })
        } else if self.info.contains(TermInfo::KindApp) {
            TermKind::App(unsafe { self.kind.app })
        } else {
            TermKind::Quant(unsafe { self.kind.quant })
        }
    }

    pub fn var_idx(&self) -> Option<u32> {
        self.kind().var()
    }
    pub fn app_name(&self) -> Option<IString> {
        self.kind().app()
    }
    pub fn quant_idx(&self) -> Option<QuantIdx> {
        self.kind().quant()
    }

    pub fn has_var(&self) -> bool {
        self.info.contains(TermInfo::HasVar)
    }

    /// Checks if this term can match another term. That is, if they have the
    /// same kind and the same number of children. The children may still be
    /// different.
    pub fn can_match(&self, other: &Self) -> bool {
        if self.kind() != other.kind() {
            return false;
        }
        if self.has_var() || other.has_var() {
            self.child_ids.len() == other.child_ids.len()
        } else {
            self.child_ids == other.child_ids
        }
    }

    fn as_safe(&self) -> SafeTerm {
        SafeTerm {
            id: self.id,
            kind: self.kind(),
            child_ids: &self.child_ids,
        }
    }
}

impl fmt::Debug for Term {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.as_safe().fmt(f)
    }
}
impl PartialEq for Term {
    fn eq(&self, other: &Self) -> bool {
        self.as_safe().eq(&other.as_safe())
    }
}
impl Eq for Term {}
impl hash::Hash for Term {
    fn hash<H: hash::Hasher>(&self, state: &mut H) {
        self.as_safe().hash(state)
    }
}

#[cfg(feature = "mem_dbg")]
impl MemSize for Term {
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        self.as_safe().mem_size(flags)
    }
}
#[cfg(feature = "mem_dbg")]
impl mem_dbg::CopyType for Term {
    type Copy = <SafeTerm<'static> as mem_dbg::CopyType>::Copy;
}
#[cfg(feature = "mem_dbg")]
impl mem_dbg::MemDbgImpl for Term {
    fn _mem_dbg_rec_on(
        &self,
        _writer: &mut impl core::fmt::Write,
        _total_size: usize,
        _max_depth: usize,
        _prefix: &mut String,
        _is_last: bool,
        _flags: mem_dbg::DbgFlags,
    ) -> core::fmt::Result {
        self.as_safe()
            ._mem_dbg_rec_on(_writer, _total_size, _max_depth, _prefix, _is_last, _flags)
    }
}

#[bitmask_enum::bitmask(u8)]
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Default)]
enum TermInfo {
    HasVar,
    KindVar,
    KindApp,
}

#[derive(Clone, Copy)]
union TermKindInner {
    var: u32,
    app: IString,
    quant: QuantIdx,
}

// Safe interface

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct SafeTerm<'a> {
    id: TermId,
    kind: TermKind,
    child_ids: &'a [TermIdx],
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
#[repr(u8)]
pub enum TermKind {
    Var(u32),
    App(IString),
    Quant(QuantIdx),
}

impl TermKind {
    pub(crate) fn parse_var(value: &str) -> Result<TermKind> {
        value
            .parse::<u32>()
            .map(TermKind::Var)
            .map_err(Error::InvalidVar)
    }
    fn var(&self) -> Option<u32> {
        match self {
            Self::Var(var) => Some(*var),
            _ => None,
        }
    }
    fn app(&self) -> Option<IString> {
        match self {
            Self::App(name) => Some(*name),
            _ => None,
        }
    }
    fn quant(&self) -> Option<QuantIdx> {
        match self {
            Self::Quant(idx) => Some(*idx),
            _ => None,
        }
    }
}

/// Represents an ID string of the form `name#id` or `name#`.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, Default, Hash, PartialEq, Eq)]
pub struct TermId {
    pub namespace: Option<IString>,
    pub id: Option<NonMaxU32>,
}
impl TermId {
    /// Splits an ID string into namespace and ID number.
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")
    pub fn parse(strings: &mut StringTable, value: &str) -> Result<Self> {
        let hash_idx = value.bytes().position(|b| b == b'#');
        let hash_idx = hash_idx.ok_or_else(|| Error::InvalidIdHash(value.to_string()))?;
        let (namespace, id) = value.split_at(hash_idx);
        let id = match &id[1..] {
            "" => None,
            id => Some(id.parse::<NonMaxU32>().map_err(Error::InvalidIdNumber)?),
        };
        let namespace = (!namespace.is_empty()).then(|| IString(strings.get_or_intern(namespace)));
        Ok(Self { namespace, id })
    }
    pub fn order(&self) -> u32 {
        self.id.map(|id| id.get() + 1).unwrap_or_default()
    }

    pub fn to_string_components<'a>(
        &self,
        strings: &'a StringTable,
    ) -> (&'a str, Option<NonMaxU32>) {
        let namespace = self.namespace.map(|ns| &strings[*ns]).unwrap_or_default();
        (namespace, self.id)
    }
    pub fn to_string(&self, strings: &StringTable) -> String {
        let (namespace, id) = self.to_string_components(strings);
        let id = id.map(|id| id.to_string()).unwrap_or_default();
        format!("{namespace}#{id}")
    }
}

/// Remapping from `TermId` to `TermIdx`. We want to have a single flat vector
/// of terms but `TermId`s don't map to this nicely, additionally the `TermId`s
/// may repeat and so we want to map to the latest current `TermIdx`. Has a
/// special fast path for the common empty namespace case.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct TermIdToIdxMap<K: Copy> {
    empty_namespace: Vec<Option<K>>,
    namespace_map: FxHashMap<IString, Vec<Option<K>>>,
}

impl<K: Copy> Default for TermIdToIdxMap<K> {
    fn default() -> Self {
        Self {
            empty_namespace: Vec::new(),
            namespace_map: FxHashMap::default(),
        }
    }
}

impl<K: Copy> TermIdToIdxMap<K> {
    fn get_vec_mut(&mut self, namespace: Option<IString>) -> Result<&mut Vec<Option<K>>> {
        if let Some(namespace) = namespace {
            self.namespace_map.try_reserve(1)?;
            Ok(self.namespace_map.entry(namespace).or_default())
        } else {
            // Special handling of common case for empty namespace
            Ok(&mut self.empty_namespace)
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
    fn get_vec(&self, namespace: Option<IString>) -> Option<&Vec<Option<K>>> {
        if let Some(namespace) = namespace {
            self.namespace_map.get(&namespace)
        } else {
            Some(&self.empty_namespace)
        }
    }
    pub fn get_term(&self, id: &TermId) -> Option<K> {
        self.get_vec(id.namespace)
            .and_then(|vec| vec.get(id.order() as usize).and_then(|x| x.as_ref()))
            .copied()
    }
}
