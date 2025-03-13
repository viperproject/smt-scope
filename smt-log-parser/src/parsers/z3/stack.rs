#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{
    items::{CdclIdx, ENodeIdx, InstIdx, MatchIdx, ProofIdx, StackFrame, StackIdx},
    Error, Result, TiVec,
};

use super::Z3Parser;

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
        assert_eq!(idx, Self::ZERO_FRAME);
        Self {
            stack: vec![idx],
            stack_frames,
            timestamp: 1,
        }
    }
}

impl Stack {
    pub const ZERO_FRAME: StackIdx = StackIdx::ZERO;

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
    fn remove_frame(&mut self, active: bool, from_cdcl: bool) {
        let idx = self.stack.pop().unwrap();
        assert!(!self.stack.is_empty());
        let frame = &mut self.stack_frames[idx];
        frame.active.end(self.timestamp, active);
        frame.from_cdcl = from_cdcl;
        self.timestamp += 1;
    }
    pub(super) fn ensure_height(&mut self, height: usize) -> Result<()> {
        let mut res = Ok(());
        // Neither condition should hold, but handle it as best we can.
        while height > self.height() {
            // Have not run into this case, so make tests fail if it happens.
            res = Err(Error::StackFrameNotPushed);
            let from_cdcl = self.is_speculative();
            self.add_frame(from_cdcl)?;
        }
        while height < self.height() {
            // This can happen when pushing a new frame in e.g. z3 v4.8.17 and
            // v4.11.2.
            // It seems that there is a bug where the pop doesn't get emitted
            // and so we need to conservatively leak the frame and treat it as
            // always active.
            let from_cdcl = self.is_speculative();
            self.remove_frame(true, from_cdcl);
        }
        res
    }

    pub(super) fn new_frame(&mut self, idx: usize, from_cdcl: bool) -> Result<()> {
        let res = self.ensure_height(idx);
        self.add_frame(from_cdcl)?;
        res
    }

    pub(super) fn pop_frames(
        &mut self,
        count: core::num::NonZeroUsize,
        idx: usize,
        after_conflict: bool,
    ) -> Result<bool> {
        let count = count.get();
        debug_assert!(0 < count && count <= idx);
        let result = self.ensure_height(idx);
        let from_cdcl = after_conflict
            || (0..count).any(|idx| self[self.stack[self.stack.len() - 1 - idx]].from_cdcl);
        if from_cdcl {
            // TODO: actually mark the frames as from CDCL (e.g. also in `smt2.rs`).
            for idx in 0..count {
                let frame = self.stack[self.stack.len() - 1 - idx];
                self.stack_frames[frame].from_cdcl = true;
            }
        }
        debug_assert!(
            !from_cdcl
                || (0..count)
                    .all(|idx| self[self.stack[self.stack.len() - 1 - idx]].from_cdcl == from_cdcl)
        );
        for _ in 0..count {
            self.remove_frame(false, from_cdcl);
        }
        result.map(|()| from_cdcl)
    }

    /// Called during a decision assign, immediately following a push. This
    /// marks the push as `from_cdcl` and returns true if it wasn't already.
    pub(super) fn new_decision(&mut self) -> bool {
        debug_assert!(self.stack.len() > 1);
        let frame = self.active_frame();
        let frame = &mut self.stack_frames[frame];
        !core::mem::replace(&mut frame.from_cdcl, true)
    }

    pub(super) fn active_frame(&self) -> StackIdx {
        *self.stack.last().unwrap()
    }

    /// For use in CDCL only.
    pub(super) fn pre_active_frame(&self) -> StackIdx {
        self.stack[self.stack.len() - 2]
    }

    pub(super) fn is_speculative(&self) -> bool {
        self.stack_frames[self.active_frame()].from_cdcl
    }

    pub(super) fn is_alive(&self, frame: StackIdx) -> bool {
        self[frame].active.status().is_alive()
    }

    #[cfg(any())]
    pub(super) fn is_global(&self, frame: StackIdx) -> bool {
        frame == Self::ZERO_FRAME
    }
}

impl std::ops::Index<StackIdx> for Stack {
    type Output = StackFrame;
    fn index(&self, idx: StackIdx) -> &Self::Output {
        &self.stack_frames[idx]
    }
}

pub trait HasFrame {
    fn frame(self, parser: &Z3Parser) -> StackIdx;
}

macro_rules! impl_has_frame {
    ($($ty:ty),*) => {
        $(impl HasFrame for $ty {
            fn frame(self, parser: &Z3Parser) -> StackIdx {
                parser[self].frame
            }
        })*
    };
}

impl_has_frame!(ENodeIdx, MatchIdx, InstIdx, ProofIdx, CdclIdx);
