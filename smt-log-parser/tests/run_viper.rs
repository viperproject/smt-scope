const VIPERSERVER_PATH: Option<&str> = Some("/Users/jfiala/Documents/GitHub/viper/viperserver");
const Z3_PATH: Option<&str> = Some("/Users/jfiala/Downloads/z3-z3-4.8.7/build/z3");

// const VIPERSERVER_PATH: Option<&str> = None;
// const Z3_PATH: Option<&str> = None;

const BACKEND: &str = "carbon";
const BOOGIE_PATH: &str =
    "/Users/jfiala/Downloads/ViperTools/ViperToolsMacARM/boogie/Binaries/Boogie";

/// Run with:
/// `cargo test --package smt-log-parser --test run_viper -- run_viper_on_all --exact --show-output --nocapture`
#[test]
fn run_viper_on_all() {
    let Some(viper_path) = VIPERSERVER_PATH else {
        println!("Set `VIPERSERVER_PATH` in order to regenerate the `.smt2` files from the Viper test suite.");
        return;
    };

    let mut backend_path = std::path::PathBuf::from(viper_path);
    backend_path.push(BACKEND);

    let mut jar_path = backend_path.join("target/scala-2.13");
    jar_path.push(format!("{BACKEND}.jar"));

    if !jar_path.exists() {
        println!("Running `sbt assembly` in `{BACKEND}` directory");
        // run sbt assembly in `BACKEND` directory
        let output = std::process::Command::new("sbt")
            .args(["assembly"])
            .current_dir(&backend_path)
            .output()
            .unwrap();
        assert!(output.status.success(), "`sbt assembly` failed {output:?}");
    }

    // Recursively walk all dirs in `{backend_path}/silver/src/test/resources` and find all files ending in `.vpr`:
    let mut all_files = vec![];
    let test_files_dir = backend_path.join("silver/src/test/resources");
    let mut stack = vec![test_files_dir.clone()];
    while let Some(dir) = stack.pop() {
        for entry in std::fs::read_dir(dir).unwrap() {
            let entry = entry.unwrap();
            let path = entry.path();
            if path.is_dir() {
                stack.push(path);
            } else if path.extension().is_some_and(|ext| ext == "vpr") {
                all_files.push(path);
            }
        }
    }

    // make `BACKEND` logs directory, deleting all files in it if it already exists
    let mut log_dir = std::path::PathBuf::from("../smt-problems/test-suite");
    log_dir.push(BACKEND);
    // if log_dir.exists() {
    //     std::fs::remove_dir_all(&log_dir).unwrap();
    // }
    std::fs::create_dir_all(&log_dir).unwrap();

    all_files.sort();
    for file in all_files {
        println!(
            "Running {BACKEND} on `{}`",
            file.file_name().unwrap().to_str().unwrap()
        );

        let mut logfile = log_dir.clone();
        // Extend `logfile` with all the directories in `file` after `test_files_dir`:
        for component in file
            .parent()
            .unwrap()
            .components()
            .skip(test_files_dir.components().count())
        {
            logfile.push(component.as_os_str());
        }
        let filename = file.file_stem().unwrap().to_str().unwrap();
        // Do not rerun BACKEND if the log file already exists:
        if logfile.with_file_name(format!("{filename}.smt2")).exists()
            || logfile
                .with_file_name(format!("{filename}-00.smt2"))
                .exists()
        {
            continue;
        }
        logfile.push(filename);
        std::fs::create_dir_all(&logfile).unwrap();
        logfile.push("verify");

        let mut args = vec![
            "-jar".to_owned(),
            format!(
                "{}/target/scala-2.13/{BACKEND}.jar",
                backend_path.to_str().unwrap()
            ),
            "--timeout".to_owned(),
            "30".to_owned(),
        ];
        if BACKEND == "silicon" {
            args.push("--numberOfParallelVerifiers".to_owned());
            args.push("1".to_owned());
            args.push("--proverLogFile".to_owned());
            args.push(logfile.to_str().unwrap().to_owned());
        } else {
            args.push("--proverLog".to_owned());
            args.push(logfile.to_str().unwrap().to_owned());
            args.push("--boogieExe".to_owned());
            args.push(BOOGIE_PATH.to_owned());
        }

        if let Some(z3) = Z3_PATH {
            args.push("--z3Exe".to_owned());
            args.push(z3.to_owned());
        }
        args.push(file.to_str().unwrap().to_owned());
        println!("> java {}", args.join(" "));
        let output = std::process::Command::new("java")
            .args(&args)
            .status()
            .unwrap();

        if !output.success() {
            eprintln!(
                "{BACKEND} failed on `{}`",
                file.file_name().unwrap().to_str().unwrap(),
            );
        }

        let mut logfile_dir = logfile;
        logfile_dir.pop();
        let Ok(files) = std::fs::read_dir(&logfile_dir) else {
            continue;
        };
        let mut max_size = 0;
        for file in files {
            let file = file.unwrap();
            max_size = max_size.max(file.metadata().unwrap().len());
        }
        if max_size < 1024 {
            std::fs::remove_dir_all(&logfile_dir).unwrap();
            continue;
        }

        let mut logfile_parent = logfile_dir.clone();
        let logfile_name = logfile_parent
            .file_name()
            .unwrap()
            .to_str()
            .unwrap()
            .to_owned();
        logfile_parent.pop();

        // Silicon produces two files: `verify-00.smt2` and
        // `verify-01.smt2`. The former often being a prefix of the latter. Therefore
        // delete the dir with the former and move the latter to the parent dir.

        let mut prev_file = None;
        for file in std::fs::read_dir(&logfile_dir).unwrap() {
            let file = file.unwrap();
            let file_data = std::fs::read_to_string(file.path()).unwrap();
            let Some((prev, prev_data)) = prev_file else {
                prev_file = Some((file, file_data));
                continue;
            };
            if file_data.starts_with(&prev_data) {
                std::fs::remove_file(prev.path()).unwrap();
                prev_file = Some((file, file_data));
                continue;
            }
            prev_file = Some((file, file_data));

            let filename = prev.file_name();
            let filename = filename.to_str().unwrap().strip_prefix("verify").unwrap();

            let lf = logfile_parent.join(format!("{logfile_name}{filename}.smt2"));
            std::fs::rename(prev.path(), lf).unwrap();
        }
        let (prev, _) = prev_file.unwrap();
        let filename = prev.file_name();
        let filename = filename.to_str().unwrap().strip_prefix("verify").unwrap();
        let lf = logfile_parent.join(format!("{logfile_name}{filename}.smt2"));
        std::fs::rename(prev.path(), lf).unwrap();

        std::fs::remove_dir_all(&logfile_dir).unwrap();
    }
}
