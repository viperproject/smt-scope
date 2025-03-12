use std::{borrow::Cow, collections::hash_map::Entry};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{
        Blame, BoundVars, ENodeIdx, EqGivenIdx, MatchIdx, MatchKind, ProofIdx, ProofStepKind,
        TermId, TermIdx, TermKind,
    },
    Error as E, FxHashMap, FxHashSet, IString, NonMaxU32, Result, StringTable,
};

use super::{
    blame::{BasicEq, BlameFinder, BlamedEqsParse, ComplexEq, CustomEq, ForceEq},
    terms::Terms,
    Z3Parser,
};

// Z3 FIXED (v4.9.0+) https://github.com/Z3Prover/z3/issues/6081
// This changes `null` to `<null>` and adds `|` around :qid with spaces.

impl Z3Parser {
    fn is_z3_6081_fixed(&self) -> bool {
        self.version_info.is_ge_version(4, 9, 0)
    }

    pub(super) fn check_lambda_name(&self, lambda: &str) -> Result<()> {
        let correct = if self.is_z3_6081_fixed() {
            lambda == "<null>"
        } else {
            lambda == "null"
        };
        correct
            .then_some(())
            .ok_or_else(|| E::NonNullLambdaName(lambda.to_string()))
    }

    pub(super) fn parse_qid<'a>(
        &self,
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<(Cow<'a, str>, NonMaxU32)> {
        let mut qid = Cow::Borrowed(l.next().ok_or(E::UnexpectedNewline)?);
        let mut num_vars = l.next().ok_or(E::UnexpectedNewline)?;
        if self.is_z3_6081_fixed() {
            if qid.starts_with('|') && !qid.ends_with('|') {
                qid += " ";
                qid += num_vars;
                while !num_vars.ends_with('|') {
                    num_vars = l.next().ok_or(E::UnexpectedNewline)?;
                    qid += " ";
                    qid += num_vars;
                }
                num_vars = l.next().ok_or(E::UnexpectedNewline)?;
            }
            let nvs = num_vars.parse::<NonMaxU32>().map_err(E::InvalidVarNum)?;
            return Ok((qid, nvs));
        }

        let mut nvs = num_vars.parse::<NonMaxU32>();
        if nvs.is_err() {
            qid = Cow::Owned(format!("|{qid}"));
        }
        while nvs.is_err() {
            qid += " ";
            qid += num_vars;
            num_vars = l.next().ok_or(E::UnexpectedNewline)?;
            nvs = num_vars.parse::<NonMaxU32>();
        }
        if matches!(qid, Cow::Owned(_)) {
            qid += "|";
        }
        Ok((qid, nvs.unwrap()))
    }
}

// Z3 ISSUE: https://github.com/viperproject/smt-scope/issues/106

impl Z3Parser {
    pub(super) fn parse_app_name<'a>(
        &mut self,
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<(Cow<'a, str>, Option<TermId>)> {
        let mut name = Cow::Borrowed(l.next().ok_or(E::UnexpectedNewline)?);
        let mut l = l.map(|id| (id, TermId::parse(&mut self.strings, id)));
        let mut idp = l.next();

        let post = |name: Cow<'a, str>| match name {
            Cow::Borrowed(n) => Cow::Borrowed(n),
            Cow::Owned(mut n) => {
                n += "|";
                Cow::Owned(n)
            }
        };
        while let Some((ids, id)) = idp {
            if let Ok(id) = id {
                return Ok((post(name), Some(id)));
            }
            if let Cow::Borrowed(n) = name {
                name = Cow::Owned(format!("|{n}"));
            }
            name += " ";
            name += ids;
            idp = l.next();
        }
        Ok((post(name), None))
    }
}

impl Z3Parser {
    /// Unused.
    /// TODO: this could help us fix the egraph `can_mismatch` thing
    pub fn check_eq(&self, from: ENodeIdx, to: ENodeIdx) -> bool {
        self.egraph.check_eq(from, to, &self.stack)
            || self.check_eq_if(from, to)
            || self.check_eq_if(to, from)
    }

