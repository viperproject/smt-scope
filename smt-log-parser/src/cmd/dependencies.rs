use std::path::PathBuf;
use fxhash::{FxHashMap, FxHashSet};

use smt_log_parser::{
    analysis::{
        raw::{NodeKind, RawInstGraph},
        RawNodeIndex,
    },
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
    let mut axiom_deps = build_axiom_dependency_graph(&parser).map_err(|e| format!("{:?}", e))?;

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
            let deps: Vec<String> = deps.into_iter().collect();
            println!("{} = {}", axiom, deps.join(", "));
        }
    }

    Ok(())
}

/// Given an iterator over nodes in the instantiation graph, filters
/// this iterator by those nodes that correspond to quantifiers with
/// user names
fn named_nodes<'a, I>(
    inst_graph: &'a RawInstGraph,
    parser: &'a Z3Parser,
    nodes: I,
) -> impl Iterator<Item = (RawNodeIndex, &'a str)> + 'a
where
    I: Iterator<Item = RawNodeIndex> + 'a,
{
    nodes
        .filter_map(|node_id| {
            if let NodeKind::Instantiation(inst) = inst_graph[node_id].kind() {
                Some((node_id, inst))
            } else {
                None
            }
        })
        .filter_map(|(node_id, inst)| {
            parser[parser[*inst].match_]
                .kind
                .quant_idx()
                .map(|v| (node_id, v))
        })
        .filter_map(|(node_id, quant_id)| parser[quant_id].kind.user_name().map(|v| (node_id, v)))
        .map(|(node_id, user_name)| (node_id, &parser[user_name]))
}

/// Given a node in the instantiation graph, attempts to retrieve the
/// user name associated with it, assuming that it is a
/// quantifier. (Returns None otherwise).
fn get_node_name<'a>(
    inst_graph: &'a RawInstGraph,
    parser: &'a Z3Parser,
    node_id: RawNodeIndex,
) -> Option<&'a str> {
    let inst = if let NodeKind::Instantiation(inst) = inst_graph[node_id].kind() {
        Some(inst)
    } else {
        None
    }?;
    let quant_id = parser[parser[*inst].match_].kind.quant_idx()?;
    let user_name = parser[quant_id].kind.user_name()?;
    Some(&parser[user_name])
}

/// Constructs a mapping from axioms to the immediately preceding axiom that produced a term that triggered them.
fn build_axiom_dependency_graph(
    parser: &Z3Parser,
) -> Result<FxHashMap<String, FxHashSet<String>>, smt_log_parser::Error> {
    let inst_graph = RawInstGraph::new(&parser)?;
    let node_name_map: FxHashMap<RawNodeIndex, String> =
        named_nodes(&inst_graph, &parser, inst_graph.node_indices())
            .map(|(n, v)| (n, v.into()))
            .collect();
    let mut node_dep_map: FxHashMap<String, FxHashSet<String>> = FxHashMap::default();

    for named_node in node_name_map.keys() {
        // perform a dfs and calculate all dependencies
        let mut seen_nodes: FxHashSet<RawNodeIndex> = FxHashSet::default();
        let mut stack = vec![*named_node];
        let mut dependent_nodes: FxHashSet<RawNodeIndex> = FxHashSet::default();

        while let Some(node) = stack.pop() {
            if !seen_nodes.insert(node) {
                continue;
            }
            for node in inst_graph.neighbors_directed(node, petgraph::Direction::Incoming) {
                let is_named = get_node_name(&inst_graph, &parser, node).is_some();
                // if this is a quantified axiom with a name, add it to the list of dependencies
                if is_named {
                    dependent_nodes.insert(node);
                }
                // if we haven't seen it before, and it's not named
                if !seen_nodes.contains(&node) && !is_named {
                    stack.push(node);
                }
            }
        }

        let entry = node_dep_map.entry(node_name_map[named_node].clone());
        let dependent_node_names: FxHashSet<String> = dependent_nodes
            .into_iter()
            .filter(|v| node_name_map[v] != "constructor_accessor_axiom")
            .map(|v| node_name_map[&v].clone())
            .collect();
        entry.or_default().extend(dependent_node_names);
    }

    return Ok(node_dep_map);
}

/// extends the dependency graph by 1 transitive step
fn extend_by_transitive_deps(axiom_deps: &mut FxHashMap<String, FxHashSet<String>>) {
    for (axiom, deps) in axiom_deps.clone().into_iter() {
        for dep in deps {
            let extended_deps: FxHashSet<String> =
                axiom_deps.get(&dep).map(|v| v.clone()).unwrap_or_default();
            axiom_deps.get_mut(&axiom).unwrap().extend(extended_deps);
        }
    }
}
