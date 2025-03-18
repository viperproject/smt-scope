mod common;

// fn get_all_files() {
//     let r = reqwest::blocking::get(
//         "https://api.github.com/repos/viperproject/smt-logs/git/trees/smt2?recursive=true",
//     )
//     .unwrap();
//     let r = r.json::<serde_json::Value>().unwrap();
//     let tree = r["tree"].as_array().unwrap();
//     let test_files = tree
//         .iter()
//         .map(|l| l["path"].as_str().unwrap())
//         .filter(|p| p.starts_with("smt2/") && p.ends_with(".smt2"));
// }

#[test]
#[cfg_attr(not(feature = "test_verifiers"), ignore)]
fn parse_smt_logs() {
    common::parse_logs_in("../smt-logs/smt2", false, false, 2).expect("failed for n logs")
}
