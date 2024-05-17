use smt_log_parser::parsers::z3::{graph::Graph, z3parser::Z3Parser};
use smt_log_parser::parsers::LogParser;
use std::{env, time::Duration};
use wasm_timer::Instant;

fn main() {
    let args: Vec<String> = env::args().collect();
    let filenames = &args[1..];

    for path in &*filenames {
        let path = std::path::Path::new(path);
        let filename = path
            .file_name()
            .map(|f| f.to_string_lossy())
            .unwrap_or_default();
        if !path.is_file() {
            println!("Skipping {filename:?}");
            continue;
        }
        println!("Parsing {filename:?}");
        let time = Instant::now();
        // // Use to test max loading speed
        // let file = std::fs::read_to_string(path).unwrap();
        // let len = file.chars().filter(|c| *c == '\n').count();
        // let parsed = StreamParser::parse_entire_string(&file, Duration::from_secs_f32(10.0));
        let to = Duration::from_secs_f32(15.0);
        let (_metadata, parser) = Z3Parser::from_file(path).unwrap();
        let (timeout, result) = parser.process_all_timeout(to);
        let elapsed_time = time.elapsed();
        println!(
            "{} parsing after {} seconds (timeout {timeout:?})",
            if timeout.is_timeout() { "Timeout" } else { "Finished" }, elapsed_time.as_secs_f32()
        );
        let inst_graph = Graph::new(&result).unwrap();
        let _displayed = inst_graph.to_visible();
        let process_time = time.elapsed();
        println!(
            "Finished analysing after {} seconds",
            (process_time - elapsed_time).as_secs_f32()
        );

        // result.save_output_to_files(&settings, &time);
        // let render_engine = GraphVizRender;
        // let _svg_result = render_engine.make_svg(OUT_DOT, OUT_SVG);
        // add_link_to_svg(OUT_SVG, OUT_SVG_2);
        // println!(
        //     "Finished render sequence after {} seconds",
        //     time.elapsed().as_secs_f32()
        // );

        // let elapsed_time = time.elapsed();
        // println!("Done, run took {} seconds.", elapsed_time.as_secs_f32());
    }
}
