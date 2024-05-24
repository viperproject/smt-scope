#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::*, parsers::z3::{VersionInfo, Z3LogParser}, Error, IString, Result, StringTable, TiVec
};

use super::{
    egraph::{EGraph, ENode},
    inst::Insts,
    stack::Stack,
    terms::Terms,
};

/// A parser for Z3 log files. Use one of the various `Z3Parser::from_*` methods
/// to construct this parser.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Z3Parser {
    pub(super) version_info: VersionInfo,
    pub(super) terms: Terms,

    pub(super) quantifiers: TiVec<QuantIdx, Quantifier>,

    pub(super) insts: Insts,
    pub(super) inst_stack: Vec<(InstIdx, Vec<ENodeIdx>)>,

    pub(crate) egraph: EGraph,
    pub(super) stack: Stack,

    pub strings: StringTable,
}

impl Default for Z3Parser {
    fn default() -> Self {
        let mut strings = StringTable::with_hasher(fxhash::FxBuildHasher::default());
        Self {
            version_info: VersionInfo::default(),
            terms: Terms::new(&mut strings),
            quantifiers: Default::default(),
            insts: Default::default(),
            inst_stack: Default::default(),
            egraph: Default::default(),
            stack: Default::default(),
            strings,
        }
    }
}

impl Z3Parser {
    pub fn parse_existing_enode(&mut self, id: &str) -> Result<ENodeIdx> {
        let idx = self.terms.parse_existing_id(&mut self.strings, id)?;
        let enode = self.egraph.get_enode(idx, &self.stack);
        if self.version_info.is_version(4, 12, 2) && enode.is_err() {
            // Very rarely in version 4.12.2, an `[attach-enode]` is not emitted. Create it here.
            // TODO: log somewhere when this happens.
            self.egraph.new_enode(None, idx, None, &self.stack)?;
            return self.egraph.get_enode(idx, &self.stack);
        }
        enode
    }
    pub fn parse_z3_generation<'a>(
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<Option<u32>> {
        if let Some(gen) = l.next() {
            Ok(gen.parse::<u32>().map(Some).map_err(Error::InvalidGeneration)?)
        } else {
            Ok(None)
        }
    }

