use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct IndexerProps {
    pub label: AttrValue,
    pub index_consumer: Callback<usize>,
    pub max: usize,
}

pub struct Indexer { 
    index: usize,
}

pub enum Msg {
    Decrement,
    Increment,
    SetToMin,
    SetToMax,
}

impl Component for Indexer {
    type Message = Msg;

    type Properties = IndexerProps;

    fn create(_ctx: &Context<Self>) -> Self {
        Self {
            index: 0,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Decrement => {
                let old_index = self.index;
                self.index = self.index.saturating_sub(1);
                if old_index != self.index {
                    ctx.props().index_consumer.emit(self.index);
                    true
                } else {
                    false
                }
            }
            Msg::Increment => {
                if self.index + 1 <= ctx.props().max {
                    self.index = self.index.saturating_add(1);
                    ctx.props().index_consumer.emit(self.index);
                    true
                } else {
                    false
                }
            }
            Msg::SetToMin => {
                let old_index = self.index;
                self.index = 0;
                if old_index != self.index {
                    ctx.props().index_consumer.emit(self.index);
                    true
                } else {
                    false
                }
            }
            Msg::SetToMax => {
                let old_index = self.index;
                self.index = ctx.props().max;
                if old_index != self.index {
                    ctx.props().index_consumer.emit(self.index);
                    true
                } else {
                    false
                }
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <div>
                <h4>{ctx.props().label.to_string()}</h4>
                <div>
                    <button onclick={ctx.link().callback(|_| Msg::SetToMin)}>{"First"}</button>
                    <button onclick={ctx.link().callback(|_| Msg::Decrement)}>{"Previous"}</button>
                    <span>{format!("{}/{}", self.index + 1, ctx.props().max + 1) }</span>
                    <button onclick={ctx.link().callback(|_| Msg::Increment)}>{"Next"}</button>
                    <button onclick={ctx.link().callback(|_| Msg::SetToMax)}>{"Last"}</button>
                </div>
            </div>
        } 
    }
}