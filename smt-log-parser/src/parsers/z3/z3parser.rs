use core::ops::Index;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use nonmax::NonMaxU64;
use typed_index_collections::TiSlice;

use crate::{items::*, parsers::z3::VersionInfo, FxHashMap, IString, StringTable, TiVec};

use super::{
    egraph::EGraph,
    inst::{InstData, Insts},
    inter_line::InterLine,
    stack::{CdclTree, HasFrame, Stack},
    stm2::EventLog,
    synthetic::{AnyTerm, SynthIdx, SynthTerms},
    terms::Terms,
};

/// A parser for Z3 log files. Use one of the various `Z3Parser::from_*` methods
/// to construct this parser.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Z3Parser {
    pub(crate) version_info: VersionInfo,
    pub(crate) terms: Terms,
    pub(crate) synth_terms: SynthTerms,

    pub(crate) quantifiers: TiVec<QuantIdx, Quantifier>,

    pub(crate) insts: Insts,

    pub(crate) egraph: EGraph,
    pub(crate) stack: Stack,

    pub cdcl: CdclTree,

    pub strings: StringTable,
    pub events: EventLog,
    pub(super) comm: InterLine,
}

pub type AstSize = core::result::Result<Option<NonMaxU64>, TermIdx>;

impl Z3Parser {
    pub fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.terms.meaning(tidx)
    }

    pub fn from_to(&self, eq: EqTransIdx) -> (ENodeIdx, ENodeIdx) {
        self.egraph.equalities.from_to(eq)
    }

    pub fn quant_count_incl_theory_solving(&self) -> (usize, bool) {
        (self.quantifiers.len(), self.insts.has_theory_solving_inst())
    }

    pub fn quantifiers(&self) -> &TiSlice<QuantIdx, Quantifier> {
        &self.quantifiers
    }
    pub fn instantiations(&self) -> &TiSlice<InstIdx, Instantiation> {
        &self.insts.insts
    }
    pub fn instantiations_data(&self) -> impl Iterator<Item = InstData<'_>> + '_ {
        self.insts.instantiations()
    }
    pub fn terms(&self) -> &TiSlice<TermIdx, Term> {
        self.terms.app_terms.terms()
    }
    pub fn proofs(&self) -> &TiSlice<ProofIdx, ProofStep> {
        self.terms.proof_terms.terms()
    }
    pub fn cdcls(&self) -> &TiSlice<CdclIdx, Cdcl> {
        self.cdcl.cdcls()
    }

    pub fn quantifier_body(&self, qidx: QuantIdx) -> Option<TermIdx> {
        let children = &self[self[qidx].term].child_ids;
        children.last().copied()
    }

    pub fn patterns(&self, q: QuantIdx) -> Option<&TiSlice<PatternIdx, TermIdx>> {
        let child_ids = &self[self[q].term].child_ids;
        child_ids
            .len()
            .checked_sub(1)
            .map(|len| &child_ids[..len])
            .map(TiSlice::from_ref)
    }

    pub fn get_inst(&self, iidx: InstIdx) -> InstData<'_> {
        self.insts.get_inst(iidx)
    }

    pub fn get_instantiation_body(&self, iidx: InstIdx) -> Option<TermIdx> {
        self.terms.get_instantiation_body(&self[iidx])
    }

    pub fn as_tidx(&self, sidx: SynthIdx) -> Option<TermIdx> {
        self.synth_terms.as_tidx(sidx)
    }

    pub fn get_pattern(&self, qpat: QuantPat) -> Option<TermIdx> {
        qpat.pat.map(|pat| self.patterns(qpat.quant).unwrap()[pat])
    }

    pub fn get_pattern_term(&self, qpat: QuantPat) -> Option<&Term> {
        self.get_pattern(qpat).map(|tidx| &self[tidx])
    }

    pub fn get_frame(&self, idx: impl HasFrame) -> &StackFrame {
        &self.stack[idx.frame(self)]
    }

    /// Does the proof step `pidx` prove `false`? This can may be under a
    /// hypothesis so might not necessarily imply unsat.
    pub fn proves_false(&self, pidx: ProofIdx) -> bool {
        let result = &self[self[pidx].result];
        result.child_ids.is_empty()
            && result
                .kind
                .app_name()
                .is_some_and(|name| &self[name] == "false")
    }

    /// Returns the size in AST nodes of the term `tidx`. Note that z3 eagerly
    /// reduces terms such as `1 + 1` to `2` meaning that a matching loop can be
    /// constant in this size metric!
    pub fn ast_size(&self, tidx: TermIdx, cached: &mut FxHashMap<TermIdx, AstSize>) -> AstSize {
        fn children(tidx: TermIdx, term: &Term) -> core::result::Result<&[TermIdx], TermIdx> {
            match term.kind {
                TermKind::Var(_) => Err(tidx),
                TermKind::App(_) => Ok(&*term.child_ids),
                // TODO: decide if we want to return a size for quantifiers
                TermKind::Quant(_) => {
                    let body = term.child_ids.last().map(core::slice::from_ref);
                    Ok(body.unwrap_or_default())
                }
            }
        }
        *self.terms.app_terms.ast_walk_cached(
            tidx,
            cached,
            |tidx, term| children(tidx, term).ok().unwrap_or_default(),
            |tidx, term, cached| {
                let children = children(tidx, term)?;
                let mut size = NonMaxU64::ONE;
                for child in children {
                    let Some(child) = cached[child]? else {
                        return Ok(None);
                    };
                    let child = NonMaxU64::new(size.get().saturating_add(child.get()));
                    let Some(child) = child else {
                        return Ok(None);
                    };
                    size = child;
                }
                Ok(Some(size))
            },
        )
    }

    pub fn inst_ast_size(
        &self,
        iidx: InstIdx,
        cached: &mut FxHashMap<TermIdx, AstSize>,
    ) -> std::option::Option<NonMaxU64> {
        let bound_terms = self[self[iidx].match_]
            .kind
            .bound_terms(|e| self[e].owner, |t| t);
        let mut sum = NonMaxU64::ZERO;
        for bt in bound_terms {
            let size = self.ast_size(bt, cached).unwrap();
            let size = sum.get().saturating_add(size?.get());
            sum = NonMaxU64::new(size)?;
        }
        Some(sum)
    }

    pub fn new_quant_pat_vec<T>(&self, f: impl Fn(QuantPat) -> T) -> QuantPatVec<T> {
        QuantPatVec(
            self.quantifiers()
                .keys()
                .map(|quant| {
                    let mbqi = f(QuantPat { quant, pat: None });
                    let pats = self.patterns(quant).into_iter().flat_map(|p| p.keys());
                    let pats = pats
                        .map(|pat| {
                            f(QuantPat {
                                quant,
                                pat: Some(pat),
                            })
                        })
                        .collect();
                    PatVec { mbqi, pats }
                })
                .collect(),
        )
    }
}

