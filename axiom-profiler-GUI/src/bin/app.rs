fn main() {
    std::panic::set_hook(Box::new(console_error_panic_hook::hook));
    wasm_logger::init(wasm_logger::Config::default());
    // yew::Renderer::<Main>::new().render();
    yew::Renderer::<axiom_profiler_gui::App>::new().render();
}
