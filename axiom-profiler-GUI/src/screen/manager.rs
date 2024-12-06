use std::rc::Rc;

use yew::{html, Callback, Component, Context, Html, Properties};

use super::{
    extra::{Omnibox, Sidebar, Topbar},
    Screen,
};

pub enum NestedScreenM {
    Sidebar(Rc<Sidebar>),
    Topbar(Rc<Topbar>),
    Omnibox(Rc<Omnibox>),
}

pub struct NestedScreen {
    nested_sidebar_updated: Callback<Rc<Sidebar>>,
    sidebar: Rc<Sidebar>,
    nested_topbar_updated: Callback<Rc<Topbar>>,
    topbar: Rc<Topbar>,
    nested_omnibox_updated: Callback<Rc<Omnibox>>,
    omnibox: Rc<Omnibox>,
}

impl NestedScreen {
    pub fn new(update: Callback<NestedScreenM>) -> Self {
        let update_sidebar = update.clone();
        let update_topbar = update.clone();
        let update_omnibox = update;
        Self {
            nested_sidebar_updated: Callback::from(move |sidebar| {
                update_sidebar.emit(NestedScreenM::Sidebar(sidebar));
            }),
            sidebar: Default::default(),
            nested_topbar_updated: Callback::from(move |topbar| {
                update_topbar.emit(NestedScreenM::Topbar(topbar));
            }),
            topbar: Default::default(),
            nested_omnibox_updated: Callback::from(move |omnibox| {
                update_omnibox.emit(NestedScreenM::Omnibox(omnibox));
            }),
            omnibox: Default::default(),
        }
    }

    pub fn update(&mut self, mut update: NestedScreenM) -> NestedScreenM {
        match &mut update {
            NestedScreenM::Sidebar(sidebar) => core::mem::swap(&mut self.sidebar, sidebar),
            NestedScreenM::Topbar(topbar) => core::mem::swap(&mut self.topbar, topbar),
            NestedScreenM::Omnibox(omnibox) => core::mem::swap(&mut self.omnibox, omnibox),
        }
        update
    }

    pub fn view<S: Screen>(&self, initial: S::Properties) -> Html {
        html! {
            <ScreenManager<S> sidebar={self.nested_sidebar_updated.clone()} topbar={self.nested_topbar_updated.clone()} omnibox={self.nested_omnibox_updated.clone()} {initial} />
        }
    }

    pub fn sidebar(&self) -> &Rc<Sidebar> {
        &self.sidebar
    }

    pub fn topbar(&self) -> &Rc<Topbar> {
        &self.topbar
    }

    pub fn omnibox(&self) -> &Rc<Omnibox> {
        &self.omnibox
    }
}

#[derive(Properties, Clone)]
pub struct ManagerProps<S: Screen> {
    pub sidebar: Option<Callback<Rc<Sidebar>>>,
    pub topbar: Option<Callback<Rc<Topbar>>>,
    pub omnibox: Option<Callback<Rc<Omnibox>>>,
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
    sidebar: Option<Rc<Sidebar>>,
    topbar: Option<Rc<Topbar>>,
    omnibox: Option<Rc<Omnibox>>,
    screen: S,
}

impl<S: Screen> ScreenManager<S> {
    fn sidebar(ctx: &Context<Self>, screen: &S, sidebar: &mut Option<Rc<Sidebar>>) -> bool {
        let Some(cb) = &ctx.props().sidebar else {
            return sidebar.take().is_some();
        };
        let new = screen.view_sidebar(ctx.link(), &ctx.props().initial).into();
        if sidebar.as_deref() == Some(&*new) {
            return false;
        }
        let new = new.into_rc();
        cb.emit(Rc::clone(&new));
        *sidebar = Some(new);
        true
    }

    fn topbar(ctx: &Context<Self>, screen: &S, topbar: &mut Option<Rc<Topbar>>) -> bool {
        let Some(cb) = &ctx.props().topbar else {
            return topbar.take().is_some();
        };
        let new = screen.view_topbar(ctx.link(), &ctx.props().initial).into();
        if topbar.as_deref() == Some(&*new) {
            return false;
        }
        let new = new.into_rc();
        cb.emit(Rc::clone(&new));
        *topbar = Some(new);
        true
    }

    fn omnibox(ctx: &Context<Self>, screen: &S, omnibox: &mut Option<Rc<Omnibox>>) -> bool {
        let Some(cb) = &ctx.props().omnibox else {
            return omnibox.take().is_some();
        };
        let new = screen.view_omnibox(ctx.link(), &ctx.props().initial).into();
        if omnibox.as_deref() == Some(&*new) {
            return false;
        }
        let new = new.into_rc();
        cb.emit(Rc::clone(&new));
        *omnibox = Some(new);
        true
    }
}

impl<S: Screen> Component for ScreenManager<S> {
    type Message = S::Message;
    type Properties = ManagerProps<S>;
    fn create(ctx: &Context<Self>) -> Self {
        let props = &ctx.props().initial;
        let screen = S::create(ctx.link(), props);
        let mut sidebar = None;
        Self::sidebar(ctx, &screen, &mut sidebar);
        let mut topbar = None;
        Self::topbar(ctx, &screen, &mut topbar);
        let mut omnibox = None;
        Self::omnibox(ctx, &screen, &mut omnibox);
        Self {
            sidebar,
            topbar,
            omnibox,
            screen,
        }
    }

    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        let mut changed = false;
        if ctx.props().initial != old_props.initial {
            changed |= self
                .screen
                .changed(ctx.link(), &ctx.props().initial, &old_props.initial)
        }

        if changed || ctx.props().sidebar.is_none() != old_props.sidebar.is_none() {
            Self::sidebar(ctx, &self.screen, &mut self.sidebar);
        }
        if changed || ctx.props().topbar.is_none() != old_props.topbar.is_none() {
            Self::topbar(ctx, &self.screen, &mut self.topbar);
        }
        if changed || ctx.props().omnibox.is_none() != old_props.omnibox.is_none() {
            Self::omnibox(ctx, &self.screen, &mut self.omnibox);
        }
        changed
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let props = &ctx.props().initial;
        let changed = self.screen.update(ctx.link(), props, msg);
        if !changed {
            return changed;
        }

        Self::sidebar(ctx, &self.screen, &mut self.sidebar);
        Self::topbar(ctx, &self.screen, &mut self.topbar);
        Self::omnibox(ctx, &self.screen, &mut self.omnibox);

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
        if let Some(cb) = &ctx.props().sidebar {
            cb.emit(Default::default());
        }
        if let Some(cb) = &ctx.props().topbar {
            cb.emit(Default::default());
        }
        if let Some(cb) = &ctx.props().omnibox {
            cb.emit(Default::default());
        }
    }
}
