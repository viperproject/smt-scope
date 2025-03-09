#[cfg(all(debug_assertions, feature = "mem_dbg"))]
mod test;

use std::path::PathBuf;

use serde::{Deserialize, Serialize};
use smt_scope::{
    analysis::{InstGraph, ProblemBehaviour, ProblemBehaviours, RedundancyAnalysis},
    display_with::{DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
    LogParser, Z3Parser,
};

fn var(name: &str) -> Result<Option<String>, String> {
    match std::env::var(name) {
        Ok(val) => Ok(Some(val)),
        Err(std::env::VarError::NotPresent) => Ok(None),
        Err(e) => Err(e.to_string()),
    }
}

fn var_parsed<T: core::str::FromStr>(name: &str) -> Result<Option<T>, String>
where
    T::Err: core::fmt::Display,
{
    match var(name)? {
        Some(val) => val.parse::<T>().map(Some).map_err(|e| e.to_string()),
        None => Ok(None),
    }
}

fn is_help(arg: &str) -> bool {
    if arg.len() < 2 {
        return false;
    }
    if arg.as_bytes()[0] != b'-' {
        #[cfg(target_os = "windows")]
        if arg.as_bytes()[0] != b'/' {
            return false;
        }
        #[cfg(not(target_os = "windows"))]
        return false;
    }
    let arg = if arg.as_bytes()[1] == b'-' {
        &arg[2..]
    } else {
        &arg[1..]
    };
    arg == "help" || arg == "h" || arg == "?"
}

fn main() -> Result<(), String> {
    let code = run()?;
    if cfg!(debug_assertions) {
        Ok(())
    } else {
        std::process::exit(code)
    }
}

fn run() -> Result<i32, String> {
    let z3_exe = var("SCOPE_Z3_EXE")?.unwrap_or_else(|| "z3".to_string());
    let tracefile = var("SCOPE_TRACE_FILE")?;
    let dumpfile = var("SCOPE_DUMP_FILE")?.map(PathBuf::from);

    let tempdir;
    let tracefile = match tracefile {
        Some(tracefile) => PathBuf::from(tracefile),
        None => {
            tempdir = tempfile::tempdir().unwrap();
            let mut tempdir = tempdir.into_path();
            tempdir.push("z3.log");
            tempdir
        }
    };

    let mut passed_args = false;
    let mut passed_help = false;
    let args = std::env::args().skip(1);
    let args = args.filter(|arg| {
        passed_args = true;
        passed_help = passed_help || is_help(arg);
        !arg.starts_with("trace=")
            && !arg.starts_with("proof=")
            && !arg.starts_with("trace-file-name=")
    });

    let mut cmd = std::process::Command::new(z3_exe)
        .args([
            "trace=true",
            "proof=true",
            &format!("trace-file-name={}", tracefile.display()),
        ])
        .args(args)
        .stdin(std::process::Stdio::inherit())
        .stdout(std::process::Stdio::inherit())
        .stderr(std::process::Stdio::inherit())
        .spawn()
        .expect("failed to execute z3");
    let output = cmd.wait().expect("command wasn't running");
    if !passed_args || passed_help {
        eprintln!("---");
        eprintln!("z3-scope [z3_args]");
        eprintln!("Runs z3 and then analyses the execution trace for potential issues. All arguments are passed through to z3, thus we use environment variables for configuration instead. Many tools allow one to configure which z3 executable to use (e.g. by setting the \"Z3_EXE\" env var), simply point them to this executable instead to detect issues with your z3 queries.");
        eprintln!();
        eprintln!("Execution:");
        eprintln!("  SCOPE_Z3_EXE: the path to the z3 executable to use (default is \"z3\").");
        eprintln!("  SCOPE_TRACE_FILE: the path to store the z3 trace file (by default a temporary file is used).");
        eprintln!("  SCOPE_DUMP_FILE: the path to dump json-formatted analysis results (useful when the regular stderr route is not possible).");
        eprintln!();
        eprintln!("Analysis:");
        eprintln!("  SCOPE_SIZE_LIMIT: the maximum number of bytes of the trace to analyse (default is unlimited).");
        eprintln!("  SCOPE_LINE_LIMIT: the maximum number of lines of the trace to analyse (default is unlimited).");
        eprintln!();
        eprintln!("Issues:");
        eprintln!("  SCOPE_NO_ERROR: if set, the program will not exit with an error code if issues are found.");
    }
    let code = output.code().unwrap_or(128);
    if tracefile.is_file() {
        analyse(tracefile, dumpfile)?;
    } else {
        eprintln!("z3-scope: no trace file found");
    }
    Ok(code)
}

fn analyse(tracefile: PathBuf, dumpfile: Option<PathBuf>) -> Result<(), String> {
    // Setup
    let byte_limit = var_parsed::<usize>("SCOPE_SIZE_LIMIT")?;
    let line_limit = var_parsed::<usize>("SCOPE_LINE_LIMIT")?;
    let (_metadata, parser) = Z3Parser::from_file(tracefile).map_err(|e| e.to_string())?;

    // Parsing
    #[cfg(all(debug_assertions, feature = "mem_dbg"))]
    let data = test::pre_parse(_metadata, byte_limit);
    let (state, mut parser) = parser.process_all_limit(byte_limit, line_limit);
    if let Some(e) = state.error() {
        return Err(e.to_string());
    }
    #[cfg(all(debug_assertions, feature = "mem_dbg"))]
    let data = test::post_parse(&parser, data);

    // Analysis
    #[cfg(all(debug_assertions, feature = "mem_dbg"))]
    if cfg!(debug_assertions) {
        return test::analysis(parser, data);
    }

    let mut dumpfile = DumpData::new(dumpfile);

    let term_display = &mut None;
    fn ctxt<'a>(
        parser: &'a Z3Parser,
        term_display: &'a mut Option<TermDisplayContext>,
    ) -> DisplayCtxt<'a> {
        let term_display = term_display.get_or_insert_with(TermDisplayContext::basic);
        DisplayCtxt {
            parser,
            term_display,
            config: Default::default(),
        }
    }

    let redundancy = RedundancyAnalysis::new(&parser);
    let mut graph = InstGraph::new_lite(&parser).map_err(|e| format!("{e:?}"))?;
    let mls = graph.search_matching_loops(&mut parser);
    let pbs = ProblemBehaviours::find(mls, &redundancy);

    let ctxt = ctxt(&parser, term_display);
    let print_problem_behaviour = |pb: &ProblemBehaviour, data: Option<&mut Vec<Data>>| {
        let kind = pb.kind_str();
        let mut data = DumpData::add_data(data, kind.to_string());
        eprint!("{kind} ({}) [", pb.detail());
        let qpats = pb.quant_pats(&parser, &graph);
        let mut qpats = qpats.into_iter().map(|idx| idx.with(&ctxt));
        if let Some(qpat) = qpats.next() {
            let qpat = qpat.to_string();
            eprint!("{qpat}");
            DumpData::add_quant(data.as_deref_mut(), qpat);
            for qpat in qpats {
                let qpat = qpat.to_string();
                eprint!(", {qpat}");
                DumpData::add_quant(data.as_deref_mut(), qpat);
            }
        }
        eprint!("]");
    };

    for warning in &pbs.warnings {
        eprint!("z3-scope warning: potential ");
        print_problem_behaviour(warning, dumpfile.warning());
        eprintln!();
    }
    for error in &pbs.errors {
        eprintln!("z3-scope error: ");
        print_problem_behaviour(error, dumpfile.error());
        eprintln!();
    }
    dumpfile.dump();

    if pbs.errors.is_empty() {
        Ok(())
    } else {
        Err("errors found".to_string())
    }
}

