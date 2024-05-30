use material_yew::{
    dialog::{ActionType, MatDialog, MatDialogAction},
    MatButton, WeakComponentLink,
};
use num_format::{Locale, ToFormattedString};
use yew::{function_component, html, Callback, Html, Properties};

use super::svg_result::GraphDimensions;

#[derive(Properties, Clone, PartialEq)]
pub struct WarningProps {
    pub noderef: WeakComponentLink<MatDialog>,
    pub onclosed: Callback<WarningChoice>,
    pub dimensions: GraphDimensions,
}

pub enum WarningChoice {
    Cancel,
    Apply,
    Render,
}

#[function_component]
pub fn Warning(props: &WarningProps) -> Html {
    let onclosed = props.onclosed.clone();
    let onclosed = Callback::from(move |selected: String| match selected.as_str() {
        "cancel" => onclosed.emit(WarningChoice::Cancel),
        "apply" => onclosed.emit(WarningChoice::Apply),
        "render" => onclosed.emit(WarningChoice::Render),
        _ => onclosed.emit(WarningChoice::Cancel),
    });

    let node_count = props.dimensions.node_count.to_formatted_string(&Locale::en);
    let edge_count = props.dimensions.edge_count.to_formatted_string(&Locale::en);
    let message = format!("The graph contains {node_count} nodes and {edge_count} edges, rendering might be slow. Are you sure? You can \"Cancel\" and undo the change, \"Apply\" the change without rendering, or \"Render\" the graph anyway.");

    html! {
    <section class="modal-dialog" tabindex="0">
        <MatDialog heading={"Large Graph Warning"} dialog_link={props.noderef.clone()} {onclosed}>
            <main>{message}</main>
            <MatDialogAction action_type={ActionType::Secondary} action={"cancel"}>
                <MatButton label="Cancel" />
            </MatDialogAction>
            <MatDialogAction action_type={ActionType::Secondary} action={"apply"}>
                <MatButton label="Apply" />
            </MatDialogAction>
            <MatDialogAction action_type={ActionType::Secondary} action={"render"}>
                <MatButton label="Render" />
            </MatDialogAction>
        </MatDialog>
    </section>
    }
}
