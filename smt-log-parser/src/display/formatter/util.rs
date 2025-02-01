use core::ops::{Deref, DerefMut};
use std::hash::Hash;

use crate::FxHashMap;

use super::{TermDisplayContext, TermDisplayContextInner};

impl Deref for TermDisplayContext {
    type Target = TermDisplayContextInner;
    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl DerefMut for TermDisplayContext {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.inner
    }
}

/// A hash map wrapper which serializes as a vector
#[derive(Debug, Clone)]
pub(super) struct HashMapSerde<K, V>(FxHashMap<K, V>);

impl<K, V> Deref for HashMapSerde<K, V> {
    type Target = FxHashMap<K, V>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl<K, V> DerefMut for HashMapSerde<K, V> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl<K, V> Default for HashMapSerde<K, V> {
    fn default() -> Self {
        Self(FxHashMap::default())
    }
}

impl<K, V> PartialEq for HashMapSerde<K, V>
where
    FxHashMap<K, V>: PartialEq,
{
    fn eq(&self, other: &Self) -> bool {
        self.0 == other.0
    }
}
impl<K, V> Eq for HashMapSerde<K, V> where FxHashMap<K, V>: Eq {}

impl<K: Eq + Hash, V> From<Vec<(K, V)>> for HashMapSerde<K, V> {
    fn from(v: Vec<(K, V)>) -> Self {
        Self(v.into_iter().collect())
    }
}
