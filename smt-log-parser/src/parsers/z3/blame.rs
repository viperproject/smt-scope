use crate::{
    items::{Blame, Coupling, ENodeIdx, MatchKind, Term, TermIdx},
    FxHashMap, NonMaxU32, Result,
};

use super::Z3Parser;

// Z3 ISSUE: https://github.com/viperproject/axiom-profiler-2/issues/63

impl Z3Parser {
    pub(super) fn check_match(&self, match_: &MatchKind, blame: &Blame, subpat: TermIdx) -> bool {
        let eqs = blame
            .equalities
            .iter()
            .map(|&eq| self.from_to(eq))
            .collect::<Box<[_]>>();
        let mut data = BasicEq::new(self, &eqs);
        let eqs_new = BasicEq::check_match(&mut data, self, match_, blame.enode, subpat);
        // if eqs_new.as_deref() != Some(&*eqs) {
        //     let eqs = blame.equalities
        //         .iter()
        //         .map(|&eq| {
        //             let (from, to) = self.from_to(eq);
        //             format!("{} <--> {}", from.debug(self), to.debug(self))
        //         })
        //         .collect::<Vec<_>>();
        //     let blamed = format!("{:?} {}\n    [{}]", blame.coupling, blame.enode.debug(self), eqs.join("\n    "));
        //     eprintln!(
        //         "Pattern: {}\nBound: [\n  {}\n]\nBlamed:\n{}\nWanted: {eqs_new:?}\n",
        //         subpat.debug(self),
        //         (0..100).filter_map(|i| self.bound(match_, i)).map(|b| b.debug(self)).collect::<Vec<_>>().join("\n  "),
        //         blamed,
        //     );
        // }
        eqs_new.as_deref() == Some(&*eqs)
    }

    fn bound(&self, match_: &MatchKind, qvar: NonMaxU32) -> Option<TermIdx> {
        match_.bound_term(|e| self[e].owner, qvar)
    }
}

pub(super) type BlamedEqsParse = Vec<(ENodeIdx, ENodeIdx)>;

pub(super) struct BlameFinder<'a> {
    parser: &'a mut Z3Parser,
    match_: &'a MatchKind,
    result: Box<[Blame]>,
    blamed: Vec<(usize, ENodeIdx, BlamedEqsParse)>,
    pat: TermIdx,
    correct_order: bool,
    to_find: usize,
}

impl<'a> BlameFinder<'a> {
    pub(super) fn new(
        parser: &'a mut Z3Parser,
        match_: &'a MatchKind,
        blamed: Vec<(usize, ENodeIdx, BlamedEqsParse)>,
        pat: TermIdx,
    ) -> Result<Self> {
        let pattern = &parser[pat];
        let mut result = Vec::new();
        result.try_reserve_exact(pattern.child_ids.len())?;
        for _ in 0..pattern.child_ids.len() {
            result.push(Blame {
                coupling: Coupling::Error,
                enode: ENodeIdx::MAX,
                equalities: Default::default(),
            });
        }
        let result = result.into_boxed_slice();
        let correct_order = true;
        let to_find = result.len();
        Ok(Self {
            parser,
            match_,
            result,
            blamed,
            pat,
            correct_order,
            to_find,
        })
    }

    pub(super) fn find_blamed<E: EqRewriter>(&mut self) -> Result<Option<(bool, Box<[Blame]>)>> {
        debug_assert_ne!(self.to_find, 0);
        debug_assert_eq!(self.result.len(), self.parser[self.pat].child_ids.len());
        let mut error = Ok(());
        let mut dup_fixed = false;
        self.blamed.retain(|(j, enode, eqs)| {
            if error.is_err() || dup_fixed {
                return true;
            }
            let mut data = E::new(self.parser, eqs);
            let mut fixed = false;
            for (i, result) in self.result.iter_mut().enumerate() {
                if !matches!(result.coupling, Coupling::Error) {
                    continue;
                }
                let subpat = self.parser[self.pat].child_ids[i];
                if let Some(fix) = E::rewrite(&mut data, self.parser, self.match_, *enode, subpat) {
                    if E::FORBID_DUPS && fixed {
                        dup_fixed = true;
                        return true;
                    }
                    fixed = true;
                    self.correct_order &= i == *j;
                    self.to_find -= 1;
                    match fix {
                        Ok(fix) => *result = fix,
                        Err(err) => error = Err(err),
                    };
                    if !E::FORBID_DUPS {
                        return false;
                    }
                }
            }
            // If `!FORBID_DUPS`, fixed is always false here.
            !E::FORBID_DUPS || !fixed
        });
        error?;
        if self.to_find == 0 {
            let result = core::mem::take(&mut self.result);
            Ok(Some((self.correct_order, result)))
        } else {
            Ok(None)
        }
    }

