use crate::{
    items::{Meaning, SynthTermIdx, Term, TermIdx, TermKind},
    parsers::z3::{
        synthetic::{MaybeSynthIdx, MaybeSynthTerm, SynthTermKind, SynthTerms},
        terms::Terms,
    },
    IString, Result, StringTable,
};

impl SynthTerms {
    fn index_synth<'a>(&'a self, table: &'a Terms, idx: MaybeSynthIdx) -> MaybeSynthTerm<'a> {
        match idx {
            MaybeSynthIdx::Parsed(idx) => MaybeSynthTerm::Parsed(&table[idx]),
            MaybeSynthIdx::Synth(idx) => MaybeSynthTerm::Synth(&self[idx]),
        }
    }

    pub fn generalise(
        &mut self,
        table: &Terms,
        terms_vec: Vec<MaybeSynthIdx>,
    ) -> Result<MaybeSynthIdx> {
        fn check<T: Copy>(
            mut terms: impl Iterator<Item = T>,
            mut predicate: impl FnMut(T, T) -> bool,
        ) -> bool {
            let Some(mut last) = terms.next() else {
                return true;
            };
            for next in terms {
                if !predicate(last, next) {
                    return false;
                }
                last = next;
            }
            true
        }
        let terms = || terms_vec.iter().copied();

        let deref: Vec<MaybeSynthTerm<'static>>;
        if check(terms(), |t1, t2| t1 == t2) {
            // if terms are equal, no need to generalize
            let term = terms().next().expect("generalise called with empty terms");
            Ok(term)
        } else if check(
            terms().map(|t| t.parsed().and_then(|t| table.meaning(t))),
            |m1, m2| m1 == m2,
        ) && {
            let d = terms().map(|t| self.index_synth(table, t)).collect();
            deref = unsafe {
                std::mem::transmute::<Vec<MaybeSynthTerm>, Vec<MaybeSynthTerm<'static>>>(d)
            };
            check(deref.iter(), |t1, t2| {
                t1.kind().either_eq(t2.kind()) && t1.child_ids().len() == t2.child_ids().len()
            })
        } {
            let first = deref.first().expect("generalise called with empty terms");
            let children = (0..first.child_ids().len().join()).map(|i| {
                let terms_vec = deref.iter().map(|t| t.child_ids().get(i)).collect();
                self.generalise(table, terms_vec)
            });
            let children = children.collect::<Result<_>>()?;
            let kind = first.kind().map(SynthTermKind::new, |id| id).join();
            let term = self.new_synthetic_term(kind, children)?;
            Ok(MaybeSynthIdx::Synth(term))
        } else {
            let term =
                self.new_synthetic_term(SynthTermKind::Generalised, terms_vec.into_boxed_slice())?;
            Ok(MaybeSynthIdx::Synth(term))
        }
    }

    pub fn generalise_pattern(&mut self, table: &Terms, pattern: TermIdx) -> Result<MaybeSynthIdx> {
        let pterm = &table[pattern];
        match pterm.kind {
            TermKind::Var(_) => self
                .new_synthetic_term(SynthTermKind::Generalised, Default::default())
                .map(MaybeSynthIdx::Synth),
            _ => {
                let child_ids: Box<[_]> = pterm
                    .child_ids
                    .iter()
                    .map(|c| self.generalise_pattern(table, *c))
                    .collect::<Result<_>>()?;
                if child_ids
                    .iter()
                    .all(|c| matches!(c, MaybeSynthIdx::Parsed(_)))
                {
                    Ok(MaybeSynthIdx::Parsed(pattern))
                } else {
                    let kind = SynthTermKind::new(pterm.kind);
                    self.new_synthetic_term(kind, child_ids)
                        .map(MaybeSynthIdx::Synth)
                }
            }
        }
    }
}
