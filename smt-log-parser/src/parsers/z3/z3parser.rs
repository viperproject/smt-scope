use core::{num::NonZeroUsize, ops::Index};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use typed_index_collections::TiSlice;

use crate::{
    items::*,
    parsers::z3::{VersionInfo, Z3LogParser},
    BigRational, BoxSlice, Error as E, IString, NonMaxU32, Result, StringTable, TiVec,
};

use super::{
    egraph::EGraph,
    inst::{InstData, Insts},
    inter_line::{InterLine, LineKind},
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
    comm: InterLine,
}

impl Default for Z3Parser {
    fn default() -> Self {
        let mut strings = StringTable::with_hasher(fxhash::FxBuildHasher::default());
        Self {
            version_info: VersionInfo::default(),
            terms: Terms::new(&mut strings),
            synth_terms: Default::default(),
            quantifiers: Default::default(),
            insts: Default::default(),
            egraph: Default::default(),
            stack: Default::default(),
            cdcl: Default::default(),
            events: EventLog::new(&mut strings),
            comm: Default::default(),
            strings,
        }
    }
}

impl Z3Parser {
    fn parse_new_full_id(&mut self, id: Option<&str>) -> Result<TermId> {
        let full_id = id.ok_or(E::UnexpectedNewline)?;
        TermId::parse(&mut self.strings, full_id)
    }

    fn parse_existing_app(&mut self, id: &str) -> Result<TermIdx> {
        self.terms
            .app_terms
            .parse_existing_id(&mut self.strings, id)
    }

    fn parse_existing_proof(&mut self, id: &str) -> Result<ProofIdx> {
        self.terms
            .proof_terms
            .parse_existing_id(&mut self.strings, id)
    }

    fn parse_existing_enode(&mut self, id: &str) -> Result<ENodeIdx> {
        let idx = self.parse_existing_app(id)?;
        let res = self.egraph.get_enode(idx, &self.stack);
        let can_error =
            self.version_info.is_ge_version(4, 8, 9) && self.version_info.is_le_version(4, 11, 2);
        if can_error && res.is_err() {
            // Very rarely in v4.8.17 & v4.11.2, an `[attach-enode]` is not
            // emitted. Create it here.
            // TODO: log somewhere when this happens.
            self.egraph.new_enode(None, idx, None, &self.stack)?;
            self.events.new_enode();
            return self.egraph.get_enode(idx, &self.stack);
        }
        res
    }

