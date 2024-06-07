mod args;
#[cfg(feature = "analysis")]
mod dependencies;
mod stats;
mod test;

use clap::Parser;

pub fn run() -> Result<(), String> {
    match args::Cli::parse().command {
        #[cfg(feature = "analysis")]
        args::Commands::Dependencies {
            logfile,
            depth,
            pretty_print,
        } => dependencies::run(logfile, depth, pretty_print)?,
        #[cfg(feature = "analysis")]
        args::Commands::Stats { logfile, k } => stats::run(logfile, k)?,
        args::Commands::Test { logfiles } => test::run(logfiles)?,
    }

    Ok(())
}
