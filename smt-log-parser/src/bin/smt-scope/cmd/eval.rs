use std::{
    path::PathBuf,
    time::{Duration, Instant},
};

use smt_log_parser::analysis::{InstGraph, RedundancyAnalysis};

pub struct Timer(Instant);
impl Timer {
    pub fn start() -> Self {
        Self(Instant::now())
    }
    pub fn lap(&mut self) -> Duration {
        let old = core::mem::replace(&mut self.0, Instant::now());
        self.0 - old
    }
}

pub fn run(logfile: PathBuf) -> Result<(), String> {
    let mut timer = Timer::start();
    let mut parser = super::run_on_logfile(logfile)?;
    let parse_time = timer.lap();
    let mut graph = InstGraph::new_lite(&parser).map_err(|e| format!("{e:?}"))?;
    let graph_time = timer.lap();
    let loops = graph.search_matching_loops(&mut parser);
    let redundancy = RedundancyAnalysis::new(&parser);
    let analysis_time = timer.lap();
    println!("[Parse] {}us", parse_time.as_micros());
    println!("[Graph] {}us", graph_time.as_micros());
    println!("[Analysis] {}us", analysis_time.as_micros());
    println!("[Loops] {} true, {} false", loops.sure_mls, loops.maybe_mls);
    let rpq = redundancy.per_quant.iter_enumerated();
    let pos_im = rpq.filter(|(_, d)| d.input_multiplicativity() > 1.0);
    println!("[Branching] {}", pos_im.count());
    Ok(())
}
