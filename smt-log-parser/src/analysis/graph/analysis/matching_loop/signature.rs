#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};

use fxhash::FxHashSet;

use crate::{
    analysis::InstGraph,
    display_with::{DisplayCtxt, DisplayWithCtxt},
    formatter::TermDisplayContext,
    items::{ENodeIdx, InstIdx, Instantiation, QuantIdx, TermIdx},
    FxHashMap, Z3Parser,
};

#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Clone, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct MlSignature {
    pub quantifier: QuantIdx,
    pub pattern: TermIdx,
    pub parents: Box<[InstParent]>,
}

/// For each pattern in the matched pattern, where did the blamed term come
/// from? This will rule out a chain of instantiations which always requires new
/// terms as each instantiation will have a different `InstParent`.
/// Instantiation chains which all depend on a single term will have the same
/// `InstParent`.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[derive(Clone, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum InstParent {
    Quant(QuantIdx),
    Const(ENodeIdx),
    NonQuantAxiom,
}

impl MlSignature {
    pub fn new(parser: &Z3Parser, inst: &Instantiation) -> Option<Self> {
        let match_ = &parser[inst.match_];
        let pattern = match_.kind.pattern()?;
        // If it has a pattern then definitely also has a quant_idx
        let quant_idx = match_.kind.quant_idx().unwrap();
        let parents: Box<[_]> = match_
            .trigger_matches()
            .map(|blame| {
                let blame = blame.enode();
                let eblame = &parser[blame];
                let Some(created_by) = eblame.created_by else {
                    return InstParent::Const(blame);
                };
                match parser[parser[created_by].match_].kind.quant_idx() {
                    Some(qidx) => InstParent::Quant(qidx),
                    None => InstParent::NonQuantAxiom,
                }
            })
            .collect();
        Some(Self {
            quantifier: quant_idx,
            pattern,
            parents,
        })
    }

    pub fn to_string(&self, parser: &Z3Parser) -> String {
        let ctxt = DisplayCtxt {
            parser,
            term_display: &TermDisplayContext::basic(),
            config: Default::default(),
        };
        let parents = self
            .parents
            .iter()
            .map(|p| match p {
                InstParent::Quant(q) => format!("{}", q.with(&ctxt)),
                InstParent::Const(c) => format!("{}", c.with(&ctxt)),
                InstParent::NonQuantAxiom => "NQA".to_string(),
            })
            .collect::<Vec<_>>()
            .join(", ");
        format!(
            "{} {} {parents:?}",
            self.quantifier.with(&ctxt),
            self.pattern,
        )
    }
}

impl InstGraph {
    pub(super) fn collect_ml_signatures(
        parser: &Z3Parser,
    ) -> FxHashMap<MlSignature, FxHashSet<InstIdx>> {
        let mut signatures = FxHashMap::<_, FxHashSet<_>>::default();
        for (iidx, inst) in parser.instantiations().iter_enumerated() {
            let Some(ml_sig) = MlSignature::new(parser, inst) else {
                continue;
            };
            signatures.entry(ml_sig).or_default().insert(iidx);
        }
        signatures
    }
}
