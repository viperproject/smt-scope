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
}
