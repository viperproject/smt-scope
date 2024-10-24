use std::sync::Mutex;

use fxhash::FxHashMap;
use nucleo_matcher::{Config, Matcher, Utf32String};
use smt_log_parser::{
    analysis::{raw::IndexesInstGraph, visible::VisibleInstGraph, InstGraph, RawNodeIndex},
    items::{ENodeIdx, InstIdx, QuantIdx, QuantKind, TermIdx, TermKind},
    Z3Parser,
};

use crate::commands::{Command, CommandId};

pub struct StringLookup<T> {
    matcher: Mutex<Matcher>,
    values: FxHashMap<Utf32String, T>,
}

impl<T> StringLookup<T> {
    pub fn new() -> Self {
        let config = Config::DEFAULT;
        let matcher = Matcher::new(config);
        Self {
            matcher: Mutex::new(matcher),
            values: Default::default(),
        }
    }
    pub fn get_or_insert_default(&mut self, key: &str) -> &mut T
    where
        T: Default,
    {
        self.get_or_insert(key, Default::default)
    }
    pub fn get_or_insert(&mut self, key: &str, default: impl FnOnce() -> T) -> &mut T {
        self.values
            .entry(Utf32String::from(key))
            .or_insert_with(default)
    }

    pub fn get_exact(&self, key: &str) -> Option<&T> {
        self.values.get(&Utf32String::from(key))
    }
    pub fn get_fuzzy<'a>(&'a self, needle: &str) -> Matches<'a, T> {
        let original_needle = needle;
        let needle = Utf32String::from(needle.to_lowercase());
        let needle = needle.slice(..);
        let mut indices = Vec::new();
        let mut matcher = self.matcher.lock().unwrap();
        let matches = self
            .values
            .iter()
            .flat_map(|(k, v)| {
                let k_slice = k.slice(..);
                matcher
                    .fuzzy_indices(k_slice, needle, &mut indices)
                    .map(|mut score| {
                        // Penalise the score where the characters don't exactly
                        // match (e.g. due to ascii normalisation or lowercasing).
                        // This is not ideal since we might not get the highest
                        // scoring match.
                        for (idx, char) in original_needle.char_indices() {
                            let idx = indices[indices.len() - needle.len() + idx];
                            if k_slice.get(idx) != char {
                                score = score.saturating_sub(1);
                            }
                        }
                        (score, k, v)
                    })
            })
            .collect();
        Matches { indices, matches }
    }
}

pub type StringLookupZ3 = StringLookup<FxHashMap<Kind, Entry>>;

impl StringLookupZ3 {
    pub fn init(parser: &Z3Parser) -> Self {
        let mut lookup = Self::new();
        for (idx, instantiation) in parser.instantiations().iter_enumerated() {
            let match_ = &parser[instantiation.match_];
            if let Some(quant) = match_.kind.quant_idx() {
                let name = match &parser[quant].kind {
                    QuantKind::Other(name) => Some(name),
                    QuantKind::Lambda => None,
                    QuantKind::NamedQuant(name) => Some(name),
                    QuantKind::UnnamedQuant { .. } => None,
                };
                if let Some(name) = name {
                    let entry = lookup.get_or_insert_default(&parser[*name]);
                    let entry = entry.entry(Kind::Quantifier).or_default();
                    entry.references.push(idx);
                    entry.qidx = Some(quant);
                };
            }
            let mut handle_term = |enode: ENodeIdx| {
                let tidx = parser[enode].owner;
                let name = match parser[tidx].kind {
                    TermKind::App(name) => Some(name),
                    _ => None,
                };
                if let Some(name) = name {
                    let entry = lookup.get_or_insert_default(&parser[name]);
                    let entry = entry.entry(Kind::Term).or_default();
                    entry.references.push(idx);
                    entry.tidx = Some(tidx);
                };
            };
            for blame in match_.trigger_matches() {
                handle_term(blame.enode());
            }
            for yields in instantiation.yields_terms.iter() {
                handle_term(*yields);
            }
        }
        lookup
    }
}

pub enum CommandsWithName {
    Single((CommandId, Command)),
    Multiple(Vec<(CommandId, Command)>),
}
pub type StringLookupCommands = StringLookup<CommandsWithName>;
impl StringLookupCommands {
    pub fn with_commands(commands: impl Iterator<Item = (CommandId, Command)>) -> Self {
        let mut lookup = Self::new();
        for command in commands {
            match lookup
                .values
                .entry(Utf32String::from(command.1.name.as_str()))
            {
                std::collections::hash_map::Entry::Occupied(mut o) => {
                    let old =
                        std::mem::replace(o.get_mut(), CommandsWithName::Multiple(Vec::new()));
                    let CommandsWithName::Multiple(vec) = o.get_mut() else {
                        unreachable!();
                    };
                    match old {
                        CommandsWithName::Single(old) => vec.push(old),
                        CommandsWithName::Multiple(mut old) => {
                            old.push(command);
                            *vec = old;
                        }
                    }
                }
                std::collections::hash_map::Entry::Vacant(v) => {
                    v.insert(CommandsWithName::Single(command));
                }
            }
        }
        lookup
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Kind {
    Quantifier,
    Term,
}

impl Kind {
    pub fn name(&self) -> &'static str {
        match self {
            Kind::Quantifier => "Quantifiers",
            Kind::Term => "Terms",
        }
    }
}

#[derive(Debug, Clone, Default)]
pub struct Entry {
    references: Vec<InstIdx>,
    pub qidx: Option<QuantIdx>,
    pub tidx: Option<TermIdx>,
}

impl Entry {
    pub fn count(&self) -> usize {
        self.references.len()
    }
    fn visible<'a>(
        &'a self,
        graph: &'a InstGraph,
        visible: &'a VisibleInstGraph,
    ) -> impl Iterator<Item = RawNodeIndex> + 'a {
        self.references
            .iter()
            .map(move |&idx| idx.index(&graph.raw))
            .filter(move |&idx| visible.contains(idx))
    }
    pub fn get_visible(&self, graph: &InstGraph, visible: &VisibleInstGraph) -> Vec<RawNodeIndex> {
        self.visible(graph, visible).collect()
    }
    pub fn count_visible(&self, graph: &InstGraph, visible: &VisibleInstGraph) -> usize {
        self.visible(graph, visible).count()
    }
}

#[derive(Debug)]
pub struct Matches<'a, T> {
    pub indices: Vec<u32>,
    pub matches: Vec<(u16, &'a Utf32String, &'a T)>,
}
