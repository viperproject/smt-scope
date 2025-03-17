; Nested quantifiers allow us to hide forbidden terms inside of patterns

(set-option :auto_config false)
(set-option :smt.mbqi false)

(declare-fun g (Int) Bool)
(declare-fun f (Int Int) Int)
(declare-const x Bool)

(assert (forall ((i Int))
    (!  (and (g i) (forall ((j Int))
        (!  (> (f i j) 0)
        :pattern ((f i j)) :qid inner)
    ))
    :pattern ((g i)) :qid outer)
))

(assert (g (ite x 1 2)))
(assert (= (f 1 0) 0))
(assert (= (f 2 0) 0))
(check-sat)
