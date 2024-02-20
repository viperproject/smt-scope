use web_sys::HtmlInputElement;
use yew::prelude::*;
use yew_hooks::UseToggleHandle;

#[derive(Properties, PartialEq)]
pub struct ToggleSwitchProps {
    pub label: AttrValue,
    pub dependency: AttrValue,
    pub input_value: UseToggleHandle<bool>,
}

#[function_component(ToggleSwitch)]
pub fn toggle_switch(props: &ToggleSwitchProps) -> Html {
    let input_ref = use_node_ref();
    let toggle = {
        let input_value = props.input_value.clone();
        Callback::from(move |_| input_value.toggle())
    };
    {
        let dep = props.dependency.clone();
        let input_value = props.input_value.clone();
        let input_ref = input_ref.clone();
        use_effect_with_deps(
            {
                let input_value = input_value.clone();
                move |_| {
                    input_value.set(true);
                    let input = input_ref
                        .cast::<HtmlInputElement>()
                        .expect("div_ref not attached to div element");
                    input.set_checked(true);
                }
            },
            dep,
        );
    }
    html! {
        // <div>
        <>
            <label for="input">{props.label.to_string()}</label>
            <input ref={input_ref} type="checkbox" checked={*props.input_value} onclick={toggle} id="input" />
        // </div>
        </>
    }
}
