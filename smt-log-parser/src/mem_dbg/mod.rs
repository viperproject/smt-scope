#[cfg(feature = "mem_dbg")]
mod r#impl;
mod utils;

pub use utils::*;

use core::fmt;
use core::ops::{Deref, DerefMut};
use std::collections::hash_map::IntoValues;

macro_rules! derive_wrapper {
    ($head:ident $(:: $tail:ident)+ $(<$($t:ident$(= $default:ty)?),*>)? $(: $trait:ident $(+ $other:ident)*)?) => {
        derive_wrapper!( $head :: ; $($tail,)* $(<$($t$(= $default)?),*>)? $(: $trait $(+ $other)*)? );
    };
    ($($module:ident ::)+ ; $head:ident , $($tail:ident,)+ $($rest:tt)*) => {
        derive_wrapper!( $($module ::)* $head :: ; $($tail,)* $($rest)* );
    };
    ($($module:ident ::)* ; $struct:ident, $(<$($t:ident$(= $default:ty)?),*>)? $(: $trait:ident $(+ $other:ident)*)?) => {
        derive_wrapper!(
            $(#[derive($trait$(,$other)*)])?
            struct $struct$(<$($t$(= $default)?),*>)?($($module::)+$struct$(<$($t),*>)?);
        );
    };
    (
        #[derive(All$(,$d:ident)*)]
        struct $struct:ident$(<$($t:ident$(= $default:ty)?),*>)?($p:vis $inner:ty);
    ) => {
        derive_wrapper!(
            #[derive($($d),*)]
            struct $struct$(<$($t$(= $default)?),*>)?($p $inner);
        );
        impl$(<$($t),*>)? Default for $struct$(<$($t),*>)?
        where $inner: Default {
            fn default() -> Self {
                Self(Default::default())
            }
        }
        #[allow(clippy::non_canonical_partial_ord_impl)]
        impl$(<$($t),*>)? PartialOrd for $struct$(<$($t),*>)?
        where $inner: PartialOrd {
            fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
                self.0.partial_cmp(&other.0)
            }
        }
        impl$(<$($t),*>)? Ord for $struct$(<$($t),*>)?
        where $inner: Ord {
            fn cmp(&self, other: &Self) -> core::cmp::Ordering {
                self.0.cmp(&other.0)
            }
        }
        impl$(<$($t),*>)? core::hash::Hash for $struct$(<$($t),*>)?
        where $inner: core::hash::Hash {
            fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
                self.0.hash(state)
            }
        }
    };
    (
        $(#[derive($($d:ident),*)])?
        struct $struct:ident$(<$($t:ident$(= $default:ty)?),*>)?($p:vis $inner:ty);
    ) => {
        $(#[derive($($d),*)])?
        pub struct $struct$(<$($t$(= $default)?),*>)?($p $inner);
        impl$(<$($t),*>)? Deref for $struct$(<$($t),*>)? {
            type Target = $inner;
            fn deref(&self) -> &Self::Target {
                &self.0
            }
        }
        impl$(<$($t),*>)? DerefMut for $struct$(<$($t),*>)? {
            fn deref_mut(&mut self) -> &mut Self::Target {
                &mut self.0
            }
        }
        #[allow(clippy::non_canonical_clone_impl)]
        impl$(<$($t),*>)? Clone for $struct$(<$($t),*>)?
        where $inner: Clone {
            fn clone(&self) -> Self {
                Self(self.0.clone())
            }
        }
        impl$(<$($t),*>)? fmt::Debug for $struct$(<$($t),*>)?
        where $inner: fmt::Debug {
            fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
                self.0.fmt(f)
            }
        }
        impl$(<$($t),*>)? PartialEq for $struct$(<$($t),*>)?
        where $inner: PartialEq {
            fn eq(&self, other: &Self) -> bool {
                self.0 == other.0
            }
        }
        impl$(<$($t),*>)? Eq for $struct$(<$($t),*>)? where $inner: Eq {}
        #[cfg(feature = "serde")]
        impl$(<$($t),*>)? serde::Serialize for $struct$(<$($t),*>)?
        where $inner: serde::Serialize {
            fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
            where
                S: serde::Serializer,
            {
                self.0.serialize(serializer)
            }
        }
        #[cfg(feature = "serde")]
        impl<'de, $($($t),*)?> serde::Deserialize<'de> for $struct$(<$($t),*>)?
        where $inner: serde::Deserialize<'de> {
            fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
            where
                D: serde::Deserializer<'de>,
            {
                <$inner as serde::Deserialize<'de>>::deserialize(deserializer).map(Self)
            }
        }
        impl$(<$($t),*>)? From<$inner> for $struct$(<$($t),*>)? {
            fn from(inner: $inner) -> Self {
                Self(inner)
            }
        }
    };
}

