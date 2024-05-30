use mem_dbg::{CopyType, False, MemDbgImpl, MemSize, True};
use petgraph::{
    graph::{Edge, IndexType, Node},
    EdgeType,
};

#[cfg(feature = "analysis")]
use crate::analysis::subgraph::TransitiveClosure;
use crate::parsers::z3::VersionInfo;

use super::{BoxSlice, FxHashMap, Graph, IString, NonMaxU32, NonMaxUsize, StringTable, TiVec};

macro_rules! copy_impl {
    ($t:ty) => {
        impl MemDbgImpl for $t {}
        impl MemSize for $t {
            fn mem_size(&self, _flags: mem_dbg::SizeFlags) -> usize {
                core::mem::size_of::<Self>()
            }
        }
        impl CopyType for $t {
            type Copy = True;
        }
    };
}

copy_impl!(NonMaxU32);
copy_impl!(NonMaxUsize);
copy_impl!(IString);

// TiVec

impl<K, V> MemDbgImpl for TiVec<K, V>
where
    Vec<V>: MemDbgImpl,
{
    fn _mem_dbg_rec_on(
        &self,
        writer: &mut impl core::fmt::Write,
        total_size: usize,
        max_depth: usize,
        prefix: &mut String,
        is_last: bool,
        flags: mem_dbg::DbgFlags,
    ) -> core::fmt::Result {
        self.0
            .raw
            ._mem_dbg_rec_on(writer, total_size, max_depth, prefix, is_last, flags)
    }
}
impl<K, V> MemSize for TiVec<K, V>
where
    Vec<V>: MemSize,
{
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        self.0.raw.mem_size(flags)
    }
}
impl<K, V> CopyType for TiVec<K, V> {
    type Copy = False;
}

// FxHashMap

// use std::{collections::HashMap, hash::Hash};
// impl<K: Clone + Hash + Eq, V: Clone> MemDbgImpl for FxHashMap<K, V> where HashMap<K, V>: MemDbgImpl {
//     fn _mem_dbg_rec_on(
//         &self,
//         writer: &mut impl core::fmt::Write,
//         total_size: usize,
//         max_depth: usize,
//         prefix: &mut String,
//         is_last: bool,
//         flags: mem_dbg::DbgFlags,
//     ) -> core::fmt::Result {
//         let map: HashMap<K, V> = self.0.iter().map(|(k ,v)| (k.clone(), v.clone())).collect();
//         map._mem_dbg_rec_on(writer, total_size, max_depth, prefix, is_last, flags)
//     }
// }
// impl<K: Clone + Hash + Eq, V: Clone> MemSize for FxHashMap<K, V> where HashMap<K, V>: MemSize {
//     fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
//         let map: HashMap<K, V> = self.0.iter().map(|(k ,v)| (k.clone(), v.clone())).collect();
//         map.mem_size(flags)
//     }
// }

impl<K: MemSize, V: MemSize> MemDbgImpl for FxHashMap<K, V> {}
impl<K: MemSize, V: MemSize> MemSize for FxHashMap<K, V> {
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        core::mem::size_of::<Self>()
            + self
                .0
                .iter()
                .map(|(k, v)| k.mem_size(flags) + v.mem_size(flags))
                .sum::<usize>()
    }
}

// StringTable

impl MemDbgImpl for StringTable {}
impl MemSize for StringTable {
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        core::mem::size_of::<Self>()
            + self.0.current_memory_usage()
            + if flags.contains(mem_dbg::SizeFlags::CAPACITY) {
                self.0.capacity() * std::mem::size_of::<&str>()
            } else {
                self.0.len() * std::mem::size_of::<&str>()
            }
            + self.0.len() * std::mem::size_of::<IString>()
    }
}

// BoxSlice

impl<T> MemDbgImpl for BoxSlice<T>
where
    [T]: MemDbgImpl,
{
    fn _mem_dbg_rec_on(
        &self,
        writer: &mut impl core::fmt::Write,
        total_size: usize,
        max_depth: usize,
        prefix: &mut String,
        is_last: bool,
        flags: mem_dbg::DbgFlags,
    ) -> core::fmt::Result {
        self.0
            ._mem_dbg_rec_on(writer, total_size, max_depth, prefix, is_last, flags)
    }
}
impl<T> MemSize for BoxSlice<T>
where
    [T]: MemSize,
{
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        self.0.mem_size(flags)
    }
}
impl<T> CopyType for BoxSlice<T> {
    type Copy = False;
}

// TransitiveClosure

#[cfg(feature = "analysis")]
impl MemDbgImpl for TransitiveClosure {}
#[cfg(feature = "analysis")]
impl MemSize for TransitiveClosure {
    fn mem_size(&self, _flags: mem_dbg::SizeFlags) -> usize {
        core::mem::size_of::<Self>()
            + self
                .inner()
                .iter()
                .map(|r| r.serialized_size())
                .sum::<usize>()
    }
}
#[cfg(feature = "analysis")]
impl CopyType for TransitiveClosure {
    type Copy = False;
}

// Graph

impl<N, E, Ty: EdgeType, Ix: IndexType> MemDbgImpl for Graph<N, E, Ty, Ix> {}
impl<N, E, Ty: EdgeType, Ix: IndexType> MemSize for Graph<N, E, Ty, Ix> {
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        let (nodes, edges) = if flags.contains(mem_dbg::SizeFlags::CAPACITY) {
            self.0.capacity()
        } else {
            (self.0.node_count(), self.0.edge_count())
        };
        core::mem::size_of::<Self>()
            + nodes * std::mem::size_of::<Node<N, Ix>>()
            + edges * std::mem::size_of::<Edge<E, Ix>>()
    }
}
impl<N, E, Ty, Ix> CopyType for Graph<N, E, Ty, Ix> {
    type Copy = False;
}

// VersionInfo

impl MemDbgImpl for VersionInfo {}
impl MemSize for VersionInfo {
    fn mem_size(&self, _flags: mem_dbg::SizeFlags) -> usize {
        std::mem::size_of::<Self>()
    }
}
impl CopyType for VersionInfo {
    type Copy = False;
}
