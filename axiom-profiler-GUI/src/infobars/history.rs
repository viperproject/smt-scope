use std::rc::Rc;

use material_yew::icon::MatIcon;
use yew::{function_component, html, use_context, Callback, Html, MouseEvent};

use crate::commands::{Commands, ShortcutKey};

#[function_component]
pub fn History() -> Html {
    let commands = use_context::<Rc<Commands>>().unwrap();
    let (mut undo, mut redo) = (None, None);
    let (uk, rk) = (ShortcutKey::undo(), ShortcutKey::redo());
    for (_, cmd) in &commands.commands {
        if cmd.disabled {
            continue;
        }
        if cmd.keyboard_shortcut == uk {
            undo = Some(cmd.execute.clone());
        } else if cmd.keyboard_shortcut == rk {
            redo = Some(cmd.execute.clone());
        }
    }

    let undo_class = if undo.is_some() {
        "history-button"
    } else {
        "history-button disabled"
    };
    let redo_class = if redo.is_some() {
        "history-button"
    } else {
        "history-button disabled"
    };
    let undo = Callback::from(move |_| {
        if let Some(undo) = &undo {
            undo.emit(())
        }
    });
    let redo = Callback::from(move |_| {
        if let Some(redo) = &redo {
            redo.emit(())
        }
    });
    let prevent_default = Callback::from(move |ev: MouseEvent| ev.prevent_default());
    html! {
        <div class="display-contents history">
            <a href="#" class={undo_class} onmousedown={undo} onclick={&prevent_default}><div class="material-icons"><MatIcon>{"undo"}</MatIcon></div></a>
            <a href="#" class={redo_class} onmousedown={redo} onclick={prevent_default}><div class="material-icons"><MatIcon>{"redo"}</MatIcon></div></a>
        </div>
    }
}
