use std::{cell::RefCell, rc::Rc};

use smt_log_parser::analysis::{analysis::cost::QuantCosts, InstGraph};

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
    pub costs: QuantCosts,
}

#[derive(Debug, Clone, PartialEq)]
pub enum AnalysisState {
    ConstructingGraph,
    Failed(String),
}
