use mem_dbg::{MemDbg, MemSize};
use serde::{Deserialize, Serialize};
use std::borrow::Cow;
use std::fmt;
use std::num::{NonZeroU32, NonZeroUsize};
use std::ops::Index;
use crate::display_with::DisplayConfiguration;
use crate::error::Either;
use crate::{BoxSlice, FxHashMap, IString, StringTable};
use crate::{Result, Error};

#[macro_export]
macro_rules! idx {
    ($struct:ident, $prefix:tt) => {
        #[derive(
            Clone, Copy, Eq, PartialEq, Serialize, Deserialize, PartialOrd, Ord, Hash, MemSize, MemDbg,
        )]
        pub struct $struct(NonZeroUsize);
        impl From<usize> for $struct {
            fn from(value: usize) -> Self {
                Self(NonZeroUsize::new(value.checked_add(1).unwrap()).unwrap())
            }
        }
        impl From<$struct> for usize {
            fn from(value: $struct) -> Self {
                value.0.get() - 1
            }
        }
        impl fmt::Debug for $struct {
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                write!(f, $prefix, self.0.get() - 1)
            }
        }
        impl fmt::Display for $struct {
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                write!(f, "{}", self.0.get() - 1)
            }
        }
    };
}
idx!(TermIdx, "t{}");
idx!(QuantIdx, "q{}");
idx!(InstIdx, "i{}");
idx!(StackIdx, "s{}");
idx!(ENodeIdx, "e{}");
idx!(MatchIdx, "m{}");
idx!(EqGivenIdx, "≡{}");
idx!(EqTransIdx, "={}");
idx!(GraphIdx, "g{}");

/// A Z3 term and associated data.
#[derive(Debug, Serialize, Deserialize, PartialEq, Eq, Hash, Clone, MemSize, MemDbg)]
pub struct Term {
    pub id: Option<TermId>,
    pub kind: TermKind,
    // Reduces memory usage compared to a Vec
    pub child_ids: Box<[TermIdx]>,
}

#[derive(Debug, Clone, Serialize, Deserialize, Copy, PartialEq, Eq, Hash, MemSize, MemDbg)]
pub enum TermKind {
    Var(usize),
    ProofOrApp(ProofOrApp),
    Quant(QuantIdx),
    Generalised,
}

#[derive(Debug, Clone, Serialize, Deserialize, Copy, PartialEq, Eq, Hash, MemSize, MemDbg)]
pub struct ProofOrApp {
    pub is_proof: bool,
    pub name: IString,
}

impl TermKind {
    pub(crate) fn parse_var(value: &str) -> Result<TermKind> {
        value.parse::<usize>().map(TermKind::Var).map_err(Error::InvalidVar)
    }
    pub(crate) fn parse_proof_app(is_proof: bool, name: IString) -> Self {
        Self::ProofOrApp(ProofOrApp { is_proof, name })
    }
    pub fn quant_idx(&self) -> Option<QuantIdx> {
        match self {
            Self::Quant(idx) => Some(*idx),
            _ => None,
        }
    }
    pub fn app_name(&self) -> Option<IString> {
        match self {
            Self::ProofOrApp(ProofOrApp { is_proof: false, name }) => Some(*name),
            _ => None,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, PartialEq, Eq, Clone, Copy, Hash, MemSize, MemDbg)]
pub struct Meaning {
    /// The theory in which the value should be interpreted (e.g. `bv`)
    pub theory: IString,
    /// The value of the term (e.g. `#x0000000000000001` or `#b1`)
    pub value: IString,
}

/// Returned when indexing with `TermIdx`
#[derive(Debug, PartialEq, Eq, Clone, Hash, MemSize, MemDbg)]
pub struct TermAndMeaning<'a> {
    pub term: &'a Term,
    pub meaning: Option<&'a Meaning>,
}

/// A Z3 quantifier and associated data.
#[derive(Debug, MemSize, MemDbg, Serialize, Deserialize)]
pub struct Quantifier {
    pub kind: QuantKind,
    pub num_vars: usize,
    pub term: Option<TermIdx>,
    pub vars: Option<VarNames>,
}

/// Represents an ID string of the form `name!id`.
#[derive(Debug, Clone, MemSize, MemDbg, Serialize, Deserialize)]
pub enum QuantKind {
    Other(IString), // From `[inst-discovered]` with `theory-solving` or `MBQI`
    Lambda,
    NamedQuant(IString),
    /// Represents a name string of the form `name!id`
    UnnamedQuant {
        name: IString,
        id: usize,
    },
}

