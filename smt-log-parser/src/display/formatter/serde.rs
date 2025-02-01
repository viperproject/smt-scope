use std::hash::Hash;

use super::{util::HashMapSerde, RegexMatcher, TermDisplayContext, TermDisplayContextInner};

impl serde::Serialize for TermDisplayContext {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        let inner: &TermDisplayContextInner = self;
        inner.serialize(serializer)
    }
}
impl<'de> serde::Deserialize<'de> for TermDisplayContext {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let inner: TermDisplayContextInner = serde::Deserialize::deserialize(deserializer)?;
        Ok(Self::from_inner(inner))
    }
}

impl<K, V> serde::Serialize for HashMapSerde<K, V>
where
    for<'a> Vec<(&'a K, &'a V)>: serde::Serialize,
{
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        self.iter().collect::<Vec<_>>().serialize(serializer)
    }
}
impl<'de, K: Eq + Hash, V> serde::Deserialize<'de> for HashMapSerde<K, V>
where
    Vec<(K, V)>: serde::Deserialize<'de>,
{
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let inner: Vec<(K, V)> = serde::Deserialize::deserialize(deserializer)?;
        Ok(Self::from(inner))
    }
}

impl serde::Serialize for RegexMatcher {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        let original: &String = self.original();
        original.serialize(serializer)
    }
}
impl<'de> serde::Deserialize<'de> for RegexMatcher {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let s: String = serde::Deserialize::deserialize(deserializer)?;
        RegexMatcher::new(s).map_err(serde::de::Error::custom)
    }
}
