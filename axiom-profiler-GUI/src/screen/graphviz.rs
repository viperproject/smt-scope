use core::fmt;

use smt_log_parser::{
    analysis::{
        analysis::matching_loop::{MLGraphEdge, MLGraphNode, RecurrenceKind},
        raw::NodeKind,
        visible::VisibleEdge,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::{ENodeIdx, MatchKind},
    Z3Parser,
};

use crate::utils::colouring::QuantIdxToColourMap;

macro_rules! all_struct {
    ($name:ident {
        label: String,
        $($field:ident: $ty:ty,)*
    }) => {
        struct $name {
            label: String,
            $($field: $ty,)*
        }

        impl fmt::Display for $name {
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                if !self.label.is_empty() {
                    write!(f, "label=<{}> ", self.label)?;
                }
                $(
                    if !self.$field.is_empty() {
                        write!(f, concat!(stringify!($field), "=\"{}\" "), self.$field)?;
                    }
                )*
                Ok(())
            }
        }
    }
}

// -------------
// Graphviz node
// -------------

pub const INST_SHAPE: &str = "box";
pub const OTHER_SHAPE: &str = "ellipse";
pub const SPECIAL_SHAPE: &str = "egg";

pub const ENODE_COLOUR: &str = "lightgray";
pub const EQ_COLOUR: &str = "white";

pub const NODE_COLOUR_SATURATION: f64 = 0.4;
pub const NODE_COLOUR_VALUE: f64 = 0.95;

all_struct!(AllNodeProperties {
    label: String,
    tooltip: String,
    style: &'static str,
    shape: &'static str,
    fillcolor: String,
    class: &'static str,
    ordering: &'static str,
});

pub trait DotNodeProperties<LabelCtx, TooltipCtx, StyleCtx, ShapeCtx, ColCtx, ClassCtx, OrderingCtx>
{
    #[allow(clippy::too_many_arguments)]
    fn all(
        &self,
        label: LabelCtx,
        tooltip: TooltipCtx,
        style: StyleCtx,
        shape: ShapeCtx,
        fillcolor: ColCtx,
        class: ClassCtx,
        ordering: OrderingCtx,
    ) -> String {
        AllNodeProperties {
            label: self.label(label),
            tooltip: self.tooltip(tooltip),
            style: self.style(style),
            shape: self.shape(shape),
            fillcolor: self.fillcolor(fillcolor),
            class: self.class(class),
            ordering: self.ordering(ordering),
        }
        .to_string()
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
        ""
    }

    fn fillcolor(&self, _ctx: ColCtx) -> String {
        Default::default()
    }

    fn class(&self, _ctx: ClassCtx) -> &'static str {
        ""
    }

    fn ordering(&self, _ctx: OrderingCtx) -> &'static str {
        ""
    }
}

