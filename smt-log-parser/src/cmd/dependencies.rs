use fxhash::{FxHashMap, FxHashSet};
use petgraph::visit::{Dfs, EdgeFiltered, EdgeRef, Reversed, Visitable, Walker};
use std::path::PathBuf;

use smt_log_parser::{
    analysis::{raw::IndexesInstGraph, InstGraph, RawNodeIndex},
    items::InstIdx,
    LogParser, Z3Parser,
};

pub fn run(logfile: PathBuf, depth: Option<u32>, pretty_print: bool) -> Result<(), String> {
    let path = std::path::Path::new(&logfile);
    let filename = path
        .file_name()
        .map(|f| f.to_string_lossy())
        .unwrap_or_default();

    if !path.is_file() {
        return Err(format!("path {filename} did not point to a file"));
    }

    let (_metadata, parser) = Z3Parser::from_file(path).unwrap();
    let parser = parser.process_all().map_err(|e| e.to_string())?;
    let inst_graph = InstGraph::new(&parser).map_err(|e| format!("{e:?}"))?;
    let (total, axiom_deps) = build_axiom_dependency_graph(&parser, &inst_graph);

    if depth.is_some_and(|depth| depth == 1) {
        // TODO: deduplicate
        for (axiom, (count, deps)) in axiom_deps {
            let percentage = 100.0 * count as f64 / total as f64;
            let total = deps.values().sum::<usize>() as f64;
            if pretty_print {
                println!(
                    "axiom {axiom} ({percentage:.1}%) depends on {} axioms:",
                    deps.len()
                );
                for (dep, count) in deps {
                    let percentage = 100.0 * count as f64 / total;
                    println!(" - {dep} ({percentage:.1}%)");
                }
            } else {
                let deps: Vec<String> = deps
                    .into_iter()
                    .map(|(dep, count)| {
                        let percentage = 100.0 * count as f64 / total;
                        format!("{dep} ({percentage:.1}%)")
                    })
                    .collect();
                println!("{axiom} ({percentage:.1}%) = {}", deps.join(", "));
            }
        }
        return Ok(());
    }

    let mut axiom_deps = axiom_deps
        .into_iter()
        .map(|(k, (count, v))| (k, (count, v.into_keys().collect::<FxHashSet<_>>())))
        .collect::<FxHashMap<_, _>>();

    match depth {
        Some(depth) => {
            for _ in 1..depth {
                extend_by_transitive_deps(&mut axiom_deps);
            }
        }
        None => while extend_by_transitive_deps(&mut axiom_deps) {},
    }

    for (axiom, (count, deps)) in axiom_deps {
        let percentage = count as f64 / total as f64 * 100.0;
        if pretty_print {
            println!(
                "axiom {axiom} ({percentage:.1}%) depends on {} axioms:",
                deps.len()
            );
            for dep in deps {
                println!(" - {dep}");
            }
        } else {
            let deps: Vec<&str> = deps.into_iter().collect();
            println!("{axiom} ({percentage:.1}%) = {}", deps.join(", "));
        }
    }

    Ok(())
}

/// Returns an iterator over all instantiations of a quantifier that
/// have a user name.
fn named_instantiations(parser: &Z3Parser) -> impl Iterator<Item = (InstIdx, &'_ str)> + '_ {
    parser
        .instantiations()
        .filter_map(|(idx, inst)| parser[inst.match_].kind.quant_idx().map(|v| (idx, v)))
        .filter_map(|(idx, quant_id)| parser[quant_id].kind.user_name().map(|v| (idx, &parser[v])))
}

pub type DependencyMap<'a> = FxHashMap<&'a str, (usize, FxHashMap<&'a str, usize>)>;

/// Constructs a mapping from axioms to the immediately preceding axiom that produced a term that triggered them.
fn build_axiom_dependency_graph<'a>(
    parser: &'a Z3Parser,
    inst_graph: &InstGraph,
) -> (usize, DependencyMap<'a>) {
    let node_name_map: FxHashMap<InstIdx, &str> = named_instantiations(parser).collect();
    let total = node_name_map.len();
    let mut node_dep_map: FxHashMap<&str, (usize, FxHashMap<&str, usize>)> = FxHashMap::default();

    for (idx, name) in &node_name_map {
        let named_node = idx.index(&inst_graph.raw);
        // We will be removing these edges in the `filtered` graph so need to
        // start the DFS from the parents.
        let parents = inst_graph
            .raw
            .graph
            .neighbors_directed(named_node.0, petgraph::Direction::Incoming)
            .collect();
        // Start a DFS from all the parents of the named node.
        let dfs = Dfs::from_parts(parents, inst_graph.raw.graph.visit_map());

        // A graph without the edges leading to named nodes. This will prevent
        // the DFS from walking past such nodes.
        let filtered = EdgeFiltered::from_fn(&*inst_graph.raw.graph, |edge| {
            !inst_graph.raw[RawNodeIndex(edge.target())]
                .kind()
                .inst()
                .is_some_and(|inst| node_name_map.contains_key(&inst))
        });
        // Walk the graph in reverse (i.e. using Incoming edges) and filter only
        // the leaf nodes.
        let dependent_on = dfs
            .iter(Reversed(&filtered))
            .map(RawNodeIndex)
            .filter_map(|node| inst_graph.raw[node].kind().inst())
            .filter_map(|inst| node_name_map.get(&inst).copied());

        let entry = node_dep_map.entry(name);
        let entry = entry.or_default();
        entry.0 += 1;
        for dependent_on in dependent_on {
            *entry.1.entry(dependent_on).or_default() += 1;
        }
    }

    (total, node_dep_map)
}

/// Extends the dependency graph by 1 transitive step
fn extend_by_transitive_deps(axiom_deps: &mut FxHashMap<&str, (usize, FxHashSet<&str>)>) -> bool {
    let old_deps = axiom_deps.clone();
    let old_cnt: FxHashMap<&str, usize> = axiom_deps
        .iter()
        .map(|(name, (_, deps))| (*name, deps.len()))
        .collect();
    for (axiom, (_, deps)) in &old_deps {
        for dep in deps {
            if let Some((_, extended_deps)) = old_deps.get(dep) {
                axiom_deps.get_mut(axiom).unwrap().1.extend(extended_deps);
            }
        }
    }

    let mut any_changes = false;
    for (k, (_, elts)) in axiom_deps.iter() {
        let old_cnt = old_cnt[k];
        if old_cnt != elts.len() {
            any_changes = true;
            break;
        }
    }
    any_changes
}
