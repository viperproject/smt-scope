use material_yew::{
    dialog::{ActionType, MatDialog, MatDialogAction},
    MatButton, WeakComponentLink,
};
use yew::{function_component, html, Callback, Html, Properties};

#[derive(Properties, Clone, PartialEq)]
pub struct ShortcutsProps {
    pub noderef: WeakComponentLink<MatDialog>,
    pub onopened: Callback<()>,
    pub onclosed: Callback<String>,
}

#[function_component]
pub fn Shortcuts(props: &ShortcutsProps) -> Html {
    html! {
    <section class="modal-dialog" tabindex="0">
        <MatDialog heading={"SMT Scope Help"} dialog_link={props.noderef.clone()} onopened={props.onopened.clone()} onclosed={props.onclosed.clone()}>
            <main><div class="help">
                <h2>{"Navigation"}</h2>
                <table>
                    <tr><td><div class="keycap">{"w"}</div>{"/"}<div class="keycap">{"a"}</div>{"/"}<div class="keycap">{"s"}</div>{"/"}<div class="keycap">{"d"}</div></td><td>{"Pan up/left/down/right"}</td></tr>
                    <tr><td><div class="keycap">{"q"}</div>{"/"}<div class="keycap">{"e"}</div></td><td>{"Zoom in/out"}</td></tr>
                </table>
                <h2>{"Mouse Controls"}</h2>
                <table>
                    <tr><td>{"Click"}</td><td>{"Select node/edge"}</td></tr>
                    <tr><td>{"Ctrl + Scroll wheel"}</td><td>{"Zoom in/out"}</td></tr>
                    <tr><td>{"Click + Drag"}</td><td>{"Pan"}</td></tr>
                    <tr><td>{"Shift + Click + Drag"}</td><td>{"Select many"}</td></tr>
                </table>
                <h2>{"Running commands"}</h2>
                <table>
                    <tr><td><div class="keycap">{">"}</div> {" in the (empty) search box"}</td><td>{"Switch to command mode"}</td></tr>
                    <tr><td><div class="keycap">{"Enter"}</div></td><td>{"Execute command"}</td></tr>
                </table>
                <h2>{"Other"}</h2>
                <table>
                    <tr><td><div class="keycap">{"f"}</div> {" (with selection)"}</td><td>{"Scroll + zoom to current selection"}</td></tr>
                    <tr><td><div class="keycap">{"Cmd"}</div>{" + "}<div class="keycap">{"a"}</div></td><td>{"Select all"}</td></tr>
                    <tr><td><div class="keycap">{"Esc"}</div></td><td>{"Deselect"}</td></tr>
                    <tr><td><div class="keycap">{"Cmd"}</div>{" + "}<div class="keycap">{"s"}</div></td><td>{"Search"}</td></tr>
                    <tr><td><div class="keycap">{"r"}</div></td><td>{"Toggle selected details drawer"}</td></tr>
                    <tr><td><div class="keycap">{"Cmd"}</div>{" + "}<div class="keycap">{"b"}</div></td><td>{"Toggle display of left sidebar"}</td></tr>
                    <tr><td><div class="keycap">{"?"}</div></td><td>{"Show help"}</td></tr>
                </table>
            </div></main>
            <MatDialogAction action_type={ActionType::Primary} action={"close"}>
                <MatButton label="Close" />
            </MatDialogAction>
        </MatDialog>
    </section>
    }
}
