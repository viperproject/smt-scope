use mem_dbg::{CopyType, False, MemDbgImpl, MemSize, True};
use petgraph::{
    graph::{Edge, IndexType, Node},
    EdgeType,
};

use crate::parsers::z3::VersionInfo;

use super::{
    BigRational, FxHashMap, FxHashSet, Graph, IString, NonMaxU32, NonMaxUsize, StringTable, TiVec,
};

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

// BigInt

impl MemDbgImpl for BigRational {}

impl MemSize for BigRational {
    fn mem_size(&self, _flags: mem_dbg::SizeFlags) -> usize {
        let numer = self.numer();
        let denom = self.denom();
        core::mem::size_of::<Self>()
            + numer.iter_u64_digits().len() * core::mem::size_of::<u64>()
            + denom.iter_u64_digits().len() * core::mem::size_of::<u64>()
    }
}

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

// FxHashSet

impl<K: MemSize> MemDbgImpl for FxHashSet<K> {}
impl<K: MemSize> MemSize for FxHashSet<K> {
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        core::mem::size_of::<Self>() + self.0.iter().map(|k| k.mem_size(flags)).sum::<usize>()
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

// Graph

impl<N, E, Ty: EdgeType, Ix: IndexType> MemDbgImpl for Graph<N, E, Ty, Ix>
where
    N: MemSize,
    E: MemSize,
{
}
impl<N, E, Ty: EdgeType, Ix: IndexType> MemSize for Graph<N, E, Ty, Ix>
where
    N: MemSize,
    E: MemSize,
{
    fn mem_size(&self, flags: mem_dbg::SizeFlags) -> usize {
        let self_ = core::mem::size_of::<Self>();
        let node_extra = core::mem::size_of::<Node<N, Ix>>() - core::mem::size_of::<N>();
        let edge_extra = core::mem::size_of::<Edge<E, Ix>>() - core::mem::size_of::<E>();
        let self_ = self_
            + self
                .0
                .node_weights()
                .map(|n| node_extra + n.mem_size(flags))
                .sum::<usize>()
            + self
                .0
                .edge_weights()
                .map(|e| edge_extra + e.mem_size(flags))
                .sum::<usize>();

        let result = if flags.contains(mem_dbg::SizeFlags::CAPACITY) {
            let (nodes, edges) = self.0.capacity();
            let (nodes, edges) = (nodes - self.0.node_count(), edges - self.0.edge_count());
            self_
                + nodes * core::mem::size_of::<Node<N, Ix>>()
                + edges * core::mem::size_of::<Edge<E, Ix>>()
        } else {
            self_
        };
        assert!(result >= core::mem::size_of::<Self>());
        result
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
