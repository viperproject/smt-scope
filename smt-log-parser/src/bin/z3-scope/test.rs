use std::time::{Duration, Instant};

use mem_dbg::{DbgFlags, MemDbg, MemSize, SizeFlags};
use smt_log_parser::{analysis, Z3Parser};

#[global_allocator]
static ALLOCATOR: cap::Cap<std::alloc::System> = cap::Cap::new(std::alloc::System, usize::MAX);

const MB: u64 = 1024_u64 * 1024_u64;

const FIXED_OVERHEAD: u64 = 64 * MB;

const PARSER_OVERHEAD: u64 = 3;
const ANALYSIS_OVERHEAD: u64 = 6;

type ParseData = (u64, Instant);
type AnalysisData = (u64, Duration, f64);

pub(super) fn pre_parse(metadata: std::fs::Metadata, byte_limit: Option<usize>) -> ParseData {
    let start_alloc = ALLOCATOR.allocated() as u64;

    let file_size = metadata.len();
    let parse_bytes = byte_limit
        .map(|l| file_size.min(l as u64))
        .unwrap_or(file_size);

    // Limit memory usage to `PARSER_OVERHEAD`x the parse amount + 64MiB. Reduce this if
    // we optimise memory usage more.
    let mem_limit = start_alloc + parse_bytes * PARSER_OVERHEAD + FIXED_OVERHEAD;

    ALLOCATOR.set_limit(mem_limit as usize).unwrap();
    let out_of = (parse_bytes != file_size).then(|| format!(" / {} MB", file_size / MB));
    eprintln!(
        "Parsing {} MB{}. MemC {} MB, MemL {} MB ({} MB).",
        parse_bytes / MB,
        out_of.unwrap_or_default(),
        start_alloc / MB,
        (mem_limit - start_alloc) / MB,
        mem_limit / MB,
    );

    (parse_bytes, Instant::now())
}

pub(super) fn post_parse(parser: &Z3Parser, (parse_bytes, time): ParseData) -> AnalysisData {
    let elapsed = time.elapsed();

    // Gives 100 millis per MB (or 100 secs per GB)
    let timeout = Duration::from_millis(parse_bytes / (10 * 1024) + 500);
    assert!(
        elapsed < timeout,
        "Parsing took {elapsed:?}, timeout of {timeout:?}"
    );

    let parse_bytes_ovhd = parse_bytes + 8 * MB;
    let mem_size = parser.mem_size(SizeFlags::default());
    let actual_ovhd = mem_size as f64 / parse_bytes_ovhd as f64;
    eprintln!(
        "Finished parsing in {elapsed:?} ({} kB/ms){}. Memory use {} MB / {} MB (real {} MB):",
        1000 * parse_bytes as u128 / 1024 / elapsed.as_micros(),
        parser.errors(),
        ALLOCATOR.allocated() / MB as usize,
        ALLOCATOR.limit() / MB as usize,
        mem_size / MB as usize,
    );
    mem_dbg(parser, DbgFlags::default()).ok();
    // TODO: decrease this
    assert!(
        mem_size as u64 <= parse_bytes_ovhd * PARSER_OVERHEAD,
        "Parser takes up more memory than {PARSER_OVERHEAD} * file size!"
    );

    (parse_bytes, timeout, actual_ovhd)
}

pub(super) fn analysis(
    mut parser: Z3Parser,
    (parse_bytes, timeout, parse_ovhd): AnalysisData,
) -> Result<(), String> {
    let middle_alloc = ALLOCATOR.allocated() as u64;
    // Limit memory usage to `ANALYSIS_OVERHEAD`x the parse amount + 64MiB. Reduce this if
    // we optimise memory usage more.
    let mem_limit = middle_alloc + parse_bytes * ANALYSIS_OVERHEAD + FIXED_OVERHEAD;

    ALLOCATOR.set_limit(mem_limit as usize).unwrap();
    eprintln!(
        "Running analysis. MemC {} MB, MemL {} MB ({} MB)",
        middle_alloc / MB,
        (mem_limit - middle_alloc) / MB,
        mem_limit / MB,
    );

    let now = Instant::now();
    let mut inst_graph = analysis::run_all(&parser).inst_graph;
    let elapsed_ig = now.elapsed();
    assert!(
        elapsed_ig < timeout,
        "Constructing inst graph took longer than timeout"
    );

    let now = Instant::now();
    inst_graph.search_matching_loops(&mut parser);
    let elapsed_ml = now.elapsed();
    let elapsed = elapsed_ig + elapsed_ml;

    let parse_bytes_ovhd = parse_bytes + 8 * MB;
    let mem_size = inst_graph.mem_size(SizeFlags::default());
    let (sure_mls, maybe_mls) = inst_graph.found_matching_loops().unwrap();
    eprintln!(
        "Finished analysis in {elapsed:?} ({} kB/ms). {} nodes, {sure_mls}+{maybe_mls} mls. Memory use {} MB / {} MB (real {} MB):",
        1000 * parse_bytes as u128 / 1024 / elapsed.as_micros(),
        inst_graph.raw.graph.node_count(),
        ALLOCATOR.allocated() / MB as usize,
        ALLOCATOR.limit() / MB as usize,
        mem_size / MB as usize,
    );
    mem_dbg(&inst_graph, DbgFlags::default()).ok();

    // TODO: decrease this
    assert!(elapsed_ml < timeout, "ML search took longer than timeout");
    assert!(
        mem_size as u64 <= parse_bytes_ovhd * ANALYSIS_OVERHEAD,
        "Analysis takes up more memory than {ANALYSIS_OVERHEAD} * file size!"
    );

    let actual_analysis_ovhd = mem_size as f64 / parse_bytes_ovhd as f64;
    println!("POVHD {parse_ovhd} AOVHD {actual_analysis_ovhd}");

    Ok(())
}

fn mem_dbg(d: &impl MemDbg, flags: DbgFlags) -> Result<(), std::fmt::Error> {
    struct Wrapper(std::io::Stderr);
    impl core::fmt::Write for Wrapper {
        #[inline(always)]
        fn write_str(&mut self, s: &str) -> core::fmt::Result {
            use std::io::Write;
            self.0
                .lock()
                .write(s.as_bytes())
                .map_err(|_| core::fmt::Error)
                .map(|_| ())
        }
    }
    d._mem_dbg_depth_on(
        &mut Wrapper(std::io::stderr()),
        MemSize::mem_size(d, flags.to_size_flags()),
        usize::MAX,
        &mut String::new(),
        Some("⏺"),
        true,
        std::mem::size_of_val(d),
        flags,
    )
}
