; https://github.com/viperproject/smt-scope/issues/100

(push)(pop)
(declare-fun f (Int) Int)

(assert (forall ((i Int))
    (!  (> (f i) 0)
        :pattern ((f i)) :qid user
    )))
(assert (= (f 0) 10))
(assert (= (f 1) 11))

(check-sat)
(get-model)

(assert (= (f 2) 0))
(check-sat)
