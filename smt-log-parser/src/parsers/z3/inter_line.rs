#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default, Clone, Copy)]
pub(super) struct InterLine {
    prev: Data,
    curr: Data,
}

impl InterLine {
    pub fn newline(&mut self) {
        self.prev = self.curr;
        self.curr = Default::default();
    }
    pub fn prev(&self) -> Data {
        self.prev
    }
    pub fn curr(&mut self) -> &mut Data {
        &mut self.curr
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default, Clone, Copy)]
pub(super) struct Data {
    pub(super) last_line_kind: LineKind,
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default, Clone, Copy)]
pub(super) enum LineKind {
    DecideAndOr,
    Conflict,
    #[default]
    Other,
}
