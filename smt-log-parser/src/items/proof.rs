use std::{str::FromStr, sync::OnceLock};

#[cfg(feature = "mem_dbg")]
use mem_dbg::{MemDbg, MemSize};
use strum::{EnumIter, IntoEnumIterator};

use crate::{BoxSlice, FxHashMap, IString};

use super::{ProofIdx, TermId, TermIdx};

/// A Z3 proof step and associated data.
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug)]
pub struct ProofStep {
    pub id: TermId,
    pub kind: ProofStepKind,
    pub result: TermIdx,
    pub prerequisites: BoxSlice<ProofIdx>,
}

#[allow(non_camel_case_types)]
#[cfg_attr(feature = "mem_dbg", derive(MemSize, MemDbg))]
#[cfg_attr(feature = "mem_dbg", copy_type)]
#[cfg_attr(feature = "serde", derive(serde::Serialize, serde::Deserialize))]
#[derive(Debug, Clone, Copy, EnumIter)]
/// Taken from
/// [z3-sys](https://docs.rs/z3-sys/0.8.1/src/z3_sys/lib.rs.html#451). Update
/// from there if more cases are added. A few marked cases were renamed to
/// match z3's
/// [ast.cpp](https://github.com/Z3Prover/z3/blob/54d30f26f72ce62f5dcb5a5258f632f84858714f/src/ast/ast.cpp#L778-L821).
pub enum ProofStepKind {
    /// Undef/Null proof object.
    PR_UNDEF,
    /// Proof for the expression 'true'.
    ///
    /// *Renamed from `PR_TRUE`*
    PR_TRUE_AXIOM,
    /// Proof for a fact asserted by the user.
    PR_ASSERTED,
    /// Proof for a fact (tagged as goal) asserted by the user.
    PR_GOAL,
    /// Given a proof for p and a proof for (implies p q), produces a proof for q.
    ///
    /// ```text
    /// T1: p
    /// T2: (implies p q)
    /// [mp T1 T2]: q
    /// ```
    ///
    /// The second antecedents may also be a proof for `(iff p q)`.
    ///
    /// *Renamed from `PR_MODUS_PONENS`*
    PR_MP,
    /// A proof for `(R t t)`, where `R` is a reflexive relation.
    ///
    /// This proof object has no antecedents.
    ///
    /// The only reflexive relations that are used are
    /// equivalence modulo namings, equality and equivalence.
    /// That is, `R` is either `~`, `=` or `iff`.
    ///
    /// *Renamed from `PR_REFLEXIVITY`*
    PR_REFL,
    /// Given an symmetric relation `R` and a proof for `(R t s)`,
    /// produces a proof for `(R s t)`.
    ///
    /// ```text
    /// T1: (R t s)
    /// [symmetry T1]: (R s t)
    /// ```
    ///
    /// `T1` is the antecedent of this proof object.
    ///
    /// *Renamed from `PR_SYMMETRY`*
    PR_SYMM,
    /// Given a transitive relation `R`, and proofs for `(R t s)` and
    /// `(R s u)`, produces a proof for `(R t u)`.
    ///
    /// ```text
    /// T1: (R t s)
    /// T2: (R s u)
    /// [trans T1 T2]: (R t u)
    /// ```
    ///
    /// *Renamed from `PR_TRANSITIVITY`*
    PR_TRANS,
    /// Condensed transitivity proof.
    ///
    /// It combines several symmetry and transitivity proofs.
    ///
    /// Example:
    ///
    /// ```text
    /// T1: (R a b)
    /// T2: (R c b)
    /// T3: (R c d)
    /// [trans* T1 T2 T3]: (R a d)
    /// ```
    ///
    /// `R` must be a symmetric and transitive relation.
    ///
    /// Assuming that this proof object is a proof for `(R s t)`, then
    /// a proof checker must check if it is possible to prove `(R s t)`
    /// using the antecedents, symmetry and transitivity.  That is,
    /// if there is a path from `s` to `t`, if we view every
    /// antecedent `(R a b)` as an edge between `a` and `b`.
    ///
    /// *Renamed from `PR_TRANSITIVITY_STAR`*
    PR_TRANS_STAR,
    /// Monotonicity proof object.
    ///
    /// ```text
    /// T1: (R t_1 s_1)
    /// ...
    /// Tn: (R t_n s_n)
    /// [monotonicity T1 ... Tn]: (R (f t_1 ... t_n) (f s_1 ... s_n))
    /// ```
    ///
    /// Remark: if `t_i == s_i`, then the antecedent `Ti` is suppressed.
    /// That is, reflexivity proofs are suppressed to save space.
    PR_MONOTONICITY,
    /// Given a proof for `(~ p q)`, produces a proof for
    /// `(~ (forall (x) p) (forall (x) q))`.
    ///
    /// ```text
    /// T1: (~ p q)
    /// [quant-intro T1]: (~ (forall (x) p) (forall (x) q))
    /// ```
    PR_QUANT_INTRO,

