use std::rc::Rc;

use yew::{Callback, Component, Context, Html, Properties};

use super::{
    enums::ScreenMessage,
    extra::{Omnibox, Sidebar, Topbar},
    ManagerM, Screen,
};

#[derive(Properties, Clone)]
pub struct ManagerProps<S: Screen> {
    pub sidebar: Callback<Rc<Sidebar>>,
    pub topbar: Callback<Rc<Topbar>>,
    pub omnibox: Callback<Rc<Omnibox>>,
    pub initial: S::Properties,
}

impl<S: Screen> PartialEq for ManagerProps<S> {
    fn eq(&self, other: &Self) -> bool {
        self.sidebar == other.sidebar
            && self.topbar == other.topbar
            && self.omnibox == other.omnibox
            && self.initial == other.initial
    }
}

pub struct ScreenManager<S: Screen> {
    sidebar: Rc<Sidebar>,
    topbar: Rc<Topbar>,
    omnibox: Rc<Omnibox>,
    screen: S,
}

impl<S: Screen> Component for ScreenManager<S> {
    type Message = ManagerM;
    type Properties = ManagerProps<S>;
    fn create(ctx: &Context<Self>) -> Self {
        let props = &ctx.props().initial;
        let screen = S::create(ctx.link(), props);
        let sidebar = Rc::new(screen.view_sidebar(ctx.link(), props));
        ctx.props().sidebar.emit(Rc::clone(&sidebar));
        let topbar = Rc::new(screen.view_topbar(ctx.link(), props));
        ctx.props().topbar.emit(Rc::clone(&topbar));
        let omnibox = Rc::new(screen.view_omnibox(ctx.link(), props));
        ctx.props().omnibox.emit(Rc::clone(&omnibox));
        Self {
            sidebar,
            topbar,
            omnibox,
            screen,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        // Do not use old props as they may have been rejected are aren't up to
        // date, use `self.screen.as_change()` instead.

        // let old_props = self.screen.as_change();
        self.screen
            .changed(ctx.link(), &ctx.props().initial, &old_props.initial)
        // if changed {
        //     log::info!("Manager changed {:?} -> {:?}", old_props.name(), ctx.props().initial.name());
        // }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let props = &ctx.props().initial;
        let msg = match S::Message::try_from(msg) {
            Ok(msg) => msg,
            Err(msg) => {
                log::error!(
                    "Got message for screen {:?} while on screen {:?}! Ignoring.",
                    msg.name(),
                    S::Message::name()
                );
                return false;
            }
        };
        let changed = self.screen.update(ctx.link(), props, msg);
        if !changed {
            return changed;
        }

        let sidebar = self.screen.view_sidebar(ctx.link(), props);
        if *self.sidebar != sidebar {
            self.sidebar = Rc::new(sidebar);
            ctx.props().sidebar.emit(Rc::clone(&self.sidebar));
        }
        let topbar = self.screen.view_topbar(ctx.link(), props);
        if *self.topbar != topbar {
            self.topbar = Rc::new(topbar);
            ctx.props().topbar.emit(Rc::clone(&self.topbar));
        }
        let omnibox = self.screen.view_omnibox(ctx.link(), props);
        if *self.omnibox != omnibox {
            self.omnibox = Rc::new(omnibox);
            ctx.props().omnibox.emit(Rc::clone(&self.omnibox));
        }

        changed
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        self.screen.view(ctx.link(), &ctx.props().initial)
    }

    fn rendered(&mut self, ctx: &Context<Self>, first_render: bool) {
        self.screen
            .rendered(ctx.link(), &ctx.props().initial, first_render);
    }

    fn prepare_state(&self) -> Option<String> {
        self.screen.prepare_state()
    }

    fn destroy(&mut self, ctx: &Context<Self>) {
        self.screen.destroy(ctx.link(), &ctx.props().initial);
        ctx.props().sidebar.emit(Default::default());
        ctx.props().topbar.emit(Default::default());
        ctx.props().omnibox.emit(Default::default());
    }
}
