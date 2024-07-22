use fxhash::FxHashMap;
use smt2writer::{Smt2Writer, Smt2WriterContext};
use smt_log_parser::{
    display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt, SymbolReplacement},
    LogParser, Z3Parser,
};
use std::path::PathBuf;

mod smt2writer;

/// One reason why Z3 can be slow is performing duplicated work when branching.
/// Sometimes, Z3 instantiates quantifiers and does other theory work only after
/// it performs a case split. In such cases, the theory work may be duplicated
/// in both branches, potentially a huge number of times. This function analyses
/// the given Z3 log file with the goal to detect such work duplication.
///
/// This function detects duplicated work by pretty printing the resulting terms
/// of instantiations and counting how many times each term has occurred. It
/// reports the results in file `report-duplicate-instances.csv`. It also
/// generates file `instantiate_duplicates.smt2` that contains the triggering
/// terms for all quantifiers that were intantiated more than once. Inserting
/// the generated terms into the original SMT2 file enables quickly checking
/// whether instantiating the quantifiers eagerly would fix the performance
/// problem. Currently, all quantifiers are hardcoded into the file.
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
    let term_display = &Default::default();
    let config = DisplayConfiguration {
        display_term_ids: false,
        display_quantifier_name: true,
        replace_symbols: SymbolReplacement::None,
        #[cfg(feature = "display_html")]
        html: false,
        enode_char_limit: None,
        ast_depth_limit: None,
    };
    let ctxt = DisplayCtxt {
        parser: &parser,
        term_display,
        config,
    };
    let mut instances = FxHashMap::default();
    for (idx, instance) in parser.instantiations() {
        if let Some(resulting_term) = instance.get_resulting_term() {
            let resulting_term_display = resulting_term.with(&ctxt);
            let resulting_term_str = format!("{}", resulting_term_display);
            let entry: &mut Vec<_> = instances.entry(resulting_term_str).or_default();
            entry.push(idx);
        } else {
            unimplemented!();
        }
    }

    // Open plain text file instantiate_duplicates.smt2 for writing.
    let mut smt2_file = std::fs::File::create("instantiate_duplicates.smt2").unwrap();
    for type_name in &["Address", "Bool"] {
        use std::io::Write;
        writeln!(
            &mut smt2_file,
            "(declare-fun wrapper__{} ( {} ) Bool)",
            type_name, type_name
        )
        .unwrap();
    }

    // Write instanaces map into a CSV file with three columns: the expression,
    // instance count, and instances.
    let mut csv_writer = csv::Writer::from_path("report-duplicate-instances.csv").unwrap();
    csv_writer
        .write_record([
            "Instance Count",
            "Instances",
            "Instances With Descriptions",
            "Expression",
        ])
        .unwrap(); // Add column headings
    for (resulting_term, instances) in instances {
        if instances.len() < 2 {
            continue;
        }
        // Check whether for all instances the match kind is the same.
        let mut idx_iterator = instances.iter();
        let first_idx = idx_iterator.next().unwrap();
        let first_instance = &parser[*first_idx];
        let first_match_kind = &parser[first_instance.match_].kind;
        let all_instances_kind_same = idx_iterator.all(|idx| {
            let instance = &parser[*idx];
            let match_kind = &parser[instance.match_].kind;
            match_kind == first_match_kind
        });
        let instances_with_descriptions = if all_instances_kind_same {
            if matches!(
                first_match_kind,
                smt_log_parser::items::MatchKind::Quantifier { .. }
            ) {
                let match_: &smt_log_parser::items::Match = &parser[first_instance.match_];
                match &match_.kind {
                    smt_log_parser::items::MatchKind::MBQI {
                        quant: _,
                        bound_terms: _,
                    } => todo!(),
                    smt_log_parser::items::MatchKind::TheorySolving {
                        axiom_id: _,
                        bound_terms: _,
                        rewrite_of: _,
                    } => todo!(),
                    smt_log_parser::items::MatchKind::Axiom {
                        axiom: _,
                        pattern: _,
                        bound_terms: _,
                    } => todo!(),
                    smt_log_parser::items::MatchKind::Quantifier {
                        quant,
                        pattern,
                        bound_terms,
                    } => {
                        use std::io::Write;
                        write!(&mut smt2_file, "\n\n; {} ", instances.len()).unwrap();
                        if let Some(user_name_idx) = parser[*quant].kind.user_name() {
                            let user_name = &parser[user_name_idx];
                            writeln!(&mut smt2_file, "{}", user_name).unwrap();
                            let formulas = {
                                let pattern_node = &parser[*pattern];
                                match pattern_node.kind {
                                    smt_log_parser::items::TermKind::Var(_) => todo!(),
                                    smt_log_parser::items::TermKind::ProofOrApp(_poa) => {
                                        let smt2context =
                                            Smt2WriterContext::new(&parser, bound_terms, &ctxt);
                                        let mut buffers = Vec::new();
                                        for child_id in &*pattern_node.child_ids {
                                            let mut buffer = String::new();
                                            child_id.write_with(&mut buffer, &smt2context).unwrap();
                                            buffers.push(buffer);
                                        }
                                        buffers
                                    }
                                    smt_log_parser::items::TermKind::Quant(_) => todo!(),
                                    smt_log_parser::items::TermKind::Generalised => todo!(),
                                }
                            };
                            if user_name == "Address$address_constructor$injectivity2$0" {
                                for formula in formulas {
                                    writeln!(
                                        &mut smt2_file,
                                        "(assert (wrapper__Address {}))",
                                        formula
                                    )
                                    .unwrap();
                                }
                            } else if user_name == "Address$address_range_contains$definition$0" {
                                for formula in formulas {
                                    writeln!(
                                        &mut smt2_file,
                                        "(assert (wrapper__Bool {}))",
                                        formula
                                    )
                                    .unwrap();
                                }
                            } else {
                                writeln!(&mut smt2_file, "; Skipped (unknown wrapper)").unwrap();
                            }
                        } else {
                            writeln!(&mut smt2_file, "; Skipped (not user defined)").unwrap();
                        }
                    }
                }
            }
            format!("all identical: {}", first_match_kind.short_description())
        } else {
            let all_instances_kind_description_same = idx_iterator.all(|idx| {
                let instance = &parser[*idx];
                let match_kind = &parser[instance.match_].kind;
                match_kind.short_description() == first_match_kind.short_description()
            });
            if all_instances_kind_description_same {
                format!("all same kind: {}", first_match_kind.short_description())
            } else {
                let mut instances_with_descriptions = String::new();
                for idx in &instances {
                    use std::fmt::Write;
                    let instance = &parser[*idx];
                    write!(
                        &mut instances_with_descriptions,
                        "{} ({}), ",
                        idx,
                        parser[instance.match_].kind.short_description()
                    )
                    .unwrap();
                }
                instances_with_descriptions
            }
        };
        csv_writer
            .write_record([
                &(instances.len().to_string()),
                &instances
                    .iter()
                    .map(|i| i.to_string())
                    .collect::<Vec<_>>()
                    .join(", "),
                &instances_with_descriptions,
                &resulting_term,
            ])
            .unwrap();
    }
    csv_writer.flush().unwrap();
    Ok(())
}
