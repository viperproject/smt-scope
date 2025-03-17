(declare-sort Arr)
(declare-sort Loc)
(declare-sort Heap)

(declare-fun slot (Arr Int) Loc)
(declare-fun lookup (Heap Loc) Int)
(declare-fun next (Loc) Loc)

(declare-const h1 Heap)
(declare-const h2 Heap)
(declare-const a Arr)
(declare-const size Int)
(declare-const j Int)

(assert (forall ((i Int)) (!
  (or (= (lookup h2 (slot a i)) (lookup h1 (slot a (- i 32)))) (< i 32) (>= i size))
)))

(assert (>= j 1024))
(assert (>= size (+ j 1024)))
(assert (not (= (lookup h1 (slot a j)) 42)))
(check-sat)
