use yew::html::Scope;

use crate::screen::Manager;

use super::{Action, ElementKind, HomepageM, SimpleButton};

#[derive(Clone, Copy, PartialEq)]
pub enum Example {
    Array,
}

impl Example {
    const fn all() -> &'static [Example] {
        &[Example::Array]
    }

    pub fn name(self) -> &'static str {
        match self {
            Example::Array => "array",
        }
    }

    pub fn file_name(self) -> String {
        format!("{}.log", self.name())
    }

    pub fn file_path(self) -> String {
        format!("html/examples/{}.log", self.name())
    }

    pub fn elements(link: &Scope<Manager>) -> impl Iterator<Item = ElementKind> + '_ {
        Self::all().iter().map(|&example| {
            ElementKind::Simple(SimpleButton {
                icon: "description",
                text: format!("Open {} example", example.name()),
                hover_text: None,
                disabled: false,
                click: Action::MouseDown(link.callback(move |()| HomepageM::OpenExample(example))),
            })
        })
    }
}
