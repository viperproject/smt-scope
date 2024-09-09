use yew::{
    html,
    prelude::{Context, Html},
    Children, Component, KeyboardEvent, MouseEvent, NodeRef, Properties,
};

use crate::{
    commands::{Command, CommandRef, CommandsContext},
    CallbackRef, GlobalCallbacksContext, PagePosition,
};

#[derive(Properties, Debug, PartialEq)]
pub struct SplitDivProps {
    /// 0.0 to 1.0
    pub initial_position: f64,
    pub left_bound: f64,
    pub right_bound: f64,
    /// Must be spaced apart by at least 0.05
    pub snap_positions: Vec<f64>,
    pub children: Children,
}

impl SplitDivProps {
    pub fn snap(&self, mut position: f64) -> f64 {
        for snap in &self.snap_positions {
            if (snap - position).abs() < 0.025 {
                position = *snap;
                break;
            }
        }
        position
    }
}

pub struct SplitDiv {
    old_position: f64,
    position: f64,

    dragging: bool,
    container: NodeRef,

    _callback_refs: [CallbackRef; 3],
    _command_refs: [CommandRef; 1],
}

#[allow(dead_code)]
pub enum Msg {
    MouseDown(MouseEvent),
    MouseMove(MouseEvent),
    MouseUp(MouseEvent),
    KeyDown(KeyboardEvent),
    ToggleDrawer,
}

impl Component for SplitDiv {
    type Message = Msg;

    type Properties = SplitDivProps;

    fn create(ctx: &Context<Self>) -> Self {
        let registerer = ctx.link().get_callbacks_registerer().unwrap();
        let mouse_move_ref = (registerer.register_mouse_move)(ctx.link().callback(Msg::MouseMove));
        let mouse_up_ref = (registerer.register_mouse_up)(ctx.link().callback(Msg::MouseUp));
        let keydown = (registerer.register_keyboard_down)(ctx.link().callback(Msg::KeyDown));
        let _callback_refs = [mouse_move_ref, mouse_up_ref, keydown];

        let commands = ctx.link().get_commands_registerer().unwrap();
        let toggle = Command {
            name: "Toggle right drawer".to_string(),
            execute: ctx.link().callback(|_| Msg::ToggleDrawer),
            keyboard_shortcut: vec!["r"],
            disabled: ctx.props().left_bound == ctx.props().right_bound,
        };
        let toggle = (commands)(toggle);
        let _command_refs = [toggle];

        Self {
            position: ctx.props().initial_position,
            old_position: ctx.props().initial_position,
            dragging: false,
            container: NodeRef::default(),
            _callback_refs,
            _command_refs,
        }
    }
    fn changed(&mut self, ctx: &Context<Self>, old_props: &Self::Properties) -> bool {
        debug_assert!(ctx.props() != old_props);
        let new_pros = ctx.props();
        let new_disabled = ctx.props().left_bound == ctx.props().right_bound;
        let old_disabled = old_props.left_bound == old_props.right_bound;
        if new_disabled != old_disabled {
            self._command_refs[0].set_disabled(new_disabled);
        }

        // If the window should appear but was previously hidden, show it
        let position = old_props.snap(self.position);
        if old_props.left_bound == position && new_pros.left_bound != old_props.left_bound {
            self.position = new_pros.initial_position;
        }
        if old_props.right_bound == position && new_pros.right_bound != old_props.right_bound {
            self.position = new_pros.initial_position;
        }
        true
    }
    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        match msg {
            Msg::MouseDown(ev) => {
                ev.prevent_default();
                self.dragging = true;
                false
            }
            Msg::MouseMove(ev) => {
                if !self.dragging || ev.buttons() != 1 {
                    self.dragging = false;
                    return false;
                }
                ev.prevent_default();
                let position = PagePosition::from(&ev);
                let container = self.container.cast::<web_sys::Element>().unwrap();
                let container = container.get_bounding_client_rect();
                self.position = (position.x as f64 - container.left()) / container.width();
                true
            }
            Msg::MouseUp(_) => {
                self.dragging = false;
                false
            }
            Msg::KeyDown(ev) => {
                if ev.key() == "r" {
                    ctx.link().send_message(Msg::ToggleDrawer);
                }
                false
            }
            Msg::ToggleDrawer => {
                if self.position == 1.0 {
                    self.position = self.old_position;
                } else {
                    self.old_position = self.position;
                    self.position = 1.0;
                }
                true
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let middle_width = 6.0;
        let onmousedown = ctx.link().callback(Msg::MouseDown);

        let position = &ctx.props().snap(self.position);
        let position = position
            .min(ctx.props().right_bound)
            .max(ctx.props().left_bound);
        let style_left = format!(
            "width:calc({}% - {}px); height:100%;",
            position * 100.0,
            middle_width * position
        );

        let style_middle = format!("width:{}px; height:100%; cursor:ew-resize; background-color:rgb(229, 231, 235); background-repeat:no-repeat; background-position:50% center; background-image:url(\"html/vertical.png\");", middle_width);

        let inverse = 1.0 - position;
        let style_right = format!(
            "width:calc({}% - {}px); height:100%;",
            inverse * 100.0,
            middle_width * position
        );
        let mut children = ctx.props().children.iter();
        html! {
            <div ref={&self.container} style="display:flex; flex-direction:row; width:100%; height:100%">
                <div style={style_left}>
                    {children.next()}
                </div>
                <div style={style_middle} {onmousedown}></div>
                <div style={style_right}>
                    {for children}
                </div>
            </div>
        }
    }
}
