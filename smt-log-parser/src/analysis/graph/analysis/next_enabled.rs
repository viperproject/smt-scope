use std::collections::HashSet;

use petgraph::Direction;

use crate::{
    analysis::{
        raw::{NextInsts, Node},
        RawNodeIndex,
    },
    Z3Parser,
};

use super::{Initialiser, TransferInitialiser};

pub trait NextEnabledInitialiser<const FORWARD: bool> {
    /// The starting value for a node.
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> NextInsts;
    /// Called between initialisations of different subgraphs.
    fn reset(&mut self) {}
    type Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed;
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> NextInsts;
}
impl<C: NextEnabledInitialiser<FORWARD>, const FORWARD: bool> Initialiser<FORWARD, 3> for C {
    type Value = NextInsts;
    fn direction() -> Direction {
        if FORWARD {
            Direction::Outgoing
        } else {
            Direction::Incoming
        }
    }
    fn base(&mut self, _node: &Node, _parser: &Z3Parser) -> Self::Value {
        NextInsts {
            nodes: HashSet::default(),
        }
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        if FORWARD {
            node.enabled_parents = value;
        } else {
            node.enabled_children = value;
        }
    }
    fn reset(&mut self) {
        NextEnabledInitialiser::reset(self)
    }
}
impl<C: NextEnabledInitialiser<FORWARD>, const FORWARD: bool> TransferInitialiser<FORWARD, 3>
    for C
{
    type Observed = C::Observed;
    fn observe(&mut self, node: &Node, parser: &Z3Parser) -> Self::Observed {
        NextEnabledInitialiser::observe(self, node, parser)
    }
    fn transfer(
        &mut self,
        from: &Node,
        from_idx: RawNodeIndex,
        to_idx: usize,
        to_all: &[Self::Observed],
    ) -> Self::Value {
        NextEnabledInitialiser::transfer(self, from, from_idx, to_idx, to_all)
    }
    fn add(&mut self, node: &mut Node, value: Self::Value) {
        if FORWARD {
            node.enabled_parents = NextInsts {
                nodes: node
                    .enabled_parents
                    .nodes
                    .iter()
                    .cloned()
                    .chain(value.nodes.iter().cloned())
                    .collect(),
            };
        } else {
            node.enabled_children = NextInsts {
                nodes: node
                    .enabled_children
                    .nodes
                    .iter()
                    .cloned()
                    .chain(value.nodes.iter().cloned())
                    .collect(),
            };
        }
    }
}

pub struct DefaultNextEnabled<const FORWARD: bool>;
impl<const FORWARD: bool> NextEnabledInitialiser<FORWARD> for DefaultNextEnabled<FORWARD> {
    fn base(&mut self, _node: &Node, _parser: &Z3Parser) -> NextInsts {
        NextInsts {
            nodes: HashSet::default(),
        }
    }
    type Observed = NextInsts;
    fn observe(&mut self, node: &Node, _parser: &Z3Parser) -> Self::Observed {
        if FORWARD {
            node.enabled_parents.clone()
        } else {
            node.enabled_children.clone()
        }
    }
    fn transfer(
        &mut self,
        node: &Node,
        from_idx: RawNodeIndex,
        _idx: usize,
        _incoming: &[Self::Observed],
    ) -> NextInsts {
        let value = match node.disabled() {
            false => NextInsts {
                nodes: std::iter::once(from_idx).collect(),
            },
            _ => {
                if FORWARD {
                    node.enabled_parents.clone()
                } else {
                    node.enabled_children.clone()
                }
            }
        };
        value
    }
}
