This document describes restrictions on the input smt2 files which our tool requires to be satisfied.
These restrictions are due to z3 bugs/limitations which require workarounds in our tool.
If these restrictions are not satisfied these workarounds might fail and lines in the log file might be ignored.

## Names

The following restrictions apply to choosing names for `declare-fun` and `declare-const`:

- The names `string`, `indent`, `compose`, `choice` and `cr` are forbidden. Issue [#100](https://github.com/viperproject/smt-scope/issues/100).
- Any names with spaces of which a non-first word ends with `#[0-9]*` (e.g. `(declare-const |x foo#1 #| Int)`). Examples which are fine are e.g. `|#3 x|` or `|(x #3)|`. Issue [#106](https://github.com/viperproject/smt-scope/issues/106).

The following restrictions apply to choosing names for quantifiers (specified with `:qid`):

- **(z3 <= v4.8.17)** Any names with spaces of which a non-first word contains digits only (e.g. `:qid |qname 10 2|`). Names with spaces where no non-first word can be parsed as a number are fine (e.g. `:qid |10 q50 3plus|`). Resolved with z3[#6081](https://github.com/Z3Prover/z3/issues/6081).