    fn check_eq_if(&self, from: ENodeIdx, to: ENodeIdx) -> bool {
        let term = &self[self[from].owner];
        if !term.app_name().is_some_and(|n| &self[n] == "if") || term.child_ids.len() != 3 {
            return false;
        }
        let Some(lit) = self.lits.get_assign(term.child_ids[0], &self.stack) else {
            return false;
        };
        let from = if self[lit].term.value {
            term.child_ids[1]
        } else {
            term.child_ids[2]
        };
        let Some(from) = self.egraph.get_enode_imm(from, &self.stack) else {
            debug_assert!(false, "if child not in egraph");
            return false;
        };
        self.check_eq(from, to)
    }
}

// Z3 ISSUE: https://github.com/viperproject/smt-scope/issues/63

#[derive(Debug, Clone, Copy)]
pub struct TransEqAllowed {
    pub can_mismatch_initial: bool,
    pub can_mismatch_congr: bool,
}

impl Z3Parser {
    pub(super) fn make_blamed(
        &mut self,
        match_: &MatchKind,
        blamed: Vec<(usize, ENodeIdx, BlamedEqsParse)>,
        pat: TermIdx,
    ) -> Result<(bool, Box<[Blame]>)> {
        let pattern = &self[pat];
        if blamed.len() < pattern.child_ids.len() {
            return Err(E::SubpatTooFewBlame(pattern.child_ids.len() - blamed.len()));
        }

        let mut finder = BlameFinder::new(self, match_, blamed, pat)?;
        if let Some((correct_order, result)) = finder.find_blamed::<BasicEq>()? {
            return Ok((correct_order, result));
        }
        if let Some((correct_order, result)) = finder.find_blamed::<ComplexEq>()? {
            return Ok((correct_order, result));
        }
        if let Some((correct_order, result)) = finder.find_blamed::<CustomEq>()? {
            return Ok((correct_order, result));
        }
        if let Some((correct_order, result)) = finder.find_blamed::<ForceEq>()? {
            return Ok((correct_order, result));
        }

        let not_found = finder.not_found();
        Err(E::SubpatNoBlame(not_found))
    }
}

// Z3 ISSUE: https://github.com/viperproject/smt-scope/issues/100

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub(super) struct TermsBug {
    /// Solve bug by switching to an artificial namespace after a "string" mk_app.
    get_model: Option<IString>,
    get_model_idx: u32,
}

impl Terms {
    /// Normally one would use `app_terms.parse_existing_id`, but here we
    /// implement the workaround for `get_model`.
    pub fn parse_app_child_id(&self, mut term_id: TermId) -> Result<TermIdx> {
        if let Some(namespace) = self.bug.get_model {
            debug_assert!(term_id.namespace.is_none());
            term_id.namespace = Some(namespace);
        }
        self.get_app_term_bug(term_id)
    }

    pub fn check_get_model(&mut self, id: &mut TermId, name: &str, strings: &mut StringTable) {
        let bug = &mut self.bug;
        let get_model = bug.get_model.take();
        if id.namespace.is_some() {
            return;
        }
        // See https://github.com/Z3Prover/z3/blob/z3-4.13.4/src/ast/format.cpp#L45-L52
        let Some(get_model) = get_model else {
            // Is a mk_app line with this term the start of a get-model command?
            if name == "string" {
                let namespace = format!("get-model-{}", bug.get_model_idx);
                bug.get_model_idx += 1;
                bug.get_model = Some(IString(strings.get_or_intern(namespace)));
                id.namespace = bug.get_model;
            }
            return;
        };
        match name {
            "string" | "cr" | "compose" | "indent" | "choice" => {
                bug.get_model = Some(get_model);
                id.namespace = Some(get_model);
            }
            _ => (),
        }
    }
}

// TODO (file issue): the produced body of an instantiation can be different than the
// expected one with normal substitutions.

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub(super) struct InstanceBody {
    pub req_eqs: FxHashMap<TermIdx, FxHashSet<EqGivenIdx>>,
}

