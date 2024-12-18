use crate::{
    items::{QuantIdx, QuantPatVec},
    Z3Parser,
};

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
    pub insts: usize,
    pub enodes: usize,
    pub geqs: usize,
    pub treqs: usize,
    pub geqs_trivial: usize,
    pub treqs_error: usize,
    pub proofs: usize,
    /// Proof nodes which are not trivial and not QI related
    pub proofs_nt_nq: usize,
    pub cdcls: usize,
}

impl InstsInfo {
    pub fn total(&self) -> usize {
        self.enodes + self.geqs + self.treqs + self.insts
    }
    pub fn geqs_nontrivial(&self) -> usize {
        self.geqs - self.geqs_trivial
    }
    pub fn treqs_nontrivial(&self) -> usize {
        self.treqs
    }

    pub fn new(parser: &Z3Parser) -> Self {
        let equalities = &parser.egraph.equalities;
        let geqs_trivial = equalities.given.iter().filter(|eq| eq.is_trivial()).count();
        let treqs_error = equalities
            .transitive
            .iter()
            .filter(|eq| eq.given_len.is_none())
            .count();
        let proofs = parser.proofs().iter();
        Self {
            insts: parser.instantiations().len(),
            enodes: parser.egraph.enodes.len(),
            geqs: equalities.given.len(),
            treqs: equalities.transitive.len(),
            geqs_trivial,
            treqs_error,
            proofs: parser.proofs().len(),
            proofs_nt_nq: proofs
                .filter(|p| !p.kind.is_quant_inst() && !p.kind.is_trivial())
                .count(),
            cdcls: parser.cdcls().len(),
        }
    }
}

/// How many times each quantifier was instantiated
pub struct QuantsInfo(pub QuantPatVec<usize>);

impl LogInfo {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut quants = QuantsInfo(parser.new_quant_pat_vec(|_| 0));
        let mut match_ = MatchesInfo::default();
        for data in parser.instantiations_data() {
            if let Some(qpat) = data.match_.kind.quant_pat() {
                quants.0[qpat] += 1;
            }
            use crate::items::MatchKind::*;
            match &data.match_.kind {
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

    pub fn quants_iter(&self) -> impl Iterator<Item = (QuantIdx, usize)> + '_ {
        self.quants
            .0
             .0
            .iter_enumerated()
            .map(|(i, count)| (i, count.iter_enumerated().map(|(_, c)| c).sum()))
    }
}