impl QuantKind {
    /// Splits an ID string into name and ID number (if unnamed).
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")    
    pub(crate) fn parse(strings: &mut StringTable, value: &str) -> Self {
        if value == "<null>" {
            return Self::Lambda;
        }
        let mut split = value.split('!');
        let name = split.next().expect(value);
        split
            .next()
            .and_then(|id| id.parse::<usize>().ok())
            .map(|id| Self::UnnamedQuant {
                name: IString(strings.get_or_intern(name)),
                id,
            })
            .unwrap_or_else(|| Self::NamedQuant(IString(strings.get_or_intern(value))))
    }
    pub fn is_discovered(&self) -> bool {
        matches!(self, Self::Other(_))
    }
    pub fn user_name(&self) -> Option<IString> {
        match self {
            Self::NamedQuant(name) | Self::Other(name) => Some(*name),
            _ => None,
        }
    }
}

#[derive(Debug, MemSize, MemDbg, Serialize, Deserialize)]
pub enum VarNames {
    TypeOnly(Box<[IString]>),
    NameAndType(Box<[(IString, IString)]>),
}
impl VarNames {
    pub fn get_name<'a>(strings: &'a StringTable, this: Option<&Self>, idx: usize, config: &DisplayConfiguration) -> Cow<'a, str> {
        let name = match this {
            Some(Self::NameAndType(names)) => Cow::Borrowed(&strings[*names[idx].0]),
            None | Some(Self::TypeOnly(_)) => Cow::Owned(if config.use_mathematical_symbols {
                format!("•{idx}")
            } else {
                format!("qvar_{idx}")
            }),
        };
        if config.html {
            const COLORS: [&str; 9] = ["blue", "green", "olive", "maroon", "teal", "purple", "red", "fuchsia", "navy"];
            let color = COLORS[idx % COLORS.len()];
            let name = format!("<div style=\"color:{color};display:inline\">{name}</div>");
            Cow::Owned(name)
        } else {
            name
        }
    }
    pub fn get_type(strings: &StringTable, this: Option<&Self>, idx: usize) -> String {
        this.as_ref()
            .map(|this| {
                let ty = match this {
                    Self::TypeOnly(names) => names[idx],
                    Self::NameAndType(names) => names[idx].1,
                };
                format!(": {}", &strings[*ty])
            })
            .unwrap_or_default()
    }
    pub fn len(&self) -> usize {
        match self {
            Self::TypeOnly(names) => names.len(),
            Self::NameAndType(names) => names.len(),
        }
    }
}

/// A Z3 instantiation.
#[derive(Debug, Clone, MemSize, MemDbg, Serialize, Deserialize)]
pub struct Instantiation {
    pub match_: MatchIdx,
    pub fingerprint: Fingerprint,
    pub proof_id: Option<Either<TermIdx, TermId>>,
    pub z3_generation: Option<u32>,
    pub yields_terms: Box<[ENodeIdx]>,
}

impl Instantiation {
    pub fn get_resulting_term(&self) -> Option<TermIdx> {
        self.proof_id.as_ref()?.as_result_ref().ok().copied()
    }
}

#[derive(Debug, Clone, MemSize, MemDbg, Serialize, Deserialize)]
pub struct Match {
    pub kind: MatchKind,
    pub blamed: Box<[BlameKind]>,
}

impl Match {
    /// A quantifier may have multiple possible triggers where each
    /// instantiation will be due to matching exactly one. Each of these
    /// triggers has a sequence of arbitrarily many terms which must all be
    /// matched. This returns a sequence of `Blame` where each explains how the
    /// corresponding term in the trigger was matched.
    pub fn trigger_matches(&self) -> impl Iterator<Item = Blame> {
        let mut last = 0;
        let terms = self.blamed.iter().enumerate().flat_map(|(idx, blame)| 
            matches!(blame, BlameKind::Term { .. }).then(|| idx)
        ).chain([self.blamed.len()]);
        terms.skip(1).map(move |idx| {
            let slice = &self.blamed[last..idx];
            last = idx;
            Blame { slice }
        })
    }
}

