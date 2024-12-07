(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testCollections.vpr
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Necessary for push pop mode
(set-option :auto_config false)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :type_check true)
(set-option :smt.mbqi false)
(set-option :pp.bv_literals false)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.arith.solver 2)
(set-option :model.v2 true)
(set-option :smt.qi.max_multi_patterns 1000)
; 
; ; /preamble.smt2
(declare-datatypes (($Snap 0)) ((
    ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(declare-sort $FPM 0)
(declare-sort $PPM 0)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
(declare-sort Seq<Int> 0)
(declare-sort Set<Int> 0)
(declare-sort Multiset<Int> 0)
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.$SnapToIntTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntTo$Snap($SortWrappers.$SnapToInt x)))
    :pattern (($SortWrappers.$SnapToInt x))
    :qid |$Snap.IntTo$SnapToInt|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.$SnapToBoolTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoolTo$Snap($SortWrappers.$SnapToBool x)))
    :pattern (($SortWrappers.$SnapToBool x))
    :qid |$Snap.BoolTo$SnapToBool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$SnapTo$RefTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$RefTo$Snap($SortWrappers.$SnapTo$Ref x)))
    :pattern (($SortWrappers.$SnapTo$Ref x))
    :qid |$Snap.$RefTo$SnapTo$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$SnapTo$PermTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PermTo$Snap($SortWrappers.$SnapTo$Perm x)))
    :pattern (($SortWrappers.$SnapTo$Perm x))
    :qid |$Snap.$PermTo$SnapTo$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Multiset<Int>To$Snap (Multiset<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Int> ($Snap) Multiset<Int>)
(assert (forall ((x Multiset<Int>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Int>($SortWrappers.Multiset<Int>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Int>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Int>To$Snap($SortWrappers.$SnapToMultiset<Int> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Int> x))
    :qid |$Snap.Multiset<Int>To$SnapToMultiset<Int>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
(declare-fun Multiset_count (Multiset<Int> Int) Int)
(declare-fun Multiset_card (Multiset<Int>) Int)
(declare-const Multiset_empty Multiset<Int>)
(declare-fun Multiset_singleton (Int) Multiset<Int>)
(declare-fun Multiset_unionone (Multiset<Int> Int) Multiset<Int>)
(declare-fun Multiset_union (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_intersection (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_difference (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_subset (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_equal (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Int> Multiset<Int>) Int)
(declare-fun Multiset_disjoint (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  )))
(assert (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((ms Multiset<Int>) (x Int)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Int)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Int>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Int>) o))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Int>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Int)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Int) (o Int)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Int)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Int)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Int>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Int>) (x Int) (o Int)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (y Int)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Int)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Int)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Ref__types ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const diz@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var L: Seq[Int]
(declare-const L@5@01 Seq<Int>)
; [exec]
; var S: Set[Int]
(declare-const S@6@01 Set<Int>)
; [exec]
; var B: Multiset[Int]
(declare-const B@7@01 Multiset<Int>)
; [exec]
; L := Seq(1, 2, 3)
; [eval] Seq(1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton 2))
      (Seq_singleton 3)))
  3))
(declare-const L@8@01 Seq<Int>)
(assert (=
  L@8@01
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3))))
; [exec]
; assert L == Seq(1, 2, 3)
; [eval] L == Seq(1, 2, 3)
; [eval] Seq(1, 2, 3)
(push) ; 3
(assert (not (Seq_equal
  L@8@01
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  L@8@01
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3))))
; [exec]
; S := Set(1, 2, 3)
; [eval] Set(1, 2, 3)
(declare-const S@9@01 Set<Int>)
(assert (= S@9@01 (Set_unionone (Set_unionone (Set_singleton 1) 2) 3)))
; [exec]
; assert S == Set(2, 1, 3)
; [eval] S == Set(2, 1, 3)
; [eval] Set(2, 1, 3)
(push) ; 3
(assert (not (Set_equal S@9@01 (Set_unionone (Set_unionone (Set_singleton 2) 1) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal S@9@01 (Set_unionone (Set_unionone (Set_singleton 2) 1) 3)))
; [exec]
; assert S == Set(1, 1, 2, 3, 3)
; [eval] S == Set(1, 1, 2, 3, 3)
; [eval] Set(1, 1, 2, 3, 3)
(push) ; 3
(assert (not (Set_equal S@9@01 (Set_unionone (Set_unionone (Set_unionone (Set_unionone (Set_singleton 1) 1) 2) 3) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal S@9@01 (Set_unionone (Set_unionone (Set_unionone (Set_unionone (Set_singleton 1) 1) 2) 3) 3)))
; [exec]
; B := Multiset(1, 1, 2, 3)
; [eval] Multiset(1, 1, 2, 3)
(declare-const B@10@01 Multiset<Int>)
(assert (=
  B@10@01
  (Multiset_unionone (Multiset_unionone (Multiset_unionone (Multiset_singleton 1) 1) 2) 3)))
; [exec]
; assert B == Multiset(1, 1, 2, 3)
; [eval] B == Multiset(1, 1, 2, 3)
; [eval] Multiset(1, 1, 2, 3)
(push) ; 3
(assert (not (Multiset_equal B@10@01 (Multiset_unionone (Multiset_unionone (Multiset_unionone (Multiset_singleton 1) 1) 2) 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Multiset_equal B@10@01 (Multiset_unionone (Multiset_unionone (Multiset_unionone (Multiset_singleton 1) 1) 2) 3)))
; [exec]
; assert (1 in B) == 2
; [eval] (1 in B) == 2
; [eval] (1 in B)
(push) ; 3
(assert (not (= (Multiset_count B@10@01 1) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Multiset_count B@10@01 1) 2))
(pop) ; 2
(pop) ; 1
; ---------- Ref__Ref ----------
(declare-const current_thread_id@11@01 Int)
(declare-const sys__result@12@01 $Ref)
(declare-const current_thread_id@13@01 Int)
(declare-const sys__result@14@01 $Ref)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@13@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@14@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@17@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@18@01 $Ref)
(assert (not (= diz@18@01 $Ref.null)))
(assert (not (= diz@18@01 sys__result@14@01)))
(assert (not (= diz@18@01 diz@17@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
