Following `[mk-app] #A = #B #C`, the last ID in the `[mk-proof]` line is the equality being justified (`#A`).

Any arguments before the justified equality are proof terms; refer to their respective equality arguments.
- true-axiom: just part of labelling `#1` as true.
- rewrite: Is to label an equality as being proven. Can appear after an instantiation mentioning the equality in `[attach-enode]` or another `[mk-proof]` (since it seems like Z3 needs to re-introduce `[mk-apps]` made in instantiation blocks to keep using them).
- monotonicity: The justified equality's sides' number of arguments (equal for LHS and RHS) equal the number of other arguments in the proof line (all equalities; represent pairwise equality for every argument of LHS, RHS)
- trans (transitivity): equalities that when put together, 
- refl: the equality is of the form `= #B #B` and thus trivial.
- asserted: an equality proven from assumptions/the problem; not significant for QIs.
- symm: equality is the sam
- quant-intro:
- proof-bind: depend on a `[mk-lambda]` line
- and-elim:
- mp:
- nn
- iff-true: The equality is of the form `= #B #1`, and `#1` is true
- iff-false: The equality is of the form `= #B #2`, and `#2` is false

Types:
def-axiom
quant-inst
trans
monotonicity
refl
proof-bind
th-lemma
commutativity
hypothesis
iff-true
lemma
elim-unused
symm
and-elim
nnf-pos
rewrite
trans*
not-or-elim
mp
iff-false
true-axiom
asserted
unit-resolution
mp~
quant-intro