#[derive(Debug, Clone, MemSize, MemDbg, Serialize, Deserialize, Hash, Eq, PartialEq)]
pub enum MatchKind {
    MBQI {
        quant: QuantIdx,
        bound_terms: Box<[ENodeIdx]>,
    },
    TheorySolving {
        axiom_id: TermId,
        bound_terms: Box<[TermIdx]>,
        rewrite_of: Option<TermIdx>,
    },
    Axiom {
        axiom: QuantIdx,
        pattern: TermIdx,
        bound_terms: Box<[TermIdx]>,
    },
    Quantifier {
        quant: QuantIdx,
        pattern: TermIdx,
        bound_terms: Box<[ENodeIdx]>,
    },
}
impl MatchKind {
    pub fn quant_idx(&self) -> Option<QuantIdx> {
        match self {
            Self::MBQI { quant, .. }
            | Self::Axiom { axiom: quant, .. }
            | Self::Quantifier { quant, .. } => Some(*quant),
            _ => None,
        }
    }
    pub fn pattern(&self) -> Option<TermIdx> {
        match self {
            Self::MBQI { .. } | Self::TheorySolving { .. } => None,
            Self::Axiom { pattern, .. } | Self::Quantifier { pattern, .. } => Some(*pattern),
        }
    }
    pub fn bound_terms<T>(
        &self,
        enode: impl Fn(ENodeIdx) -> T,
        term: impl Fn(TermIdx) -> T,
    ) -> Vec<T> {
        match self {
            Self::MBQI { bound_terms, .. } | Self::Quantifier { bound_terms, .. } => {
                bound_terms.iter().map(|&x| enode(x)).collect()
            }
            Self::TheorySolving { bound_terms, .. } | Self::Axiom { bound_terms, .. } => {
                bound_terms.iter().map(|&x| term(x)).collect()
            }
        }
    }
    pub fn is_discovered(&self) -> bool {
        self.quant_idx().is_none()
    }
    pub fn is_mbqi(&self) -> bool {
        matches!(self, Self::MBQI { .. })
    }
    // TODO: this is currently unused
    pub fn rewrite_of(&self) -> Option<TermIdx> {
        match self {
            Self::TheorySolving { rewrite_of, .. } => *rewrite_of,
            _ => None,
        }
    }
}

/// The kind of dependency between two quantifier instantiations.
/// - Term: one instantiation produced a term that the other triggered on
/// - Equality: dependency based on an equality.
#[derive(Debug, Clone, MemSize, MemDbg, Serialize, Deserialize)]
pub enum BlameKind {
    Term { term: ENodeIdx },
    Equality { eq: EqTransIdx },
}
impl BlameKind {
    fn unwrap_enode(&self) -> &ENodeIdx {
        match self {
            Self::Term { term } => term,
            _ => panic!("expected term"),
        }
    }
    fn unwrap_eq(&self) -> &EqTransIdx {
        match self {
            Self::Equality { eq } => eq,
            _ => panic!("expected equality"),
        }
    }
}

/// Explains how a term in a trigger was matched. It will always start with an
/// enode and then have some sequence of equalities used to rewrite distinct
/// subexpressions of the enode.
#[derive(Debug, Clone, Copy)]
pub struct Blame<'a> {
    slice: &'a [BlameKind],
}
impl<'a> Blame<'a> {
    pub fn enode(self) -> ENodeIdx {
        *self.slice[0].unwrap_enode()
    }
    pub fn len(self) -> usize {
        self.slice.len() - 1
    }
    pub fn equalities(self) -> impl Iterator<Item = EqTransIdx> + 'a {
        self.slice.iter().skip(1).map(|x| *x.unwrap_eq())
    }

}
impl Index<usize> for Blame<'_> {
    type Output = EqTransIdx;
    fn index(&self, idx: usize) -> &Self::Output {
        self.slice[idx + 1].unwrap_eq()
    }
}

/// An identifier for a Z3 quantifier instantiation (called "fingerprint" in the original Axiom Profiler).
/// Represented as a 16-digit hexadecimal number in log files.
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, MemSize, MemDbg, Serialize, Deserialize)]
pub struct Fingerprint(pub u64);
impl Fingerprint {
    pub fn parse(value: &str) -> Result<Self> {
        u64::from_str_radix(value.strip_prefix("0x").unwrap_or(value), 16)
            .map(Self)
            .map_err(Error::InvalidFingerprint)
    }
    pub fn is_zero(&self) -> bool {
        self.0 == 0
    }
}
impl std::ops::Deref for Fingerprint {
    type Target = u64;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
impl fmt::Display for Fingerprint {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:x}", self.0)
    }
}

