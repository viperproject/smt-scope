(set-option :auto_config false)
(set-option :smt.mbqi false)

(declare-sort Type)

(declare-const t0 Type)
(declare-const t1 Type)
(declare-const t2 Type)

(define-fun subtype ((x Type) (y Type)) Bool ((_ partial-order 0) x y))

(assert (subtype t0 t1))
(assert (subtype t1 t2))

(assert (not (subtype t0 t2)))
(check-sat)
