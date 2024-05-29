extern crate clap;
extern crate petgraph;

use std::collections::{HashMap, HashSet};

use clap::Parser;

use smt_log_parser::{parsers::z3::graph::{self, raw::RawInstGraph, RawNodeIndex}, LogParser, Z3Parser};

/// Parse Z3 SMT Logs and print out the nth dependencies of a list of
/// instantiations.
#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Args {

    /// The path to the smt log
    filename: std::path::PathBuf,

    /// Depth of dependencies to lookup
    #[arg(short, long, default_value_t = 1)]
    depth: u32,

    /// Whether to pretty print the output results
    #[arg(short, long, default_value_t = false)]
    pretty_print: bool
}

fn named_nodes<'a, I>(inst_graph: &'a RawInstGraph, parser: &'a Z3Parser, nodes : I)
                      -> impl Iterator<Item=(RawNodeIndex, &'a str)>  + 'a
  where I : Iterator<Item=RawNodeIndex> + 'a {
    nodes
        .filter_map(|node_id|
          if let graph::raw::NodeKind::Instantiation(inst) = inst_graph[node_id].kind() {
            Some((node_id,inst))
          } else {
             None
          })
        .filter_map(|(node_id, inst)| parser[parser[*inst].match_].kind.quant_idx().map(|v| (node_id, v)))
        .filter_map(|(node_id, quant_id)| parser[quant_id].kind.user_name().map(|v| (node_id, v)))
        .map(|(node_id, user_name)| (node_id, &parser[user_name]))
}

fn get_node_name<'a>(inst_graph: &'a RawInstGraph, parser: &'a Z3Parser, node_id : RawNodeIndex) -> Option<&'a str> {
    let inst =
        if let graph::raw::NodeKind::Instantiation(inst) = inst_graph[node_id].kind() {
            Some(inst)
          } else {
             None
          }?;
    let quant_id = parser[parser[*inst].match_].kind.quant_idx()?;
    let user_name = parser[quant_id].kind.user_name()?;
    Some(&parser[user_name])
}

/// Constructs a mapping from axioms to the immediately preceding axiom that produced a term that triggered them.
fn build_axiom_dependency_graph(parser: &Z3Parser) -> Result<HashMap<String, HashSet<String>>, smt_log_parser::Error> {
    let inst_graph = RawInstGraph::new(&parser)?;
    let node_name_map : HashMap<RawNodeIndex, String> =
        named_nodes(&inst_graph, &parser, inst_graph.node_indices())
        .map(|(n, v)| (n, v.into()))
        .collect();
    let mut node_dep_map: HashMap<String, HashSet<String>> = HashMap::new();

    for named_node in node_name_map.keys() {
        // perform a dfs and calculate all dependencies
        let mut seen_nodes : HashSet<RawNodeIndex> = HashSet::new();
        let mut stack = vec![*named_node];
        let mut dependent_nodes : HashSet<RawNodeIndex> = HashSet::new();

        while let Some(node) = stack.pop() {
            if !seen_nodes.insert(node) { continue; }
            for node in
                inst_graph
                .neighbors_directed(node, petgraph::Direction::Incoming) {
                    let is_named = get_node_name(&inst_graph, &parser, node).is_some();
                    // if this is a quantified axiom with a name, add it to the list of dependencies
                    if is_named { dependent_nodes.insert(node); }
                    // if we haven't seen it before, and it's not named
                    if !seen_nodes.contains(&node) && !is_named {
                        stack.push(node);
                    }
                }
        }

        let entry = node_dep_map.entry(node_name_map[named_node].clone());
        let dependent_node_names : HashSet<String> =
            dependent_nodes.into_iter()
            .filter(|v| node_name_map[v] != "constructor_accessor_axiom")
            .map(|v| node_name_map[&v].clone()).collect();
        entry.or_default().extend(dependent_node_names);
    }

    return Ok(node_dep_map);
}

/// extends the dependency graph by 1 transitive step
fn extend_by_transitive_deps(axiom_deps: &mut HashMap<String, HashSet<String>>) {
    for (axiom, deps) in axiom_deps.clone().into_iter() {
        for dep in deps {
            let extended_deps : HashSet<String> = axiom_deps.get(&dep).map(|v| v.clone()).unwrap_or_default();
            axiom_deps.get_mut(&axiom).unwrap().extend(extended_deps);
        }
    }
}

fn main() -> Result<(), String> {
    let args = Args::parse();

    let path = std::path::Path::new(&args.filename);
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

    for _ in 1 .. args.depth {
        extend_by_transitive_deps(&mut axiom_deps);
    }

    for (axiom, deps) in axiom_deps {
        if args.pretty_print {
            println!("axiom {} depends on {} axioms:", axiom, deps.len());
            for dep in deps {
                println!(" - {}", dep);
            }
        } else {
            let deps : Vec<String> = deps.into_iter().collect();
            println!("{}: {}", axiom,  deps.join(", "));
        }
    }

    return Ok(());
}
