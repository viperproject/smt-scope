# CDCL graph

According to [the Z3 docs](https://z3prover.github.io/papers/programmingz3.html#simple-cdclt), Z3 uses [CDCL](https://en.wikipedia.org/wiki/Conflict-driven_clause_learning)
to solve the SAT problem. In this tutorial, we aim to use the example given in [this Wikipedia example](https://en.wikipedia.org/wiki/Conflict-driven_clause_learning#Example)
to explain how the information for constructing the "CDCL graph" can be obtained from the log.

We can encode the example from Wikipedia using smt2-syntax as follows:

```smt2
(declare-const x1 Bool)
(declare-const x2 Bool)
(declare-const x3 Bool)
(declare-const x4 Bool)
(declare-const x5 Bool)
(declare-const x6 Bool)
(declare-const x7 Bool)
(declare-const x8 Bool)
(declare-const x9 Bool)
(declare-const x10 Bool)
(declare-const x11 Bool)
(declare-const x12 Bool)

(assert (or x1 x4))
(assert (or x1 (not x3) (not x8)))
(assert (or x1 x8 x12))
(assert (or x2 x11))
(assert (or (not x7) (not x3) x9))
(assert (or (not x7) x8 (not x9)))
(assert (or x7 x8 (not x10)))
(assert (or x7 x10 (not x12)))

(check-sat)
(get-model)
```

We will first show a potential solver run of Z3 using CDCL to explain the concept of the CDCL graph. Then, we will explain how all the information needed to construct the CDCL graph
automatically from the log-files can be extracted.

## Example solver run of Z3

The first observation we can make is that the assertion `(assert (or x2 x11))` can be trivially satisfied by simply assigning each literal to `true` as neither literal appears in any other clause.

Next, Z3 can make the decision of assigning `x1` to `false`. By doing this, the first clause, `(assert (or x1 x4))` will require `x4` to be set to `true`, i.e., after deciding the value `false` for `x1`, Z3 propagates the value `true` to `x4`:

<img width="697" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/76162878-b6fe-4a3f-8322-1e175d195913">

Now that the first assertion is satisfied, Z3 might set `x8` to `false` in order to satisfy the second assertion as well. By doing this, the third assertion `(assert (or x1 x8 x12))` propagates the value `true` to `x12` as `x1` and `x8` are set
to `false`:

<img width="711" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/991932cf-7eb0-45fa-9292-11368bb40b3f">

Now that the first four assertions are satisfied, Z3 could make another decision to set `x9` to `false`:

<img width="709" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/e4701762-dfd8-4392-b138-c0f9cc7b591b">

After this, Z3 can make the decision to set `x7` to `false`. This decision will propagate `false` to `x10` to satisfy the clause `(assert (or x7 x8 (not x10)))`. 

<img width="708" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/b04f2122-2ea3-4bbf-a750-93a442460664">

But at the same time, the clause `(assert (or x7 x10 (not x12)))` propagates 
`true` to `x10`, i.e., we have a conflict. In a CDCL search, Z3 will try to find a "cut" that explains the conflict. More specifically, in our case the assignments `x8 = false`, `x7 = false` together with the clause `(assert (or x7 x8 (not x10)))`
led to the propagation `x10 = false` and the assignments `x7 = false`, `x12 = true` together with the clause `(assert (or x7 x10 (not x12)))` led to the propagation `x10 = true`. In other words, the clause `(not x8) and x12 and (not x7)` leads to 
a conflict and hence we can add its negation `x8 or (not x12) or x7` as a new, _learned_ clause (hence the L in CDCL) to the clauses and backtrack to the earliest decision among the literals in this clause (in our case `x8`):

<img width="695" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/c9280f18-5ad6-48d9-a20b-a1a5020edef2">

The newly learned clause propagates the value `true` to `x7` and this, in turn, propagates the value `false` to `x9` due to the clause `(assert (or (not x7) x8 (not x9)))`:

<img width="727" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/e4972338-3832-4199-8308-c307937b80d9">

Now Z3 can make the decision to set `x10` to `false` as the clauses that contain this literal are already satisfied. 

Note that the clause `(assert (or (not x7) (not x3) x9))` can also be trivially satisfied now by simply setting `x3` to `false` as the other clause containing this literal (`(assert (or x1 (not x3) (not x8)))`) is already satisfied.
At this point, Z3 has successfully found a model that satisfies the input problem and can hence terminate.

<img width="726" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/ed145015-a7ca-4b2e-af62-d5ea423b58a2">

## Extracting this information from log files

We can generate a log file during a solver run of Z3 to gain more insight into the decisions and propagations that are made by passing additional flags to the command line:

```
z3 trace=true proof=true trace-file-name=foo.log ./input.smt2
```

In the following, we can see a pretty-printed version of the log-file to make the correspondence between the previous example clearer:

```
[push] 0                            // after this at lvl 1
[assign] (not x1) decision axiom    // decide x1 -> false
[assign] x4 clause 2 1              // propagate x4 -> true due to clause (or x1 x4)
[push] 1                            // after this at lvl 2
[assign] (not x8) decision axiom    // decide x8 -> false
[assign] x12 clause 5 3 1           // propagate x12 -> true due to clause (or x1 x8 x12)
[push] 2                            // after this at lvl 3
[assign] (not x9) decision axiom    // decide x9 -> false
[push] 3                            // after this at lvl 4
[assign] (not x7) decision axiom    // decide x7 -> false
[assign] (not x10) clause -9 7 3    // propagate x10 -> false due to clause (or x7 x8 (not x10))
[conflict] x7 (not x12) x8          // add learned clause (or x7 (not x12) x8) due to conflict
[pop] 2 4                           // backtrack to level 4-2 = 2
[assign] x7 clause 7 -5 3           // propagate x7 -> true due to clause (or x7 (not x12) x8)
[assign] (not x9) clause -8 -7 3    // propagate x9 -> false due to clause (or (not x7) x8 (not x9))
[push] 2                            // after this at lvl 3
[assign] (not x10) decision axiom   // decide x10 -> false
```