impl
    DotNodeProperties<
        (),
        &'_ Z3Parser,
        &'_ Z3Parser,
        (u32, u32),
        (&'_ Z3Parser, &'_ QuantIdxToColourMap),
        (),
        (),
    > for NodeKind
{
    fn label(&self, (): ()) -> String {
        self.to_string()
    }

    fn tooltip(&self, parser: &'_ Z3Parser) -> String {
        use NodeKind::*;
        fn get_name(parser: &Z3Parser, enode: ENodeIdx) -> &str {
            let name = parser[parser[enode].owner].kind.app_name();
            name.map(|n| &parser[n]).unwrap_or_default()
        }
        match *self {
            ENode(enode) => get_name(parser, enode).to_string(),
            GivenEquality(eq, _) => {
                let eq = &parser[eq];
                let kind = eq.kind_str(&parser.strings);
                let (from, to) = (get_name(parser, eq.from()), get_name(parser, eq.to()));
                format!("{kind}: {from} = {to}")
            }
            TransEquality(eq) => {
                let (from, to) = parser.from_to(eq);
                let (from, to) = (get_name(parser, from), get_name(parser, to));
                let len = parser[eq].given_len;
                format!("{from} =[{len}] {to}")
            }
            Instantiation(inst) => match &parser[parser[inst].match_].kind {
                MatchKind::TheorySolving { axiom_id, .. } => {
                    let namespace = &parser[axiom_id.namespace];
                    let id = axiom_id.id.map(|id| format!("[{id}]")).unwrap_or_default();
                    format!("{namespace}{id}")
                }
                MatchKind::MBQI { quant, .. }
                | MatchKind::Axiom { axiom: quant, .. }
                | MatchKind::Quantifier { quant, .. } => parser[*quant]
                    .kind
                    .name(&parser.strings)
                    .unwrap()
                    .to_string(),
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

    fn fillcolor(&self, (parser, colour_map): (&Z3Parser, &QuantIdxToColourMap)) -> String {
        use NodeKind::*;
        match self {
            Instantiation(inst_idx) => {
                let match_ = &parser[parser[*inst_idx].match_];
                let hue = colour_map.get_rbg_hue(match_.kind.quant_idx()) / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            ENode(..) => ENODE_COLOUR.to_owned(),
            GivenEquality(..) | TransEquality(..) => EQ_COLOUR.to_owned(),
        }
    }

    fn ordering(&self, (): ()) -> &'static str {
        match self {
            NodeKind::Instantiation(..) => "in",
            _ => "",
        }
    }
}

impl DotNodeProperties<DisplayCtxt<'_>, DisplayCtxt<'_>, (), (), &'_ QuantIdxToColourMap, (), ()>
    for MLGraphNode
{
    fn label(&self, mut ctxt: DisplayCtxt) -> String {
        use MLGraphNode::*;
        match *self {
            HiddenNode(input) => match input {
                Some(true) => "input".to_owned(),
                Some(false) => "output".to_owned(),
                None => "const".to_owned(),
            },
            QI(ref sig, pattern) => pattern
                .simp
                .with_data(&ctxt, &mut Some(sig.quantifier))
                .to_string(),
            FixedENode(matched_term) => matched_term.simp.with(&ctxt).to_string(),
            RecurringENode(matched_term, input) => {
                ctxt.config.input = input.rec_input();
                matched_term.simp.with(&ctxt).to_string()
            }
            FixedEquality(from, to) => {
                format!("{} = {}", from.simp.with(&ctxt), to.simp.with(&ctxt))
            }
            RecurringEquality(from, to, input) => {
                ctxt.config.input = input.rec_input();
                format!("{} = {}", from.simp.with(&ctxt), to.simp.with(&ctxt))
            }
        }
    }

    fn tooltip(&self, mut ctxt: DisplayCtxt) -> String {
        ctxt.config.html = false;
        use MLGraphNode::*;
        match self {
            HiddenNode(input) => match input {
                Some(true) => {
                    "Recurring nodes coming into the generalised matching loop iteration."
                        .to_owned()
                }
                Some(false) => {
                    "Recurring nodes produced by the generalised matching loop iteration."
                        .to_owned()
                }
                None => {
                    "Fixed nodes which do not change but are used in each iteration.".to_owned()
                }
            },
            QI(ref sig, _) => ctxt.parser[sig.quantifier].kind.with(&ctxt).to_string(),
            FixedENode(matched_term) => matched_term.orig.with(&ctxt).to_string(),
            RecurringENode(matched_term, input) => {
                ctxt.config.input = input.rec_input();
                matched_term.orig.with(&ctxt).to_string()
            }
            FixedEquality(from, to) => {
                format!("{} = {}", from.orig.with(&ctxt), to.orig.with(&ctxt))
            }
            RecurringEquality(from, to, input) => {
                ctxt.config.input = input.rec_input();
                format!("{} = {}", from.orig.with(&ctxt), to.orig.with(&ctxt))
            }
        }
    }

    fn style(&self, _ctx: ()) -> &'static str {
        use MLGraphNode::*;
        match self {
            HiddenNode(..) => "",
            QI(..) | RecurringENode(..) | RecurringEquality(..) => "filled",
            FixedENode(..) | FixedEquality(..) => "filled,dashed",
        }
    }

    fn shape(&self, (): ()) -> &'static str {
        match self {
            Self::HiddenNode(..) => "plaintext",
            _ => "box",
        }
    }

    fn fillcolor(&self, ctx: &QuantIdxToColourMap) -> String {
        use MLGraphNode::*;
        match self {
            HiddenNode(..) => Default::default(),
            QI(sig, _) => {
                let hue = ctx.get_rbg_hue(Some(sig.quantifier)) / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            FixedENode(..) | RecurringENode(..) => ENODE_COLOUR.to_owned(),
            FixedEquality(..) | RecurringEquality(..) => EQ_COLOUR.to_owned(),
        }
    }

    fn class(&self, (): ()) -> &'static str {
        use MLGraphNode::*;
        match *self {
            FixedENode(..) | FixedEquality(..) => "fixed",
            RecurringENode(.., rec_kind) | RecurringEquality(.., rec_kind) => match rec_kind {
                RecurrenceKind::Input(..) => "input",
                RecurrenceKind::Output(..) => "output",
                RecurrenceKind::Intermediate => "middle",
            },
            HiddenNode(input) => match input {
                Some(true) => "input",
                Some(false) => "output",
                None => "fixed",
            },
            QI(..) => "middle",
        }
    }

    fn ordering(&self, (): ()) -> &'static str {
        use MLGraphNode::*;
        match *self {
            HiddenNode(Some(true)) => "out",
            HiddenNode(Some(false)) => "in",
            QI(..) => "in",
            _ => "",
        }
    }
}