struct DumpData {
    reports: Vec<Report>,
    path: Option<PathBuf>,
}

#[derive(Default, Serialize, Deserialize)]
struct Report {
    warnings: Vec<Data>,
    errors: Vec<Data>,
}

#[derive(Serialize, Deserialize)]
struct Data {
    kind: String,
    quants: Vec<String>,
}

impl DumpData {
    fn new(path: Option<PathBuf>) -> Self {
        let file = path.as_ref().and_then(|p| std::fs::File::open(p).ok());
        let mut reports: Vec<_> = file
            .and_then(|f| serde_json::from_reader(f).ok())
            .unwrap_or_default();
        if path.is_some() {
            reports.push(Report::default());
        }
        DumpData { path, reports }
    }
    fn dump(self) {
        let Some(path) = self.path else {
            return;
        };
        if let Some(dir) = path.parent() {
            std::fs::create_dir_all(dir).ok();
        }
        let Ok(file) = std::fs::File::create(path) else {
            return;
        };
        serde_json::to_writer(file, &self.reports).ok();
    }

    fn warning(&mut self) -> Option<&mut Vec<Data>> {
        Some(&mut self.reports.last_mut()?.warnings)
    }

    fn error(&mut self) -> Option<&mut Vec<Data>> {
        Some(&mut self.reports.last_mut()?.errors)
    }

    fn add_data(data: Option<&mut Vec<Data>>, kind: String) -> Option<&mut Vec<String>> {
        let data = data?;
        let quants = Vec::new();
        data.push(Data { kind, quants });
        Some(&mut data.last_mut().unwrap().quants)
    }

    fn add_quant(data: Option<&mut Vec<String>>, quant: String) {
        let Some(data) = data else {
            return;
        };
        data.push(quant);
    }
}
