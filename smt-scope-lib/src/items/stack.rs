use core::fmt;

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy)]
pub struct StackFrame {
    /// Is this frame definitely from CDCL? If this is false then it may still
    /// be from CDCL.
    pub from_cdcl: bool,
    pub active: TimeRange,
}

impl StackFrame {
    pub fn new(start: u32, from_cdcl: bool) -> Self {
        Self {
            from_cdcl,
            active: TimeRange {
                start,
                end: u32::MAX,
                leaked: false,
            },
        }
    }
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
pub struct TimeRange {
    start: u32,
    end: u32,
    leaked: bool,
}

impl TimeRange {
    pub fn sorted_overlap(&self, greater: &Self) -> bool {
        debug_assert!(self.start <= greater.start);
        debug_assert!(greater.end <= self.end || self.end < greater.start);
        greater.end <= self.end
    }

    pub fn status(&self) -> TimeRangeStatus {
        match (self.start, self.end, self.leaked) {
            (0, end, leaked) => {
                debug_assert!(end == u32::MAX && !leaked);
                TimeRangeStatus::Global
            }
            (_, u32::MAX, leaked) => {
                debug_assert!(!leaked);
                TimeRangeStatus::Active
            }
            (_, _, true) => TimeRangeStatus::Leaked,
            (_, _, false) => TimeRangeStatus::Ended,
        }
    }

    pub fn end(&mut self, end: u32, leaked: bool) {
        debug_assert!(self.status().is_active());
        self.end = end;
        self.leaked = leaked;
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TimeRangeStatus {
    Global,
    Active,
    Leaked,
    Ended,
}

impl TimeRangeStatus {
    pub fn is_global(self) -> bool {
        matches!(self, Self::Global)
    }
    pub fn is_active(self) -> bool {
        matches!(self, Self::Active)
    }
    pub fn is_leaked(self) -> bool {
        matches!(self, Self::Leaked)
    }
    pub fn is_ended(self) -> bool {
        matches!(self, Self::Ended)
    }

    pub fn is_alive(self) -> bool {
        !self.is_ended()
    }
}

impl fmt::Display for TimeRange {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.status() {
            TimeRangeStatus::Global => write!(f, "∞"),
            TimeRangeStatus::Active => write!(f, "t{}→", self.start),
            TimeRangeStatus::Leaked => write!(f, "t{}→t{}?", self.start, self.end),
            TimeRangeStatus::Ended => write!(f, "t{}→t{}", self.start, self.end),
        }
    }
}
