; some z3 options
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.refine_inj_axioms false)
(set-logic ALL)

(declare-const next Int)
(declare-const prev Int)
(declare-const heap (Set Int))
(declare-fun index (Int Int (Set Int)) Int)
(declare-const owns (Set Int))
(declare-fun in (Int (Set Int)) Bool)
(declare-const p0 Int)

(assert
  (forall 
    ((p Int))
    (!
      (=> (in p owns) (and (in (index p next heap) owns) (in (index p prev heap) owns)))
      :pattern
      ((in p owns))
      :qid loop1 
    )
  )
)

(assert (in p0 owns))

(check-sat)