    fn gobble_children<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<Box<[TermIdx]>> {
        l.map(|id| self.terms.parse_existing_id(&mut self.strings, id)).collect()
    }
    fn gobble_var_names_list<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<VarNames> {
        let mut t = Self::gobble_tuples::<true>(l);
        // TODO: if the list can be empty then remove the first `?` and
        // replace with default case.
        let (first, second) = t.next().ok_or(Error::UnexpectedEnd)??;
        if first == "" {
            let first = Ok(IString(self.strings.get_or_intern(second)));
            let tuples = t.map(|t| match t? {
                ("", second) => Ok(IString(self.strings.get_or_intern(second))),
                _ => Err(Error::VarNamesListInconsistent),
            });
            let types = [first].into_iter().chain(tuples);
            Ok(VarNames::TypeOnly(types.collect::<Result<_>>()?))
        } else {
            fn strip_bars(
                strings: &mut StringTable,
                (first, second): (&str, &str),
            ) -> Result<(IString, IString)> {
                let first = first.strip_prefix('|').ok_or(Error::VarNamesNoBar)?.strip_suffix('|').ok_or(Error::VarNamesNoBar)?;
                let second = second.strip_prefix('|').ok_or(Error::VarNamesNoBar)?.strip_suffix('|').ok_or(Error::VarNamesNoBar)?;
                Ok((IString(strings.get_or_intern(first)), IString(strings.get_or_intern(second))))
            }
            let first = strip_bars(&mut self.strings, (first, second));
            let tuples = t.map(|t| strip_bars(&mut self.strings, t?));
            let names_and_types = [first].into_iter().chain(tuples);
            Ok(VarNames::NameAndType(
                names_and_types.collect::<Result<_>>()?,
            ))
        }
    }
    /// Gobble tuples with any of the following forms (`A` and `B` can be empty):
    ///  - `(A;B)`
    ///  - `(A B)`
    ///  - `(A ; B)`
    /// The resulting iterator will contain `None` for any tuples which it failed to parse.
    /// If `FORMS_EQUAL` is true, then it will return `None` for any tuples which have a different
    /// form to the first tuple.
    #[must_use]
    fn gobble_tuples<'a, const FORMS_EQUAL: bool>(
        mut l: impl Iterator<Item = &'a str>,
    ) -> impl Iterator<Item = Result<(&'a str, &'a str)>> {
        let mut spaces = None;
        let mut gobble = move || {
            let Some(first) = l.next() else {
                return Ok(None);
            };
            let (first, second) = if first.ends_with(')') {
                let spaces = *spaces.get_or_insert(0);
                if FORMS_EQUAL && spaces != 0 {
                    return Err(Error::UnequalTupleForms(spaces, 0));
                }
                let mut l = first.split(';');
                (l.next().ok_or(Error::UnexpectedNewline)?, l.next().ok_or(Error::UnexpectedNewline)?)
            } else {
                let middle = l.next().ok_or(Error::UnexpectedNewline)?;
                if middle != ";" {
                    let spaces = *spaces.get_or_insert(1);
                    if FORMS_EQUAL && spaces != 1 {
                        return Err(Error::UnequalTupleForms(spaces, 1));
                    }
                    (first, middle)
                } else {
                    let spaces = *spaces.get_or_insert(2);
                    if FORMS_EQUAL && spaces != 2 {
                        return Err(Error::UnequalTupleForms(spaces, 2));
                    }
                    let second = l.next().ok_or(Error::UnexpectedNewline)?;
                    (first, second)
                }
            };
            let t = (first.strip_prefix('(').ok_or(Error::TupleMissingParens)?, second.strip_suffix(')').ok_or(Error::TupleMissingParens)?);
            Ok(Some(t))
        };
        let inverted_gobble = move |_| gobble().map_or_else(|err| Some(Err(err)), |ok| ok.map(Ok));
        std::iter::repeat(()).map_while(inverted_gobble)
    }
    fn parse_trans_equality(
        &mut self,
        can_mismatch: bool,
    ) -> impl FnMut(&str, &str) -> Result<EqTransIdx> + '_ {
        move |from, to| {
            let from = self.parse_existing_enode(from)?;
            let to = self.parse_existing_enode(to)?;
            if can_mismatch {
                // See comment in `EGraph::get_equalities`
                let can_mismatch = |egraph: &EGraph| self.version_info.is_ge_version(4, 12, 3) &&
                    self.terms[egraph.get_owner(to)].kind.app_name().is_some_and(|app| &self.strings[*app] == "if");
                self.egraph.new_trans_equality(from, to, &self.stack, can_mismatch)
            } else {
                fn cannot_mismatch(_: &EGraph) -> bool { false }
                self.egraph.new_trans_equality(from, to, &self.stack, cannot_mismatch)
            }
        }
    }
    fn append_trans_equality_tuples<'a>(
        &mut self,
        l: impl Iterator<Item = &'a str>,
        can_mismatch: bool,
        mut f: impl FnMut(EqTransIdx) -> Result<()>,
    ) -> Result<()> {
        let mut pte = self.parse_trans_equality(can_mismatch);
        for t in Self::gobble_tuples::<true>(l) {
            let (from, to) = t?;
            let trans = pte(from, to)?;
            f(trans)?;
        }
        Ok(())
    }

    /// Create a new iterator which will only consume elements from `l` until
    /// it finds `end`. The element `end` will also be consumed but no other elements after that will.
    #[must_use]
    fn iter_until_eq<'a, 's>(
        l: &'a mut impl Iterator<Item = &'s str>,
        end: &'a str,
    ) -> impl Iterator<Item = &'s str> + 'a {
        l.take_while(move |elem| *elem != end)
    }
    fn expect_completed<'s>(mut l: impl Iterator<Item = &'s str>) -> Result<()> {
        l.next().map_or(Ok(()), |more| Err(Error::ExpectedNewline(more.to_string())))
    }
}

