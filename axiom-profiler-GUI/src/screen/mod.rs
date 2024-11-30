use manager::ManagerInner;
use yew::{html::Scope, Component, Html};

use self::{
    extra::{Omnibox, Sidebar, Topbar},
    file::File,
    homepage::Homepage,
};

pub mod extra;
pub mod file;
pub mod graph;
pub mod homepage;
pub mod manager;
pub mod ml;
// mod testing;

pub struct Manager(ManagerInner);

macro_rules! screen_enum {
    (pub enum ScreenKind { $($name:ident),*$(,)? }) => {
        pub enum ScreenKind {
            $($name($name, <$name as Screen>::Properties),)*
        }

        pub enum ManagerM {
            Screen(M),
            Change(Change),
        }
        pub enum M {
            $($name(<$name as Screen>::Message),)*
        }

        #[derive(Clone, PartialEq)]
        pub enum Change {
            $($name(<$name as Screen>::Properties),)*
        }

        impl Change {
            pub fn create(self, link: &Scope<Manager>) -> ScreenKind {
                match self {
                    $(Change::$name(props) => ScreenKind::$name($name::create(link, &props), props),)*
                }
            }
        }

        impl ScreenKind {
            fn update(&mut self, link: &Scope<Manager>, msg: <Manager as Component>::Message) -> bool {
                match (&mut *self, msg) {
                $(
                    (ScreenKind::$name(h, curr_props), ManagerM::Change(Change::$name(props))) => {
                        if curr_props == &props {
                            false
                        } else {
                            let old_props = std::mem::replace(curr_props, props);
                            h.changed(link, curr_props, &old_props)
                        }
                    }
                )*
                    (_, ManagerM::Change(other)) => {
                        let new = other.create(link);
                        let mut old = std::mem::replace(self, new);
                        old.destroy(link);
                        drop(old);
                        true
                    }
                $(
                    (ScreenKind::$name(h, props), ManagerM::Screen(M::$name(msg))) => h.update(link, props, msg),
                    (ScreenKind::$name(..), ManagerM::Screen(msg)) => panic!("Invalid message received by {:?} from {:?}", stringify!($name), msg.name()),
                )*
                }
            }
            fn changed(&mut self, link: &Scope<Manager>, props: &Change) -> bool {
                match (&mut *self, props) {
                $(
                    (ScreenKind::$name(h, curr_props), Change::$name(props)) => {
                        if curr_props == props {
                            false
                        } else {
                            let old_props = std::mem::replace(curr_props, props.clone());
                            h.changed(link, curr_props, &old_props)
                        }
                    }
                    (ScreenKind::$name(h, curr_props), other) => {
                        let accept_change = h.parent_changed(link, other, curr_props);
                        if accept_change {
                            let new = other.clone().create(link);
                            let mut old = std::mem::replace(self, new);
                            old.destroy(link);
                            drop(old);
                            true
                        } else {
                            false
                        }
                    }
                )*
                }
            }
            fn view(&self, link: &Scope<Manager>) -> Html {
                match self {
                    $(ScreenKind::$name(h, props) => h.view(link, props),)*
                }
            }
            fn view_sidebar(&self, link: &Scope<Manager>) -> Sidebar {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_sidebar(link, props),)*
                }
            }
            fn view_topbar(&self, link: &Scope<Manager>) -> Topbar {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_topbar(link, props),)*
                }
            }
            fn view_omnibox(&self, link: &Scope<Manager>) -> Omnibox {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_omnibox(link, props),)*
                }
            }
            fn rendered(&mut self, link: &Scope<Manager>, first_render: bool) {
                match self {
                    $(ScreenKind::$name(h, props) => h.rendered(link, props, first_render),)*
                }
            }
            fn prepare_state(&self) -> Option<String> {
                match self {
                    $(ScreenKind::$name(h, _) => h.prepare_state(),)*
                }
            }
            fn destroy(&mut self, link: &Scope<Manager>) {
                match self {
                    $(ScreenKind::$name(h, props) => h.destroy(link, props),)*
                }
            }
        }

        impl M {
            pub fn name(&self) -> &'static str {
                match self {
                    $(M::$name(_) => stringify!($name),)*
                }
            }
        }

        $(
            impl From<<$name as Screen>::Message> for ManagerM {
                fn from(msg: <$name as Screen>::Message) -> Self {
                    ManagerM::Screen(M::$name(msg))
                }
            }
        )*
    };
}

