(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/sequences/sequences.vpr
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
(declare-sort Seq<Bool> 0)
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
(declare-fun $SortWrappers.Seq<Bool>To$Snap (Seq<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Bool> ($Snap) Seq<Bool>)
(assert (forall ((x Seq<Bool>)) (!
    (= x ($SortWrappers.$SnapToSeq<Bool>($SortWrappers.Seq<Bool>To$Snap x)))
    :pattern (($SortWrappers.Seq<Bool>To$Snap x))
    :qid |$Snap.$SnapToSeq<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Bool>To$Snap($SortWrappers.$SnapToSeq<Bool> x)))
    :pattern (($SortWrappers.$SnapToSeq<Bool> x))
    :qid |$Snap.Seq<Bool>To$SnapToSeq<Bool>|
    )))
; ////////// Symbols
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
(declare-fun Seq_length (Seq<Bool>) Int)
(declare-const Seq_empty Seq<Bool>)
(declare-fun Seq_singleton (Bool) Seq<Bool>)
(declare-fun Seq_append (Seq<Bool> Seq<Bool>) Seq<Bool>)
(declare-fun Seq_index (Seq<Bool> Int) Bool)
(declare-fun Seq_update (Seq<Bool> Int Bool) Seq<Bool>)
(declare-fun Seq_take (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_drop (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_contains (Seq<Bool> Bool) Bool)
(declare-fun Seq_contains_trigger (Seq<Bool> Bool) Bool)
(declare-fun Seq_skolem (Seq<Bool> Bool) Int)
(declare-fun Seq_equal (Seq<Bool> Seq<Bool>) Bool)
(declare-fun Seq_skolem_diff (Seq<Bool> Seq<Bool>) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun trivial ($Snap Int) Bool)
(declare-fun trivial%limited ($Snap Int) Bool)
(declare-fun trivial%stateless (Int) Bool)
(declare-fun trivial%precondition ($Snap Int) Bool)
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
(assert (forall ((s Seq<Bool>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Bool>)) 0))
(assert (forall ((s Seq<Bool>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Bool)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (not (= s1 (as Seq_empty  Seq<Bool>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Bool)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
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
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
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
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Bool>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (x Bool)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Bool>) (x Bool) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
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
(assert (forall ((a Seq<Bool>) (b Seq<Bool>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Bool) (y Bool)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
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
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (trivial%limited s@$ i@0@00) (trivial s@$ i@0@00))
  :pattern ((trivial s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (trivial%stateless i@0@00)
  :pattern ((trivial%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=> (trivial%precondition s@$ i@0@00) (= (trivial s@$ i@0@00) true))
  :pattern ((trivial s@$ i@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((trivial s@$ i@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t1 ----------
(declare-const x@0@01 Int)
(declare-const xs@1@01 Seq<Int>)
(declare-const x@2@01 Int)
(declare-const xs@3@01 Seq<Int>)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n: Seq[Int]
(declare-const n@4@01 Seq<Int>)
; [exec]
; n := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; assert |n| == 0
; [eval] |n| == 0
; [eval] |n|
(push) ; 3
(assert (not (= (Seq_length (as Seq_empty  Seq<Int>)) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
; [exec]
; assert n != Seq(x)
; [eval] n != Seq(x)
; [eval] Seq(x)
(assert (= (Seq_length (Seq_singleton x@2@01)) 1))
(push) ; 3
(assert (not (not (Seq_equal (as Seq_empty  Seq<Int>) (Seq_singleton x@2@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Seq_equal (as Seq_empty  Seq<Int>) (Seq_singleton x@2@01))))
; [exec]
; assert |Seq(1)| == 1
; [eval] |Seq(1)| == 1
; [eval] |Seq(1)|
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
; [exec]
; assert |Seq(0)| == 0
; [eval] |Seq(0)| == 0
; [eval] |Seq(0)|
; [eval] Seq(0)
(assert (= (Seq_length (Seq_singleton 0)) 1))
(push) ; 3
(assert (not (= (Seq_length (Seq_singleton 0)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |Seq(0)| == 0
; [eval] |Seq(0)|
; [eval] Seq(0)
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_singleton 0)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |Seq(0)| == 0
; [eval] |Seq(0)|
; [eval] Seq(0)
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_singleton 0)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |Seq(0)| == 0
; [eval] |Seq(0)|
; [eval] Seq(0)
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_singleton 0)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Seq[Int]
(declare-const a@5@01 Seq<Int>)
; [exec]
; assert (1 in Seq(1, 2, 3))
; [eval] (1 in Seq(1, 2, 3))
; [eval] Seq(1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton 2))
      (Seq_singleton 3)))
  3))
(push) ; 3
(assert (not (Seq_contains
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3))
  1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_contains
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3))
  1))
; [exec]
; assert |[-1..10)| == 11
; [eval] |[-1..10)| == 11
; [eval] |[-1..10)|
; [eval] [-1..10)
; [eval] -1
(push) ; 3
(assert (not (= (Seq_length (Seq_range (- 0 1) 10)) 11)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_range (- 0 1) 10)) 11))
; [exec]
; assert Seq(1) ++ Seq(2) == Seq(1, 2)
; [eval] Seq(1) ++ Seq(2) == Seq(1, 2)
; [eval] Seq(1) ++ Seq(2)
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
; [eval] Seq(2)
(assert (= (Seq_length (Seq_singleton 2)) 1))
; [eval] Seq(1, 2)
(assert (= (Seq_length (Seq_append (Seq_singleton 1) (Seq_singleton 2))) 2))
; [exec]
; a := Seq(0, 1, -11, 22)
; [eval] Seq(0, 1, -11, 22)
; [eval] -11
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 0) (Seq_singleton 1))
        (Seq_singleton (- 0 11)))
      (Seq_singleton 22)))
  4))
(declare-const a@6@01 Seq<Int>)
(assert (=
  a@6@01
  (Seq_append
    (Seq_append
      (Seq_append (Seq_singleton 0) (Seq_singleton 1))
      (Seq_singleton (- 0 11)))
    (Seq_singleton 22))))
; [exec]
; assert a[2] == -11
; [eval] a[2] == -11
; [eval] a[2]
(push) ; 3
(assert (not (< 2 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] -11
(push) ; 3
(assert (not (= (Seq_index a@6@01 2) (- 0 11))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index a@6@01 2) (- 0 11)))
; [exec]
; assert a[..1] == Seq(0)
; [eval] a[..1] == Seq(0)
; [eval] a[..1]
; [eval] Seq(0)
(assert (= (Seq_length (Seq_singleton 0)) 1))
(push) ; 3
(assert (not (Seq_equal (Seq_take a@6@01 1) (Seq_singleton 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_take a@6@01 1) (Seq_singleton 0)))
; [exec]
; assert a[1..] == Seq(1, -11, 22)
; [eval] a[1..] == Seq(1, -11, 22)
; [eval] a[1..]
; [eval] Seq(1, -11, 22)
; [eval] -11
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton (- 0 11)))
      (Seq_singleton 22)))
  3))
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop a@6@01 1)
  (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton (- 0 11)))
    (Seq_singleton 22)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop a@6@01 1)
  (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton (- 0 11)))
    (Seq_singleton 22))))
