This document describes restrictions on the input smt2 files which our tool requires to be satisfied.
These restrictions are due to z3 bugs/limitations which require workarounds in our tool.
If these restrictions are not satisfied these workarounds might fail and lines in the log file might be ignored.

## Names

The following restrictions apply to choosing names for `declare-fun` and `declare-const`:

- The names `string`, `indent`, `compose`, `choice` and `cr` are forbidden ([#100](https://github.com/viperproject/axiom-profiler-2/issues/100)).
