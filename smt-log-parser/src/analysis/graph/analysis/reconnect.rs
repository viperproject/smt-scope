use std::collections::hash_map::Entry;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use fxhash::FxHashSet;

use crate::{
    analysis::{raw::Node, InstGraph, RawNodeIndex},
    BoxSlice, FxHashMap, TiVec,
};

use super::run::TopoAnalysis;

pub trait ReachKind: Copy + core::fmt::Debug + From<bool> + Into<bool> {
    fn current(node: &Node) -> Self;
    fn value(self) -> bool {
        self.into()
    }
}

macro_rules! reach_kind {
    ($name:ident($node:ident => $e:expr)) => {
        #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
        #[cfg_attr(feature = "mem_dbg", copy_type)]
        #[derive(Debug, Clone, Copy)]
        pub struct $name(bool);
        impl ReachKind for $name {
            fn current($node: &Node) -> Self {
                Self($e)
            }
        }
        impl From<bool> for $name {
            fn from(b: bool) -> Self {
                Self(b)
            }
        }
        impl From<$name> for bool {
            fn from(b: $name) -> bool {
                b.0
            }
        }
    };
}

reach_kind!(ReachVisible(node => node.visible()));
reach_kind!(ReachNonDisabled(node => !node.disabled()));

/// If `VIS` is true, then it checks if a visible node is reachable from this
/// one, otherwise it checks if any non-disabled node is reachable.
#[derive(Clone, Copy)]
pub struct BwdReachableAnalysis<Kind: ReachKind>(core::marker::PhantomData<Kind>);
impl<Kind: ReachKind> Default for BwdReachableAnalysis<Kind> {
    fn default() -> Self {
        Self(Default::default())
    }
}

impl<Kind: ReachKind> TopoAnalysis<false, false> for BwdReachableAnalysis<Kind> {
    type Value = Kind;

    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        _graph: &'a InstGraph,
        _cidx: RawNodeIndex,
        node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n,
    {
        let curr = Kind::current(node).value();
        let reach = curr || from_all().any(|(_, &b)| b.value());
        reach.into()
    }
}

/// Looks for tuples of 4 indices:
///  - `from`: a visible node
///  - `from_child`: (optional) a non-visible child of `from`
///  - `to_parent`: a non-visible node reachable from `from_child`
///    but not reachable by any visible node also reachable from `from_child`
///    (note that it's possible for `from_child == to_parent`)
///  - `to`: a visible child of `to_parent`
///
/// The `to` is implicit in the index which we used to reach the
/// `TopoAnalysis::Value`.
pub struct ReconnectAnalysis(pub TiVec<RawNodeIndex, ReachVisible>);

#[derive(Debug, Default)]
pub struct ReconnectData {
    /// Edges, along with a path if they have only a single one possible.
    pub above: FxHashMap<ReconnectEdge, Option<BoxSlice<RawNodeIndex>>>,
    /// These should not be added to `above` since they can be transitively
    /// reached.
    pub transitive: FxHashSet<ReconnectFrom>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct ReconnectFrom {
    /// A visible node to reconnect from.
    pub visible: RawNodeIndex,
    /// A non-visible child of `from_v`, set only if
    /// `from_v.reconnect_children()`.
    pub hidden: Option<RawNodeIndex>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct ReconnectEdge {
    pub from: ReconnectFrom,
    /// A non-visible parent of the current visible node, set only if
    /// `to_v.reconnect_parents()`.
    pub to_h: RawNodeIndex,
    /// Did we walk through any `hidden` nodes on a path between `from_v` and
    /// `to_v`?
    pub indirect: bool,
}

impl ReconnectEdge {
    /// Create a special `ReconnectEdge` representing a connection between two
    /// visible nodes.
    fn direct_visible(from: RawNodeIndex) -> Self {
        Self {
            from: ReconnectFrom {
                visible: from,
                hidden: None,
            },
            to_h: from,
            indirect: false,
        }
    }

    pub fn is_direct_visible(&self) -> bool {
        self.from.visible == self.to_h
    }

    fn set_indirect(self, indirect: bool) -> Self {
        Self {
            indirect: indirect || self.indirect,
            ..self
        }
    }

    fn set_to_h(self, to_h: RawNodeIndex) -> Self {
        debug_assert_eq!(self.from.visible, self.to_h);
        debug_assert_ne!(self.to_h, to_h);
        Self { to_h, ..self }
    }
}

impl ReconnectData {
    fn above(&self) -> impl Iterator<Item = (ReconnectEdge, Option<&[RawNodeIndex]>)> + '_ {
        self.above
            .iter()
            .map(|(edge, path)| (*edge, path.as_deref()))
    }

    pub fn insert(
        &mut self,
        edge: ReconnectEdge,
        path: Option<&[RawNodeIndex]>,
        prev: Option<RawNodeIndex>,
    ) {
        match self.above.entry(edge) {
            Entry::Occupied(o) => *o.into_mut() = None,
            Entry::Vacant(v) => {
                v.insert(path.map(|p| p.iter().copied().chain(prev).collect()));
            }
        }
    }

    pub fn extend(&mut self, other: &Self, prev: RawNodeIndex, hidden: bool) {
        // Remove any that we've already added but should not have.
        self.above
            .retain(|above, _| !other.transitive.contains(&above.from));
        // Add any that we can add, this is after the above line since `other`
        // may contain nodes which it has itself forbidden.
        for (edge, path) in other.above() {
            if self.transitive.contains(&edge.from) {
                continue;
            }
            self.insert(edge.set_indirect(hidden), path, Some(prev));
        }
        // Add the transitive ones which forbid adding.
        self.transitive.extend(other.transitive.iter().copied());
    }

    pub fn reached_visible(&mut self, other: &Self, prev: RawNodeIndex) {
        let transitive = other.above().map(|(above, _)| above.from);
        self.transitive.extend(transitive);
        for (edge, path) in other.above() {
            self.insert(edge.set_to_h(prev), path, None);
        }
    }
}

impl TopoAnalysis<true, false> for ReconnectAnalysis {
    type Value = ReconnectData;

    fn collect<'a, 'n, T: Iterator<Item = (RawNodeIndex, &'n Self::Value)>>(
        &mut self,
        graph: &'a InstGraph,
        cidx: RawNodeIndex,
        node: &'a Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value
    where
        Self::Value: 'n,
    {
        let mut data = Self::Value::default();
        if !self.0[cidx].value() {
            return data;
        }

        let visible = node.visible();
        let hidden = node.hidden();
        for (fidx, from_data) in from_all() {
            let from = &graph.raw[fidx];
            match (from.visible(), visible) {
                (false, false) => {
                    data.extend(from_data, fidx, hidden);
                }
                (true, false) => {
                    let cidx = Some(cidx).filter(|_| from.kind().reconnect_child(node.kind()));
                    let edge = ReconnectEdge {
                        from: ReconnectFrom {
                            visible: fidx,
                            hidden: cidx,
                        },
                        to_h: fidx,
                        indirect: hidden,
                    };
                    data.insert(edge, Some(&[]), None);
                    data.transitive.extend(from_data.transitive.iter().copied());
                }
                (false, true) => {
                    data.reached_visible(from_data, fidx);
                }
                (true, true) => {
                    data.insert(ReconnectEdge::direct_visible(fidx), Some(&[]), None);
                    data.transitive.extend(from_data.transitive.iter().copied());
                }
            }
        }

        data
    }
}
