use web_sys::HtmlInputElement;
use yew::prelude::*;
use wasm_bindgen::{UnwrapThrowExt, JsCast};

pub enum InputAction {
    SetValueTo(u32),
    ResetState,
}

#[derive(Clone, Debug, PartialEq)]
pub struct InputValue {
    pub value: u32,
}

impl Default for InputValue {
    fn default() -> Self {
        Self {
            value: u32::MAX,
        }
    }
}

impl Reducible for InputValue {
    type Action = InputAction;

    fn reduce(self: std::rc::Rc<Self>, action: Self::Action) -> std::rc::Rc<Self> {
        match action {
            InputAction::SetValueTo(value) => Self {
                value,
            }.into(),
            InputAction::ResetState => {
                Self::default().into()
            },
        }
    }
}

#[derive(Properties, PartialEq)] 
pub struct IntegerInputProps {
    pub label: AttrValue,
    pub dependency: AttrValue,
    pub input_value: UseReducerHandle<InputValue>,
}

#[function_component(IntegerInput)]
pub fn integer_input(props: &IntegerInputProps) -> Html {
    let input_value = props.input_value.clone(); 
    let input_ref = use_node_ref();

    let set_value = {
        let input_value = input_value.clone();
        move |input_event: Event| {
            let target: HtmlInputElement = input_event
                .target()
                .unwrap_throw()
                .dyn_into()
                .unwrap_throw();
            match target.value().to_string().parse::<u32>() {
                Ok(value) => {
                    input_value.dispatch(InputAction::SetValueTo(value));
                },
                Err(_) => {
                    input_value.dispatch(InputAction::ResetState);
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
        let dep = props.dependency.clone();
        let input_value = input_value.clone();
        let input_ref = input_ref.clone();
        use_effect_with(dep, {
            let input_value = input_value.clone();
            move |_| {
                input_value.dispatch(InputAction::ResetState);
                let input = input_ref
                    .cast::<HtmlInputElement>()
                    .expect("div_ref not attached to div element");
                input.set_value("");
            }
        });
    }

    html! {
        <div>
            <label for="input">{props.label.to_string()}</label>
            <input ref={input_ref} type="number" onkeypress={set_value_on_enter} onblur={set_value_on_blur} id="input" />
        </div>
    }
}