use fxhash::{FxHashMap, FxHashSet};
use petgraph::visit::{Dfs, EdgeFiltered, EdgeRef, Reversed, Visitable, Walker};
use std::path::PathBuf;

use smt_log_parser::{
    analysis::{raw::IndexesInstGraph, InstGraph, RawNodeIndex},
    items::InstIdx,
    LogParser, Z3Parser,
};

pub fn run(logfile: PathBuf, depth: u32, pretty_print: bool) -> Result<(), String> {
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
    let mut axiom_deps = build_axiom_dependency_graph(&parser, &inst_graph);

    for _ in 1..depth {
        extend_by_transitive_deps(&mut axiom_deps);
    }

    for (axiom, deps) in axiom_deps {
        if pretty_print {
            println!("axiom {} depends on {} axioms:", axiom, deps.len());
            for dep in deps {
                println!(" - {}", dep);
            }
        } else {
            let deps: Vec<&str> = deps.into_iter().collect();
            println!("{} = {}", axiom, deps.join(", "));
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

/// Constructs a mapping from axioms to the immediately preceding axiom that produced a term that triggered them.
fn build_axiom_dependency_graph<'a>(
    parser: &'a Z3Parser,
    inst_graph: &InstGraph,
) -> FxHashMap<&'a str, FxHashSet<&'a str>> {
    let node_name_map: FxHashMap<InstIdx, &str> = named_instantiations(parser).collect();
    let mut node_dep_map: FxHashMap<&str, FxHashSet<&str>> = FxHashMap::default();

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
        entry.or_default().extend(dependent_on);
    }

    node_dep_map
}

/// Extends the dependency graph by 1 transitive step
fn extend_by_transitive_deps(axiom_deps: &mut FxHashMap<&str, FxHashSet<&str>>) {
    let old_deps = axiom_deps.clone();
    for (axiom, deps) in &old_deps {
        for dep in deps {
            if let Some(extended_deps) = old_deps.get(dep) {
                axiom_deps.get_mut(axiom).unwrap().extend(extended_deps);
            }
        }
    }
}
