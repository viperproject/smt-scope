use std::time::{Duration, Instant};

use smt_log_parser::{LogParser, Z3Parser};

#[test]
fn parse_all_logs() {
    std::env::set_var("SLP_TEST_MODE", "true");

    let all_logs = std::fs::read_dir("../logs").unwrap();
    for log in all_logs {
        // Put things in a thread to isolate memory usage more than the default.
        let t = std::thread::spawn(move || {
            let filename = log.unwrap().path();
            let (metadata, mut parser) = Z3Parser::from_file(&filename).unwrap();
            let file_size = metadata.len();

            // Gives 50 millis per MB (or 50 secs per GB)
            let timeout = Duration::from_millis(500 + (file_size / 20_000));
            println!(
                "Parsing {} ({} MB) with timeout of {timeout:?}",
                filename.display(),
                file_size / 1024 / 1024
            );
            // Some memory usage is still left over from previous loop iterations, so we'll need to subtract that.
            let start_mem = memory_stats::memory_stats().unwrap().physical_mem as u64;
            // TODO: optimize memory usage and reduce `max_mem`.
            let max_mem = start_mem + file_size + file_size / 4 + 128 * 1024 * 1024;
            let now = Instant::now();

            parser.process_check_every(Duration::from_millis(100), |_, _| {
                assert!(now.elapsed() < timeout, "Parsing took longer than timeout");
                let physical_mem = memory_stats::memory_stats().unwrap().physical_mem as u64;
                assert!(
                    physical_mem < max_mem,
                    "Memory usage was {} MB, but file size was {} MB (max mem {} MB)",
                    physical_mem / 1024 / 1024,
                    file_size / 1024 / 1024,
                    max_mem / 1024 / 1024
                );
                true
            });
            drop(parser);
        });
        t.join().unwrap();
    }
}
