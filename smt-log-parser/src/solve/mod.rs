use std::path::PathBuf;

pub struct Solver {
    solver: z3::Solver<'static>,
    ctx: Box<z3::Context>,
}

impl Solver {
    pub fn new(file: &PathBuf) -> Self {
        let mut cfg = z3::Config::new();
        cfg.set_bool_param_value("trace", true);
        cfg.set_bool_param_value("proof", true);
        let ctx = Box::new(z3::Context::new(&cfg));
        // SAFETY: The context is valid for the lifetime of this object and the
        // solver is private to this object. The solver is dropped before the
        // context.
        let ctx_ref = unsafe { &*(&*ctx as *const _) };
        let solver = z3::Solver::new(ctx_ref);
        solver.push();
        solver.pop(1);
        let file = std::fs::read_to_string(file).unwrap();
        solver.from_string(file);
        Solver { ctx, solver }
    }

    pub fn context<'a>(&'a self) -> &'a z3::Context {
        &self.ctx
    }

    pub fn solver<'a>(&'a self) -> &'a z3::Solver<'a> {
        &self.solver
    }
}
