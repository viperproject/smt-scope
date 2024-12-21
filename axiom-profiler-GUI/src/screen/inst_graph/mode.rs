use smt_log_parser::analysis::raw::NodeKind;

#[derive(Clone, Copy, PartialEq)]
pub enum GraphMode {
    Inst,
    Proof,
    Cdcl,
}

impl GraphMode {
    pub fn is_inst(&self) -> bool {
        matches!(self, Self::Inst)
    }
    pub fn is_proof(&self) -> bool {
        matches!(self, Self::Proof)
    }
    pub fn is_cdcl(&self) -> bool {
        matches!(self, Self::Cdcl)
    }

    pub fn is_allowed(&self, kind: &NodeKind) -> bool {
        use NodeKind::*;
        match (self, kind) {
            (Self::Inst, Instantiation(..) | ENode(..) | GivenEquality(..) | TransEquality(..)) => {
                true
            }
            (Self::Inst, _) => false,
            (Self::Proof, Instantiation(..) | ENode(..) | Proof(..)) => true,
            (Self::Proof, _) => false,
            (Self::Cdcl, Cdcl(..)) => true,
            (Self::Cdcl, _) => false,
        }
    }
}