    pub fn not_found(self) -> Vec<TermIdx> {
        // let pattern = &self.parser[self.pat];
        // let blamed = self.blamed.iter().map(|(i, enode, equalities)| {
        //     let eqs = equalities
        //         .iter()
        //         .map(|&(from, to)| format!("{} <--> {}", from.debug(self.parser), to.debug(self.parser)))
        //         .collect::<Vec<_>>();
        //     format!("{i} {}\n    [{}]", enode.debug(self.parser), eqs.join("\n    "))
        // });
        // let solved = self.result.iter().map(|b| {
        //     let eqs = b
        //         .equalities
        //         .iter()
        //         .map(|&eq| {
        //             let eq = &self.parser[eq];
        //             format!("{} <--> {}", eq.from.debug(self.parser), eq.to.debug(self.parser))
        //         })
        //         .collect::<Vec<_>>();
        //     if matches!(b.coupling, Coupling::Error) {
        //         format!("ERROR")
        //     } else {
        //         format!(
        //             "{:?} {}\n    [{}]",
        //             b.coupling,
        //             b.enode.debug(self.parser),
        //             eqs.join("\n    ")
        //         )
        //     }
        // });
        // eprintln!(
        //     "Pattern: [\n  {}\n] \n| Bound: [\n  {}\n] \n| Blamed: [\n  {}\n] \n| Solved: [\n  {}\n]",
        //     pattern.child_ids.iter().map(|&sp| sp.debug(self.parser)).collect::<Vec<_>>().join("\n  "),
        //     (0..100).filter_map(|i| self.parser.bound(self.match_, i)).map(|b| b.debug(self.parser)).collect::<Vec<_>>().join("\n  "),
        //     blamed.collect::<Vec<_>>().join("\n  "),
        //     solved.collect::<Vec<_>>().join("\n  "),
        // );
        let errors = self
            .result
            .iter()
            .enumerate()
            .filter(|(_, r)| matches!(r.coupling, Coupling::Error));
        errors
            .map(|(i, _)| self.parser[self.pat].child_ids[i])
            .collect()
    }
}

// Blame - Subpat matching logic

pub trait EqRewriter {
    type Data<'a>;
    type EqRef;
    const FORBID_DUPS: bool = false;

    fn rewrite(
        data: &mut Self::Data<'_>,
        parser: &mut Z3Parser,
        match_: &MatchKind,
        blame: ENodeIdx,
        subpat: TermIdx,
    ) -> Option<Result<Blame>> {
        let eqs = Self::check_match(data, parser, match_, blame, subpat)?;

        let equalities = match eqs
            .into_iter()
            .map(|(from, to)| {
                let can_mismatch = Self::can_mismatch(parser, from, to);
                let eq = parser
                    .egraph
                    .new_trans_equality(from, to, &parser.stack, can_mismatch);
                eq.map(core::result::Result::unwrap)
            })
            .collect::<Result<_>>()
        {
            Ok(equalities) => equalities,
            Err(err) => return Some(Err(err)),
        };
        Some(Ok(Blame {
            coupling: Self::coupling(),
            enode: blame,
            equalities,
        }))
    }