; [exec]
; assert a[1..2] == Seq(1)
; [eval] a[1..2] == Seq(1)
; [eval] a[1..2]
; [eval] a[..2]
; [eval] Seq(1)
(push) ; 3
(assert (not (Seq_equal (Seq_drop (Seq_take a@6@01 2) 1) (Seq_singleton 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_drop (Seq_take a@6@01 2) 1) (Seq_singleton 1)))
; [exec]
; assert a[1 := 22] == a[1 := -1][1 := 22]
; [eval] a[1 := 22] == a[1 := -1][1 := 22]
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] a[1 := -1][1 := 22]
; [eval] a[1 := -1]
; [eval] -1
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  1
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton (- 0 1)) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Seq_equal
  (Seq_append
    (Seq_take a@6@01 1)
    (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
  (Seq_append
    (Seq_take
      (Seq_append
        (Seq_take a@6@01 1)
        (Seq_append (Seq_singleton (- 0 1)) (Seq_drop a@6@01 2)))
      1)
    (Seq_append
      (Seq_singleton 22)
      (Seq_drop
        (Seq_append
          (Seq_take a@6@01 1)
          (Seq_append (Seq_singleton (- 0 1)) (Seq_drop a@6@01 2)))
        2))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_append
    (Seq_take a@6@01 1)
    (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
  (Seq_append
    (Seq_take
      (Seq_append
        (Seq_take a@6@01 1)
        (Seq_append (Seq_singleton (- 0 1)) (Seq_drop a@6@01 2)))
      1)
    (Seq_append
      (Seq_singleton 22)
      (Seq_drop
        (Seq_append
          (Seq_take a@6@01 1)
          (Seq_append (Seq_singleton (- 0 1)) (Seq_drop a@6@01 2)))
        2)))))
; [exec]
; assert a[1 := 22] == Seq(0, 22, -11, 22)
; [eval] a[1 := 22] == Seq(0, 22, -11, 22)
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] Seq(0, 22, -11, 22)
; [eval] -11
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 0) (Seq_singleton 22))
        (Seq_singleton (- 0 11)))
      (Seq_singleton 22)))
  4))
