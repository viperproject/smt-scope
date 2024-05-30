/// Parse Z3 SMT logs and perform the selected analysis
#[derive(clap::Parser)]
#[command(version, about, long_about = None)]
#[command(propagate_version = true)]
pub struct Cli {
    #[command(subcommand)]
    pub command: Commands,
}

#[derive(clap::Subcommand)]
pub enum Commands {
    /// Prints out the nth dependencies of a list of instantiations
    Dependencies {
        /// The path to the smt log file
        logfile: std::path::PathBuf,

        /// Depth of dependencies to lookup
        #[arg(short, long, default_value_t = 1)]
        depth: u32,

        /// Whether to pretty print the output results
        #[arg(short, long, default_value_t = false)]
        pretty_print: bool,
    },
    /// Tests the parser and analyses and prints out timing information
    Test {
        /// The paths to the smt log files
        logfiles: Vec<std::path::PathBuf>,
    },
}
