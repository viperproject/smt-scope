; https://github.com/viperproject/smt-scope/issues/106

(push)(pop)
(declare-fun |#1 f| (Int) Int)
(declare-fun |(f #1)| (Int) Int)

(assert (forall ((i Int))
    (!  (> (|#1 f| i) (|(f #1)| i))
        :pattern ((|#1 f| i) (|(f #1)| i)) :qid |21 q2 39i|
    )))
(assert (= (|#1 f| 0) (|(f #1)| 0)))
(check-sat)
