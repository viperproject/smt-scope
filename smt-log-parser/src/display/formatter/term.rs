use crate::{parsers::z3::synthetic::SynthIdx, IString, Z3Parser};

#[derive(Clone, Copy)]
pub struct TermSig<'a> {
    parser: &'a Z3Parser,
    name: &'a str,
    children: &'a [SynthIdx],
}

impl<'a> TermSig<'a> {
    pub fn new(parser: &'a Z3Parser, name: IString, children: &'a [SynthIdx]) -> Self {
        let name = &parser[name];
        Self {
            parser,
            name,
            children,
        }
    }

    pub fn name(self) -> &'a str {
        self.name
    }

    pub fn children(self) -> usize {
        self.children.len()
    }

    pub fn child(self, idx: usize) -> Option<TermSig<'a>> {
        let child = &self.parser[self.children[idx]];
        let name = child.kind().parsed().and_then(|p| p.app_name());
        name.map(|name| TermSig::new(self.parser, name, child.child_ids()))
    }
}
