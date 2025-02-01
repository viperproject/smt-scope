use std::path::PathBuf;

use smt_log_parser::display::{
    DisplayConfiguration, DisplayCtxt, DisplayWithCtxt, SymbolReplacement, TermDisplayContext,
};

pub fn run(logfile: PathBuf, clean: bool) -> Result<(), String> {
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
        print!("{}", event.kind.with(&ctxt));
        if !clean {
            println!(" ; {} enodes | {} insts", event.enodes, event.insts);
        } else {
            println!();
        }
    }

    Ok(())
}