(push) ; 3
(assert (not (Seq_equal
  (Seq_append
    (Seq_take a@6@01 1)
    (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
  (Seq_append
    (Seq_append
      (Seq_append (Seq_singleton 0) (Seq_singleton 22))
      (Seq_singleton (- 0 11)))
    (Seq_singleton 22)))))
(check-sat)
; unsat
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_append
    (Seq_take a@6@01 1)
    (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
  (Seq_append
    (Seq_append
      (Seq_append (Seq_singleton 0) (Seq_singleton 22))
      (Seq_singleton (- 0 11)))
    (Seq_singleton 22))))
; [exec]
; assert |a[1 := 22]| == 4
; [eval] |a[1 := 22]| == 4
; [eval] |a[1 := 22]|
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2))))
  4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2))))
  4))
; [exec]
; assert a[1 := 22][1] == 22
; [eval] a[1 := 22][1] == 22
; [eval] a[1 := 22][1]
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  1
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    1)
  22)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    1)
  22))
; [exec]
; assert a[1 := 22][2] == -11
; [eval] a[1 := 22][2] == -11
; [eval] a[1 := 22][2]
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  2
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] -11
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    2)
  (- 0 11))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    2)
  (- 0 11)))
; [exec]
; assert a[1 := 22][0] == 22
; [eval] a[1 := 22][0] == 22
; [eval] a[1 := 22][0]
; [eval] a[1 := 22]
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  0
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    0)
  22)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a[1 := 22][0] == 22
; [eval] a[1 := 22][0]
; [eval] a[1 := 22]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  0
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    0)
  22)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a[1 := 22][0] == 22
; [eval] a[1 := 22][0]
; [eval] a[1 := 22]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  0
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    0)
  22)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a[1 := 22][0] == 22
; [eval] a[1 := 22][0]
; [eval] a[1 := 22]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length a@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  0
  (Seq_length
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_take a@6@01 1)
      (Seq_append (Seq_singleton 22) (Seq_drop a@6@01 2)))
    0)
  22)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var xs: Seq[Int]
(declare-const xs@7@01 Seq<Int>)
; [exec]
; var bs: Seq[Bool]
(declare-const bs@8@01 Seq<Bool>)
; [exec]
; xs := Seq(0, 1, 2, 3, 4, 5, 6, 7)
; [eval] Seq(0, 1, 2, 3, 4, 5, 6, 7)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton 0) (Seq_singleton 1))
                (Seq_singleton 2))
              (Seq_singleton 3))
            (Seq_singleton 4))
          (Seq_singleton 5))
        (Seq_singleton 6))
      (Seq_singleton 7)))
  8))
