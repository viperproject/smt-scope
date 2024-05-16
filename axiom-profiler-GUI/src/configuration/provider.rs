use std::{cell::RefCell, rc::Rc};

use gloo::{console::log, storage::Storage};
use smt_log_parser::display_with::DisplayConfiguration;
use yew::{html, prelude::{Context, Html}, Callback, Children, Component, ContextProvider, Properties};

use crate::RcParser;

// Public

pub trait ConfigurationContext {
    fn get_configuration(&self) -> Option<Rc<ConfigurationProvider>>;
}
impl<T: Component> ConfigurationContext for html::Scope<T> {
    fn get_configuration(&self) -> Option<Rc<ConfigurationProvider>> {
        self.context(Callback::noop()).map(|c| c.0)
    }
}

#[derive(Clone, PartialEq)]
pub struct ConfigurationProvider {
    pub config: Configuration,
    pub update: ConfigurationUpdater,
}
#[derive(Clone, PartialEq)]
pub struct ConfigurationUpdater(Callback<ConfigurationUpdate>);
impl ConfigurationUpdater {
    pub fn update(&self, f: impl for<'a> FnOnce(&'a mut Configuration) -> bool + 'static) {
        self.0.emit(ConfigurationUpdate::new(f));
    }
}
pub struct ConfigurationUpdate(Callback<&'static mut Configuration, bool>);
impl ConfigurationUpdate {
    fn new(f: impl for<'a> FnOnce(&'a mut Configuration) -> bool + 'static) -> Self {
        let f = RefCell::new(Some(f));
        let f = Callback::from(move |config|
            f.borrow_mut().take().unwrap()(config)
        );
        Self(f)
    }
    fn apply(self, config: &mut Configuration) -> bool {
        // SAFETY: the callback can only have been created with a
        // `impl for<'a> FnOnce(&'a mut Configuration) -> bool + 'static`, and thus
        // it cannot make use of the `&'static mut Configuration` lifetime.
        let config = unsafe { &mut *(config as *mut _) };
        self.0.emit(config)
    }
}

impl ConfigurationProvider {
    pub fn reset_persistent(&self) {
        self.update.update(|cfg| {
            let new = Default::default();
            if cfg.persistent != new {
                cfg.persistent = new;
                true
            } else {
                false
            }
        });
    }
    pub fn update_display(&self, f: impl FnOnce(&mut DisplayConfiguration) -> bool + 'static) {
        self.update.update(|cfg| f(&mut cfg.persistent.display));
    }pub fn update_parser(&self, f: impl FnOnce(&mut Option<RcParser>) -> bool + 'static) {
        self.update.update(|cfg| f(&mut cfg.parser));
    }
    pub fn reset_ml_viewer_mode(&self) {
        self.update.update(|cfg| {cfg.persistent.ml_viewer_mode = false; true});
    }
}

#[derive(Clone, Default, PartialEq, Eq)]
pub struct Configuration {
    pub parser: Option<RcParser>,
    pub persistent: PersistentConfiguration,
}

#[derive(Debug, Clone, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub struct PersistentConfiguration {
    pub display: DisplayConfiguration,
    pub ml_viewer_mode: bool, 
}
impl PersistentConfiguration {
    pub const fn default_const() -> Self {
        let display = DisplayConfiguration {
            display_term_ids: false,
            display_quantifier_name: false,
            use_mathematical_symbols: true,
            html: true,
            // Set manually elsewhere
            enode_char_limit: None,
            ast_depth_limit: None,
        };
        Self {
            display,
            ml_viewer_mode: false,
        }
    }
}

impl Default for PersistentConfiguration {
    fn default() -> Self {
        Self::default_const()
    }
}

// Private

#[derive(Properties, PartialEq)]
pub struct ConfigurationProviderProps {
    pub children: Children,
}

impl Component for ConfigurationProvider {
    type Message = ConfigurationUpdate;
    type Properties = ConfigurationProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let link = ctx.link().clone();
        let mut config = Configuration::default();
        if let Ok(cached) = gloo::storage::LocalStorage::get::<PersistentConfiguration>("config") {
            // log::warn!("ConfigurationProvider loaded: {cached:?}");
            config.persistent = cached;
            config.persistent.ml_viewer_mode = false;
        }
        let update = Callback::from(move |config| link.send_message(config));
        Self {
            config,
            update: ConfigurationUpdater(update),
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        // log::warn!("ConfigurationProvider update: {:?}/{:?}: {:?}", msg.parser.is_some(), msg.parser.as_ref().map(|p| p.graph.is_some()), msg.persistent);
        let changed = msg.apply(&mut self.config);
        if changed {
            gloo::storage::LocalStorage::set::<&PersistentConfiguration>("config", &self.config.persistent).ok();
        }
        changed
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        // log::warn!("ConfigurationProvider view: {:?}/{:?}", self.config.parser.is_some(), self.config.parser.as_ref().map(|p| p.graph.is_some()));
        html! {
            <ContextProvider<Rc<ConfigurationProvider>> context={Rc::new(self.clone())}>
                {ctx.props().children.clone()}
            </ContextProvider<Rc<ConfigurationProvider>>>
        }
    }
}
