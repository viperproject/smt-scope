#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use crate::{BigRational, BigUint, IString};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum Meaning {
    Arith(Box<BigRational>),
    BitVec(Box<BitVec>),
    Unknown {
        /// The theory in which the value should be interpreted (e.g. `bv`)
        theory: IString,
        /// The value of the term (e.g. `#x0000000000000001` or `#b1`)
        value: IString,
    },
}

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct BitVec {
    pub value: BigUint,
    pub bits: u32,
}