impl Index<TermIdx> for Z3Parser {
    type Output = Term;
    fn index(&self, idx: TermIdx) -> &Self::Output {
        &self.terms[idx]
    }
}
impl Index<SynthIdx> for Z3Parser {
    type Output = AnyTerm;
    fn index(&self, idx: SynthIdx) -> &Self::Output {
        self.synth_terms.index(&self.terms, idx)
    }
}
impl Index<ProofIdx> for Z3Parser {
    type Output = ProofStep;
    fn index(&self, idx: ProofIdx) -> &Self::Output {
        &self.terms[idx]
    }
}
impl Index<QuantIdx> for Z3Parser {
    type Output = Quantifier;
    fn index(&self, idx: QuantIdx) -> &Self::Output {
        &self.quantifiers[idx]
    }
}
impl Index<ENodeIdx> for Z3Parser {
    type Output = ENode;
    fn index(&self, idx: ENodeIdx) -> &Self::Output {
        &self.egraph[idx]
    }
}
impl Index<InstIdx> for Z3Parser {
    type Output = Instantiation;
    fn index(&self, idx: InstIdx) -> &Self::Output {
        &self.insts[idx]
    }
}
impl Index<MatchIdx> for Z3Parser {
    type Output = Match;
    fn index(&self, idx: MatchIdx) -> &Self::Output {
        &self.insts[idx]
    }
}
impl Index<EqGivenIdx> for Z3Parser {
    type Output = EqualityExpl;
    fn index(&self, idx: EqGivenIdx) -> &Self::Output {
        &self.egraph.equalities.given[idx]
    }
}
impl Index<EqTransIdx> for Z3Parser {
    type Output = TransitiveExpl;
    fn index(&self, idx: EqTransIdx) -> &Self::Output {
        &self.egraph.equalities.transitive[idx]
    }
}
impl Index<StackIdx> for Z3Parser {
    type Output = StackFrame;
    fn index(&self, idx: StackIdx) -> &Self::Output {
        &self.stack[idx]
    }
}
impl Index<CdclIdx> for Z3Parser {
    type Output = Cdcl;
    fn index(&self, idx: CdclIdx) -> &Self::Output {
        &self.cdcl[idx]
    }
}
impl Index<IString> for Z3Parser {
    type Output = str;
    fn index(&self, idx: IString) -> &Self::Output {
        &self.strings[*idx]
    }
}

#[test]
fn ast_size() {
    use rand::seq::SliceRandom;
    use rand::SeedableRng;

    let correct: TiVec<TermIdx, AstSize> =
        serde_json::from_str(include_str!("../../../tests/data/ast_size.json")).unwrap();
    let parser = crate::test_parser();
    let mut idxs: Vec<_> = parser.terms().keys().collect();
    for i in 0..10 {
        let mut rng = rand::rngs::StdRng::seed_from_u64(i);
        idxs.shuffle(&mut rng);
        let mut cached = FxHashMap::default();
        for &idx in &idxs {
            let size = parser.ast_size(idx, &mut cached);
            assert_eq!(size, correct[idx], "idx {idx}");
        }
    }
}
