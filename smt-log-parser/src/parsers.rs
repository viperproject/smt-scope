use std::error::Error;
use std::sync::{Arc, Mutex};
use std::time::Instant;
use std::collections::{HashMap, BTreeMap, HashSet};
use std::io::Write;
use regex::Regex;
use serde::Serialize;
use implicit_clone::unsync::IString;

use crate::file_io::*;
use crate::items::*;
use crate::render::RenderSVG;

/// Original Z3 log parser. Works with Z3 v.4.12.1, should work with other versions
/// as long as the log format is the same for the important line cases.
/// Compare with the log files in the `logs/` folder to see if this is the case.
/// 
/// Tries to get around borrowing issues with indirection
/// (saving ID strings to avoid managing actual references/pointers between terms/other items) and map lookups.
pub mod z3parser1;

/// WORK IN PROGRESS, currently not functional.
/// 
/// A Z3 log parser using `Rc` and `RefCell` (interior mutability)
/// so that objects can be 'held' by any number of other objects without creating ownership/borrowing problems.
pub mod z3parser_rc;

// Regex constants for parsing quantifier variables and sorts
const QVAR_REGEX_STR_1: &str = r"\(;(?P<sort>\S+)\)";
const QVAR_REGEX_STR_2: &str = r"\(\|(?P<name>\S+)\|\s;\s\|(?P<sort>\S+)\|\)";

// default output files
const OUT_INST: &str = "out/instantiations.txt";
const OUT_INST_SORTED: &str = "out/inst_sorted.txt";
const OUT_QUANT: &str = "out/quantifiers.txt";
const OUT_DEP: &str = "out/dependencies.txt";
const OUT_DEP_SORTED: &str = "out/deps_sorted.txt";
const OUT_TERMS: &str = "out/terms.txt";
const OUT_EQ: &str = "out/eq_expls.txt";
const OUT_PRETTY_TERMS: &str = "out/pretty-printed-text.txt";
const OUT_PRETTY_QUANT: &str = "out/pretty-printed-quant.txt";
const OUT_DOT: &str = "out/output.dot";
const OUT_CSS: &str = "out/styles.css";
const OUT_SVG_2: &str = "out/output2.svg";
const OUT_SVG: &str = "out/output.svg";

const OUT_INST_JSON: &str = "out/instantiations.json";
const OUT_INST_SORTED_JSON: &str = "out/inst_sorted.json";
const OUT_QUANT_JSON: &str = "out/quantifiers.json";
const OUT_DEP_JSON: &str = "out/dependencies.json";
const OUT_DEP_SORTED_JSON: &str = "out/deps_sorted.json";
const OUT_TERMS_JSON: &str = "out/terms.json";
const OUT_EQ_JSON: &str = "out/eq_expls.json";

pub enum Log {
    Filename(String),
    File(IString)
}

pub struct ParserSettings {
    pub max_line_nr: u32,
    pub max_instantiations: u32,
    pub ignore_theory_inst: bool,
}

impl Default for ParserSettings {
    fn default() -> Self {
        Self {
            max_line_nr: u32::MAX,
            max_instantiations: u32::MAX,
            ignore_theory_inst: true,
        }
    }
}

/// Trait for a generic SMT solver trace parser. Intended to support different solvers or log formats. 
pub trait LogParser {
    /// Parse given file with given settings
    fn process_file(
        &mut self,
        filename: &str,
        settings: &Settings,
    ) -> Result<(String,), String>; // Result type could be changed so that the Ok variant is a struct

    /// Creates a new parser instance
    fn new() -> Self;

    // perhaps below two should be part of their own trait, but Z3LogParser::main_parse_loop depends on these functions being part of LogParser
    /// Returns true if parser should parse the next line; false if parser should stop
    fn should_continue(&self, line_no: u32) -> bool; 

    /// Parse given log represented as a String
    fn process_log(
        &mut self,
        log: IString,
    );

    fn get_dependencies(&self) -> &Vec<Dependency>;
}

pub trait Interruptable {
    /// Getter for `Arc` for mutex containing an early-stop flag. 
    /// A clone of the `Arc` must be given to an external stopper (`ParseContinueAgent`) for manual early stopping to work.
    fn get_continue_mutex(&self) -> Arc<Mutex<bool>>;
}

pub trait Z3LogParser: LogParser {
    /* Methods to handle each line case of Z3 logs.
     `l` is a line split with spaces as delimiters,
     and `l0` is the raw line (used only when )
    */
    fn version_info(&mut self, l: &[&str]);
    fn mk_quant(&mut self, l: &[&str]);
    fn mk_var(&mut self, l: &[&str]);
    fn mk_proof_app(&mut self, l: &[&str]);
    fn attach_meaning(&mut self, l: &[&str]);
    fn attach_vars(&mut self, l: &[&str], l0: &str);
    fn attach_enode(&mut self, l: &[&str]);
    fn eq_expl(&mut self, l: &[&str]);
    fn new_match(&mut self, l: &[&str], line_no: usize);
    fn inst_discovered(&mut self, l: &[&str], line_no: usize, l0: &str);
    fn instance(&mut self, l: &[&str], line_no: usize);
    fn end_of_instance(&mut self);

