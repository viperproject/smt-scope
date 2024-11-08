use std::path::PathBuf;

use smt_log_parser::{
    display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt, SymbolReplacement},
    formatter::TermDisplayContext,
};

pub fn run(logfile: PathBuf) -> Result<(), String> {
    let parser = super::run_on_logfile(logfile)?;
    let config = DisplayConfiguration {
        display_term_ids: false,
        display_quantifier_name: false,
        replace_symbols: SymbolReplacement::None,
        #[cfg(feature = "display_html")]
        html: false,
        enode_char_limit: None,
        ast_depth_limit: None,
    };
    let term_display = TermDisplayContext::s_expression();
    let ctxt = DisplayCtxt {
        parser: &parser,
        config,
        term_display: &term_display,
    };
    for event in parser.events.events() {
        println!("{}", event.with(&ctxt));
    }

    Ok(())
}
