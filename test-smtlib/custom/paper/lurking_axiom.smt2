(set-option :auto_config false)
(set-option :smt.mbqi false)
(set-option :produce-unsat-cores true)

(declare-sort Vec) ; vector sort

(declare-fun non_empty (Vec) Bool)
(declare-fun len (Vec) Int)
(declare-fun append (Vec Vec) Vec)

(assert (! (forall ((x Vec)) (!(= (non_empty x) (>= (len x) 1)) :pattern ((non_empty x)) :qid non_empty-def) ) :named non_empty-def-ax) )
(assert (! (forall ((x Vec) (y Vec)) (!(= (non_empty (append x y)) (or (non_empty x) (non_empty y))) :pattern ((len x) (len y)) :qid non_empty-append) ) :named non_empty-append-ax) )

(declare-const a Vec)
(declare-const b Vec)
(assert (! (and (non_empty a) (non_empty b)) :named pre))
(assert (! (not (non_empty (append a b))) :named post))

(check-sat)
(get-unsat-core)
