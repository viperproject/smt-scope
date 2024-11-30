mod analysis;

use yew::{html, html::Scope, Html};

use crate::state::FileInfo;

use super::{homepage::OpenedFileInfo, Manager, Screen};

pub use self::analysis::*;

#[derive(Clone, PartialEq)]
pub struct FileProps {
    pub file_info: FileInfo,
    pub opened_file: OpenedFileInfo,
    pub overlay_visible: bool,
}

pub struct File {
    analysis: Option<RcAnalysis>,
}

pub enum FileMessage {}

impl Screen for File {
    type Message = FileMessage;
    type Properties = FileProps;

    fn create(link: &Scope<Manager>, props: &Self::Properties) -> Self {
        Self { analysis: None }
    }

    fn changed(
        &mut self,
        link: &Scope<Manager>,
        props: &Self::Properties,
        old_props: &Self::Properties,
    ) -> bool {
        if props.file_info != old_props.file_info || props.opened_file != old_props.opened_file {
            *self = Self::create(link, props);
        }
        true
    }

    fn view(&self, link: &Scope<Manager>, props: &Self::Properties) -> Html {
        html! {}
    }
}
