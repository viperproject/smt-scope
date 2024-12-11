#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[macro_export]
macro_rules! idx {
    ($struct:ident, $prefix:tt) => {
        #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
        #[cfg_attr(feature = "mem_dbg", copy_type)]
        #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
        #[derive(Clone, Copy, Eq, PartialEq, PartialOrd, Ord, Hash)]
        // Note: we use `u32` since this the file would need to be > ~100GB to
        // overflow this with the number of terms constructed
        pub struct $struct($crate::NonMaxU32);
        impl From<usize> for $struct {
            fn from(value: usize) -> Self {
                assert!(value < u32::MAX as usize);
                Self($crate::NonMaxU32::new(value as u32).unwrap())
            }
        }
        impl From<$struct> for usize {
            fn from(value: $struct) -> Self {
                value.0.get() as usize
            }
        }
        impl core::fmt::Debug for $struct {
            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
                write!(f, $prefix, self.0)
            }
        }
        impl core::fmt::Display for $struct {
            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
                write!(f, "{}", self.0)
            }
        }
        impl $struct {
            pub const MAX: Self = Self($crate::NonMaxU32::MAX);
        }
    };
}
idx!(TermIdx, "t{}");
idx!(QuantIdx, "q{}");
idx!(InstIdx, "i{}");
idx!(StackIdx, "s{}");
idx!(ENodeIdx, "e{}");
idx!(MatchIdx, "m{}");
idx!(EqGivenIdx, "≡{}");
idx!(EqTransIdx, "={}");
idx!(GraphIdx, "g{}");
idx!(ProofIdx, "p{}");
idx!(DecisionIdx, "d{}");

// Not used for TiVec, but just as a typed wrapper

idx!(PatternIdx, "{{{}}}");
