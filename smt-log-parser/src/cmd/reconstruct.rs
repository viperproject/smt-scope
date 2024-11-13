use std::path::PathBuf;

use smt_log_parser::{
    display_with::{DisplayConfiguration, DisplayCtxt, DisplayWithCtxt, SymbolReplacement},
    formatter::TermDisplayContext,
};

pub fn run(logfile: PathBuf) -> Result<(), String> {
    let parser = super::run_on_logfile(logfile)?;
    let config = DisplayConfiguration {
        replace_symbols: SymbolReplacement::None,
        ..Default::default()
    };
    let term_display = TermDisplayContext::s_expression();
    let ctxt = DisplayCtxt {
        parser: &parser,
        config,
        term_display: &term_display,
    };
    for event in parser.events.events() {
        println!(
            "{} ; {} enodes | {} insts",
            event.kind.with(&ctxt),
            event.enodes,
            event.insts
        );
    }

    Ok(())
}
