use fxhash::FxHashSet;

use crate::{
    items::{QuantIdx, TermIdx},
    parsers::z3::synthetic::MaybeSynthIdx,
    FxHashMap, Z3Parser,
};

pub(super) struct MlEquality {
    pub(super) from: MaybeSynthIdx,
    pub(super) to: MaybeSynthIdx,
    pub(super) creators: FxHashSet<(QuantIdx, TermIdx)>,
}

impl MlEquality {
    pub fn merge_with(
        &mut self,
        from: TermIdx,
        to: TermIdx,
        creators: Vec<(QuantIdx, TermIdx)>,
        parser: &mut Z3Parser,
    ) {
        let term = parser
            .synth_terms
            .generalise(&parser.terms, vec![self.from, from.into()])
            .unwrap();
        self.from = term;

        let term = parser
            .synth_terms
            .generalise(&parser.terms, vec![self.to, to.into()])
            .unwrap();
        self.to = term;
        self.creators.extend(creators);
    }
    pub fn from(
        from: MaybeSynthIdx,
        to: MaybeSynthIdx,
        creators: Vec<(QuantIdx, TermIdx)>,
    ) -> Self {
        MlEquality {
            from,
            to,
            creators: creators.iter().cloned().collect(),
        }
    }
}

pub(super) struct MlMatchedTerm {
    pub(super) matched: MaybeSynthIdx,
    pub(super) creator: (QuantIdx, TermIdx),
}

impl MlMatchedTerm {
    // TODO: maybe only generalise the terms in the very end? Otherwise we are creating lots of unnecessary generalised
    // terms that we won't even make use of
    pub fn merge_with(
        &mut self,
        matched: TermIdx,
        quant: QuantIdx,
        pattern: TermIdx,
        parser: &mut Z3Parser,
    ) {
        let term = parser
            .synth_terms
            .generalise(&parser.terms, vec![self.matched, matched.into()])
            .unwrap();
        self.matched = term;
        self.creator = (quant, pattern)
    }
    pub fn from(matched: TermIdx, quant: QuantIdx, pattern: TermIdx) -> Self {
        MlMatchedTerm {
            matched: matched.into(),
            creator: (quant, pattern),
        }
    }
}

#[derive(Debug, Clone, Eq, Hash, PartialEq)]
pub enum MLGraphNode {
    QI(QuantIdx, MaybeSynthIdx),
    ENode(MaybeSynthIdx),
    Equality(MaybeSynthIdx, MaybeSynthIdx),
}
