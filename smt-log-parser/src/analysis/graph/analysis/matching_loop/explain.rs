use petgraph::graph::NodeIndex;

use crate::{
    items::{EqualityExpl, InstIdx},
    FxHashMap, Graph, Z3Parser,
};

use super::{MLGraphEdge, MLGraphNode, MlExplanation, MlOutput};

type InstGraphNodes = (NodeIndex, Vec<(NodeIndex, Vec<NodeIndex>)>);

impl Default for MlExplanation {
    fn default() -> Self {
        Self::new()
    }
}

impl MlExplanation {
    pub fn new() -> Self {
        Self {
            graph: Graph::with_capacity(0, 0),
        }
    }

    pub fn explain_leaf(&mut self, ml_out: &MlOutput, parser: &mut Z3Parser, leaf: InstIdx) {
        let iidx = ml_out.node_to_ml[&leaf].tree_above().next().unwrap();

        let leaf = &ml_out.node_to_ml[&iidx];
        let others_between = ml_out.others_between(iidx);
        let insts_map: FxHashMap<_, _> = others_between
            .into_iter()
            .map(|iidx| (iidx, self.add_inst(ml_out, parser, iidx)))
            .collect();
        let root = insts_map[&iidx].0;

        for (iidx, idata) in insts_map.iter() {
            self.add_dependencies(&*parser, *iidx, idata, |get_iidx| {
                if leaf.tree_above_contains(get_iidx) {
                    Some((root, true))
                } else {
                    insts_map.get(&get_iidx).map(|(node, _)| (*node, false))
                }
            });
        }
    }

    fn add_inst(
        &mut self,
        ml_out: &MlOutput,
        parser: &mut Z3Parser,
        iidx: InstIdx,
    ) -> InstGraphNodes {
        let inst = &ml_out.node_to_ml[&iidx];
        let sig = ml_out.ml_leaves[inst.ml_sig].0.clone();
        let gen_pat = parser
            .synth_terms
            .generalise_pattern(&parser.terms, sig.pattern)
            .unwrap();
        let node = MLGraphNode::QI(sig, gen_pat);
        let node = self.graph.add_node(node);
        let generalisation = inst
            .generalisation
            .iter()
            .map(|gen| {
                let enode = self.graph.add_node(MLGraphNode::ENode(gen.enode));
                let mut last_node = enode;
                let equalities: Vec<_> = gen
                    .equalities
                    .iter()
                    .map(|&(from, to)| {
                        let equality = self.graph.add_node(MLGraphNode::Equality(from, to));
                        self.graph
                            .add_edge(last_node, equality, MLGraphEdge::BlameRewrite);
                        last_node = equality;
                        equality
                    })
                    .collect();
                self.graph.add_edge(last_node, node, MLGraphEdge::Blame);
                (enode, equalities)
            })
            .collect();
        (node, generalisation)
    }

    fn add_dependencies(
        &mut self,
        parser: &Z3Parser,
        iidx: InstIdx,
        idata: &InstGraphNodes,
        insts_map: impl Fn(InstIdx) -> Option<(NodeIndex, bool)>,
    ) {
        let inst = &parser[iidx];
        let match_ = &parser[inst.match_];
        for (i, tm) in match_.trigger_matches().enumerate() {
            let curr_idata = &idata.1[i];

            let tm_enode = tm.enode();
            let blame = &parser[tm_enode];
            if let Some(created_by) = blame.created_by {
                if let Some((created_by, rec)) = insts_map(created_by) {
                    self.graph
                        .add_edge(created_by, curr_idata.0, MLGraphEdge::Yield(rec));
                }
            }

            for (i, eq) in tm
                .equalities()
                .filter(|&eq| parser[eq].given_len > 0)
                .enumerate()
            {
                parser.egraph.walk_trans(eq, |given, _| {
                    let EqualityExpl::Literal { eq, .. } = &parser[given] else {
                        return;
                    };
                    let eq = &parser[*eq];
                    if let Some((created_by, rec)) = eq.created_by.and_then(&insts_map) {
                        self.graph
                            .add_edge(created_by, curr_idata.1[i], MLGraphEdge::YieldEq(rec));
                    }
                    // else {
                    //     let fixed = self.graph.add_node(MLGraphNode::FixedEquality(eq.owner));
                    //     self.graph
                    //         .add_edge(fixed, curr_idata.1[i], MLGraphEdge::FixedEquality);
                    // }
                });
            }
        }
    }
}
