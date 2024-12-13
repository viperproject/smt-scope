#[derive(Debug, Clone, Copy, PartialEq)]
pub struct F64Ord(pub f64);
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
