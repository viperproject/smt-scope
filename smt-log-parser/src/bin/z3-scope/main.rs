#[cfg(debug_assertions)]
mod test;

use smt_log_parser::{
    analysis::{InstGraph, RedundancyAnalysis},
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
    let z3_exe = var("SCOPE_Z3_EXE")?.unwrap_or_else(|| "z3".to_string());
    let tracefile = var("SCOPE_TRACE_FILE")?;

    let tempdir;
    let tracefile = match tracefile {
        Some(tracefile) => std::path::PathBuf::from(tracefile),
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
        analyse(tracefile)?;
    } else if cfg!(debug_assertions) {
        return Err("no trace file found".to_string());
    }
    if cfg!(debug_assertions) {
        Ok(())
    } else {
        std::process::exit(code)
    }
}

fn analyse(tracefile: std::path::PathBuf) -> Result<(), String> {
    // Setup
    let byte_limit = var_parsed::<usize>("SCOPE_SIZE_LIMIT")?;
    let line_limit = var_parsed::<usize>("SCOPE_LINE_LIMIT")?;
    let (_metadata, parser) = Z3Parser::from_file(tracefile).map_err(|e| e.to_string())?;

    // Parsing
    #[cfg(debug_assertions)]
    let data = test::pre_parse(_metadata, byte_limit);
    let (state, mut parser) = parser.process_all_limit(byte_limit, line_limit);
    if let Some(e) = state.error() {
        return Err(e.to_string());
    }
    #[cfg(debug_assertions)]
    let data = test::post_parse(&parser, data);

    // Analysis
    #[cfg(debug_assertions)]
    if cfg!(debug_assertions) {
        return test::analysis(parser, data);
    }

    let mut warnings = Vec::new();
    let mut errors = Vec::new();

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

    let mut graph = InstGraph::new_lite(&parser).map_err(|e| format!("{e:?}"))?;
    let mls = graph.search_matching_loops(&mut parser);
    if mls.maybe_mls > 0 {
        let warning = mls
            .matching_loops
            .iter()
            .filter(|ml| ml.graph.is_none())
            .map(|ml| mls.signatures[ml.sig].qpat);
        let ctxt = ctxt(&parser, term_display);
        let warning = warning
            .map(|idx| idx.with(&ctxt).to_string())
            .collect::<Vec<_>>();
        warnings.push(format!(
            "{} suspicious long repeating chains {warning:?}",
            mls.maybe_mls
        ));
    }
    if mls.sure_mls > 0 {
        let error = mls
            .matching_loops
            .iter()
            .filter(|ml| ml.graph.is_some())
            .map(|ml| mls.signatures[ml.sig].qpat);
        let ctxt = ctxt(&parser, term_display);
        let error = error
            .map(|idx| idx.with(&ctxt).to_string())
            .collect::<Vec<_>>();
        errors.push(format!("{} matching loops {error:?}", mls.sure_mls));
    }

    let redundancy = RedundancyAnalysis::new(&parser);
    let excess = redundancy
        .per_quant
        .iter_enumerated()
        .filter(|(_, data)| data.input_multiplicativity() > 1.0);
    let (error, warning) =
        excess.partition::<Vec<_>, _>(|(_, data)| data.input_multiplicativity() >= 2.0);
    if !warning.is_empty() {
        let ctxt = ctxt(&parser, term_display);
        let warning = warning
            .into_iter()
            .map(|(idx, _)| idx.with(&ctxt).to_string())
            .collect::<Vec<_>>();
        warnings.push(format!(
            "{} quantifiers with multiplicativity 1.0-2.0 {warning:?}",
            warning.len()
        ));
    }
    if !error.is_empty() {
        let ctxt = ctxt(&parser, term_display);
        let error = error
            .into_iter()
            .map(|(idx, _)| idx.with(&ctxt).to_string())
            .collect::<Vec<_>>();
        errors.push(format!(
            "{} quantifiers with multiplicativity >= 2.0 {error:?}",
            error.len()
        ));
    }

    for warning in &warnings {
        eprintln!("warning: {warning}");
    }
    for error in &errors {
        eprintln!("error: {error}");
    }

    if errors.is_empty() {
        Ok(())
    } else {
        Err("errors found".to_string())
    }
}
