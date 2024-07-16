use std::{
    collections::{HashMap, HashSet},
    path::PathBuf,
};

use smt_log_parser::{
    display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt, SymbolReplacement},
    formatter::TermDisplayContext,
    items::BlameKind,
    LogParser, Z3Parser,
};

pub fn run(logfile: PathBuf) -> Result<(), String> {
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

    let term_display_ctxt = TermDisplayContext::basic();

    let display_config = DisplayConfiguration {
        display_term_ids: false,
        display_quantifier_name: false,
        replace_symbols: SymbolReplacement::None,
        html: false,
        enode_char_limit: None,
        ast_depth_limit: None,
    };

    let display_ctxt = DisplayCtxt {
        parser: &parser,
        term_display: &term_display_ctxt,
        config: display_config,
    };

    let mut quant_to_terms: HashMap<String, HashSet<String>> = HashMap::new();
    // keeps count of duplicates
    let mut quant_duplicates: HashMap<String, u64> = HashMap::new();

    for (name, mut blamed) in parser
        .instantiations()
        .filter_map(|(_, inst)| parser[inst.match_].kind.quant_idx().map(|v| (v, inst)))
        .filter_map(|(quant_id, inst)| {
            parser[quant_id]
                .kind
                .user_name()
                .map(|v| (&parser[v], inst))
        })
        .filter_map(|(name, inst)| {
            Some((
                name,
                parser[inst.match_]
                    .blamed
                    .iter()
                    .map(|blamed| match blamed {
                        BlameKind::Term { term } => {
                            format!("{}", parser[*term].owner.with(&display_ctxt))
                        }
                        BlameKind::Equality { eq } => {
                            format!("{}", parser[parser[*eq].to].owner.with(&display_ctxt))
                        }
                    })
                    .collect::<Vec<_>>(),
            ))
        })
    {
        blamed.sort();
        let all_blamed = blamed.join(";");

        if !quant_to_terms.contains_key(name) {
            quant_to_terms.insert(name.to_string(), HashSet::new());
        }
        if quant_to_terms[name].contains(&all_blamed) {
            *quant_duplicates.entry(name.to_string()).or_insert(0) += 1;
        } else {
            quant_to_terms.get_mut(name).unwrap().insert(all_blamed);
        }

    }

    for (name, count) in quant_duplicates {
        println!("{} = {}", name, count);
    }

    Ok(())
}
