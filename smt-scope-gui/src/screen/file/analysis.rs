use std::{cell::RefCell, rc::Rc};

use smt_scope::{
    analysis::{InstGraph, ProblemBehaviours, ProofAnalysis, QuantifierAnalysis},
    Z3Parser,
};

use super::SummaryAnalysis;

#[derive(Clone)]
pub struct RcAnalysis(Rc<RefCell<AnalysisData>>);

impl RcAnalysis {
    pub fn new(data: AnalysisData) -> Self {
        Self(Rc::new(RefCell::new(data)))
    }

    pub fn borrow(&self) -> std::cell::Ref<AnalysisData> {
        self.0.borrow()
    }

    pub fn borrow_mut(&self) -> std::cell::RefMut<AnalysisData> {
        self.0.borrow_mut()
    }
}

impl PartialEq for RcAnalysis {
    fn eq(&self, other: &Self) -> bool {
        Rc::ptr_eq(&self.0, &other.0)
    }
}

pub struct AnalysisData {
    pub graph: InstGraph,
    pub quants: QuantifierAnalysis,
    pub proofs: ProofAnalysis,
    pub pb: ProblemBehaviours,
}

impl AnalysisData {
    pub fn new(
        parser: &mut Z3Parser,
        summary: &SummaryAnalysis,
        mut graph: InstGraph,
        full: bool,
    ) -> Self {
        let pb = if full {
            let ml = graph.search_matching_loops(parser);
            ProblemBehaviours::find(ml, &summary.redundancy)
        } else {
            ProblemBehaviours::default()
        };
        Self {
            quants: QuantifierAnalysis::new(parser, &graph),
            proofs: ProofAnalysis::new(parser, &graph),
            pb,
            graph,
        }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum AnalysisState {
    ConstructingGraph,
    Failed(String),
}
