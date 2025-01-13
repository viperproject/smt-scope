#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use core::{
    hash::{Hash, Hasher},
    ops::{Deref, DerefMut},
};

use super::{FxHashMap, TiVec};

// BoxSlice

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone)]
pub enum BoxSlice<T> {
    Large(Box<[T]>),
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
                let large = [first, second].into_iter().chain(iter).collect();
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
            _ => Self::Large(vec.into_boxed_slice()),
        }
    }
}
impl<T, const N: usize> From<[T; N]> for BoxSlice<T> {
    fn from(array: [T; N]) -> Self {
        assert!(Self::CHECK_T_SMALL);
        array.into_iter().collect()
    }
}

impl<T> From<BoxSlice<T>> for Vec<T> {
    fn from(slice: BoxSlice<T>) -> Self {
        match slice {
            BoxSlice::Large(slice) => slice.into_vec(),
            BoxSlice::Small(slice) => vec![slice],
        }
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
impl<T> core::borrow::Borrow<[T]> for BoxSlice<T> {
    fn borrow(&self) -> &[T] {
        self
    }
}
impl<T> core::borrow::BorrowMut<[T]> for BoxSlice<T> {
    fn borrow_mut(&mut self) -> &mut [T] {
        self
    }
}

impl<T> PartialEq for BoxSlice<T>
where
    [T]: PartialEq,
{
    fn eq(&self, other: &Self) -> bool {
        (**self).eq(&**other)
    }
}
impl<T> Eq for BoxSlice<T> where [T]: Eq {}

impl<T> PartialOrd for BoxSlice<T>
where
    [T]: PartialOrd,
{
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        (**self).partial_cmp(&**other)
    }
}

impl<T> Ord for BoxSlice<T>
where
    [T]: Ord,
{
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        (**self).cmp(&**other)
    }
}

impl<T> Hash for BoxSlice<T>
where
    [T]: Hash,
{
    fn hash<H: Hasher>(&self, state: &mut H) {
        (**self).hash(state)
    }
}

// InternMap

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
struct ValueRef<V: ?Sized + 'static> {
    value: &'static V,
    _marker: core::marker::PhantomData<V>,
}

#[derive(Debug)]
pub struct InternMap<K: Copy + From<usize>, V: Eq + Hash + ?Sized + 'static> {
    map: FxHashMap<ValueRef<V>, K>,
    interned: TiVec<K, Box<V>>,
}

impl<K: Copy + From<usize>, V: ?Sized + Eq + Hash + 'static> Default for InternMap<K, V> {
    fn default() -> Self {
        Self {
            map: Default::default(),
            interned: Default::default(),
        }
    }
}

impl<K: Copy + From<usize>, V: ?Sized + Eq + Hash + 'static> InternMap<K, V> {
    pub fn intern(&mut self, v: Box<V>) -> K {
        // SAFETY: `v` is stored in the `interned` vector, behind a `Box` so it
        // will not be moved or dropped until the whole `InternMap` is dropped.
        let value = unsafe { core::mem::transmute::<&V, &'static V>(v.as_ref()) };
        let value_ref = ValueRef {
            value,
            _marker: core::marker::PhantomData,
        };
        *self
            .map
            .entry(value_ref)
            .or_insert_with(|| self.interned.push_and_get_key(v))
    }

    pub fn finish(self) -> TiVec<K, Box<V>> {
        self.interned
    }
}

impl<K: Copy + From<usize>, V: ?Sized + Eq + Hash + 'static> Deref for InternMap<K, V> {
    type Target = TiVec<K, Box<V>>;
    fn deref(&self) -> &Self::Target {
        &self.interned
    }
}
