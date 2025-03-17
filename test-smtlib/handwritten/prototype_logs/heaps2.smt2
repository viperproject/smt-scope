(declare-sort Arr)
(declare-sort Loc)
(declare-sort Heap)

(declare-fun slot (Arr Int) Loc)
(declare-fun lookup (Heap Loc) Int)
(declare-fun next (Loc) Loc)

(declare-const h1 Heap)
(declare-const a Arr)
(declare-const size Int)
(declare-const j Int)

(assert (forall ((i Int)) (!
  (or (>= (lookup h1 (slot a i)) (lookup h1 (next (slot a i)))) (< i 0) (>= i size))
)))
(assert (forall ((ar Arr) (i Int)) (!
  (= (next (slot a i)) (slot a (+ i 1)))
  :pattern ((next (slot ar i)))
)))

(assert (>= j 1024))
(assert (>= size (+ j 1024)))
(assert (not (= (lookup h1 (slot a j)) 42)))
(check-sat)
