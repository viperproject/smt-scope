use std::rc::Rc;

use smt_log_parser::formatter::TermDisplayContext;
use yew::{
    html, Callback, Children, Component, Context, ContextHandle, ContextProvider, Html, Properties,
};

use crate::{
    configuration::{ConfigurationContext, ConfigurationProvider, TermDisplayContextFiles},
    utils::updater::{Update, Updater},
    RcParser,
};

// Public

#[derive(Clone, Default, PartialEq)]
pub struct State {
    pub file_info: Option<FileInfo>,
    /// Calculated automatically based on the set file_info.
    pub term_display: TermDisplayContext,
    pub parser: Option<RcParser>,
    // TODO: rework mode system (put it under the same Option as file_info?)
    pub ml_viewer_mode: bool,
    pub overlay_visible: bool,
}

#[derive(
    Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, serde::Serialize, serde::Deserialize,
)]
pub struct FileInfo {
    pub name: String,
    pub size: Option<u64>,
}

#[derive(Clone, PartialEq)]
pub struct StateProvider {
    pub state: State,
    update: Updater<State, StateUpdateKind>,
}

impl StateProvider {
    pub fn update_file_info(&self, f: impl FnOnce(&mut Option<FileInfo>) -> bool + 'static) {
        self.update
            .update(|state| StateUpdateKind::file_info(f(&mut state.file_info)));
    }
    pub fn update_parser(&self, f: impl FnOnce(&mut Option<RcParser>) -> bool + 'static) {
        self.update
            .update(|state| StateUpdateKind::parser(f(&mut state.parser)));
    }
    pub fn update_graph(&self, f: impl FnOnce(&mut RcParser) -> bool + 'static) {
        self.update_parser(move |parser| parser.as_mut().map(f).unwrap_or_default());
    }

    pub fn set_ml_viewer_mode(&self, ml_viewer_mode: bool) {
        self.update.update(move |state| {
            let other = state.ml_viewer_mode != ml_viewer_mode;
            state.ml_viewer_mode = ml_viewer_mode;
            StateUpdateKind::other(other)
        });
    }
    pub fn set_overlay_visible(&self, overlay_visible: bool) {
        self.update.update(move |state| {
            let other = state.overlay_visible != overlay_visible;
            state.overlay_visible = overlay_visible;
            StateUpdateKind::other(other)
        });
    }

    pub fn close_file(&self) {
        self.update.update(|state| {
            let file_info = state.file_info.take().is_some();
            let parser = state.parser.take().is_some();
            let other = state.ml_viewer_mode;
            state.ml_viewer_mode = false;
            StateUpdateKind {
                file_info,
                parser,
                other,
            }
        });
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
        let per_file = self
            .file_info
            .as_ref()
            .and_then(|info| term_display.per_file.get(&info.name));
        if let Some(per_file) = per_file {
            general.extend(per_file);
        }
        self.term_display = general;
    }
}

mod private {
    #[derive(Default)]
    pub struct StateUpdateKind {
        pub file_info: bool,
        pub parser: bool,
        pub other: bool,
    }
    impl StateUpdateKind {
        pub fn file_info(file_info: bool) -> Self {
            Self {
                file_info,
                ..Default::default()
            }
        }
        pub fn parser(parser: bool) -> Self {
            Self {
                parser,
                ..Default::default()
            }
        }
        pub fn other(other: bool) -> Self {
            Self {
                other,
                ..Default::default()
            }
        }
        pub fn any(&self) -> bool {
            self.file_info || self.parser || self.other
        }
    }
}
use private::StateUpdateKind;

pub struct StateProviderContext {
    state: StateProvider,
    _handle: ContextHandle<Rc<ConfigurationProvider>>,
}

#[derive(Properties, PartialEq)]
pub struct StateProviderProps {
    pub children: Children,
}

pub enum Msg {
    Update(Update<State, StateUpdateKind>),
    ConfigChanged(Rc<ConfigurationProvider>),
}

impl Component for StateProviderContext {
    type Message = Msg;
    type Properties = StateProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let mut state = State::default();
        let (cfg, _handle) = ctx
            .link()
            .context(ctx.link().callback(Msg::ConfigChanged))
            .unwrap();
        state.recalculate_term_display(&cfg.config.term_display);
        Self {
            state: StateProvider {
                state,
                update: Updater::new(ctx.link().callback(Msg::Update)),
            },
            _handle,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Update(update) => {
                let update = update.apply(&mut self.state.state);
                if update.file_info {
                    let cfg = ctx.link().get_configuration().unwrap();
                    self.state
                        .state
                        .recalculate_term_display(&cfg.config.term_display);
                }
                update.any()
            }
            Msg::ConfigChanged(cfg) => {
                self.state
                    .state
                    .recalculate_term_display(&cfg.config.term_display);
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <ContextProvider<Rc<StateProvider>> context={Rc::new(self.state.clone())}>
                {for ctx.props().children.iter()}
            </ContextProvider<Rc<StateProvider>>>
        }
    }
}
