use smt_log_parser::analysis::analysis::matching_loop;

/// See documentation of `MlData` in the parser crate.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MlData {
    pub sure_mls: usize,
    pub maybe_mls: usize,
}

impl MlData {
    pub fn sum(self) -> usize {
        self.sure_mls + self.maybe_mls
    }
}

impl From<&matching_loop::MlData> for MlData {
    fn from(data: &matching_loop::MlData) -> Self {
        Self {
            sure_mls: data.sure_mls,
            maybe_mls: data.maybe_mls,
        }
    }
}