    /// Given a proof `p`, produces a proof of `lambda x . p`, where `x` are free
    /// variables in `p`.
    ///
    /// ```text
    /// T1: f
    /// [proof-bind T1] forall (x) f
    /// ```
    ///
    /// *Renamed from `PR_BIND`*
    PR_PROOF_BIND,
    /// Distributivity proof object.
    ///
    /// Given that `f (= or)` distributes over `g (= and)`, produces a proof for
    ///
    /// ```text
    /// (= (f a (g c d))
    /// (g (f a c) (f a d)))
    /// ```
    ///
    /// If `f` and `g` are associative, this proof also justifies the following equality:
    ///
    /// ```text
    /// (= (f (g a b) (g c d))
    /// (g (f a c) (f a d) (f b c) (f b d)))
    /// ```
    ///
    /// where each `f` and `g` can have arbitrary number of arguments.
    ///
    /// This proof object has no antecedents.
    ///
    /// Remark: This rule is used by the CNF conversion pass and
    /// instantiated by `f,
    PR_DISTRIBUTIVITY,
    /// Given a proof for `(and l_1 ... l_n)`, produces a proof
    /// for `l_i`.
    ///
    /// ```text
    /// T1: (and l_1 ... l_n)
    /// [and-elim T1]: l_i
    /// ```
    PR_AND_ELIM,
    /// Given a proof for `(not (or l_1 ... l_n))`, produces a
    /// proof for `(not l_i)`.
    ///
    /// ```text
    /// T1: (not (or l_1 ... l_n))
    /// [not-or-elim T1]: (not l_i)
    /// ```
    PR_NOT_OR_ELIM,
    /// A proof for a local rewriting step `(= t s)`.
    ///
    /// The head function symbol of `t` is interpreted.
    ///
    /// This proof object has no antecedents.
    ///
    /// The conclusion of a rewrite rule is either an equality `(= t s)`,
    /// an equivalence `(iff t s)`, or equi-satisfiability `(~ t s)`.
    ///
    /// Remark: if `f` is `bool`, then `=` is `iff`.
    ///
    /// Examples:
    ///
    /// ```text
    /// (= (+ x 0) x)
    /// (= (+ x 1 2) (+ 3 x))
    /// (iff (or x false) x)
    /// ```
    PR_REWRITE,
    /// A proof for rewriting an expression `t` into an expression `s`.
    ///
    /// This proof object can have `n` antecedents. The antecedents are
    /// proofs for equalities used as substitution rules.
    ///
    /// The object is also used in a few cases. The cases are:
    ///
    /// - When applying contextual simplification `(CONTEXT_SIMPLIFIER=true)`.
    /// - When converting bit-vectors to Booleans `(BIT2BOOL=true)`.
    PR_REWRITE_STAR,
    /// A proof for `(iff (f (forall (x) q(x)) r) (forall (x) (f (q x) r)))`.
    ///
    /// This proof object has no antecedents.
    PR_PULL_QUANT,
    /// A proof for:
    ///
    /// ```text
    /// (iff (forall (x_1 ... x_m) (and p_1[x_1 ... x_m] ... p_n[x_1 ... x_m]))
    /// (and (forall (x_1 ... x_m) p_1[x_1 ... x_m])
    /// ...
    /// (forall (x_1 ... x_m) p_n[x_1 ... x_m])))
    /// ```
    ///
    /// This proof object has no antecedents.
    PR_PUSH_QUANT,
    /// A proof for
    ///
    /// ```text
    /// (iff (forall (x_1 ... x_n y_1 ... y_m) p[x_1 ... x_n])
    /// (forall (x_1 ... x_n) p[x_1 ... x_n]))
    /// ```
    ///
    /// It is used to justify the elimination of unused variables.
    ///
    /// This proof object has no antecedents.
    ///
    /// *Renamed from `PR_ELIM_UNUSED_VARS`*
    PR_ELIM_UNUSED,
    /// A proof for destructive equality resolution:
    ///
    /// ```text
    /// (iff (forall (x) (or (not (= x t)) P[x])) P[t])
    /// ```
    ///
    /// if `x` does not occur in `t`.
    ///
    /// This proof object has no antecedents.
    ///
    /// Several variables can be eliminated simultaneously.
    PR_DER,
    /// A proof of `(or (not (forall (x) (P x))) (P a))`.
    PR_QUANT_INST,
    /// Mark a hypothesis in a natural deduction style proof.
    PR_HYPOTHESIS,
    /// ```text
    /// T1: false
    /// [lemma T1]: (or (not l_1) ... (not l_n))
    /// ```
    ///
    /// This proof object has one antecedent: a hypothetical proof for false.
    ///
    /// It converts the proof in a proof for `(or (not l_1) ... (not l_n))`,
    /// when `T1` contains the open hypotheses: `l_1, ..., l_n`.
    ///
    /// The hypotheses are closed after an application of a lemma.
    ///
    /// Furthermore, there are no other open hypotheses in the subtree covered by
    /// the lemma.
    PR_LEMMA,
    /// ```text
    /// T1:      (or l_1 ... l_n l_1' ... l_m')
    /// T2:      (not l_1)
    /// ...
    /// T(n+1):  (not l_n)
    /// [unit-resolution T1 ... T(n+1)]: (or l_1' ... l_m')
    /// ```
    PR_UNIT_RESOLUTION,
    /// ```text
    /// T1: p
    /// [iff-true T1]: (iff p true)
    /// ```
    PR_IFF_TRUE,
    /// ```text
    /// T1: (not p)
    /// [iff-false T1]: (iff p false)
    /// ```
    PR_IFF_FALSE,
    /// ```text
    /// [comm]: (= (f a b) (f b a))
    /// ```
    ///
    /// `f` is a commutative operator.
    ///
    /// This proof object has no antecedents.
    ///
    /// Remark: if `f` is `bool`, then `=` is `iff`.
    PR_COMMUTATIVITY,
    /// Proof object used to justify Tseitin's like axioms:
    ///
    /// ```text
    /// (or (not (and p q)) p)
    /// (or (not (and p q)) q)
    /// (or (not (and p q r)) p)
    /// (or (not (and p q r)) q)
    /// (or (not (and p q r)) r)
    /// ...
    /// (or (and p q) (not p) (not q))
    /// (or (not (or p q)) p q)
    /// (or (or p q) (not p))
    /// (or (or p q) (not q))
    /// (or (not (iff p q)) (not p) q)
    /// (or (not (iff p q)) p (not q))
    /// (or (iff p q) (not p) (not q))
    /// (or (iff p q) p q)
    /// (or (not (ite a b c)) (not a) b)
    /// (or (not (ite a b c)) a c)
    /// (or (ite a b c) (not a) (not b))
    /// (or (ite a b c) a (not c))
    /// (or (not (not a)) (not a))
    /// (or (not a) a)
    /// ```
    ///
    /// This proof object has no antecedents.
    ///
    /// Note: all axioms are propositional tautologies.
    /// Note also that `and` and `or` can take multiple arguments.
    /// You can recover the propositional tautologies by
    /// unfolding the Boolean connectives in the axioms a small
    /// bounded number of steps `(=3)`.
    PR_DEF_AXIOM,
    /// Introduces a name for a formula/term.
    ///
    /// Suppose `e` is an expression with free variables `x`, and
    /// `def-intro` introduces the name `n(x)`. The possible cases are:
    ///
    /// When e is of Boolean type:
    ///
    /// ```text
    /// [def-intro]: (and (or n (not e)) (or (not n) e))
    /// ```
    ///
    /// or:
    ///
    /// ```text
    /// [def-intro]: (or (not n) e)
    /// ```
    ///
    /// when e only occurs positively.
    ///
    /// When e is of the form `(ite cond th el)`:
    ///
    /// ```text
    /// [def-intro]: (and (or (not cond) (= n th)) (or cond (= n el)))
    /// ```
    ///
    /// Otherwise:
    ///
    /// ```text
    /// [def-intro]: (= n e)
    /// ```
    ///
    /// *Renamed from `PR_DEF_INTRO`*
    PR_INTRO_DEF,
    /// ```text
    /// [apply-def T1]: F ~ n
    /// ```
    ///
    /// `F` is 'equivalent' to `n`, given that `T1` is a proof that
    /// `n` is a name for `F`.
    PR_APPLY_DEF,
    /// ```text
    /// T1: (iff p q)
    /// [iff~ T1]: (~ p q)
    /// ```
    PR_IFF_OEQ,
    /// Proof for a (positive) NNF step. Example:
    ///
    /// ```text
    /// T1: (not s_1) ~ r_1
    /// T2: (not s_2) ~ r_2
    /// T3: s_1 ~ r_1'
    /// T4: s_2 ~ r_2'
    /// [nnf-pos T1 T2 T3 T4]: (~ (iff s_1 s_2)
    /// (and (or r_1 r_2') (or r_1' r_2)))
    /// ```
    ///
    /// The negation normal form steps `NNF_POS` and `NNF_NEG` are used in the
    /// following cases:
    ///
    /// - When creating the NNF of a positive force quantifier.
    ///   The quantifier is retained (unless the bound variables are eliminated).
    ///   Example:
    ///   ```text
    ///   T1: q ~ q_new
    ///   [nnf-pos T1]: (~ (forall (x T) q) (forall (x T) q_new))
    ///   ```
    /// - When recursively creating NNF over Boolean formulas, where the top-level
    ///   connective is changed during NNF conversion. The relevant Boolean connectives
    ///   for `NNF_POS` are `implies`, `iff`, `xor`, `ite`.
    ///   `NNF_NEG` furthermore handles the case where negation is pushed
    ///   over Boolean connectives `and` and `or`.
    PR_NNF_POS,
    /// Proof for a (negative) NNF step. Examples:
    ///
    /// ```text
    /// T1: (not s_1) ~ r_1
    /// ...
    /// Tn: (not s_n) ~ r_n
    /// [nnf-neg T1 ... Tn]: (not (and s_1 ... s_n)) ~ (or r_1 ... r_n)
    /// ```
    ///
    /// and
    ///
    /// ```text
    /// T1: (not s_1) ~ r_1
    /// ...
    /// Tn: (not s_n) ~ r_n
    /// [nnf-neg T1 ... Tn]: (not (or s_1 ... s_n)) ~ (and r_1 ... r_n)
    /// ```
    ///
    /// and
    ///
    /// ```text
    /// T1: (not s_1) ~ r_1
    /// T2: (not s_2) ~ r_2
    /// T3: s_1 ~ r_1'
    /// T4: s_2 ~ r_2'
    /// [nnf-neg T1 T2 T3 T4]: (~ (not (iff s_1 s_2))
    /// (and (or r_1 r_2) (or r_1' r_2')))
    /// ```
    PR_NNF_NEG,
    /// Proof for:
    ///
    /// ```text
    /// [sk]: (~ (not (forall x (p x y))) (not (p (sk y) y)))
    /// [sk]: (~ (exists x (p x y)) (p (sk y) y))
    /// ```
    ///
    /// This proof object has no antecedents.
    ///
    /// *Renamed from `PR_SKOLEMIZE`*
    PR_SK,
    /// Modus ponens style rule for equi-satisfiability.
    ///
    /// ```text
    /// T1: p
    /// T2: (~ p q)
    /// [mp~ T1 T2]: q
    /// ```
    ///
    /// *Renamed from `PR_MODUS_PONENS_OEQ`*
    PR_MP_OEQ,
    /// Generic proof for theory lemmas.
    ///
    /// The theory lemma function comes with one or more parameters.
    ///
    /// The first parameter indicates the name of the theory.
    ///
    /// For the theory of arithmetic, additional parameters provide hints for
    /// checking the theory lemma.
    ///
    /// The hints for arithmetic are:
    ///
    /// - `farkas` - followed by rational coefficients. Multiply the coefficients to the
    ///   inequalities in the lemma, add the (negated) inequalities and obtain a contradiction.
    /// - `triangle-eq` - Indicates a lemma related to the equivalence:
    ///   ```text
    ///   (iff (= t1 t2) (and (<= t1 t2) (<= t2 t1)))
    ///   ```
    /// - `gcd-test` - Indicates an integer linear arithmetic lemma that uses a gcd test.
    PR_TH_LEMMA,
    /// Hyper-resolution rule.
    ///
    /// The premises of the rules is a sequence of clauses.
    /// The first clause argument is the main clause of the rule.
    /// with a literal from the first (main) clause.
    ///
    /// Premises of the rules are of the form
    ///
    /// ```text
    /// (or l0 l1 l2 .. ln)
    /// ```
    ///
    /// or
    ///
    /// ```text
    /// (=> (and l1 l2 .. ln) l0)
    /// ```
    ///
    /// or in the most general (ground) form:
    ///
    /// ```text
    /// (=> (and ln+1 ln+2 .. ln+m) (or l0 l1 .. ln))
    /// ```
    ///
    /// In other words we use the following (Prolog style) convention for Horn
    /// implications:
    ///
    /// - the head of a Horn implication is position 0,
    /// - the first conjunct in the body of an implication is position 1
    /// - the second conjunct in the body of an implication is position 2
    ///
    /// For general implications where the head is a disjunction, the
    /// first n positions correspond to the n disjuncts in the head.
    /// The next m positions correspond to the m conjuncts in the body.
    ///
    /// The premises can be universally quantified so that the most
    /// general non-ground form is:
    ///
    /// ```text
    /// (forall (vars) (=> (and ln+1 ln+2 .. ln+m) (or l0 l1 .. ln)))
    /// ```
    ///
    /// The hyper-resolution rule takes a sequence of parameters.
    /// The parameters are substitutions of bound variables separated by pairs
    /// of literal positions from the main clause and side clause.
    PR_HYPER_RESOLVE,

    /// Unrecognised proof step was encountered.
    OTHER(IString),
}

impl ProofStepKind {
    pub fn to_z3_string(self) -> Result<String, IString> {
        let kind_str = format!("{self:?}");
        let kind_str = kind_str.strip_prefix("PR_").ok_or_else(|| {
            let Self::OTHER(istr) = self else {
                unreachable!("The variant `ProofStepKind::{self:?}` does not start with \"PR_\"!");
            };
            istr
        })?;
        let kind_str = kind_str
            .replace("_STAR", "*")
            .replace("_OEQ", "~")
            .replace('_', "-")
            .to_ascii_lowercase();
        Ok(kind_str)
    }
}

static SEARCH_MAP: OnceLock<FxHashMap<String, ProofStepKind>> = OnceLock::new();

impl FromStr for ProofStepKind {
    type Err = ();
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let map = SEARCH_MAP.get_or_init(|| {
            let mut map = FxHashMap::default();
            for kind in ProofStepKind::iter() {
                let Ok(kind_str) = kind.to_z3_string() else {
                    continue;
                };
                map.insert(kind_str, kind);
            }
            map
        });
        map.get(s).copied().ok_or(())
    }
}
