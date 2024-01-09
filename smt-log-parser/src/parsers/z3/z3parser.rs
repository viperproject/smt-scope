use typed_index_collections::TiVec;

use crate::{
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
    pub(super) inst_stack: Vec<InstIdx>,

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
    pub fn is_version(&self, version: semver::Version) -> bool {
        self.version_info
            .as_ref()
            .map(|v| v.version == version)
            .unwrap_or_default()
    }

    pub fn parse_existing_enode(&mut self, id: &str) -> Option<ENodeIdx> {
        let idx = self.terms.parse_existing_id(&mut self.strings, id)?;
        self.egraph.get_enode(idx, &self.stack)
    }
    pub fn parse_z3_generation<'a>(
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<Option<u32>, std::num::ParseIntError> {
        if let Some(gen) = l.next() {
            gen.parse::<u32>().map(Some)
        } else {
            Ok(None)
        }
    }

    #[must_use]
    fn gobble_children<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Option<Vec<TermIdx>> {
        l.map(|id| self.terms.parse_existing_id(&mut self.strings, id))
            .collect()
    }
    #[must_use]
    fn gobble_var_names_list<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Option<VarNames> {
        let mut t = Self::gobble_tuples::<true>(l);
        // TODO: if the list can be empty then remove the first `?` and
        // replace with default case.
        let (first, second) = t.next()??;
        if first == "" {
            let first = Some(self.strings.get_or_intern(second));
            let tuples = t.map(|t| match t? {
                ("", second) => Some(self.strings.get_or_intern(second)),
                _ => None,
            });
            let types = [first].into_iter().chain(tuples);
            Some(VarNames::TypeOnly(types.collect::<Option<Vec<_>>>()?))
        } else {
            fn strip_bars(
                strings: &mut StringTable,
                (first, second): (&str, &str),
            ) -> Option<(IString, IString)> {
                let first = first.strip_prefix('|')?.strip_suffix('|')?;
                let second = second.strip_prefix('|')?.strip_suffix('|')?;
                Some((strings.get_or_intern(first), strings.get_or_intern(second)))
            }
            let first = strip_bars(&mut self.strings, (first, second));
            let tuples = t.map(|t| strip_bars(&mut self.strings, t?));
            let names_and_types = [first].into_iter().chain(tuples);
            Some(VarNames::NameAndType(
                names_and_types.collect::<Option<Vec<_>>>()?,
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
    ) -> impl Iterator<Item = Option<(&'a str, &'a str)>> {
        let mut spaces = None;
        let mut gobble = move || {
            let Some(first) = l.next() else {
                return Some(None);
            };
            let (first, second) = if first.ends_with(')') {
                let spaces = *spaces.get_or_insert(0);
                if FORMS_EQUAL && spaces != 0 {
                    return None;
                }
                let mut l = first.split(';');
                (l.next()?, l.next()?)
            } else {
                let middle = l.next()?;
                if middle != ";" {
                    let spaces = *spaces.get_or_insert(1);
                    if FORMS_EQUAL && spaces != 1 {
                        return None;
                    }
                    (first, middle)
                } else {
                    let spaces = *spaces.get_or_insert(2);
                    if FORMS_EQUAL && spaces != 2 {
                        return None;
                    }
                    let second = l.next()?;
                    (first, second)
                }
            };
            let t = (first.strip_prefix('(')?, second.strip_suffix(')')?);
            Some(Some(t))
        };
        let inverted_gobble = move |_| gobble().map_or(Some(None), |x| x.map(Some));
        std::iter::repeat(()).map_while(inverted_gobble)
    }
    #[must_use]
    fn gobble_id_pairs<'a>(
        &mut self,
        l: impl Iterator<Item = &'a str>,
    ) -> Option<Vec<(TermIdx, TermIdx)>> {
        Self::gobble_tuples::<true>(l)
            .map(|t| {
                let (first, second) = t?;
                let first = self.terms.parse_existing_id(&mut self.strings, first)?;
                let second = self.terms.parse_existing_id(&mut self.strings, second)?;
                Some((first, second))
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
    #[must_use]
    fn expect_completed<'s>(mut l: impl Iterator<Item = &'s str>) -> Option<()> {
        l.next().map_or(Some(()), |_| None)
    }
}

impl Z3LogParser for Z3Parser {
    fn version_info<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let solver = l.next()?.to_string();
        let version = l.next()?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let version = semver::Version::parse(version).ok()?;
        println!("{solver} {version}");
        self.version_info = Some(VersionInfo { solver, version });
        Some(())
    }

    fn mk_quant<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let full_id = l
            .next()
            .and_then(|id| TermId::parse(&mut self.strings, id))?;
        let mut quant_name = std::borrow::Cow::Borrowed(l.next()?);
        let mut num_vars_str = l.next()?;
        let mut num_vars = num_vars_str.parse::<usize>();
        // The name may contain spaces... TODO: PR to add quotes around name when logging in z3
        while num_vars.is_err() {
            quant_name = std::borrow::Cow::Owned(format!("{quant_name} {num_vars_str}"));
            num_vars_str = l.next()?;
            num_vars = num_vars_str.parse::<usize>();
        }
        let quant_name = QuantKind::parse(&mut self.strings, &*quant_name);
        let num_vars = num_vars.unwrap();
        let children = self.gobble_children(l)?;
        assert!(!children.is_empty());
        let qidx = self.quantifiers.next_key();
        let term = Term {
            id: Some(full_id),
            kind: TermKind::Quant(qidx),
            meaning: None,
            child_ids: children,
        };
        let tidx = self.terms.new_term(full_id, term);
        let q = Quantifier {
            num_vars,
            kind: quant_name,
            term: Some(tidx),
            instances: Vec::new(),
            cost: 0.0,
            vars: None,
        };
        let qidx2 = self.quantifiers.push_and_get_key(q);
        debug_assert_eq!(qidx, qidx2);
        Some(())
    }

    fn mk_var<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let full_id = l
            .next()
            .and_then(|id| TermId::parse(&mut self.strings, id))?;
        let kind = l.next().and_then(TermKind::parse_var)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let term = Term {
            id: Some(full_id),
            kind,
            meaning: None,
            child_ids: Vec::new(),
        };
        self.terms.new_term(full_id, term);
        Some(())
    }

    fn mk_proof_app<'a>(
        &mut self,
        mut l: impl Iterator<Item = &'a str>,
        is_proof: bool,
    ) -> Option<()> {
        let full_id = l
            .next()
            .and_then(|id| TermId::parse(&mut self.strings, id))?;
        let kind = TermKind::parse_proof_app(is_proof, self.strings.get_or_intern(l.next()?));
        // TODO: add rewrite, monotonicity cases
        let children = self.gobble_children(l)?;
        let term = Term {
            id: Some(full_id),
            kind,
            meaning: None,
            child_ids: children,
        };
        self.terms.new_term(full_id, term);
        Some(())
    }

    fn attach_meaning<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let id = l.next()?;
        let theory = self.strings.get_or_intern(l.next()?);
        let value = self.strings.get_or_intern(l.collect::<Vec<_>>().join(" "));
        let meaning = Meaning { theory, value };
        let idx = self.terms.parse_existing_id(&mut self.strings, id)?;
        if let Some(old) = &self.terms[idx].meaning {
            assert_eq!(old, &meaning);
        } else {
            self.terms[idx].meaning = Some(meaning);
        }
        Some(())
    }

    fn attach_var_names<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let id = l.next()?;
        let var_names = self.gobble_var_names_list(l)?;
        let tidx = self.terms.parse_existing_id(&mut self.strings, id)?;
        let qidx = self.terms[tidx].kind.quant_idx()?;
        assert!(self.quantifiers[qidx].vars.is_none());
        self.quantifiers[qidx].vars = Some(var_names);
        Some(())
    }

    fn attach_enode<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let idx = self.terms.parse_existing_id(&mut self.strings, l.next()?);
        let Some(idx) = idx else {
            const Z3_4_8_7: semver::Version = semver::Version::new(4, 8, 7);
            if self.is_version(Z3_4_8_7) {
                // Z3 4.8.7 seems to have a bug where it can emit a non-existent term id here.
                return Some(());
            } else {
                return None;
            }
        };
        let z3_generation = Self::parse_z3_generation(&mut l).ok()?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        let created_by = self.inst_stack.last().copied();
        let enode = self
            .egraph
            .new_enode(created_by, idx, z3_generation, &self.stack);
        if let Some(inst) = created_by {
            // If `None` then this is a ground term not created by an instantiation.
            self.insts[inst].yields_terms.push(enode);
        }
        Some(())
    }

    fn eq_expl<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let from = self.parse_existing_enode(l.next()?)?;
        let kind = l.next()?;
        let eq_expl = {
            let mut kind_dependent_info = Self::iter_until_eq(l.by_ref(), ";");
            match kind {
                "root" => EqualityExpl::Root { id: from },
                "lit" => {
                    let eq = kind_dependent_info.next()?;
                    let eq = self.parse_existing_enode(eq)?;
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next()?)?;
                    EqualityExpl::Literal { from, eq, to }
                }
                "cg" => {
                    let arg_eqs = self.gobble_id_pairs(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next()?)?;
                    EqualityExpl::Congruence { from, arg_eqs, to }
                    // For each pair (#A #B), reconstruct dependent equality explanations connecting #A to #B ...
                }
                "th" => {
                    let theory = self.strings.get_or_intern(kind_dependent_info.next()?);
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next()?)?;
                    EqualityExpl::Theory { from, theory, to }
                }
                "ax" => {
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next()?)?;
                    EqualityExpl::Axiom { from, to }
                }
                kind => {
                    let args = kind_dependent_info
                        .map(|s| self.strings.get_or_intern(s))
                        .collect();
                    let to = self.parse_existing_enode(l.next()?)?;
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

        self.egraph.new_equality(from, eq_expl);
        Some(())
    }

    fn new_match<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let fingerprint = l.next().and_then(Fingerprint::parse)?;
        let idx = self.terms.parse_existing_id(&mut self.strings, l.next()?)?;
        let quant = self.terms[idx].kind.quant_idx()?;
        let pattern = self.terms.parse_existing_id(&mut self.strings, l.next()?)?;
        let bound_terms = Self::iter_until_eq(&mut l, ";");
        let is_axiom = fingerprint.is_zero();

        let kind = if is_axiom {
            let bound_terms = bound_terms
                .map(|id| self.terms.parse_existing_id(&mut self.strings, id))
                .collect::<Option<Vec<_>>>()?;
            MatchKind::Axiom {
                axiom: quant,
                pattern,
                bound_terms,
            }
        } else {
            let bound_terms = bound_terms
                .map(|id| self.parse_existing_enode(id))
                .collect::<Option<Vec<_>>>()?;
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
                let second_term = l.next()?.strip_suffix(')')?;
                let from = self.parse_existing_enode(first_term)?;
                let to = self.parse_existing_enode(second_term)?;
                let eqs = self.egraph.get_equalities(from, to);
                // TODO: why aren't all equalities explained by a prior `eq-expl`?
                // debug_assert!(!eqs.is_empty(), "could not find equality {first_term} ({from:?}) -> {second_term} ({to:?}) ({fingerprint})");
                let blamed_len = blamed.len();
                for eq in eqs {
                    if let Some(eq) = eq.dependency_on() {
                        blamed.push(BlameKind::Equality { eq });
                    }
                }
                if blamed_len == blamed.len() {
                    blamed.push(BlameKind::UnknownEquality { from, to });
                }
            } else {
                let term = self.parse_existing_enode(word)?;
                blamed.push(BlameKind::Term { term })
            };
        }

        let match_ = Match { kind, blamed };
        self.insts.new_match(fingerprint, match_);
        Some(())
    }

    fn inst_discovered<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let method = l.next()?;
        let fingerprint = Fingerprint::parse(l.next()?)?;

        let (kind, blamed) = match method {
            "theory-solving" => {
                debug_assert!(
                    fingerprint.is_zero(),
                    "Theory solving should have zero fingerprint"
                );
                let axiom_id = l
                    .next()
                    .and_then(|id| TermId::parse(&mut self.strings, id))?;

                let bound_terms = Self::iter_until_eq(&mut l, ";")
                    .map(|id| self.terms.parse_existing_id(&mut self.strings, id))
                    .collect::<Option<Vec<_>>>()?;

                let mut blamed = Vec::new();
                let mut rewrite_of = None;
                while let Some(word) = l.next() {
                    let term = self.terms.parse_existing_id(&mut self.strings, word)?;
                    if let Some(enode) = self.egraph.get_enode(term, &self.stack) {
                        assert!(
                            rewrite_of.is_none(),
                            "theory-solving non-rewrite axiom should blame valid enodes"
                        );
                        blamed.push(BlameKind::Term { term: enode });
                    } else {
                        assert!(
                            blamed.is_empty(),
                            "theory-solving rewrite axiom should only have one term"
                        );
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
                let quant = self.terms.parse_existing_id(&mut self.strings, l.next()?)?;
                let quant = self.terms[quant].kind.quant_idx()?;
                let bound_terms = l
                    .map(|id| self.parse_existing_enode(id))
                    .collect::<Option<Vec<_>>>()?;
                let kind = MatchKind::MBQI { quant, bound_terms };
                (kind, Vec::new())
            }
            _ => return None,
        };
        let match_ = Match { kind, blamed };
        self.insts.new_match(fingerprint, match_);
        Some(())
    }

    fn instance<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let fingerprint = l.next().and_then(Fingerprint::parse)?;
        let mut proof = Self::iter_until_eq(&mut l, ";");
        let proof_id = if let Some(proof) = proof.next() {
            Some(self.terms.parse_id(&mut self.strings, proof)?)
        } else {
            None
        };
        Self::expect_completed(proof)?;
        let z3_generation = Self::parse_z3_generation(&mut l).ok()?;

        let inst = Instantiation {
            // Will be filled in by `new_inst`
            match_: MatchIdx::default(),
            fingerprint,
            proof_id,
            z3_generation,
            yields_terms: Vec::new(),
            cost: 1.0,
        };
        let iidx = self.insts.new_inst(fingerprint, inst);
        self.inst_stack.push(iidx);
        Some(())
    }

    fn end_of_instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Option<()> {
        self.inst_stack.pop().unwrap();
        Self::expect_completed(l)
    }

    fn eof(&mut self) {
        // TODO: this shouldn't be done here.
        self.compute_costs();
        self.terms.create_wild_card();
    }

    fn push<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let scope = l.next()?.parse::<usize>().ok()?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        self.stack.new_frame(scope)
    }

    fn pop<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Option<()> {
        let num = l.next()?.parse::<usize>().ok()?;
        let scope = l.next()?.parse::<usize>().ok()?;
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