    fn parse_z3_generation<'a>(l: &mut impl Iterator<Item = &'a str>) -> Result<Option<NonMaxU32>> {
        if let Some(gen) = l.next() {
            let gen = gen.parse::<NonMaxU32>().map_err(E::InvalidGeneration)?;
            Ok(Some(gen))
        } else {
            Ok(None)
        }
    }

    fn gobble_proof_children<'a>(
        &mut self,
        l: impl Iterator<Item = &'a str>,
    ) -> Result<BoxSlice<ProofIdx>> {
        l.map(|id| self.parse_existing_proof(id)).collect()
    }
    fn gobble_term_children<'a>(
        &mut self,
        l: impl Iterator<Item = &'a str>,
    ) -> Result<BoxSlice<TermIdx>> {
        l.map(|id| self.parse_existing_app(id)).collect()
    }
    fn gobble_var_names_list<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<VarNames> {
        let mut t = Self::gobble_tuples::<true>(l);
        // TODO: if the list can be empty then remove the first `?` and
        // replace with default case.
        let (first, second) = t.next().ok_or(E::UnexpectedEnd)??;
        if first.is_empty() {
            let first = self.mk_string(second);
            let tuples = t.map(|t| match t? {
                ("", second) => self.mk_string(second),
                _ => Err(E::VarNamesListInconsistent),
            });
            let types = [first].into_iter().chain(tuples);
            Ok(VarNames::TypeOnly(types.collect::<Result<_>>()?))
        } else {
            fn strip_bars(
                strings: &mut StringTable,
                (first, second): (&str, &str),
            ) -> Result<(IString, IString)> {
                let first = first
                    .strip_prefix('|')
                    .ok_or(E::VarNamesNoBar)?
                    .strip_suffix('|')
                    .ok_or(E::VarNamesNoBar)?;
                let second = second
                    .strip_prefix('|')
                    .ok_or(E::VarNamesNoBar)?
                    .strip_suffix('|')
                    .ok_or(E::VarNamesNoBar)?;
                Ok((
                    IString(strings.get_or_intern(first)),
                    IString(strings.get_or_intern(second)),
                ))
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
    ///
    /// The resulting iterator will contain `None` for any tuples which it failed to parse.
    /// If `FORMS_EQUAL` is true, then it will return `None` for any tuples which have a different
    /// form to the first tuple.
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
                    return Err(E::UnequalTupleForms(spaces, 0));
                }
                let mut l = first.split(';');
                (
                    l.next().ok_or(E::UnexpectedNewline)?,
                    l.next().ok_or(E::UnexpectedNewline)?,
                )
            } else {
                let middle = l.next().ok_or(E::UnexpectedNewline)?;
                if middle != ";" {
                    let spaces = *spaces.get_or_insert(1);
                    if FORMS_EQUAL && spaces != 1 {
                        return Err(E::UnequalTupleForms(spaces, 1));
                    }
                    (first, middle)
                } else {
                    let spaces = *spaces.get_or_insert(2);
                    if FORMS_EQUAL && spaces != 2 {
                        return Err(E::UnequalTupleForms(spaces, 2));
                    }
                    let second = l.next().ok_or(E::UnexpectedNewline)?;
                    (first, second)
                }
            };
            let t = (
                first.strip_prefix('(').ok_or(E::TupleMissingParens)?,
                second.strip_suffix(')').ok_or(E::TupleMissingParens)?,
            );
            Ok(Some(t))
        };
        let inverted_gobble = move |_| gobble().map_or_else(|err| Some(Err(err)), |ok| ok.map(Ok));
        std::iter::repeat(()).map_while(inverted_gobble)
    }
    fn parse_trans_equality(
        &mut self,
        can_mismatch: bool,
    ) -> impl FnMut(&str, &str) -> Result<Option<EqTransIdx>> + '_ {
        move |from, to| {
            let from = self.parse_existing_enode(from)?;
            let to = self.parse_existing_enode(to)?;
            if can_mismatch {
                // See comment in `EGraph::get_equalities`
                let can_mismatch = |egraph: &EGraph| {
                    self.version_info.is_ge_version(4, 12, 3)
                        && self.terms[egraph.get_owner(to)]
                            .kind
                            .app_name()
                            .is_some_and(|app| &self.strings[*app] == "if")
                };
                self.egraph
                    .new_trans_equality(from, to, &self.stack, can_mismatch)
            } else {
                fn cannot_mismatch(_: &EGraph) -> bool {
                    false
                }
                self.egraph
                    .new_trans_equality(from, to, &self.stack, cannot_mismatch)
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
            let Some(trans) = pte(from, to)? else {
                continue;
            };
            f(trans)?;
        }
        Ok(())
    }

    /// Create a new iterator which will only consume elements from `l` until
    /// it finds `end`. The element `end` will also be consumed but no other elements after that will.
    fn iter_until_eq<'a, 's>(
        l: &'a mut impl Iterator<Item = &'s str>,
        end: &'a str,
    ) -> impl Iterator<Item = &'s str> + 'a {
        l.take_while(move |elem| *elem != end)
    }
    fn expect_completed<'s>(mut l: impl Iterator<Item = &'s str>) -> Result<()> {
        l.next()
            .map_or(Ok(()), |more| Err(E::ExpectedNewline(more.to_string())))
    }

    fn mk_string(&mut self, s: &str) -> Result<IString> {
        Ok(IString(self.strings.try_get_or_intern(s)?))
    }

    fn expected_null_str(&self) -> &'static str {
        if self.version_info.is_ge_version(4, 11, 0) {
            "<null>"
        } else {
            "null"
        }
    }

    fn quant_or_lamda(
        &mut self,
        full_id: TermId,
        child_ids: BoxSlice<TermIdx>,
        num_vars: u32,
        kind: QuantKind,
    ) -> Result<()> {
        let qidx = self.quantifiers.next_key();
        let term = Term {
            id: full_id,
            kind: TermKind::Quant(qidx),
            child_ids,
        };
        let tidx = self.terms.app_terms.new_term(term)?;
        let q = Quantifier {
            num_vars,
            term: tidx,
            kind,
            vars: None,
        };
        self.quantifiers.raw.try_reserve(1)?;
        let qidx2 = self.quantifiers.push_and_get_key(q);
        debug_assert_eq!(qidx, qidx2);
        Ok(())
    }

    fn parse_arith(meaning: &str) -> Result<BigRational> {
        let (rest, num) = Self::parse_arith_inner(meaning)?;
        assert!(rest.is_empty());
        Ok(num.into())
    }
    fn parse_arith_inner(meaning: &str) -> Result<(&str, num::BigRational)> {
        let Some(meaning) = meaning.strip_prefix('(') else {
            // Find position of not a digit
            let end = meaning
                .bytes()
                .position(|b| !b.is_ascii_digit())
                .unwrap_or(meaning.len());
            assert_ne!(end, 0);
            let value = meaning[..end]
                .parse::<num::BigUint>()
                .map_err(E::ParseBigUintError)?;
            let value = num::BigRational::from(num::BigInt::from(value));
            return Ok((&meaning[end..], value));
        };
        let error = || E::ParseError(meaning.to_owned());
        let space = meaning.bytes().position(|b| b == b' ').ok_or_else(error)?;
        let (op, mut rest) = (&meaning[..space], &meaning[space..]);
        let mut arguments = Vec::new();
        while let Some(r) = rest.strip_prefix(' ') {
            let (r, num) = Self::parse_arith_inner(r)?;
            arguments.push(num);
            rest = r;
        }
        rest = rest.strip_prefix(')').ok_or_else(error)?;
        match op {
            "+" => Ok((rest, arguments.into_iter().sum())),
            "-" if arguments.len() == 1 => Ok((rest, -arguments.into_iter().next().unwrap())),
            "-" if arguments.len() == 2 => {
                let mut args = arguments.into_iter();
                Ok((rest, args.next().unwrap() - args.next().unwrap()))
            }
            "*" => Ok((rest, arguments.into_iter().product())),
            "/" if arguments.len() == 2 => {
                let mut args = arguments.into_iter();
                Ok((rest, args.next().unwrap() / args.next().unwrap()))
            }
            _ => Err(error()),
        }
    }

    fn parse_literal<'a>(
        &mut self,
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<Option<Assignment>> {
        let Some(lit) = l.next() else {
            return Ok(None);
        };
        let (lit, value) = match lit {
            // Have never seen this, but it is possible according to z3 source.
            "true" | "false" => return Err(E::BoolLiteral),
            "(not" => {
                let lit = l.next().ok_or(E::UnexpectedNewline)?;
                let lit = lit.strip_suffix(')').ok_or(E::TupleMissingParens)?;
                (lit, false)
            }
            _ => (lit, true),
        };
        let literal = self.parse_existing_app(lit)?;
        Ok(Some(Assignment { literal, value }))
    }

    /// When logging `assign` z3 prints some literals as their "bool var idx"
    /// rather than translating them through its `m_bool_var2expr` to print a
    /// "#id".
    ///
    /// These look like `p123` and `(not p123)` in <= v4.8.9, or `123`
    /// and `-123` in >= v4.8.10. Unfortunately we don't have the
    /// `m_bool_var2expr` map so can't translate these back to a `TermIdx`. The
    /// literal is rarely also `true` or `false` (for which this returns `None`)
    fn parse_bool_literal<'a>(
        &mut self,
        l: &mut impl Iterator<Item = &'a str>,
    ) -> Result<Option<(Option<NonMaxU32>, bool)>> {
        let Some(lit) = l.next() else {
            return Ok(None);
        };
        match lit {
            "true" => return Ok(Some((None, true))),
            "false" => return Ok(Some((None, false))),
            _ => (),
        };

        let new_mode = self.version_info.is_ge_version(4, 8, 10);
        let (lit, value) = if new_mode {
            let noneg = lit.strip_prefix('-');
            (noneg.unwrap_or(lit), noneg.is_none())
        } else {
            let (lit, value) = if lit == "(not" {
                let lit = l.next().ok_or(E::UnexpectedNewline)?;
                let lit = lit.strip_suffix(')').ok_or(E::TupleMissingParens)?;
                (lit, false)
            } else {
                (lit, true)
            };
            (lit.strip_prefix('p').ok_or(E::BoolLiteralNotP)?, value)
        };
        let bool_lit = lit.parse::<NonMaxU32>().map_err(E::InvalidBoolLiteral)?;
        Ok(Some((Some(bool_lit), value)))
    }
}

