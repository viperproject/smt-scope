#[cfg(feature = "mem_dbg")]
mod r#impl;

use core::fmt;
use std::ops::{Deref, DerefMut};

macro_rules! derive_wrapper {
    ($head:ident $(:: $tail:ident)+ $(<$($rest1:tt)*)? $(: $($rest2:tt)*)?) => {
        derive_wrapper!( $head :: ; $($tail,)* $(<$($rest1)*)? $(: $($rest2)*)? );
    };
    ($($module:ident ::)+ ; $head:ident , $($tail:ident,)+ $($rest:tt)*) => {
        derive_wrapper!( $($module ::)* $head :: ; $($tail,)* $($rest)* );
    };
    ($($module:ident ::)+ ; $struct:ident, $(<$($t:ident$(= $default:ty)?),*>)? $(: $trait:ident $(+ $other:ident)*)?) => {
        derive_wrapper!(
            $(#[derive($trait$(,$other)*)])?
            struct $struct$(<$($t$(= $default)?),*>)?($($module::)+$struct$(<$($t),*>)?);
        );
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
    };
}

macro_rules! derive_non_max {
    ($name:ident, $prim:ident) => {
        derive_wrapper!(nonmax::$name: Copy + Eq + PartialEq + PartialOrd + Ord + Hash + Default);
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
    };
}

derive_non_max!(NonMaxU32, u32);
derive_non_max!(NonMaxUsize, usize);

// TiVec

derive_wrapper!(typed_index_collections::TiVec<K, V>);
impl<K, V> Default for TiVec<K, V> {
    fn default() -> Self {
        Self(typed_index_collections::TiVec::default())
    }
}

// FxHashMap

derive_wrapper!(fxhash::FxHashMap<K, V>);
impl<K, V> Default for FxHashMap<K, V> {
    fn default() -> Self {
        Self(fxhash::FxHashMap::default())
    }
}

// StringTable

derive_wrapper!(
    // #[derive(Default)]
    struct StringTable(lasso::Rodeo<lasso::Spur, fxhash::FxBuildHasher>);
);
impl StringTable {
    pub fn with_hasher(hash_builder: fxhash::FxBuildHasher) -> Self {
        Self(lasso::Rodeo::with_hasher(hash_builder))
    }
}

// IString

derive_wrapper!(
    #[derive(Copy, Default, PartialEq, Eq, Hash)]
    struct IString(pub lasso::Spur);
);

// BoxSlice

derive_wrapper!(
    #[derive(PartialEq)]
    struct BoxSlice<T>(pub Box<[T]>);
);
impl<T> BoxSlice<T> {
    pub fn as_slice(&self) -> &[T] {
        &self.0
    }
}

// Graph

derive_wrapper!(petgraph::graph::Graph<N, E, Ty = petgraph::Directed, Ix = petgraph::graph::DefaultIx>);
pub type DiGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Directed, Ix>;
pub type UnGraph<N, E, Ix = petgraph::graph::DefaultIx> = Graph<N, E, petgraph::Undirected, Ix>;
impl<N, E, Ty: petgraph::EdgeType, Ix: petgraph::graph::IndexType> Graph<N, E, Ty, Ix> {
    pub fn with_capacity(nodes: usize, edges: usize) -> Self {
        Self(petgraph::graph::Graph::<N, E, Ty, Ix>::with_capacity(
            nodes, edges,
        ))
    }
}