screen_enum! {
    pub enum ScreenKind {
        Homepage,
        File,
    }
}

pub trait Screen: Sized + 'static {
    /// Messages are used to make Components dynamic and interactive. Simple
    /// Component's can declare their Message type to be `()`. Complex Component's
    /// commonly use an enum to declare multiple Message types.
    type Message: 'static;

    /// The Component's properties.
    ///
    /// When the parent of a Component is re-rendered, it will either be re-created or
    /// receive new properties in the context passed to the `changed` lifecycle method.
    type Properties: PartialEq;

    /// Called when component is created.
    fn create(link: &Scope<Manager>, props: &Self::Properties) -> Self;

    /// Called when a new message is sent to the component via its scope.
    ///
    /// Components handle messages in their `update` method and commonly use this method
    /// to update their state and (optionally) re-render themselves.
    ///
    /// Returned bool indicates whether to render this Component after update.
    ///
    /// By default, this function will return true and thus make the component re-render.
    #[allow(unused_variables)]
    fn update(
        &mut self,
        link: &Scope<Manager>,
        props: &Self::Properties,
        msg: Self::Message,
    ) -> bool {
        true
    }

    /// Called when properties passed to the component change
    ///
    /// Returned bool indicates whether to render this Component after changed.
    ///
    /// By default, this function will return true and thus make the component re-render.
    #[allow(unused_variables)]
    fn changed(
        &mut self,
        link: &Scope<Manager>,
        props: &Self::Properties,
        _old_props: &Self::Properties,
    ) -> bool {
        true
    }

    /// Called when the properties passed in from the container of the screen
    /// change and indicate a desire to change the screen. Return `true` to
    /// accept the screen change and `false` to reject it and keep the
    /// `old_props`.
    #[allow(unused_variables)]
    fn parent_changed(
        &mut self,
        link: &Scope<Manager>,
        props: &Change,
        _old_props: &Self::Properties,
    ) -> bool {
        true
    }

    /// Components define their visual layout using a JSX-style syntax through the use of the
    /// `html!` procedural macro. The full guide to using the macro can be found in [Yew's
    /// documentation](https://yew.rs/concepts/html).
    ///
    /// Note that `view()` calls do not always follow a render request from `update()` or
    /// `changed()`. Yew may optimize some calls out to reduce virtual DOM tree generation overhead.
    /// The `create()` call is always followed by a call to `view()`.
    fn view(&self, link: &Scope<Manager>, props: &Self::Properties) -> Html;

    #[allow(unused_variables)]
    fn view_sidebar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Sidebar {
        Vec::new()
    }

    #[allow(unused_variables)]
    fn view_topbar(&self, link: &Scope<Manager>, props: &Self::Properties) -> Topbar {
        Vec::new()
    }

    /// Determines the way that the omnibox is displayed. If you need to show a
    /// temporary message in the omnibox use `link.omnibox_message(message,
    /// ms_duration)` instead.
    #[allow(unused_variables)]
    fn view_omnibox(&self, link: &Scope<Manager>, props: &Self::Properties) -> Omnibox {
        Omnibox::default()
    }

    /// The `rendered` method is called after each time a Component is rendered but
    /// before the browser updates the page.
    ///
    /// Note that `rendered()` calls do not always follow a render request from `update()` or
    /// `changed()`. Yew may optimize some calls out to reduce virtual DOM tree generation overhead.
    /// The `create()` call is always followed by a call to `view()` and later `rendered()`.
    #[allow(unused_variables)]
    fn rendered(&mut self, link: &Scope<Manager>, props: &Self::Properties, first_render: bool) {}

    /// Prepares the state during server side rendering.
    ///
    /// This state will be sent to the client side and is available via `ctx.prepared_state()`.
    ///
    /// This method is only called during server-side rendering after the component has been
    /// rendered.
    fn prepare_state(&self) -> Option<String> {
        None
    }

    /// Called right before a Component is unmounted.
    #[allow(unused_variables)]
    fn destroy(&mut self, link: &Scope<Manager>, props: &Self::Properties) {}
}
