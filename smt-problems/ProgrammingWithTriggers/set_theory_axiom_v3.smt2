; some z3 options
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.refine_inj_axioms false)
(set-option :trace true) 
(set-option :trace_file_name set_theory_axiom_v3.log)
(set-logic ALL)

(declare-const c (Set Int))
(declare-const d0 (Set Int))
(declare-const d1 (Set Int))
(declare-const d2 (Set Int))
(declare-const d3 (Set Int))
(declare-const emptyset (Set Int))
(declare-fun dif ((Set Int) (Set Int)) (Set Int))
(declare-fun cup ((Set Int) (Set Int)) (Set Int))
(declare-fun difhat ((Set Int) (Set Int)) (Set Int))

(assert
  (forall 
    ((A (Set Int)) (B (Set Int)))
    (!
      (= (dif A B) (difhat A B))
      :pattern
      ((dif A B))
      :qid loop1 
    )
  )
)

(assert
  (forall 
    ((A (Set Int)) (B (Set Int)) (C (Set Int)))
    (!
      (= (dif (difhat A B) C) (difhat A (cup B C)))
      :pattern
      ((dif A (cup B C)))
      :qid loop2 
    )
  )
)

(assert (= (dif (dif (dif (dif c d0) d1) d2) d3) (dif c (cup emptyset d0))))
(assert (= d0 (cup emptyset d0)))

(check-sat)
