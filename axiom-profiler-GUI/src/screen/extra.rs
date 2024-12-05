use std::{cell::Cell, rc::Rc};

use material_yew::{icon::MatIcon, linear_progress::LinearProgressProps};
use yew::{html, Callback, Html, MouseEvent, NodeRef};

use crate::infobars::OmniboxMessage;

pub type Sidebar = Vec<SidebarSection>;
pub type Topbar = Vec<TopbarMenu>;

#[derive(Clone, PartialEq)]
pub enum Omnibox {
    Search(OmniboxSearch),
    Message(OmniboxMessage),
    Loading(OmniboxLoading),
    Select(OmniboxChoose),
}

impl Default for Omnibox {
    fn default() -> Self {
        Self::Search(Default::default())
    }
}

impl Omnibox {
    pub fn enabled(&self) -> bool {
        matches!(self, Self::Search(_))
    }

    pub fn icon(&self) -> &'static str {
        match self {
            Self::Search(_) => "search",
            Self::Message(msg) => msg.kind.icon(),
            Self::Loading(loading) => loading.icon,
            Self::Select(select) => select.icon,
        }
    }

    pub fn icon_mousedown(&self) -> Option<&Callback<()>> {
        match self {
            Self::Search(_) | Self::Message(_) => None,
            Self::Loading(loading) => loading.icon_mousedown.as_ref(),
            Self::Select(select) => select.icon_mousedown.as_ref(),
        }
    }

    pub fn message(&self) -> &str {
        match self {
            Self::Search(_) => "Search or type '>' for commands",
            Self::Message(msg) => msg.message.as_str(),
            Self::Loading(loading) => loading.message.as_str(),
            Self::Select(select) => select.message.as_str(),
        }
    }
}

#[derive(Clone, PartialEq)]
pub struct OmniboxLoading {
    pub icon: &'static str,
    pub icon_mousedown: Option<Callback<()>>,
    pub message: String,
    pub loading: LinearProgressProps,
}

impl OmniboxLoading {
    pub fn indeterminate() -> LinearProgressProps {
        LinearProgressProps {
            indeterminate: true,
            progress: 0.0,
            buffer: 1.0,
            reverse: false,
            closed: false,
        }
    }
}

#[derive(Clone, PartialEq)]
pub struct OmniboxChoose {
    pub icon: &'static str,
    pub icon_mousedown: Option<Callback<()>>,
    pub message: String,
    pub choose_from: usize,
    pub choose: Callback<usize>,
}

pub type OmniboxSearch = Vec<OmniboxSearchCategory>;

#[derive(Clone, PartialEq)]
pub struct OmniboxSearchCategory {
    pub name: String,
    /// The ordering of these entries determines the order in which they are
    /// displayed if the have the same search score.
    pub entries: Vec<OmniboxSearchEntry>,
}

#[derive(Clone, PartialEq)]
pub struct OmniboxSearchEntry {
    pub pre_text: String,
    pub search_text: String,
    pub post_text: String,
    pub info: Html,

    pub select_from: usize,
    pub select: Callback<usize>,
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
