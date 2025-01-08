use smt_log_parser::{
    analysis::{InstGraph, RedundancyAnalysis},
    display_with::{DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
    LogParser, Z3Parser,
};

fn main() -> Result<(), String> {
    let z3_exe = std::env::var("SCOPE_Z3_EXE").unwrap_or_else(|_| "z3".to_string());
    let logfile = std::env::var("SCOPE_LOGFILE");

    let tempdir;
    let logfile = match logfile {
        Ok(logfile) => std::path::PathBuf::from(logfile),
        Err(_) => {
            tempdir = tempfile::tempdir().unwrap();
            let mut tempdir = tempdir.into_path();
            tempdir.push("z3.log");
            tempdir
        }
    };

    let mut passed_args = false;
    let args = std::env::args().skip(1);
    let args = args.filter(|arg| {
        passed_args = true;
        !arg.starts_with("trace=")
            && !arg.starts_with("proof=")
            && !arg.starts_with("trace-file-name=")
    });

    let mut cmd = std::process::Command::new(z3_exe)
        .args([
            "trace=true",
            "proof=true",
            &format!("trace-file-name={}", logfile.display()),
        ])
        .args(args)
        .stdin(std::process::Stdio::inherit())
        .stdout(std::process::Stdio::inherit())
        .stderr(std::process::Stdio::inherit())
        .spawn()
        .expect("failed to execute z3");
    if !passed_args {
        eprintln!("smt-scope-z3");
        eprintln!("Runs z3 (either from path or specified by the \"SCOPE_Z3_EXE\" environment variable) and upon exit, analyses the logfile for potential issues.");
        eprintln!("The logfile is deleted unless the \"SCOPE_LOGFILE\" environment variable is set with a path for where to store it.");
        eprintln!("---");
    }
    let output = cmd.wait().expect("command wasn't running");
    if let Some(code) = output.code() {
        std::process::exit(code);
    }
    if !logfile.is_file() {
        return Ok(());
    }
    analyse(logfile)
}

fn analyse(logfile: std::path::PathBuf) -> Result<(), String> {
    let mut warnings = Vec::new();
    let mut errors = Vec::new();

    let (_metadata, parser) = Z3Parser::from_file(logfile).map_err(|e| e.to_string())?;
    let mut parser = parser.process_all().map_err(|e| e.to_string())?;

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
