#[cfg(feature = "mem_dbg")]
use mem_dbg::{DbgFlags, MemDbg};
#[cfg(feature = "analysis")]
use smt_log_parser::analysis;
use smt_log_parser::{
    display_with::DisplayWithCtxt,
    items::QuantPat,
    parsers::{z3::Z3Parser, LogParser},
};
use std::{path::PathBuf, time::Duration};
use wasm_timer::Instant;

const MB: u64 = 1024_u64 * 1024_u64;

pub fn run(logfiles: Vec<PathBuf>, timeout: f32, memory: bool) -> Result<(), String> {
    for path in logfiles {
        let builder = std::thread::Builder::new().stack_size(8 * MB as usize);
        let t = builder
            .spawn(move || {
                run_file(path, timeout, memory);
            })
            .unwrap();
        t.join().unwrap();
    }
    Ok(())
}

fn run_file(path: PathBuf, timeout: f32, memory: bool) {
    let path = std::path::Path::new(&path);
    let filename = path
        .file_name()
        .map(|f| f.to_string_lossy())
        .unwrap_or_default();
    if !path.is_file() {
        println!("Skipping {filename:?}");
        return;
    }
    println!("- Parsing {filename:?}");
    let time = Instant::now();
    // // Use to test max loading speed
    // let file = std::fs::read_to_string(path).unwrap();
    // let len = file.chars().filter(|c| *c == '\n').count();
    // let parsed = StreamParser::parse_entire_string(&file, Duration::from_secs_f32(10.0));
    let to = Duration::from_secs_f32(timeout);
    let (_metadata, parser) = Z3Parser::from_file(path).unwrap();
    let (timeout, mut result) = parser.process_all_timeout(to);
    let elapsed_time = time.elapsed();
    if memory {
        #[cfg(feature = "mem_dbg")]
        result.mem_dbg(DbgFlags::default()).ok();
    }
    let errors = result.errors();
    println!(
        "[Parsing] {} after {} seconds (timeout {timeout:?}){errors}",
        if timeout.is_timeout() {
            "Timeout"
        } else {
            "Finished"
        },
        elapsed_time.as_secs_f32()
    );
    #[cfg(feature = "analysis")]
    {
        let mut all = analysis::run_all(&result);
        let mult_quants = mult_quants(&all);
        let inst_graph = &mut all.inst_graph;
        inst_graph.search_matching_loops(&mut result);
        let _displayed = inst_graph.to_visible();
        let process_time = time.elapsed();

        if memory {
            #[cfg(feature = "mem_dbg")]
            inst_graph.mem_dbg(DbgFlags::default()).ok();
        }
        println!(
            "[Analysis] Finished after {} seconds.",
            (process_time - elapsed_time).as_secs_f32(),
        );

        let (sure_mls, maybe_mls) = inst_graph.found_matching_loops().unwrap();
        let quants_involved: Vec<_> = inst_graph
            .quants_per_matching_loop()
            .unwrap()
            .map(|q| result[q.quant].kind.debug(&result))
            .collect();
        println!(
            "[Matching loops] Found {sure_mls} sure, {maybe_mls} maybe. Quantifiers {quants_involved:?}"
        );

        print!(
            "[Redundancy] Found {} multiplicative quantifiers [",
            mult_quants.len(),
        );
        for (i, (qpat, im)) in mult_quants.into_iter().enumerate() {
            if i > 0 {
                print!(", ");
            }
            print!("{} {im:.1}x", qpat.debug(&result));
        }
        println!("]");
    }
}

#[cfg(feature = "analysis")]
fn mult_quants(all: &analysis::AllAnalyses) -> Vec<(QuantPat, f64)> {
    all.redundancy
        .per_quant
        .iter_enumerated()
        .filter_map(|(qpat, data)| {
            let im = data.input_multiplicativity();
            (im > 1.).then_some((qpat, im))
        })
        .collect::<Vec<_>>()
}
