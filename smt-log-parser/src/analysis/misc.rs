use crate::{items::QuantIdx, TiVec, Z3Parser};

pub struct LogInfo {
    pub match_: MatchesInfo,
    pub inst: InstsInfo,
    pub quants: QuantsInfo,
}

#[derive(Default, Clone, Copy)]
/// Counts of different match-line kinds. Essentially how many instantiations
/// were from each of the different categories.
pub struct MatchesInfo {
    pub mbqi: usize,
    pub theory_solving: usize,
    pub axioms: usize,
    pub quantifiers: usize,
}

#[derive(Default, Clone, Copy)]
/// Counts of different instantiation stats.
pub struct InstsInfo {
    pub enodes: usize,
    pub geqs: usize,
    pub treqs: usize,
    pub insts: usize,
    pub geqs_trivial: usize,
    pub treqs_trivial: usize,
}

impl InstsInfo {
    pub fn total(&self) -> usize {
        self.enodes + self.geqs + self.treqs + self.insts
    }
    pub fn geqs_nontrivial(&self) -> usize {
        self.geqs - self.geqs_trivial
    }
    pub fn treqs_nontrivial(&self) -> usize {
        self.treqs - self.treqs_trivial
    }

    pub fn new(parser: &Z3Parser) -> Self {
        let equalities = &parser.egraph.equalities;
        let geqs_trivial = equalities.given.iter().filter(|eq| eq.is_trivial()).count();
        let treqs_trivial = equalities
            .transitive
            .iter()
            .filter(|eq| eq.given_len == 0)
            .count();
        Self {
            insts: parser.insts.insts.len(),
            enodes: parser.egraph.enodes.len(),
            geqs: equalities.given.len(),
            treqs: equalities.transitive.len(),
            geqs_trivial,
            treqs_trivial,
        }
    }
}

/// How many times each quantifier was instantiated
pub struct QuantsInfo(pub TiVec<QuantIdx, u64>);

pub struct RedundancyInfo {}

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
        let inst = InstsInfo::new(parser);

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
