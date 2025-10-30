(set-option :auto_config false)
(set-option :smt.mbqi false)

(declare-sort Vec) ; vector sort

(declare-const empty Vec) ; empty vector

(declare-fun pop (Vec) Vec) ; pop one element
(declare-fun trim (Vec Int) Vec) ; pop N times
(declare-fun add (Int Int) Int) ; + (for patterns)

(assert (= (pop empty) empty)) ; pop-empty axiom
(assert (= (trim empty 1) empty)) ; trim-empty axiom

(assert (forall ((x Int) (y Int) (z Int)) (!(= (< (add x y) (add x z)) (< y z)) :pattern ((add x y) (add x z)) :qid add-lt) )) ; add-lt axiom
(assert (forall ((v Vec) (n Int)) (!(= (pop (trim v n)) (trim v (add 1 n))) :pattern ((pop (trim v n))) :qid pop-trim) )) ; pop-trim axiom
; (assert (= 20 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 (add 1 1))))))))))))))))))))) ; 19 adds
(check-sat)
