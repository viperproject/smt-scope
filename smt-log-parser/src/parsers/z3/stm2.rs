#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Meaning, ProofIdx, ProofStep, ProofStepKind, Term, TermIdx},
    Error, FxHashMap, IString, Result, StringTable,
};

use super::terms::Terms;

/// Taken from `ast_smt_pp.cpp` of z3. These are not user defined and cannot be
/// used as triggers.
pub const M_PREDEF_NAMES: &[&str] = &[
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

    fn push(&mut self, kind: EventKind) -> Result<()> {
        self.events.try_reserve(1)?;
        self.events.push(Event {
            enodes: 0,
            insts: 0,
            kind,
        });
        Ok(())
    }

    fn pop(&mut self) {
        let Some(last) = self.events.pop() else {
            return;
        };
        let Some(other) = self.events.last_mut() else {
            return;
        };
        other.enodes += last.enodes;
        other.insts += last.insts;
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
        self.push(EventKind::NewConst(term_idx))
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
        self.push(EventKind::Assert(proof_idx))
    }

    pub(super) fn new_meaning(
        &mut self,
        term_idx: TermIdx,
        _meaning: Meaning,
        _strings: &StringTable,
    ) -> Result<()> {
        match self.events.last() {
            Some(Event {
                kind: EventKind::NewConst(idx),
                ..
            }) if term_idx == *idx => {
                self.pop();
            }
            _ => (),
        }
        Ok(())
    }

    pub(super) fn new_push(&mut self) -> Result<()> {
        self.push(EventKind::Push)
    }

    pub(super) fn new_pop(&mut self, num: core::num::NonZeroUsize, from_cdcl: bool) -> Result<()> {
        if from_cdcl {
            let mut consts_to_return = Vec::new();
            let mut to_pop = num.get();
            while to_pop > 0 {
                match self.events.last() {
                    Some(Event {
                        kind: EventKind::Push,
                        ..
                    }) => (),
                    Some(Event {
                        kind: EventKind::NewConst(_) | EventKind::BeginCheck,
                        ..
                    }) => {
                        consts_to_return.push(self.events.pop().unwrap());
                        continue;
                    }
                    _ => return Err(Error::PopConflictMismatch),
                }
                to_pop -= 1;
                self.pop();
            }
            self.events.extend(consts_to_return.into_iter().rev());
            Ok(())
        } else {
            self.push(EventKind::Pop((num.get() != 1).then_some(num)))
        }
    }

    pub(super) fn new_begin_check(&mut self) -> Result<()> {
        self.push(EventKind::BeginCheck)
    }

    pub(super) fn new_enode(&mut self) {
        if let Some(last) = self.events.last_mut() {
            last.enodes += 1;
        }
    }

    pub(super) fn new_inst(&mut self) {
        if let Some(last) = self.events.last_mut() {
            last.insts += 1;
        }
    }

    pub(super) fn new_eof(&mut self) {
        // Trim end of events log since it usually ends up getting filled with internal z3 junk at the end
        while self
            .events
            .last()
            .is_some_and(|last| !matches!(last.kind, EventKind::BeginCheck))
        {
            self.pop();
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy)]
pub struct Event {
    /// The number of enodes created after this event
    pub enodes: u64,
    /// The number of instantiations after this event
    pub insts: u64,
    pub kind: EventKind,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy)]
pub enum EventKind {
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
