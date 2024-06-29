# Reconstructing CDCL Graphs from Z3 Logs

**Author:** [Oskari Jyrkinen](https://github.com/oskari1)

## Table of Contents
- [Introduction](#introduction)
- [Running example](#running-example)
- [CDCL search in the log](#cdcl-search-in-the-log)
- [Shortcomings and Assumptions](#shortcomings-and-assumptions)
- [Appendix A](#appendix-a)

## Introduction

According to [the Z3 docs](https://z3prover.github.io/papers/programmingz3.html#simple-cdclt), Z3 uses [CDCL](https://en.wikipedia.org/wiki/Conflict-driven_clause_learning)
to solve the SAT problem. In this tutorial, we aim to use [this Wikipedia example](https://en.wikipedia.org/wiki/Conflict-driven_clause_learning#Example)
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

We will first show a potential solver run of Z3 using CDCL to explain the concept of the CDCL graph. Then, we will explain how we can extract all the information needed to construct the CDCL graph
automatically from the log-files.

## Running example

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
`true` to `x10`, i.e., we have a conflict. This means that one of the previous decisions should be reverted. In [DPLL](https://en.wikipedia.org/wiki/DPLL_algorithm#:~:text=In%20logic%20and%20computer%20science,solving%20the%20CNF%2DSAT%20problem.), we would just revert the previous decision where we set `x7` to `false` and continue from there. However, Z3 uses a more optimized version of DPLL called [CDCL(T)](https://z3prover.github.io/papers/z3internals.html#back-fn-unitremove) that uses _backjumping_ to reduce the search space.
In our case, we can visualise the conflict as in the graph below. Nodes without any incoming edges represent assignments that were made by decision. If a node has incoming edges, it means that its value was propagated due to some previous 
assignments, e.g., there is an edge from `x1 -> 0` to `x4 -> 1` because the value `true` was propagated to `x4` after assigning `false` to `x1` due to the clause `or x1 x4`.

![image](https://github.com/viperproject/axiom-profiler-2/assets/23278394/2b4e4f42-2684-453d-a6f3-2149fa5af186)


Z3 will try to find a "cut" that explains the conflict. More specifically, in our case the conflict is between the nodes `x10 -> 0` and `x10 -> 1` and the cut crosses the edges coming from the nodes `x8 -> 0`, `x12 -> 1`, `x7 -> 0`.
In other words, the clause `(not x8) and x12 and (not x7)` leads to 
a conflict and hence we can add its negation `x8 or (not x12) or x7` as a new, _learned_ clause (hence the L in CDCL) to the clauses and backtrack to the earliest decision among the literals in this clause (in our case `x8`):

<img width="695" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/c9280f18-5ad6-48d9-a20b-a1a5020edef2">

The newly learned clause propagates the value `true` to `x7` and this, in turn, propagates the value `false` to `x9` due to the clause `(assert (or (not x7) x8 (not x9)))`:

<img width="727" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/e4972338-3832-4199-8308-c307937b80d9">

Now Z3 can make the decision to set `x10` to `false` as the clauses that contain this literal are already satisfied. 

Note that the clause `(assert (or (not x7) (not x3) x9))` can also be trivially satisfied now by simply setting `x3` to `false` as the other clause containing this literal (`(assert (or x1 (not x3) (not x8)))`) is already satisfied.
At this point, Z3 has successfully found a model that satisfies the input problem and can hence terminate.

<img width="726" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/ed145015-a7ca-4b2e-af62-d5ea423b58a2">

## CDCL search in the log

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

> **Note:** The numbers that are listed on the `[assign] ... clause`-lines correspond to the internal indices that Z3 uses during the CDCL search (see Appendix A for more details). 

We can view this example in the CDCL viewer mode of the Axiom Profiler 2.0. Note that in the CDCL graph of the AP2, we don't have separate nodes for conflicts. Instead, we colour the nodes in red that correspond to decisions that led 
to conflicts, i.e., node `d3` corresponds to the decision `x7 -> false`. The nodes are labelled with `d_` which reflects the order in which the decisions were made. Furthermore, we don't have "back-edges" as in the illustration before for backtracking decisions. Instead, we label edges by a number indicating the "search path", i.e.,
each time a conflict is found, a new search path is started from another node. In this sense, the backtracking information is implicitly displayed in the CDCL graph. Not having back-edges has the advantage that the CDCL graph stays a 
directed acyclic graph (DAG) hence improving runtimes of various graph algorithms for subsequent analysis. Introducing these search path indices also has the advantage that we can
distinguish between the propagations made on the various paths. In the example below, on our initial search path 0, we propagated the value `true` to `x12` after deciding to set `x8` to `false` in `d1`. After that, we made the decision `d2` 
where we assigned `false` to `x9`. Later, we found a conflict due to which we backjumped to decision `d1` and started the search path 1. With the newly learned clause, we obtained the propagations `x7 -> true` and `x9 -> false` at `d1`.
Therefore, we always denote on what search path the propagations happen in the CDCL graph of the AP2. 

![image](https://github.com/viperproject/axiom-profiler-2/assets/23278394/feec612a-6c3e-4433-95bf-47c84e6c8510)

> **Note:** Our example only involves propositional logic to keep it simple but the CDCL search is also used in the general case involving predicate logic. In that case, Z3 performs CDCL(T) on a propositional abstraction of the
> input formulas (see [here](https://z3prover.github.io/papers/z3internals.html#back-fn-unitremove) and [here](http://homepage.divms.uiowa.edu/~ajreynol/pres-dpllt15.pdf)).  

## Shortcomings and Assumptions

The current code does not yet support the `[decide-and-or]`-line cases in Z3 logs. These seem to be connected with case splits that Z3 does during a solver run.
The current code stores in each decision the preceding decisions and backtracks to the last decision made at the level to which we backtrack. I do not know if 
this is a valid assumption.

## Appendix A

We claimed in the example below that `clause 5 3 1` corresponds to the clause `or x1 x8 x12`. From the log itself, this is not evident but we can nevertheless 
support this claim by inspecting the Z3 source code.

```
[push] 0                            // after this at lvl 1
[assign] (not x1) decision axiom    // decide x1 -> false
[assign] x4 clause 2 1              // propagate x4 -> true due to clause (or x1 x4)
[push] 1                            // after this at lvl 2
[assign] (not x8) decision axiom    // decide x8 -> false
[assign] x12 clause 5 3 1           // propagate x12 -> true due to clause (or x1 x8 x12)
```

The function below shows the Z3-function `trace_assign` (in `src > smt > smt_context_pp.cpp` at line 676-686 of [Z3 version 4.13.0](https://github.com/Z3Prover/z3)) that prints out the `[assign]`-lines in the log:

```cpp
// in src > smt > smt_context_pp.cpp at line 676-686:
    void context::trace_assign(literal l, b_justification j, bool decision) const {
        SASSERT(m.has_trace_stream());
        std::ostream & out = m.trace_stream();
        ast_manager::suspend_trace _st(m);
        out << "[assign] ";
        display_literal(out, l);
        if (decision)
            out << " decision";
        out << " ";
        display_compact_j(out, j);
    }
```

This function is called in the Z3-function `assign_core` (in `src > smt > smt_context.cpp` at line 270-299 of [Z3 version 4.13.0](https://github.com/Z3Prover/z3)).

```cpp
// in src > smt > smt_context.cpp at line 270-299:
    void context::assign_core(literal l, b_justification j, bool decision) {
        m_assigned_literals.push_back(l);
        m_assignment[l.index()]    = l_true;
        m_assignment[(~l).index()] = l_false;
        bool_var_data & d          = get_bdata(l.var());
        set_justification(l.var(), d, j);
        d.m_scope_lvl              = m_scope_lvl;
        if (m_fparams.m_restart_adaptive && d.m_phase_available) {
            m_agility             *= m_fparams.m_agility_factor;
            if (!decision && d.m_phase == l.sign())
                m_agility         += (1.0 - m_fparams.m_agility_factor);
        }
        d.m_phase_available        = true;
        d.m_phase                  = !l.sign();
        TRACE("assign_core", tout << (decision?"decision: ":"propagating: ") << l << " ";
              display_literal_smt2(tout, l) << "\n";
              tout << "relevant: " << is_relevant_core(l) << " level: " << m_scope_lvl << " is atom " << d.is_atom() << "\n";
              display(tout, j);
              );
        TRACE("phase_selection", tout << "saving phase, is_pos: " << d.m_phase << " l: " << l << "\n";);

        if (d.is_atom() && (relevancy_lvl() == 0 || (relevancy_lvl() == 1 && !d.is_quantifier()) || is_relevant_core(l))) {
            m_atom_propagation_queue.push_back(l);
        }

        if (m.has_trace_stream())
            trace_assign(l, j, decision);

        m_case_split_queue->assign_lit_eh(l);
    }
```

As you can see, there are commands in the function that call `TRACE(...)` that can be used to log more information about the assignment. To obtain these more detailed logs, we can pass [additional command line flags to Z3](https://stackoverflow.com/questions/13102789/printing-internal-solver-formulas-in-z3). However, we need to [compile Z3 in debug mode](https://stackoverflow.com/questions/33898956/z3py-how-to-check-trace-information-when-using-z3-python-api).
So in our case, after cloning the Z3 Github repo, we can run 

```
python scripts/mk_make.py --debug
```

from the root directory of the repo. After it has compiled, we need to change into `z3/build/`

```
cd build
```

and run 

```
./z3 trace=true proof=true trace-file-name=foo.log ./input.smt2 -tr:assign_core
```

After we've done this, we obtain a file called `.z3-trace` that contains more detailed information about the solver run. In our case, an excerpt of it is given below:

```
-------- [assign_core] assign_core ../src/smt/smt_context.cpp:288 ---------
decision: -1 (not x1) 
relevant: 1 level: 1 is atom 0
axiom
------------------------------------------------
-------- [assign_core] assign_core ../src/smt/smt_context.cpp:288 ---------
propagating: 2 x4 
relevant: 1 level: 1 is atom 0
clause 2 1
------------------------------------------------
-------- [assign_core] assign_core ../src/smt/smt_context.cpp:288 ---------
decision: -3 (not x8) 
relevant: 1 level: 2 is atom 0
axiom
------------------------------------------------
-------- [assign_core] assign_core ../src/smt/smt_context.cpp:288 ---------
propagating: 5 x12 
relevant: 1 level: 2 is atom 0
clause 5 3 1
```

We evidently see the close resemblance to the ordinary log below. In particular, note how `-1` corresponds to `not x1`, `2` to `x4`, `-3` to `not x8`, and `5` to `x12`. Therefore `clause 5 3 1` corresponds to `or x12 x8 x1` as claimed before.
This syntax is, presumably, inspired by [DIMACS CNF](https://jix.github.io/varisat/manual/0.2.0/formats/dimacs.html#:~:text=The%20DIMACS%20CNF%20format%20is,a%20negation%20of%20a%20variable.).

```
[assign] (not x1) decision axiom    // decide x1 -> false
[assign] x4 clause 2 1              // propagate x4 -> true due to clause (or x1 x4)
[assign] (not x8) decision axiom    // decide x8 -> false
[assign] x12 clause 5 3 1           // propagate x12 -> true due to clause (or x1 x8 x12)
```


















