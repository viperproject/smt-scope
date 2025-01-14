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
    #[cfg(feature = "analysis")]
    /// Prints out the nth dependencies of a list of instantiations
    Dependencies {
        /// The path to the smt log file
        logfile: std::path::PathBuf,

        /// Depth of dependencies to lookup
        #[arg(short, long, default_value = "0")]
        depth: Option<u32>,

        /// Whether to pretty print the output results
        #[arg(short, long, default_value_t = false)]
        pretty_print: bool,
    },
    /// Print out statistics for the SMT solver
    Stats {
        /// The path to the smt log file
        logfile: std::path::PathBuf,
        /// how many of the most instantiated axioms to print
        #[arg(short)]
        k: Option<usize>,
    },
    /// Tests the parser and analysis, printing out timing information
    Test {
        /// The paths to the smt log files
        logfiles: Vec<std::path::PathBuf>,
        /// The maximum time to spend parsing each file (in seconds)
        #[arg(short, long, default_value_t = 15.0)]
        timeout: f32,
        /// Whether to print out memory usage information
        #[arg(short, long, default_value_t = false)]
        memory: bool,
    },
    /// Try to reconstruct the `.smt2` file
    Reconstruct {
        /// The path to the smt log file
        logfile: std::path::PathBuf,
        /// Whether to print out the file without details about what happened
        /// after each line
        #[arg(short, long, default_value_t = false)]
        clean: bool,
    },
    /// Analyse the redundancy in the log file
    Redundancy {
        /// The path to the smt log file
        logfile: std::path::PathBuf,
    },
    /// Run evaluation mode which times automatic analysis
    Eval {
        /// The path to the smt log file
        logfile: std::path::PathBuf,
        /// Whether to use the dummy parser instead
        #[arg(long, default_value_t = false)]
        dummy: bool,
    },
}
