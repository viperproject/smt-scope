use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct IndexerProps {
    pub label: AttrValue,
    pub index_consumer: Callback<usize>,
    pub min: usize,
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

/// Component for clicking through indices in [min, max] where min > 0.
/// Note: the emitted indices are in the range [min-1, max-1].
impl Component for Indexer {
    type Message = Msg;

    type Properties = IndexerProps;

    fn create(_ctx: &Context<Self>) -> Self {
        if _ctx.props().min > 0 {
            _ctx.props().index_consumer.emit(_ctx.props().min - 1);
        } 
        Self {
            index: _ctx.props().min,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::Decrement => {
                if self.index > ctx.props().min {
                    self.index = self.index.saturating_sub(1);
                    ctx.props().index_consumer.emit(self.index - 1);
                    true
                } else {
                    false
                }
            }
            Msg::Increment => {
                if self.index < ctx.props().max {
                    self.index = self.index.saturating_add(1);
                    ctx.props().index_consumer.emit(self.index - 1);
                    true
                } else {
                    false
                }
            }
            Msg::SetToMin => {
                if self.index > ctx.props().min {
                    self.index = ctx.props().min;
                    ctx.props().index_consumer.emit(self.index - 1);
                    true
                } else {
                    false
                }
            }
            Msg::SetToMax => {
                if self.index < ctx.props().max {
                    self.index = ctx.props().max;
                    ctx.props().index_consumer.emit(self.index - 1);
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
                <p>{ctx.props().label.to_string()}</p>
                <div>
                    <button onclick={ctx.link().callback(|_| Msg::SetToMin)}>{"First"}</button>
                    <button onclick={ctx.link().callback(|_| Msg::Decrement)}>{"Previous"}</button>
                    <span>{format!("{}/{}", self.index, ctx.props().max) }</span>
                    <button onclick={ctx.link().callback(|_| Msg::Increment)}>{"Next"}</button>
                    <button onclick={ctx.link().callback(|_| Msg::SetToMax)}>{"Last"}</button>
                </div>
            </div>
        } 
    }
}