macro_rules! derive_non_max {
    ($name:ident, $prim:ident) => {
        derive_wrapper!(nonmax::$name: All + Copy);
        impl $name {
            pub const ZERO: Self = Self(nonmax::$name::ZERO);
            pub const ONE: Self = Self(nonmax::$name::ONE);
            pub const MAX: Self = Self(nonmax::$name::MAX);
            pub const fn new(value: $prim) -> Option<Self> {
                match nonmax::$name::new(value) {
                    Some(value) => Some(Self(value)),
                    None => None,
                }
            }
            /// Creates a new non-max without checking the value.
            ///
            /// # Safety
            ///
            /// The value must not equal the maximum representable value for the
            /// primitive type.
            pub const unsafe fn new_unchecked(value: $prim) -> Self {
                Self(nonmax::$name::new_unchecked(value))
            }
            pub const fn get(self) -> $prim {
                self.0.get()
            }
        }
        impl fmt::Display for $name {
            fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
                self.0.fmt(f)
            }
        }
        impl core::str::FromStr for $name {
            type Err = <nonmax::$name as core::str::FromStr>::Err;
            fn from_str(s: &str) -> Result<Self, Self::Err> {
                nonmax::$name::from_str(s).map(Self)
            }
        }
    };
}

derive_non_max!(NonMaxU32, u32);
derive_non_max!(NonMaxUsize, usize);

// BigRational

derive_wrapper!(num::BigRational: All);

impl fmt::Display for BigRational {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.fmt(f)
    }
}

// BigUint

derive_wrapper!(num::BigUint: All);

impl fmt::Display for BigUint {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.fmt(f)
    }
}

// TiVec

derive_wrapper!(typed_index_collections::TiVec<K, V>: All);
impl<K, V> FromIterator<V> for TiVec<K, V> {
    fn from_iter<T: IntoIterator<Item = V>>(iter: T) -> Self {
        Self(typed_index_collections::TiVec::from_iter(iter))
    }
}
impl<K, V> std::iter::IntoIterator for TiVec<K, V> {
    type Item = <Self::IntoIter as std::iter::IntoIterator>::Item;
    type IntoIter = std::vec::IntoIter<V>;
    fn into_iter(self) -> Self::IntoIter {
        self.0.into_iter()
    }
}
impl<K: From<usize>, V> TiVec<K, V> {
    pub fn into_iter_enumerated(self) -> impl Iterator<Item = (K, V)> {
        self.0.into_iter_enumerated()
    }
}

// FxHashMap

derive_wrapper!(fxhash::FxHashMap<K, V>: All);
impl<K: Eq + std::hash::Hash, V> FromIterator<(K, V)> for FxHashMap<K, V> {
    fn from_iter<T: IntoIterator<Item = (K, V)>>(iter: T) -> Self {
        Self(fxhash::FxHashMap::from_iter(iter))
    }
}
impl<K, V> std::iter::IntoIterator for FxHashMap<K, V> {
    type Item = <Self::IntoIter as std::iter::IntoIterator>::Item;
    type IntoIter = std::collections::hash_map::IntoIter<K, V>;
    fn into_iter(self) -> Self::IntoIter {
        self.0.into_iter()
    }
}
impl<K, V> FxHashMap<K, V> {
    pub fn into_values(self) -> IntoValues<K, V> {
        self.0.into_values()
    }
}

// FxHashSet

derive_wrapper!(fxhash::FxHashSet<K>: All);
impl<K: Eq + std::hash::Hash> FromIterator<K> for FxHashSet<K> {
    fn from_iter<T: IntoIterator<Item = K>>(iter: T) -> Self {
        Self(fxhash::FxHashSet::from_iter(iter))
    }
}
impl<K> std::iter::IntoIterator for FxHashSet<K> {
    type Item = <Self::IntoIter as std::iter::IntoIterator>::Item;
    type IntoIter = std::collections::hash_set::IntoIter<K>;
    fn into_iter(self) -> Self::IntoIter {
        self.0.into_iter()
    }
}

// StringTable

derive_wrapper!(
    struct StringTable(lasso::Rodeo<lasso::Spur, fxhash::FxBuildHasher>);
);
impl StringTable {
    pub fn with_hasher(hash_builder: fxhash::FxBuildHasher) -> Self {
        Self(lasso::Rodeo::with_hasher(hash_builder))
    }
}

// IString

derive_wrapper!(
    #[derive(All, Copy)]
    struct IString(pub lasso::Spur);
);

// Graph

derive_wrapper!(petgraph::graph::Graph<N, E, Ty = petgraph::Directed, Ix = petgraph::graph::DefaultIx>: All);
pub type DiGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Directed, Ix>;
pub type UnGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Undirected, Ix>;
impl<N, E, Ty: petgraph::EdgeType, Ix: petgraph::graph::IndexType> Graph<N, E, Ty, Ix> {
    pub fn with_capacity(nodes: usize, edges: usize) -> Self {
        Self(petgraph::graph::Graph::<N, E, Ty, Ix>::with_capacity(
            nodes, edges,
        ))
    }
}
