(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.refine_inj_axioms false)

(declare-sort Arr)
(declare-sort Loc)
(declare-sort Heap)

(declare-fun slot (Arr Int) Loc) ; heap location for array slot
(declare-fun lookup (Heap Loc) Int) ; dereference on the heap
(declare-fun next (Loc) Loc) ; next slot / pointer increment

(declare-const h1 Heap)
(declare-const a Arr)
(declare-const size Int)
(declare-const j Int)

(assert (forall ((ar Arr) (i Int) (k Int)) (!(or (= i k) (not (= (slot ar i) (slot ar k)))) :pattern ((slot ar i) (slot ar k)) :qid injectivity) ))
(assert (forall ((ar Arr) (i Int)) (!(= (next (slot a i)) (slot a (+ i 1)) ) :pattern ((slot ar i)) :qid next_def)))
(assert (forall ((i Int)) (!(or (< i 0) (>= i size)  (>= (lookup h1 (slot a i)) (lookup h1 (next (slot a i)))) ) :pattern ((lookup h1 (slot a i))) :qid sortedness)))

(assert (and (>= j 0) (< (+ j 100) size))) ; stops there being trivial models / cases where unsat can't be proven
(assert (not (> (lookup h1 (slot a j)) (lookup h1 (next (slot a j))) )))
(check-sat)