    fn new<'a>(parser: &Z3Parser, eqs: &'a [(ENodeIdx, ENodeIdx)]) -> Self::Data<'a>;
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>);
    fn coupling() -> Coupling;
    fn can_mismatch(parser: &Z3Parser, _from: ENodeIdx, to: ENodeIdx) -> bool {
        // TODO: resolve this by adding the missing equality for the if?
        // See comment in `EGraph::get_equalities`
        let can_mismatch = parser.version_info.is_ge_version(4, 12, 3);
        can_mismatch
            && parser[parser[to].owner]
                .app_name()
                .is_some_and(|app| &parser[app] == "if")
    }

    fn check_match(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        match_: &MatchKind,
        blame: ENodeIdx,
        subpat: TermIdx,
    ) -> Option<Vec<(ENodeIdx, ENodeIdx)>> {
        Self::check_match_inner(data, parser, match_, blame, subpat)
    }
    fn check_match_inner(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        match_: &MatchKind,
        blame: ENodeIdx,
        subpat: TermIdx,
    ) -> Option<Vec<(ENodeIdx, ENodeIdx)>> {
        Self::reset(parser, data);
        let matcher = PatternMatcher::<Self>::new(parser, match_, data);
        matcher.check_match(blame, subpat)
    }

    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, Self::EqRef)>;
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
        idx: usize,
        eq_ref: &Self::EqRef,
    ) -> ENodeIdx;
    #[allow(unused_variables)]
    fn failed_rewrite(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
        eq_ref: Self::EqRef,
    ) {
    }
}

struct PatternMatcher<'a, 'e, E: EqRewriter + ?Sized> {
    parser: &'a Z3Parser,
    match_: &'a MatchKind,
    rewrites: Vec<(ENodeIdx, ENodeIdx)>,
    data: &'a mut E::Data<'e>,
}

impl<'a, 'e, E: EqRewriter + ?Sized> PatternMatcher<'a, 'e, E> {
    fn new(parser: &'a Z3Parser, match_: &'a MatchKind, data: &'a mut E::Data<'e>) -> Self {
        Self {
            parser,
            match_,
            rewrites: Vec::new(),
            data,
        }
    }

    fn check_match(
        mut self,
        blame: ENodeIdx,
        subpat: TermIdx,
    ) -> Option<Vec<(ENodeIdx, ENodeIdx)>> {
        let blame = self.parser[blame].owner;
        debug_assert!(self.parser[blame].has_var().is_some_and(|v| !v));
        debug_assert!(self.parser[subpat].has_var().is_some());
        self.check_match_inner(blame, subpat)
            .then_some(self.rewrites)
    }

    fn check_match_term(&mut self, blame: &Term, subpat: &Term) -> bool {
        if !blame.can_match(subpat) {
            return false;
        }
        let rewrites_len = self.rewrites.len();
        let mut children = blame.child_ids.iter().zip(subpat.child_ids.iter());
        if children.all(|(&b, &s)| self.check_match_inner(b, s)) {
            true
        } else {
            self.rewrites.truncate(rewrites_len);
            false
        }
    }

    fn check_match_inner(&mut self, blame: TermIdx, subpat: TermIdx) -> bool {
        if blame == subpat {
            return true;
        }
        // Base case of qvar
        let subpat_term = &self.parser[subpat];
        if let Some(qvar) = subpat_term.var_idx() {
            let subpat = self.parser.bound(self.match_, qvar).unwrap();
            debug_assert!(self.parser[subpat].has_var().is_some_and(|v| !v));
            return self.check_match_inner(blame, subpat);
        }
        // Base case with no qvars
        if !subpat_term.has_var().unwrap_or_default() {
            return self.check_exact(blame, subpat);
        }
        // Recursive case with qvars
        let blame_term = &self.parser[blame];
        if self.check_match_term(blame_term, subpat_term) {
            return true;
        }
        // Failed to match without rewrite, try with rewrite
        let Some((from, rewrites, eq_ref)) =
            E::possible_rewrite_count(self.data, self.parser, blame, subpat)
        else {
            return false;
        };
        for i in 0..rewrites {
            let to = E::possible_rewrite(self.data, self.parser, blame, subpat, i, &eq_ref);
            let blame = &self.parser[self.parser[to].owner];
            self.rewrites.push((from, to));
            if self.check_match_term(blame, subpat_term) {
                return true;
            }
            self.rewrites.pop();
        }
        E::failed_rewrite(self.data, self.parser, blame, subpat, eq_ref);
        false
    }

