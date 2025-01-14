#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use super::z3::Z3LogParser;
use crate::Result;

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Debug, Default)]
pub struct Z3DummyParser(
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
    u32,
);

impl Z3LogParser for Z3DummyParser {
    fn version_info<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.0 += l.count() as u32;
        Ok(())
    }

    fn mk_quant<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.1 += l.count() as u32;
        Ok(())
    }

    fn mk_lambda<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.2 += l.count() as u32;
        Ok(())
    }

    fn mk_var<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.3 += l.count() as u32;
        Ok(())
    }

    fn mk_app<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.4 += l.count() as u32;
        Ok(())
    }

    fn mk_proof<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.5 += l.count() as u32;
        Ok(())
    }

    fn attach_meaning<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.6 += l.count() as u32;
        Ok(())
    }

    fn attach_var_names<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.7 += l.count() as u32;
        Ok(())
    }

    fn attach_enode<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.8 += l.count() as u32;
        Ok(())
    }

    fn eq_expl<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.9 += l.count() as u32;
        Ok(())
    }

    fn new_match<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.10 += l.count() as u32;
        Ok(())
    }

    fn inst_discovered<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.11 += l.count() as u32;
        Ok(())
    }

    fn instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.12 += l.count() as u32;
        Ok(())
    }

    fn end_of_instance<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.13 += l.count() as u32;
        Ok(())
    }

    fn push<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.14 += l.count() as u32;
        Ok(())
    }

    fn pop<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.15 += l.count() as u32;
        Ok(())
    }

    fn eof(&mut self) {
        self.16 += 1;
    }

    fn newline(&mut self) {
        self.17 += 1;
    }

    fn decide_and_or<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.18 += l.count() as u32;
        Ok(())
    }

    fn decide<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.19 += l.count() as u32;
        Ok(())
    }

    fn assign<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.20 += l.take(4).count() as u32;
        Ok(())
    }

    fn begin_check<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.21 += l.count() as u32;
        Ok(())
    }

    fn query_done<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.22 += l.count() as u32;
        Ok(())
    }

    fn resolve_process<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.23 += l.count() as u32;
        Ok(())
    }

    fn resolve_lit<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.24 += l.count() as u32;
        Ok(())
    }

    fn conflict<'a>(&mut self, l: impl Iterator<Item = &'a str>) -> Result<()> {
        self.25 += l.count() as u32;
        Ok(())
    }
}
