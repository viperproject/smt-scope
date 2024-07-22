use fxhash::FxHashMap;
use pyo3::prelude::*;
use pyo3::PyObjectProtocol;
use smt_log_parser::display_with::DisplayConfiguration;
use smt_log_parser::display_with::DisplayCtxt;
use smt_log_parser::display_with::DisplayWithCtxt;
use smt_log_parser::display_with::SymbolReplacement;
use smt_log_parser::items::TermIdx;
use smt_log_parser::{
    items::{InstIdx, MatchIdx, QuantIdx},
    LogParser, Z3Parser,
};

#[pyclass]
pub struct Parser {
    parser: Z3Parser,
    /// A map used to efficiently find instantiations that produce the same term. The
    /// map is computed lazily using `compute_repeated_instantiations` method and is,
    /// therefore, wrapped in an option.
    repeated_instantiations: Option<FxHashMap<String, Vec<InstIdx>>>,
}

#[pyclass]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Instantiation {
    index: InstIdx,
}

#[pyclass]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct QuantifierInstantiation {
    instantiation_index: InstIdx,
    quantifier_index: QuantIdx,
}

#[pyclass]
#[derive(Clone, Debug)]
pub struct BlamedTerm {
    owner: TermIdx,
    created_by: Option<InstIdx>,
}

#[pymethods]
impl BlamedTerm {
    pub fn has_created_by(&self) -> bool {
        self.created_by.is_some()
    }
    pub fn get_created_by(&self) -> Instantiation {
        Instantiation {
            index: self.created_by.unwrap(),
        }
    }
}

#[pyclass]
#[derive(Clone, Debug)]
pub struct BlameReport {
    blamed_terms: Vec<BlamedTerm>,
    blamed_equalities: Vec<BlamedTerm>, // FIXME: The struct name is confusing.
}

#[pymethods]
impl BlameReport {
    pub fn get_blamed_terms(&self) -> Vec<BlamedTerm> {
        self.blamed_terms.clone()
    }
    pub fn get_blamed_equalities(&self) -> Vec<BlamedTerm> {
        self.blamed_equalities.clone()
    }
}

#[pymethods]
impl QuantifierInstantiation {
    pub fn instantiation(&self) -> Instantiation {
        Instantiation {
            index: self.instantiation_index,
        }
    }

    pub fn quantifier(&self) -> Quantifier {
        Quantifier {
            index: self.quantifier_index,
        }
    }
}

#[pyproto]
impl PyObjectProtocol for QuantifierInstantiation {
    fn __str__(&self) -> PyResult<String> {
        Ok(format!(
            "QuantifierInstantiation(quantifier={},instantiation={})",
            self.quantifier_index, self.instantiation_index
        ))
    }
}

#[pyproto]
impl PyObjectProtocol for Instantiation {
    fn __str__(&self) -> PyResult<String> {
        Ok(format!("Instantiation({})", self.index))
    }
}

#[pyproto]
impl PyObjectProtocol for Match {
    fn __str__(&self) -> PyResult<String> {
        Ok(format!("Match({})", self.index))
    }
}

#[pyclass]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Quantifier {
    index: QuantIdx,
}

#[pyproto]
impl PyObjectProtocol for Quantifier {
    fn __str__(&self) -> PyResult<String> {
        Ok(format!("Quantifier({})", self.index))
    }
}

#[pyclass]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Match {
    index: MatchIdx,
}

impl Parser {
    fn iter_all_quantifier_instantiations(
        &self,
    ) -> impl Iterator<Item = QuantifierInstantiation> + '_ {
        self.parser
            .instantiations()
            .flat_map(|(idx, instantiation)| {
                let match_ = &self.parser[instantiation.match_];
                match_
                    .kind
                    .quant_idx()
                    .map(|quantifier_index| QuantifierInstantiation {
                        instantiation_index: idx,
                        quantifier_index,
                    })
            })
    }

    fn iter_quantifier_instantiations_for(
        &self,
        quantifier: Quantifier,
    ) -> impl Iterator<Item = QuantifierInstantiation> + '_ {
        self.iter_all_quantifier_instantiations()
            .filter(move |quantifier_instantiation| {
                quantifier_instantiation.quantifier() == quantifier
            })
    }

    fn compute_repeated_instantiations(&self) -> FxHashMap<String, Vec<InstIdx>> {
        let term_display = &Default::default();
        let config = create_display_configuration();
        let ctxt = DisplayCtxt {
            parser: &self.parser,
            term_display,
            config,
        };
        let mut instantiations = FxHashMap::default();
        for (idx, instantiation) in self.parser.instantiations() {
            if let Some(resulting_term) = instantiation.get_resulting_term() {
                let resulting_term_display = resulting_term.with(&ctxt);
                let resulting_term_str = format!("{}", resulting_term_display);
                let entry: &mut Vec<_> = instantiations.entry(resulting_term_str).or_default();
                entry.push(idx);
            } else {
                unimplemented!();
            }
        }
        instantiations
    }

    pub fn iter_duplicated_terms(&self) -> impl Iterator<Item = (usize, String)> + '_ {
        let repeated_instantiations = self
            .repeated_instantiations
            .as_ref()
            .expect("Call `initialise_repeated_instantiations` first.");
        repeated_instantiations
            .iter()
            .map(|(term, instantiations)| (instantiations.len(), term.clone()))
    }
}

