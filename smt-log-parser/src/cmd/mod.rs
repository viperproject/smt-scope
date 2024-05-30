mod args;
mod dependencies;
mod test;

use clap::Parser;

pub fn run() -> Result<(), String> {
    match args::Cli::parse().command {
        args::Commands::Dependencies {
            logfile,
            depth,
            pretty_print,
        } => dependencies::run(logfile, depth, pretty_print)?,
        args::Commands::Test { logfiles } => test::run(logfiles)?,
    }

    Ok(())
}
