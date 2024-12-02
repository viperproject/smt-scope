use std::{cell::{Cell, RefCell}, rc::Rc};

use material_yew::linear_progress::LinearProgressProps;
use yew::{Callback, Html, NodeRef};

pub type Sidebar = Vec<SidebarSection>;
pub type Topbar = Vec<TopbarMenu>;

#[derive(Clone, PartialEq)]
pub struct Omnibox {
    pub icon: &'static str,
    pub icon_mousedown: Option<Callback<()>>,
    pub disabled: bool,
    pub placeholder: String,
    pub progress: LinearProgressProps,
}

impl Default for Omnibox {
    fn default() -> Self {
        Self {
            icon: "search",
            icon_mousedown: None,
            disabled: false,
            placeholder: "Search or type '>' for commands".to_string(),
            progress: LinearProgressProps {
                indeterminate: false,
                progress: 0.0,
                buffer: 1.0,
                reverse: false,
                closed: true,
            },
        }
    }
}

#[derive(Clone, PartialEq)]
pub struct SidebarSection {
    pub ref_: SidebarSectionRef,
    pub header_text: &'static str,
    pub collapsed_text: String,
    pub elements: Vec<ElementKind>,
}

#[derive(Clone, PartialEq, Default)]
pub struct SidebarSectionRef {
    ref_: NodeRef,
    collapsed: Rc<Cell<bool>>,
}

impl SidebarSectionRef {
    fn class_list(&self) -> Option<web_sys::DomTokenList> {
        self.ref_.cast::<web_sys::Element>().map(|el| el.class_list())
    }

    pub fn expand(&self) -> bool {
        self.collapsed.set(false);
        self.class_list()
            .is_some_and(|class_list| class_list.add_1("expanded").is_ok())
    }
    pub fn collapse(&self) -> bool {
        self.collapsed.set(true);
        self.class_list()
            .is_some_and(|class_list| class_list.remove_1("expanded").is_ok())
    }
    pub fn toggle(&self) -> bool {
        self.collapsed.set(!self.collapsed.get());
        self.set()
    }
    pub fn set(&self) -> bool {
        if self.collapsed.get() {
            self.collapse()
        } else {
            self.expand()
        }
    }

    pub fn ref_(&self) -> &NodeRef {
        &self.ref_
    }
    pub fn expanded(&self) -> bool {
        !self.collapsed.get()
    }
}

#[derive(Clone, PartialEq)]
pub enum ElementKind {
    Simple(SimpleButton),
    Custom(Html),
}

#[derive(Clone, PartialEq)]
pub struct TopbarMenu {
    pub button_text: &'static str,
    pub dropdown: Vec<SimpleButton>,
}

#[derive(Clone, PartialEq)]
pub struct SimpleButton {
    pub icon: &'static str,
    /// This determines the text of the button as well as the element ID, it
    /// should therefore be unique.
    pub text: String,
    pub disabled: bool,
    pub click: Action,
}

#[derive(Clone, PartialEq)]
pub enum Action {
    Href(String),
    MouseDown(Callback<()>),
}
