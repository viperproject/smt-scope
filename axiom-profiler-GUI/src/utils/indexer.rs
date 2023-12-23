use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct IndexerProps {
    pub label: AttrValue,
    pub index_consumer: Callback<usize>,
}

pub struct Indexer { 
    index: usize,
}

pub enum Msg {
    Decrement,
    Increment,
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
                self.index = self.index.saturating_sub(1);
                ctx.props().index_consumer.emit(self.index);
                true
            }
            Msg::Increment => {
                self.index = self.index.saturating_add(1);
                ctx.props().index_consumer.emit(self.index);
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            <div>
                <h4>{ctx.props().label.to_string()}</h4>
                <div>
                    <button onclick={ctx.link().callback(|_| Msg::Decrement)}>{"Previous"}</button>
                    <span>{self.index}</span>
                    <button onclick={ctx.link().callback(|_| Msg::Increment)}>{"Next"}</button>
                </div>
            </div>
        } 
    }
}