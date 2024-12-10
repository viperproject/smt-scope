use core::fmt;

use smt_log_parser::{
    analysis::{
        analysis::matching_loop::{MLGraphEdge, MLGraphNode, RecurrenceKind},
        raw::{NodeKind, ProofReach},
        visible::VisibleEdge,
    },
    display_with::{DisplayCtxt, DisplayWithCtxt},
    items::{ENodeIdx, MatchKind, QuantPat},
    Z3Parser,
};

use crate::{screen::file::quant_graph::QuantPatKind, utils::colouring::QuantIdxToColourMap};

use super::file::quant_graph::{QuantEdge, QuantEdgeKind, QuantNode, QuantNodeKind};

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
pub const OTHER_FULL_SHAPE: &str = "egg";
pub const PROOF_SHAPE: &str = "doublecircle";
pub const PROOF_FULL_SHAPE: &str = "circle";

pub const ENODE_COLOUR: &str = "lightgray";
pub const EQ_COLOUR: &str = "white";
pub const PROOF_COLOUR: &str = "ivory";
pub const FALSE_COLOUR: &str = "lightcoral";
pub const ASSERTED_COLOUR: &str = "palegreen";

pub const NODE_COLOUR_SATURATION: f64 = 0.4;
pub const NODE_COLOUR_VALUE: f64 = 0.95;

all_struct!(AllNodeProperties {
    label: String,
    fontsize: String,
    tooltip: String,
    style: &'static str,
    shape: &'static str,
    fillcolor: String,
    class: String,
    ordering: &'static str,
    penwidth: String,
});

pub trait DotNodeProperties<
    LabelCtx,
    FontsizeCtx,
    TooltipCtx,
    StyleCtx,
    ShapeCtx,
    ColCtx,
    ClassCtx,
    OrderingCtx,
    PenwidthCtx,
>
{
    #[allow(clippy::too_many_arguments)]
    fn all(
        &self,
        label: LabelCtx,
        fontsize: FontsizeCtx,
        tooltip: TooltipCtx,
        style: StyleCtx,
        shape: ShapeCtx,
        fillcolor: ColCtx,
        class: ClassCtx,
        ordering: OrderingCtx,
        penwidth: PenwidthCtx,
    ) -> String {
        AllNodeProperties {
            label: self.label(label),
            fontsize: self.fontsize(fontsize),
            tooltip: self.tooltip(tooltip),
            style: self.style(style),
            shape: self.shape(shape),
            fillcolor: self.fillcolor(fillcolor),
            class: self.class(class),
            ordering: self.ordering(ordering),
            penwidth: self.penwidth(penwidth),
        }
        .to_string()
    }

    fn label(&self, _ctx: LabelCtx) -> String {
        Default::default()
    }

    fn fontsize(&self, _ctx: FontsizeCtx) -> String {
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

    fn class(&self, _ctx: ClassCtx) -> String {
        Default::default()
    }

    fn ordering(&self, _ctx: OrderingCtx) -> &'static str {
        ""
    }

    fn penwidth(&self, _ctx: PenwidthCtx) -> String {
        Default::default()
    }
}

impl
    DotNodeProperties<
        (),
        (),
        &'_ Z3Parser,
        (&'_ Z3Parser, ProofReach),
        (u32, u32),
        (&'_ Z3Parser, &'_ QuantIdxToColourMap, ProofReach),
        (),
        (),
        (),
    > for NodeKind
{
    fn label(&self, (): ()) -> String {
        self.to_string()
    }

    fn tooltip(&self, parser: &Z3Parser) -> String {
        use NodeKind::*;
        fn get_name(parser: &Z3Parser, enode: ENodeIdx) -> &str {
            let name = parser[parser[enode].owner].kind.app_name();
            name.map(|n| &parser[n]).unwrap_or_default()
        }
        match *self {
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
                let len = parser[eq].given_len.map(|l| l.to_string());
                let len = len.as_deref().unwrap_or("?");
                format!("{from} =[{len}] {to}")
            }
            Proof(proof) => {
                let name = &parser[parser[proof].result].kind.app_name();
                let name = name.map(|n| &parser[n]).unwrap_or_default();
                name.to_string()
            }
        }
    }

    fn style(&self, (parser, reach): (&Z3Parser, ProofReach)) -> &'static str {
        match *self {
            NodeKind::Instantiation(inst) => {
                if parser[parser[inst].match_].kind.is_mbqi() {
                    "filled,dashed"
                } else {
                    "filled"
                }
            }
            NodeKind::Proof(proof) => {
                if parser[proof].kind.is_hypothesis() {
                    "filled,dotted"
                } else if reach.under_hypothesis() {
                    "filled,dashed"
                } else {
                    "filled"
                }
            }
            _ => "filled",
        }
    }

    fn shape(&self, (hidden_parents, hidden_children): (u32, u32)) -> &'static str {
        use NodeKind::*;
        match (self, hidden_children, hidden_parents) {
            (Instantiation(..), 0, 0) => INST_SHAPE,
            (Instantiation(..), 0, _) => "house",
            (Instantiation(..), _, 0) => "invhouse",
            (Instantiation(..), _, _) => "diamond",
            (ENode(..) | GivenEquality(..) | TransEquality(..), 0, 0) => OTHER_FULL_SHAPE,
            (Proof(..), 0, 0) => PROOF_FULL_SHAPE,
            (ENode(..) | GivenEquality(..) | TransEquality(..), _, _) => OTHER_SHAPE,
            (Proof(..), _, _) => PROOF_SHAPE,
        }
    }

    fn fillcolor(
        &self,
        (parser, colour_map, reach): (&Z3Parser, &QuantIdxToColourMap, ProofReach),
    ) -> String {
        use NodeKind::*;
        match *self {
            Instantiation(iidx) => {
                let match_ = &parser[parser[iidx].match_];
                let hue = colour_map.get_rbg_hue(match_.kind.quant_idx());
                let hue = hue.unwrap() / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            ENode(..) => ENODE_COLOUR.to_owned(),
            GivenEquality(..) | TransEquality(..) => EQ_COLOUR.to_owned(),
            Proof(proof) => {
                let kind = parser[proof].kind;
                if reach.proves_false() {
                    FALSE_COLOUR.to_owned()
                } else if kind.is_asserted() {
                    ASSERTED_COLOUR.to_owned()
                } else {
                    PROOF_COLOUR.to_owned()
                }
            }
        }
    }

    fn ordering(&self, (): ()) -> &'static str {
        match self {
            NodeKind::Instantiation(..) => "in",
            _ => "",
        }
    }
}

