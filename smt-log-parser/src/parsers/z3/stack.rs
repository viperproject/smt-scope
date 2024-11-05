#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{StackFrame, StackIdx},
    Error, Result, TiVec,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug)]
pub struct Stack {
    stack: Vec<StackIdx>,
    pub(super) stack_frames: TiVec<StackIdx, StackFrame>,
    timestamp: u32,
}

impl Default for Stack {
    fn default() -> Self {
        let mut stack_frames: TiVec<StackIdx, StackFrame> = TiVec::default();
        let idx = stack_frames.push_and_get_key(StackFrame::new(0, false));
        Self {
            stack: vec![idx],
            stack_frames,
            timestamp: 1,
        }
    }
}

impl Stack {
    fn height(&self) -> usize {
        self.stack.len() - 1
    }

    fn add_frame(&mut self, from_cdcl: bool) -> Result<()> {
        self.stack_frames.raw.try_reserve(1)?;
        let idx = self
            .stack_frames
            .push_and_get_key(StackFrame::new(self.timestamp, from_cdcl));
        self.stack.try_reserve(1)?;
        self.stack.push(idx);
        self.timestamp += 1;
        Ok(())
    }
    fn remove_frame(&mut self, active: bool, from_cdcl: bool) -> Option<StackIdx> {
        let idx = self.stack.pop().unwrap();
        assert!(!self.stack.is_empty());
        let frame = &mut self.stack_frames[idx];
        frame.active.end(self.timestamp, active);
        frame.from_cdcl = from_cdcl;
        self.timestamp += 1;
        Some(idx)
    }
    pub(super) fn ensure_height(&mut self, height: usize, from_cdcl: bool) -> Result<()> {
        let mut res = Ok(());
        // Neither condition should hold, but handle it as best we can.
        while height > self.height() {
            // Have not run into this case, so make tests fail if it happens.
            res = Err(Error::StackFrameNotPushed);
            self.add_frame(from_cdcl)?;
        }
        while height < self.height() {
            // This can happen when pushing a new frame in e.g. z3 v4.8.17 and
            // v4.11.2.
            // It seems that there is a bug where the pop doesn't get emitted
            // and so we need to conservatively leak the frame and treat it as
            // always active.
            self.remove_frame(true, from_cdcl);
        }
        res
    }

    pub(super) fn new_frame(&mut self, idx: usize, from_cdcl: bool) -> Result<()> {
        let res = self.ensure_height(idx, from_cdcl);
        self.add_frame(from_cdcl)?;
        res
    }

    pub(super) fn pop_frames(
        &mut self,
        count: core::num::NonZeroUsize,
        idx: usize,
        mut from_cdcl: bool,
    ) -> Result<bool> {
        let count = count.get();
        debug_assert!(0 < count && count <= idx);
        from_cdcl = from_cdcl
            || (0..count)
                .any(|idx| self.stack_frames[self.stack[self.stack.len() - 1 - idx]].from_cdcl);
        let res = self.ensure_height(idx, from_cdcl);
        for _ in 0..count {
            self.remove_frame(false, from_cdcl)
                .ok_or(Error::StackFrameNotPushed)?;
        }
        res.map(|_| from_cdcl)
    }

    pub(super) fn active_frame(&self) -> StackIdx {
        *self.stack.last().unwrap()
    }
}
