use std::{
    path::PathBuf,
    time::{Duration, Instant},
};

use smt_log_parser::{
    analysis::{InstGraph, RedundancyAnalysis},
    display_with::DisplayWithCtxt,
    items::QuantPat,
    parsers::dummy::Z3DummyParser,
    FxHashSet, LogParser,
};

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

pub fn run_dummy(logfile: PathBuf) -> Result<(), String> {
    let mut timer = Timer::start();
    let path = std::path::Path::new(&logfile);
    let (_metadata, parser) = Z3DummyParser::from_file(path).map_err(|e| e.to_string())?;
    let parser = parser.process_all().map_err(|e| e.to_string())?;
    let parse_time = timer.lap();
    let parser = format!("{parser:?}");
    assert!(parser.len() > 30);
    println!("[Parse] {}us", parse_time.as_micros());
    Ok(())
}

pub fn run(logfile: PathBuf, dummy: bool) -> Result<(), String> {
    if dummy {
        return run_dummy(logfile);
    }
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
    let qpat_to_str = |q: QuantPat| {
        let name = parser[q.quant].kind.name(&parser.strings);
        let name = name.as_deref().unwrap_or("null").replace(' ', "--");
        format!("{name}{}[{}{}]", q.pat.with(&()), q.quant, q.pat.with(&()))
    };
    for ml in &loops.matching_loops {
        let (repetitions, leaf) = ml.leaves.0[0];
        print!("[OneLoop] {repetitions} repetitions, ");
        if ml.graph.is_some() {
            print!("true-loop, ");
        } else {
            print!("false-loop, ");
        }
        let members = [leaf].into_iter().chain(ml.members(loops));
        let members = members.flat_map(|i| parser.get_inst(i).match_.kind.quant_pat());
        let mut printed = FxHashSet::default();
        let mut to_print = Vec::new();
        for m in members {
            if printed.insert(m) {
                to_print.push(qpat_to_str(m));
            }
        }
        println!("{}", to_print.join(" -> "));
        if ml.leaves.0.len() > 1 {
            print!("[ExtraLoop]");
            for (repetitions, _) in ml.leaves.0.iter().skip(1) {
                print!(" {repetitions}");
            }
            println!();
        }
    }
    let rpq = redundancy.per_quant.iter_enumerated();
    let pos_im = rpq.filter(|(_, d)| d.input_multiplicativity() > 1.0);
    let pos_im = pos_im.map(|(q, d)| format!("{} {}x", qpat_to_str(q), d.input_multiplicativity()));
    let pos_im = pos_im.collect::<Vec<_>>();
    println!("[Branching] {} {}", pos_im.len(), pos_im.join(" "));
    Ok(())
}
