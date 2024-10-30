use std::rc::Rc;

use material_yew::icon::MatIcon;
use petgraph::{
    visit::{Dfs, Walker},
    Direction,
};
use smt_log_parser::analysis::{raw::NodeKind, RawNodeIndex};
use yew::{function_component, html, use_context, Callback, Html, MouseEvent, Properties};

use crate::{
    results::{filters::Filter, svg_result::DEFAULT_NODE_COUNT},
    state::StateProvider,
};

#[derive(PartialEq, Properties)]
pub struct AddFilterSidebarProps {
    pub new_filter: Callback<Filter>,
    pub found_mls: Option<usize>,
    pub nodes: Vec<RawNodeIndex>,
    pub general_filters: bool,
}

#[function_component]
pub fn AddFilterSidebar(props: &AddFilterSidebarProps) -> Html {
    let data = use_context::<Rc<StateProvider>>().unwrap();
    let Some(parser) = &data.state.parser else {
        return html! {};
    };

    let mut outer_graph = None;
    let filters = if props.general_filters {
        let mut mls = Vec::new();
        let mut mls_all = Vec::new();
        if props.found_mls.is_some_and(|mls| mls > 0) {
            mls = vec![Filter::SelectNthMatchingLoop(0)];
            mls_all = vec![Filter::ShowMatchingLoopSubgraph];
        };
        vec![
            vec![Filter::MaxNodeIdx(1000)],
            vec![Filter::MinNodeIdx(1000)],
            vec![Filter::IgnoreTheorySolving],
            vec![Filter::MaxInsts(DEFAULT_NODE_COUNT)],
            vec![Filter::MaxBranching(DEFAULT_NODE_COUNT)],
            vec![Filter::MaxDepth(6)],
            vec![Filter::ShowNamedQuantifier("name".to_string())],
            mls,
            mls_all,
        ]
    } else {
        let Some(graph) = parser.graph.as_ref() else {
            return html! {};
        };
        outer_graph = Some(graph.clone());
        let graph = graph.borrow();
        let nodes = props.nodes.iter().map(|n| {
            let i = match *graph.raw[*n].kind() {
                NodeKind::Instantiation(i) => Some(i),
                _ => None,
            };
            let q = i.and_then(|i| {
                (&*parser.parser.borrow())[(&*parser.parser.borrow())[i].match_]
                    .kind
                    .quant_idx()
            });
            (*n, i, q)
        });
        vec![
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    graph
                        .raw
                        .neighbors_directed(n, Direction::Outgoing)
                        .count_hidden()
                        > 0
                })
                .map(|(n, _, _)| Filter::ShowNeighbours(n, Direction::Outgoing))
                .collect(),
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    graph
                        .raw
                        .neighbors_directed(n, Direction::Incoming)
                        .count_hidden()
                        > 0
                })
                .map(|(n, _, _)| Filter::ShowNeighbours(n, Direction::Incoming))
                .collect(),
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    Dfs::new(graph.raw.rev(), n.0)
                        .iter(graph.raw.rev())
                        .any(|n| graph.raw.graph[n].hidden())
                })
                .map(|(n, _, _)| Filter::VisitSourceTree(n, true))
                .collect(),
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    Dfs::new(graph.raw.rev(), n.0)
                        .iter(graph.raw.rev())
                        .any(|n| graph.raw.graph[n].visible())
                })
                .map(|(n, _, _)| Filter::VisitSourceTree(n, false))
                .collect(),
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    Dfs::new(&*graph.raw.graph, n.0)
                        .iter(&*graph.raw.graph)
                        .any(|n| graph.raw.graph[n].hidden())
                })
                .map(|(n, _, _)| Filter::VisitSubTreeWithRoot(n, true))
                .collect(),
            nodes
                .clone()
                .filter(|&(n, _, _)| {
                    Dfs::new(&*graph.raw.graph, n.0)
                        .iter(&*graph.raw.graph)
                        .any(|n| graph.raw.graph[n].visible())
                })
                .map(|(n, _, _)| Filter::VisitSubTreeWithRoot(n, false))
                .collect(),
            nodes
                .clone()
                .filter(|(_, i, _)| i.is_some())
                .map(|(_, _, q)| Filter::IgnoreQuantifier(q))
                .collect(),
            nodes
                .clone()
                .filter(|(_, i, _)| i.is_some())
                .map(|(_, _, q)| Filter::IgnoreAllButQuantifier(q))
                .collect(),
            nodes
                .clone()
                .map(|(n, _, _)| Filter::ShowLongestPath(n))
                .collect(),
        ]
    };
    let filters = filters.into_iter().map(|f| {
        if f.is_empty() {
            return html! {};
        }
        let icon = f[0].icon();
        let fc = |i| {
            outer_graph
                .as_ref()
                .map(|g| *g.borrow().raw[i].kind())
                .unwrap()
        };
        let short_text = f[0]
            .short_text(fc)
            .split(['|', '"', '$'])
            .enumerate()
            .map(|(i, c)| if i % 2 == 0 { c } else { "_" })
            .collect::<String>();
        let long_text = f[0].long_text(fc, false);

        let new_filter = props.new_filter.clone();
        let onlick = Callback::from(move |e: MouseEvent| {
            e.prevent_default();
            for f in &f {
                new_filter.emit(f.clone());
            }
        });
        html! {
            <li><a href="#" draggable="false" title={long_text} onclick={onlick}>
                <div class="material-icons"><MatIcon>{icon}</MatIcon></div>
                {short_text}
            </a></li>
        }
    });
    html! {
    <>
        {for filters}
    </>
    }
}
