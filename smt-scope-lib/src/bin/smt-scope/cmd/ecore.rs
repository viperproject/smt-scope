use std::path::PathBuf;

use petgraph::visit::Walker;
use smt_scope::{
    analysis::{
        raw::{IndexesInstGraph, NodeKind},
        InstGraph,
    },
    FxHashSet,
};

pub fn run(logfile: PathBuf) -> Result<(), String> {
    let parser = super::run_on_logfile(logfile)?;
    let inst_graph = InstGraph::new_lite(&parser).map_err(|e| format!("{e:?}"))?;
    for pidx in parser.proofs().keys() {
        if !parser.proves_false(pidx) {
            continue;
        }
        if inst_graph.raw[pidx].proof.under_hypothesis() {
            // not a proof of UNSAT, but rather of a lemma through contradiction
            continue;
        }
        let idx = pidx.index(&inst_graph.raw);
        let graph = inst_graph.raw.rev();
        let ancs = petgraph::visit::Dfs::new(graph, idx.0);

        print!("(");
        let mut first = true;
        let mut print = |name| {
            if !first {
                print!(" ");
            } else {
                first = false;
            }
            print!("{name}");
        };

        let (mut expected, mut seen) = (FxHashSet::default(), FxHashSet::default());
        for anc in ancs.iter(graph) {
            let pidx = match *inst_graph.raw.graph[anc].kind() {
                NodeKind::Instantiation(iidx) => {
                    let qidx = parser.get_inst(iidx).match_.kind.quant_idx();
                    if let Some(pidx) = qidx.and_then(|q| parser[q].blame) {
                        pidx
                    } else {
                        continue;
                    }
                }
                NodeKind::Proof(pidx) => pidx,
                _ => continue,
            };
            if !parser[pidx].kind.is_asserted() {
                continue;
            }

            if let Some(name) = parser.named_assert_to_variable(pidx) {
                seen.insert(name);
                let name = &parser[parser[name].result];
                assert!(name.child_ids.is_empty());
                print(&parser[name.app_name().unwrap()]);
            } else if parser.is_named_variable(pidx) {
                expected.insert(pidx);
            } else {
                print("unnamed");
            }
        }
        println!(")");
        debug_assert!(expected.is_subset(&seen), "Saw boolean name assertions without the corresponding named assertions: {expected:?} \\ {seen:?}!");
    }
    Ok(())
}
