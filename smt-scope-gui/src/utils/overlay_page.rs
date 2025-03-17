use std::{cell::RefCell, rc::Rc};

use material_yew::MatIcon;
use yew::prelude::*;

pub type SetVisibleCallback = Rc<RefCell<Callback<Option<bool>>>>;

#[derive(Properties, PartialEq)]
pub struct OverlayProps {
    pub set_visible: SetVisibleCallback,
    pub visible_changed: Callback<bool>,
    pub children: Children,
}

pub struct Overlay {
    visible: bool,
}

pub enum Msg {
    SetVisible(Option<bool>),
}

impl Component for Overlay {
    type Message = Msg;
    type Properties = OverlayProps;

    fn create(ctx: &Context<Self>) -> Self {
        *ctx.props().set_visible.borrow_mut() = ctx.link().callback(Msg::SetVisible);
        Self { visible: false }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        *ctx.props().set_visible.borrow_mut() = ctx.link().callback(Msg::SetVisible);
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::SetVisible(visible) => {
                let Some(visible) = visible else {
                    self.visible = !self.visible;
                    ctx.props().visible_changed.emit(self.visible);
                    return true;
                };
                if self.visible == visible {
                    return false;
                }
                self.visible = visible;
                ctx.props().visible_changed.emit(self.visible);
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let class = if self.visible {
            "overlay full-page"
        } else {
            "overlay full-page display-none"
        };
        let onclick = ctx.link().callback(|_| Msg::SetVisible(Some(false)));
        html! {
            <div {class}>
                {for ctx.props().children.iter()}
                <div class="material-icons close-button" {onclick}><MatIcon>{"close"}</MatIcon></div>
            </div>
        }
    }
}
