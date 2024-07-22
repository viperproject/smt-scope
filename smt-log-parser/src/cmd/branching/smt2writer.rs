use core::fmt;
use smt_log_parser::{
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::{ENodeIdx, TermIdx, TermKind},
    Z3Parser,
};
use std::fmt::Write;

pub(crate) struct Smt2WriterContext<'a> {
    parser: &'a Z3Parser,
    bound_terms: &'a [ENodeIdx],
    display_ctxt: &'a DisplayCtxt<'a>,
}

impl<'a> Smt2WriterContext<'a> {
    pub(crate) fn new(
        parser: &'a Z3Parser,
        bound_terms: &'a [ENodeIdx],
        display_ctxt: &'a DisplayCtxt<'a>,
    ) -> Self {
        Self {
            parser,
            bound_terms,
            display_ctxt,
        }
    }
}

/// The trait is the same as `Display`, just it additionally takes
/// `Smt2WriterContext`.`
pub(crate) trait Smt2Writer {
    fn write_with<Writer: Write>(
        &self,
        writer: &mut Writer,
        ctxt: &Smt2WriterContext,
    ) -> fmt::Result;
}

impl Smt2Writer for TermIdx {
    fn write_with<Writer: Write>(
        &self,
        writer: &mut Writer,
        ctxt: &Smt2WriterContext,
    ) -> fmt::Result {
        let term = &ctxt.parser[*self];
        match term.kind {
            TermKind::Var(var_idx) => {
                let enode = ctxt.bound_terms[var_idx];
                enode.write_with(writer, ctxt)?;
                assert_eq!(term.child_ids.len(), 0, "{:?}", term);
            }
            TermKind::ProofOrApp(poa) => {
                assert!(!poa.is_proof, "{:?}", term);
                let name = &ctxt.parser.strings[*poa.name];
                if name == "Int" {
                    assert_eq!(term.child_ids.len(), 0, "{:?}", term);
                    let int_str = self.with(ctxt.display_ctxt);
                    write!(writer, "{}", int_str)?;
                } else {
                    assert_ne!(name, "Int", "{:?}", term);
                    assert_ne!(name, "Bool");
                    if term.child_ids.is_empty() {
                        write!(writer, "{}", name)?;
                    } else {
                        write!(writer, "({}", name)?;
                        for child in &*term.child_ids {
                            write!(writer, " ")?;
                            child.write_with(writer, ctxt)?;
                        }
                        write!(writer, ")")?;
                    }
                }
            }
            TermKind::Quant(_) => todo!(),
            TermKind::Generalised => todo!(),
        }
        Ok(())
    }
}

impl Smt2Writer for ENodeIdx {
    fn write_with<Writer: Write>(
        &self,
        writer: &mut Writer,
        ctxt: &Smt2WriterContext,
    ) -> fmt::Result {
        ctxt.parser[*self].owner.write_with(writer, ctxt)
    }
}
