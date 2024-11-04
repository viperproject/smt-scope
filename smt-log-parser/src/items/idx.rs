#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

#[macro_export]
macro_rules! idx {
    ($struct:ident, $prefix:tt) => {
        #[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
        #[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
        #[derive(Clone, Copy, Eq, PartialEq, PartialOrd, Ord, Hash)]
        pub struct $struct($crate::NonMaxUsize);
        impl From<usize> for $struct {
            fn from(value: usize) -> Self {
                Self($crate::NonMaxUsize::new(value).unwrap())
            }
        }
        impl From<$struct> for usize {
            fn from(value: $struct) -> Self {
                value.0.get()
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
