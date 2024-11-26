use material_yew::icon::MatIcon;
use yew::{function_component, html, Callback, Html, MouseEvent, Properties};

use crate::Msg;

#[derive(Clone, Copy, PartialEq)]
pub enum Example {
    Array,
}

impl Example {
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
}

#[derive(Properties, Clone, PartialEq)]
pub struct ExampleProps {
    pub example: Example,
    pub link: Callback<Msg>,
}

#[function_component]
pub fn ExampleRow(props: &ExampleProps) -> Html {
    let link = props.link.clone();
    let example = props.example;
    let open_example = Callback::from(move |ev: MouseEvent| {
        ev.prevent_default();
        link.emit(Msg::OpenExample(example));
    });
    html! {
        <li><a href="#" draggable="false" onclick={open_example}>
            <div class="material-icons"><MatIcon>{"description"}</MatIcon></div>
            {"Open "}{props.example.name()}{" example"}
        </a></li>
    }
}