/// Represents an ID string of the form `name#id` or `name#`.
#[derive(Debug, Clone, Copy, MemSize, MemDbg, Serialize, Deserialize, Default, Hash, PartialEq, Eq)]
pub struct TermId {
    pub namespace: IString,
    pub id: Option<NonZeroU32>,
}
impl TermId {
    /// Splits an ID string into namespace and ID number.
    /// 0 is used for identifiers without a number
    /// (usually for theory-solving 'quantifiers' such as "basic#", "arith#")
    pub fn parse(strings: &mut StringTable, value: &str) -> Result<Self> {
        let hash_idx = value.bytes().position(|b| b == b'#');
        let hash_idx = hash_idx.ok_or_else(|| Error::InvalidIdHash(value.to_string()))?;
        let namespace = IString(strings.get_or_intern(&value[..hash_idx]));
        let id = &value[hash_idx + 1..];
        let id = match id {
            "" => None,
            id => Some(NonZeroU32::new(id.parse::<u32>().map_err(Error::InvalidIdNumber)?.checked_add(1).unwrap()).unwrap()),
        };
        Ok(Self { namespace, id })
    }
    pub fn order(&self) -> u32 {
        self.id.map(|id| id.get()).unwrap_or_default()
    }
    pub fn display_id(&self) -> Option<u32> {
        self.id.map(|id| id.get() - 1)
    }
}

/// Remapping from `TermId` to `TermIdx`. We want to have a single flat vector
/// of terms but `TermId`s don't map to this nicely, additionally the `TermId`s
/// may repeat and so we want to map to the latest current `TermIdx`. Has a
/// special fast path for the common empty namespace case.
#[derive(Debug, MemSize, MemDbg)]
pub struct TermIdToIdxMap {
    empty_string: IString,
    empty_namespace: Vec<Option<TermIdx>>,
    namespace_map: FxHashMap<IString, Vec<Option<TermIdx>>>,
}
impl TermIdToIdxMap {
    pub fn new(strings: &mut StringTable) -> Self {
        Self {
            empty_string: IString(strings.get_or_intern_static("")),
            empty_namespace: Vec::new(),
            namespace_map: FxHashMap::default(),
        }
    }
    fn get_vec_mut(&mut self, namespace: IString) -> Result<&mut Vec<Option<TermIdx>>>{
        if self.empty_string == namespace {
            // Special handling of common case for empty namespace
            Ok(&mut self.empty_namespace)
        } else {
            self.namespace_map.try_reserve(1)?;
            Ok(self.namespace_map.entry(namespace).or_default())
        }
    }
    pub fn register_term(&mut self, id: TermId, idx: TermIdx) -> Result<()> {
        let id_idx = id.order() as usize;
        let vec = self.get_vec_mut(id.namespace)?;
        if id_idx >= vec.len() {
            let new_len = id_idx + 1;
            vec.try_reserve(new_len - vec.len())?;
            vec.resize(new_len, None);
        }
        // The `id` of two different terms may clash and so we may remove
        // a `TermIdx` from the map. This is fine since we want future uses of
        // `id` to refer to the new term and not the old one.
        vec[id_idx].replace(idx);
        Ok(())
    }
    fn get_vec(&self, namespace: IString) -> Option<&Vec<Option<TermIdx>>> {
        if self.empty_string == namespace {
            Some(&self.empty_namespace)
        } else {
            self.namespace_map.get(&namespace)
        }
    }
    pub fn get_term(&self, id: &TermId) -> Option<TermIdx> {
        self.get_vec(id.namespace)
            .and_then(|vec| vec.get(id.order() as usize).and_then(|x| x.as_ref()))
            .copied()
    }
}

/// A Z3 equality explanation.
/// Root represents a term that is a root of its equivalence class.
/// All other variants represent an equality between two terms and where it came from.
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, MemSize, MemDbg)]
pub enum EqualityExpl {
    Root {
        id: ENodeIdx,
    },
    Literal {
        from: ENodeIdx,
        /// The equality term this is from
        eq: ENodeIdx,
        to: ENodeIdx,
    },
    Congruence {
        from: ENodeIdx,
        arg_eqs: Box<[(ENodeIdx, ENodeIdx)]>,
        to: ENodeIdx,
        /// The `arg_eqs` need to be evaluated whenever this is used.
        uses: Vec<BoxSlice<EqTransIdx>>,
    },
    Theory {
        from: ENodeIdx,
        theory: IString,
        to: ENodeIdx,
    },
    Axiom {
        from: ENodeIdx,
        to: ENodeIdx,
    },
    Unknown {
        kind: IString,
        from: ENodeIdx,
        args: Box<[IString]>,
        to: ENodeIdx,
    },
}

