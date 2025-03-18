use std::{
    fs::DirEntry,
    io::{BufRead, Write},
    path::Path,
};

const MB: u64 = 1024_u64 * 1024_u64;

pub fn z3_version() -> String {
    let z3_exe = std::env::var("SCOPE_Z3_EXE").unwrap_or_else(|_| "z3".to_string());
    let z3_version = std::process::Command::new(z3_exe)
        .arg("--version")
        .output()
        .expect("Failed to run `z3 --version`");
    assert!(z3_version.status.success(), "Failed to run `z3 --version`");

    let z3_version = String::from_utf8(z3_version.stdout).unwrap();
    let Some(z3_version) = z3_version.strip_prefix("Z3 version ") else {
        panic!("Failed to parse `z3 --version` output: {z3_version}");
    };
    let Some(z3_version) = z3_version.split_ascii_whitespace().next() else {
        panic!("Failed to parse `z3 --version` output: {z3_version}");
    };
    assert!(
        z3_version.split('.').count() == 3,
        "Failed to parse `z3 --version` output: {z3_version}"
    );
    assert!(
        z3_version
            .split('.')
            .all(|s| s.chars().all(|c| c.is_ascii_digit())),
        "Failed to parse `z3 --version` output: {z3_version}"
    );
    z3_version.to_string()
}

fn visit_dirs<P: AsRef<Path>>(dir: P, cb: &mut impl FnMut(DirEntry)) -> std::io::Result<()> {
    for entry in std::fs::read_dir(dir)? {
        let entry = entry?;
        let path = entry.path();
        if path.is_dir() {
            visit_dirs(path, cb)?;
        } else {
            cb(entry);
        }
    }
    Ok(())
}

#[derive(Debug, Clone, Copy)]
pub struct ParseConfig<'a> {
    pub z3_version: &'a str,
    pub args: &'a [String],
    pub parse_limit: u64,
    pub save_logs: bool,
    pub expect_simple_smt2: bool,
}

#[deny(unused_must_use)]
pub fn parse_one_log<P: AsRef<Path>>(
    path: P,
    config: ParseConfig<'_>,
    max_parse_ovhd: &mut f64,
    max_analysis_ovhd: &mut f64,
) -> Result<(), ()> {
    let path = path.as_ref();
    println!("___ {} ___", path.display());

    // Check if to skip
    let mut first_line = String::new();
    let mut file = std::io::BufReader::new(std::fs::File::open(&path).unwrap());
    file.read_line(&mut first_line).unwrap();
    if first_line.starts_with(';') && first_line.contains(&config.z3_version) {
        println!(
            "Skipping as z3 v{} matched in first line comment",
            config.z3_version
        );
        return Ok(());
    }

    // Setup command
    let mut cmd = assert_cmd::Command::cargo_bin("z3-scope").unwrap();
    cmd.args(config.args);
    cmd.arg(std::fs::canonicalize(&path).unwrap());
    cmd.env("SCOPE_SIZE_LIMIT", config.parse_limit.to_string());

    let file_stem = path.file_stem().unwrap().to_string_lossy();
    let logfile = format!("../logs/{file_stem}.log");
    cmd.env("SCOPE_TRACE_FILE", &logfile);

    // Execute
    let out = cmd.output().unwrap();
    let stderr = String::from_utf8(out.stderr).unwrap();
    println!("{stderr}");
    std::io::stdout().flush().unwrap();
    let stdout = String::from_utf8(out.stdout).unwrap();
    // assert!(out.status.success(), "z3-scope failed! stdout:\n{stdout}");
    if !out.status.success() {
        eprintln!("z3-scope failed! stdout:\n{stdout}");
        return Err(());
    }

    // Collect overhead data
    let stdout: Vec<_> = stdout.lines().collect();
    let last = stdout.last().unwrap();
    let last = last.split_ascii_whitespace().collect::<Vec<_>>();
    match last.as_slice() {
        [other @ .., "POVHD", parse_ovhd, "AOVHD", analysis_ovhd] => {
            if config.expect_simple_smt2 {
                assert_eq!(other.len(), 0, "{stdout:?}");
            }
            let parse_ovhd = parse_ovhd.parse::<f64>().unwrap();
            let analysis_ovhd = analysis_ovhd.parse::<f64>().unwrap();
            *max_parse_ovhd = f64::max(*max_parse_ovhd, parse_ovhd);
            *max_analysis_ovhd = f64::max(*max_analysis_ovhd, analysis_ovhd);
            if !config.save_logs {
                std::fs::remove_file(logfile).unwrap();
            }
        }
        _ if !config.expect_simple_smt2 && stderr.ends_with("z3-scope: no trace file found\n") => {
            assert!(
                !Path::new(&logfile).is_file(),
                "Log file was created!\n{stdout:?}\n{stderr:?}"
            );
        }
        _ => panic!("Unexpected output: {stdout:?}\nstderr: {stderr:?}"),
    }

    println!();
    Ok(())
}

#[deny(unused_must_use)]
pub fn parse_logs_in<P: AsRef<Path>>(
    dir: P,
    save_logs: bool,
    expect_simple_smt2: bool,
    z3_timeout: u8,
) -> Result<(), usize> {
    let z3_version = z3_version();
    let mem = std::env::var("SLP_MEMORY_LIMIT_GB")
        .ok()
        .and_then(|mem| mem.parse().ok());
    // Default to limit of 32GiB.
    let mem = mem.unwrap_or(32) as u64 * 1024;
    // Parse files only up to 1/6 of the memory limit, since the parser
    // data-structure is 2-3x larger than the file size, and we need to leave
    // space for analysis and some left-over allocated memory from a prior loop.
    const PARSER_OVERHEAD: u64 = 3;
    const ANALYSIS_OVERHEAD: u64 = 8;
    let parse_limit = mem * MB / (PARSER_OVERHEAD + ANALYSIS_OVERHEAD + 1);
    let args = [
        format!("-memory:{mem}"),
        format!("-T:{z3_timeout}"),
        "smt.random-seed=1".to_string(),
    ];

    let (mut max_parse_ovhd, mut max_analysis_ovhd) = (0.0, 0.0);

    let mut all_smt2 = Vec::new();
    visit_dirs(dir, &mut |e| {
        if e.path()
            .extension()
            .is_some_and(|e| e.to_string_lossy() == "smt2")
        {
            all_smt2.push(e);
        }
    })
    .unwrap();
    if expect_simple_smt2 {
        all_smt2.sort_by_key(|e| e.metadata().unwrap().len());
    } else {
        all_smt2.sort_by_key(|e| e.path());
    }

    std::fs::create_dir_all("../logs").unwrap();

    let config = ParseConfig {
        z3_version: &z3_version,
        args: &args,
        parse_limit,
        save_logs,
        expect_simple_smt2,
    };
    let mut errors = 0;
    for smt2 in all_smt2 {
        // if smt2.file_name().to_string_lossy() != "insert_log_name" {
        //     continue;
        // }
        let err = parse_one_log(
            smt2.path(),
            config,
            &mut max_parse_ovhd,
            &mut max_analysis_ovhd,
        );
        errors += err.is_err() as usize;
    }
    println!(
        "Max parse overhead: {max_parse_ovhd:.2}x, max analysis overhead: {max_analysis_ovhd:.2}x"
    );
    (errors == 0).then_some(()).ok_or(errors)
}
