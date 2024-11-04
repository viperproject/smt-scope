use crate::{
    items::{TermIdx, TermKind},
    parsers::z3::{
        synthetic::{SynthIdx, SynthTerm, SynthTerms},
        terms::Terms,
    },
    Result,
};

impl SynthTerms {
    pub fn generalise(&mut self, table: &Terms, terms_vec: Vec<SynthIdx>) -> Result<SynthIdx> {
        assert!(!terms_vec.is_empty(), "generalise called with empty terms");

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
        let tidxs = || terms_vec.iter().copied();
        let terms = || tidxs().map(|t| self.index(table, t));

        if check(tidxs(), |t1, t2| t1 == t2) {
            // if terms are equal, no need to generalize
            Ok(terms_vec[0])
        } else if let Some(generalised) = terms().position(|t| t.kind().non_generalised().is_none())
        {
            // if one of the terms is already generalised, no need to generalize
            Ok(terms_vec[generalised])
        } else if check(
            tidxs().map(|t| self.as_tidx(t).and_then(|t| table.meaning(t))),
            |m1, m2| m1 == m2,
        ) && check(terms(), |t1, t2| {
            t1.kind()
                .non_generalised()
                .zip(t2.kind().non_generalised())
                .is_some_and(|(t1, t2)| t1 == t2)
                && t1.child_ids().len() == t2.child_ids().len()
        }) {
            let d = terms().collect();
            let deref =
                unsafe { std::mem::transmute::<Vec<&SynthTerm>, Vec<&'static SynthTerm>>(d) };

            let first = deref[0];
            let child_ids = (0..first.child_ids().len()).map(|i| {
                let terms_vec = deref.iter().map(|t| t.child_ids()[i]).collect();
                self.generalise(table, terms_vec)
            });
            let child_ids = child_ids.collect::<Result<_>>()?;
            match first.kind().non_generalised() {
                None => self.new_generalised(child_ids),
                Some(TermKind::App(app_name)) => self.new_synthetic(app_name, child_ids),
                _ => unreachable!(),
            }
        } else {
            self.new_generalised(terms_vec.into_boxed_slice())
        }
    }

    pub fn generalise_pattern(&mut self, table: &Terms, pattern: TermIdx) -> Result<SynthIdx> {
        let pterm = &table[pattern];
        match pterm.kind {
            TermKind::Var(_) => self.new_generalised(Default::default()),
            TermKind::App(app_name) => {
                let child_ids: Box<[_]> = pterm
                    .child_ids
                    .iter()
                    .map(|c| self.generalise_pattern(table, *c))
                    .collect::<Result<_>>()?;
                if child_ids.iter().all(|&c| self.as_tidx(c).is_some()) {
                    Ok(pattern.into())
                } else {
                    self.new_synthetic(app_name, child_ids)
                }
            }
            TermKind::Quant(_) => unreachable!(),
        }
    }
}
