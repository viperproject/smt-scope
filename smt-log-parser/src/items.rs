use fxhash::FxHashMap;
use serde::{Deserialize, Serialize};
use std::borrow::Cow;
use std::fmt;
use std::num::{NonZeroU32, NonZeroUsize};
use crate::{Result, Error};

pub type StringTable = lasso::Rodeo<lasso::Spur, fxhash::FxBuildHasher>;
pub type IString = lasso::Spur;

#[macro_export]
macro_rules! idx {
    ($struct:ident, $prefix:tt) => {
        #[derive(
            Clone, Copy, Eq, PartialEq, Serialize, Deserialize, PartialOrd, Ord, Hash,
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
                write!(f, $prefix, self.0)
            }
        }
        impl fmt::Display for $struct {
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                write!(f, "{}", self.0)
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

/// A Z3 term and associated data.
#[derive(Debug, Serialize, Deserialize,PartialEq, Eq, Hash, Clone)]
pub struct Term {
    pub id: Option<TermId>,
    pub kind: TermKind,
    // Reduces memory usage compared to a Vec
    pub child_ids: Box<[TermIdx]>,
}

#[derive(Debug, Clone, Serialize, Deserialize, Copy, PartialEq, Eq, Hash)]
pub enum TermKind {
    Var(usize),
    ProofOrApp(ProofOrApp),
    Quant(QuantIdx),
    GeneralizedPrimitive,
}

#[derive(Debug, Clone, Serialize, Deserialize, Copy, PartialEq, Eq, Hash)]
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

#[derive(Debug, Serialize, Deserialize, PartialEq, Eq, Clone, Copy, Hash)]
pub struct Meaning {
    /// The theory in which the value should be interpreted (e.g. `bv`)
    pub theory: IString,
    /// The value of the term (e.g. `#x0000000000000001` or `#b1`)
    pub value: IString,
}

/// A Z3 quantifier and associated data.
#[derive(Debug, Serialize, Deserialize)]
pub struct Quantifier {
    pub kind: QuantKind,
    pub num_vars: usize,
    pub term: Option<TermIdx>,
    // pub cost: f32,
    pub instances: Vec<InstIdx>,
    pub vars: Option<VarNames>,
}

/// Represents an ID string of the form `name!id`.
#[derive(Debug, Clone, Serialize, Deserialize)]
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
                name: strings.get_or_intern(name),
                id,
            })
            .unwrap_or_else(|| Self::NamedQuant(strings.get_or_intern(value)))
    }
    pub fn is_discovered(&self) -> bool {
        matches!(self, Self::Other(_))
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub enum VarNames {
    TypeOnly(Vec<IString>),
    NameAndType(Vec<(IString, IString)>),
}
impl VarNames {
    pub fn get_name<'a>(strings: &'a StringTable, this: &Option<Self>, idx: usize) -> Cow<'a, str> {
        match this {
            Some(Self::NameAndType(names)) => Cow::Borrowed(&strings[names[idx].0]),
            None | Some(Self::TypeOnly(_)) => Cow::Owned(format!("qvar_{idx}")),
        }
    }
    pub fn get_type(strings: &StringTable, this: &Option<Self>, idx: usize) -> String {
        this.as_ref()
            .map(|this| {
                let ty = match this {
                    Self::TypeOnly(names) => names[idx],
                    Self::NameAndType(names) => names[idx].1,
                };
                format!(": {}", &strings[ty])
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
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Instantiation {
    pub match_: MatchIdx,
    pub fingerprint: Fingerprint,
    pub proof_id: Option<std::result::Result<TermIdx, TermId>>,
    pub z3_generation: Option<u32>,
    pub cost: f32,
    pub yields_terms: Box<[ENodeIdx]>,
}

impl Instantiation {
    pub fn get_resulting_term(&self) -> Option<TermIdx> {
        self.proof_id.as_ref()?.as_ref().ok().copied()
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Match {
    pub kind: MatchKind,
    pub blamed: Box<[BlameKind]>,
}

impl Match {
    pub fn due_to_enodes(&self) -> impl Iterator<Item = (&BlameKind, ENodeIdx)> + '_ {
        self.blamed
            .iter()
            .filter_map(|x| x.get_blame_node().map(|b| (x, b)))
    }
    pub fn due_to_terms(&self) -> impl Iterator<Item = ENodeIdx> + '_ {
        self.blamed.iter().filter_map(|x| match x {
            BlameKind::Term { term } => Some(*term),
            _ => None,
        })
    }
    pub fn due_to_equalities(&self) -> impl Iterator<Item = ENodeIdx> + '_ {
        self.blamed.iter().filter_map(|x| match x {
            BlameKind::Equality { eq } => Some(*eq),
            _ => None,
        })
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum MatchKind {
    MBQI {
        quant: QuantIdx,
        bound_terms: Vec<ENodeIdx>,
    },
    TheorySolving {
        axiom_id: TermId,
        bound_terms: Vec<TermIdx>,
        rewrite_of: Option<TermIdx>,
    },
    Axiom {
        axiom: QuantIdx,
        pattern: TermIdx,
        bound_terms: Vec<TermIdx>,
    },
    Quantifier {
        quant: QuantIdx,
        pattern: TermIdx,
        bound_terms: Vec<ENodeIdx>,
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
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum BlameKind {
    Term { term: ENodeIdx },
    Equality { eq: ENodeIdx },
    // TODO: why aren't all equalities explained by a prior `eq-expl`?
    UnknownEquality { from: ENodeIdx, to: ENodeIdx },
}

impl BlameKind {
    pub fn get_blame_node(&self) -> Option<ENodeIdx> {
        match self {
            Self::Term { term } => Some(*term),
            Self::Equality { eq } => Some(*eq),
            Self::UnknownEquality { .. } => None,
        }
    }
}

/// An identifier for a Z3 quantifier instantiation (called "fingerprint" in the original Axiom Profiler).
/// Represented as a 16-digit hexadecimal number in log files.
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, Serialize, Deserialize)]
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
#[derive(Debug, Clone, Copy, Serialize, Deserialize, Default, Hash, PartialEq, Eq)]
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
        let namespace = strings.get_or_intern(&value[..hash_idx]);
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
}

/// Remapping from `TermId` to `TermIdx`. We want to have a single flat vector
/// of terms but `TermId`s don't map to this nicely, additionally the `TermId`s
/// may repeat and so we want to map to the latest current `TermIdx`. Has a
/// special fast path for the common empty namespace case.
#[derive(Debug)]
pub struct TermIdToIdxMap {
    empty_string: IString,
    empty_namespace: Vec<Option<TermIdx>>,
    namespace_map: FxHashMap<IString, Vec<Option<TermIdx>>>,
}
impl TermIdToIdxMap {
    pub fn new(strings: &mut StringTable) -> Self {
        Self {
            empty_string: strings.get_or_intern_static(""),
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
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
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
        // add dependent instantiations
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
    pub fn dependency_on(&self) -> Option<ENodeIdx> {
        use EqualityExpl::*;
        match *self {
            Root { .. } => None,
            Literal { eq, .. } => Some(eq),
            // TODO: other cases
            Congruence { .. } => None,
            Theory { .. } => None,
            Axiom { .. } => None,
            Unknown { .. } => None,
        }
    }
}