(declare-const xs@9@01 Seq<Int>)
(assert (=
  xs@9@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton 0) (Seq_singleton 1))
              (Seq_singleton 2))
            (Seq_singleton 3))
          (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    (Seq_singleton 7))))
; [exec]
; bs := Seq(true, true, false, true) ++ Seq(false, true)
; [eval] Seq(true, true, false, true) ++ Seq(false, true)
; [eval] Seq(true, true, false, true)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton true) (Seq_singleton true))
        (Seq_singleton false))
      (Seq_singleton true)))
  4))
; [eval] Seq(false, true)
(assert (= (Seq_length (Seq_append (Seq_singleton false) (Seq_singleton true))) 2))
(declare-const bs@10@01 Seq<Bool>)
(assert (=
  bs@10@01
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton true) (Seq_singleton true))
        (Seq_singleton false))
      (Seq_singleton true))
    (Seq_append (Seq_singleton false) (Seq_singleton true)))))
; [exec]
; assert |xs[1..][..6]| == |bs|
; [eval] |xs[1..][..6]| == |bs|
; [eval] |xs[1..][..6]|
; [eval] xs[1..][..6]
; [eval] xs[1..]
; [eval] |bs|
(push) ; 3
(assert (not (= (Seq_length (Seq_take (Seq_drop xs@9@01 1) 6)) (Seq_length bs@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length (Seq_take (Seq_drop xs@9@01 1) 6)) (Seq_length bs@10@01)))
; [exec]
; assert |xs[1..]| == |xs|
; [eval] |xs[1..]| == |xs|
; [eval] |xs[1..]|
; [eval] xs[1..]
; [eval] |xs|
(push) ; 3
(assert (not (= (Seq_length (Seq_drop xs@9@01 1)) (Seq_length xs@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |xs[1..]| == |xs|
; [eval] |xs[1..]|
; [eval] xs[1..]
; [eval] |xs|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop xs@9@01 1)) (Seq_length xs@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |xs[1..]| == |xs|
; [eval] |xs[1..]|
; [eval] xs[1..]
; [eval] |xs|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop xs@9@01 1)) (Seq_length xs@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |xs[1..]| == |xs|
; [eval] |xs[1..]|
; [eval] xs[1..]
; [eval] |xs|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop xs@9@01 1)) (Seq_length xs@9@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const s@11@01 Seq<Int>)
(declare-const i@12@01 Int)
(declare-const j@13@01 Int)
(declare-const s@14@01 Seq<Int>)
(declare-const i@15@01 Int)
(declare-const j@16@01 Int)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@15@01))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] i <= j
(assert (<= i@15@01 j@16@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert s == s[..i] ++ s[i..]
; [eval] s == s[..i] ++ s[i..]
; [eval] s[..i] ++ s[i..]
; [eval] s[..i]
; [eval] s[i..]
(push) ; 3
(assert (not (Seq_equal
  s@14@01
  (Seq_append (Seq_take s@14@01 i@15@01) (Seq_drop s@14@01 i@15@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  s@14@01
  (Seq_append (Seq_take s@14@01 i@15@01) (Seq_drop s@14@01 i@15@01))))
; [exec]
; assert s == s[..i] ++ s[i..j] ++ s[j..]
; [eval] s == s[..i] ++ s[i..j] ++ s[j..]
; [eval] s[..i] ++ s[i..j] ++ s[j..]
; [eval] s[..i] ++ s[i..j]
; [eval] s[..i]
; [eval] s[i..j]
; [eval] s[..j]
; [eval] s[j..]
(push) ; 3
(assert (not (Seq_equal
  s@14@01
  (Seq_append
    (Seq_append
      (Seq_take s@14@01 i@15@01)
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01))
    (Seq_drop s@14@01 j@16@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal
  s@14@01
  (Seq_append
    (Seq_append
      (Seq_take s@14@01 i@15@01)
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01))
    (Seq_drop s@14@01 j@16@01))))
; [exec]
; assert s[..i] ++ s[i..j] ++ s[j..] == s[..i] ++ (s[i..j] ++ s[j..])
; [eval] s[..i] ++ s[i..j] ++ s[j..] == s[..i] ++ (s[i..j] ++ s[j..])
; [eval] s[..i] ++ s[i..j] ++ s[j..]
; [eval] s[..i] ++ s[i..j]
; [eval] s[..i]
; [eval] s[i..j]
; [eval] s[..j]
; [eval] s[j..]
; [eval] s[..i] ++ (s[i..j] ++ s[j..])
; [eval] s[..i]
; [eval] s[i..j] ++ s[j..]
; [eval] s[i..j]
; [eval] s[..j]
; [eval] s[j..]
(push) ; 3
(assert (not (Seq_equal
  (Seq_append
    (Seq_append
      (Seq_take s@14@01 i@15@01)
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01))
    (Seq_drop s@14@01 j@16@01))
  (Seq_append
    (Seq_take s@14@01 i@15@01)
    (Seq_append
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01)
      (Seq_drop s@14@01 j@16@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_append
    (Seq_append
      (Seq_take s@14@01 i@15@01)
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01))
    (Seq_drop s@14@01 j@16@01))
  (Seq_append
    (Seq_take s@14@01 i@15@01)
    (Seq_append
      (Seq_drop (Seq_take s@14@01 j@16@01) i@15@01)
      (Seq_drop s@14@01 j@16@01)))))
; [exec]
; assert |s[j..]| == |s| - j
; [eval] |s[j..]| == |s| - j
; [eval] |s[j..]|
; [eval] s[j..]
; [eval] |s| - j
; [eval] |s|
(push) ; 3
(assert (not (= (Seq_length (Seq_drop s@14@01 j@16@01)) (- (Seq_length s@14@01) j@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |s[j..]| == |s| - j
; [eval] |s[j..]|
; [eval] s[j..]
; [eval] |s| - j
; [eval] |s|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop s@14@01 j@16@01)) (- (Seq_length s@14@01) j@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |s[j..]| == |s| - j
; [eval] |s[j..]|
; [eval] s[j..]
; [eval] |s| - j
; [eval] |s|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop s@14@01 j@16@01)) (- (Seq_length s@14@01) j@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] |s[j..]| == |s| - j
; [eval] |s[j..]|
; [eval] s[j..]
; [eval] |s| - j
; [eval] |s|
(set-option :timeout 0)
(push) ; 3
(assert (not (= (Seq_length (Seq_drop s@14@01 j@16@01)) (- (Seq_length s@14@01) j@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const s@18@01 Seq<Int>)
(declare-const i@19@01 Int)
(declare-const j@20@01 Int)
(declare-const s@21@01 Seq<Int>)
(declare-const i@22@01 Int)
(declare-const j@23@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert s == s[..i] ++ s[i..]
; [eval] s == s[..i] ++ s[i..]
; [eval] s[..i] ++ s[i..]
; [eval] s[..i]
; [eval] s[i..]
(push) ; 3
(assert (not (Seq_equal
  s@21@01
  (Seq_append (Seq_take s@21@01 i@22@01) (Seq_drop s@21@01 i@22@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  s@21@01
  (Seq_append (Seq_take s@21@01 i@22@01) (Seq_drop s@21@01 i@22@01))))
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert Seq(3, 4, 5, 6)[0] == 3
; [eval] Seq(3, 4, 5, 6)[0] == 3
; [eval] Seq(3, 4, 5, 6)[0]
; [eval] Seq(3, 4, 5, 6)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6)))
  4))
(push) ; 3
(assert (not (<
  0
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    0)
  3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    0)
  3))
; [exec]
; assert Seq(3, 4, 5, 6)[1] == 4
; [eval] Seq(3, 4, 5, 6)[1] == 4
; [eval] Seq(3, 4, 5, 6)[1]
; [eval] Seq(3, 4, 5, 6)
(push) ; 3
(assert (not (<
  1
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    1)
  4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    1)
  4))
; [exec]
; assert Seq(3, 4, 5, 6)[2] == 5
; [eval] Seq(3, 4, 5, 6)[2] == 5
; [eval] Seq(3, 4, 5, 6)[2]
; [eval] Seq(3, 4, 5, 6)
(push) ; 3
(assert (not (<
  2
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    2)
  5)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    2)
  5))
; [exec]
; assert Seq(3, 4, 5, 6)[3] == 6
; [eval] Seq(3, 4, 5, 6)[3] == 6
; [eval] Seq(3, 4, 5, 6)[3]
; [eval] Seq(3, 4, 5, 6)
(push) ; 3
(assert (not (<
  3
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  6))
; [exec]
; assert Seq(3, 4, 5, 6)[3] == 5
; [eval] Seq(3, 4, 5, 6)[3] == 5
; [eval] Seq(3, 4, 5, 6)[3]
; [eval] Seq(3, 4, 5, 6)
(push) ; 3
(assert (not (<
  3
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Seq(3, 4, 5, 6)[3] == 5
; [eval] Seq(3, 4, 5, 6)[3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  3
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Seq(3, 4, 5, 6)[3] == 5
; [eval] Seq(3, 4, 5, 6)[3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  3
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Seq(3, 4, 5, 6)[3] == 5
; [eval] Seq(3, 4, 5, 6)[3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  3
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (Seq_index
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))
    3)
  5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test_index_definedness_small ----------
(declare-const i@24@01 Int)
(declare-const i@25@01 Int)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] i < 4
(assert (< i@25@01 4))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert trivial(Seq(3, 4, 5, 6)[i])
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6)))
  4))
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test_index_definedness_large ----------
(declare-const i@27@01 Int)
(declare-const i@28@01 Int)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] i >= 0
(assert (>= i@28@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert trivial(Seq(3, 4, 5, 6)[i])
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6)))
  4))
