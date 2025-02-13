use crate::{
    items::{Blame, Coupling, ENodeIdx, EqTransIdx, MatchKind, Term, TermIdx},
    FxHashMap, NonMaxU32, Result,
};

use super::{bugs::TransEqAllowed, Z3Parser};

// Z3 ISSUE: https://github.com/viperproject/smt-scope/issues/63

impl Z3Parser {
    pub(super) fn check_match(&self, match_: &MatchKind, blame: &Blame, subpat: TermIdx) -> bool {
        let eqs = blame
            .equalities
            .iter()
            .map(|&eq| self.from_to(eq))
            .collect::<Box<[_]>>();
        let mut data = BasicEq::new(self, &eqs, core::iter::empty(), &[]);
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

impl Blame {
    fn ok(&self) -> Option<&Self> {
        match self.coupling {
            Coupling::Error => None,
            _ => Some(self),
        }
    }
}

pub(super) type BlamedEqsParse = Vec<(ENodeIdx, ENodeIdx)>;

pub(super) struct BlameFinder<'a> {
    parser: &'a mut Z3Parser,
    match_: &'a MatchKind,
    result: Box<[Blame]>,
    blamed: Vec<(usize, ENodeIdx, BlamedEqsParse)>,
    impossible: Vec<(usize, ENodeIdx, BlamedEqsParse)>,
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
        debug_assert!(to_find <= blamed.len());
        Ok(Self {
            parser,
            match_,
            result,
            blamed,
            impossible: Vec::new(),
            pat,
            correct_order,
            to_find,
        })
    }

    /// Remove blames that are impossible to match a subpat
    fn remove_impossible(&mut self) {
        let pat = &self.parser[self.pat];
        self.blamed.retain_mut(|(j, enode, eqs)| {
            let blame = &self.parser[self.parser[*enode].owner];
            for (i, result) in self.result.iter_mut().enumerate() {
                if !matches!(result.coupling, Coupling::Error) {
                    continue;
                }
                let subpat = &self.parser[pat.child_ids[i]];
                if blame.can_match(subpat) {
                    return true;
                }
            }
            self.impossible.push((*j, *enode, core::mem::take(eqs)));
            false
        });
        debug_assert!(self.to_find <= self.blamed.len());
    }

