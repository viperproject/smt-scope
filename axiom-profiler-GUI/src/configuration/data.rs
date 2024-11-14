use fxhash::FxHashMap;
use smt_log_parser::{
    display_with::{DisplayConfiguration, SymbolReplacement},
    formatter::TermDisplayContext,
};

use crate::state::FileInfo;

use super::ConfigurationProvider;

impl ConfigurationProvider {
    pub fn reset(&self) {
        self.update.reset();
    }
    pub fn update_display(&self, f: impl FnOnce(&mut DisplayConfiguration) -> bool + 'static) {
        self.update.update(|cfg| f(&mut cfg.display));
    }
    pub fn update_term_display(&self, file: Option<FileInfo>, new: TermDisplayContext) {
        self.update.update(move |cfg| {
            if let Some(file) = file {
                if new.is_empty() {
                    cfg.term_display.per_file.remove(&file.name).is_some()
                } else {
                    let is_same = cfg
                        .term_display
                        .per_file
                        .get(&file.name)
                        .is_some_and(|old| old == &new);
                    if !is_same {
                        cfg.term_display.per_file.insert(file.name, new);
                    }
                    !is_same
                }
            } else {
                let is_same = cfg.term_display.general == new;
                if !is_same {
                    cfg.term_display.general = new;
                }
                !is_same
            }
        });
    }
}

#[derive(Debug, Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub struct Configuration {
    pub display: DisplayConfiguration,
    pub term_display: TermDisplayContextFiles,
}
impl Configuration {
    pub const fn default_display() -> DisplayConfiguration {
        DisplayConfiguration {
            display_term_ids: false,
            display_quantifier_name: false,
            replace_symbols: SymbolReplacement::Code,
            input: None,
            html: true,
            font_tag: false,
            // Set manually elsewhere
            enode_char_limit: None,
            ast_depth_limit: None,
        }
    }
}

impl Default for Configuration {
    fn default() -> Self {
        Self {
            display: Self::default_display(),
            term_display: TermDisplayContextFiles::default(),
        }
    }
}

/// A grouping of general TermDisplayContext and per file ones.
#[derive(Debug, Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub struct TermDisplayContextFiles {
    pub general: TermDisplayContext,
    pub per_file: FxHashMap<String, TermDisplayContext>,
}

impl Default for TermDisplayContextFiles {
    fn default() -> Self {
        Self {
            general: TermDisplayContext::basic(),
            per_file: FxHashMap::default(),
        }
    }
}
