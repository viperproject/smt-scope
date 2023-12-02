use serde::{Deserialize, Serialize};
use yew_agent::{HandlerId, Private, WorkerLink};
use viz_js::VizInstance;

pub struct Worker {
    link: WorkerLink<Self>,
}

#[derive(Serialize, Deserialize)]
pub struct WorkerInput {
    pub dot_file: String,
}

#[derive(Serialize, Deserialize)]
pub struct WorkerOutput {
    pub svg_text: String,
}

impl yew_agent::Worker for Worker {
    type Message = ();
    type Input = WorkerInput;
    type Output = WorkerOutput;
    type Reach = Private<Self>;

    fn create(link: WorkerLink<Self>) -> Self {
        Self { link }
    }

    fn update(&mut self, _msg: Self::Message) {
        // no messaging
    }

    fn handle_input(&mut self, msg: Self::Input, id: HandlerId) {
        // this runs in a web worker
        // and does not block the main
        // browser thread!
        let dot_file = msg.dot_file;
        let link = self.link.clone();
        wasm_bindgen_futures::spawn_local(async move {
            let graphviz = VizInstance::new().await;
            let options = viz_js::Options::default();
            // options.engine = "twopi".to_string();
            let svg = graphviz
                .render_svg_element(dot_file, options)
                .expect("Could not render graphviz");
            let svg_text = svg.outer_html();
            link.respond(id, Self::Output { svg_text } );
        });
    }

    fn name_of_resource() -> &'static str {
        "worker.js"
    }

    fn resource_path_is_relative() -> bool {
        true
    }
}
