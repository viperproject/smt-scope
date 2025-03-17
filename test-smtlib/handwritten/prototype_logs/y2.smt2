(declare-sort Thing)

(declare-fun G (Thing Thing) bool)

(assert (forall ((x Thing)) (!
  (forall ((y Thing)) (!
    (G x y)
  ))
)))
(assert (not (forall ((x Thing)) (!
  (forall ((y Thing)) (!
    (or (G x y) (G y x))
  ))
))))
(check-sat)
