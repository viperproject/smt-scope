use std::{
    fs::DirEntry,
    io::{BufRead, Write},
    path::Path,
};

const MB: u64 = 1024_u64 * 1024_u64;

fn z3_version() -> String {
    let z3_version = std::process::Command::new("z3")
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

#[test]
fn parse_all_logs() {
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
    let parse_limit = parse_limit.to_string();
    let args = [
        format!("-memory:{mem}"),
        "-T:15".to_string(),
        "smt.random-seed=1".to_string(),
    ];

    let (mut max_parse_ovhd, mut max_analysis_ovhd) = (0.0, 0.0);

    let mut all_smt2 = Vec::new();
    visit_dirs("../smt-problems", &mut |e| {
        if e.path()
            .extension()
            .is_some_and(|e| e.to_string_lossy() == "smt2")
        {
            all_smt2.push(e);
        }
    })
    .unwrap();
    all_smt2.sort_by_key(|e| e.metadata().unwrap().len());

    std::fs::create_dir_all("../logs").unwrap();

    for smt2 in all_smt2 {
        // if log.file_name().to_string_lossy() != "insert_log_name" {
        //     continue;
        // }

        let path = smt2.path();
        println!("___ {} ___", path.display());

        // Check if to skip
        let mut first_line = String::new();
        let mut file = std::io::BufReader::new(std::fs::File::open(&path).unwrap());
        file.read_line(&mut first_line).unwrap();
        if first_line.starts_with(';') && first_line.contains(&z3_version) {
            println!("Skipping as z3 v{z3_version} matched in first line comment");
            continue;
        }

        // Setup command
        let mut cmd = assert_cmd::Command::cargo_bin("z3-scope").unwrap();
        cmd.args(&args);
        cmd.arg(std::fs::canonicalize(&path).unwrap());
        cmd.env("SCOPE_SIZE_LIMIT", &parse_limit);
        let file_stem = path.file_stem().unwrap().to_string_lossy();
        cmd.env("SCOPE_TRACE_FILE", format!("../logs/{file_stem}.log"));

        // Execute
        let out = cmd.output().unwrap();
        println!("{}", String::from_utf8(out.stderr).unwrap());
        std::io::stdout().flush().unwrap();
        let stdout = String::from_utf8(out.stdout).unwrap();
        assert!(out.status.success(), "z3-scope failed! stdout:\n{stdout}");

        // Collect overhead data
        let stdout: Vec<_> = stdout.lines().collect();
        let last = stdout.last().unwrap();
        let last = last.split_ascii_whitespace().collect::<Vec<_>>();
        assert_eq!(last.len(), 4, "{stdout:?}");
        assert_eq!(last[0], "POVHD", "{stdout:?}");
        assert_eq!(last[2], "AOVHD", "{stdout:?}");
        let parse_ovhd = last[1].parse::<f64>().unwrap();
        let analysis_ovhd = last[3].parse::<f64>().unwrap();
        max_parse_ovhd = f64::max(max_parse_ovhd, parse_ovhd);
        max_analysis_ovhd = f64::max(max_analysis_ovhd, analysis_ovhd);

        println!();
    }
    println!(
        "Max parse overhead: {max_parse_ovhd:.2}x, max analysis overhead: {max_analysis_ovhd:.2}x"
    );
}
