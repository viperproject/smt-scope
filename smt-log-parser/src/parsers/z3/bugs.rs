use std::borrow::Cow;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{BlameKind, ENodeIdx, Term, TermId, TermIdx},
    Error as E, FxHashSet, IString, Result, StringTable,
};

use super::{terms::Terms, Z3Parser};

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
    ) -> Result<(Cow<'a, str>, u32)> {
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
            let nvs = num_vars.parse::<u32>().map_err(E::InvalidVarNum)?;
            return Ok((qid, nvs));
        }

        let mut nvs = num_vars.parse::<u32>();
        if nvs.is_err() {
            qid = Cow::Owned(format!("|{qid}"));
        }
        while nvs.is_err() {
            qid += " ";
            qid += num_vars;
            num_vars = l.next().ok_or(E::UnexpectedNewline)?;
            nvs = num_vars.parse::<u32>();
        }
        if matches!(qid, Cow::Owned(_)) {
            qid += "|";
        }
        Ok((qid, nvs.unwrap()))
    }
}

// Z3 BUG: https://github.com/viperproject/axiom-profiler-2/issues/106

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

// Z3 BUG: https://github.com/viperproject/axiom-profiler-2/issues/63

impl Z3Parser {
    pub(super) fn can_blame_match_subpat(&self, blame: ENodeIdx, subpat: TermIdx) -> bool {
        self[self[blame].owner].kind == self[subpat].kind
    }

    /// Fixes the blame vector which may be incorrect due the Z3 BUG.
    pub(super) fn fix_blamed(&self, blamed: &mut [BlameKind], pattern: &Term) -> Result<()> {
        debug_assert!(!pattern.child_ids.is_empty());
        let mut b_roots = blamed.iter().filter_map(|b| b.term());
        let mut no_bug = true;
        for (i, subpat) in pattern.child_ids.iter().enumerate() {
            let Some(root) = b_roots.next() else {
                return Err(E::SubpatTooFewBlame(pattern.child_ids.len() - i));
            };
            no_bug &= self.can_blame_match_subpat(*root, *subpat);
        }
        let too_many = b_roots.next().is_some();
        if no_bug && !too_many {
            debug_assert!(blamed[0].term().is_some());
            return Ok(());
        }
        let mut root_count = pattern.child_ids.len() + too_many as usize + b_roots.count();
        debug_assert!(root_count >= pattern.child_ids.len());
        self.disable_obvious_blamed_bugs(blamed, pattern, &mut root_count);

        let b = blamed.iter().enumerate();
        let b_roots: Vec<_> = b
            .filter_map(|(i, b)| Some(i).zip(b.term().copied()))
            .collect();
        debug_assert_eq!(b_roots.len(), root_count);

        let success = self.try_rotations(blamed, pattern, &b_roots);
        if success {
            Ok(())
        } else {
            self.permute_blamed(blamed, pattern, b_roots)
        }
    }

    // Just rotations didn't work, try some permutations as well
    fn permute_blamed(
        &self,
        blamed: &mut [BlameKind],
        pattern: &Term,
        mut b_roots: Vec<(usize, ENodeIdx)>,
    ) -> Result<()> {
        // The only permutation we try here is reversing, this might still fail
        // for subpat lengths >= 4.
        for i in 0..b_roots.len() {
            let (from, _) = b_roots[i];
            let to = b_roots.get(i + 1).map(|(i, _)| *i).unwrap_or(blamed.len());
            b_roots[i].0 = blamed.len() - to;
            blamed[from..to].reverse();
        }
        blamed.reverse();
        b_roots.reverse();

        let success = self.try_rotations(blamed, pattern, &b_roots);
        if success {
            return Ok(());
        }

        let name = |t: TermIdx| &self[self[t].kind.app_name().unwrap()];
        let blamed = blamed.iter().filter_map(|b| match *b {
            BlameKind::Term { term } => Some((true, term)),
            BlameKind::Equality { .. } => None,
            BlameKind::TermBug { term } => Some((false, term)),
        });
        let blamed = blamed.map(|(r, t)| format!("{r} {}", name(self[t].owner)));
        let pattern = pattern.child_ids.iter().copied();
        let s = format!(
            "Blamed: [{}] | Subpats: [{}]",
            blamed.collect::<Vec<_>>().join(", "),
            pattern.map(name).collect::<Vec<_>>().join(", "),
        );
        Err(E::SubpatUnknownBlame(s))
    }

    // util

    fn disable_obvious_blamed_bugs(
        &self,
        blamed: &mut [BlameKind],
        pattern: &Term,
        root_count: &mut usize,
    ) {
        if pattern.child_ids.len() == *root_count {
            return;
        }
        let roots = pattern
            .child_ids
            .iter()
            .map(|&sp| self[sp].kind.app_name().unwrap())
            .collect::<FxHashSet<_>>();
        for b in blamed.iter_mut() {
            let BlameKind::Term { term } = *b else {
                continue;
            };
            let root = self[self[term].owner].kind.app_name().unwrap();
            if roots.contains(&root) {
                continue;
            }
            *b = BlameKind::TermBug { term };
            *root_count -= 1;
        }
    }

    fn try_rotations(
        &self,
        blamed: &mut [BlameKind],
        pattern: &Term,
        b_roots: &[(usize, ENodeIdx)],
    ) -> bool {
        let mut valid_rotation = None;
        let mut skipped = Vec::new();
        'outer: for offset in 0..b_roots.len() {
            if !self.can_blame_match_subpat(b_roots[offset].1, pattern.child_ids[0]) {
                continue;
            }
            let can_skip = b_roots.len() - pattern.child_ids.len();
            let idx = |i| b_roots[(offset + i) % b_roots.len()];
            for (i, &sp) in pattern.child_ids.iter().enumerate().skip(1) {
                while !self.can_blame_match_subpat(idx(skipped.len() + i).1, sp) {
                    if skipped.len() == can_skip {
                        skipped.clear();
                        continue 'outer;
                    }
                    skipped.push(skipped.len() + i);
                }
            }

            // Found a valid rotation

            let mut root_count = b_roots.len();
            valid_rotation.replace(offset);
            let mut skip = |i| {
                let i = idx(i).0;
                let b = &mut blamed[i];
                let term = *b.term().unwrap();
                *b = BlameKind::TermBug { term };
                root_count -= 1;
            };
            for &i in &skipped {
                skip(i);
            }
            for i in 0..(can_skip - skipped.len()) {
                skip(skipped.len() + pattern.child_ids.len() + i);
            }
            debug_assert_eq!(root_count, pattern.child_ids.len());
            break;
            // To error on ambiguous replace the above block with:
            // let old = valid_rotation.replace(offset);
            // if let Some(old) = old {
            //     return Err(E::SubpatAmbiguousBlame(old, offset));
            // }
        }

        if let Some(rotation) = valid_rotation {
            let rotation = b_roots[rotation].0;
            blamed.rotate_left(rotation);
            debug_assert!(blamed[0].term().is_some());
            true
        } else {
            false
        }
    }
}

// Z3 BUG: https://github.com/viperproject/axiom-profiler-2/issues/100

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
