#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy)]
pub struct F64Ord(pub f64);
impl std::cmp::PartialEq for F64Ord {
    fn eq(&self, other: &Self) -> bool {
        self.0.total_cmp(&other.0).is_eq()
    }
}
impl std::cmp::Eq for F64Ord {}
impl std::cmp::PartialOrd for F64Ord {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}
impl std::cmp::Ord for F64Ord {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        self.0.total_cmp(&other.0)
    }
}

#[cfg(test)]
pub(crate) fn test_parser() -> crate::Z3Parser {
    use crate::LogParser;
    let file = include_str!("../tests/data/z3.log");
    crate::Z3Parser::from_str(file).process_all().unwrap()
}
