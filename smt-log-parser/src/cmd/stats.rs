use std::{collections::HashMap, path::PathBuf};

use smt_log_parser::{LogParser, Z3Parser};

pub fn run(logfile: PathBuf, top_k: Option<usize>) -> Result<(), String> {
    let path = std::path::Path::new(&logfile);
    let filename = path
        .file_name()
        .map(|f| f.to_string_lossy())
        .unwrap_or_default();

    if !path.is_file() {
        return Err(format!("path {filename} did not point to a file"));
    }

    let (_metadata, parser) = Z3Parser::from_file(path).unwrap();

    let parser = parser.process_all().map_err(|e| e.to_string())?;

    let mut instantiations_occurrances: Vec<_> = {
        let mut count_mapping = HashMap::new();

        for (name, _) in parser
            .instantiations()
            .filter_map(|(idx, inst)| parser[inst.match_].kind.quant_idx().map(|v| (idx, v)))
            .filter_map(|(idx, quant_id)| {
                parser[quant_id].kind.user_name().map(|v| (&parser[v], idx))
            })
        {
            *count_mapping.entry(name).or_insert(0) += 1;
        }
        count_mapping.into_iter().map(|(k, v)| (v, k)).collect()
    };

    instantiations_occurrances.sort_by(|l: &(i32, &str), r: &(i32, &str)| Ord::cmp(&r.0, &l.0));
    
    let iter = instantiations_occurrances.iter();
    match top_k {
        None => {
            for (count, inst) in iter {
                println!("{} = {}", inst, count);
            }
        }
        Some(k) => {
            for (count, inst) in iter.take(k) {
                println!("{} = {}", inst, count);
            }
        }
    }

    Ok(())
}
