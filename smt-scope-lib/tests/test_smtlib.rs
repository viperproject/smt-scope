mod common;

#[test]
fn parse_smt_problems() {
    std::env::set_var("SCOPE_MEM_DBG", "true");
    common::parse_logs_in("../test-smtlib", false, true, 15).expect("failed for n logs")
}
