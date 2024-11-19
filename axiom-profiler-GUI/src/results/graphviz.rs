use smt_log_parser::{
    analysis::{analysis::matching_loop::MLGraphNode, raw::NodeKind},
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::MatchKind,
    NonMaxU32, Z3Parser,
};

use super::svg_result::QuantIdxToColourMap;

pub const INST_SHAPE: &str = "box";
pub const OTHER_SHAPE: &str = "ellipse";
pub const SPECIAL_SHAPE: &str = "egg";

pub const NODE_COLOUR_SATURATION: f64 = 0.4;
pub const NODE_COLOUR_VALUE: f64 = 0.95;

pub trait DotNodeProperties<
    LabelCtx = (),
    TooltipCtx = (),
    StyleCtx = (),
    ShapeCtx = (),
    ColCtx = (),
>
{
    fn all(
        &self,
        label: LabelCtx,
        tooltip: TooltipCtx,
        style: StyleCtx,
        shape: ShapeCtx,
        fillcolor: ColCtx,
    ) -> String {
        let label = self.label(label);
        let tooltip = self.tooltip(tooltip);
        let style = self.style(style);
        let shape = self.shape(shape);
        let fillcolor = self.fillcolor(fillcolor);
        format!("label=<{label}> tooltip=\"{tooltip}\" style=\"{style}\" shape={shape} fillcolor=\"{fillcolor}\"")
    }

    fn label(&self, _ctx: LabelCtx) -> String {
        Default::default()
    }

    fn tooltip(&self, _ctx: TooltipCtx) -> String {
        Default::default()
    }

    fn style(&self, _ctx: StyleCtx) -> &'static str {
        "filled"
    }

    fn shape(&self, _ctx: ShapeCtx) -> &'static str {
        "ellipse"
    }

    fn fillcolor(&self, _ctx: ColCtx) -> String {
        "white".to_owned()
    }
}

impl
    DotNodeProperties<
        (),
        (DisplayCtxt<'_>, bool, Option<NonMaxU32>),
        &'_ Z3Parser,
        (u32, u32),
        (&'_ Z3Parser, QuantIdxToColourMap),
    > for NodeKind
{
    fn label(&self, (): ()) -> String {
        self.to_string()
    }

    fn tooltip(
        &self,
        (mut ctxt, html, char_limit): (DisplayCtxt<'_>, bool, Option<NonMaxU32>),
    ) -> String {
        ctxt.config.html = html;
        ctxt.config.enode_char_limit = char_limit;
        match *self {
            NodeKind::ENode(enode) => {
                ctxt.config.enode_char_limit = ctxt
                    .config
                    .enode_char_limit
                    .and_then(|limit| NonMaxU32::new(limit.get() * 2));
                enode.with(&ctxt).to_string()
            }
            NodeKind::GivenEquality(eq, _) => eq.with(&ctxt).to_string(),
            NodeKind::TransEquality(eq) => eq.with(&ctxt).to_string(),
            NodeKind::Instantiation(inst) => match &ctxt.parser[ctxt.parser[inst].match_].kind {
                MatchKind::TheorySolving { axiom_id, .. } => {
                    let namespace = &ctxt.parser[axiom_id.namespace];
                    let id = axiom_id.id.map(|id| id.to_string()).unwrap_or_default();
                    format!("{namespace}[{id}]")
                }
                MatchKind::MBQI { quant, .. }
                | MatchKind::Axiom { axiom: quant, .. }
                | MatchKind::Quantifier { quant, .. } => {
                    ctxt.parser[*quant].kind.with(&ctxt).to_string()
                }
            },
        }
    }

    fn style(&self, parser: &Z3Parser) -> &'static str {
        let NodeKind::Instantiation(inst) = self else {
            return "filled";
        };
        if parser[parser[*inst].match_].kind.is_mbqi() {
            "filled,dashed"
        } else {
            "filled"
        }
    }

    fn shape(&self, (hidden_parents, hidden_children): (u32, u32)) -> &'static str {
        use NodeKind::*;
        match (self, hidden_children, hidden_parents) {
            (Instantiation(..), 0, 0) => INST_SHAPE,
            (Instantiation(..), 0, _) => "house",
            (Instantiation(..), _, 0) => "invhouse",
            (Instantiation(..), _, _) => "diamond",
            (ENode(..) | GivenEquality(..) | TransEquality(..), 0, 0) => SPECIAL_SHAPE,
            (ENode(..) | GivenEquality(..) | TransEquality(..), _, _) => OTHER_SHAPE,
        }
    }

    fn fillcolor(&self, (parser, colour_map): (&Z3Parser, QuantIdxToColourMap)) -> String {
        use NodeKind::*;
        match self {
            Instantiation(inst_idx) => {
                let match_ = &parser[parser[*inst_idx].match_];
                let hue = colour_map.get_rbg_hue(match_.kind.quant_idx()) / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            ENode(..) => "lightgrey".to_owned(),
            GivenEquality(..) | TransEquality(..) => "white".to_owned(),
        }
    }
}

impl DotNodeProperties<DisplayCtxt<'_>, (), (), (), QuantIdxToColourMap> for MLGraphNode {
    fn label(&self, mut ctxt: DisplayCtxt) -> String {
        match *self {
            MLGraphNode::QI(ref sig, pattern) => {
                if ctxt.config.debug {
                    format!(
                        "{}: {}",
                        ctxt.parser[sig.quantifier].kind.with(&ctxt),
                        pattern.with_data(&ctxt, &mut Some(sig.quantifier))
                    )
                } else {
                    format!("{}", pattern.with_data(&ctxt, &mut Some(sig.quantifier)))
                }
            }
            MLGraphNode::FixedENode(matched_term) => {
                format!("{}", matched_term.with(&ctxt))
            }
            MLGraphNode::RecurringENode(matched_term, input) => {
                ctxt.config.input = input;
                if ctxt.config.debug {
                    format!("{} ({input:?})", matched_term.with(&ctxt))
                } else {
                    format!("{}", matched_term.with(&ctxt))
                }
            }
            MLGraphNode::FixedEquality(from, to) => {
                format!("{} = {}", from.with(&ctxt), to.with(&ctxt))
            }
            MLGraphNode::RecurringEquality(from, to, input) => {
                ctxt.config.input = input;
                if ctxt.config.debug {
                    format!("{} = {} ({input:?})", from.with(&ctxt), to.with(&ctxt))
                } else {
                    format!("{} = {}", from.with(&ctxt), to.with(&ctxt))
                }
            }
        }
    }

    fn style(&self, _ctx: ()) -> &'static str {
        use MLGraphNode::*;
        match self {
            QI(..) | RecurringENode(..) | RecurringEquality(..) => "filled",
            FixedENode(..) | FixedEquality(..) => "filled,dashed",
        }
    }

    fn shape(&self, (): ()) -> &'static str {
        "box"
    }

    fn fillcolor(&self, ctx: QuantIdxToColourMap) -> String {
        use MLGraphNode::*;
        match self {
            QI(sig, _) => {
                let hue = ctx.get_rbg_hue(Some(sig.quantifier)) / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            FixedENode(..) | RecurringENode(..) => "lightgrey".to_owned(),
            FixedEquality(..) | RecurringEquality(..) => "white".to_owned(),
        }
    }
}