    pub(super) fn find_blamed<E: EqRewriter>(&mut self) -> Result<Option<(bool, Box<[Blame]>)>> {
        debug_assert_ne!(self.to_find, 0);
        debug_assert_eq!(self.result.len(), self.parser[self.pat].child_ids.len());

        self.remove_impossible();
        let mut error = Ok(());
        let mut dup_fixed = false;
        self.blamed.retain(|(j, enode, eqs)| {
            if error.is_err() || dup_fixed {
                return true;
            }
            let finished = self.result.iter().filter_map(Blame::ok);
            let used_eqs = finished.flat_map(|b| b.equalities.iter().copied());
            let mut data = E::new(self.parser, eqs, used_eqs, &self.impossible);
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
        // use crate::display_with::DisplayWithCtxt;
        // let pattern = &self.parser[self.pat];
        // let blamed = self.blamed.iter().map(|(i, enode, equalities)| {
        //     let eqs = equalities
        //         .iter()
        //         .map(|&(from, to)| {
        //             format!("{} <--> {}", from.debug(self.parser), to.debug(self.parser))
        //         })
        //         .collect::<Vec<_>>();
        //     format!(
        //         "{i} {}\n    [{}]",
        //         enode.debug(self.parser),
        //         eqs.join("\n    ")
        //     )
        // });
        // let impossible = self.impossible.iter().map(|(i, enode, equalities)| {
        //     let eqs = equalities
        //         .iter()
        //         .map(|&(from, to)| {
        //             format!("{} <--> {}", from.debug(self.parser), to.debug(self.parser))
        //         })
        //         .collect::<Vec<_>>();
        //     format!(
        //         "{i} {}\n    [{}]",
        //         enode.debug(self.parser),
        //         eqs.join("\n    ")
        //     )
        // });
        // let solved = self.result.iter().map(|b| {
        //     let eqs = b
        //         .equalities
        //         .iter()
        //         .map(|&eq| {
        //             let (from, to) = self.parser.from_to(eq);
        //             format!("{} <--> {}", from.debug(self.parser), to.debug(self.parser))
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
        //     "Pattern: [\n  {}\n] \n| Bound: [\n  {}\n] \n| Blamed: [\n  {}\n] \n| Impossible: [\n  {}\n] \n| Solved: [\n  {}\n]",
        //     pattern.child_ids.iter().map(|&sp| sp.debug(self.parser)).collect::<Vec<_>>().join("\n  "),
        //     (0..100).filter_map(NonMaxU32::new).filter_map(|i| self.parser.bound(self.match_, i)).map(|b| b.debug(self.parser)).collect::<Vec<_>>().join("\n  "),
        //     blamed.collect::<Vec<_>>().join("\n  "),
        //     impossible.collect::<Vec<_>>().join("\n  "),
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
        let can_mismatch_congr = parser.version_info.is_le_version(4, 8, 17);

        let equalities = match eqs
            .into_iter()
            .map(|(from, to)| {
                let can_mismatch_initial = Self::can_mismatch_initial(parser, from, to);
                let mismatch = TransEqAllowed {
                    can_mismatch_initial,
                    can_mismatch_congr,
                };
                let eq = parser
                    .egraph
                    .new_trans_equality(from, to, &parser.stack, mismatch);
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

    fn new<'a>(
        parser: &Z3Parser,
        eqs: &'a [(ENodeIdx, ENodeIdx)],
        used_eqs: impl Iterator<Item = EqTransIdx> + Clone,
        impossible: &'a [(usize, ENodeIdx, BlamedEqsParse)],
    ) -> Self::Data<'a>;
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>);
    fn coupling() -> Coupling;
    fn can_mismatch_initial(parser: &Z3Parser, _from: ENodeIdx, to: ENodeIdx) -> bool {
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
    fn new<'a>(
        _parser: &Z3Parser,
        equalities: &'a [(ENodeIdx, ENodeIdx)],
        _used_eqs: impl Iterator<Item = EqTransIdx>,
        _impossible: &[(usize, ENodeIdx, BlamedEqsParse)],
    ) -> Self::Data<'a> {
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
    fn new<'a>(
        parser: &Z3Parser,
        eqs: &'a [(ENodeIdx, ENodeIdx)],
        _used_eqs: impl Iterator<Item = EqTransIdx>,
        _impossible: &[(usize, ENodeIdx, BlamedEqsParse)],
    ) -> Self::Data<'a> {
        let mut self_ = Self(FxHashMap::default());
        self_.add_eqs(parser, eqs.iter().copied());
        self_
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

impl ComplexEq {
    fn add_eqs(&mut self, parser: &Z3Parser, eqs: impl Iterator<Item = (ENodeIdx, ENodeIdx)>) {
        for (from, to) in eqs {
            if from == to {
                continue;
            }
            let (ft, tt) = (parser[from].owner, parser[to].owner);
            self.0.entry(ft).or_insert((from, Vec::new())).1.push(to);
            self.0.entry(tt).or_insert((to, Vec::new())).1.push(from);
        }
    }
}

pub struct CustomEq(ComplexEq);

impl EqRewriter for CustomEq {
    type Data<'a> = Self;
    type EqRef = Option<ENodeIdx>;
    fn new<'a>(
        parser: &Z3Parser,
        eqs: &'a [(ENodeIdx, ENodeIdx)],
        used_eqs: impl Iterator<Item = EqTransIdx> + Clone,
        impossible: &[(usize, ENodeIdx, BlamedEqsParse)],
    ) -> Self::Data<'a> {
        let complex = ComplexEq::new(parser, eqs, used_eqs, impossible);
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
            // TODO: why is this sometimes None?
            if let Some(from) = parser.egraph.get_enode_imm(blame, &parser.stack) {
                if parser.egraph.check_eq(from, to, &parser.stack) {
                    return Some((from, 1, Some(to)));
                }
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

pub struct ForceEq<'a>(ComplexEq, &'a [(usize, ENodeIdx, BlamedEqsParse)]);

impl EqRewriter for ForceEq<'_> {
    type Data<'a> = ForceEq<'a>;
    type EqRef = Option<Option<ENodeIdx>>;
    const FORBID_DUPS: bool = true;
    fn new<'a>(
        parser: &Z3Parser,
        eqs: &'a [(ENodeIdx, ENodeIdx)],
        used_eqs: impl Iterator<Item = EqTransIdx> + Clone,
        impossible: &'a [(usize, ENodeIdx, BlamedEqsParse)],
    ) -> Self::Data<'a> {
        let mut complex = ComplexEq::new(parser, eqs, used_eqs.clone(), impossible);
        complex.add_eqs(parser, used_eqs.map(|eq| parser.from_to(eq)));
        ForceEq(complex, impossible)
    }
    fn reset(parser: &Z3Parser, data: &mut Self::Data<'_>) {
        ComplexEq::reset(parser, &mut data.0);
    }
    fn coupling() -> Coupling {
        Coupling::AddedEqs
    }
    fn can_mismatch_initial(_parser: &Z3Parser, _from: ENodeIdx, _to: ENodeIdx) -> bool {
        true
    }

    fn possible_rewrite_count(
        data: &mut Self::Data<'_>,
        parser: &Z3Parser,
        blame: TermIdx,
        subpat: TermIdx,
    ) -> Option<(ENodeIdx, usize, Self::EqRef)> {
        let mut from = Some(None);
        if let Some(to) = parser.egraph.get_enode_imm(subpat, &parser.stack) {
            // TODO: why is this sometimes None?
            let nfrom = parser.egraph.get_enode_imm(blame, &parser.stack);
            from = nfrom.map(Some);
            if let Some(from) = nfrom {
                return Some((from, 1, Some(Some(to))));
            }
        }
        if let Some((from, len, _)) =
            ComplexEq::possible_rewrite_count(&mut data.0, parser, blame, subpat)
        {
            return Some((from, len, None));
        }
        let from = from?.or_else(|| parser.egraph.get_enode_imm(blame, &parser.stack))?;
        Some((from, data.1.len(), Some(None)))
    }
    fn possible_rewrite(
        data: &mut Self::Data<'_>,
        _parser: &Z3Parser,
        blame: TermIdx,
        _subpat: TermIdx,
        idx: usize,
        eq_ref: &Self::EqRef,
    ) -> ENodeIdx {
        match eq_ref {
            Some(Some(to)) => *to,
            Some(None) => data.1[idx].1,
            None => ComplexEq::possible_rewrite(&mut data.0, _parser, blame, _subpat, idx, &()),
        }
    }
}
