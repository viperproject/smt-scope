mod common;

#[test]
fn parse_smt_problems() {
    common::parse_logs_in("../test-smtlib", false, true).expect("failed for n logs")
}