impl
    DotNodeProperties<
        DisplayCtxt<'_>,
        (),
        DisplayCtxt<'_>,
        (),
        (),
        &'_ QuantIdxToColourMap,
        (),
        (),
        (),
    > for MLGraphNode
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
                .with_data(&ctxt, &mut Some(sig.qpat.quant))
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
            QI(ref sig, _) => ctxt.parser[sig.qpat.quant].kind.with(&ctxt).to_string(),
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
                let hue = ctx.get_rbg_hue(Some(sig.qpat.quant)).unwrap() / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            FixedENode(..) | RecurringENode(..) => ENODE_COLOUR.to_owned(),
            FixedEquality(..) | RecurringEquality(..) => EQ_COLOUR.to_owned(),
        }
    }

    fn class(&self, (): ()) -> String {
        use MLGraphNode::*;
        let class = match *self {
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
        };
        class.to_string()
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

struct PercentDisplay<const BOLD: bool = true>(f64);
impl PercentDisplay<true> {
    fn new(percent: f64) -> PercentDisplay<false> {
        PercentDisplay(percent)
    }
    fn bold(percent: f64) -> PercentDisplay<true> {
        PercentDisplay(percent)
    }
}
impl<const BOLD: bool> fmt::Display for PercentDisplay<BOLD> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if BOLD {
            write!(f, "<b>")?;
        }
        let p = self.0;
        if p > 10.0 {
            write!(f, "{p:.0}%")
        } else if p > 1.0 {
            write!(f, "{p:.1}%")
        } else {
            write!(f, "{p:.2}%")
        }?;
        if BOLD {
            write!(f, "</b>")?;
        }
        Ok(())
    }
}

impl
    DotNodeProperties<
        DisplayCtxt<'_>,
        f64,
        DisplayCtxt<'_>,
        (),
        (),
        &'_ QuantIdxToColourMap,
        (),
        (),
        f64,
    > for QuantNode
{
    fn label(&self, ctxt: DisplayCtxt) -> String {
        use QuantNodeKind::*;
        let percent = PercentDisplay::bold(self.percent);
        match self.kind {
            Quant(..) => {
                let name = ctxt.parser[self.quant].kind.name(&ctxt.parser.strings);
                let name = name.unwrap_or("lambda".into());
                let name = ammonia::clean_text(&name);
                format!("{name} {percent}")
            }
            QuantPat(qpat, kind) => match kind {
                QuantPatKind::Full => {
                    if let Some(pat) = qpat.pat {
                        format!("{{ {} }} {percent}", usize::from(pat) + 1)
                    } else {
                        format!("MBQI {percent}")
                    }
                }
                QuantPatKind::Single { is_single_pat } => {
                    let pat = ctxt.parser.get_pattern(qpat).unwrap();
                    let mut data = Some(qpat.quant);
                    let pat = pat.with_data(&ctxt, &mut data);
                    if is_single_pat {
                        format!("{pat}")
                    } else {
                        format!("{pat} {percent}")
                    }
                }
            },
            SubPat(pat, idx) => {
                let pat = ctxt.parser.patterns(self.quant).unwrap()[pat];
                let subpat = ctxt.parser[pat].child_ids[idx];
                let mut data = Some(self.quant);
                let subpat = subpat.with_data(&ctxt, &mut data);
                format!("{subpat}")
            }
        }
    }

    fn fontsize(&self, max_width: f64) -> String {
        let fontsize = 4. * self.percent * max_width / 100. + 14.;
        format!("{fontsize:.1}")
    }

    fn tooltip(&self, _ctxt: DisplayCtxt) -> String {
        // TODO
        Default::default()
    }

    fn style(&self, _ctx: ()) -> &'static str {
        match self.kind {
            // MBQI
            QuantNodeKind::QuantPat(QuantPat { pat: None, .. }, ..) => "filled,dashed",
            _ => "filled",
        }
    }

    fn shape(&self, (): ()) -> &'static str {
        // match self.kind {
        //     QuantNodeKind::Quant(..) | QuantNodeKind::QuantPat(QuantPat { .. }, QuantPatKind::Full, ..) => {
        "box"
        //     }
        //     _ => "ellipse",
        // }
    }

    fn fillcolor(&self, ctx: &QuantIdxToColourMap) -> String {
        match self.kind {
            QuantNodeKind::Quant(..) | QuantNodeKind::QuantPat(_, QuantPatKind::Full, ..) => {
                let hue = ctx.get_rbg_hue(Some(self.quant)).unwrap() / 360.0;
                format!("{hue} {NODE_COLOUR_SATURATION} {NODE_COLOUR_VALUE}")
            }
            _ => "white".to_string(),
        }
    }

    fn class(&self, _ctx: ()) -> String {
        format!("{:?}", self.quant)
    }

    fn ordering(&self, (): ()) -> &'static str {
        if self.can_have_deps() {
            ""
        } else {
            "in"
        }
    }

    // fn penwidth(&self, max_width: f64) -> String {
    //     let penwidth = (self.percent * max_width / 100.).max(0.2);
    //     format!("{penwidth}")
    // }
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
    arrowsize: String,
    minlen: &'static str,
    penwidth: String,
    constraint: &'static str,
});

