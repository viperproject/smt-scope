use wasm_bindgen::{JsCast, UnwrapThrowExt};
use web_sys::HtmlInputElement;
use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct UsizeInputProps {
    pub label: AttrValue,
    pub placeholder: AttrValue,
    pub set_value: Callback<usize>,
}

#[function_component(UsizeInput)]
pub fn integer_input(props: &UsizeInputProps) -> Html {
    let input_ref = use_node_ref();
    let set_value_to = {
        let set_value = props.set_value.clone();
        move |input_event: Event| {
            let target: HtmlInputElement = input_event
                .target()
                .unwrap_throw()
                .dyn_into()
                .unwrap_throw();
            if let Ok(value) = target.value().to_string().parse::<usize>() {
                log::debug!("Setting the value to {}", value);
                set_value.emit(value);
            }
        }
    };

    let set_value_on_enter = Callback::from({
        let set_value = set_value_to.clone();
        move |key_event: KeyboardEvent| {
            if key_event.key() == "Enter" {
                let event: Event = key_event.clone().into();
                set_value(event);
            }
        }
    });

    let set_value_on_blur = Callback::from({
        let set_value = set_value_to.clone();
        move |blur_event: FocusEvent| {
            let event: Event = blur_event.clone().into();
            set_value(event);
        }
    });

    // {
    //     // Whenever dependency changes, need to reset the state
    //     let dep = props.dependency;
    //     let input_value = input_value.clone();
    //     let input_ref = input_ref.clone();
    //     let default_value = props.default_value;
    //     use_effect_with_deps(
    //         {
    //             let input_value = input_value.clone();
    //             move |_| {
    //                 input_value.dispatch(InputAction::SetValueTo(default_value));
    //                 let input = input_ref
    //                     .cast::<HtmlInputElement>()
    //                     .expect("div_ref not attached to div element");
    //                 input.set_value("");
    //             }
    //         },
    //         dep,
    //     );
    // }
    let placeholder = props.placeholder.to_string();

    html! {
        <>
            <label for="input">{props.label.to_string()}</label>
            <input ref={input_ref} type="number" onkeypress={set_value_on_enter} onblur={set_value_on_blur} id="input" {placeholder}/>
        </>
    }
}