impl Z3Parser {
    pub(super) fn instance_body(
        &self,
        proof: Option<ProofIdx>,
        midx: MatchIdx,
    ) -> Option<InstanceBody> {
        let proof = &self[proof?];
        // Can be Quantifier or MBQI kind here
        let match_ = &self[midx];
        let Some((qidx, bound)) = match_.kind.quant_and_enodes() else {
            debug_assert!(false, "unexpected kind {match_:?}");
            return None;
        };
        let body = match proof.kind {
            ProofStepKind::PR_QUANT_INST => {
                // Proved `¬quant ∨ body`
                let result = &self[proof.result];
                debug_assert_eq!(result.child_ids.len(), 2);
                debug_assert!(result.app_name().is_some_and(|n| &self[n] == "or"));
                debug_assert!({
                    let not = &self[result.child_ids[0]];
                    not.child_ids.len() == 1
                        && not.app_name().is_some_and(|n| &self[n] == "not")
                        && self[not.child_ids[0]]
                            .quant_idx()
                            .is_some_and(|q| q == qidx)
                });
                result.child_ids[1]
            }
            ProofStepKind::PR_TRANS => {
                // Proved `body = true`, regardless of quant truth
                let result = &self[proof.result];
                debug_assert_eq!(result.child_ids.len(), 2);
                debug_assert!(result.app_name().is_some_and(|n| &self[n] == "="));
                debug_assert!({
                    let true_ = &self[result.child_ids[1]];
                    true_.child_ids.is_empty()
                        && true_.app_name().is_some_and(|n| &self[n] == "true")
                });
                result.child_ids[0]
            }
            _ => {
                debug_assert!(
                    false,
                    "unexpected kind {proof:?} / {:?}",
                    self[proof.result].id
                );
                return None;
            }
        };
        let Some(qbody) = self.quantifier_body(qidx) else {
            debug_assert!(false, "quantifier {:?} has no body", self[qidx]);
            return None;
        };
        let mut ib = InstanceBody::default();
        self.mk_instance_body(bound, qbody, body, &mut ib);
        Some(ib)
    }

    fn mk_instance_body(
        &self,
        bound: BoundVars<ENodeIdx>,
        qbody: TermIdx,
        body: TermIdx,
        ib: &mut InstanceBody,
    ) {
        let Entry::Vacant(v) = ib.req_eqs.entry(body) else {
            return;
        };

        let qb = &self[qbody];
        if qb.has_var().is_some_and(|v| !v) {
            debug_assert_eq!(qbody, body, "unexpected unequal no var body");
            return;
        }

        match qb.kind() {
            TermKind::Var(qvar) => {
                let qb = bound.get(qvar).unwrap();
                let qbody = self[qb].owner;
                if qbody != body {
                    let Some(b) = self.egraph.get_enode_imm(body, &self.stack) else {
                        debug_assert!(false, "body not in egraph");
                        return;
                    };
                    let Some(eq) = self.egraph.get_given(qb, b) else {
                        debug_assert!(false, "no eq found");
                        return;
                    };
                    v.insert(Default::default()).insert(eq);
                }
            }
            TermKind::Quant(..) => {
                debug_assert_eq!(qbody, body, "unexpected unequal quant body");
            }
            TermKind::App(qname) => {
                let b = &self[body];
                debug_assert!(!b.has_var().is_some_and(|v| v));
                let TermKind::App(name) = b.kind() else {
                    debug_assert!(false, "unexpected kind {b:?}");
                    return;
                };
                if qname == name && qb.child_ids.len() == b.child_ids.len() {
                    for (q, b) in qb.child_ids.iter().zip(b.child_ids.iter()) {
                        self.mk_instance_body(bound, *q, *b, ib);
                    }
                    let eqs = b.child_ids.iter();
                    let eqs: FxHashSet<_> = eqs
                        .flat_map(|b| {
                            let eqs = ib.req_eqs.get(b);
                            eqs.into_iter().flat_map(|e| e.iter().copied())
                        })
                        .collect();
                    if !eqs.is_empty() {
                        let old = ib.req_eqs.insert(body, eqs);
                        debug_assert!(old.is_none(), "unexpected old eqs {old:?}");
                    }
                } else {
                    debug_assert!(false, "unexpected app body {b:?}");
                }
            }
        }
    }
}