impl Z3LogParser for Z3Parser {
    fn version_info<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let solver = l.next().ok_or(Error::UnexpectedNewline)?.to_string();
        let version = l.next().ok_or(Error::UnexpectedNewline)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let version = semver::Version::parse(version)?;
        println!("{solver} {version}");
        self.version_info = VersionInfo::Present { solver, version };
        Ok(())
    }

    fn mk_quant<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = l
            .next()
            .ok_or(Error::UnexpectedNewline)?;
        let full_id = TermId::parse(&mut self.strings, full_id)?;
        let mut quant_name = std::borrow::Cow::Borrowed(l.next().ok_or(Error::UnexpectedNewline)?);
        let mut num_vars_str = l.next().ok_or(Error::UnexpectedNewline)?;
        let mut num_vars = num_vars_str.parse::<usize>();
        // The name may contain spaces... TODO: PR to add quotes around name when logging in z3
        while num_vars.is_err() {
            quant_name = std::borrow::Cow::Owned(format!("{quant_name} {num_vars_str}"));
            num_vars_str = l.next().ok_or(Error::UnexpectedNewline)?;
            num_vars = num_vars_str.parse::<usize>();
        }
        let quant_name = QuantKind::parse(&mut self.strings, &*quant_name);
        let num_vars = num_vars.unwrap();
        let child_ids = self.gobble_children(l)?;
        assert!(!child_ids.is_empty());
        let qidx = self.quantifiers.next_key();
        let term = Term {
            id: Some(full_id),
            kind: TermKind::Quant(qidx),
            child_ids,
        };
        let tidx = self.terms.new_term(term, false)?;
        let q = Quantifier {
            num_vars,
            kind: quant_name,
            term: Some(tidx),
            vars: None,
        };
        self.quantifiers.raw.try_reserve(1)?;
        let qidx2 = self.quantifiers.push_and_get_key(q);
        debug_assert_eq!(qidx, qidx2);
        Ok(())
    }

    fn mk_var<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = l
            .next()
            .ok_or(Error::UnexpectedNewline)?;
        let full_id = TermId::parse(&mut self.strings, full_id)?;
        let kind = l.next().ok_or(Error::UnexpectedNewline)?;
        let kind = TermKind::parse_var(kind)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let term = Term {
            id: Some(full_id),
            kind,
            child_ids: Default::default(),
        };
        self.terms.new_term(term, false)?;
        Ok(())
    }

    fn mk_proof_app<'a>(
        &mut self,
        mut l: impl Iterator<Item = &'a str>,
        is_proof: bool,
    ) -> Result<()> {
        let full_id = l
            .next()
            .ok_or(Error::UnexpectedNewline)?;
        let full_id = TermId::parse(&mut self.strings, full_id)?;
        let name = IString(self.strings.get_or_intern(l.next().ok_or(Error::UnexpectedNewline)?));
        // TODO: add rewrite, monotonicity cases
        let (child_ids, kind) = if is_proof {
            let results = self.gobble_children(l)?;
            let Some((result, prerequisites)) = results.split_last() else {
                return Err(Error::UnexpectedEnd)
            };
            (prerequisites.into(), TermKind::parse_proof(name, *result))
        } else {
            let child_ids = self.gobble_children(l)?;
            (child_ids, TermKind::parse_app(name))
        };
        let term = Term {
            id: Some(full_id),
            kind,
            child_ids,
        };
        self.terms.new_term(term, is_proof)?;
        Ok(())
    }

    fn attach_meaning<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(Error::UnexpectedNewline)?;
        let theory = IString(self.strings.get_or_intern(l.next().ok_or(Error::UnexpectedNewline)?));
        let value = IString(self.strings.get_or_intern(l.collect::<Vec<_>>().join(" ")));
        let meaning = Meaning { theory, value };
        let idx = self.terms.parse_existing_id(&mut self.strings, id)?;
        self.terms.new_meaning(idx, meaning)?;
        Ok(())
    }

    fn attach_var_names<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(Error::UnexpectedNewline)?;
        let var_names = self.gobble_var_names_list(l)?;
        let tidx = self.terms.parse_existing_id(&mut self.strings, id)?;
        let qidx = self.terms.quant(tidx)?;
        assert!(self.quantifiers[qidx].vars.is_none());
        self.quantifiers[qidx].vars = Some(var_names);
        Ok(())
    }

    fn attach_enode<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(Error::UnexpectedNewline)?;
        let idx = self.terms.parse_existing_id(&mut self.strings, id);
        let Ok(idx) = idx else {
            if self.version_info.is_version(4, 8, 7) {
                // Z3 4.8.7 seems to have a bug where it can emit a non-existent term id here.
                return Ok(());
            } else {
                return idx.map(|_| ());
            }
        };
        let z3_generation = Self::parse_z3_generation(&mut l)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        let created_by = self.inst_stack.last_mut();
        let iidx = created_by.as_ref().map(|(i, _)| *i);
        let enode = self
            .egraph
            .new_enode(iidx, idx, z3_generation, &self.stack)?;
        if let Some((_, yields_terms)) = created_by {
            // If `None` then this is a ground term not created by an instantiation.
            yields_terms.try_reserve(1)?;
            yields_terms.push(enode);
        }
        Ok(())
    }

    fn eq_expl<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let from = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
        let kind = l.next().ok_or(Error::UnexpectedNewline)?;
        let eq_expl = {
            let mut kind_dependent_info = Self::iter_until_eq(l.by_ref(), ";");
            match kind {
                "root" => EqualityExpl::Root { id: from },
                "lit" => {
                    let eq = kind_dependent_info.next().ok_or(Error::UnexpectedEnd)?;
                    let eq = self.parse_existing_enode(eq)?;
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    let eq_expl = EqualityExpl::Literal { from, eq, to };
                    // self.equalities.push(eq_expl.clone());
                    eq_expl
                }
                "cg" => {
                    let mut arg_eqs = Vec::new();
                    for t in Self::gobble_tuples::<true>(kind_dependent_info) {
                        let (from, to) = t?;
                        let from = self.parse_existing_enode(from)?;
                        let to = self.parse_existing_enode(to)?;
                        arg_eqs.push((from, to));
                    }
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Congruence { from, arg_eqs: arg_eqs.into_boxed_slice(), to, uses: Vec::new() }
                }
                "th" => {
                    let theory = IString(self.strings.get_or_intern(kind_dependent_info.next().ok_or(Error::UnexpectedEnd)?));
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Theory { from, theory, to }
                }
                "ax" => {
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Axiom { from, to }
                }
                kind => {
                    let args = kind_dependent_info
                        .map(|s| IString(self.strings.get_or_intern(s)))
                        .collect();
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Unknown {
                        kind: IString(self.strings.get_or_intern(kind)),
                        from,
                        args,
                        to,
                    }
                }
            }
        };
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        self.egraph.new_given_equality(from, eq_expl, &self.stack)?;
        Ok(())
    }

    fn new_match<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let fingerprint = l.next().ok_or(Error::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(fingerprint)?;
        let idx = self.terms.parse_existing_id(&mut self.strings, l.next().ok_or(Error::UnexpectedNewline)?)?;
        let quant = self.terms.quant(idx)?;
        let pattern = self.terms.parse_existing_id(&mut self.strings, l.next().ok_or(Error::UnexpectedNewline)?)?;
        let bound_terms = Self::iter_until_eq(&mut l, ";");
        let is_axiom = fingerprint.is_zero();

        let kind = if is_axiom {
            let bound_terms = bound_terms
                .map(|id| self.terms.parse_existing_id(&mut self.strings, id))
                .collect::<Result<_>>()?;
            MatchKind::Axiom {
                axiom: quant,
                pattern,
                bound_terms,
            }
        } else {
            let bound_terms = bound_terms
                .map(|id| self.parse_existing_enode(id))
                .collect::<Result<_>>()?;
            MatchKind::Quantifier {
                quant,
                pattern,
                bound_terms,
            }
        };

        let mut blamed = Vec::new();
        let mut next = l.next();
        while let Some(word) = next.take() {
            let term = self.parse_existing_enode(word)?;
            blamed.try_reserve(1)?;
            blamed.push(BlameKind::Term { term });
            // `append_trans_equality_tuples` would gobble the next term otherwise, so capture it instead.
            let l = l.by_ref().take_while(|s| {
                let cond = s.as_bytes().first().is_some_and(|f| *f == b'(')
                    || s.as_bytes().last().is_some_and(|l| *l == b')');
                if !cond {
                    next = Some(*s);
                }
                cond
            });
            self.append_trans_equality_tuples(l, true, |eq| {
                blamed.try_reserve(1)?;
                blamed.push(BlameKind::Equality { eq });
                Ok(())
            })?;
        }

        let match_ = Match { kind, blamed: blamed.into_boxed_slice(), };
        self.insts.new_match(fingerprint, match_)?;
        Ok(())
    }

    fn inst_discovered<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let method = l.next().ok_or(Error::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(l.next().ok_or(Error::UnexpectedNewline)?)?;

        let (kind, blamed) = match method {
            "theory-solving" => {
                debug_assert!(
                    fingerprint.is_zero(),
                    "Theory solving should have zero fingerprint"
                );
                let axiom_id = l
                    .next()
                    .ok_or(Error::UnexpectedNewline)?;
                let axiom_id = TermId::parse(&mut self.strings, axiom_id)?;

                let bound_terms = Self::iter_until_eq(&mut l, ";")
                    .map(|id| self.terms.parse_existing_id(&mut self.strings, id))
                    .collect::<Result<_>>()?;

                let mut blamed = Vec::new();
                let mut rewrite_of = None;
                while let Some(word) = l.next() {
                    let term = self.terms.parse_existing_id(&mut self.strings, word)?;
                    if let Ok(enode) = self.egraph.get_enode(term, &self.stack) {
                        if let Some(rewrite_of) = rewrite_of {
                            return Err(Error::NonRewriteAxiomInvalidEnode(rewrite_of));
                        }
                        blamed.try_reserve(1)?;
                        blamed.push(BlameKind::Term { term: enode });
                    } else {
                        if let Some(rewrite_of) = rewrite_of {
                            return Err(Error::RewriteAxiomMultipleTerms1(rewrite_of));
                        }
                        if !blamed.is_empty() {
                            return Err(Error::RewriteAxiomMultipleTerms2(blamed));
                        }
                        rewrite_of = Some(term);
                    }
                }

                let kind = MatchKind::TheorySolving {
                    axiom_id,
                    bound_terms,
                    rewrite_of,
                };
                (kind, blamed)
            }
            "MBQI" => {
                let quant = self.terms.parse_existing_id(&mut self.strings, l.next().ok_or(Error::UnexpectedNewline)?)?;
                let quant = self.terms.quant(quant)?;
                let bound_terms = l
                    .map(|id| self.parse_existing_enode(id))
                    .collect::<Result<_>>()?;
                let kind = MatchKind::MBQI { quant, bound_terms };
                (kind, Vec::new())
            }
            _ => return Err(Error::UnknownInstMethod(method.to_string())),
        };
        let match_ = Match { kind, blamed: blamed.into_boxed_slice() };
        self.insts.new_match(fingerprint, match_)?;
        Ok(())
    }

    fn instance<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let fingerprint = l.next().ok_or(Error::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(fingerprint)?;
        let mut proof = Self::iter_until_eq(&mut l, ";");
        let proof_id = if let Some(proof) = proof.next() {
            Some(self.terms.parse_id(&mut self.strings, proof)?)
        } else {
            None
        };
        Self::expect_completed(proof)?;
        let z3_generation = Self::parse_z3_generation(&mut l)?;

        let match_ = self.insts.get_match(fingerprint).ok_or(Error::UnknownFingerprint(fingerprint))?;
        let inst = Instantiation {
            match_,
            fingerprint,
            proof_id,
            z3_generation,
            yields_terms: Default::default(),
        };
        // In version 4.12.2, I have on very rare occasions seen an `[instance]`
        // repeated twice with the same fingerprint (without an intermediate
        // `[new-match]`). We can try to remove the `can_duplicate` in the future.
        let iidx = self.insts.new_inst(fingerprint, inst, self.version_info.is_version(4, 12, 2))?;
        self.inst_stack.try_reserve(1)?;
        self.inst_stack.push((iidx, Vec::new()));
        Ok(())
    }

    fn end_of_instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        let (iidx, yield_terms) = self.inst_stack.pop().ok_or(Error::UnmatchedEndOfInstance)?;
        self.insts[iidx].yields_terms = yield_terms.into_boxed_slice();
        Self::expect_completed(l)
    }

    fn eof(&mut self) {
        self.terms.end_of_file();
    }

    fn push<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let scope = l.next().ok_or(Error::UnexpectedNewline)?;
        let scope = scope.parse::<usize>().map_err(Error::InvalidFrameInteger)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        self.stack.new_frame(scope)
    }

    fn pop<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let num = l.next().ok_or(Error::UnexpectedNewline)?;
        let num = num.parse::<usize>().map_err(Error::InvalidFrameInteger)?;
        let scope = l.next().ok_or(Error::UnexpectedNewline)?;
        let scope = scope.parse::<usize>().map_err(Error::InvalidFrameInteger)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        self.stack.pop_frames(num, scope)
    }
}

