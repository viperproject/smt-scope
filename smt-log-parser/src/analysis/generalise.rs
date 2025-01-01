use crate::{
    items::{Meaning, TermIdx},
    parsers::z3::{
        synthetic::{AnyTerm, SynthIdx, SynthTermKind, SynthTerms},
        terms::Terms,
    },
    FxHashMap, Result,
};

impl SynthTerms {
    pub fn generalise_first(
        &mut self,
        table: &Terms,
        smaller: TermIdx,
        larger: TermIdx,
        depth: usize,
    ) -> Result<Option<SynthIdx>> {
        if smaller == larger {
            // if terms are equal, no need to generalize
            return Ok(Some(smaller.into()));
        }

        let smaller_term = &table[smaller];
        let larger_term = &table[larger];

        let smaller_meaning = table.meaning(smaller);
        let larger_meaning = table.meaning(larger);
        if smaller_meaning.is_none()
            && larger_meaning.is_none()
            && smaller_term.kind == larger_term.kind
            && smaller_term.child_ids.len() == larger_term.child_ids.len()
        {
            if depth == 0 {
                return Ok(None);
            }
            let Some(child_ids) = smaller_term
                .child_ids
                .iter()
                .zip(&*larger_term.child_ids)
                .map(|(&sc, &lc)| self.generalise_first(table, sc, lc, depth - 1))
                .collect::<Result<Option<_>>>()?
            else {
                return Ok(None);
            };
            self.new_synthetic(smaller_term.kind, child_ids).map(Some)
        } else {
            // If the meanings are some and equal, then the TermIdx should've
            // been equal?
            assert!(smaller_meaning.is_none() || smaller_meaning != larger_meaning);

            let Some(input_replace) = self.input_replace(table, smaller, larger)? else {
                return Ok(None);
            };
            self.new_generalised(input_replace).map(Some)
        }
    }

    /// Given a `larger -> g(x)` and `smaller -> x`, return a `g($0)` term.
    pub fn input_replace(
        &mut self,
        table: &Terms,
        smaller: TermIdx,
        larger: TermIdx,
    ) -> Result<Option<SynthIdx>> {
        assert_ne!(larger, smaller);
        let smaller_meaning = table.meaning(smaller);
        let mut cache = FxHashMap::default();
        let (found_smaller, replaced) =
            self.input_replace_inner(table, smaller, smaller_meaning, larger, &mut cache)?;
        // If we didn't find the smaller term in the bigger one, then it's
        // probably not a repeating pattern getting larger (so return `None`).
        Ok(found_smaller.then_some(replaced))
    }

    fn input_replace_cached(
        &mut self,
        table: &Terms,
        smaller: TermIdx,
        smaller_meaning: Option<&Meaning>,
        larger: TermIdx,
        cache: &mut FxHashMap<TermIdx, (bool, SynthIdx)>,
    ) -> Result<(bool, SynthIdx)> {
        if let Some((found_smaller, replaced)) = cache.get(&larger) {
            return Ok((*found_smaller, *replaced));
        }
        let (found_smaller, replaced) =
            self.input_replace_inner(table, smaller, smaller_meaning, larger, cache)?;
        cache.insert(larger, (found_smaller, replaced));
        Ok((found_smaller, replaced))
    }

    fn input_replace_inner(
        &mut self,
        table: &Terms,
        smaller: TermIdx,
        smaller_meaning: Option<&Meaning>,
        larger: TermIdx,
        cache: &mut FxHashMap<TermIdx, (bool, SynthIdx)>,
    ) -> Result<(bool, SynthIdx)> {
        if larger == smaller {
            return Ok((true, self.new_input(None)?));
        }

        match (smaller_meaning, table.meaning(larger)) {
            (Some(Meaning::Arith(s)), Some(Meaning::Arith(l))) => {
                let delta = &***l - &***s;
                let meaning = Meaning::Arith(Box::new(delta.into()));
                let term = self.new_input(Some(meaning))?;
                return Ok((true, term));
            }
            (Some(_), Some(_)) => {
                return Ok((false, larger.into()));
            }
            _ => (),
        }

        let larger_term = &table[larger];
        let mut found_smaller = false;
        let child_ids = larger_term
            .child_ids
            .iter()
            .map(|&c| {
                let (found, replaced) =
                    self.input_replace_cached(table, smaller, smaller_meaning, c, cache)?;
                found_smaller |= found;
                Ok(replaced)
            })
            .collect::<Result<_>>()?;
        let replaced = if found_smaller {
            self.new_synthetic(larger_term.kind, child_ids)?
        } else {
            larger.into()
        };
        Ok((found_smaller, replaced))
    }

    pub fn is_generalised_by(
        &mut self,
        table: &Terms,
        smaller: TermIdx,
        larger: TermIdx,
        gen: SynthIdx,
    ) -> bool {
        let gen_term = self.index(table, gen);
        match gen_term {
            AnyTerm::Parsed(_) => {
                let gen = self.as_tidx(gen).unwrap();
                gen == larger
            }
            AnyTerm::Synth(synth_term) => match &synth_term.kind {
                SynthTermKind::Parsed(term_kind) => {
                    let smaller_term = &table[smaller];
                    let larger_term = &table[larger];
                    let smaller_meaning = table.meaning(smaller);
                    let larger_meaning = table.meaning(larger);
                    if !(smaller_meaning.is_none()
                        && larger_meaning.is_none()
                        && threeway_eq(term_kind, &smaller_term.kind, &larger_term.kind)
                        && threeway_eq(
                            gen_term.child_ids().len(),
                            smaller_term.child_ids.len(),
                            larger_term.child_ids.len(),
                        ))
                    {
                        return false;
                    }
                    for i in 0..smaller_term.child_ids.len() {
                        let smaller = smaller_term.child_ids[i];
                        let larger = larger_term.child_ids[i];
                        let gen = self.index(table, gen).child_ids()[i];
                        if !self.is_generalised_by(table, smaller, larger, gen) {
                            return false;
                        }
                    }
                    true
                }
                SynthTermKind::Generalised => {
                    if smaller == larger {
                        return false;
                    }
                    let input = synth_term.child_ids[0];
                    let actual_input = self.input_replace(table, smaller, larger).ok().flatten();
                    actual_input == Some(input)
                }
                _ => unreachable!(),
            },
            _ => unreachable!(),
        }
    }
}

fn threeway_eq<T: Eq>(a: T, b: T, c: T) -> bool {
    a == b && a == c
}
