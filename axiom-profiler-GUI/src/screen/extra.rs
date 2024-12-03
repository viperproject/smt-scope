use std::{
    cell::{Cell, RefCell},
    rc::Rc,
};

use material_yew::{icon::MatIcon, linear_progress::LinearProgressProps};
use yew::{html, Callback, Html, MouseEvent, NodeRef};

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

/// For sections which do not change, these should be generated once and saved.
#[derive(Debug, Clone, PartialEq)]
pub struct SidebarSection {
    pub ref_: SidebarSectionRef,
    pub header_text: &'static str,
    pub collapsed_text: String,
    pub elements: Vec<ElementKind>,
}

#[derive(Debug, Clone, PartialEq, Default)]
pub struct SidebarSectionRef {
    ref_: NodeRef,
    collapsed: Rc<Cell<bool>>,
}

impl SidebarSectionRef {
    fn class_list(&self) -> Option<web_sys::DomTokenList> {
        self.ref_
            .cast::<web_sys::Element>()
            .map(|el| el.class_list())
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

#[derive(Debug, Clone, PartialEq)]
pub enum ElementKind {
    Simple(SimpleButton),
    Custom(Html),
}

#[derive(Clone, PartialEq)]
pub struct TopbarMenu {
    pub button_text: &'static str,
    pub dropdown: Vec<SimpleButton>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct SimpleButton {
    pub icon: &'static str,
    /// This determines the text of the button as well as the element ID, it
    /// should therefore be unique.
    pub text: String,
    pub hover_text: Option<String>,
    pub disabled: bool,
    pub click: Action,
}

impl SimpleButton {
    pub fn to_html(self) -> Html {
        let (href, onmousedown) = match self.click {
            Action::Href(href) => (href, None),
            Action::MouseDown(callback) => (
                "#".to_string(),
                (!self.disabled).then(|| {
                    Callback::from(move |ev: MouseEvent| {
                        ev.prevent_default();
                        callback.emit(())
                    })
                }),
            ),
        };
        let id = self.text.to_lowercase().replace(" ", "_");
        let onclick = Callback::from(move |ev: MouseEvent| {
            ev.prevent_default();
        });
        let class = self.disabled.then_some("disabled");
        html! {
            <li {class}><a {id} {href} draggable="false" title={self.hover_text} {onmousedown} {onclick}><div class="material-icons"><MatIcon>{self.icon}</MatIcon></div>{self.text}</a></li>
        }
    }
}

/// This cannot be updated after creation. Make sure to use functionally the
/// same one each time.
#[derive(Debug, Clone, PartialEq)]
pub enum Action {
    Href(String),
    MouseDown(Callback<()>),
}
