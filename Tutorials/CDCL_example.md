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

This examples the CDCL viewer mode that we have in the Axiom Profiler 2.0. Note in the figure below that we have labelled the edges with numbers to show the current search path. In particular, for the decision `d1` this makes sense 
as we can then correctly identify that after backtracking, on path 1, we assign `x9` to `false` and not on path 0 where we decide on a value for `x9` at d2.

<img width="1014" alt="image" src="https://github.com/viperproject/axiom-profiler-2/assets/23278394/7a0f9f69-edc1-4180-8ab9-022dec05020c">


Note that only the `[assign]` lines where the literal is followed by `decision` correspond to decisions. All others are propagations as we can extract from the Z3 source code:

```cpp
// in src > smt > smt_context_pp.cpp at lin 676-686:
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

```cpp
// in src > smt > smt_context.cpp at lin 270-299:
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

## Shortcoming/To-Do

The current code does not yet support the `[decide-and-or]`-line cases in Z3 logs. These seem to be connected with case splits that Z3 does during a solver run.















