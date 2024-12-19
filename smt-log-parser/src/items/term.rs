#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BoxSlice, Error, FxHashMap, IString, NonMaxU32, Result, StringTable};

use super::{QuantIdx, TermIdx};

/// A Z3 term and associated data.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, PartialEq, Eq, Hash, Clone)]
pub struct Term {
    pub id: TermId,
    pub kind: TermKind,
    /// Takes up `2 * size_of::<usize>()` space and avoids heap allocation for
    /// lens <= 1.
    pub child_ids: BoxSlice<TermIdx>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
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
    pub fn is_var(&self) -> bool {
        matches!(self, Self::Var(_))
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
        let namespace = (hash_idx != 0).then(|| IString(strings.get_or_intern(&value[..hash_idx])));
        let id = &value[hash_idx + 1..];
        let id = match id {
            "" => None,
            id => Some(id.parse::<NonMaxU32>().map_err(Error::InvalidIdNumber)?),
        };
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
