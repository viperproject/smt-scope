#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{Meaning, ProofIdx, ProofStep, ProofStepKind, Term, TermIdx},
    Error, FxHashMap, IString, Result, StringTable,
};

use super::terms::Terms;

/// Taken from `ast_smt_pp.cpp` of z3. These are not user defined and cannot be
/// used as patterns.
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
        let Some(prev) = self.events.last_mut() else {
            return;
        };
        prev.enodes += last.enodes;
        prev.insts += last.insts;
    }

    pub(super) fn new_term(
        &mut self,
        term_idx: TermIdx,
        term: &Term,
        strings: &StringTable,
    ) -> Result<()> {
        if term.id.namespace.is_some() {
            return Ok(());
        }
        let Some(iname) = term.app_name() else {
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
        _meaning: &Meaning,
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

    pub(super) fn new_push(&mut self, cdcl: bool) -> Result<()> {
        self.push(EventKind::Push(cdcl))
    }
    pub(super) fn undo_push(&mut self) {
        let Some(Event {
            kind: EventKind::Push(cdcl @ false),
            ..
        }) = self.events.last_mut()
        else {
            debug_assert!(false, "Undo push without a push event");
            return;
        };
        *cdcl = true;
    }

    pub(super) fn new_pop(&mut self, num: core::num::NonZeroUsize, from_cdcl: bool) -> Result<()> {
        let mut to_pop = num.get();
        let mut to_ignore = 0;
        for ev in self.events.iter_mut().rev() {
            if to_pop == 0 {
                break;
            }
            match &mut ev.kind {
                // TODO: Figure out how an `BeginCheck` or even `Assert`
                // can end up within a hypothetical CDCL stack.
                EventKind::NewConst(_) | EventKind::BeginCheck | EventKind::Assert(_) => continue,
                EventKind::Push(_) if to_ignore > 0 => {
                    to_ignore -= 1;
                }
                EventKind::Push(cdcl) => {
                    if !from_cdcl && *cdcl {
                        return Err(Error::PopConflictMismatch);
                    }
                    *cdcl = from_cdcl;
                    to_pop -= 1;
                }
                EventKind::Pop(_, num) => {
                    to_ignore += num.map_or(1, |num| num.get());
                }
            }
        }
        debug_assert_eq!(to_pop, 0, "Failed to pop all frames");
        self.push(EventKind::Pop(from_cdcl, (num.get() != 1).then_some(num)))
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
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy)]
pub struct Event {
    /// The number of enodes created after this event
    pub enodes: u64,
    /// The number of instantiations after this event
    pub insts: u64,
    pub kind: EventKind,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy)]
pub enum EventKind {
    NewConst(TermIdx),
    Assert(ProofIdx),
    Push(bool),
    Pop(bool, Option<core::num::NonZeroUsize>),
    BeginCheck,
}

impl EventKind {
    pub fn is_from_source(&self) -> bool {
        !matches!(self, EventKind::Push(true, ..) | EventKind::Pop(true, ..))
    }
}

fn is_k_bang_number(name: &str) -> bool {
    name.strip_prefix("k!")
        .is_some_and(|suffix| suffix.parse::<usize>().is_ok())
}