(push) ; 3
(assert (not (<
  i@28@01
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  i@28@01
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  i@28@01
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i])
; [eval] Seq(3, 4, 5, 6)[i]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  i@28@01
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test_build_index_definedness_small ----------
(declare-const i@30@01 Int)
(declare-const i@31@01 Int)
(push) ; 1
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] i < 4
(assert (< i@31@01 4))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert trivial(Seq(3, 4, 5, 6)[i := 3][0])
; [eval] trivial(Seq(3, 4, 5, 6)[i := 3][0])
; [eval] Seq(3, 4, 5, 6)[i := 3][0]
; [eval] Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6)))
  4))
(push) ; 3
(assert (not (>= i@31@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i := 3][0])
; [eval] Seq(3, 4, 5, 6)[i := 3][0]
; [eval] Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@31@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i := 3][0])
; [eval] Seq(3, 4, 5, 6)[i := 3][0]
; [eval] Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@31@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] trivial(Seq(3, 4, 5, 6)[i := 3][0])
; [eval] Seq(3, 4, 5, 6)[i := 3][0]
; [eval] Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@31@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test_build_index_definedness_large ----------
(declare-const i@33@01 Int)
(declare-const i@34@01 Int)
(push) ; 1
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] i >= 0
(assert (>= i@34@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var s: Seq[Int]
(declare-const s@36@01 Seq<Int>)
; [exec]
; s := Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)[i := 3]
; [eval] Seq(3, 4, 5, 6)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6)))
  4))
(push) ; 3
(assert (not (<
  i@34@01
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton 3) (Seq_singleton 4))
        (Seq_singleton 5))
      (Seq_singleton 6))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