    fn check_exact(&mut self, blame: TermIdx, subpat: TermIdx) -> bool {
        debug_assert!(self.parser[subpat].has_var().is_some_and(|v| !v));
        let Some((from, rewrites, eq_ref)) =
            E::possible_rewrite_count(self.data, self.parser, blame, subpat)
        else {
            return false;
        };
        for i in 0..rewrites {
            let to = E::possible_rewrite(self.data, self.parser, blame, subpat, i, &eq_ref);
            if self.parser[to].owner == subpat {
                self.rewrites.push((from, to));
                return true;
            }
        }
        E::failed_rewrite(self.data, self.parser, blame, subpat, eq_ref);
        false
    }
}

pub struct BasicEq<'a> {
    curr_idx: usize,
    curr_from: Option<TermIdx>,
    equalities: &'a [(ENodeIdx, ENodeIdx)],
}

impl<'a> BasicEq<'a> {
    fn is_refl(&self) -> bool {
        self.equalities
            .get(self.curr_idx)
            .is_some_and(|(from, to)| from == to)
    }
    fn incr_idx(&mut self, parser: &Z3Parser) {
        self.curr_idx += 1;
        self.update_curr(parser);
    }
    fn update_curr(&mut self, parser: &Z3Parser) {
        while self.is_refl() {
            self.curr_idx += 1;
        }
        self.curr_from = self
            .equalities
            .get(self.curr_idx)
            .map(|&(from, _)| parser[from].owner);
    }
}

impl EqRewriter for BasicEq<'_> {
    type Data<'a> = BasicEq<'a>;
    type EqRef = usize;
    fn new<'a>(_parser: &Z3Parser, equalities: &'a [(ENodeIdx, ENodeIdx)]) -> Self::Data<'a> {
        Self::Data {
            curr_idx: usize::MAX,
            curr_from: None,
            equalities,
        }
    }
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>) {
        data.curr_idx = 0;
        data.update_curr(parser);
    }
    fn coupling() -> Coupling {
        Coupling::Exact
    }

    fn check_match(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        match_: &MatchKind,
        blame: ENodeIdx,
        subpat: TermIdx,
    ) -> Option<Vec<(ENodeIdx, ENodeIdx)>> {
        let eqs = Self::check_match_inner(data, parser, match_, blame, subpat)?;
        data.curr_from.is_none().then_some(eqs)
    }
    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, usize)> {
        if data.curr_from? == blame {
            let curr_idx = data.curr_idx;
            data.incr_idx(parser);
            let from = data.equalities[curr_idx].0;
            Some((from, 1, curr_idx))
        } else {
            None
        }
    }
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        _blame: TermIdx,
        _subpat: TermIdx,
        idx: usize,
        curr_idx: &usize,
    ) -> ENodeIdx {
        debug_assert_eq!(idx, 0);
        data.equalities[*curr_idx].1
    }
    fn failed_rewrite(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
        curr_idx: usize,
    ) {
        data.curr_idx = curr_idx;
        data.update_curr(parser);
        debug_assert_eq!(data.curr_idx, curr_idx);
        debug_assert_eq!(data.curr_from, Some(blame));
    }
}

pub struct ComplexEq(FxHashMap<TermIdx, (ENodeIdx, Vec<ENodeIdx>)>);

impl EqRewriter for ComplexEq {
    type Data<'a> = Self;
    type EqRef = ();
    fn new<'a>(parser: &Z3Parser, eqs: &'a [(ENodeIdx, ENodeIdx)]) -> Self::Data<'a> {
        let mut equalities = FxHashMap::default();
        for (from, to) in eqs.iter().copied() {
            if from == to {
                continue;
            }
            let (ft, tt) = (parser[from].owner, parser[to].owner);
            equalities
                .entry(ft)
                .or_insert((from, Vec::new()))
                .1
                .push(to);
            equalities
                .entry(tt)
                .or_insert((to, Vec::new()))
                .1
                .push(from);
        }
        Self(equalities)
    }
    fn reset(_parser: &Z3Parser, _data: &mut Self::Data<'_>) {}
    fn coupling() -> Coupling {
        Coupling::SwappedEqs
    }

    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, ())> {
        let (from, tos) = data.0.get(&blame)?;
        Some((*from, tos.len(), ()))
    }
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
        idx: usize,
        _: &(),
    ) -> ENodeIdx {
        data.0[&blame].1[idx]
    }
}

