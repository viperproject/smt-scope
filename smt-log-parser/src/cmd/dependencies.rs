use std::path::PathBuf;

use smt_log_parser::{
    analysis::{InstGraph, QuantifierAnalysis},
    items::QuantIdx,
    Z3Parser,
};

pub fn run(logfile: PathBuf, depth: Option<u32>, pretty_print: bool) -> Result<(), String> {
    let parser = super::run_on_logfile(logfile)?;
    let mut inst_graph = InstGraph::new(&parser).map_err(|e| format!("{e:?}"))?;
    inst_graph.initialise_inst_succs_and_preds(&parser);

    let qanalysis = QuantifierAnalysis::new(&parser, &inst_graph);
    let total_costs = qanalysis.total_costs();
    fn get_quant_name(parser: &Z3Parser, qidx: QuantIdx) -> Option<&str> {
        parser[qidx].kind.user_name().map(|name| &parser[name])
    }

    if depth.is_some_and(|depth| depth == 0) {
        // TODO: deduplicate
        for (qidx, info) in qanalysis.iter_enumerated() {
            let Some(name) = get_quant_name(&parser, qidx) else {
                continue;
            };
            let percentage = (100.0 * info.costs) / total_costs as f64;
            let total = info.direct_deps.values().sum::<u32>() as f64;
            let named = || {
                info.direct_deps.iter().flat_map(|(ddep, count)| {
                    get_quant_name(&parser, *ddep).map(|name| (name, *count))
                })
            };
            if pretty_print {
                let named_count = named().count();
                if info.direct_deps.len() == named_count {
                    println!("axiom {name} ({percentage:.1}%) depends on {named_count} axioms:");
                } else {
                    println!(
                        "axiom {name} ({percentage:.1}%) depends on {} axioms, of those {named_count} are named:",
                        info.direct_deps.len(),
                    );
                }
                for (dep, count) in named() {
                    let percentage = 100.0 * count as f64 / total;
                    println!(" - {dep} ({percentage:.1}%)");
                }
            } else {
                let deps: Vec<String> = named()
                    .map(|(dep, count)| {
                        let percentage = 100.0 * count as f64 / total;
                        format!("{dep} ({percentage:.1}%)")
                    })
                    .collect();
                let named_count = deps.len();
                if info.direct_deps.len() == named_count {
                    println!("{name} ({percentage:.1}%) -> {}", deps.join(", "));
                } else {
                    println!(
                        "{name} ({percentage:.1}%), {named_count}/{} named -> {}",
                        info.direct_deps.len(),
                        deps.join(", ")
                    );
                }
            }
        }
        return Ok(());
    }

    let trans = qanalysis.calculate_transitive(depth);

    for (qidx, deps) in trans.iter_enumerated() {
        let info = &qanalysis[qidx];
        let Some(name) = get_quant_name(&parser, qidx) else {
            continue;
        };
        let percentage = (100.0 * info.costs as f64) / total_costs as f64;
        let named = || deps.iter().flat_map(|ddep| get_quant_name(&parser, *ddep));
        if pretty_print {
            println!(
                "axiom {name} ({percentage:.1}%) depends on {} axioms:",
                deps.len()
            );
            for dep in named() {
                println!(" - {dep}");
            }
        } else {
            let deps: Vec<_> = named().collect();
            println!("{name} ({percentage:.1}%) = {}", deps.join(", "));
        }
    }

    Ok(())
}
