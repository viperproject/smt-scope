use super::*;
use std::cell::RefCell;
use std::rc::Rc;

/// WORK IN PROGRESS
/// 
/// A Z3 log parser using `Rc` and `RefCell` (interior mutability)
/// so that objects can be 'held' by any number of other objects without creating ownership/borrowing problems.
#[derive(Default)]
pub struct Z3ParserRc {
    terms: RcBTreeMap<String, Term>,
    _quantifiers: RcBTreeMap<String, Quantifier>,
    _matches: RcHashMap<Z3Fingerprint, Instantiation>,
    _instantiations: RcBTreeMap<usize, Instantiation>,
    _inst_stack: Vec<(usize, Rc<RefCell<Instantiation>>)>,
    _temp_dependencies: BTreeMap<usize, Vec<Dependency>>,
    _eq_expls: BTreeMap<String, EqualityExpl>,
    _fingerprints: BTreeMap<usize, Z3Fingerprint>,
    _dependencies: Vec<Dependency>,
    _reuses: HashMap<String, usize>,
    _version_info: VersionInfo,
    pub continue_parsing: Arc<Mutex<bool>>,
}

pub fn new() -> Z3ParserRc {
    Z3ParserRc::default()
}

impl LogParser for Z3ParserRc {
    fn process_file(
        &mut self,
        filename: &str,
        settings: &Settings,
    ) -> Result<(String,), String> {
        self.process_z3_file(filename, settings)
    }

    fn new() -> Self {
        Z3ParserRc::default()
    }
    
    fn should_continue(&self, _line_no: u32) -> bool {
        true    // stub
    }

    fn process_log(
        &mut self,
        log: IString,
    ) {
        self.process_z3_log(log)
    }

    fn get_dependencies(&self) -> &Vec<Dependency> {
        &self._dependencies
    }

}

impl Interruptable for Z3ParserRc {
    fn get_continue_mutex(&self) -> Arc<Mutex<bool>> {
        Arc::clone(&self.continue_parsing)
    }
}

impl Z3LogParser for Z3ParserRc {
    fn version_info(&mut self, l: &[&str]) {
        self._version_info = VersionInfo {
            solver: l[1].to_string(),
            version: l[2].to_string(),
        };
        println!(
            "{} {}",
            &self._version_info.solver, &self._version_info.version
        );
    }

    fn mk_quant(&mut self, _l: &[&str]) {
        todo!()
    }

    fn mk_var(&mut self, l: &[&str]) {
        let full_id = parse_id(l[1]);
        let name = "qvar_".to_string() + l[2];
        let term = Term {
            kind: name.clone(),
            id: full_id.1,
            name: name.clone(),
            theory: String::new(),
            child_ids: vec![],
            dep_term_ids: vec![],
            resp_inst_line_no: None,
            text: name,
        };
        self.terms.insert(l[1].to_string(), get_rc_refcell(term));
    }

    fn mk_proof_app(&mut self, _l: &[&str]) {
        todo!()
    }

    fn attach_meaning(&mut self, _l: &[&str]) {
        todo!()
    }

    fn attach_vars(&mut self, _l: &[&str], _l0: &str) {
        todo!()
    }

    fn attach_enode(&mut self, _l: &[&str]) {
        todo!()
    }

    fn eq_expl(&mut self, _l: &[&str]) {
        todo!()
    }

    fn new_match(&mut self, _l: &[&str], _line_no: usize) {
        todo!()
    }

    fn inst_discovered(&mut self, _l: &[&str], _line_no: usize, _l0: &str) {
        todo!()
    }

    fn instance(&mut self, _l: &[&str], _line_no: usize) {
        todo!()
    }

    fn end_of_instance(&mut self) {
        todo!()
    }

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

    fn main_parse_loop(&mut self, log: Log) {
        match log {
            Log::Filename(filename) => {
                if let Ok(lines) = read_lines(filename) {
                    for (line_no, line) in lines.enumerate() {
                        let l0 = line.unwrap_or_else(|_| panic!("Error reading line {}", line_no));
                        let l: Vec<&str> = l0.split(' ').collect();
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
                                self.attach_vars(&l, &l0);
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
                                self.inst_discovered(&l, line_no, &l0);
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
                                break;
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
                            _ => println!("Unknown line case: {}", l0),
                        }
                    }
                } else {
                    panic!("Failed reading lines")
                }
            },
            Log::File(_) => todo!() 
        } 
    }

    fn save_output_to_files(&mut self, _settings: &Settings, _now: &Instant) {
        todo!()
    }
}

impl Z3ParserRc {
    fn _get_ident(&self, id: &str) -> Ident {
        let (ns, num) = parse_id(id);
        let mut reuse_num = 1;
        if let Some(n) = self._reuses.get(id) {
            reuse_num = *n;
        }
        Ident {
            namespace: ns,
            num,
            reuse_num,
        }
    }
}
fn get_rc_refcell<T>(item: T) -> Rc<RefCell<T>> {
    Rc::new(RefCell::from(item))
}

/// Get an Ident for a new ID (never seen before, or reused).
/// Updates reuse map
fn _get_ident_new(reuse_map: &mut HashMap<String, usize>, id: &str, do_reuses: bool) -> Ident {
    let (namespace, num) = parse_id(id);
    let reuse_num = if !do_reuses {
        0
    } else {
        *reuse_map
            .entry(id.to_string())
            .and_modify(|n| *n += 1)
            .or_insert(1_usize) // increment reuse count if exists, otherwise insert 1 (and then get the current reuse count)
    };
    Ident {
        namespace,
        num,
        reuse_num,
    }
}