pub struct CustomEq(ComplexEq);

impl EqRewriter for CustomEq {
    type Data<'a> = Self;
    type EqRef = Option<ENodeIdx>;
    fn new<'a>(parser: &Z3Parser, eqs: &'a [(ENodeIdx, ENodeIdx)]) -> Self::Data<'a> {
        let complex = ComplexEq::new(parser, eqs);
        Self(complex)
    }
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>) {
        ComplexEq::reset(parser, &mut data.0);
    }
    fn coupling() -> Coupling {
        Coupling::MissingEqs
    }

    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, Option<ENodeIdx>)> {
        // let subpat = &parser[subpat];
        // if subpat.app_name().is_some_and(|app| &parser[app] == "if") && subpat.child_ids.len() == 3 {
        //     let true_ = parser.egraph.get_enode_imm(TermIdx::from(2), &parser.stack).unwrap();
        //     let false_ = parser.egraph.get_enode_imm(TermIdx::from(3), &parser.stack).unwrap();
        //     debug_assert_eq!(parser[parser[true_].owner].app_name().map(|app| &parser[app]), Some("true"));
        //     debug_assert_eq!(parser[parser[false_].owner].app_name().map(|app| &parser[app]), Some("false"));
        //     if let Some(cond) = parser.egraph.get_enode_imm(subpat.child_ids[0], &parser.stack) {
        //         let eq_true = parser.egraph.check_eq(cond, true_, &parser.stack);
        //         let eq_false = parser.egraph.check_eq(cond, false_, &parser.stack);
        //         eprintln!("REWRITE TO `if` {eq_true}/{eq_false}, cond #{}", parser[subpat.child_ids[0]].id.id.unwrap());
        //     }
        // }
        if let Some(to) = parser.egraph.get_enode_imm(subpat, &parser.stack) {
            let from = parser.egraph.get_enode_imm(blame, &parser.stack).unwrap();
            if parser.egraph.check_eq(from, to, &parser.stack) {
                return Some((from, 1, Some(to)));
            }
        }

        ComplexEq::possible_rewrite_count(&mut data.0, parser, blame, subpat)
            .map(|(from, len, _)| (from, len, None))
    }
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
        idx: usize,
        eq_ref: &Option<ENodeIdx>,
    ) -> ENodeIdx {
        if let Some(to) = eq_ref {
            return *to;
        }
        ComplexEq::possible_rewrite(&mut data.0, _parser, blame, _subpat, idx, &())
    }
}

pub struct ForceEq(ComplexEq);

impl EqRewriter for ForceEq {
    type Data<'a> = Self;
    type EqRef = Option<ENodeIdx>;
    const FORBID_DUPS: bool = true;
    fn new<'a>(parser: &Z3Parser, eqs: &'a [(ENodeIdx, ENodeIdx)]) -> Self::Data<'a> {
        let complex = ComplexEq::new(parser, eqs);
        Self(complex)
    }
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>) {
        ComplexEq::reset(parser, &mut data.0);
    }
    fn coupling() -> Coupling {
        Coupling::AddedEqs
    }
    fn can_mismatch(_parser: &Z3Parser, _from: ENodeIdx, _to: ENodeIdx) -> bool {
        true
    }

    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, Option<ENodeIdx>)> {
        if let Some(to) = parser.egraph.get_enode_imm(subpat, &parser.stack) {
            let from = parser.egraph.get_enode_imm(blame, &parser.stack).unwrap();
            return Some((from, 1, Some(to)));
        }
        ComplexEq::possible_rewrite_count(&mut data.0, parser, blame, subpat)
            .map(|(from, len, _)| (from, len, None))
    }
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
        idx: usize,
        eq_ref: &Option<ENodeIdx>,
    ) -> ENodeIdx {
        if let Some(to) = eq_ref {
            return *to;
        }
        ComplexEq::possible_rewrite(&mut data.0, _parser, blame, _subpat, idx, &())
    }
}
