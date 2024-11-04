mod analysis;
mod node;
mod search;
mod signature;

pub use analysis::*;
pub use node::*;
pub use signature::*;

pub const MIN_MATCHING_LOOP_LENGTH: u32 = 6;
