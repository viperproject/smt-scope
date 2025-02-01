mod ctxt;
mod formatter;
mod printer;

pub use ctxt::*;
pub use formatter::*;
pub use printer::*;

#[test]
fn test_printing() {
    use crate::*;
    let logfile = include_str!("test.log");
    let parser = Z3Parser::from_str(logfile);
    let parser = parser.process_all().unwrap();
    let mut term_display = TermDisplayContext::basic();
    let td = TermDisplay::parse("(not (= _ _))", "$-6$!=$[#0|-8,16]$$-16$").unwrap();
    term_display.push(td).unwrap();
    let ctxt = DisplayCtxt {
        parser: &parser,
        term_display: &term_display,
        config: DisplayConfiguration::default(),
    };
    let term = items::TermIdx::from(5);
    let term = term.with(&ctxt).to_string();
    assert_eq!(term, "!=(t3 = t4)");
}
