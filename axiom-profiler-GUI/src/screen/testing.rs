use std::any::Any;

use yew::{BaseComponent, Component, Context, Html, HtmlResult, Properties};

use super::{SidebarSection, TopbarMenu};

pub trait Screen2: Sized + 'static {
    type Message: 'static;
    type Properties: Properties;
    fn create(ctx: &Context<ScreenKind>, props: Self::Properties) -> Self;
    fn view(&self, ctx: &Context<ScreenKind>) -> Html;

    fn sidebar(&self, ctx: &Context<ScreenKind>) -> Vec<SidebarSection> {
        Vec::new()
    }
    fn topbar(&self, ctx: &Context<ScreenKind>) -> Vec<TopbarMenu> {
        Vec::new()
    }
}

pub enum ScreenKind {
    A(A),
    B(B),
}

pub struct A;
impl Screen2 for A {
    type Message = ();
    type Properties = ();
    fn create(ctx: &Context<ScreenTest<Self>>) -> Self {
        todo!()
    }
    fn view(&self, ctx: &Context<ScreenTest<Self>>) -> Html {
        todo!()
    }
}

pub struct B;
impl Screen2 for B {
    type Message = ();
    type Properties = ();
    fn create(ctx: &Context<ScreenTest<Self>>) -> Self {
        todo!()
    }
    fn view(&self, ctx: &Context<ScreenTest<Self>>) -> Html {
        todo!()
    }
}

pub enum ScreenMessage {
    A(<A as Screen2>::Message),
    B(<B as Screen2>::Message),
}

impl Component for ScreenKind {
    type Message = ScreenMessage;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        Self::A(A::create(ctx))
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        match self {
            Self::A(a) => a.view(ctx),
            Self::B(b) => b.view(ctx),
        }
    }
}
