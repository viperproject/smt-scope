use super::super::svg_result::{UserPermission, DEFAULT_NODE_COUNT};
use super::graph_filters::{Filter, GraphFilter};
use gloo::console::log;
use yew::prelude::*;
// use gloo_console::log;
use material_yew::WeakComponentLink;

pub enum Msg {
    AddFilters(Vec<Filter>),
    RemoveNthFilter(usize),
    ResetFilters,
    SetToPrevious,
}

pub struct FilterChain {
    filter_chain: Vec<Filter>,
    prev_filter_chain: Vec<Filter>,
}

const DEFAULT_FILTER_CHAIN: &[Filter] = &[
    Filter::IgnoreTheorySolving,
    Filter::MaxInsts(DEFAULT_NODE_COUNT),
];

#[derive(Properties, PartialEq)]
pub struct FilterChainProps {
    pub apply_filter: Callback<Filter>,
    pub reset_graph: Callback<()>,
    pub render_graph: Callback<UserPermission>,
    pub dependency: *const smt_log_parser::Z3Parser,
    pub weak_link: WeakComponentLink<FilterChain>,
}

impl yew::html::Component for FilterChain {
    type Message = Msg;
    type Properties = FilterChainProps;

    fn create(ctx: &Context<Self>) -> Self {
        ctx.props()
            .weak_link
            .borrow_mut()
            .replace(ctx.link().clone());
        let filter_chain = DEFAULT_FILTER_CHAIN.to_vec();
        for &filter in &filter_chain {
            ctx.props().apply_filter.emit(filter);
        }
        ctx.props().render_graph.emit(UserPermission::default());
        let prev_filter_chain = filter_chain.clone();
        Self {
            filter_chain,
            prev_filter_chain,
        }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::AddFilters(filters) => {
                self.prev_filter_chain = self.filter_chain.clone();
                for filter in filters {
                    log!("Adding filter ", filter.to_string());
                    self.filter_chain.push(filter);
                    ctx.props().apply_filter.emit(filter);
                }
                ctx.props().render_graph.emit(UserPermission::default());
                true
            }
            Msg::RemoveNthFilter(n) => {
                log!("Removing filter", n);
                self.prev_filter_chain = self.filter_chain.clone();
                self.filter_chain.remove(n);
                ctx.props().reset_graph.emit(());
                for &filter in &self.filter_chain {
                    ctx.props().apply_filter.emit(filter);
                }
                ctx.props().render_graph.emit(UserPermission::default());
                true
            }
            Msg::ResetFilters => {
                log!("resetting filters");
                self.prev_filter_chain = self.filter_chain.clone();
                self.filter_chain = DEFAULT_FILTER_CHAIN.to_vec();
                ctx.props().reset_graph.emit(());
                for &filter in &self.filter_chain {
                    ctx.props().apply_filter.emit(filter);
                }
                ctx.props().render_graph.emit(UserPermission::default());
                true
            }
            Msg::SetToPrevious => {
                log!("Setting to previous filter chain");
                self.filter_chain = self.prev_filter_chain.clone();
                ctx.props().reset_graph.emit(());
                for &filter in &self.filter_chain {
                    ctx.props().apply_filter.emit(filter);
                }
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let filter_chain: Vec<yew::virtual_dom::VNode> = self.filter_chain
            .iter()
            .enumerate()
            .map(|(idx, f)| html! {
                <div>
                    <label for={format!("remove_{}", idx)}>{format!("{}. {f}", idx+1)}</label>
                    <button onclick={ctx.link().callback(move |_| Msg::RemoveNthFilter(idx))} id={format!("remove_{}",idx)}>{"Remove filter"}</button>
                </div>
            })
            .collect();
        let reset_filters = ctx.link().callback(|_| Msg::ResetFilters);

        let add_filters = ctx.link().callback(Msg::AddFilters);
        html!(
            <>
                <GraphFilter
                    add_filters={add_filters.clone()}
                    dependency={ctx.props().dependency}
                />
                <h2>{"Filter chain:"}</h2>
                {for filter_chain}
                <div>
                    <button onclick={reset_filters}>{"Reset to default"}</button>
                </div>
            </>
        )
    }
}
