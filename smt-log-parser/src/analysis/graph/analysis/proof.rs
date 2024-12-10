use petgraph::Direction;

use crate::{
    analysis::raw::{Node, ProofReach},
    Z3Parser,
};

use super::run::{CollectInitialiser, Initialiser};

const FORWARD_MASK: ProofReach = ProofReach::ProvesFalse.or(ProofReach::UnderHypothesis);
const REVERSE_MASK: ProofReach = ProofReach::ReachesProof
    .or(ProofReach::ReachesNonTrivialProof)
    .or(ProofReach::ReachesFalse);

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
        let kind = parser[proof].kind;
        let under_hypothesis = ProofReach::UnderHypothesis.if_(kind.is_hypothesis());
        let reaches_non_trivial_proof = ProofReach::ReachesNonTrivialProof.if_(!kind.is_trivial());

        let proves_false = parser.proves_false(proof);
        let reaches_false = ProofReach::ReachesFalse.if_(proves_false);
        let proves_false = ProofReach::ProvesFalse.if_(proves_false);
        proves_false
            | under_hypothesis
            | ProofReach::ReachesProof
            | reaches_non_trivial_proof
            | reaches_false
    }
    fn assign(&mut self, node: &mut Node, value: Self::Value) {
        if FORWARD {
            node.proof = value & FORWARD_MASK | node.proof & REVERSE_MASK;
        } else {
            node.proof = value & REVERSE_MASK | node.proof & FORWARD_MASK;
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
                let proves_false = from.proof.proves_false();
                let under_hypothesis =
                    (from.proof & ProofReach::UnderHypothesis).if_(!proves_false);
                reach |= under_hypothesis;
            } else {
                reach |= from.proof & REVERSE_MASK;
            }
        }
        reach
    }
}
