mod common;

#[test]
fn parse_smt_problems() {
    common::parse_logs_in("../smt-problems", false, true).expect("failed for n logs")
}
