use crate::{items::QuantIdx, TiVec, Z3Parser};

pub struct LogInfo {
    pub match_: MatchesInfo,
    pub inst: InstsInfo,
    pub quants: QuantsInfo,
}

#[derive(Default)]
/// Counts of different match-line kinds. Essentially how many instantiations
/// were from each of the different categories.
pub struct MatchesInfo {
    pub mbqi: u64,
    pub theory_solving: u64,
    pub axioms: u64,
    pub quantifiers: u64,
}

#[derive(Default)]
/// Counts of different instantiation stats.
pub struct InstsInfo {
    pub enodes: u64,
    pub geqs: u64,
    pub treqs: u64,
    pub insts: u64,
}

impl InstsInfo {
    pub fn total(&self) -> u64 {
        self.enodes + self.geqs + self.treqs + self.insts
    }
}

/// How many times each quantifier was instantiated
pub struct QuantsInfo(pub TiVec<QuantIdx, u64>);

impl LogInfo {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut quants = QuantsInfo(parser.quantifiers.iter().map(|_| 0).collect());
        let mut match_ = MatchesInfo::default();
        for inst in parser.instantiations().iter() {
            let match_i = &parser[inst.match_];
            if let Some(qidx) = match_i.kind.quant_idx() {
                quants.0[qidx] += 1;
            }
            use crate::items::MatchKind::*;
            match &match_i.kind {
                MBQI { .. } => match_.mbqi += 1,
                TheorySolving { .. } => match_.theory_solving += 1,
                Axiom { .. } => match_.axioms += 1,
                Quantifier { .. } => match_.quantifiers += 1,
            }
        }

        let inst = InstsInfo {
            insts: parser.insts.insts.len() as u64,
            enodes: parser.egraph.enodes.len() as u64,
            geqs: parser.egraph.equalities.given.len() as u64,
            treqs: parser.egraph.equalities.transitive.len() as u64,
        };

        Self {
            match_,
            inst,
            quants,
        }
    }

    pub fn quants_iter(&self) -> impl Iterator<Item = (QuantIdx, u64)> + '_ {
        self.quants
            .0
            .iter_enumerated()
            .map(|(i, count)| (i, *count))
    }
}
