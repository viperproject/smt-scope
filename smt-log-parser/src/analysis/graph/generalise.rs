use crate::{
    items::{TermIdx, TermKind},
    parsers::z3::{
        synthetic::{SynthIdx, SynthTerms},
        terms::Terms,
    },
    BoxSlice, Result,
};

impl SynthTerms {
    pub fn generalise(
        &mut self,
        table: &Terms,
        general: SynthIdx,
        larger: TermIdx,
    ) -> Result<SynthIdx> {
        if general == larger.into() {
            // if terms are equal, no need to generalize
            return Ok(general);
        }

        let general_term = self.index(table, general);

        let Some(general_kind) = general_term.kind().non_generalised() else {
            // if one of the terms is already generalised, no need to continue
            return self.new_generalised([general, larger.into()].into());
        };

        let meanings_eq =
            self.as_tidx(general).and_then(|t| table.meaning(t)) == table.meaning(larger);
        let larger_term = &table[larger];
        if meanings_eq
            && general_kind == larger_term.kind
            && general_term.child_ids().len() == larger_term.child_ids.len()
        {
            let children: Box<[_]> = general_term.child_ids().into();
            let child_ids = children
                .iter()
                .zip(&*larger_term.child_ids)
                .map(|(&g, &l)| self.generalise(table, g, l))
                .collect::<Result<_>>()?;
            self.new_synthetic(general_kind, child_ids)
        } else {
            self.new_generalised([general, larger.into()].into())
        }
    }

    pub fn generalise_pattern(&mut self, table: &Terms, pattern: TermIdx) -> Result<SynthIdx> {
        let pterm = &table[pattern];
        match pterm.kind {
            TermKind::Var(_) => self.new_generalised(Default::default()),
            kind => {
                let child_ids: BoxSlice<_> = pterm
                    .child_ids
                    .iter()
                    .map(|c| self.generalise_pattern(table, *c))
                    .collect::<Result<_>>()?;
                if child_ids.iter().all(|&c| self.as_tidx(c).is_some()) {
                    Ok(pattern.into())
                } else {
                    self.new_synthetic(kind, child_ids)
                }
            }
        }
    }
}
