(set-option :auto_config false)
(set-option :smt.mbqi false)

(declare-fun f (Int Int) Int)
(declare-fun g (Int) Int)

(assert (forall ((x Int) (y Int)) (!(< (f x (g y)) (f (+ x 1) y)) :pattern ((f x (g y))) :qid ordering) ))

(assert (= 0 (g 0)))
(assert (< (f 0 0) (f 100 0)))
(check-sat)