fn create_display_configuration() -> DisplayConfiguration {
    DisplayConfiguration {
        display_term_ids: false,
        display_quantifier_name: true,
        replace_symbols: SymbolReplacement::None,
        html: false,
        enode_char_limit: None,
        ast_depth_limit: None,
    }
}

#[pymethods]
impl Parser {
    #[new]
    pub fn from_file(path: &str) -> Self {
        let (_metadata, parser) = Z3Parser::from_file(path).unwrap();
        let parser = parser.process_all().map_err(|e| e.to_string()).unwrap();
        Self {
            parser,
            repeated_instantiations: None,
        }
    }

    pub fn initialise_repeated_instantiations(&mut self) {
        if self.repeated_instantiations.is_none() {
            self.repeated_instantiations = Some(self.compute_repeated_instantiations());
        }
    }

    pub fn get_duplicated_terms(&self) -> Vec<(usize, String)> {
        self.iter_duplicated_terms().collect()
    }

    pub fn get_instantiations_for_term(&self, term: &str) -> Vec<Instantiation> {
        self.repeated_instantiations.as_ref().unwrap()[term]
            .iter()
            .map(|idx| Instantiation { index: *idx })
            .collect()
    }

    pub fn get_quantifier_name(&self, quantifier: Quantifier) -> &str {
        let quantifier = &self.parser[quantifier.index];
        let interned_string = quantifier.kind.user_name().unwrap();
        &self.parser[interned_string]
    }

    pub fn get_all_instantiations(&self) -> Vec<Instantiation> {
        let mut instantiations = Vec::new();
        for (idx, _) in self.parser.instantiations() {
            instantiations.push(Instantiation { index: idx });
        }
        instantiations
    }

    pub fn get_all_quantifier_instantiations(&self) -> Vec<QuantifierInstantiation> {
        self.iter_all_quantifier_instantiations().collect()
    }

    pub fn get_all_quantifiers(&self) -> Vec<Quantifier> {
        let mut quantifiers = Vec::new();
        for (idx, _) in self.parser.quantifiers() {
            quantifiers.push(Quantifier { index: idx });
        }
        quantifiers
    }

    pub fn resolve_quantifier(&self, quantifier_name: &str) -> Quantifier {
        for (idx, quantifier) in self.parser.quantifiers() {
            if let Some(user_name) = quantifier.kind.user_name() {
                if quantifier_name == &self.parser[user_name] {
                    return Quantifier { index: idx };
                }
            }
        }
        unreachable!("Not found quantifier with name: {}", quantifier_name);
    }

    pub fn get_quantifier_instantiations_for(
        &self,
        quantifier: Quantifier,
    ) -> Vec<QuantifierInstantiation> {
        self.iter_quantifier_instantiations_for(quantifier)
            .collect()
    }

    pub fn get_instantiation_match(&self, index: Instantiation) -> Match {
        let instantiation = &self.parser[index.index];
        Match {
            index: instantiation.match_,
        }
    }

    pub fn get_blamed_for_match(&self, match_: &Match) -> BlameReport {
        let match_ = &self.parser[match_.index];
        let mut blamed_terms = Vec::new();
        let mut blamed_equalities = Vec::new();
        for blamed in match_.blamed.iter() {
            match blamed {
                smt_log_parser::items::BlameKind::Term { term } => {
                    let enode = &self.parser.egraph[*term];
                    blamed_terms.push(BlamedTerm {
                        owner: enode.owner,
                        created_by: enode.created_by,
                    });
                }
                smt_log_parser::items::BlameKind::Equality { eq } => {
                    let explanation = &self.parser.egraph.equalities.transitive[*eq];
                    let enode = &self.parser.egraph[explanation.to];
                    blamed_equalities.push(BlamedTerm {
                        owner: enode.owner,
                        created_by: enode.created_by,
                    });
                }
            }
        }
        BlameReport {
            blamed_terms,
            blamed_equalities,
        }
    }

    pub fn render_instantiation_resulting_term(&self, instantiation: Instantiation) -> String {
        let instantiation = &self.parser[instantiation.index];
        if let Some(resulting_term) = instantiation.get_resulting_term() {
            let term_display = &Default::default();
            let config = create_display_configuration();
            let ctxt = DisplayCtxt {
                parser: &self.parser,
                term_display,
                config,
            };
            let resulting_term_display = resulting_term.with(&ctxt);
            format!("{}", resulting_term_display)
        } else {
            unimplemented!();
        }
    }

    pub fn render_blamed_term(&self, blamed_term: &BlamedTerm) -> String {
        let term_display = &Default::default();
        let config = create_display_configuration();
        let ctxt = DisplayCtxt {
            parser: &self.parser,
            term_display,
            config,
        };
        let term_display = blamed_term.owner.with(&ctxt);
        format!("{}", term_display)
    }
}

/// A Python module implemented in Rust.
#[pymodule]
fn axiom_profiler(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_class::<Parser>()?;
    Ok(())
}
