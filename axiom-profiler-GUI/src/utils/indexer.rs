use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct IndexerProps {
    pub label: AttrValue,
    pub index_consumer: Callback<usize>,
}

#[function_component(Indexer)]
pub fn indexer(props: &IndexerProps) -> Html {
    let index = use_state(|| 0 as usize);
    let dec = {
        let index = index.clone(); 
        let index_consumer = props.index_consumer.clone();
        Callback::from(move |_| {
            index.set(index.saturating_sub(1));
            index_consumer.emit(*index);
        })
    };
    let inc = {
        let index = index.clone(); 
        let index_consumer = props.index_consumer.clone();
        Callback::from(move |_| {
            index.set(index.saturating_add(1));
            index_consumer.emit(*index);
        })
    };
    html! {
        <div>
            <h4>{props.label.to_string()}</h4>
            <div>
                <button onclick={dec}>{"Previous"}</button>
                <span>{*index}</span>
                <button onclick={inc}>{"Next"}</button>
            </div>
        </div>
    } 
}