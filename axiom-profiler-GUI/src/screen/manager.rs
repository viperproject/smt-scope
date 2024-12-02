use std::rc::Rc;

use yew::{Callback, Component, Context, Html, Properties};

use super::{
    extra::{Omnibox, Sidebar, Topbar},
    Change, Manager, ManagerM, ScreenKind,
};

pub type ManagerInner = ScreenManager;

#[derive(Properties, Clone, PartialEq)]
pub struct ManagerProps {
    pub sidebar: Callback<Rc<Sidebar>>,
    pub topbar: Callback<Rc<Topbar>>,
    pub omnibox: Callback<Rc<Omnibox>>,
    pub initial: Change,
}

pub struct ScreenManager {
    sidebar: Rc<Sidebar>,
    topbar: Rc<Topbar>,
    omnibox: Rc<Omnibox>,
    screen: ScreenKind,
}

impl Component for Manager {
    type Message = ManagerM;
    type Properties = ManagerProps;
    fn create(ctx: &Context<Self>) -> Self {
        let screen = ctx.props().initial.clone().create(ctx.link());
        let sidebar = Rc::new(screen.view_sidebar(ctx.link()));
        ctx.props().sidebar.emit(Rc::clone(&sidebar));
        let topbar = Rc::new(screen.view_topbar(ctx.link()));
        ctx.props().topbar.emit(Rc::clone(&topbar));
        let omnibox = Rc::new(screen.view_omnibox(ctx.link()));
        ctx.props().omnibox.emit(Rc::clone(&omnibox));
        Self(ManagerInner {
            sidebar,
            topbar,
            omnibox,
            screen,
        })
    }

    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        // Do not use old props as they may have been rejected are aren't up to
        // date, use `self.0.screen.as_change()` instead.

        // let old_props = self.0.screen.as_change();
        self.0.screen.changed(ctx.link(), &ctx.props().initial)
        // if changed {
        //     log::info!("Manager changed {:?} -> {:?}", old_props.name(), ctx.props().initial.name());
        // }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let changed = self.0.screen.update(ctx.link(), msg);
        if !changed {
            return changed;
        }

        let sidebar = self.0.screen.view_sidebar(ctx.link());
        if *self.0.sidebar != sidebar {
            self.0.sidebar = Rc::new(sidebar);
            ctx.props().sidebar.emit(Rc::clone(&self.0.sidebar));
        }
        let topbar = self.0.screen.view_topbar(ctx.link());
        if *self.0.topbar != topbar {
            self.0.topbar = Rc::new(topbar);
            ctx.props().topbar.emit(Rc::clone(&self.0.topbar));
        }
        let omnibox = self.0.screen.view_omnibox(ctx.link());
        if *self.0.omnibox != omnibox {
            self.0.omnibox = Rc::new(omnibox);
            ctx.props().omnibox.emit(Rc::clone(&self.0.omnibox));
        }

        changed
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        self.0.screen.view(ctx.link())
    }

    fn rendered(&mut self, ctx: &Context<Self>, first_render: bool) {
        self.0.screen.rendered(ctx.link(), first_render);
    }

    fn prepare_state(&self) -> Option<String> {
        self.0.screen.prepare_state()
    }

    fn destroy(&mut self, ctx: &Context<Self>) {
        self.0.screen.destroy(ctx.link());
        ctx.props().sidebar.emit(Default::default());
        ctx.props().topbar.emit(Default::default());
        ctx.props().omnibox.emit(Default::default());
    }
}