impl EqualityExpl {
    pub fn from(&self) -> ENodeIdx {
        use EqualityExpl::*;
        match *self {
            Root { id } => id,
            Literal { from, .. }
            | Congruence { from, .. }
            | Theory { from, .. }
            | Axiom { from, .. }
            | Unknown { from, .. } => from,
        }
    }
    pub fn to(&self) -> ENodeIdx {
        use EqualityExpl::*;
        match *self {
            Root { id } => id,
            Literal { to, .. }
            | Congruence { to, .. }
            | Theory { to, .. }
            | Axiom { to, .. }
            | Unknown { to, .. } => to,
        }
    }
    pub fn walk_any(&self, from: ENodeIdx) -> ENodeIdx {
        let Some(to) = self.walk(from, true).or_else(|| self.walk(from, false)) else {
            panic!("walking from {from:?} with {:?} <--> {:?}", self.from(), self.to());
        };
        to
    }
    pub fn walk(&self, from: ENodeIdx, fwd: bool) -> Option<ENodeIdx> {
        if fwd {
            (self.from() == from).then(|| self.to())
        } else {
            (self.to() == from).then(|| self.from())
        }
    }
    pub fn short_str(&self) -> &'static str {
        match self {
            EqualityExpl::Root { .. } => "root",
            EqualityExpl::Literal { .. } => "literal",
            EqualityExpl::Congruence { .. } => "congruence",
            EqualityExpl::Theory { .. } => "theory",
            EqualityExpl::Axiom { .. } => "axiom",
            EqualityExpl::Unknown { .. } => "unknown",
        }
    }
}

// Whenever a pair of enodes are said to be equal this uses transitive reasoning
// with one or more `EqualityExpl` to explain why.
#[derive(Debug, MemSize, MemDbg, Serialize, Deserialize)]
pub struct TransitiveExpl {
    pub path: Box<[TransitiveExplSegment]>,
    pub given_len: usize,
    pub to: ENodeIdx,
    pub from: ENodeIdx,
}
pub enum TransitiveExplIter<'a> {
    Forward(std::iter::Copied<std::slice::Iter<'a, TransitiveExplSegment>>),
    Backward(std::iter::Map<std::iter::Rev<std::iter::Copied<std::slice::Iter<'a, TransitiveExplSegment>>>, fn(TransitiveExplSegment) -> TransitiveExplSegment>),
}
impl<'a> TransitiveExplIter<'a> {
    pub fn next(&mut self) -> Option<TransitiveExplSegment> {
        match self {
            Self::Forward(iter) => iter.next(),
            Self::Backward(iter) => iter.next(),
        }
    }
}

impl TransitiveExpl {
    pub fn new(i: impl Iterator<Item = TransitiveExplSegment> + ExactSizeIterator, given_len: usize, from: ENodeIdx, to: ENodeIdx) -> Result<Self> {
        let mut path = Vec::new();
        path.try_reserve_exact(i.len())?;
        path.extend(i);
        Ok(Self { path: path.into_boxed_slice(), given_len, to, from })
    }
    pub fn empty(from: ENodeIdx, to: ENodeIdx) -> Self {
        Self { path: Box::new([]), given_len: 0, to, from }
    }
    pub fn all(&self, fwd: bool) -> TransitiveExplIter {
        let iter = self.path.iter().copied();
        if fwd {
            TransitiveExplIter::Forward(iter)
        } else {
            TransitiveExplIter::Backward(TransitiveExplSegment::rev(iter))
        }
    }
}

#[derive(Debug, Clone, Copy, MemSize, MemDbg, Serialize, Deserialize)]
pub struct TransitiveExplSegment {
    pub forward: bool,
    pub kind: TransitiveExplSegmentKind,
}
impl TransitiveExplSegment {
    pub fn rev<I: Iterator<Item = TransitiveExplSegment> + std::iter::DoubleEndedIterator>(iter: I) -> std::iter::Map<std::iter::Rev<I>, fn(TransitiveExplSegment) -> TransitiveExplSegment> {
        // Negate the forward direction since we're walking
        // backwards (`.rev()` above).
        iter.rev().map(TransitiveExplSegment::rev_single)
    }
    fn rev_single(mut self) -> Self {
        self.forward = !self.forward;
        self
    }
}

#[derive(Debug, Clone, Copy, MemSize, MemDbg, Serialize, Deserialize)]
pub enum TransitiveExplSegmentKind {
    Given(EqGivenIdx, Option<NonZeroU32>),
    Transitive(EqTransIdx),
}
impl TransitiveExplSegmentKind {
    pub fn given(self) -> Option<EqGivenIdx> {
        match self {
            Self::Given(given, _) => Some(given),
            _ => None,
        }
    }
}