impl Z3Parser {
    pub fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.terms.meaning(tidx)
    }

    pub fn quant_count_incl_theory_solving(&self) -> (usize, bool) {
        (self.quantifiers.len(), self.insts.has_theory_solving_inst())
    }

    pub fn quantifiers(&self) -> impl Iterator<Item = (QuantIdx, &Quantifier)> {
        self.quantifiers.iter_enumerated()
    }
    pub fn instantiations(&self) -> impl Iterator<Item = (InstIdx, &Instantiation)> {
        self.insts.insts.iter_enumerated()
    }
    pub fn term_of_proof_step(&self, ps: ProofIdx) -> Option<&TermIdx> {
        self.terms.proof_steps.get(ps)
    }
}

impl std::ops::Index<TermIdx> for Z3Parser {
    type Output = Term;
    fn index(&self, idx: TermIdx) -> &Self::Output {
        &self.terms[idx]
    }
}
impl std::ops::Index<QuantIdx> for Z3Parser {
    type Output = Quantifier;
    fn index(&self, idx: QuantIdx) -> &Self::Output {
        &self.quantifiers[idx]
    }
}
impl std::ops::Index<ENodeIdx> for Z3Parser {
    type Output = ENode;
    fn index(&self, idx: ENodeIdx) -> &Self::Output {
        &self.egraph[idx]
    }
}
impl std::ops::Index<InstIdx> for Z3Parser {
    type Output = Instantiation;
    fn index(&self, idx: InstIdx) -> &Self::Output {
        &self.insts[idx]
    }
}
impl std::ops::Index<MatchIdx> for Z3Parser {
    type Output = Match;
    fn index(&self, idx: MatchIdx) -> &Self::Output {
        &self.insts[idx]
    }
}
impl std::ops::Index<EqGivenIdx> for Z3Parser {
    type Output = EqualityExpl;
    fn index(&self, idx: EqGivenIdx) -> &Self::Output {
        &self.egraph.equalities.given[idx]
    }
}
impl std::ops::Index<EqTransIdx> for Z3Parser {
    type Output = TransitiveExpl;
    fn index(&self, idx: EqTransIdx) -> &Self::Output {
        &self.egraph.equalities.transitive[idx]
    }
}
impl std::ops::Index<IString> for Z3Parser {
    type Output = str;
    fn index(&self, idx: IString) -> &Self::Output {
        &self.strings[*idx]
    }
}
