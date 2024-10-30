#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Meaning, ProofIdx, ProofStep, ProofStepKind, Term, TermIdx},
    FxHashMap, IString, Result, StringTable,
};

use super::terms::Terms;

/// Taken from `ast_smt_pp.cpp` of z3. These are not user defined and cannot be
/// used as triggers.
pub const M_PREDEF_NAMES: &'static [&'static str] = &[
    "=", ">=", "<=", "+", "-", "*", ">", "<", "!=", "or", "and", "implies", "not", "iff", "xor",
    "true", "false", "forall", "exists", "let", "flet", // Extended with the following.
    "pi", "euler", "pattern", "to_int", "to_real",
];

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct EventLog {
    events: Vec<Event>,
    declared_functions: FxHashMap<IString, u64>,
}

impl EventLog {
    pub fn events(&self) -> &[Event] {
        &self.events
    }

    pub(super) fn new(strings: &mut StringTable) -> Self {
        let mut declared_functions = FxHashMap::default();
        for predef_name in M_PREDEF_NAMES {
            let predef_name = IString(strings.get_or_intern_static(predef_name));
            declared_functions.insert(predef_name, u64::MAX);
        }
        Self {
            events: Vec::new(),
            declared_functions,
        }
    }

    pub(super) fn new_term(
        &mut self,
        term_idx: TermIdx,
        term: &Term,
        strings: &StringTable,
    ) -> Result<()> {
        if !strings[*term.id.namespace].is_empty() {
            return Ok(());
        }
        let Some(iname) = term.kind.app_name() else {
            return Ok(());
        };
        let declared = self.declared_functions.entry(iname).or_default();
        let children = term.child_ids.len().min(u64::BITS as usize - 1);
        let children_mask = 1 << children;
        if *declared & children_mask != 0 {
            return Ok(());
        }
        let name = &strings[*iname];
        if name.starts_with('?') || is_k_bang_number(name) || name.contains("!val!") {
            return Ok(());
        }
        *declared |= children_mask;
        self.events.try_reserve(1)?;
        self.events.push(Event::NewConst(term_idx));
        Ok(())
    }

    pub(super) fn new_proof_step(
        &mut self,
        proof_idx: ProofIdx,
        proof_step: &ProofStep,
        _terms: &Terms,
        _strings: &StringTable,
    ) -> Result<()> {
        if !matches!(proof_step.kind, ProofStepKind::PR_ASSERTED) {
            return Ok(());
        }
        self.events.try_reserve(1)?;
        self.events.push(Event::Assert(proof_idx));
        Ok(())
    }

    pub(super) fn new_meaning(
        &mut self,
        term_idx: TermIdx,
        _meaning: Meaning,
        _strings: &StringTable,
    ) -> Result<()> {
        match self.events.last() {
            Some(Event::NewConst(idx)) if term_idx == *idx => {
                self.events.pop();
            }
            _ => (),
        }
        Ok(())
    }

    pub(super) fn new_push(&mut self) -> Result<()> {
        self.events.try_reserve(1)?;
        self.events.push(Event::Push);
        Ok(())
    }

    pub(super) fn new_pop(&mut self, num: core::num::NonZeroUsize) -> Result<()> {
        self.events.try_reserve(1)?;
        self.events
            .push(Event::Pop((num.get() != 1).then_some(num)));
        Ok(())
    }

    pub(super) fn new_begin_check(&mut self) -> Result<()> {
        self.events.try_reserve(1)?;
        self.events.push(Event::BeginCheck);
        Ok(())
    }

    pub(super) fn new_eof(&mut self) {
        // Trim end of events log since it usually ends up getting filled with internal z3 junk at the end
        while self
            .events
            .last()
            .is_some_and(|last| !matches!(last, Event::BeginCheck))
        {
            self.events.pop();
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub enum Event {
    NewConst(TermIdx),
    Assert(ProofIdx),
    Push,
    Pop(Option<core::num::NonZeroUsize>),
    BeginCheck,
}

fn is_k_bang_number(name: &str) -> bool {
    name.strip_prefix("k!")
        .is_some_and(|suffix| suffix.parse::<usize>().is_ok())
}
