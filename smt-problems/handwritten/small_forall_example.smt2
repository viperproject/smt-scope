(declare-const x (_ BitVec 64))
(declare-const y (_ BitVec 64))
(assert (forall ((x (_ BitVec 64)) (y (_ BitVec 64)))
    (= (bvsub (bvadd x y) (bvshl (bvand x y) (_ bv1 64))) (bvxor x y))))

(check-sat)