impl Z3LogParser for Z3Parser {
    fn newline(&mut self) {
        self.comm.newline();
    }

    fn version_info<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let solver = l.next().ok_or(E::UnexpectedNewline)?.to_string();
        let version = l.next().ok_or(E::UnexpectedNewline)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let version = semver::Version::parse(version)?;
        println!("{solver} {version}");
        self.version_info = VersionInfo::Present { solver, version };
        Ok(())
    }

    fn mk_quant<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = self.parse_new_full_id(l.next())?;
        let mut quant_name = std::borrow::Cow::Borrowed(l.next().ok_or(E::UnexpectedNewline)?);
        let mut num_vars_str = l.next().ok_or(E::UnexpectedNewline)?;
        let mut num_vars = num_vars_str.parse::<u32>();
        // The name may contain spaces... TODO: PR to add quotes around name when logging in z3
        while num_vars.is_err() {
            quant_name = std::borrow::Cow::Owned(format!("{quant_name} {num_vars_str}"));
            num_vars_str = l.next().ok_or(E::UnexpectedNewline)?;
            num_vars = num_vars_str.parse::<u32>();
        }
        let quant_name = QuantKind::parse(&mut self.strings, &quant_name);
        let num_vars = num_vars.unwrap();
        let child_ids = self.gobble_term_children(l)?;
        assert!(!child_ids.is_empty());
        let child_id_names = || {
            child_ids[..child_ids.len() - 1]
                .iter()
                .map(|&id| self[id].kind.app_name().map(|name| &self[name]))
        };
        assert!(
            child_id_names().all(|name| name.is_some_and(|name| name == "pattern")),
            "Expected all but last child to be \"pattern\" but found {:?}",
            child_id_names().collect::<Vec<_>>()
        );
        self.quant_or_lamda(full_id, child_ids, num_vars, quant_name)
    }

    fn mk_lambda<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = self.parse_new_full_id(l.next())?;
        let lambda_name = l.next().ok_or(E::UnexpectedNewline)?;
        if lambda_name != self.expected_null_str() {
            return Err(E::NonNullLambdaName(lambda_name.to_string()));
        }
        let num_vars = l.next().ok_or(E::UnexpectedNewline)?;
        let num_vars = num_vars.parse::<u32>().map_err(E::InvalidQVarInteger)?;
        let child_ids = self.gobble_proof_children(l)?;
        let kind = QuantKind::Lambda(child_ids);
        self.quant_or_lamda(full_id, Default::default(), num_vars, kind)
    }

    fn mk_var<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = self.parse_new_full_id(l.next())?;
        let kind = l.next().ok_or(E::UnexpectedNewline)?;
        let kind = TermKind::parse_var(kind)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;
        let term = Term {
            id: full_id,
            kind,
            child_ids: Default::default(),
        };
        self.terms.app_terms.new_term(term)?;
        Ok(())
    }

    fn mk_app<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = self.parse_new_full_id(l.next())?;
        let name = l.next().ok_or(E::UnexpectedNewline)?;
        let name = self.mk_string(name)?;
        let child_ids = self.gobble_term_children(l)?;
        let term = Term {
            id: full_id,
            kind: TermKind::App(name),
            child_ids,
        };
        let term_idx = self.terms.app_terms.new_term(term)?;
        self.events
            .new_term(term_idx, &self.terms[term_idx], &self.strings)?;
        Ok(())
    }

    fn mk_proof<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let full_id = self.parse_new_full_id(l.next())?;
        let name = l.next().ok_or(E::UnexpectedNewline)?;
        let kind = match name.parse() {
            Ok(kind) => kind,
            Err(_) => {
                debug_assert!(false, "Unknown proof step kind {name:?}");
                ProofStepKind::OTHER(self.mk_string(name)?)
            }
        };
        let mut next = l.next().ok_or(E::UnexpectedNewline)?;
        let mut prerequisites = Vec::new();
        for n in l {
            let curr = next;
            next = n;

            let prereq = self.parse_existing_proof(curr)?;
            prerequisites.push(prereq);
        }
        let result = self.parse_existing_app(next)?;

        let proof_step = ProofStep {
            id: full_id,
            kind,
            result,
            prerequisites: prerequisites.into(),
            frame: self.stack.active_frame(),
        };
        let proof_idx = self.terms.proof_terms.new_term(proof_step)?;
        self.events.new_proof_step(
            proof_idx,
            &self.terms[proof_idx],
            &self.terms,
            &self.strings,
        )?;
        Ok(())
    }

    fn attach_meaning<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(E::UnexpectedNewline)?;
        let theory = l.next().ok_or(E::UnexpectedNewline)?;
        let value = l.collect::<Vec<_>>().join(" ");
        let meaning = match theory {
            "arith" => {
                let num = Self::parse_arith(&value)?;
                Meaning::Arith(Box::new(num))
            }
            theory => {
                let theory = self.mk_string(theory)?;
                let value = self.mk_string(&value)?;
                Meaning::Unknown { theory, value }
            }
        };
        let idx = self.parse_existing_app(id)?;
        let meaning = self.terms.new_meaning(idx, meaning)?;
        self.events.new_meaning(idx, meaning, &self.strings)?;
        Ok(())
    }

    fn attach_var_names<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(E::UnexpectedNewline)?;
        let var_names = self.gobble_var_names_list(l)?;
        let tidx = self.parse_existing_app(id)?;
        let qidx = self.terms.quant(tidx)?;
        assert!(self.quantifiers[qidx].vars.is_none());
        assert!(!matches!(self.quantifiers[qidx].kind, QuantKind::Lambda(_)));
        self.quantifiers[qidx].vars = Some(var_names);
        Ok(())
    }

    fn attach_enode<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let id = l.next().ok_or(E::UnexpectedNewline)?;
        let idx = self.parse_existing_app(id);
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

        debug_assert!(self[idx].kind.app_name().is_some());
        let created_by = self.insts.inst_stack.last_mut();
        let iidx = created_by.as_ref().map(|(i, _)| *i);
        let enode = self
            .egraph
            .new_enode(iidx, idx, z3_generation, &self.stack)?;
        self.events.new_enode();
        if let Some((_, yields_terms)) = created_by {
            // If `None` then this is a ground term not created by an instantiation.
            yields_terms.try_reserve(1)?;
            yields_terms.push(enode);
        }
        Ok(())
    }

    fn eq_expl<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let from = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;
        let kind = l.next().ok_or(E::UnexpectedNewline)?;
        let eq_expl = {
            let mut kind_dependent_info = Self::iter_until_eq(l.by_ref(), ";");
            match kind {
                "root" => EqualityExpl::Root { id: from },
                "lit" => {
                    let eq = kind_dependent_info.next().ok_or(E::UnexpectedEnd)?;
                    let eq = self.parse_existing_enode(eq)?;
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;

                    // self.equalities.push(eq_expl.clone());
                    EqualityExpl::Literal { from, eq, to }
                }
                "cg" => {
                    let mut arg_eqs = Vec::new();
                    for t in Self::gobble_tuples::<true>(kind_dependent_info) {
                        let (from, to) = t?;
                        let from = self.parse_existing_enode(from)?;
                        let to = self.parse_existing_enode(to)?;
                        arg_eqs.push((from, to));
                    }
                    let to = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;
                    EqualityExpl::Congruence {
                        from,
                        arg_eqs: arg_eqs.into_boxed_slice(),
                        to,
                        uses: Vec::new(),
                    }
                }
                "th" => {
                    let theory = kind_dependent_info.next().ok_or(E::UnexpectedEnd)?;
                    let theory = self.mk_string(theory)?;
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;
                    EqualityExpl::Theory { from, theory, to }
                }
                "ax" => {
                    Self::expect_completed(kind_dependent_info)?;
                    let to = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;
                    EqualityExpl::Axiom { from, to }
                }
                kind => {
                    let args = kind_dependent_info
                        .map(|s| self.mk_string(s))
                        .collect::<Result<_>>()?;
                    let to = self.parse_existing_enode(l.next().ok_or(E::UnexpectedNewline)?)?;
                    EqualityExpl::Unknown {
                        kind: self.mk_string(kind)?,
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
        let fingerprint = l.next().ok_or(E::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(fingerprint)?;
        let idx = l.next().ok_or(E::UnexpectedNewline)?;
        let idx = self.parse_existing_app(idx)?;
        let quant = self.terms.quant(idx)?;
        let pattern = l.next().ok_or(E::UnexpectedNewline)?;
        let pattern = self.parse_existing_app(pattern)?;
        let pattern = self
            .patterns(quant)
            .ok_or(E::NewMatchOnLambda(quant))?
            .position(|p| *p == pattern)
            .ok_or(E::UnknownPatternIdx(pattern))?;
        let bound_terms = Self::iter_until_eq(&mut l, ";");
        let is_axiom = fingerprint.is_zero();

        let kind = if is_axiom {
            let bound_terms = bound_terms
                .map(|id| self.parse_existing_app(id))
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

        let match_ = Match {
            kind,
            blamed: blamed.into(),
            frame: self.stack.active_frame(),
        };
        self.insts.new_match(fingerprint, match_)?;
        Ok(())
    }

    fn inst_discovered<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let method = l.next().ok_or(E::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(l.next().ok_or(E::UnexpectedNewline)?)?;

        let (kind, blamed) = match method {
            "theory-solving" => {
                debug_assert!(
                    fingerprint.is_zero(),
                    "Theory solving should have zero fingerprint"
                );
                let axiom_id = l.next().ok_or(E::UnexpectedNewline)?;
                let axiom_id = TermId::parse(&mut self.strings, axiom_id)?;

                let bound_terms = Self::iter_until_eq(&mut l, ";")
                    .map(|id| self.parse_existing_app(id))
                    .collect::<Result<_>>()?;

                let mut blamed = Vec::new();
                let mut rewrite_of = None;
                for word in l.by_ref() {
                    let term = self.parse_existing_app(word)?;
                    if let Ok(enode) = self.egraph.get_enode(term, &self.stack) {
                        if let Some(rewrite_of) = rewrite_of {
                            return Err(E::NonRewriteAxiomInvalidEnode(rewrite_of));
                        }
                        blamed.try_reserve(1)?;
                        blamed.push(BlameKind::Term { term: enode });
                    } else {
                        if let Some(rewrite_of) = rewrite_of {
                            return Err(E::RewriteAxiomMultipleTerms1(rewrite_of));
                        }
                        if !blamed.is_empty() {
                            return Err(E::RewriteAxiomMultipleTerms2(blamed));
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
                let quant = self.parse_existing_app(l.next().ok_or(E::UnexpectedNewline)?)?;
                let quant = self.terms.quant(quant)?;
                let bound_terms = l
                    .map(|id| self.parse_existing_enode(id))
                    .collect::<Result<_>>()?;
                let kind = MatchKind::MBQI { quant, bound_terms };
                (kind, Vec::new())
            }
            _ => return Err(E::UnknownInstMethod(method.to_string())),
        };
        let match_ = Match {
            kind,
            blamed: blamed.into(),
            frame: self.stack.active_frame(),
        };
        self.insts.new_match(fingerprint, match_)?;
        Ok(())
    }

    fn instance<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let fingerprint = l.next().ok_or(E::UnexpectedNewline)?;
        let fingerprint = Fingerprint::parse(fingerprint)?;
        let mut proof = Self::iter_until_eq(&mut l, ";");
        let proof_id = if let Some(proof) = proof.next() {
            // It seems that for `0x0` fingerprints the proof term points to an
            // app term (usually an equality), while for "real" fingerprints it
            // points to a proof term.
            if fingerprint.is_zero() {
                let axiom_body = self.parse_existing_app(proof)?;
                InstProofLink::IsAxiom(axiom_body)
            } else {
                let proof = self.parse_existing_proof(proof)?;
                InstProofLink::HasProof(proof)
            }
        } else {
            assert!(
                !fingerprint.is_zero(),
                "Axiom instantiations should have an associated term"
            );
            let last_term = self.terms.last_term_from_instance(&self.strings);
            InstProofLink::ProofsDisabled(last_term)
        };
        Self::expect_completed(proof)?;
        let z3_generation = Self::parse_z3_generation(&mut l)?;

        let match_ = self
            .insts
            .get_match(fingerprint)
            .ok_or(E::UnknownFingerprint(fingerprint))?;
        let inst = Instantiation {
            match_,
            fingerprint,
            proof_id,
            z3_generation,
            yields_terms: Default::default(),
            frame: self.stack.active_frame(),
        };
        // I have very rarely seen duplicate `[instance]` lines with the same
        // fingerprint in v4.12.4. Allow these there and debug panic otherwise.
        let can_duplicate = self.version_info.is_version(4, 12, 4);
        self.insts
            .new_inst(fingerprint, inst, &self.stack, can_duplicate)?;
        self.events.new_inst();
        Ok(())
    }

    fn end_of_instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.insts.end_inst()?;
        Self::expect_completed(l)
    }

    fn eof(&mut self) {
        self.synth_terms.eof(self.terms().next_key());
        self.events.new_eof();
    }

    fn assign<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let assign = self.parse_literal(&mut l)?.ok_or(E::UnexpectedNewline)?;
        let mut justification = l.next().ok_or(E::UnexpectedNewline)?;
        if justification == "decision" {
            self.cdcl.new_decision(assign, &self.stack)?;
            justification = l.next().ok_or(E::UnexpectedNewline)?;
            debug_assert_eq!(justification, "axiom");
        }
        // Now `l` contains
        match justification {
            // Either a "decision" or a non-interesting assignment by e.g.
            // internal z3 axioms. NOT USED in the non-decision case.
            "axiom" => Self::expect_completed(l),
            // Not sure about this case, it contains one more single literal,
            // but printed as a `BoolTermIdx` and not a `TermIdx` and z3 doesn't
            // log `BoolTermIdx` so we cannot really understand it anyway.
            "bin" => {
                // NOT USED
                self.parse_bool_literal(&mut l)?
                    .ok_or(E::UnexpectedNewline)?;
                Self::expect_completed(l)
            }
            // A propagated assignment: a clause only has one unassigned literal
            // left. The offending clause is also printed but since it's in
            // bool-var format we can't use it. Also <= v4.8.8 prints the text
            // name of each clause on subsequent newlines, we'll ignore those.
            // Later versions of z3 use `display_compact_j`.
            "clause" => {
                let (_lit, value) = self
                    .parse_bool_literal(&mut l)?
                    .ok_or(E::UnexpectedNewline)?;
                debug_assert_eq!(assign.value, value);

                self.cdcl.new_propagate(assign, &self.stack)?;
                Ok(())
            }
            "justification" => {
                // NOT USED
                let theory_id = l.next().ok_or(E::UnexpectedNewline)?;
                let _theory_id = theory_id
                    .strip_suffix(':')
                    .ok_or(E::MissingColonJustification)?;
                while let Some((_lit, _value)) = self.parse_bool_literal(&mut l)? {}
                Ok(())
            }
            _ => Err(E::UnknownJustification(justification.to_string())),
        }
    }

    fn decide_and_or<'a>(&mut self, _l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.comm.curr().last_line_kind = LineKind::DecideAndOr;
        Ok(())
    }

    fn conflict<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.comm.curr().last_line_kind = LineKind::Conflict;

        let mut cut = Vec::new();
        while let Some(assignment) = self.parse_literal(&mut l)? {
            cut.try_reserve(1)?;
            cut.push(assignment);
        }
        let frame = self.stack.active_frame();
        self.cdcl.new_conflict(cut.into_boxed_slice(), frame);
        // Backtracking will happen with the pop in the next line. We'll push
        // the new (opposite) decision there.
        Ok(())
    }

    fn push<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let scope = l.next().ok_or(E::UnexpectedNewline)?;
        let scope = scope.parse::<usize>().map_err(E::InvalidFrameInteger)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        let from_cdcl = matches!(self.comm.prev().last_line_kind, LineKind::DecideAndOr);
        let from_cdcl = from_cdcl || self.stack.is_speculative();
        self.stack.new_frame(scope, from_cdcl)?;
        self.events.new_push()?;
        Ok(())
    }

    fn pop<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let num = l.next().ok_or(E::UnexpectedNewline)?;
        let num = num
            .parse::<NonZeroUsize>()
            .map_err(E::InvalidFrameInteger)?;
        let scope = l.next().ok_or(E::UnexpectedNewline)?;
        let scope = scope.parse::<usize>().map_err(E::InvalidFrameInteger)?;
        // Return if there is unexpectedly more data
        Self::expect_completed(l)?;

        let conflict = matches!(self.comm.prev().last_line_kind, LineKind::Conflict);
        debug_assert_eq!(conflict, self.cdcl.has_conflict());
        let from_cdcl = self.stack.pop_frames(num, scope, conflict)?;
        self.events.new_pop(num, from_cdcl)?;
        if conflict {
            self.cdcl.backtrack(&self.stack)?;
        }
        Ok(())
    }

    fn begin_check<'a>(&mut self, mut l: impl Iterator<Item = &'a str>) -> Result<()> {
        let scope = l.next().ok_or(E::UnexpectedNewline)?;
        let scope = scope.parse::<usize>().map_err(E::InvalidFrameInteger)?;
        self.stack.ensure_height(scope)?;
        self.events.new_begin_check()?;
        Ok(())
    }
}

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
    pub fn ast_size(&self, tidx: TermIdx) -> Option<u32> {
        let mut size = 0;
        let mut todo = vec![tidx];
        while let Some(next) = todo.pop() {
            size += 1;
            let term = &self[next];
            match term.kind {
                TermKind::Var(_) => return None,
                TermKind::App(_) => {
                    todo.extend_from_slice(&term.child_ids);
                }
                // TODO: decide if we want to return a size for quantifiers
                TermKind::Quant(_) => {
                    todo.push(*term.child_ids.last().unwrap());
                }
            }
        }
        Some(size)
    }

    pub fn inst_ast_size(&self, iidx: InstIdx) -> u32 {
        let bound_terms = self[self[iidx].match_]
            .kind
            .bound_terms(|e| self[e].owner, |t| t);
        bound_terms
            .iter()
            .map(|&tidx| self.ast_size(tidx).unwrap())
            .sum()
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
