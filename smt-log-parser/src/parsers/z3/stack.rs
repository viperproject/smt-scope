#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{items::StackIdx, Error, Result, TiVec};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Stack {
    pub(super) stack: Vec<StackIdx>,
    pub(super) stack_frames: TiVec<StackIdx, StackFrame>,
}

impl Stack {
    fn add_frame(&mut self) -> Result<()> {
        self.stack_frames.raw.try_reserve(1)?;
        let idx = self.stack_frames.push_and_get_key(StackFrame::new());
        self.stack.try_reserve(1)?;
        self.stack.push(idx);
        Ok(())
    }
    fn remove_frame(&mut self, active: bool) -> Option<StackIdx> {
        let idx = self.stack.pop()?;
        self.stack_frames[idx].active = active;
        Some(idx)
    }
    fn ensure_height(&mut self, height: usize) -> Result<()> {
        let mut res = Ok(());
        // Neither condition should hold, but handle it as best we can.
        while height > self.stack.len() {
            // Have not run into this case, so make tests fail if it happens.
            res = Err(Error::StackFrameNotPushed);
            self.add_frame()?;
        }
        while height < self.stack.len() {
            // This can happen when pushing a new frame in e.g. z3 v4.8.17 and
            // v4.11.2.
            // It seems that there is a bug where the pop doesn't get emitted
            // and so we need to conservatively leak the frame and treat it as
            // always active.
            self.remove_frame(true);
        }
        res
    }

    pub(super) fn new_frame(&mut self, idx: usize) -> Result<()> {
        let res = self.ensure_height(idx);
        self.add_frame()?;
        res
    }

    pub(super) fn pop_frames(&mut self, count: usize, idx: usize) -> Result<()> {
        debug_assert!(0 < count && count <= idx);
        let res = self.ensure_height(idx);
        for _ in 0..count {
            self.remove_frame(false).ok_or(Error::StackFrameNotPushed)?;
        }
        res
    }

    pub(super) fn active_frame(&self) -> Option<StackIdx> {
        self.stack.last().copied()
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Clone, Copy)]
pub struct StackFrame {
    pub active: bool,
}

impl Default for StackFrame {
    fn default() -> Self {
        Self::new()
    }
}

impl StackFrame {
    pub fn new() -> Self {
        Self { active: true }
    }
}
