use typed_index_collections::TiVec;

use crate::{
    Error, Result,
    items::*,
    parsers::z3::{VersionInfo, Z3LogParser},
};

use super::{
    egraph::{EGraph, ENode},
    inst::Insts,
    stack::Stack,
    terms::Terms,
};

/// A parser for Z3 log files. Use one of the various `Z3Parser::from_*` methods
/// to construct this parser.
#[derive(Debug)]
pub struct Z3Parser {
    pub(super) version_info: Option<VersionInfo>,
    pub(super) terms: Terms,

    pub(super) quantifiers: TiVec<QuantIdx, Quantifier>,

    pub(super) insts: Insts,
    pub(super) inst_stack: Vec<(InstIdx, Vec<ENodeIdx>)>,

    pub(super) egraph: EGraph,
    pub(super) stack: Stack,

    pub strings: StringTable,
}

impl Default for Z3Parser {
    fn default() -> Self {
        let mut strings = StringTable::with_hasher(fxhash::FxBuildHasher::default());
        Self {
            version_info: None,
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
    pub fn version_info(&self) -> Option<&VersionInfo> {
        self.version_info.as_ref()
    }
    pub fn is_version(&self, major: u64, minor: u64, patch: u64) -> bool {
        self.version_info.as_ref().is_some_and(|v| v.version == semver::Version::new(major, minor, patch))
    }
    pub fn is_ge_version(&self, major: u64, minor: u64, patch: u64) -> bool {
        self.version_info.as_ref().is_some_and(|v| v.version >= semver::Version::new(major, minor, patch))
    }

    pub fn parse_existing_enode(&mut self, id: &str) -> Result<ENodeIdx> {
        let idx = self.terms.parse_existing_id(&mut self.strings, id)?;
        let enode = self.egraph.get_enode(idx, &self.stack);
        if self.is_version(4, 12, 2) && enode.is_err() {
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
            let first = Ok(self.strings.get_or_intern(second));
            let tuples = t.map(|t| match t? {
                ("", second) => Ok(self.strings.get_or_intern(second)),
                _ => Err(Error::VarNamesListInconsistent),
            });
            let types = [first].into_iter().chain(tuples);
            Ok(VarNames::TypeOnly(types.collect::<Result<Vec<_>>>()?))
        } else {
            fn strip_bars(
                strings: &mut StringTable,
                (first, second): (&str, &str),
            ) -> Result<(IString, IString)> {
                let first = first.strip_prefix('|').ok_or(Error::VarNamesNoBar)?.strip_suffix('|').ok_or(Error::VarNamesNoBar)?;
                let second = second.strip_prefix('|').ok_or(Error::VarNamesNoBar)?.strip_suffix('|').ok_or(Error::VarNamesNoBar)?;
                Ok((strings.get_or_intern(first), strings.get_or_intern(second)))
            }
            let first = strip_bars(&mut self.strings, (first, second));
            let tuples = t.map(|t| strip_bars(&mut self.strings, t?));
            let names_and_types = [first].into_iter().chain(tuples);
            Ok(VarNames::NameAndType(
                names_and_types.collect::<Result<Vec<_>>>()?,
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
    fn gobble_enode_pairs<'a>(
        &mut self,
        l: impl Iterator<Item = &'a str>,
    ) -> Result<Box<[(ENodeIdx, ENodeIdx)]>> {
        Self::gobble_tuples::<true>(l)
            .map(|t| {
                let (first, second) = t?;
                let first = self.parse_existing_enode(first)?;
                let second = self.parse_existing_enode(second)?;
                Ok((first, second))
            })
            .collect()
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
        self.version_info = Some(VersionInfo { solver, version });
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
        let tidx = self.terms.new_term(term)?;
        let q = Quantifier {
            num_vars,
            kind: quant_name,
            term: Some(tidx),
            instances: Vec::new(),
            cost: 0.0,
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
        self.terms.new_term(term)?;
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
        let name = self.strings.get_or_intern(l.next().ok_or(Error::UnexpectedNewline)?);
        let kind = TermKind::parse_proof_app(is_proof, name);
        // TODO: add rewrite, monotonicity cases
        let child_ids = self.gobble_children(l)?;
        let term = Term {
            id: Some(full_id),
            kind,
            child_ids,
        };
        self.terms.new_term(term)?;
        Ok(())
    }

    fn attach_meaning<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(Error::UnexpectedNewline)?;
        let theory = self.strings.get_or_intern(l.next().ok_or(Error::UnexpectedNewline)?);
        let value = self.strings.get_or_intern(l.collect::<Vec<_>>().join(" "));
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
            if self.is_version(4, 8, 7) {
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
                    EqualityExpl::Literal { from, eq, to }
                }
                "cg" => {
                    let arg_eqs = self.gobble_enode_pairs(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Congruence { from, arg_eqs, to }
                    // For each pair (#A #B), reconstruct dependent equality explanations connecting #A to #B ...
                }
                "th" => {
                    let theory = self.strings.get_or_intern(kind_dependent_info.next().ok_or(Error::UnexpectedEnd)?);
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
                        .map(|s| self.strings.get_or_intern(s))
                        .collect();
                    let to = self.parse_existing_enode(l.next().ok_or(Error::UnexpectedNewline)?)?;
                    EqualityExpl::Unknown {
                        kind: self.strings.get_or_intern(kind),
                        from,
                        args,
                        to,
                    }
                }
            }
        };
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        self.egraph.new_equality(from, eq_expl, &self.stack)?;
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
                .collect::<Result<Vec<_>>>()?;
            MatchKind::Axiom {
                axiom: quant,
                pattern,
                bound_terms,
            }
        } else {
            let bound_terms = bound_terms
                .map(|id| self.parse_existing_enode(id))
                .collect::<Result<Vec<_>>>()?;
            MatchKind::Quantifier {
                quant,
                pattern,
                bound_terms,
            }
        };

        let mut blamed = Vec::new();
        while let Some(word) = l.next() {
            if let Some(first_term) = word.strip_prefix('(') {
                // assumes that if we see "(#A", the next word in the split is "#B)"
                let second_term = l.next().ok_or(Error::UnexpectedNewline)?.strip_suffix(')').ok_or(Error::TupleMissingParens)?;
                let from = self.parse_existing_enode(first_term)?;
                let to = self.parse_existing_enode(second_term)?;
                // See comment in `EGraph::get_equalities`
                let can_mismatch = || self.is_ge_version(4, 12, 3) &&
                    self.terms[self.egraph.get_owner(to)].kind.app_name().is_some_and(|app| &self.strings[app] == "if");
                self.egraph.blame_equalities(from, to, &self.stack, &mut blamed, can_mismatch)?;
            } else {
                let term = self.parse_existing_enode(word)?;
                blamed.try_reserve(1)?;
                blamed.push(BlameKind::Term { term })
            };
        }

        let match_ = Match { kind, blamed: blamed.into_boxed_slice() };
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
                    .collect::<Result<Vec<_>>>()?;

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
                    .collect::<Result<Vec<_>>>()?;
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
            cost: 1.0,
        };
        let iidx = self.insts.new_inst(fingerprint, inst)?;
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
        // TODO: this shouldn't be done here.
        self.compute_costs();
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
    fn compute_costs(&mut self) {
        let mut insts = self.insts.insts.as_mut_slice();
        while let Some((last, others)) = insts.split_last_mut() {
            insts = others;
            let match_ = &self.insts.matches[last.match_];
            let deps: Vec<_> = match_
                .due_to_enodes()
                .filter_map(|(_, blame)| self.egraph[blame].created_by)
                .collect();
            let num_deps = deps.len() as f32;
            for blamed in deps {
                let cost = last.cost / num_deps;
                let blamed_inst = &mut insts[blamed];
                blamed_inst.cost += cost;
                if let Some(qidx) = match_.kind.quant_idx() {
                    self.quantifiers[qidx].cost += cost;
                }
            }
        }
    }

    pub fn meaning(&self, tidx: TermIdx) -> Option<&Meaning> {
        self.terms.meaning(tidx)
    }

    pub fn quant_count_incl_theory_solving(&self) -> (usize, bool) {
        (self.quantifiers.len(), self.insts.has_theory_solving_inst())
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
