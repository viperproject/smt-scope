use cap::Cap;
use std::time::{Duration, Instant};

use mem_dbg::*;
use smt_log_parser::analysis::InstGraph;
use smt_log_parser::{LogParser, Z3Parser};

#[global_allocator]
static ALLOCATOR: Cap<std::alloc::System> = Cap::new(std::alloc::System, usize::MAX);

#[test]
fn parse_all_logs() {
    let mem = std::env::var("SLP_MEMORY_LIMIT_GB")
        .ok()
        .and_then(|mem| mem.parse().ok());
    // Default to limit of 32GiB.
    let mem = mem.unwrap_or(32) as u64 * 1024 * 1024 * 1024;
    // Parse files only up to 1/5 of the memory limit, since the parser
    // data-structure is 2-3x larger than the file size, and we need to leave
    // space for analysis and some left-over allocated memory from a prior loop.
    const PARSER_OVERHEAD: u64 = 3;
    const ANALYSIS_OVERHEAD: u64 = 10;
    let parse_limit = mem / (PARSER_OVERHEAD + ANALYSIS_OVERHEAD + 1);
    let (mut max_parse_ovhd, mut max_analysis_ovhd) = (0.0, 0.0);

    let mut all_logs: Vec<_> = std::fs::read_dir("../logs")
        .unwrap()
        .map(|r| r.unwrap())
        .collect();
    all_logs.sort_by_key(|dir| dir.path());
    for log in all_logs {
        // Put things in a thread to isolate memory usage more than the default.
        let t = std::thread::spawn(move || {
            // Some memory usage is still left over from previous loop iterations, so we'll need to subtract that.
            let start_alloc = ALLOCATOR.allocated() as u64;

            let filename = log.path();
            let (metadata, mut parser) = Z3Parser::from_file(&filename).unwrap();
            let file_size = metadata.len();
            let parse_bytes = file_size.min(parse_limit);
            let mb = 1024_u64 * 1024_u64;
            let file_info = (file_size != parse_bytes)
                .then(|| format!(" / {} MB", file_size / mb))
                .unwrap_or_default();

            // Gives 100 millis per MB (or 100 secs per GB)
            let timeout = Duration::from_millis(parse_bytes / (10 * 1024) + 500);
            // Limit memory usage to `PARSER_OVERHEAD`x the parse amount + 64MiB. Reduce this if
            // we optimise memory usage more.
            let fixed_overhead = 64 * mb;
            let mem_limit = start_alloc + parse_bytes * PARSER_OVERHEAD + fixed_overhead;
            assert!(mem_limit <= mem, "{start_alloc} + {parse_bytes}/{parse_limit} * {PARSER_OVERHEAD} + {fixed_overhead} > {mem}");
            ALLOCATOR.set_limit(mem_limit as usize).unwrap();
            println!(
                "Parsing {} ({} MB{file_info}). MemC {} MB, MemL {} MB ({} MB), TimeL {timeout:?}.",
                filename.display(),
                parse_bytes / mb,
                start_alloc / mb,
                (mem_limit - start_alloc) / mb,
                mem_limit / mb,
            );
            let now = Instant::now();

            parser.process_check_every(Duration::from_millis(100), |_, s| {
                assert!(now.elapsed() < timeout, "Parsing took longer than timeout");
                (parse_limit <= s.bytes_read as u64).then_some(())
            });
            let elapsed = now.elapsed();
            let mut parser = parser.take_parser();

            max_parse_ovhd = f64::max(
                max_parse_ovhd,
                (ALLOCATOR.allocated() as u64 - start_alloc) as f64 / parse_bytes as f64,
            );
            let parse_bytes_kb = parse_bytes / 1024;
            let mem_size = parser.mem_size(SizeFlags::default());
            println!(
                "Finished parsing in {elapsed:?} ({} kB/ms). Memory use {} MB / {} MB (real {} MB):",
                parse_bytes_kb / elapsed.as_millis() as u64,
                ALLOCATOR.allocated() / mb as usize,
                ALLOCATOR.limit() / mb as usize,
                mem_size / mb as usize,
            );
            parser.mem_dbg(DbgFlags::default()).ok();
            // TODO: decrease this
            assert!(
                mem_size as u64 <= parse_bytes * 3 / 2,
                "Parser takes up more memory than 3/2 * file size!"
            );

            let middle_alloc = ALLOCATOR.allocated() as u64;
            // Limit memory usage to `ANALYSIS_OVERHEAD`x the parse amount + 64MiB. Reduce this if
            // we optimise memory usage more.
            let mem_limit = middle_alloc + parse_bytes * ANALYSIS_OVERHEAD + fixed_overhead;
            println!(
                "Running analysis. MemC {} MB, MemL {} MB ({} MB)",
                middle_alloc / mb,
                (mem_limit - middle_alloc) / mb,
                mem_limit / mb,
            );
            ALLOCATOR.set_limit(mem_limit as usize).unwrap();

            let now = Instant::now();
            let mut inst_graph = InstGraph::new(&parser).unwrap();
            let elapsed_ig = now.elapsed();
            assert!(
                elapsed_ig < timeout,
                "Constructing inst graph took longer than timeout"
            );

            let now = Instant::now();
            inst_graph.search_matching_loops(&mut parser);
            let elapsed_ml = now.elapsed();
            let elapsed = elapsed_ig + elapsed_ml;

            max_analysis_ovhd = f64::max(
                max_analysis_ovhd,
                (ALLOCATOR.allocated() as u64 - middle_alloc) as f64 / parse_bytes as f64,
            );
            let mem_size = inst_graph.mem_size(SizeFlags::default());
            let (sure_mls, maybe_mls) = inst_graph.found_matching_loops().unwrap();
            println!(
                "Finished analysis in {elapsed:?} ({} kB/ms). {} nodes, {sure_mls}+{maybe_mls} mls. Memory use {} MB / {} MB:",
                (parse_bytes_kb as u128 * 1000) / elapsed.as_micros(),
                inst_graph.raw.graph.node_count(),
                ALLOCATOR.allocated() / mb as usize,
                ALLOCATOR.limit() / mb as usize,
            );
            inst_graph.mem_dbg(DbgFlags::default()).ok();
            println!();
            println!("===");

            // TODO: decrease this
            assert!(elapsed_ml < timeout, "ML search took longer than timeout");
            assert!(
                mem_size as u64 <= parse_bytes * 3,
                "Analysis takes up more memory than 3 * file size!"
            );

            drop(inst_graph);
            drop(parser);
            (max_parse_ovhd, max_analysis_ovhd)
        });
        let (p, a) = t.join().unwrap();
        max_parse_ovhd = p;
        max_analysis_ovhd = a;
    }
    println!(
        "Max parse overhead: {max_parse_ovhd:.2}x, max analysis overhead: {max_analysis_ovhd:.2}x"
    );
}
