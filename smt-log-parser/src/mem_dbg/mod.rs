mod r#impl;

use core::fmt;
use std::ops::{Deref, DerefMut};

use serde::{Deserialize, Serialize};
use typed_index_collections::TiVec as TiVecInner;

// TiVec

pub struct TiVec<K, V>(TiVecInner<K, V>);
impl<K, V> Deref for TiVec<K, V> {
    type Target = TiVecInner<K, V>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl<K, V> DerefMut for TiVec<K, V> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}
impl<K: fmt::Debug + From<usize>, V: fmt::Debug> fmt::Debug for TiVec<K, V> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.fmt(f)
    }
}
impl<K, V> Default for TiVec<K, V> {
    fn default() -> Self {
        Self(TiVecInner::default())
    }
}

// FxHashMap

#[derive(Debug, Clone)]
pub struct FxHashMap<K, V>(fxhash::FxHashMap<K, V>);
impl<K, V> Deref for FxHashMap<K, V> {
    type Target = fxhash::FxHashMap<K, V>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl<K, V> DerefMut for FxHashMap<K, V> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}
impl<K, V> Default for FxHashMap<K, V> {
    fn default() -> Self {
        Self(fxhash::FxHashMap::default())
    }
}

// StringTable

#[derive(Debug, Serialize, Deserialize)]
pub struct StringTable(lasso::Rodeo<lasso::Spur, fxhash::FxBuildHasher>);
impl Deref for StringTable {
    type Target = lasso::Rodeo<lasso::Spur, fxhash::FxBuildHasher>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl DerefMut for StringTable {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}
impl StringTable {
    pub fn with_hasher(hash_builder: fxhash::FxBuildHasher) -> Self {
        Self(lasso::Rodeo::with_hasher(hash_builder))
    }
}

// IString

#[derive(Debug, Clone, Copy, Default, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct IString(pub lasso::Spur);
impl Deref for IString {
    type Target = lasso::Spur;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl DerefMut for IString {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

// BoxSlice

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub struct BoxSlice<T>(pub Box<[T]>);
impl<T> Deref for BoxSlice<T> {
    type Target = [T];
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl<T> DerefMut for BoxSlice<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

// Graph


pub struct Graph<N, E, Ty = petgraph::Directed, Ix = petgraph::graph::DefaultIx>(pub petgraph::graph::Graph<N, E, Ty, Ix>);
pub type DiGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Directed, Ix>;
pub type UnGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Undirected, Ix>;
impl<N, E, Ty, Ix> Deref for Graph<N, E, Ty, Ix> {
    type Target = petgraph::graph::Graph<N, E, Ty, Ix>;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl<N, E, Ty, Ix> DerefMut for Graph<N, E, Ty, Ix> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}
impl<N, E, Ty: petgraph::EdgeType, Ix: petgraph::graph::IndexType> Graph<N, E, Ty, Ix> {
    pub fn with_capacity(nodes: usize, edges: usize) -> Self {
        Self(petgraph::graph::Graph::<N, E, Ty, Ix>::with_capacity(nodes, edges))
    }
}

impl<N, E, Ty, Ix> fmt::Debug for Graph<N, E, Ty, Ix>
where
    N: fmt::Debug,
    E: fmt::Debug,
    Ty: petgraph::EdgeType,
    Ix: petgraph::graph::IndexType,
{
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.fmt(f)
    }
}
