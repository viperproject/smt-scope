use yew::{html, Callback, Children, Component, Context, Html, Properties};

pub enum Msg {
    Click(usize),
    MouseMove(usize),
    MouseLeave(usize),
}

pub struct ToggleList {
    pub selected: Vec<bool>,
    pub hover: Option<usize>,
}

#[derive(Properties, PartialEq)]
pub struct ToggleListProps {
    pub toggle: Callback<usize>,
    pub selected: Vec<bool>,
    pub children: Children,
}

impl Component for ToggleList {
    type Message = Msg;
    type Properties = ToggleListProps;

    fn create(ctx: &Context<Self>) -> Self {
        Self {
            selected: ctx.props().selected.clone(),
            hover: None,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        self.selected = ctx.props().selected.clone();
        true
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Click(idx) => {
                self.selected[idx] = !self.selected[idx];
                ctx.props().toggle.emit(idx);
                true
            }
            Msg::MouseMove(idx) => {
                let old = self.hover.replace(idx);
                old != self.hover
            }
            Msg::MouseLeave(idx) => {
                if self.hover.is_some_and(|old| old == idx) {
                    self.hover = None;
                    true
                } else {
                    false
                }
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        ctx.props()
            .children
            .iter()
            .enumerate()
            .map(|(curr_idx, display)| {
                let is_selected = self.selected[curr_idx];
                let is_hover = self.hover.is_some_and(|hover| hover == curr_idx);
                let onclick = ctx.link().callback(move |_| Msg::Click(curr_idx));
                let onmousemove = ctx.link().callback(move |_| Msg::MouseMove(curr_idx));
                let onmouseleave = ctx.link().callback(move |_| Msg::MouseLeave(curr_idx));
                let class = match (is_selected, is_hover) {
                    (true, true) => "toggle-list selected hover",
                    (true, false) => "toggle-list selected",
                    (false, true) => "toggle-list hover",
                    (false, false) => "toggle-list",
                };
                html! {
                    <li class={class} {onclick} {onmousemove} {onmouseleave}>
                        {display}
                    </li>
                }
            })
            .collect()
    }
}
