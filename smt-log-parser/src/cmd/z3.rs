use std::path::PathBuf;

use smt_log_parser::Solver;
use z3::Params;

pub fn run(smt2_file: PathBuf) -> Result<(), String> {
    let solver = Solver::new(&smt2_file);
    let ctx = solver.context();
    let solver = solver.solver();
    println!("Solver:\n{}\n---", solver.to_smt2());

    let res = solver.check();
    println!("Result: {:?}", res);
    Ok(())
}
