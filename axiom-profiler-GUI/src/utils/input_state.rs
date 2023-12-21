use wasm_bindgen::{JsCast, UnwrapThrowExt};
use web_sys::HtmlInputElement;
use yew::prelude::*;

pub enum InputAction {
    SetValueTo(usize),
}

#[derive(Clone, Debug, PartialEq)]
pub struct InputValue {
    pub value: usize,
}

impl Default for InputValue {
    fn default() -> Self {
        Self { value: usize::MAX }
    }
}

impl From<usize> for InputValue {
    fn from(value: usize) -> Self {
        Self { value }
    }
}

impl Reducible for InputValue {
    type Action = InputAction;

    fn reduce(self: std::rc::Rc<Self>, action: Self::Action) -> std::rc::Rc<Self> {
        match action {
            InputAction::SetValueTo(value) => Self { value }.into(),
        }
    }
}

#[derive(Properties, PartialEq)]
pub struct UsizeInputProps {
    pub label: AttrValue,
    pub dependency: *const smt_log_parser::Z3Parser,
    pub input_value: UseReducerHandle<InputValue>,
    pub default_value: usize,
    pub placeholder: AttrValue,
}

/// Function component for input fields that accept usize
/// Must specify label: AttrValue, dependency: AttrValue, input_value: UseReducerHandle<InputValue>
/// Resets the value whenever the dependency changes
#[function_component(UsizeInput)]
pub fn integer_input(props: &UsizeInputProps) -> Html {
    let input_value = props.input_value.clone();
    let input_ref = use_node_ref();

    let set_value = {
        let input_value = input_value.clone();
        let default_value = props.default_value;
        move |input_event: Event| {
            let target: HtmlInputElement = input_event
                .target()
                .unwrap_throw()
                .dyn_into()
                .unwrap_throw();
            match target.value().to_string().parse::<usize>() {
                Ok(value) => {
                    log::debug!("Setting the value to {}", value);
                    input_value.dispatch(InputAction::SetValueTo(value));
                }
                Err(_) => {
                    input_value.dispatch(InputAction::SetValueTo(default_value));
                }
            }
        }
    };

    let set_value_on_enter = Callback::from({
        let set_value = set_value.clone();
        move |key_event: KeyboardEvent| {
            if key_event.key() == "Enter" {
                let event: Event = key_event.clone().into();
                set_value(event);
            }
        }
    });

    let set_value_on_blur = Callback::from({
        let set_value = set_value.clone();
        move |blur_event: FocusEvent| {
            let event: Event = blur_event.clone().into();
            set_value(event);
        }
    });

    {
        // Whenever dependency changes, need to reset the state
        let dep = props.dependency;
        let input_value = input_value.clone();
        let input_ref = input_ref.clone();
        let default_value = props.default_value;
        use_effect_with_deps(
            {
                let input_value = input_value.clone();
                move |_| {
                    input_value.dispatch(InputAction::SetValueTo(default_value));
                    let input = input_ref
                        .cast::<HtmlInputElement>()
                        .expect("div_ref not attached to div element");
                    input.set_value("");
                }
            },
            dep,
        );
    }
    let placeholder = props.placeholder.to_string();

    html! {
        <>
            <label for="input">{props.label.to_string()}</label>
            <input ref={input_ref} type="number" onkeypress={set_value_on_enter} onblur={set_value_on_blur} id="input" {placeholder}/>
        </>
    }
}
