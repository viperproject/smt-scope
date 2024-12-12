use crate::{
    analysis::{raw::ProofReach, InstGraph},
    Z3Parser,
};

impl InstGraph {
    pub fn initialise_cdcl(&mut self, parser: &Z3Parser) {
        let dbs = parser
            .cdcl
            .dead_branches()
            .flat_map(|db| parser.cdcl.dead_branch(db));
        for cdcl in dbs {
            self.raw[cdcl].proof |= ProofReach::CdclDeadBranch;
        }
    }
}
