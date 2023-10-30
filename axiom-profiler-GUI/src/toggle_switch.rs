use yew::prelude::*;
use yew_hooks::prelude::*;

#[derive(Properties, PartialEq)]
pub struct ToggleSwitchProps {
    pub label: AttrValue,
    pub dependency: AttrValue,
    pub toggle: UseToggleHandle<bool>, 
}

#[function_component(ToggleSwitch)]
pub fn toggle_switch(props: &ToggleSwitchProps) -> Html {
    let onclick = {
        let toggle = props.toggle.clone();
        log::debug!("Switched toggle, now has value: {}", *toggle);
        Callback::from(move |_| toggle.toggle())
    };
    {
        let dep = props.dependency.clone();
        use_effect_with(dep, { 
            let toggle = props.toggle.clone();
            move |_| {
                toggle.reset();
            }
        });
    };
    html! {
        <div>
            <label>
                {props.label.to_string()}
                <input
                    type="checkbox"
                    checked={*props.toggle}
                    {onclick}
                />
                <span class="slider round"></span>
            </label>
        </div>
    }
}