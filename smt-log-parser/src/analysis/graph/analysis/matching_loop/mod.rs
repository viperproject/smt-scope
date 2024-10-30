mod generalise;
mod node;
mod search;
mod signature;

pub use generalise::*;
pub use node::*;
pub use search::*;
pub use signature::*;

pub const MIN_MATCHING_LOOP_LENGTH: usize = 3;
