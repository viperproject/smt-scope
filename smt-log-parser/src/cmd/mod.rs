mod args;
#[cfg(feature = "analysis")]
mod dependencies;
mod reconstruct;
mod redundancy;
mod stats;
mod test;

use clap::Parser;
use smt_log_parser::{LogParser, Z3Parser};

pub fn run() -> Result<(), String> {
    match args::Cli::parse().command {
        #[cfg(feature = "analysis")]
        args::Commands::Dependencies {
            logfile,
            depth,
            pretty_print,
        } => dependencies::run(logfile, depth, pretty_print)?,
        args::Commands::Stats { logfile, k } => stats::run(logfile, k)?,
        args::Commands::Test {
            logfiles,
            timeout,
            memory,
        } => test::run(logfiles, timeout, memory)?,
        args::Commands::Reconstruct { logfile, clean } => reconstruct::run(logfile, clean)?,
        args::Commands::Redundancy { logfile } => redundancy::run(logfile)?,
    }

    Ok(())
}

fn run_on_logfile(logfile: std::path::PathBuf) -> Result<Z3Parser, String> {
    let path = std::path::Path::new(&logfile);
    let (_metadata, parser) = Z3Parser::from_file(path).map_err(|e| e.to_string())?;
    parser.process_all().map_err(|e| e.to_string())
}
