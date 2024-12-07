#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Fingerprint, InstIdx, Instantiation, Match, MatchIdx},
    FxHashMap, Result, TiVec,
};

pub struct InstData<'a> {
    pub iidx: InstIdx,
    pub inst: &'a Instantiation,
    pub midx: MatchIdx,
    pub match_: &'a Match,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Insts {
    // `theory-solving` fingerprints are always 0, others rarely repeat.
    fingerprint_to_match: FxHashMap<Fingerprint, (MatchIdx, Option<InstIdx>)>,
    pub(crate) matches: TiVec<MatchIdx, Match>,
    pub(crate) insts: TiVec<InstIdx, Instantiation>,

    has_theory_solving_inst: bool,
}

impl Insts {
    pub fn new_match(&mut self, fingerprint: Fingerprint, match_: Match) -> Result<MatchIdx> {
        self.has_theory_solving_inst |= match_.kind.quant_idx().is_none();

        self.matches.raw.try_reserve(1)?;
        let idx = self.matches.push_and_get_key(match_);
        // Can remove a duplicate fingerprint if that one was never instantiated.
        self.fingerprint_to_match.try_reserve(1)?;
        self.fingerprint_to_match.insert(fingerprint, (idx, None));
        Ok(idx)
    }

    pub fn get_match(&self, fingerprint: Fingerprint) -> Option<MatchIdx> {
        self.fingerprint_to_match
            .get(&fingerprint)
            .map(|(idx, _)| *idx)
    }
    pub fn new_inst(
        &mut self,
        fingerprint: Fingerprint,
        inst: Instantiation,
        can_duplicate: bool,
    ) -> Result<InstIdx> {
        let (_, inst_idx) = self
            .fingerprint_to_match
            .get_mut(&fingerprint)
            .unwrap_or_else(|| panic!("{:x}", fingerprint.0));
        self.insts.raw.try_reserve(1)?;
        let idx = self.insts.push_and_get_key(inst);
        debug_assert!(
            can_duplicate || inst_idx.is_none(),
            "duplicate fingerprint {fingerprint}"
        );
        *inst_idx = Some(idx);
        Ok(idx)
    }

    pub fn has_theory_solving_inst(&self) -> bool {
        self.has_theory_solving_inst
    }

    pub fn instantiations(&self) -> impl Iterator<Item = InstData<'_>> {
        self.insts
            .iter_enumerated()
            .map(move |(iidx, inst)| self.get_inst_inner(iidx, inst))
    }

    pub fn get_inst(&self, iidx: InstIdx) -> InstData<'_> {
        let inst = &self.insts[iidx];
        self.get_inst_inner(iidx, inst)
    }

    fn get_inst_inner<'a>(&'a self, iidx: InstIdx, inst: &'a Instantiation) -> InstData<'a> {
        let match_ = &self.matches[inst.match_];
        InstData {
            iidx,
            inst,
            midx: inst.match_,
            match_,
        }
    }
}

impl std::ops::Index<InstIdx> for Insts {
    type Output = Instantiation;
    fn index(&self, idx: InstIdx) -> &Self::Output {
        &self.insts[idx]
    }
}
impl std::ops::IndexMut<InstIdx> for Insts {
    fn index_mut(&mut self, idx: InstIdx) -> &mut Self::Output {
        &mut self.insts[idx]
    }
}

impl std::ops::Index<MatchIdx> for Insts {
    type Output = Match;
    fn index(&self, idx: MatchIdx) -> &Self::Output {
        &self.matches[idx]
    }
}
