pub mod cdcl;
pub mod cost;
pub mod depth;
pub mod matching_loop;
pub mod next_nodes;
pub mod proof;
pub mod reconnect;
pub mod run;

use std::cmp::Reverse;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use matching_loop::MlData;

use crate::{F64Ord, Result, TiVec, Z3Parser};

use self::{
    cost::{DefaultCost, ProofCost},
    depth::DefaultDepth,
    next_nodes::NextInstsInit,
    proof::ProofInitialiser,
    reconnect::{BwdReachableAnalysis, ReachNonDisabled},
};

use super::{raw::RawInstGraph, InstGraph, RawNodeIndex};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Analysis {
    pub reach: TiVec<RawNodeIndex, ReachNonDisabled>,
    // Highest to lowest
    pub cost: OrderingAnalysis,
    // Most to least
    pub children: OrderingAnalysis,
    // Most to least
    pub fwd_depth_min: OrderingAnalysis,
    pub ml_data: Option<MlData>,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct OrderingAnalysis {
    nodes: Vec<RawNodeIndex>,
    sorted_to: usize,
}

impl OrderingAnalysis {
    pub fn duplicate(&self) -> Result<Self> {
        // Alloc `children` vector
        let mut nodes = Vec::new();
        nodes.try_reserve_exact(self.nodes.len())?;
        nodes.extend(self.nodes.iter().copied());
        Ok(Self {
            nodes,
            sorted_to: 0,
        })
    }

    pub fn first_n<O: Ord>(
        &mut self,
        n: usize,
        ord: impl Fn(RawNodeIndex) -> O,
    ) -> (&[RawNodeIndex], &[RawNodeIndex]) {
        let idx = n.min(self.nodes.len());
        if let Some(pivot) = idx.checked_sub(self.sorted_to + 1) {
            let unsorted = &mut self.nodes[self.sorted_to..];
            let (larger, _, _) = unsorted.select_nth_unstable_by_key(pivot, |&a| (ord(a), a));
            larger.sort_unstable_by_key(|&a| (ord(a), a));
            self.sorted_to = idx;
        }
        self.nodes.split_at(idx)
    }
}

impl Analysis {
    pub fn new(nodes: impl Iterator<Item = RawNodeIndex>) -> Result<Self> {
        // Alloc `cost` vector
        let mut cost = Vec::new();
        for node in nodes {
            cost.try_reserve(1)?;
            cost.push(node);
        }
        let cost = OrderingAnalysis {
            nodes: cost,
            sorted_to: 0,
        };
        // Alloc `children` vector
        let children = cost.duplicate()?;
        // Alloc `fwd_depth_min` vector
        let fwd_depth_min = cost.duplicate()?;
        Ok(Self {
            reach: Default::default(),
            cost,
            children,
            fwd_depth_min,
            ml_data: None,
        })
    }
}

impl InstGraph {
    pub fn initialise_first(&mut self, parser: &Z3Parser) {
        self.initialise_collect(ProofInitialiser::<false>, parser);
        self.initialise_collect(ProofInitialiser::<true>, parser);
        self.initialise_cdcl(parser);

        self.initialise_default(parser);
    }

    pub fn initialise_default(&mut self, parser: &Z3Parser) {
        let mut reach = BwdReachableAnalysis::<ReachNonDisabled>::default();
        self.analysis.reach = self.topo_analysis(&mut reach);

        self.initialise_transfer(DefaultCost, parser);
        self.initialise_transfer(ProofCost, parser);
        self.initialise_collect(DefaultDepth::<true>, parser);
        self.initialise_collect(DefaultDepth::<false>, parser);

        self.initialise_transfer(NextInstsInit::<true>, parser);
        self.initialise_transfer(NextInstsInit::<false>, parser);

        self.analyse();
    }

    pub fn analyse(&mut self) {
        self.analysis.cost.sorted_to = 0;
        self.analysis.children.sorted_to = 0;
        self.analysis.fwd_depth_min.sorted_to = 0;
        self.analysis.first_n_cost(&self.raw, 10000);
        self.analysis.first_n_children(&self.raw, 10000);
        self.analysis.first_n_fwd_depth_min(&self.raw, 10000);
    }
}

impl Analysis {
    pub fn first_n_cost(
        &mut self,
        raw: &RawInstGraph,
        n: usize,
    ) -> (&[RawNodeIndex], &[RawNodeIndex]) {
        self.cost.first_n(n, |a| Reverse(F64Ord(raw[a].cost)))
    }

    pub fn first_n_children(
        &mut self,
        raw: &RawInstGraph,
        n: usize,
    ) -> (&[RawNodeIndex], &[RawNodeIndex]) {
        self.children.first_n(n, |a| Reverse(raw[a].children.count))
    }

    pub fn first_n_fwd_depth_min(
        &mut self,
        raw: &RawInstGraph,
        n: usize,
    ) -> (&[RawNodeIndex], &[RawNodeIndex]) {
        self.fwd_depth_min
            .first_n(n, |a| Reverse(raw[a].fwd_depth.min))
    }
}