// -------------
// Graphviz edge
// -------------

all_struct!(AllEdgeProperties {
    label: String,
    tooltip: String,
    style: &'static str,
    class: &'static str,
    arrowhead: &'static str,
    minlen: &'static str,
});

pub trait DotEdgeProperties<LabelCtx, TooltipCtx, StyleCtx, ClassCtx, ArrowheadCtx, MinlenCtx> {
    #[allow(clippy::too_many_arguments)]
    fn all(
        &self,
        label: LabelCtx,
        tooltip: TooltipCtx,
        style: StyleCtx,
        class: ClassCtx,
        arrowhead: ArrowheadCtx,
        minlen: MinlenCtx,
    ) -> String {
        AllEdgeProperties {
            label: self.label(label),
            tooltip: self.tooltip(tooltip),
            style: self.style(style),
            class: self.class(class),
            arrowhead: self.arrowhead(arrowhead),
            minlen: self.minlen(minlen),
        }
        .to_string()
    }

    fn label(&self, _ctx: LabelCtx) -> String {
        Default::default()
    }

    fn tooltip(&self, _ctx: TooltipCtx) -> String {
        Default::default()
    }

    fn style(&self, _ctx: StyleCtx) -> &'static str {
        ""
    }

    fn class(&self, _ctx: ClassCtx) -> &'static str {
        ""
    }

    fn arrowhead(&self, _ctx: ArrowheadCtx) -> &'static str {
        ""
    }

    fn minlen(&self, _ctx: MinlenCtx) -> &'static str {
        ""
    }
}

impl DotEdgeProperties<(), (bool, NodeKind, NodeKind), bool, bool, NodeKind, ()> for VisibleEdge {
    fn tooltip(&self, (is_indirect, from, to): (bool, NodeKind, NodeKind)) -> String {
        let arrow = match is_indirect {
            true => "↝",
            false => "→",
        };
        format!("{} {arrow} {}", from.label(()), to.label(()))
    }

    fn style(&self, is_indirect: bool) -> &'static str {
        match is_indirect {
            true => "dashed",
            false => "solid",
        }
    }

    fn class(&self, is_indirect: bool) -> &'static str {
        match is_indirect {
            true => "indirect",
            false => "direct",
        }
    }

    fn arrowhead(&self, blame: NodeKind) -> &'static str {
        match blame {
            NodeKind::GivenEquality(..) | NodeKind::TransEquality(_) => "empty",
            _ => "normal",
        }
    }
}

impl DotEdgeProperties<bool, (), (), (), (), ()> for MLGraphEdge {
    fn label(&self, debug: bool) -> String {
        if debug {
            format!("{self:?}")
        } else {
            Default::default()
        }
    }

    fn style(&self, (): ()) -> &'static str {
        match self {
            MLGraphEdge::HiddenEdge(..) => "invis",
            _ => "solid",
        }
    }

    fn arrowhead(&self, (): ()) -> &'static str {
        use MLGraphEdge::*;
        match self {
            HiddenEdge(..) => "none",
            Blame(..) | Yield => "normal",
            BlameEq(..) | YieldEq | CombineEq => "empty",
        }
    }

    fn minlen(&self, (): ()) -> &'static str {
        match self {
            MLGraphEdge::HiddenEdge(..) => "0",
            _ => "",
        }
    }
}
