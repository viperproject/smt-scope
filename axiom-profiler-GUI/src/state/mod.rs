use std::rc::Rc;

use smt_log_parser::formatter::TermDisplayContext;
use yew::{html, Callback, Children, Component, Context, Html, Properties, ContextProvider};

use crate::{configuration::{ConfigurationContext, TermDisplayContextFiles}, utils::updater::{Update, Updater}, RcParser};

// Public

#[derive(Clone, Default, PartialEq)]
pub struct State {
    pub file_info: Option<FileInfo>,
    /// Calculated automatically based on the set file_info.
    pub term_display: TermDisplayContext,
    pub parser: Option<RcParser>,
    pub ml_viewer_mode: bool,
}

#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, serde::Serialize, serde::Deserialize)]
pub struct FileInfo {
    pub name: String,
    pub size: u64,
}

#[derive(Clone, PartialEq)]
pub struct StateProvider {
    pub state: State,
    update: Updater<State, Option<StateUpdateKind>>,
}

impl StateProvider {
    pub fn update_file_info(&self, f: impl FnOnce(&mut Option<FileInfo>) -> bool + 'static) {
        self.update.update(|state| f(&mut state.file_info).then(|| StateUpdateKind::FileInfo));
    }
    pub fn update_parser(&self, f: impl FnOnce(&mut Option<RcParser>) -> bool + 'static) {
        self.update.update(|state| f(&mut state.parser).then(|| StateUpdateKind::Parser));
    }
    pub fn update_graph(&self, f: impl FnOnce(&mut RcParser) -> bool + 'static) {
        self.update.update(|state| state.parser.as_mut().map(f).unwrap_or_default().then(|| StateUpdateKind::Parser));
    }

    pub fn set_ml_viewer_mode(&self, ml_viewer_mode: bool) {
        self.update.update(move |state|
            (state.ml_viewer_mode != ml_viewer_mode).then(|| {
                state.ml_viewer_mode = ml_viewer_mode;
                StateUpdateKind::Parser
            })
        );
    }
}

pub trait StateContext {
    fn get_state(&self) -> Option<Rc<StateProvider>>;
}
impl<T: Component> StateContext for html::Scope<T> {
    fn get_state(&self) -> Option<Rc<StateProvider>> {
        self.context(Callback::noop()).map(|c| c.0)
    }
}

// Private

impl State {
    pub fn recalculate_term_display(&mut self, term_display: &TermDisplayContextFiles) {
        let mut general = term_display.general.clone();
        let per_file = self.file_info.as_ref().and_then(|info| term_display.per_file.get(info));
        if let Some(per_file) = per_file {
            general.extend(per_file);
        }
        self.term_display = general;
    }
}

mod private {
    pub enum StateUpdateKind {
        FileInfo,
        Parser,
    }
}
use private::StateUpdateKind;

#[derive(Properties, PartialEq)]
pub struct StateProviderProps {
    pub children: Children,
}

impl Component for StateProvider {
    type Message = Update<State, Option<StateUpdateKind>>;
    type Properties = StateProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let mut state = State::default();
        let cfg = ctx.link().get_configuration().unwrap();
        state.recalculate_term_display(&cfg.config.term_display);
        Self {
            state,
            update: Updater::new_link(ctx.link().clone()),
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let update = msg.apply(&mut self.state);
        if let Some(StateUpdateKind::FileInfo) = update {
            let cfg = ctx.link().get_configuration().unwrap();
            self.state.recalculate_term_display(&cfg.config.term_display);
        }
        update.is_some()
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <ContextProvider<Rc<Self>> context={Rc::new(self.clone())}>
                {for ctx.props().children.iter()}
            </ContextProvider<Rc<Self>>>
        }
    }
}
