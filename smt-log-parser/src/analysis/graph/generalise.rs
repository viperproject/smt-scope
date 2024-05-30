use crate::{
    items::{Meaning, Term, TermIdx, TermKind},
    parsers::z3::terms::Terms,
    IString, StringTable,
};

impl Terms {
    pub fn generalise(
        &mut self,
        strings: &mut StringTable,
        terms: Vec<TermIdx>,
    ) -> Option<TermIdx> {
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

        let mut next = terms;
        let mut stack: Vec<(Vec<&'static Term>, Option<Meaning>, Vec<TermIdx>)> = vec![];
        loop {
            let deref: Vec<&'static Term>;
            if check(next.iter(), |t1, t2| t1 == t2) {
                // if terms are equal, no need to generalize
                assert!(!next.is_empty(), "generalise called with empty terms");
                let Some((_, _, children)) = stack.last_mut() else {
                    return Some(next[0]);
                };
                children.push(next[0]);
            } else if check(next.iter().map(|t| self.meaning(*t)), |m1, m2| m1 == m2) && {
                let d = next.iter().map(|t| &self[*t]).collect();
                deref = unsafe { std::mem::transmute::<Vec<&Term>, Vec<&'static Term>>(d) };
                check(deref.iter(), |t1, t2| {
                    t1.kind == t2.kind && t1.child_ids.len() == t2.child_ids.len()
                })
            } {
                // if neither term is generalized, check the meanings and kinds and recurse over children
                let meaning = self.meaning(next[0]).copied();
                stack.push((deref, meaning, vec![]));
            } else {
                // if meanings or kinds don't match up, need to generalize
                let (_, _, children) = stack.last_mut()?;
                let meaning = self.try_find_meaning(strings, &next);
                let tidx = self.new_synthetic_term(
                    TermKind::Generalised,
                    next.into_boxed_slice(),
                    meaning,
                );
                children.push(tidx);
            }

            let (mut deref, mut meaning, mut children) = stack.pop().unwrap();
            while deref[0].child_ids.len() == children.len() {
                let tidx =
                    self.new_synthetic_term(deref[0].kind, children.into_boxed_slice(), meaning);
                let Some((new_deref, new_meaning, new_children)) = stack.pop() else {
                    return Some(tidx);
                };
                (deref, meaning, children) = (new_deref, new_meaning, new_children);
                children.push(tidx);
            }
            next = deref.iter().map(|t| t.child_ids[children.len()]).collect();
            stack.push((deref, meaning, children));
        }
    }

    pub fn generalise_pattern(&mut self, _strings: &mut StringTable, pattern: TermIdx) -> TermIdx {
        match self[pattern].kind {
            TermKind::Var(_) => {
                self.new_synthetic_term(TermKind::Generalised, Default::default(), None)
            }
            TermKind::Generalised => pattern,
            _ => {
                let children = Vec::from(self[pattern].child_ids.clone())
                    .into_iter()
                    .map(|c| self.generalise_pattern(_strings, c))
                    .collect();
                self.new_synthetic_term(
                    self[pattern].kind,
                    children,
                    self.meaning(pattern).copied(),
                )
            }
        }
    }

    pub fn try_find_meaning(
        &self,
        strings: &mut StringTable,
        _terms: &[TermIdx],
    ) -> Option<Meaning> {
        let value = String::from("_");
        // TODO: it would be nice here to try and find the repeating pattern,
        // e.g. if we have `x`, `f(x)`, `f(f(x))`, ... we could generalise to `f^*(c)`.

        (value != "_").then(|| Meaning {
            theory: IString(strings.get_or_intern("generalisation")),
            value: IString(strings.get_or_intern(value)),
        })
    }
}
