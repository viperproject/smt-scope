use std::rc::Rc;

use gloo::storage::Storage;
use yew::{
    html,
    prelude::{Context, Html},
    Callback, Children, Component, ContextProvider, Properties,
};

use crate::utils::updater::{Update, Updater};

use super::Configuration;

// Public

#[derive(Clone, PartialEq)]
pub struct ConfigurationProvider {
    pub config: Configuration,
    pub update: Updater<Configuration>,
}

pub trait ConfigurationContext {
    fn get_configuration(&self) -> Option<Rc<ConfigurationProvider>>;
}
impl<T: Component> ConfigurationContext for html::Scope<T> {
    fn get_configuration(&self) -> Option<Rc<ConfigurationProvider>> {
        self.context(Callback::noop()).map(|c| c.0)
    }
}

// Private

#[derive(Properties, PartialEq)]
pub struct ConfigurationProviderProps {
    pub children: Children,
}

impl Component for ConfigurationProvider {
    type Message = Update<Configuration>;
    type Properties = ConfigurationProviderProps;

    fn create(ctx: &Context<Self>) -> Self {
        let config = gloo::storage::LocalStorage::get::<Configuration>("config");
        match &config {
            Ok(_) | Err(gloo::storage::errors::StorageError::KeyNotFound(_)) => {}
            Err(result) => log::error!("Configuration load error: {result:?}"),
        }

        let config = config.unwrap_or_default();
        Self {
            config,
            update: Updater::new_link(ctx.link().clone()),
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Self::Message) -> bool {
        let changed = msg.apply(&mut self.config);
        if changed {
            let result = gloo::storage::LocalStorage::set::<&Configuration>("config", &self.config);
            if let Err(result) = result {
                log::error!("Configuration save error: {result:?}");
            }
        }
        changed
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <ContextProvider<Rc<Self>> context={Rc::new(self.clone())}>
                {for ctx.props().children.iter()}
            </ContextProvider<Rc<Self>>>
        }
    }
}