pub trait DotEdgeProperties<
    LabelCtx,
    TooltipCtx,
    StyleCtx,
    ClassCtx,
    ArrowheadCtx,
    ArrowsizeCtx,
    MinlenCtx,
    PenwidthCtx,
    ConstraintCtx,
>
{
    #[allow(clippy::too_many_arguments)]
    fn all(
        &self,
        label: LabelCtx,
        tooltip: TooltipCtx,
        style: StyleCtx,
        class: ClassCtx,
        arrowhead: ArrowheadCtx,
        arrowsize: ArrowsizeCtx,
        minlen: MinlenCtx,
        penwidth: PenwidthCtx,
        constraint: ConstraintCtx,
    ) -> String {
        AllEdgeProperties {
            label: self.label(label),
            tooltip: self.tooltip(tooltip),
            style: self.style(style),
            class: self.class(class),
            arrowhead: self.arrowhead(arrowhead),
            arrowsize: self.arrowsize(arrowsize),
            minlen: self.minlen(minlen),
            penwidth: self.penwidth(penwidth),
            constraint: self.constraint(constraint),
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

    fn arrowsize(&self, _ctx: ArrowsizeCtx) -> String {
        Default::default()
    }

    fn minlen(&self, _ctx: MinlenCtx) -> &'static str {
        ""
    }

    fn penwidth(&self, _ctx: PenwidthCtx) -> String {
        Default::default()
    }

    fn constraint(&self, _ctx: ConstraintCtx) -> &'static str {
        ""
    }
}

impl DotEdgeProperties<(), (bool, NodeKind, NodeKind), bool, bool, NodeKind, (), (), (), ()>
    for VisibleEdge
{
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

impl DotEdgeProperties<bool, (), (), (), (), (), (), (), ()> for MLGraphEdge {
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

impl DotEdgeProperties<(), (), (), (), (), f64, (), f64, (&QuantNode, &QuantNode)> for QuantEdge {
    fn tooltip(&self, (): ()) -> String {
        let percent = PercentDisplay::new(self.percent);
        percent.to_string()
    }

    fn style(&self, (): ()) -> &'static str {
        use QuantEdgeKind::*;
        match self.kind {
            QuantPatToQuant | SubPatToQuantPat | SubPatToQuant => "dashed",
            _ => "solid",
        }
    }

    fn arrowhead(&self, (): ()) -> &'static str {
        if self.is_eq() {
            "empty"
        } else {
            "normal"
        }
    }

    fn arrowsize(&self, max_width: f64) -> String {
        let penwidth = (self.percent * max_width / 100.).max(0.2);
        let arrowsize: f64 = if penwidth > 10.0 {
            0.1
        } else if penwidth > 7.0 {
            0.2
        } else if penwidth > 5.0 {
            0.3
        } else if penwidth > 3.0 {
            0.4
        } else {
            0.5
        };
        if self.is_eq() {
            format!("{:.1}", arrowsize.sqrt())
        } else {
            format!("{arrowsize:.1}")
        }
    }

    fn penwidth(&self, max_width: f64) -> String {
        let penwidth = (self.percent * max_width / 100.).max(0.2);
        format!("{penwidth}")
    }

    fn constraint(&self, (from, to): (&QuantNode, &QuantNode)) -> &'static str {
        use QuantEdgeKind::*;
        match self.kind {
            Yield | YieldEq if from.quant == to.quant => "false",
            _ => "",
        }
    }
}