    // unused in original parser
    fn decide_and_or(&mut self, _l: &[&str]) {}
    fn decide(&mut self, _l: &[&str]) {}
    fn assign(&mut self, _l: &[&str]) {}
    fn push(&mut self, _l: &[&str]) {}
    fn pop(&mut self, _l: &[&str]) {}
    fn begin_check(&mut self, _l: &[&str]) {}
    fn query_done(&mut self, _l: &[&str]) {}
    fn resolve_process(&mut self, _l: &[&str]) {}
    fn resolve_lit(&mut self, _l: &[&str]) {}
    fn conflict(&mut self, _l: &[&str]) {}

    /// Parses log data line by line.
    fn main_parse_loop(&mut self, log: Log) {
        match log {
            Log::Filename(filename) => {
                if let Ok(lines) = read_lines(filename) {
                    for (line_no, line) in lines.enumerate() {
                        let l0 = line.unwrap_or_else(|_| panic!("Error reading line {}", line_no));
                        match self.process_line(l0, line_no) {
                            Ok(()) => continue,
                            Err(_) => break,
                        }
                    }
                } else {
                    panic!("Failed reading lines")
                }
            },
            Log::File(file) => {
                for (line_no, line) in file.lines().enumerate() {
                    if !self.should_continue(line_no as u32) {
                        break;
                    }
                    match self.process_line(line.to_string(), line_no) {
                        Ok(()) => continue,
                        Err(_) => break,
                    }
                }
            }
        } 
    } 

    fn process_line(&mut self, line: String, line_no: usize) -> Result<(),Box<dyn Error>> {
        let l: Vec<&str> = line.split(' ').collect();
        match l[0] {
            // match the line case
            "[tool-version]" => {
                self.version_info(&l);
            }
            "[mk-quant]" | "[mk-lambda]" => {
                self.mk_quant(&l);
            }
            "[mk-var]" => {
                self.mk_var(&l);
            }
            "[mk-proof]" | "[mk-app]" => {
                self.mk_proof_app(&l);
            }
            "[attach-meaning]" => {
                self.attach_meaning(&l);
            }
            "[attach-var-names]" => {
                self.attach_vars(&l, &line);
            }
            "[attach-enode]" => {
                self.attach_enode(&l);
            }
            "[eq-expl]" => {
                self.eq_expl(&l);
            }
            "[new-match]" => {
                self.new_match(&l, line_no);
            }
            "[inst-discovered]" => {
                self.inst_discovered(&l, line_no, &line);
            }
            "[instance]" => {
                self.instance(&l, line_no);
            }
            "[end-of-instance]" => {
                self.end_of_instance();
            }
            "[decide-and-or]" => {
                self.decide_and_or(&l);
            }
            "[decide]" => {
                self.decide(&l);
            }
            "[assign]" => {
                self.assign(&l);
            }
            "[push]" => {
                self.push(&l);
            }
            "[pop]" => {
                self.pop(&l);
            }
            "[begin-check]" => {
                self.begin_check(&l);
            }
            "[query-done]" => {
                self.query_done(&l);
            }
            "[eof]" => {
                return Err(From::from("[eof]"));
            }
            "[resolve-process]" => {
                self.resolve_process(&l);
            }
            "[resolve-lit]" => {
                self.resolve_lit(&l);
            }
            "[conflict]" => {
                self.conflict(&l);
            }
            _ => println!("Unknown line case: {}", line),
        }
        Ok(())
    }

    /// Handles parsing, saves results to file, and outputs the final graph.
    /// Used to implement `LogParser::process_file` for a `Z3Parser`.
fn process_z3_file(&mut self, filename: &str, settings: &Settings) -> Result<(String,), String> {
        let time = Instant::now();

        self.main_parse_loop(Log::Filename(filename.to_string()));

        let elapsed_time = time.elapsed();
        println!(
            "Finished parsing after {} seconds",
            elapsed_time.as_secs_f32()
        );
        self.save_output_to_files(settings, &time);
        let render_engine = crate::render::GraphVizRender;
        let svg_result = render_engine.make_svg(OUT_DOT, OUT_SVG);
        crate::render::add_link_to_svg(OUT_SVG, OUT_SVG_2);
        println!(
            "Finished render sequence after {} seconds",
            time.elapsed().as_secs_f32()
        );

        let elapsed_time = time.elapsed();
        println!("Done, run took {} seconds.", elapsed_time.as_secs_f32());

        Ok((svg_result, ))
    }

    fn process_z3_log(&mut self, log: IString) {
        self.main_parse_loop(Log::File(log));
    }
    /// Save contents of parser to files.
    fn save_output_to_files(&mut self, settings: &Settings, time: &Instant);

    // fn get_term(&self, id: &str) -> Term;
    // fn get_quantifiers(&self, id: &str) -> Quantifier;
    // fn get_instantiations(&self, line_no: &usize) -> Instantiation;
}

/// An identifier for a Z3 quantifier instantiation (called "fingerprint" in the original Axiom Profiler).
/// Represented as a 16-digit hexadecimal number in log files.
type Z3Fingerprint = u64;

/// Type of solver and version number
#[derive(Default)]
pub struct VersionInfo {
    solver: String,
    version: String,
}