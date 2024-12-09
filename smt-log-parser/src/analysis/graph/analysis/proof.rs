use petgraph::Direction;

use crate::{
    analysis::raw::{Node, ProofReach},
    Z3Parser,
};

use super::run::{CollectInitialiser, Initialiser};

pub struct ProofInitialiser<const FORWARD: bool>;

impl<const FORWARD: bool> Initialiser<FORWARD, 3> for ProofInitialiser<FORWARD> {
    type Value = ProofReach;
    fn direction() -> Direction {
        if FORWARD {
            Direction::Incoming
        } else {
            Direction::Outgoing
        }
    }
    fn base(&mut self, node: &Node, parser: &Z3Parser) -> Self::Value {
        let Some(proof) = node.kind().proof() else {
            return ProofReach::default();
        };
        let under_hypothesis = parser[proof].kind.is_hypothesis();
        let proves_false = parser.proves_false(proof);
        ProofReach {
            proves_false,
            under_hypothesis,
            reaches_proof: true,
            reaches_false: proves_false,
        }
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        if FORWARD {
            node.proof.proves_false = value.proves_false;
            node.proof.under_hypothesis = value.under_hypothesis;
        } else {
            node.proof.reaches_proof = value.reaches_proof;
            node.proof.reaches_false = value.reaches_false;
        }
    }
}
impl<const FORWARD: bool> CollectInitialiser<FORWARD, false, 3> for ProofInitialiser<FORWARD> {
    fn collect<'n, T: Iterator<Item = &'n Node>>(
        &mut self,
        node: &Node,
        from_all: impl Fn() -> T,
    ) -> Self::Value {
        let mut reach = node.proof;
        for from in from_all() {
            if FORWARD {
                reach.under_hypothesis |= from.proof.under_hypothesis && !from.proof.proves_false;
            } else {
                reach.reaches_proof |= from.proof.reaches_proof;
                reach.reaches_false |= from.proof.reaches_false;
            }
        }
        reach
    }
}
