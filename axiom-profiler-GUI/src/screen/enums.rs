use yew::{html::Scope, Component, Html};

use super::{
    file::File, graph::Graph, homepage::Homepage, ml::MatchingLoop, Manager, Omnibox, Screen,
    Sidebar, Topbar,
};

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
            pub fn name(&self) -> &'static str {
                match self {
                    $(Change::$name(_) => stringify!($name),)*
                }
            }
        }

        impl ScreenKind {
            pub(super) fn as_change(&self) -> Change {
                match self {
                    $(ScreenKind::$name(_, props) => Change::$name(props.clone()),)*
                }
            }

            pub(super) fn update(&mut self, link: &Scope<Manager>, msg: <Manager as Component>::Message) -> bool {
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
            pub(super) fn changed(&mut self, link: &Scope<Manager>, new_props: &Change) -> bool {
                match (&mut *self, new_props) {
                $(
                    (ScreenKind::$name(h, curr_props), Change::$name(new_props)) => {
                        if curr_props == new_props {
                            false
                        } else {
                            let old_props = std::mem::replace(curr_props, new_props.clone());
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
            pub(super) fn view(&self, link: &Scope<Manager>) -> Html {
                match self {
                    $(ScreenKind::$name(h, props) => h.view(link, props),)*
                }
            }
            pub(super) fn view_sidebar(&self, link: &Scope<Manager>) -> Sidebar {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_sidebar(link, props),)*
                }
            }
            pub(super) fn view_topbar(&self, link: &Scope<Manager>) -> Topbar {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_topbar(link, props),)*
                }
            }
            pub(super) fn view_omnibox(&self, link: &Scope<Manager>) -> Omnibox {
                match self {
                    $(ScreenKind::$name(h, props) => h.view_omnibox(link, props),)*
                }
            }
            pub(super) fn rendered(&mut self, link: &Scope<Manager>, first_render: bool) {
                match self {
                    $(ScreenKind::$name(h, props) => h.rendered(link, props, first_render),)*
                }
            }
            pub(super) fn prepare_state(&self) -> Option<String> {
                match self {
                    $(ScreenKind::$name(h, _) => h.prepare_state(),)*
                }
            }
            pub(super) fn destroy(&mut self, link: &Scope<Manager>) {
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
        Graph,
        MatchingLoop,
    }
}
