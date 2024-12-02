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
    MlData,
};

#[derive(PartialEq, Properties)]
pub struct AddFilterSidebarProps {
    pub new_filter: Callback<Filter>,
    pub ml_data: Option<MlData>,
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
        let enable_ml = props.ml_data.is_some_and(|mls| mls.sum() > 0);
        vec![
            (true, Filter::MaxNodeIdx(1000), vec![]),
            (true, Filter::MinNodeIdx(1000), vec![]),
            (true, Filter::IgnoreTheorySolving, vec![]),
            (true, Filter::MaxInsts(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::MaxBranching(DEFAULT_NODE_COUNT), vec![]),
            (true, Filter::MaxDepth(6), vec![]),
            (
                true,
                Filter::ShowNamedQuantifier("name".to_string()),
                vec![],
            ),
            (enable_ml, Filter::SelectNthMatchingLoop(0), vec![]),
            (enable_ml, Filter::ShowMatchingLoopSubgraph, vec![]),
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
        fn mk_filter<T: Default, I: Iterator<Item = T> + Clone>(
            nodes: &I,
            p: impl Fn(&T) -> bool,
            f: impl Fn(T) -> Filter,
        ) -> (bool, Filter, Vec<Filter>) {
            let mut filters = nodes.clone().filter(p).map(&f);
            let first = filters.next();
            let enable = first.is_some();
            let first = first.unwrap_or_else(|| f(T::default()));
            (enable, first, filters.collect())
        }
        vec![
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    graph
                        .raw
                        .neighbors_directed(n, Direction::Outgoing)
                        .count_hidden()
                        > 0
                },
                |(n, _, _)| Filter::ShowNeighbours(n, Direction::Outgoing),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    graph
                        .raw
                        .neighbors_directed(n, Direction::Incoming)
                        .count_hidden()
                        > 0
                },
                |(n, _, _)| Filter::ShowNeighbours(n, Direction::Incoming),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(graph.raw.rev(), n.0)
                        .iter(graph.raw.rev())
                        .any(|n| graph.raw.graph[n].hidden())
                },
                |(n, _, _)| Filter::VisitSourceTree(n, true),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(graph.raw.rev(), n.0)
                        .iter(graph.raw.rev())
                        .any(|n| graph.raw.graph[n].visible())
                },
                |(n, _, _)| Filter::VisitSourceTree(n, false),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(&*graph.raw.graph, n.0)
                        .iter(&*graph.raw.graph)
                        .any(|n| graph.raw.graph[n].hidden())
                },
                |(n, _, _)| Filter::VisitSubTreeWithRoot(n, true),
            ),
            mk_filter(
                &nodes,
                |&(n, _, _)| {
                    Dfs::new(&*graph.raw.graph, n.0)
                        .iter(&*graph.raw.graph)
                        .any(|n| graph.raw.graph[n].visible())
                },
                |(n, _, _)| Filter::VisitSubTreeWithRoot(n, false),
            ),
            mk_filter(
                &nodes,
                |&(_, i, _)| i.is_some(),
                |(_, _, q)| Filter::IgnoreQuantifier(q),
            ),
            mk_filter(
                &nodes,
                |&(_, i, _)| i.is_some(),
                |(_, _, q)| Filter::IgnoreAllButQuantifier(q),
            ),
            mk_filter(&nodes, |_| true, |(n, _, _)| Filter::ShowLongestPath(n)),
        ]
    };
    let filters = filters.into_iter().map(|(enabled, first, other)| {
        let icon = first.icon();
        let fc = |i: RawNodeIndex| {
            outer_graph
                .as_ref()
                .map(|g| *g.borrow().raw[i].kind())
                .unwrap()
        };
        let short_text = first
            .short_text(fc)
            .split(['|', '"', '$'])
            .enumerate()
            .map(|(i, c)| if i % 2 == 0 { c } else { "_" })
            .collect::<String>();
        let long_text = first.long_text(fc, false);

        let new_filter = props.new_filter.clone();
        let onlick = Callback::from(move |e: MouseEvent| {
            e.prevent_default();
            if !enabled {
                return;
            }
            for f in [&first].into_iter().chain(other.iter()) {
                new_filter.emit(f.clone());
            }
        });
        let class = if enabled { "" } else { "disabled" };
        html! {
            <li {class}><a href="#" draggable="false" title={long_text} onclick={onlick}>
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
