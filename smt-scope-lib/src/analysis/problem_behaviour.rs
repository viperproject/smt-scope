use crate::{items::QuantPat, Z3Parser};

use super::{analysis::matching_loop::MlData, InstGraph, RedundancyAnalysis};

#[derive(Debug, Default)]
pub struct ProblemBehaviours {
    /// All confirmed problem behaviours.
    pub errors: Vec<ProblemBehaviour>,
    /// All suspicious behaviours.
    pub warnings: Vec<ProblemBehaviour>,
}

impl ProblemBehaviours {
    pub fn find(ml: &MlData, redundancy: &RedundancyAnalysis) -> Self {
        let mut self_ = Self::default();
        for (idx, ml) in ml.matching_loops.iter().enumerate() {
            let kind = PbKind::MatchingLoop {
                max_len: ml.leaves.0[0].0,
                idx,
            };
            if ml.graph.is_some() {
                self_.errors.push(ProblemBehaviour { kind, sus: false });
            } else {
                self_.warnings.push(ProblemBehaviour { kind, sus: true });
            }
        }
        for (qpat, red) in redundancy.per_quant.iter_enumerated() {
            let multiplicativity = red.input_multiplicativity();
            let kind = PbKind::Multiplicative {
                qpat,
                multiplicativity,
            };
            if multiplicativity >= 4.0 {
                self_.errors.push(ProblemBehaviour { kind, sus: false });
            } else if multiplicativity >= 2.0 {
                self_.warnings.push(ProblemBehaviour { kind, sus: true });
            }
        }
        self_
    }
}

#[derive(Debug)]
pub struct ProblemBehaviour {
    pub kind: PbKind,
    /// Is this behaviour confirmed problem (false), or only suspicious (true)?
    pub sus: bool,
}

#[derive(Debug)]
pub enum PbKind {
    MatchingLoop {
        max_len: u32,
        idx: usize,
    },
    Multiplicative {
        qpat: QuantPat,
        multiplicativity: f64,
    },
}

impl ProblemBehaviour {
    pub fn kind_str(&self) -> &'static str {
        match &self.kind {
            PbKind::MatchingLoop { .. } => "matching loop",
            PbKind::Multiplicative { .. } => "multiplicative",
        }
    }

    pub fn detail(&self) -> String {
        match &self.kind {
            PbKind::MatchingLoop { max_len, .. } => format!("{max_len} iters"),
            PbKind::Multiplicative {
                multiplicativity, ..
            } => {
                format!("{multiplicativity:.1}x")
            }
        }
    }

    pub fn quant_pats(&self, parser: &Z3Parser, inst: &InstGraph) -> Vec<QuantPat> {
        match &self.kind {
            PbKind::MatchingLoop { idx, .. } => {
                let ml_data = inst.analysis.ml_data.as_ref().unwrap();
                ml_data.matching_loops[*idx].quants(parser, ml_data)
            }
            PbKind::Multiplicative { qpat, .. } => vec![*qpat],
        }
    }
}
