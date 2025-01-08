use std::path::PathBuf;

use smt_log_parser::{
    analysis::RedundancyAnalysis,
    display_with::{DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
};

pub fn run(logfile: PathBuf) -> Result<(), String> {
    let parser = super::run_on_logfile(logfile)?;
    let redundancy = RedundancyAnalysis::new(&parser);

    let term_display = TermDisplayContext::basic();
    let ctxt = DisplayCtxt {
        parser: &parser,
        term_display: &term_display,
        config: Default::default(),
    };
    for (qpat, data) in redundancy.per_quant.iter_enumerated() {
        let rc = data.redundant_count();
        let im = data.input_multiplicativity();
        let rr = data.redundant_ratio();
        if rc == 0 && im <= 1.0 {
            continue;
        }
        print!("{}:", qpat.with(&ctxt));
        if rc > 0 {
            print!(" {rc} duplicate, ratio {:.1}%!", rr * 100.);
        }
        if im > 1.0 {
            print!(" Multiplicative pattern ({im:.1}x)!");
        }
        println!();
    }
    Ok(())
}
