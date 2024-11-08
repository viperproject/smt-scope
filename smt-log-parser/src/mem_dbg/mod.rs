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
impl<K, V> FromIterator<V> for TiVec<K, V> {
    fn from_iter<T: IntoIterator<Item = V>>(iter: T) -> Self {
        Self(typed_index_collections::TiVec::from_iter(iter))
    }
}

// FxHashMap

derive_wrapper!(fxhash::FxHashMap<K, V>);
impl<K, V> Default for FxHashMap<K, V> {
    fn default() -> Self {
        Self(fxhash::FxHashMap::default())
    }
}
impl<K: Eq + std::hash::Hash, V> FromIterator<(K, V)> for FxHashMap<K, V> {
    fn from_iter<T: IntoIterator<Item = (K, V)>>(iter: T) -> Self {
        Self(fxhash::FxHashMap::from_iter(iter))
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

// BoxSlice

#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum BoxSlice<T> {
    Large(BoxSliceU32<T>),
    Small(T),
}
impl<T> Default for BoxSlice<T> {
    fn default() -> Self {
        Self::Large(Default::default())
    }
}
impl<T> Deref for BoxSlice<T> {
    type Target = [T];
    fn deref(&self) -> &Self::Target {
        match self {
            Self::Large(slice) => slice,
            Self::Small(slice) => core::slice::from_ref(slice),
        }
    }
}
impl<T> DerefMut for BoxSlice<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        match self {
            Self::Large(slice) => slice,
            Self::Small(slice) => core::slice::from_mut(slice),
        }
    }
}
impl<T> FromIterator<T> for BoxSlice<T> {
    fn from_iter<I: IntoIterator<Item = T>>(iter: I) -> Self {
        assert!(Self::CHECK_T_SMALL);
        let mut iter = iter.into_iter();
        let Some(first) = iter.next() else {
            return Self::default();
        };
        match iter.next() {
            None => Self::Small(first),
            Some(second) => {
                let large = [first, second]
                    .into_iter()
                    .chain(iter)
                    .collect::<Box<[_]>>()
                    .into();
                Self::Large(large)
            }
        }
    }
}
impl<T> From<Vec<T>> for BoxSlice<T> {
    fn from(vec: Vec<T>) -> Self {
        assert!(Self::CHECK_T_SMALL);
        match vec.len() {
            1 => Self::Small(vec.into_iter().next().unwrap()),
            _ => Self::Large(vec.into_boxed_slice().into()),
        }
    }
}
impl<T, const N: usize> From<[T; N]> for BoxSlice<T> {
    fn from(array: [T; N]) -> Self {
        assert!(Self::CHECK_T_SMALL);
        array.into_iter().collect()
    }
}

impl<T> BoxSlice<T> {
    #[allow(clippy::no_effect)]
    const CHECK_T_SMALL: bool = {
        let is_t_small = core::mem::size_of::<T>() <= core::mem::size_of::<usize>();
        [(); 1][!is_t_small as usize]; // `size_of::<T>() > size_of::<usize>()`!
        let is_no_ovhd = core::mem::size_of::<BoxSlice<T>>() == core::mem::size_of::<Box<[T]>>();
        [(); 1][!is_no_ovhd as usize]; // `size_of::<BoxSlice<T>>() == size_of::<Box<[T]>>()`!
        true
    };
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct BoxSliceU32<T> {
    ptr: core::ptr::NonNull<T>,
    len: u32,
}

impl<T> Default for BoxSliceU32<T> {
    fn default() -> Self {
        let self_ = Box::<[T]>::default();
        self_.into()
    }
}

impl<T> From<Box<[T]>> for BoxSliceU32<T> {
    fn from(slice: Box<[T]>) -> Self {
        let slice = Box::leak(slice);
        let ptr = core::ptr::NonNull::new(slice.as_mut_ptr()).unwrap();
        assert!(slice.len() <= u32::MAX as usize);
        let len = slice.len() as u32;
        Self { ptr, len }
    }
}

impl<T> From<BoxSliceU32<T>> for Box<[T]> {
    fn from(slice: BoxSliceU32<T>) -> Self {
        let slice = core::ptr::slice_from_raw_parts_mut(slice.ptr.as_ptr(), slice.len as usize);
        unsafe { Box::from_raw(slice) }
    }
}

impl<T> Deref for BoxSliceU32<T> {
    type Target = [T];
    fn deref(&self) -> &Self::Target {
        unsafe { core::slice::from_raw_parts(self.ptr.as_ptr(), self.len as usize) }
    }
}

impl<T> DerefMut for BoxSliceU32<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { core::slice::from_raw_parts_mut(self.ptr.as_ptr(), self.len as usize) }
    }
}

#[cfg(feature = "serde")]
impl<T> serde::Serialize for BoxSliceU32<T>
where
    T: serde::Serialize,
{
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        let self_: &[T] = self;
        self_.serialize(serializer)
    }
}

#[cfg(feature = "serde")]
impl<'de, T> serde::Deserialize<'de> for BoxSliceU32<T>
where
    T: serde::Deserialize<'de>,
{
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: serde::Deserializer<'de>,
    {
        let self_ = Box::<[T]>::deserialize(deserializer)?;
        Ok(self_.into())
    }
}
