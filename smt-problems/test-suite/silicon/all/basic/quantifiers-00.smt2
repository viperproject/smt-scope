(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:48
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/quantifiers.vpr
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
(declare-sort Seq<$Ref> 0)
(declare-sort Seq<Int> 0)
(declare-sort Set<$Ref> 0)
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
(declare-fun $SortWrappers.Seq<$Ref>To$Snap (Seq<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Ref> ($Snap) Seq<$Ref>)
(assert (forall ((x Seq<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Ref>($SortWrappers.Seq<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Ref>To$Snap($SortWrappers.$SnapToSeq<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Ref> x))
    :qid |$Snap.Seq<$Ref>To$SnapToSeq<$Ref>|
    )))
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
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_contains_trigger (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_skolem (Seq<$Ref> $Ref) Int)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Ref> Seq<$Ref>) Int)
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
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
(declare-fun Cell_get ($Snap $Ref) Int)
(declare-fun Cell_get%limited ($Snap $Ref) Int)
(declare-fun Cell_get%stateless ($Ref) Bool)
(declare-fun Cell_get%precondition ($Snap $Ref) Bool)
(declare-fun g2 ($Snap Int Int) Bool)
(declare-fun g2%limited ($Snap Int Int) Bool)
(declare-fun g2%stateless (Int Int) Bool)
(declare-fun g2%precondition ($Snap Int Int) Bool)
(declare-fun g ($Snap Int) Int)
(declare-fun g%limited ($Snap Int) Int)
(declare-fun g%stateless (Int) Bool)
(declare-fun g%precondition ($Snap Int) Bool)
(declare-fun f2 ($Snap Int) Bool)
(declare-fun f2%limited ($Snap Int) Bool)
(declare-fun f2%stateless (Int) Bool)
(declare-fun f2%precondition ($Snap Int) Bool)
(declare-fun f ($Snap Int Int) Int)
(declare-fun f%limited ($Snap Int Int) Int)
(declare-fun f%stateless (Int Int) Bool)
(declare-fun f%precondition ($Snap Int Int) Bool)
(declare-fun reqIGt0 ($Snap Int) Int)
(declare-fun reqIGt0%limited ($Snap Int) Int)
(declare-fun reqIGt0%stateless (Int) Bool)
(declare-fun reqIGt0%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (not (= s1 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Ref)) (!
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
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
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
(assert (forall ((a Seq<$Ref>) (b Seq<$Ref>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Ref) (y $Ref)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
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
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
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
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
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
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
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
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Cell_get%limited s@$ this@0@00) (Cell_get s@$ this@0@00))
  :pattern ((Cell_get s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Cell_get%stateless this@0@00)
  :pattern ((Cell_get%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (Cell_get%precondition s@$ this@0@00)
    (= (Cell_get s@$ this@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((Cell_get s@$ this@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((Cell_get s@$ this@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int) (j@3@00 Int)) (!
  (= (g2%limited s@$ i@2@00 j@3@00) (g2 s@$ i@2@00 j@3@00))
  :pattern ((g2 s@$ i@2@00 j@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int) (j@3@00 Int)) (!
  (g2%stateless i@2@00 j@3@00)
  :pattern ((g2%limited s@$ i@2@00 j@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int) (j@3@00 Int)) (!
  (=> (g2%precondition s@$ i@2@00 j@3@00) (= (g2 s@$ i@2@00 j@3@00) true))
  :pattern ((g2 s@$ i@2@00 j@3@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int) (j@3@00 Int)) (!
  true
  :pattern ((g2 s@$ i@2@00 j@3@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int)) (!
  (= (g%limited s@$ i@5@00) (g s@$ i@5@00))
  :pattern ((g s@$ i@5@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int)) (!
  (g%stateless i@5@00)
  :pattern ((g%limited s@$ i@5@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int)) (!
  (=> (g%precondition s@$ i@5@00) (= (g s@$ i@5@00) i@5@00))
  :pattern ((g s@$ i@5@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int)) (!
  true
  :pattern ((g s@$ i@5@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (i@7@00 Int)) (!
  (= (f2%limited s@$ i@7@00) (f2 s@$ i@7@00))
  :pattern ((f2 s@$ i@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@7@00 Int)) (!
  (f2%stateless i@7@00)
  :pattern ((f2%limited s@$ i@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@7@00 Int)) (!
  (=> (f2%precondition s@$ i@7@00) (= (f2 s@$ i@7@00) true))
  :pattern ((f2 s@$ i@7@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (i@7@00 Int)) (!
  true
  :pattern ((f2 s@$ i@7@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (j@10@00 Int)) (!
  (= (f%limited s@$ i@9@00 j@10@00) (f s@$ i@9@00 j@10@00))
  :pattern ((f s@$ i@9@00 j@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (j@10@00 Int)) (!
  (f%stateless i@9@00 j@10@00)
  :pattern ((f%limited s@$ i@9@00 j@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (j@10@00 Int)) (!
  (=>
    (f%precondition s@$ i@9@00 j@10@00)
    (= (f s@$ i@9@00 j@10@00) (+ i@9@00 j@10@00)))
  :pattern ((f s@$ i@9@00 j@10@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (j@10@00 Int)) (!
  true
  :pattern ((f s@$ i@9@00 j@10@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (i@12@00 Int)) (!
  (= (reqIGt0%limited s@$ i@12@00) (reqIGt0 s@$ i@12@00))
  :pattern ((reqIGt0 s@$ i@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@12@00 Int)) (!
  (reqIGt0%stateless i@12@00)
  :pattern ((reqIGt0%limited s@$ i@12@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (i@12@00 Int)) (!
  (=> (reqIGt0%precondition s@$ i@12@00) (= (reqIGt0 s@$ i@12@00) i@12@00))
  :pattern ((reqIGt0 s@$ i@12@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@12@00 Int)) (!
  true
  :pattern ((reqIGt0 s@$ i@12@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- forallCellGet10 ----------
(declare-const c@0@01 $Ref)
(declare-const d@1@01 $Ref)
(declare-const c@2@01 $Ref)
(declare-const d@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] c != null
(assert (not (= c@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall i1: Int ::0 <= i1 && i1 < Cell_get(c) ==> Cell_get(c) > i1)
(declare-const i1@5@01 Int)
(push) ; 2
; [eval] 0 <= i1 && i1 < Cell_get(c) ==> Cell_get(c) > i1
; [eval] 0 <= i1 && i1 < Cell_get(c)
; [eval] 0 <= i1
(push) ; 3
; [then-branch: 0 | !(0 <= i1@5@01) | live]
; [else-branch: 0 | 0 <= i1@5@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i1@5@01)]
(assert (not (<= 0 i1@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i1@5@01]
(assert (<= 0 i1@5@01))
; [eval] i1 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 5
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i1@5@01)
  (and
    (<= 0 i1@5@01)
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
(assert (or (<= 0 i1@5@01) (not (<= 0 i1@5@01))))
(push) ; 3
; [then-branch: 1 | 0 <= i1@5@01 && i1@5@01 < Cell_get(First:(Second:($t@4@01)), c@2@01) | live]
; [else-branch: 1 | !(0 <= i1@5@01 && i1@5@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)) | live]
(push) ; 4
; [then-branch: 1 | 0 <= i1@5@01 && i1@5@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)]
(assert (and
  (<= 0 i1@5@01)
  (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; [eval] Cell_get(c) > i1
; [eval] Cell_get(c)
(push) ; 5
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(0 <= i1@5@01 && i1@5@01 < Cell_get(First:(Second:($t@4@01)), c@2@01))]
(assert (not
  (and
    (<= 0 i1@5@01)
    (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i1@5@01)
    (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
  (and
    (<= 0 i1@5@01)
    (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i1@5@01)
      (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
  (and
    (<= 0 i1@5@01)
    (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@5@01 Int)) (!
  (=>
    (and
      (<= 0 i1@5@01)
      (< i1@5@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
    (> (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01) i1@5@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@21@11@21@81|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) > i2)
(declare-const i2@7@01 Int)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) > i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 2 | !(0 <= i2@7@01) | live]
; [else-branch: 2 | 0 <= i2@7@01 | live]
(push) ; 5
; [then-branch: 2 | !(0 <= i2@7@01)]
(assert (not (<= 0 i2@7@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | 0 <= i2@7@01]
(assert (<= 0 i2@7@01))
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i2@7@01)
  (and (<= 0 i2@7@01) (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))))
(assert (or (<= 0 i2@7@01) (not (<= 0 i2@7@01))))
(push) ; 4
; [then-branch: 3 | 0 <= i2@7@01 && i2@7@01 < Cell_get(First:($t@6@01), c@2@01) | live]
; [else-branch: 3 | !(0 <= i2@7@01 && i2@7@01 < Cell_get(First:($t@6@01), c@2@01)) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i2@7@01 && i2@7@01 < Cell_get(First:($t@6@01), c@2@01)]
(assert (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01))))
; [eval] Cell_get(c) > i2
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i2@7@01 && i2@7@01 < Cell_get(First:($t@6@01), c@2@01))]
(assert (not (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))
  (and
    (<= 0 i2@7@01)
    (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01))
    (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01))))
  (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@7@01 Int)) (!
  (=>
    (and (<= 0 i2@7@01) (< i2@7@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))
    (> (Cell_get ($Snap.first $t@6@01) c@2@01) i2@7@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@23@10@23@80|)))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] (forall i3: Int ::0 <= i3 && i3 < Cell_get(c) ==> Cell_get(c) != i3)
(declare-const i3@8@01 Int)
(push) ; 3
; [eval] 0 <= i3 && i3 < Cell_get(c) ==> Cell_get(c) != i3
; [eval] 0 <= i3 && i3 < Cell_get(c)
; [eval] 0 <= i3
(push) ; 4
; [then-branch: 4 | !(0 <= i3@8@01) | live]
; [else-branch: 4 | 0 <= i3@8@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i3@8@01)]
(assert (not (<= 0 i3@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i3@8@01]
(assert (<= 0 i3@8@01))
; [eval] i3 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i3@8@01)
  (and (<= 0 i3@8@01) (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))))
(assert (or (<= 0 i3@8@01) (not (<= 0 i3@8@01))))
(push) ; 4
; [then-branch: 5 | 0 <= i3@8@01 && i3@8@01 < Cell_get(First:($t@6@01), c@2@01) | live]
; [else-branch: 5 | !(0 <= i3@8@01 && i3@8@01 < Cell_get(First:($t@6@01), c@2@01)) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i3@8@01 && i3@8@01 < Cell_get(First:($t@6@01), c@2@01)]
(assert (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01))))
; [eval] Cell_get(c) != i3
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i3@8@01 && i3@8@01 < Cell_get(First:($t@6@01), c@2@01))]
(assert (not (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))
  (and
    (<= 0 i3@8@01)
    (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01))
    (Cell_get%precondition ($Snap.first $t@6@01) c@2@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01))))
  (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i3@8@01 Int)) (!
  (=>
    (and (<= 0 i3@8@01) (< i3@8@01 (Cell_get ($Snap.first $t@6@01) c@2@01)))
    (not (= (Cell_get ($Snap.first $t@6@01) c@2@01) i3@8@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@24@10@24@81|)))
(pop) ; 2
(push) ; 2
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) > i2)
(declare-const i2@9@01 Int)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) > i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 6 | !(0 <= i2@9@01) | live]
; [else-branch: 6 | 0 <= i2@9@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i2@9@01)]
(assert (not (<= 0 i2@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i2@9@01]
(assert (<= 0 i2@9@01))
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i2@9@01)
  (and
    (<= 0 i2@9@01)
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
(assert (or (<= 0 i2@9@01) (not (<= 0 i2@9@01))))
(push) ; 4
; [then-branch: 7 | 0 <= i2@9@01 && i2@9@01 < Cell_get(First:(Second:($t@4@01)), c@2@01) | live]
; [else-branch: 7 | !(0 <= i2@9@01 && i2@9@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)) | live]
(push) ; 5
; [then-branch: 7 | 0 <= i2@9@01 && i2@9@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)]
(assert (and
  (<= 0 i2@9@01)
  (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; [eval] Cell_get(c) > i2
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(0 <= i2@9@01 && i2@9@01 < Cell_get(First:(Second:($t@4@01)), c@2@01))]
(assert (not
  (and
    (<= 0 i2@9@01)
    (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i2@9@01)
    (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
  (and
    (<= 0 i2@9@01)
    (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@9@01)
      (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
  (and
    (<= 0 i2@9@01)
    (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@9@01 Int)) (!
  (and
    (=>
      (<= 0 i2@9@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
    (=>
      (and
        (<= 0 i2@9@01)
        (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@23@10@23@80_precondition|)))
(push) ; 3
(assert (not (forall ((i2@9@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i2@9@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
        (=>
          (and
            (<= 0 i2@9@01)
            (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
      (and
        (<= 0 i2@9@01)
        (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
    (> (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01) i2@9@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@23@10@23@80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i2@9@01 Int)) (!
  (=>
    (and
      (<= 0 i2@9@01)
      (< i2@9@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
    (> (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01) i2@9@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@23@10@23@80|)))
; [eval] (forall i3: Int ::0 <= i3 && i3 < Cell_get(c) ==> Cell_get(c) != i3)
(declare-const i3@10@01 Int)
(push) ; 3
; [eval] 0 <= i3 && i3 < Cell_get(c) ==> Cell_get(c) != i3
; [eval] 0 <= i3 && i3 < Cell_get(c)
; [eval] 0 <= i3
(push) ; 4
; [then-branch: 8 | !(0 <= i3@10@01) | live]
; [else-branch: 8 | 0 <= i3@10@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= i3@10@01)]
(assert (not (<= 0 i3@10@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= i3@10@01]
(assert (<= 0 i3@10@01))
; [eval] i3 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i3@10@01)
  (and
    (<= 0 i3@10@01)
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
(assert (or (<= 0 i3@10@01) (not (<= 0 i3@10@01))))
(push) ; 4
; [then-branch: 9 | 0 <= i3@10@01 && i3@10@01 < Cell_get(First:(Second:($t@4@01)), c@2@01) | live]
; [else-branch: 9 | !(0 <= i3@10@01 && i3@10@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)) | live]
(push) ; 5
; [then-branch: 9 | 0 <= i3@10@01 && i3@10@01 < Cell_get(First:(Second:($t@4@01)), c@2@01)]
(assert (and
  (<= 0 i3@10@01)
  (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; [eval] Cell_get(c) != i3
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(0 <= i3@10@01 && i3@10@01 < Cell_get(First:(Second:($t@4@01)), c@2@01))]
(assert (not
  (and
    (<= 0 i3@10@01)
    (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i3@10@01)
    (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
  (and
    (<= 0 i3@10@01)
    (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))
    (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i3@10@01)
      (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
  (and
    (<= 0 i3@10@01)
    (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i3@10@01 Int)) (!
  (and
    (=>
      (<= 0 i3@10@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
    (=>
      (and
        (<= 0 i3@10@01)
        (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@24@10@24@81_precondition|)))
(push) ; 3
(assert (not (forall ((i3@10@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i3@10@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01))
        (=>
          (and
            (<= 0 i3@10@01)
            (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
      (and
        (<= 0 i3@10@01)
        (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01))))
    (not (= (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01) i3@10@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@24@10@24@81|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i3@10@01 Int)) (!
  (=>
    (and
      (<= 0 i3@10@01)
      (< i3@10@01 (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01)))
    (not (= (Cell_get ($Snap.first ($Snap.second $t@4@01)) c@2@01) i3@10@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@24@10@24@81|)))
(pop) ; 2
(pop) ; 1
; ---------- fail10ForallCellGet10 ----------
(declare-const c@11@01 $Ref)
(declare-const d@12@01 $Ref)
(declare-const c@13@01 $Ref)
(declare-const d@14@01 $Ref)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] c != null
(assert (not (= c@13@01 $Ref.null)))
(assert (= ($Snap.second $t@15@01) $Snap.unit))
; [eval] (forall i: Int ::0 <= i && i < Cell_get(c) ==> Cell_get(c) > i)
(declare-const i@16@01 Int)
(push) ; 2
; [eval] 0 <= i && i < Cell_get(c) ==> Cell_get(c) > i
; [eval] 0 <= i && i < Cell_get(c)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 10 | !(0 <= i@16@01) | live]
; [else-branch: 10 | 0 <= i@16@01 | live]
(push) ; 4
; [then-branch: 10 | !(0 <= i@16@01)]
(assert (not (<= 0 i@16@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | 0 <= i@16@01]
(assert (<= 0 i@16@01))
; [eval] i < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 5
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fail20ForallCellGet10 ----------
(declare-const c@17@01 $Ref)
(declare-const d@18@01 $Ref)
(declare-const c@19@01 $Ref)
(declare-const d@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] c != null
(assert (not (= c@19@01 $Ref.null)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
; [eval] Cell_get(c) > 0
; [eval] Cell_get(c)
(push) ; 2
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
(pop) ; 2
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
(assert (> (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) 0))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
; [eval] (forall i1: Int ::0 <= i1 && i1 < Cell_get(c) ==> Cell_get(c) >= i1)
(declare-const i1@22@01 Int)
(push) ; 2
; [eval] 0 <= i1 && i1 < Cell_get(c) ==> Cell_get(c) >= i1
; [eval] 0 <= i1 && i1 < Cell_get(c)
; [eval] 0 <= i1
(push) ; 3
; [then-branch: 11 | !(0 <= i1@22@01) | live]
; [else-branch: 11 | 0 <= i1@22@01 | live]
(push) ; 4
; [then-branch: 11 | !(0 <= i1@22@01)]
(assert (not (<= 0 i1@22@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | 0 <= i1@22@01]
(assert (<= 0 i1@22@01))
; [eval] i1 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i1@22@01) (not (<= 0 i1@22@01))))
(push) ; 3
; [then-branch: 12 | 0 <= i1@22@01 && i1@22@01 < Cell_get(First:(Second:($t@21@01)), c@19@01) | live]
; [else-branch: 12 | !(0 <= i1@22@01 && i1@22@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)) | live]
(push) ; 4
; [then-branch: 12 | 0 <= i1@22@01 && i1@22@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)]
(assert (and
  (<= 0 i1@22@01)
  (< i1@22@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
; [eval] Cell_get(c) >= i1
; [eval] Cell_get(c)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(0 <= i1@22@01 && i1@22@01 < Cell_get(First:(Second:($t@21@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i1@22@01)
    (< i1@22@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i1@22@01)
      (< i1@22@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
  (and
    (<= 0 i1@22@01)
    (< i1@22@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@22@01 Int)) (!
  (=>
    (and
      (<= 0 i1@22@01)
      (< i1@22@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
    (>= (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) i1@22@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@37@11@37@82|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
; [eval] c != null
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2)
(declare-const i2@24@01 Int)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 13 | !(0 <= i2@24@01) | live]
; [else-branch: 13 | 0 <= i2@24@01 | live]
(push) ; 5
; [then-branch: 13 | !(0 <= i2@24@01)]
(assert (not (<= 0 i2@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | 0 <= i2@24@01]
(assert (<= 0 i2@24@01))
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i2@24@01)
  (and
    (<= 0 i2@24@01)
    (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))))
(assert (or (<= 0 i2@24@01) (not (<= 0 i2@24@01))))
(push) ; 4
; [then-branch: 14 | 0 <= i2@24@01 && i2@24@01 < Cell_get(First:(Second:($t@23@01)), c@19@01) | live]
; [else-branch: 14 | !(0 <= i2@24@01 && i2@24@01 < Cell_get(First:(Second:($t@23@01)), c@19@01)) | live]
(push) ; 5
; [then-branch: 14 | 0 <= i2@24@01 && i2@24@01 < Cell_get(First:(Second:($t@23@01)), c@19@01)]
(assert (and
  (<= 0 i2@24@01)
  (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01))))
; [eval] Cell_get(c) <= i2
; [eval] Cell_get(c)
(push) ; 6
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))
(pop) ; 6
; Joined path conditions
(assert (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(0 <= i2@24@01 && i2@24@01 < Cell_get(First:(Second:($t@23@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i2@24@01)
    (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i2@24@01)
    (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01)))
  (and
    (<= 0 i2@24@01)
    (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01))
    (Cell_get%precondition ($Snap.first ($Snap.second $t@23@01)) c@19@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@24@01)
      (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01))))
  (and
    (<= 0 i2@24@01)
    (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@24@01 Int)) (!
  (=>
    (and
      (<= 0 i2@24@01)
      (< i2@24@01 (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01)))
    (<= (Cell_get ($Snap.first ($Snap.second $t@23@01)) c@19@01) i2@24@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81|)))
(pop) ; 2
(push) ; 2
; [eval] c != null
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2)
(declare-const i2@25@01 Int)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 15 | !(0 <= i2@25@01) | live]
; [else-branch: 15 | 0 <= i2@25@01 | live]
(push) ; 5
; [then-branch: 15 | !(0 <= i2@25@01)]
(assert (not (<= 0 i2@25@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 0 <= i2@25@01]
(assert (<= 0 i2@25@01))
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i2@25@01) (not (<= 0 i2@25@01))))
(push) ; 4
; [then-branch: 16 | 0 <= i2@25@01 && i2@25@01 < Cell_get(First:(Second:($t@21@01)), c@19@01) | live]
; [else-branch: 16 | !(0 <= i2@25@01 && i2@25@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)) | live]
(push) ; 5
; [then-branch: 16 | 0 <= i2@25@01 && i2@25@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)]
(assert (and
  (<= 0 i2@25@01)
  (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
; [eval] Cell_get(c) <= i2
; [eval] Cell_get(c)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(0 <= i2@25@01 && i2@25@01 < Cell_get(First:(Second:($t@21@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i2@25@01)
    (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@25@01)
      (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
  (and
    (<= 0 i2@25@01)
    (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@25@01 Int)) (!
  (and
    (=>
      (<= 0 i2@25@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
    (=>
      (and
        (<= 0 i2@25@01)
        (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81_precondition|)))
(push) ; 3
(assert (not (forall ((i2@25@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i2@25@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
        (=>
          (and
            (<= 0 i2@25@01)
            (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (and
        (<= 0 i2@25@01)
        (< i2@25@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
    (<= (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) i2@25@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81|))))
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
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2)
(declare-const i2@26@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 17 | !(0 <= i2@26@01) | live]
; [else-branch: 17 | 0 <= i2@26@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i2@26@01)]
(assert (not (<= 0 i2@26@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 17 | 0 <= i2@26@01]
(assert (<= 0 i2@26@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i2@26@01) (not (<= 0 i2@26@01))))
(push) ; 4
; [then-branch: 18 | 0 <= i2@26@01 && i2@26@01 < Cell_get(First:(Second:($t@21@01)), c@19@01) | live]
; [else-branch: 18 | !(0 <= i2@26@01 && i2@26@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)) | live]
(push) ; 5
; [then-branch: 18 | 0 <= i2@26@01 && i2@26@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)]
(assert (and
  (<= 0 i2@26@01)
  (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Cell_get(c) <= i2
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(0 <= i2@26@01 && i2@26@01 < Cell_get(First:(Second:($t@21@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i2@26@01)
    (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@26@01)
      (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
  (and
    (<= 0 i2@26@01)
    (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@26@01 Int)) (!
  (and
    (=>
      (<= 0 i2@26@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
    (=>
      (and
        (<= 0 i2@26@01)
        (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i2@26@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i2@26@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
        (=>
          (and
            (<= 0 i2@26@01)
            (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (and
        (<= 0 i2@26@01)
        (< i2@26@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
    (<= (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) i2@26@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81|))))
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
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2)
(declare-const i2@27@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 19 | !(0 <= i2@27@01) | live]
; [else-branch: 19 | 0 <= i2@27@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= i2@27@01)]
(assert (not (<= 0 i2@27@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 19 | 0 <= i2@27@01]
(assert (<= 0 i2@27@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i2@27@01) (not (<= 0 i2@27@01))))
(push) ; 4
; [then-branch: 20 | 0 <= i2@27@01 && i2@27@01 < Cell_get(First:(Second:($t@21@01)), c@19@01) | live]
; [else-branch: 20 | !(0 <= i2@27@01 && i2@27@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)) | live]
(push) ; 5
; [then-branch: 20 | 0 <= i2@27@01 && i2@27@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)]
(assert (and
  (<= 0 i2@27@01)
  (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Cell_get(c) <= i2
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(0 <= i2@27@01 && i2@27@01 < Cell_get(First:(Second:($t@21@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i2@27@01)
    (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@27@01)
      (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
  (and
    (<= 0 i2@27@01)
    (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@27@01 Int)) (!
  (and
    (=>
      (<= 0 i2@27@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
    (=>
      (and
        (<= 0 i2@27@01)
        (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i2@27@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i2@27@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
        (=>
          (and
            (<= 0 i2@27@01)
            (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (and
        (<= 0 i2@27@01)
        (< i2@27@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
    (<= (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) i2@27@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81|))))
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
; [eval] (forall i2: Int ::0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2)
(declare-const i2@28@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i2 && i2 < Cell_get(c) ==> Cell_get(c) <= i2
; [eval] 0 <= i2 && i2 < Cell_get(c)
; [eval] 0 <= i2
(push) ; 4
; [then-branch: 21 | !(0 <= i2@28@01) | live]
; [else-branch: 21 | 0 <= i2@28@01 | live]
(push) ; 5
; [then-branch: 21 | !(0 <= i2@28@01)]
(assert (not (<= 0 i2@28@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 21 | 0 <= i2@28@01]
(assert (<= 0 i2@28@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i2 < Cell_get(c)
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i2@28@01) (not (<= 0 i2@28@01))))
(push) ; 4
; [then-branch: 22 | 0 <= i2@28@01 && i2@28@01 < Cell_get(First:(Second:($t@21@01)), c@19@01) | live]
; [else-branch: 22 | !(0 <= i2@28@01 && i2@28@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)) | live]
(push) ; 5
; [then-branch: 22 | 0 <= i2@28@01 && i2@28@01 < Cell_get(First:(Second:($t@21@01)), c@19@01)]
(assert (and
  (<= 0 i2@28@01)
  (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Cell_get(c) <= i2
; [eval] Cell_get(c)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(0 <= i2@28@01 && i2@28@01 < Cell_get(First:(Second:($t@21@01)), c@19@01))]
(assert (not
  (and
    (<= 0 i2@28@01)
    (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i2@28@01)
      (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
  (and
    (<= 0 i2@28@01)
    (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i2@28@01 Int)) (!
  (and
    (=>
      (<= 0 i2@28@01)
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
    (=>
      (and
        (<= 0 i2@28@01)
        (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i2@28@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (<= 0 i2@28@01)
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01))
        (=>
          (and
            (<= 0 i2@28@01)
            (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
          (Cell_get%precondition ($Snap.first ($Snap.second $t@21@01)) c@19@01)))
      (and
        (<= 0 i2@28@01)
        (< i2@28@01 (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01))))
    (<= (Cell_get ($Snap.first ($Snap.second $t@21@01)) c@19@01) i2@28@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@41@10@41@81|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- noQuantifiedPermissionsPre ----------
(declare-const s@29@01 Set<$Ref>)
(declare-const s@30@01 Set<$Ref>)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) && r != null ==> r.Cell_x > 0)
(declare-const r@32@01 $Ref)
(push) ; 2
; [eval] (r in s) && r != null ==> r.Cell_x > 0
; [eval] (r in s) && r != null
; [eval] (r in s)
(push) ; 3
; [then-branch: 23 | !(r@32@01 in s@30@01) | live]
; [else-branch: 23 | r@32@01 in s@30@01 | live]
(push) ; 4
; [then-branch: 23 | !(r@32@01 in s@30@01)]
(assert (not (Set_in r@32@01 s@30@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | r@32@01 in s@30@01]
(assert (Set_in r@32@01 s@30@01))
; [eval] r != null
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@32@01 s@30@01) (not (Set_in r@32@01 s@30@01))))
(push) ; 3
; [then-branch: 24 | r@32@01 in s@30@01 && r@32@01 != Null | live]
; [else-branch: 24 | !(r@32@01 in s@30@01 && r@32@01 != Null) | live]
(push) ; 4
; [then-branch: 24 | r@32@01 in s@30@01 && r@32@01 != Null]
(assert (and (Set_in r@32@01 s@30@01) (not (= r@32@01 $Ref.null))))
; [eval] r.Cell_x > 0
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- noQuantifiedPermissionsPost ----------
(declare-const s@33@01 Set<$Ref>)
(declare-const s@34@01 Set<$Ref>)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } { Cell_get(r) } (r in s) && r != null ==> Cell_get(r) >= Cell_get(r))
(declare-const r@36@01 $Ref)
(push) ; 3
; [eval] (r in s) && r != null ==> Cell_get(r) >= Cell_get(r)
; [eval] (r in s) && r != null
; [eval] (r in s)
(push) ; 4
; [then-branch: 25 | !(r@36@01 in s@34@01) | live]
; [else-branch: 25 | r@36@01 in s@34@01 | live]
(push) ; 5
; [then-branch: 25 | !(r@36@01 in s@34@01)]
(assert (not (Set_in r@36@01 s@34@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | r@36@01 in s@34@01]
(assert (Set_in r@36@01 s@34@01))
; [eval] r != null
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r@36@01 s@34@01) (not (Set_in r@36@01 s@34@01))))
(push) ; 4
; [then-branch: 26 | r@36@01 in s@34@01 && r@36@01 != Null | live]
; [else-branch: 26 | !(r@36@01 in s@34@01 && r@36@01 != Null) | live]
(push) ; 5
; [then-branch: 26 | r@36@01 in s@34@01 && r@36@01 != Null]
(assert (and (Set_in r@36@01 s@34@01) (not (= r@36@01 $Ref.null))))
; [eval] Cell_get(r) >= Cell_get(r)
; [eval] Cell_get(r)
(push) ; 6
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- succeedsRange10 ----------
(declare-const a@37@01 Int)
(declare-const a@38@01 Int)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [eval] a > 1
(assert (> a@38@01 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int :: { reqIGt0(i) } 1 <= i ==> reqIGt0(i) == i)
; [eval] (forall i: Int :: { reqIGt0(i) } 1 <= i ==> reqIGt0(i) == i)
(declare-const i@40@01 Int)
(push) ; 3
; [eval] 1 <= i ==> reqIGt0(i) == i
; [eval] 1 <= i
(push) ; 4
; [then-branch: 27 | 1 <= i@40@01 | live]
; [else-branch: 27 | !(1 <= i@40@01) | live]
(push) ; 5
; [then-branch: 27 | 1 <= i@40@01]
(assert (<= 1 i@40@01))
; [eval] reqIGt0(i) == i
; [eval] reqIGt0(i)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@40@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= i@40@01 0))
(assert (reqIGt0%precondition $Snap.unit i@40@01))
(pop) ; 6
; Joined path conditions
(assert (and (>= i@40@01 0) (reqIGt0%precondition $Snap.unit i@40@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | !(1 <= i@40@01)]
(assert (not (<= 1 i@40@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (<= 1 i@40@01)
  (and (<= 1 i@40@01) (>= i@40@01 0) (reqIGt0%precondition $Snap.unit i@40@01))))
; Joined path conditions
(assert (or (not (<= 1 i@40@01)) (<= 1 i@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@40@01 Int)) (!
  (and
    (=>
      (<= 1 i@40@01)
      (and
        (<= 1 i@40@01)
        (>= i@40@01 0)
        (reqIGt0%precondition $Snap.unit i@40@01)))
    (or (not (<= 1 i@40@01)) (<= 1 i@40@01)))
  :pattern ((reqIGt0%limited $Snap.unit i@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@57@9@57@54-aux|)))
(assert (forall ((i@40@01 Int)) (!
  (=> (<= 1 i@40@01) (reqIGt0%precondition $Snap.unit i@40@01))
  :pattern ((reqIGt0%limited $Snap.unit i@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@57@9@57@54_precondition|)))
(push) ; 3
(assert (not (forall ((i@40@01 Int)) (!
  (=>
    (and
      (=> (<= 1 i@40@01) (reqIGt0%precondition $Snap.unit i@40@01))
      (<= 1 i@40@01))
    (= (reqIGt0 $Snap.unit i@40@01) i@40@01))
  :pattern ((reqIGt0%limited $Snap.unit i@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@57@9@57@54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@40@01 Int)) (!
  (=> (<= 1 i@40@01) (= (reqIGt0 $Snap.unit i@40@01) i@40@01))
  :pattern ((reqIGt0%limited $Snap.unit i@40@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@57@9@57@54|)))
(pop) ; 2
(pop) ; 1
; ---------- failsRange10 ----------
(declare-const a@41@01 Int)
(declare-const a@42@01 Int)
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
; assert (forall i: Int ::
;     { reqIGt0(i) }
;     -1 <= i && i < a ==> reqIGt0(i) == i)
; [eval] (forall i: Int :: { reqIGt0(i) } -1 <= i && i < a ==> reqIGt0(i) == i)
(declare-const i@43@01 Int)
(push) ; 3
; [eval] -1 <= i && i < a ==> reqIGt0(i) == i
; [eval] -1 <= i && i < a
; [eval] -1 <= i
; [eval] -1
(push) ; 4
; [then-branch: 28 | !(-1 <= i@43@01) | live]
; [else-branch: 28 | -1 <= i@43@01 | live]
(push) ; 5
; [then-branch: 28 | !(-1 <= i@43@01)]
(assert (not (<= (- 0 1) i@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | -1 <= i@43@01]
(assert (<= (- 0 1) i@43@01))
; [eval] i < a
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= (- 0 1) i@43@01) (not (<= (- 0 1) i@43@01))))
(push) ; 4
; [then-branch: 29 | -1 <= i@43@01 && i@43@01 < a@42@01 | live]
; [else-branch: 29 | !(-1 <= i@43@01 && i@43@01 < a@42@01) | live]
(push) ; 5
; [then-branch: 29 | -1 <= i@43@01 && i@43@01 < a@42@01]
(assert (and (<= (- 0 1) i@43@01) (< i@43@01 a@42@01)))
; [eval] reqIGt0(i) == i
; [eval] reqIGt0(i)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(-1 <= i@43@01 && i@43@01 < a@42@01)]
(assert (not (and (<= (- 0 1) i@43@01) (< i@43@01 a@42@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (<= (- 0 1) i@43@01) (< i@43@01 a@42@01))))
; [eval] reqIGt0(i)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } -1 <= i && i < a ==> reqIGt0(i) == i)
(declare-const i@44@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] -1 <= i && i < a ==> reqIGt0(i) == i
; [eval] -1 <= i && i < a
; [eval] -1 <= i
; [eval] -1
(push) ; 4
; [then-branch: 30 | !(-1 <= i@44@01) | live]
; [else-branch: 30 | -1 <= i@44@01 | live]
(push) ; 5
; [then-branch: 30 | !(-1 <= i@44@01)]
(assert (not (<= (- 0 1) i@44@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 30 | -1 <= i@44@01]
(assert (<= (- 0 1) i@44@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < a
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= (- 0 1) i@44@01) (not (<= (- 0 1) i@44@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | -1 <= i@44@01 && i@44@01 < a@42@01 | live]
; [else-branch: 31 | !(-1 <= i@44@01 && i@44@01 < a@42@01) | live]
(push) ; 5
; [then-branch: 31 | -1 <= i@44@01 && i@44@01 < a@42@01]
(assert (and (<= (- 0 1) i@44@01) (< i@44@01 a@42@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) == i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 31 | !(-1 <= i@44@01 && i@44@01 < a@42@01)]
(assert (not (and (<= (- 0 1) i@44@01) (< i@44@01 a@42@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (<= (- 0 1) i@44@01) (< i@44@01 a@42@01))))
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@44@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } -1 <= i && i < a ==> reqIGt0(i) == i)
(declare-const i@45@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] -1 <= i && i < a ==> reqIGt0(i) == i
; [eval] -1 <= i && i < a
; [eval] -1 <= i
; [eval] -1
(push) ; 4
; [then-branch: 32 | !(-1 <= i@45@01) | live]
; [else-branch: 32 | -1 <= i@45@01 | live]
(push) ; 5
; [then-branch: 32 | !(-1 <= i@45@01)]
(assert (not (<= (- 0 1) i@45@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 32 | -1 <= i@45@01]
(assert (<= (- 0 1) i@45@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < a
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= (- 0 1) i@45@01) (not (<= (- 0 1) i@45@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 33 | -1 <= i@45@01 && i@45@01 < a@42@01 | live]
; [else-branch: 33 | !(-1 <= i@45@01 && i@45@01 < a@42@01) | live]
(push) ; 5
; [then-branch: 33 | -1 <= i@45@01 && i@45@01 < a@42@01]
(assert (and (<= (- 0 1) i@45@01) (< i@45@01 a@42@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) == i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 33 | !(-1 <= i@45@01 && i@45@01 < a@42@01)]
(assert (not (and (<= (- 0 1) i@45@01) (< i@45@01 a@42@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (and (<= (- 0 1) i@45@01) (< i@45@01 a@42@01))))
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@45@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } -1 <= i && i < a ==> reqIGt0(i) == i)
(declare-const i@46@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] -1 <= i && i < a ==> reqIGt0(i) == i
; [eval] -1 <= i && i < a
; [eval] -1 <= i
; [eval] -1
(push) ; 4
; [then-branch: 34 | !(-1 <= i@46@01) | live]
; [else-branch: 34 | -1 <= i@46@01 | live]
(push) ; 5
; [then-branch: 34 | !(-1 <= i@46@01)]
(assert (not (<= (- 0 1) i@46@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 34 | -1 <= i@46@01]
(assert (<= (- 0 1) i@46@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < a
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= (- 0 1) i@46@01) (not (<= (- 0 1) i@46@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | -1 <= i@46@01 && i@46@01 < a@42@01 | live]
; [else-branch: 35 | !(-1 <= i@46@01 && i@46@01 < a@42@01) | live]
(push) ; 5
; [then-branch: 35 | -1 <= i@46@01 && i@46@01 < a@42@01]
(assert (and (<= (- 0 1) i@46@01) (< i@46@01 a@42@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) == i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@46@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@46@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@46@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@46@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- succeedsExplicit10 ----------
(declare-const a@47@01 Int)
(declare-const a@48@01 Int)
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
; assert (forall i: Int, fresh__1: Int ::
;     { (i in Seq(fresh__1, 2, 4, 6, 8)) }
;     (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i * i) > i)
; [eval] (forall i: Int, fresh__1: Int :: { (i in Seq(fresh__1, 2, 4, 6, 8)) } (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i * i) > i)
(declare-const i@49@01 Int)
(declare-const fresh__1@50@01 Int)
(push) ; 3
; [eval] (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i * i) > i
; [eval] (i in Seq(-2, 2, 4, 6, 8))
; [eval] Seq(-2, 2, 4, 6, 8)
; [eval] -2
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(push) ; 4
; [then-branch: 36 | i@49@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8] | live]
; [else-branch: 36 | !(i@49@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]) | live]
(push) ; 5
; [then-branch: 36 | i@49@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]]
(assert (Seq_contains
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
        (Seq_singleton 4))
      (Seq_singleton 6))
    (Seq_singleton 8))
  i@49@01))
; [eval] reqIGt0(i * i) > i
; [eval] reqIGt0(i * i)
; [eval] i * i
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= (* i@49@01 i@49@01) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (* i@49@01 i@49@01) 0))
(assert (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01)))
(pop) ; 6
; Joined path conditions
(assert (and
  (>= (* i@49@01 i@49@01) 0)
  (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | !(i@49@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8])]
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01)
  (and
    (Seq_contains
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
            (Seq_singleton 4))
          (Seq_singleton 6))
        (Seq_singleton 8))
      i@49@01)
    (>= (* i@49@01 i@49@01) 0)
    (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01)))))
; Joined path conditions
(assert (or
  (not
    (Seq_contains
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
            (Seq_singleton 4))
          (Seq_singleton 6))
        (Seq_singleton 8))
      i@49@01))
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01)))
; [eval] (i in Seq(fresh__1, 2, 4, 6, 8))
; [eval] Seq(fresh__1, 2, 4, 6, 8)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@49@01 Int) (fresh__1@50@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8))
        i@49@01)
      (and
        (Seq_contains
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
                (Seq_singleton 4))
              (Seq_singleton 6))
            (Seq_singleton 8))
          i@49@01)
        (>= (* i@49@01 i@49@01) 0)
        (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01))))
    (or
      (not
        (Seq_contains
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
                (Seq_singleton 4))
              (Seq_singleton 6))
            (Seq_singleton 8))
          i@49@01))
      (Seq_contains
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8))
        i@49@01))
    (=
      (Seq_length
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8)))
      5))
  :pattern ((Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@68@10@68@72-aux|)))
(assert (forall ((i@49@01 Int) (fresh__1@50@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8))
        i@49@01)
      (and
        (Seq_contains
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
                (Seq_singleton 4))
              (Seq_singleton 6))
            (Seq_singleton 8))
          i@49@01)
        (>= (* i@49@01 i@49@01) 0)
        (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01))))
    (or
      (not
        (Seq_contains
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
                (Seq_singleton 4))
              (Seq_singleton 6))
            (Seq_singleton 8))
          i@49@01))
      (Seq_contains
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8))
        i@49@01))
    (=
      (Seq_length
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8)))
      5))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@68@10@68@72-aux|)))
(assert (forall ((i@49@01 Int) (fresh__1@50@01 Int)) (!
  (=>
    (Seq_contains
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
            (Seq_singleton 4))
          (Seq_singleton 6))
        (Seq_singleton 8))
      i@49@01)
    (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01)))
  :pattern ((Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@68@10@68@72_precondition|)))
(push) ; 3
(assert (not (forall ((i@49@01 Int) (fresh__1@50@01 Int)) (!
  (=>
    (and
      (=>
        (Seq_contains
          (Seq_append
            (Seq_append
              (Seq_append
                (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
                (Seq_singleton 4))
              (Seq_singleton 6))
            (Seq_singleton 8))
          i@49@01)
        (reqIGt0%precondition $Snap.unit (* i@49@01 i@49@01)))
      (Seq_contains
        (Seq_append
          (Seq_append
            (Seq_append
              (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
              (Seq_singleton 4))
            (Seq_singleton 6))
          (Seq_singleton 8))
        i@49@01))
    (> (reqIGt0 $Snap.unit (* i@49@01 i@49@01)) i@49@01))
  :pattern ((Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@68@10@68@72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (forall ((i@49@01 Int) (fresh__1@50@01 Int)) (!
  (=>
    (Seq_contains
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
            (Seq_singleton 4))
          (Seq_singleton 6))
        (Seq_singleton 8))
      i@49@01)
    (> (reqIGt0 $Snap.unit (* i@49@01 i@49@01)) i@49@01))
  :pattern ((Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :pattern ((Seq_contains_trigger
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton fresh__1@50@01) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@49@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@68@10@68@72|)))
(pop) ; 2
(pop) ; 1
; ---------- failsExplicit10 ----------
(declare-const a@51@01 Int)
(declare-const a@52@01 Int)
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
; assert (forall i: Int ::
;     { reqIGt0(i) }
;     (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i)
; [eval] (forall i: Int :: { reqIGt0(i) } (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i)
(declare-const i@53@01 Int)
(push) ; 3
; [eval] (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i
; [eval] (i in Seq(-2, 2, 4, 6, 8))
; [eval] Seq(-2, 2, 4, 6, 8)
; [eval] -2
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(push) ; 4
; [then-branch: 37 | i@53@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8] | live]
; [else-branch: 37 | !(i@53@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]) | live]
(push) ; 5
; [then-branch: 37 | i@53@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]]
(assert (Seq_contains
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
        (Seq_singleton 4))
      (Seq_singleton 6))
    (Seq_singleton 8))
  i@53@01))
; [eval] reqIGt0(i) < i * i
; [eval] reqIGt0(i)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 37 | !(i@53@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8])]
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@53@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@53@01)))
; [eval] reqIGt0(i)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i)
(declare-const i@54@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i
; [eval] (i in Seq(-2, 2, 4, 6, 8))
; [eval] Seq(-2, 2, 4, 6, 8)
; [eval] -2
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(push) ; 4
; [then-branch: 38 | i@54@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8] | live]
; [else-branch: 38 | !(i@54@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]) | live]
(push) ; 5
; [then-branch: 38 | i@54@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]]
(assert (Seq_contains
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
        (Seq_singleton 4))
      (Seq_singleton 6))
    (Seq_singleton 8))
  i@54@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) < i * i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(i@54@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8])]
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@54@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@54@01)))
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@54@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i)
(declare-const i@55@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i
; [eval] (i in Seq(-2, 2, 4, 6, 8))
; [eval] Seq(-2, 2, 4, 6, 8)
; [eval] -2
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(push) ; 4
; [then-branch: 39 | i@55@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8] | live]
; [else-branch: 39 | !(i@55@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]) | live]
(push) ; 5
; [then-branch: 39 | i@55@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]]
(assert (Seq_contains
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
        (Seq_singleton 4))
      (Seq_singleton 6))
    (Seq_singleton 8))
  i@55@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) < i * i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 39 | !(i@55@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8])]
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@55@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not
  (Seq_contains
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8))
    i@55@01)))
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@55@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall i: Int :: { reqIGt0(i) } (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i)
(declare-const i@56@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in Seq(-2, 2, 4, 6, 8)) ==> reqIGt0(i) < i * i
; [eval] (i in Seq(-2, 2, 4, 6, 8))
; [eval] Seq(-2, 2, 4, 6, 8)
; [eval] -2
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
          (Seq_singleton 4))
        (Seq_singleton 6))
      (Seq_singleton 8)))
  5))
(push) ; 4
; [then-branch: 40 | i@56@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8] | live]
; [else-branch: 40 | !(i@56@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]) | live]
(push) ; 5
; [then-branch: 40 | i@56@01 in [-2] ++ [2] ++ [4] ++ [6] ++ [8]]
(assert (Seq_contains
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append (Seq_singleton (- 0 2)) (Seq_singleton 2))
        (Seq_singleton 4))
      (Seq_singleton 6))
    (Seq_singleton 8))
  i@56@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] reqIGt0(i) < i * i
; [eval] reqIGt0(i)
(set-option :timeout 0)
(push) ; 6
; [eval] i >= 0
(push) ; 7
(assert (not (>= i@56@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@56@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@56@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@56@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- succeeds1 ----------
(declare-const a@57@01 Int)
(declare-const a@58@01 Int)
(push) ; 1
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] a > 0
(assert (> a@58@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i1: Int :: { g(i1) } 0 <= i1 && i1 < a ==> g(i1) >= 0)
; [eval] (forall i1: Int :: { g(i1) } 0 <= i1 && i1 < a ==> g(i1) >= 0)
(declare-const i1@60@01 Int)
(push) ; 3
; [eval] 0 <= i1 && i1 < a ==> g(i1) >= 0
; [eval] 0 <= i1 && i1 < a
; [eval] 0 <= i1
(push) ; 4
; [then-branch: 41 | !(0 <= i1@60@01) | live]
; [else-branch: 41 | 0 <= i1@60@01 | live]
(push) ; 5
; [then-branch: 41 | !(0 <= i1@60@01)]
(assert (not (<= 0 i1@60@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | 0 <= i1@60@01]
(assert (<= 0 i1@60@01))
; [eval] i1 < a
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i1@60@01) (not (<= 0 i1@60@01))))
(push) ; 4
; [then-branch: 42 | 0 <= i1@60@01 && i1@60@01 < a@58@01 | live]
; [else-branch: 42 | !(0 <= i1@60@01 && i1@60@01 < a@58@01) | live]
(push) ; 5
; [then-branch: 42 | 0 <= i1@60@01 && i1@60@01 < a@58@01]
(assert (and (<= 0 i1@60@01) (< i1@60@01 a@58@01)))
; [eval] g(i1) >= 0
; [eval] g(i1)
(push) ; 6
(assert (g%precondition $Snap.unit i1@60@01))
(pop) ; 6
; Joined path conditions
(assert (g%precondition $Snap.unit i1@60@01))
(pop) ; 5
(push) ; 5
; [else-branch: 42 | !(0 <= i1@60@01 && i1@60@01 < a@58@01)]
(assert (not (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))
  (and (<= 0 i1@60@01) (< i1@60@01 a@58@01) (g%precondition $Snap.unit i1@60@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i1@60@01) (< i1@60@01 a@58@01)))
  (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@60@01 Int)) (!
  (and
    (or (<= 0 i1@60@01) (not (<= 0 i1@60@01)))
    (=>
      (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))
      (and
        (<= 0 i1@60@01)
        (< i1@60@01 a@58@01)
        (g%precondition $Snap.unit i1@60@01)))
    (or
      (not (and (<= 0 i1@60@01) (< i1@60@01 a@58@01)))
      (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))))
  :pattern ((g%limited $Snap.unit i1@60@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@85@9@85@61-aux|)))
(assert (forall ((i1@60@01 Int)) (!
  (=>
    (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))
    (g%precondition $Snap.unit i1@60@01))
  :pattern ((g%limited $Snap.unit i1@60@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@85@9@85@61_precondition|)))
(push) ; 3
(assert (not (forall ((i1@60@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 i1@60@01) (< i1@60@01 a@58@01))
        (g%precondition $Snap.unit i1@60@01))
      (and (<= 0 i1@60@01) (< i1@60@01 a@58@01)))
    (>= (g $Snap.unit i1@60@01) 0))
  :pattern ((g%limited $Snap.unit i1@60@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@85@9@85@61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@60@01 Int)) (!
  (=> (and (<= 0 i1@60@01) (< i1@60@01 a@58@01)) (>= (g $Snap.unit i1@60@01) 0))
  :pattern ((g%limited $Snap.unit i1@60@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@85@9@85@61|)))
; [exec]
; assert (exists i2: Int :: { (i2 in Seq(0)) } (i2 in Seq(0)) ==> true)
; [eval] (exists i2: Int :: { (i2 in Seq(0)) } (i2 in Seq(0)) ==> true)
(declare-const i2@61@01 Int)
(push) ; 3
; [eval] (i2 in Seq(0)) ==> true
; [eval] (i2 in Seq(0))
; [eval] Seq(0)
(assert (= (Seq_length (Seq_singleton 0)) 1))
(push) ; 4
; [then-branch: 43 | i2@61@01 in [0] | live]
; [else-branch: 43 | !(i2@61@01 in [0]) | live]
(push) ; 5
; [then-branch: 43 | i2@61@01 in [0]]
(assert (Seq_contains (Seq_singleton 0) i2@61@01))
(pop) ; 5
(push) ; 5
; [else-branch: 43 | !(i2@61@01 in [0])]
(assert (not (Seq_contains (Seq_singleton 0) i2@61@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_singleton 0) i2@61@01))
  (Seq_contains (Seq_singleton 0) i2@61@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (= (Seq_length (Seq_singleton 0)) 1))
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((i2@61@01 Int)) (!
  (or
    (not (Seq_contains (Seq_singleton 0) i2@61@01))
    (Seq_contains (Seq_singleton 0) i2@61@01))
  :pattern ((Seq_contains (Seq_singleton 0) i2@61@01))
  :pattern ((Seq_contains_trigger (Seq_singleton 0) i2@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@87@9@87@50-aux|)))
(assert (exists ((i2@61@01 Int)) (!
  (or
    (not (Seq_contains (Seq_singleton 0) i2@61@01))
    (Seq_contains (Seq_singleton 0) i2@61@01))
  :pattern ((Seq_contains_trigger (Seq_singleton 0) i2@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@87@9@87@50-aux|)))
(pop) ; 2
(pop) ; 1
; ---------- succeeds2 ----------
(declare-const a@62@01 Int)
(declare-const a@63@01 Int)
(push) ; 1
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] a > 0
(assert (> a@63@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int ::(forall j: Int ::
;       { f(i, j) }
;       0 <= i && (i < a && (0 <= j && j < a)) ==> f(i, j) >= 0))
; [eval] (forall i: Int ::(forall j: Int :: { f(i, j) } 0 <= i && (i < a && (0 <= j && j < a)) ==> f(i, j) >= 0))
(declare-const i@65@01 Int)
(push) ; 3
; [eval] (forall j: Int :: { f(i, j) } 0 <= i && (i < a && (0 <= j && j < a)) ==> f(i, j) >= 0)
(declare-const j@66@01 Int)
(push) ; 4
; [eval] 0 <= i && (i < a && (0 <= j && j < a)) ==> f(i, j) >= 0
; [eval] 0 <= i && (i < a && (0 <= j && j < a))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 44 | !(0 <= i@65@01) | live]
; [else-branch: 44 | 0 <= i@65@01 | live]
(push) ; 6
; [then-branch: 44 | !(0 <= i@65@01)]
(assert (not (<= 0 i@65@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 44 | 0 <= i@65@01]
(assert (<= 0 i@65@01))
; [eval] i < a
(push) ; 7
; [then-branch: 45 | !(i@65@01 < a@63@01) | live]
; [else-branch: 45 | i@65@01 < a@63@01 | live]
(push) ; 8
; [then-branch: 45 | !(i@65@01 < a@63@01)]
(assert (not (< i@65@01 a@63@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 45 | i@65@01 < a@63@01]
(assert (< i@65@01 a@63@01))
; [eval] 0 <= j
(push) ; 9
; [then-branch: 46 | !(0 <= j@66@01) | live]
; [else-branch: 46 | 0 <= j@66@01 | live]
(push) ; 10
; [then-branch: 46 | !(0 <= j@66@01)]
(assert (not (<= 0 j@66@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 46 | 0 <= j@66@01]
(assert (<= 0 j@66@01))
; [eval] j < a
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@66@01) (not (<= 0 j@66@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@65@01 a@63@01)
  (and (< i@65@01 a@63@01) (or (<= 0 j@66@01) (not (<= 0 j@66@01))))))
(assert (or (< i@65@01 a@63@01) (not (< i@65@01 a@63@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@65@01)
  (and
    (<= 0 i@65@01)
    (=>
      (< i@65@01 a@63@01)
      (and (< i@65@01 a@63@01) (or (<= 0 j@66@01) (not (<= 0 j@66@01)))))
    (or (< i@65@01 a@63@01) (not (< i@65@01 a@63@01))))))
(assert (or (<= 0 i@65@01) (not (<= 0 i@65@01))))
(push) ; 5
; [then-branch: 47 | 0 <= i@65@01 && i@65@01 < a@63@01 && 0 <= j@66@01 && j@66@01 < a@63@01 | live]
; [else-branch: 47 | !(0 <= i@65@01 && i@65@01 < a@63@01 && 0 <= j@66@01 && j@66@01 < a@63@01) | live]
(push) ; 6
; [then-branch: 47 | 0 <= i@65@01 && i@65@01 < a@63@01 && 0 <= j@66@01 && j@66@01 < a@63@01]
(assert (and
  (<= 0 i@65@01)
  (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01)))))
; [eval] f(i, j) >= 0
; [eval] f(i, j)
(push) ; 7
(assert (f%precondition $Snap.unit i@65@01 j@66@01))
(pop) ; 7
; Joined path conditions
(assert (f%precondition $Snap.unit i@65@01 j@66@01))
(pop) ; 6
(push) ; 6
; [else-branch: 47 | !(0 <= i@65@01 && i@65@01 < a@63@01 && 0 <= j@66@01 && j@66@01 < a@63@01)]
(assert (not
  (and
    (<= 0 i@65@01)
    (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@65@01)
    (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
  (and
    (<= 0 i@65@01)
    (< i@65@01 a@63@01)
    (<= 0 j@66@01)
    (< j@66@01 a@63@01)
    (f%precondition $Snap.unit i@65@01 j@66@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@65@01)
      (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01)))))
  (and
    (<= 0 i@65@01)
    (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (or (<= 0 i@65@01) (not (<= 0 i@65@01))))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@66@01 Int)) (!
  (and
    (=>
      (<= 0 i@65@01)
      (and
        (<= 0 i@65@01)
        (=>
          (< i@65@01 a@63@01)
          (and (< i@65@01 a@63@01) (or (<= 0 j@66@01) (not (<= 0 j@66@01)))))
        (or (< i@65@01 a@63@01) (not (< i@65@01 a@63@01)))))
    (=>
      (and
        (<= 0 i@65@01)
        (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
      (and
        (<= 0 i@65@01)
        (< i@65@01 a@63@01)
        (<= 0 j@66@01)
        (< j@66@01 a@63@01)
        (f%precondition $Snap.unit i@65@01 j@66@01)))
    (or
      (not
        (and
          (<= 0 i@65@01)
          (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01)))))
      (and
        (<= 0 i@65@01)
        (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))))
  :pattern ((f%limited $Snap.unit i@65@01 j@66@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@26@101@56-aux|)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@65@01 Int)) (!
  (forall ((j@66@01 Int)) (!
    (=>
      (and
        (<= 0 i@65@01)
        (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
      (f%precondition $Snap.unit i@65@01 j@66@01))
    :pattern ((f%limited $Snap.unit i@65@01 j@66@01))
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@26@101@56|))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@9@101@56_precondition|)))
(push) ; 3
(assert (not (forall ((i@65@01 Int)) (!
  (=>
    (forall ((j@66@01 Int)) (!
      (=>
        (and
          (<= 0 i@65@01)
          (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
        (f%precondition $Snap.unit i@65@01 j@66@01))
      :pattern ((f%limited $Snap.unit i@65@01 j@66@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@26@101@56|))
    (forall ((j@66@01 Int)) (!
      (=>
        (and
          (<= 0 i@65@01)
          (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
        (>= (f $Snap.unit i@65@01 j@66@01) 0))
      :pattern ((f%limited $Snap.unit i@65@01 j@66@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@26@101@56|)))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@9@101@56|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@65@01 Int)) (!
  (forall ((j@66@01 Int)) (!
    (=>
      (and
        (<= 0 i@65@01)
        (and (< i@65@01 a@63@01) (and (<= 0 j@66@01) (< j@66@01 a@63@01))))
      (>= (f $Snap.unit i@65@01 j@66@01) 0))
    :pattern ((f%limited $Snap.unit i@65@01 j@66@01))
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@26@101@56|))
  
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@100@9@101@56|)))
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const A@67@01 Seq<Int>)
(declare-const A@68@01 Seq<Int>)
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
; inhale |A| > 10
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@68@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall v1: Int ::
;     { f2(v1) }
;     0 <= v1 && (v1 < 3 && f2(v1)) ==>
;     (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 == v1)))
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; [eval] (forall v1: Int :: { f2(v1) } 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 == v1)))
(declare-const v1@71@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 == v1))
; [eval] 0 <= v1 && (v1 < 3 && f2(v1))
; [eval] 0 <= v1
(push) ; 4
; [then-branch: 48 | !(0 <= v1@71@01) | live]
; [else-branch: 48 | 0 <= v1@71@01 | live]
(push) ; 5
; [then-branch: 48 | !(0 <= v1@71@01)]
(assert (not (<= 0 v1@71@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | 0 <= v1@71@01]
(assert (<= 0 v1@71@01))
; [eval] v1 < 3
(push) ; 6
; [then-branch: 49 | !(v1@71@01 < 3) | live]
; [else-branch: 49 | v1@71@01 < 3 | live]
(push) ; 7
; [then-branch: 49 | !(v1@71@01 < 3)]
(assert (not (< v1@71@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 49 | v1@71@01 < 3]
(assert (< v1@71@01 3))
; [eval] f2(v1)
(push) ; 8
(assert (f2%precondition $Snap.unit v1@71@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v1@71@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v1@71@01 3) (and (< v1@71@01 3) (f2%precondition $Snap.unit v1@71@01))))
(assert (or (< v1@71@01 3) (not (< v1@71@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v1@71@01)
  (and
    (<= 0 v1@71@01)
    (=>
      (< v1@71@01 3)
      (and (< v1@71@01 3) (f2%precondition $Snap.unit v1@71@01)))
    (or (< v1@71@01 3) (not (< v1@71@01 3))))))
(assert (or (<= 0 v1@71@01) (not (<= 0 v1@71@01))))
(push) ; 4
; [then-branch: 50 | 0 <= v1@71@01 && v1@71@01 < 3 && f2(_, v1@71@01) | live]
; [else-branch: 50 | !(0 <= v1@71@01 && v1@71@01 < 3 && f2(_, v1@71@01)) | live]
(push) ; 5
; [then-branch: 50 | 0 <= v1@71@01 && v1@71@01 < 3 && f2(_, v1@71@01)]
(assert (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01))))
; [eval] (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 == v1))
(declare-const j1@72@01 Int)
(push) ; 6
; [eval] 0 <= j1 && (j1 < 3 && j1 == v1)
; [eval] 0 <= j1
(push) ; 7
; [then-branch: 51 | !(0 <= j1@72@01) | live]
; [else-branch: 51 | 0 <= j1@72@01 | live]
(push) ; 8
; [then-branch: 51 | !(0 <= j1@72@01)]
(assert (not (<= 0 j1@72@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 51 | 0 <= j1@72@01]
(assert (<= 0 j1@72@01))
; [eval] j1 < 3
(push) ; 9
; [then-branch: 52 | !(j1@72@01 < 3) | live]
; [else-branch: 52 | j1@72@01 < 3 | live]
(push) ; 10
; [then-branch: 52 | !(j1@72@01 < 3)]
(assert (not (< j1@72@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 52 | j1@72@01 < 3]
(assert (< j1@72@01 3))
; [eval] j1 == v1
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j1@72@01 3) (not (< j1@72@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@72@01)
  (and (<= 0 j1@72@01) (or (< j1@72@01 3) (not (< j1@72@01 3))))))
(assert (or (<= 0 j1@72@01) (not (<= 0 j1@72@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(push) ; 5
; [else-branch: 50 | !(0 <= v1@71@01 && v1@71@01 < 3 && f2(_, v1@71@01))]
(assert (not (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))
  (and (<= 0 v1@71@01) (< v1@71@01 3) (f2 $Snap.unit v1@71@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01))))
  (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@71@01 Int)) (!
  (and
    (=>
      (<= 0 v1@71@01)
      (and
        (<= 0 v1@71@01)
        (=>
          (< v1@71@01 3)
          (and (< v1@71@01 3) (f2%precondition $Snap.unit v1@71@01)))
        (or (< v1@71@01 3) (not (< v1@71@01 3)))))
    (or (<= 0 v1@71@01) (not (<= 0 v1@71@01)))
    (=>
      (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))
      (and (<= 0 v1@71@01) (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))
    (or
      (not (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01))))
      (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))))
  :pattern ((f2%limited $Snap.unit v1@71@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@117@9@118@86-aux|)))
(assert (forall ((v1@71@01 Int)) (!
  (=>
    (and (<= 0 v1@71@01) (and (< v1@71@01 3) (f2 $Snap.unit v1@71@01)))
    (exists ((j1@72@01 Int)) (!
      (and (<= 0 j1@72@01) (and (< j1@72@01 3) (= j1@72@01 v1@71@01)))
      
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@118@38@118@85|)))
  :pattern ((f2%limited $Snap.unit v1@71@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@117@9@118@86|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall v2: Int ::
;     { f2(v2) }
;     0 <= v2 && (v2 < 3 && f2(v2)) ==>
;     (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2)))
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2)))
(declare-const v2@73@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 53 | !(0 <= v2@73@01) | live]
; [else-branch: 53 | 0 <= v2@73@01 | live]
(push) ; 5
; [then-branch: 53 | !(0 <= v2@73@01)]
(assert (not (<= 0 v2@73@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 53 | 0 <= v2@73@01]
(assert (<= 0 v2@73@01))
; [eval] v2 < 3
(push) ; 6
; [then-branch: 54 | !(v2@73@01 < 3) | live]
; [else-branch: 54 | v2@73@01 < 3 | live]
(push) ; 7
; [then-branch: 54 | !(v2@73@01 < 3)]
(assert (not (< v2@73@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 54 | v2@73@01 < 3]
(assert (< v2@73@01 3))
; [eval] f2(v2)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@73@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@73@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@73@01 3) (and (< v2@73@01 3) (f2%precondition $Snap.unit v2@73@01))))
(assert (or (< v2@73@01 3) (not (< v2@73@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@73@01)
  (and
    (<= 0 v2@73@01)
    (=>
      (< v2@73@01 3)
      (and (< v2@73@01 3) (f2%precondition $Snap.unit v2@73@01)))
    (or (< v2@73@01 3) (not (< v2@73@01 3))))))
(assert (or (<= 0 v2@73@01) (not (<= 0 v2@73@01))))
(push) ; 4
; [then-branch: 55 | 0 <= v2@73@01 && v2@73@01 < 3 && f2(_, v2@73@01) | live]
; [else-branch: 55 | !(0 <= v2@73@01 && v2@73@01 < 3 && f2(_, v2@73@01)) | live]
(push) ; 5
; [then-branch: 55 | 0 <= v2@73@01 && v2@73@01 < 3 && f2(_, v2@73@01)]
(assert (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01))))
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
(declare-const j2@74@01 Int)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && j2 == v2)
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 56 | !(0 <= j2@74@01) | live]
; [else-branch: 56 | 0 <= j2@74@01 | live]
(push) ; 8
; [then-branch: 56 | !(0 <= j2@74@01)]
(assert (not (<= 0 j2@74@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 56 | 0 <= j2@74@01]
(assert (<= 0 j2@74@01))
; [eval] j2 < 3
(push) ; 9
; [then-branch: 57 | !(j2@74@01 < 3) | live]
; [else-branch: 57 | j2@74@01 < 3 | live]
(push) ; 10
; [then-branch: 57 | !(j2@74@01 < 3)]
(assert (not (< j2@74@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 57 | j2@74@01 < 3]
(assert (< j2@74@01 3))
; [eval] j2 == v2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j2@74@01 3) (not (< j2@74@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@74@01)
  (and (<= 0 j2@74@01) (or (< j2@74@01 3) (not (< j2@74@01 3))))))
(assert (or (<= 0 j2@74@01) (not (<= 0 j2@74@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(push) ; 5
; [else-branch: 55 | !(0 <= v2@73@01 && v2@73@01 < 3 && f2(_, v2@73@01))]
(assert (not (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))
  (and (<= 0 v2@73@01) (< v2@73@01 3) (f2 $Snap.unit v2@73@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01))))
  (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@73@01 Int)) (!
  (and
    (=>
      (<= 0 v2@73@01)
      (and
        (<= 0 v2@73@01)
        (=>
          (< v2@73@01 3)
          (and (< v2@73@01 3) (f2%precondition $Snap.unit v2@73@01)))
        (or (< v2@73@01 3) (not (< v2@73@01 3)))))
    (or (<= 0 v2@73@01) (not (<= 0 v2@73@01)))
    (=>
      (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))
      (and (<= 0 v2@73@01) (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))
    (or
      (not (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01))))
      (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01)))))
  :pattern ((f2%limited $Snap.unit v2@73@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86-aux|)))
(assert (forall ((v2@73@01 Int)) (!
  (=> (and (<= 0 v2@73@01) (< v2@73@01 3)) (f2%precondition $Snap.unit v2@73@01))
  :pattern ((f2%limited $Snap.unit v2@73@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86_precondition|)))
(push) ; 3
(assert (not (forall ((v2@73@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 v2@73@01) (< v2@73@01 3))
        (f2%precondition $Snap.unit v2@73@01))
      (and (<= 0 v2@73@01) (and (< v2@73@01 3) (f2 $Snap.unit v2@73@01))))
    (exists ((j2@74@01 Int)) (!
      (and (<= 0 j2@74@01) (and (< j2@74@01 3) (= j2@74@01 v2@73@01)))
      
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@122@38@122@85|)))
  :pattern ((f2%limited $Snap.unit v2@73@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86|))))
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
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2)))
(declare-const v2@75@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 58 | !(0 <= v2@75@01) | live]
; [else-branch: 58 | 0 <= v2@75@01 | live]
(push) ; 5
; [then-branch: 58 | !(0 <= v2@75@01)]
(assert (not (<= 0 v2@75@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 58 | 0 <= v2@75@01]
(assert (<= 0 v2@75@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 < 3
(set-option :timeout 0)
(push) ; 6
; [then-branch: 59 | !(v2@75@01 < 3) | live]
; [else-branch: 59 | v2@75@01 < 3 | live]
(push) ; 7
; [then-branch: 59 | !(v2@75@01 < 3)]
(assert (not (< v2@75@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 59 | v2@75@01 < 3]
(assert (< v2@75@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f2(v2)
(set-option :timeout 0)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@75@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@75@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@75@01 3) (and (< v2@75@01 3) (f2%precondition $Snap.unit v2@75@01))))
(assert (or (< v2@75@01 3) (not (< v2@75@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@75@01)
  (and
    (<= 0 v2@75@01)
    (=>
      (< v2@75@01 3)
      (and (< v2@75@01 3) (f2%precondition $Snap.unit v2@75@01)))
    (or (< v2@75@01 3) (not (< v2@75@01 3))))))
(assert (or (<= 0 v2@75@01) (not (<= 0 v2@75@01))))
(push) ; 4
; [then-branch: 60 | 0 <= v2@75@01 && v2@75@01 < 3 && f2(_, v2@75@01) | live]
; [else-branch: 60 | !(0 <= v2@75@01 && v2@75@01 < 3 && f2(_, v2@75@01)) | live]
(push) ; 5
; [then-branch: 60 | 0 <= v2@75@01 && v2@75@01 < 3 && f2(_, v2@75@01)]
(assert (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
(declare-const j2@76@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && j2 == v2)
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 61 | !(0 <= j2@76@01) | live]
; [else-branch: 61 | 0 <= j2@76@01 | live]
(push) ; 8
; [then-branch: 61 | !(0 <= j2@76@01)]
(assert (not (<= 0 j2@76@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 61 | 0 <= j2@76@01]
(assert (<= 0 j2@76@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 9
; [then-branch: 62 | !(j2@76@01 < 3) | live]
; [else-branch: 62 | j2@76@01 < 3 | live]
(push) ; 10
; [then-branch: 62 | !(j2@76@01 < 3)]
(assert (not (< j2@76@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 62 | j2@76@01 < 3]
(assert (< j2@76@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 == v2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j2@76@01 3) (not (< j2@76@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@76@01)
  (and (<= 0 j2@76@01) (or (< j2@76@01 3) (not (< j2@76@01 3))))))
(assert (or (<= 0 j2@76@01) (not (<= 0 j2@76@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 60 | !(0 <= v2@75@01 && v2@75@01 < 3 && f2(_, v2@75@01))]
(assert (not (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))
  (and (<= 0 v2@75@01) (< v2@75@01 3) (f2 $Snap.unit v2@75@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01))))
  (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@75@01 Int)) (!
  (and
    (=>
      (<= 0 v2@75@01)
      (and
        (<= 0 v2@75@01)
        (=>
          (< v2@75@01 3)
          (and (< v2@75@01 3) (f2%precondition $Snap.unit v2@75@01)))
        (or (< v2@75@01 3) (not (< v2@75@01 3)))))
    (or (<= 0 v2@75@01) (not (<= 0 v2@75@01)))
    (=>
      (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))
      (and (<= 0 v2@75@01) (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))
    (or
      (not (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01))))
      (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01)))))
  :pattern ((f2%limited $Snap.unit v2@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86-aux|)))
(assert (forall ((v2@75@01 Int)) (!
  (=> (and (<= 0 v2@75@01) (< v2@75@01 3)) (f2%precondition $Snap.unit v2@75@01))
  :pattern ((f2%limited $Snap.unit v2@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((v2@75@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 v2@75@01) (< v2@75@01 3))
        (f2%precondition $Snap.unit v2@75@01))
      (and (<= 0 v2@75@01) (and (< v2@75@01 3) (f2 $Snap.unit v2@75@01))))
    (exists ((j2@76@01 Int)) (!
      (and (<= 0 j2@76@01) (and (< j2@76@01 3) (= j2@76@01 v2@75@01)))
      
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@122@38@122@85|)))
  :pattern ((f2%limited $Snap.unit v2@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86|))))
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
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2)))
(declare-const v2@77@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 63 | !(0 <= v2@77@01) | live]
; [else-branch: 63 | 0 <= v2@77@01 | live]
(push) ; 5
; [then-branch: 63 | !(0 <= v2@77@01)]
(assert (not (<= 0 v2@77@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 63 | 0 <= v2@77@01]
(assert (<= 0 v2@77@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 < 3
(set-option :timeout 0)
(push) ; 6
; [then-branch: 64 | !(v2@77@01 < 3) | live]
; [else-branch: 64 | v2@77@01 < 3 | live]
(push) ; 7
; [then-branch: 64 | !(v2@77@01 < 3)]
(assert (not (< v2@77@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 64 | v2@77@01 < 3]
(assert (< v2@77@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f2(v2)
(set-option :timeout 0)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@77@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@77@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@77@01 3) (and (< v2@77@01 3) (f2%precondition $Snap.unit v2@77@01))))
(assert (or (< v2@77@01 3) (not (< v2@77@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@77@01)
  (and
    (<= 0 v2@77@01)
    (=>
      (< v2@77@01 3)
      (and (< v2@77@01 3) (f2%precondition $Snap.unit v2@77@01)))
    (or (< v2@77@01 3) (not (< v2@77@01 3))))))
(assert (or (<= 0 v2@77@01) (not (<= 0 v2@77@01))))
(push) ; 4
; [then-branch: 65 | 0 <= v2@77@01 && v2@77@01 < 3 && f2(_, v2@77@01) | live]
; [else-branch: 65 | !(0 <= v2@77@01 && v2@77@01 < 3 && f2(_, v2@77@01)) | live]
(push) ; 5
; [then-branch: 65 | 0 <= v2@77@01 && v2@77@01 < 3 && f2(_, v2@77@01)]
(assert (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
(declare-const j2@78@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && j2 == v2)
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 66 | !(0 <= j2@78@01) | live]
; [else-branch: 66 | 0 <= j2@78@01 | live]
(push) ; 8
; [then-branch: 66 | !(0 <= j2@78@01)]
(assert (not (<= 0 j2@78@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 66 | 0 <= j2@78@01]
(assert (<= 0 j2@78@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 9
; [then-branch: 67 | !(j2@78@01 < 3) | live]
; [else-branch: 67 | j2@78@01 < 3 | live]
(push) ; 10
; [then-branch: 67 | !(j2@78@01 < 3)]
(assert (not (< j2@78@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 67 | j2@78@01 < 3]
(assert (< j2@78@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 == v2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j2@78@01 3) (not (< j2@78@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@78@01)
  (and (<= 0 j2@78@01) (or (< j2@78@01 3) (not (< j2@78@01 3))))))
(assert (or (<= 0 j2@78@01) (not (<= 0 j2@78@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 65 | !(0 <= v2@77@01 && v2@77@01 < 3 && f2(_, v2@77@01))]
(assert (not (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))
  (and (<= 0 v2@77@01) (< v2@77@01 3) (f2 $Snap.unit v2@77@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01))))
  (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@77@01 Int)) (!
  (and
    (=>
      (<= 0 v2@77@01)
      (and
        (<= 0 v2@77@01)
        (=>
          (< v2@77@01 3)
          (and (< v2@77@01 3) (f2%precondition $Snap.unit v2@77@01)))
        (or (< v2@77@01 3) (not (< v2@77@01 3)))))
    (or (<= 0 v2@77@01) (not (<= 0 v2@77@01)))
    (=>
      (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))
      (and (<= 0 v2@77@01) (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))
    (or
      (not (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01))))
      (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01)))))
  :pattern ((f2%limited $Snap.unit v2@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86-aux|)))
(assert (forall ((v2@77@01 Int)) (!
  (=> (and (<= 0 v2@77@01) (< v2@77@01 3)) (f2%precondition $Snap.unit v2@77@01))
  :pattern ((f2%limited $Snap.unit v2@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((v2@77@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 v2@77@01) (< v2@77@01 3))
        (f2%precondition $Snap.unit v2@77@01))
      (and (<= 0 v2@77@01) (and (< v2@77@01 3) (f2 $Snap.unit v2@77@01))))
    (exists ((j2@78@01 Int)) (!
      (and (<= 0 j2@78@01) (and (< j2@78@01 3) (= j2@78@01 v2@77@01)))
      
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@122@38@122@85|)))
  :pattern ((f2%limited $Snap.unit v2@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86|))))
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
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2)))
(declare-const v2@79@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 68 | !(0 <= v2@79@01) | live]
; [else-branch: 68 | 0 <= v2@79@01 | live]
(push) ; 5
; [then-branch: 68 | !(0 <= v2@79@01)]
(assert (not (<= 0 v2@79@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 68 | 0 <= v2@79@01]
(assert (<= 0 v2@79@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 < 3
(set-option :timeout 0)
(push) ; 6
; [then-branch: 69 | !(v2@79@01 < 3) | live]
; [else-branch: 69 | v2@79@01 < 3 | live]
(push) ; 7
; [then-branch: 69 | !(v2@79@01 < 3)]
(assert (not (< v2@79@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 69 | v2@79@01 < 3]
(assert (< v2@79@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f2(v2)
(set-option :timeout 0)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@79@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@79@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@79@01 3) (and (< v2@79@01 3) (f2%precondition $Snap.unit v2@79@01))))
(assert (or (< v2@79@01 3) (not (< v2@79@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@79@01)
  (and
    (<= 0 v2@79@01)
    (=>
      (< v2@79@01 3)
      (and (< v2@79@01 3) (f2%precondition $Snap.unit v2@79@01)))
    (or (< v2@79@01 3) (not (< v2@79@01 3))))))
(assert (or (<= 0 v2@79@01) (not (<= 0 v2@79@01))))
(push) ; 4
; [then-branch: 70 | 0 <= v2@79@01 && v2@79@01 < 3 && f2(_, v2@79@01) | live]
; [else-branch: 70 | !(0 <= v2@79@01 && v2@79@01 < 3 && f2(_, v2@79@01)) | live]
(push) ; 5
; [then-branch: 70 | 0 <= v2@79@01 && v2@79@01 < 3 && f2(_, v2@79@01)]
(assert (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 == v2))
(declare-const j2@80@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && j2 == v2)
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 71 | !(0 <= j2@80@01) | live]
; [else-branch: 71 | 0 <= j2@80@01 | live]
(push) ; 8
; [then-branch: 71 | !(0 <= j2@80@01)]
(assert (not (<= 0 j2@80@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 71 | 0 <= j2@80@01]
(assert (<= 0 j2@80@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 9
; [then-branch: 72 | !(j2@80@01 < 3) | live]
; [else-branch: 72 | j2@80@01 < 3 | live]
(push) ; 10
; [then-branch: 72 | !(j2@80@01 < 3)]
(assert (not (< j2@80@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 72 | j2@80@01 < 3]
(assert (< j2@80@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 == v2
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j2@80@01 3) (not (< j2@80@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@80@01)
  (and (<= 0 j2@80@01) (or (< j2@80@01 3) (not (< j2@80@01 3))))))
(assert (or (<= 0 j2@80@01) (not (<= 0 j2@80@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 70 | !(0 <= v2@79@01 && v2@79@01 < 3 && f2(_, v2@79@01))]
(assert (not (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))
  (and (<= 0 v2@79@01) (< v2@79@01 3) (f2 $Snap.unit v2@79@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01))))
  (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@79@01 Int)) (!
  (and
    (=>
      (<= 0 v2@79@01)
      (and
        (<= 0 v2@79@01)
        (=>
          (< v2@79@01 3)
          (and (< v2@79@01 3) (f2%precondition $Snap.unit v2@79@01)))
        (or (< v2@79@01 3) (not (< v2@79@01 3)))))
    (or (<= 0 v2@79@01) (not (<= 0 v2@79@01)))
    (=>
      (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))
      (and (<= 0 v2@79@01) (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))
    (or
      (not (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01))))
      (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01)))))
  :pattern ((f2%limited $Snap.unit v2@79@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86-aux|)))
(assert (forall ((v2@79@01 Int)) (!
  (=> (and (<= 0 v2@79@01) (< v2@79@01 3)) (f2%precondition $Snap.unit v2@79@01))
  :pattern ((f2%limited $Snap.unit v2@79@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((v2@79@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 v2@79@01) (< v2@79@01 3))
        (f2%precondition $Snap.unit v2@79@01))
      (and (<= 0 v2@79@01) (and (< v2@79@01 3) (f2 $Snap.unit v2@79@01))))
    (exists ((j2@80@01 Int)) (!
      (and (<= 0 j2@80@01) (and (< j2@80@01 3) (= j2@80@01 v2@79@01)))
      
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@122@38@122@85|)))
  :pattern ((f2%limited $Snap.unit v2@79@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@121@9@122@86|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const A@81@01 Seq<Int>)
(declare-const A@82@01 Seq<Int>)
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
; inhale |A| > 10
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@82@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall v1: Int ::
;     { f2(v1) }
;     0 <= v1 && (v1 < 3 && f2(v1)) ==>
;     (exists j1: Int :: { g2(j1, v1) } 0 <= j1 && (j1 < 3 && g2(j1, v1))))
(declare-const $t@84@01 $Snap)
(assert (= $t@84@01 $Snap.unit))
; [eval] (forall v1: Int :: { f2(v1) } 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: { g2(j1, v1) } 0 <= j1 && (j1 < 3 && g2(j1, v1))))
(declare-const v1@85@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: { g2(j1, v1) } 0 <= j1 && (j1 < 3 && g2(j1, v1)))
; [eval] 0 <= v1 && (v1 < 3 && f2(v1))
; [eval] 0 <= v1
(push) ; 4
; [then-branch: 73 | !(0 <= v1@85@01) | live]
; [else-branch: 73 | 0 <= v1@85@01 | live]
(push) ; 5
; [then-branch: 73 | !(0 <= v1@85@01)]
(assert (not (<= 0 v1@85@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 73 | 0 <= v1@85@01]
(assert (<= 0 v1@85@01))
; [eval] v1 < 3
(push) ; 6
; [then-branch: 74 | !(v1@85@01 < 3) | live]
; [else-branch: 74 | v1@85@01 < 3 | live]
(push) ; 7
; [then-branch: 74 | !(v1@85@01 < 3)]
(assert (not (< v1@85@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 74 | v1@85@01 < 3]
(assert (< v1@85@01 3))
; [eval] f2(v1)
(push) ; 8
(assert (f2%precondition $Snap.unit v1@85@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v1@85@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v1@85@01 3) (and (< v1@85@01 3) (f2%precondition $Snap.unit v1@85@01))))
(assert (or (< v1@85@01 3) (not (< v1@85@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v1@85@01)
  (and
    (<= 0 v1@85@01)
    (=>
      (< v1@85@01 3)
      (and (< v1@85@01 3) (f2%precondition $Snap.unit v1@85@01)))
    (or (< v1@85@01 3) (not (< v1@85@01 3))))))
(assert (or (<= 0 v1@85@01) (not (<= 0 v1@85@01))))
(push) ; 4
; [then-branch: 75 | 0 <= v1@85@01 && v1@85@01 < 3 && f2(_, v1@85@01) | live]
; [else-branch: 75 | !(0 <= v1@85@01 && v1@85@01 < 3 && f2(_, v1@85@01)) | live]
(push) ; 5
; [then-branch: 75 | 0 <= v1@85@01 && v1@85@01 < 3 && f2(_, v1@85@01)]
(assert (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01))))
; [eval] (exists j1: Int :: { g2(j1, v1) } 0 <= j1 && (j1 < 3 && g2(j1, v1)))
(declare-const j1@86@01 Int)
(push) ; 6
; [eval] 0 <= j1 && (j1 < 3 && g2(j1, v1))
; [eval] 0 <= j1
(push) ; 7
; [then-branch: 76 | !(0 <= j1@86@01) | live]
; [else-branch: 76 | 0 <= j1@86@01 | live]
(push) ; 8
; [then-branch: 76 | !(0 <= j1@86@01)]
(assert (not (<= 0 j1@86@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 76 | 0 <= j1@86@01]
(assert (<= 0 j1@86@01))
; [eval] j1 < 3
(push) ; 9
; [then-branch: 77 | !(j1@86@01 < 3) | live]
; [else-branch: 77 | j1@86@01 < 3 | live]
(push) ; 10
; [then-branch: 77 | !(j1@86@01 < 3)]
(assert (not (< j1@86@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 77 | j1@86@01 < 3]
(assert (< j1@86@01 3))
; [eval] g2(j1, v1)
(push) ; 11
(assert (g2%precondition $Snap.unit j1@86@01 v1@85@01))
(pop) ; 11
; Joined path conditions
(assert (g2%precondition $Snap.unit j1@86@01 v1@85@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j1@86@01 3)
  (and (< j1@86@01 3) (g2%precondition $Snap.unit j1@86@01 v1@85@01))))
(assert (or (< j1@86@01 3) (not (< j1@86@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@86@01)
  (and
    (<= 0 j1@86@01)
    (=>
      (< j1@86@01 3)
      (and (< j1@86@01 3) (g2%precondition $Snap.unit j1@86@01 v1@85@01)))
    (or (< j1@86@01 3) (not (< j1@86@01 3))))))
(assert (or (<= 0 j1@86@01) (not (<= 0 j1@86@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j1@86@01 Int)) (!
  (and
    (=>
      (<= 0 j1@86@01)
      (and
        (<= 0 j1@86@01)
        (=>
          (< j1@86@01 3)
          (and (< j1@86@01 3) (g2%precondition $Snap.unit j1@86@01 v1@85@01)))
        (or (< j1@86@01 3) (not (< j1@86@01 3)))))
    (or (<= 0 j1@86@01) (not (<= 0 j1@86@01))))
  :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87-aux|)))
(assert (forall ((j1@86@01 Int)) (!
  (=>
    (and (<= 0 j1@86@01) (< j1@86@01 3))
    (g2%precondition $Snap.unit j1@86@01 v1@85@01))
  :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87|)))
(pop) ; 5
(push) ; 5
; [else-branch: 75 | !(0 <= v1@85@01 && v1@85@01 < 3 && f2(_, v1@85@01))]
(assert (not (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))
  (and
    (<= 0 v1@85@01)
    (< v1@85@01 3)
    (f2 $Snap.unit v1@85@01)
    (exists ((j1@86@01 Int)) (!
      (and
        (=>
          (<= 0 j1@86@01)
          (and
            (<= 0 j1@86@01)
            (=>
              (< j1@86@01 3)
              (and (< j1@86@01 3) (g2%precondition $Snap.unit j1@86@01 v1@85@01)))
            (or (< j1@86@01 3) (not (< j1@86@01 3)))))
        (or (<= 0 j1@86@01) (not (<= 0 j1@86@01))))
      :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87-aux|))
    (forall ((j1@86@01 Int)) (!
      (=>
        (and (<= 0 j1@86@01) (< j1@86@01 3))
        (g2%precondition $Snap.unit j1@86@01 v1@85@01))
      :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87|)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01))))
  (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@85@01 Int)) (!
  (and
    (=>
      (<= 0 v1@85@01)
      (and
        (<= 0 v1@85@01)
        (=>
          (< v1@85@01 3)
          (and (< v1@85@01 3) (f2%precondition $Snap.unit v1@85@01)))
        (or (< v1@85@01 3) (not (< v1@85@01 3)))))
    (or (<= 0 v1@85@01) (not (<= 0 v1@85@01)))
    (=>
      (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))
      (and
        (<= 0 v1@85@01)
        (< v1@85@01 3)
        (f2 $Snap.unit v1@85@01)
        (exists ((j1@86@01 Int)) (!
          (and
            (=>
              (<= 0 j1@86@01)
              (and
                (<= 0 j1@86@01)
                (=>
                  (< j1@86@01 3)
                  (and
                    (< j1@86@01 3)
                    (g2%precondition $Snap.unit j1@86@01 v1@85@01)))
                (or (< j1@86@01 3) (not (< j1@86@01 3)))))
            (or (<= 0 j1@86@01) (not (<= 0 j1@86@01))))
          :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87-aux|))
        (forall ((j1@86@01 Int)) (!
          (=>
            (and (<= 0 j1@86@01) (< j1@86@01 3))
            (g2%precondition $Snap.unit j1@86@01 v1@85@01))
          :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87|))))
    (or
      (not (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01))))
      (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))))
  :pattern ((f2%limited $Snap.unit v1@85@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@131@9@132@88-aux|)))
(assert (forall ((v1@85@01 Int)) (!
  (=>
    (and (<= 0 v1@85@01) (and (< v1@85@01 3) (f2 $Snap.unit v1@85@01)))
    (exists ((j1@86@01 Int)) (!
      (and
        (<= 0 j1@86@01)
        (and (< j1@86@01 3) (g2 $Snap.unit j1@86@01 v1@85@01)))
      :pattern ((g2%limited $Snap.unit j1@86@01 v1@85@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@132@38@132@87|)))
  :pattern ((f2%limited $Snap.unit v1@85@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@131@9@132@88|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall v2: Int ::
;     { f2(v2) }
;     0 <= v2 && (v2 < 3 && f2(v2)) ==>
;     (exists j2: Int :: { g2(j2, v2) } 0 <= j2 && (j2 < 3 && g2(j2, v2))))
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: { g2(j2, v2) } 0 <= j2 && (j2 < 3 && g2(j2, v2))))
(declare-const v2@87@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: { g2(j2, v2) } 0 <= j2 && (j2 < 3 && g2(j2, v2)))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 78 | !(0 <= v2@87@01) | live]
; [else-branch: 78 | 0 <= v2@87@01 | live]
(push) ; 5
; [then-branch: 78 | !(0 <= v2@87@01)]
(assert (not (<= 0 v2@87@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 78 | 0 <= v2@87@01]
(assert (<= 0 v2@87@01))
; [eval] v2 < 3
(push) ; 6
; [then-branch: 79 | !(v2@87@01 < 3) | live]
; [else-branch: 79 | v2@87@01 < 3 | live]
(push) ; 7
; [then-branch: 79 | !(v2@87@01 < 3)]
(assert (not (< v2@87@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 79 | v2@87@01 < 3]
(assert (< v2@87@01 3))
; [eval] f2(v2)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@87@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@87@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@87@01 3) (and (< v2@87@01 3) (f2%precondition $Snap.unit v2@87@01))))
(assert (or (< v2@87@01 3) (not (< v2@87@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@87@01)
  (and
    (<= 0 v2@87@01)
    (=>
      (< v2@87@01 3)
      (and (< v2@87@01 3) (f2%precondition $Snap.unit v2@87@01)))
    (or (< v2@87@01 3) (not (< v2@87@01 3))))))
(assert (or (<= 0 v2@87@01) (not (<= 0 v2@87@01))))
(push) ; 4
; [then-branch: 80 | 0 <= v2@87@01 && v2@87@01 < 3 && f2(_, v2@87@01) | live]
; [else-branch: 80 | !(0 <= v2@87@01 && v2@87@01 < 3 && f2(_, v2@87@01)) | live]
(push) ; 5
; [then-branch: 80 | 0 <= v2@87@01 && v2@87@01 < 3 && f2(_, v2@87@01)]
(assert (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01))))
; [eval] (exists j2: Int :: { g2(j2, v2) } 0 <= j2 && (j2 < 3 && g2(j2, v2)))
(declare-const j2@88@01 Int)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && g2(j2, v2))
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 81 | !(0 <= j2@88@01) | live]
; [else-branch: 81 | 0 <= j2@88@01 | live]
(push) ; 8
; [then-branch: 81 | !(0 <= j2@88@01)]
(assert (not (<= 0 j2@88@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 81 | 0 <= j2@88@01]
(assert (<= 0 j2@88@01))
; [eval] j2 < 3
(push) ; 9
; [then-branch: 82 | !(j2@88@01 < 3) | live]
; [else-branch: 82 | j2@88@01 < 3 | live]
(push) ; 10
; [then-branch: 82 | !(j2@88@01 < 3)]
(assert (not (< j2@88@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 82 | j2@88@01 < 3]
(assert (< j2@88@01 3))
; [eval] g2(j2, v2)
(push) ; 11
(assert (g2%precondition $Snap.unit j2@88@01 v2@87@01))
(pop) ; 11
; Joined path conditions
(assert (g2%precondition $Snap.unit j2@88@01 v2@87@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j2@88@01 3)
  (and (< j2@88@01 3) (g2%precondition $Snap.unit j2@88@01 v2@87@01))))
(assert (or (< j2@88@01 3) (not (< j2@88@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@88@01)
  (and
    (<= 0 j2@88@01)
    (=>
      (< j2@88@01 3)
      (and (< j2@88@01 3) (g2%precondition $Snap.unit j2@88@01 v2@87@01)))
    (or (< j2@88@01 3) (not (< j2@88@01 3))))))
(assert (or (<= 0 j2@88@01) (not (<= 0 j2@88@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j2@88@01 Int)) (!
  (and
    (=>
      (<= 0 j2@88@01)
      (and
        (<= 0 j2@88@01)
        (=>
          (< j2@88@01 3)
          (and (< j2@88@01 3) (g2%precondition $Snap.unit j2@88@01 v2@87@01)))
        (or (< j2@88@01 3) (not (< j2@88@01 3)))))
    (or (<= 0 j2@88@01) (not (<= 0 j2@88@01))))
  :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87-aux|)))
(assert (forall ((j2@88@01 Int)) (!
  (=>
    (and (<= 0 j2@88@01) (< j2@88@01 3))
    (g2%precondition $Snap.unit j2@88@01 v2@87@01))
  :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|)))
(pop) ; 5
(push) ; 5
; [else-branch: 80 | !(0 <= v2@87@01 && v2@87@01 < 3 && f2(_, v2@87@01))]
(assert (not (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))
  (and
    (<= 0 v2@87@01)
    (< v2@87@01 3)
    (f2 $Snap.unit v2@87@01)
    (exists ((j2@88@01 Int)) (!
      (and
        (=>
          (<= 0 j2@88@01)
          (and
            (<= 0 j2@88@01)
            (=>
              (< j2@88@01 3)
              (and (< j2@88@01 3) (g2%precondition $Snap.unit j2@88@01 v2@87@01)))
            (or (< j2@88@01 3) (not (< j2@88@01 3)))))
        (or (<= 0 j2@88@01) (not (<= 0 j2@88@01))))
      :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87-aux|))
    (forall ((j2@88@01 Int)) (!
      (=>
        (and (<= 0 j2@88@01) (< j2@88@01 3))
        (g2%precondition $Snap.unit j2@88@01 v2@87@01))
      :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01))))
  (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@87@01 Int)) (!
  (and
    (=>
      (<= 0 v2@87@01)
      (and
        (<= 0 v2@87@01)
        (=>
          (< v2@87@01 3)
          (and (< v2@87@01 3) (f2%precondition $Snap.unit v2@87@01)))
        (or (< v2@87@01 3) (not (< v2@87@01 3)))))
    (or (<= 0 v2@87@01) (not (<= 0 v2@87@01)))
    (=>
      (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))
      (and
        (<= 0 v2@87@01)
        (< v2@87@01 3)
        (f2 $Snap.unit v2@87@01)
        (exists ((j2@88@01 Int)) (!
          (and
            (=>
              (<= 0 j2@88@01)
              (and
                (<= 0 j2@88@01)
                (=>
                  (< j2@88@01 3)
                  (and
                    (< j2@88@01 3)
                    (g2%precondition $Snap.unit j2@88@01 v2@87@01)))
                (or (< j2@88@01 3) (not (< j2@88@01 3)))))
            (or (<= 0 j2@88@01) (not (<= 0 j2@88@01))))
          :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87-aux|))
        (forall ((j2@88@01 Int)) (!
          (=>
            (and (<= 0 j2@88@01) (< j2@88@01 3))
            (g2%precondition $Snap.unit j2@88@01 v2@87@01))
          :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|))))
    (or
      (not (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01))))
      (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))))
  :pattern ((f2%limited $Snap.unit v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@134@9@135@88-aux|)))
(assert (forall ((v2@87@01 Int)) (!
  (and
    (=>
      (and (<= 0 v2@87@01) (< v2@87@01 3))
      (f2%precondition $Snap.unit v2@87@01))
    (=>
      (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))
      (forall ((j2@88@01 Int)) (!
        (=>
          (and (<= 0 j2@88@01) (< j2@88@01 3))
          (g2%precondition $Snap.unit j2@88@01 v2@87@01))
        :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
        :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|))))
  :pattern ((f2%limited $Snap.unit v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@134@9@135@88_precondition|)))
(push) ; 3
(assert (not (forall ((v2@87@01 Int)) (!
  (=>
    (and
      (and
        (=>
          (and (<= 0 v2@87@01) (< v2@87@01 3))
          (f2%precondition $Snap.unit v2@87@01))
        (=>
          (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))
          (forall ((j2@88@01 Int)) (!
            (=>
              (and (<= 0 j2@88@01) (< j2@88@01 3))
              (g2%precondition $Snap.unit j2@88@01 v2@87@01))
            :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
            :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|))))
      (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01))))
    (exists ((j2@88@01 Int)) (!
      (and
        (<= 0 j2@88@01)
        (and (< j2@88@01 3) (g2 $Snap.unit j2@88@01 v2@87@01)))
      :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|)))
  :pattern ((f2%limited $Snap.unit v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@134@9@135@88|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((v2@87@01 Int)) (!
  (=>
    (and (<= 0 v2@87@01) (and (< v2@87@01 3) (f2 $Snap.unit v2@87@01)))
    (exists ((j2@88@01 Int)) (!
      (and
        (<= 0 j2@88@01)
        (and (< j2@88@01 3) (g2 $Snap.unit j2@88@01 v2@87@01)))
      :pattern ((g2%limited $Snap.unit j2@88@01 v2@87@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@135@38@135@87|)))
  :pattern ((f2%limited $Snap.unit v2@87@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@134@9@135@88|)))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const A@89@01 Seq<Int>)
(declare-const A@90@01 Seq<Int>)
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
; inhale |A| > 10
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@90@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall v1: Int ::
;     { f2(v1) }
;     0 <= v1 && (v1 < 3 && f2(v1)) ==>
;     (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] == v1)))
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 $Snap.unit))
; [eval] (forall v1: Int :: { f2(v1) } 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] == v1)))
(declare-const v1@93@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v1 && (v1 < 3 && f2(v1)) ==> (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] == v1))
; [eval] 0 <= v1 && (v1 < 3 && f2(v1))
; [eval] 0 <= v1
(push) ; 4
; [then-branch: 83 | !(0 <= v1@93@01) | live]
; [else-branch: 83 | 0 <= v1@93@01 | live]
(push) ; 5
; [then-branch: 83 | !(0 <= v1@93@01)]
(assert (not (<= 0 v1@93@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 83 | 0 <= v1@93@01]
(assert (<= 0 v1@93@01))
; [eval] v1 < 3
(push) ; 6
; [then-branch: 84 | !(v1@93@01 < 3) | live]
; [else-branch: 84 | v1@93@01 < 3 | live]
(push) ; 7
; [then-branch: 84 | !(v1@93@01 < 3)]
(assert (not (< v1@93@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 84 | v1@93@01 < 3]
(assert (< v1@93@01 3))
; [eval] f2(v1)
(push) ; 8
(assert (f2%precondition $Snap.unit v1@93@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v1@93@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v1@93@01 3) (and (< v1@93@01 3) (f2%precondition $Snap.unit v1@93@01))))
(assert (or (< v1@93@01 3) (not (< v1@93@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v1@93@01)
  (and
    (<= 0 v1@93@01)
    (=>
      (< v1@93@01 3)
      (and (< v1@93@01 3) (f2%precondition $Snap.unit v1@93@01)))
    (or (< v1@93@01 3) (not (< v1@93@01 3))))))
(assert (or (<= 0 v1@93@01) (not (<= 0 v1@93@01))))
(push) ; 4
; [then-branch: 85 | 0 <= v1@93@01 && v1@93@01 < 3 && f2(_, v1@93@01) | live]
; [else-branch: 85 | !(0 <= v1@93@01 && v1@93@01 < 3 && f2(_, v1@93@01)) | live]
(push) ; 5
; [then-branch: 85 | 0 <= v1@93@01 && v1@93@01 < 3 && f2(_, v1@93@01)]
(assert (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01))))
; [eval] (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] == v1))
(declare-const j1@94@01 Int)
(push) ; 6
; [eval] 0 <= j1 && (j1 < 3 && A[j1] == v1)
; [eval] 0 <= j1
(push) ; 7
; [then-branch: 86 | !(0 <= j1@94@01) | live]
; [else-branch: 86 | 0 <= j1@94@01 | live]
(push) ; 8
; [then-branch: 86 | !(0 <= j1@94@01)]
(assert (not (<= 0 j1@94@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 86 | 0 <= j1@94@01]
(assert (<= 0 j1@94@01))
; [eval] j1 < 3
(push) ; 9
; [then-branch: 87 | !(j1@94@01 < 3) | live]
; [else-branch: 87 | j1@94@01 < 3 | live]
(push) ; 10
; [then-branch: 87 | !(j1@94@01 < 3)]
(assert (not (< j1@94@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 87 | j1@94@01 < 3]
(assert (< j1@94@01 3))
; [eval] A[j1] == v1
; [eval] A[j1]
(push) ; 11
(assert (not (>= j1@94@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (< j1@94@01 (Seq_length A@90@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j1@94@01 3) (not (< j1@94@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@94@01)
  (and (<= 0 j1@94@01) (or (< j1@94@01 3) (not (< j1@94@01 3))))))
(assert (or (<= 0 j1@94@01) (not (<= 0 j1@94@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j1@94@01 Int)) (!
  (and
    (=>
      (<= 0 j1@94@01)
      (and (<= 0 j1@94@01) (or (< j1@94@01 3) (not (< j1@94@01 3)))))
    (or (<= 0 j1@94@01) (not (<= 0 j1@94@01))))
  :pattern ((Seq_index A@90@01 j1@94@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@142@38@142@88-aux|)))
(pop) ; 5
(push) ; 5
; [else-branch: 85 | !(0 <= v1@93@01 && v1@93@01 < 3 && f2(_, v1@93@01))]
(assert (not (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))
  (and
    (<= 0 v1@93@01)
    (< v1@93@01 3)
    (f2 $Snap.unit v1@93@01)
    (exists ((j1@94@01 Int)) (!
      (and
        (=>
          (<= 0 j1@94@01)
          (and (<= 0 j1@94@01) (or (< j1@94@01 3) (not (< j1@94@01 3)))))
        (or (<= 0 j1@94@01) (not (<= 0 j1@94@01))))
      :pattern ((Seq_index A@90@01 j1@94@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@142@38@142@88-aux|)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01))))
  (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v1@93@01 Int)) (!
  (and
    (=>
      (<= 0 v1@93@01)
      (and
        (<= 0 v1@93@01)
        (=>
          (< v1@93@01 3)
          (and (< v1@93@01 3) (f2%precondition $Snap.unit v1@93@01)))
        (or (< v1@93@01 3) (not (< v1@93@01 3)))))
    (or (<= 0 v1@93@01) (not (<= 0 v1@93@01)))
    (=>
      (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))
      (and
        (<= 0 v1@93@01)
        (< v1@93@01 3)
        (f2 $Snap.unit v1@93@01)
        (exists ((j1@94@01 Int)) (!
          (and
            (=>
              (<= 0 j1@94@01)
              (and (<= 0 j1@94@01) (or (< j1@94@01 3) (not (< j1@94@01 3)))))
            (or (<= 0 j1@94@01) (not (<= 0 j1@94@01))))
          :pattern ((Seq_index A@90@01 j1@94@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@142@38@142@88-aux|))))
    (or
      (not (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01))))
      (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))))
  :pattern ((f2%limited $Snap.unit v1@93@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@141@9@142@89-aux|)))
(assert (forall ((v1@93@01 Int)) (!
  (=>
    (and (<= 0 v1@93@01) (and (< v1@93@01 3) (f2 $Snap.unit v1@93@01)))
    (exists ((j1@94@01 Int)) (!
      (and
        (<= 0 j1@94@01)
        (and (< j1@94@01 3) (= (Seq_index A@90@01 j1@94@01) v1@93@01)))
      :pattern ((Seq_index A@90@01 j1@94@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@142@38@142@88|)))
  :pattern ((f2%limited $Snap.unit v1@93@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@141@9@142@89|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall v2: Int ::
;     { f2(v2) }
;     0 <= v2 && (v2 < 3 && f2(v2)) ==>
;     (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] == v2)))
; [eval] (forall v2: Int :: { f2(v2) } 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] == v2)))
(declare-const v2@95@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= v2 && (v2 < 3 && f2(v2)) ==> (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] == v2))
; [eval] 0 <= v2 && (v2 < 3 && f2(v2))
; [eval] 0 <= v2
(push) ; 4
; [then-branch: 88 | !(0 <= v2@95@01) | live]
; [else-branch: 88 | 0 <= v2@95@01 | live]
(push) ; 5
; [then-branch: 88 | !(0 <= v2@95@01)]
(assert (not (<= 0 v2@95@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 88 | 0 <= v2@95@01]
(assert (<= 0 v2@95@01))
; [eval] v2 < 3
(push) ; 6
; [then-branch: 89 | !(v2@95@01 < 3) | live]
; [else-branch: 89 | v2@95@01 < 3 | live]
(push) ; 7
; [then-branch: 89 | !(v2@95@01 < 3)]
(assert (not (< v2@95@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 89 | v2@95@01 < 3]
(assert (< v2@95@01 3))
; [eval] f2(v2)
(push) ; 8
(assert (f2%precondition $Snap.unit v2@95@01))
(pop) ; 8
; Joined path conditions
(assert (f2%precondition $Snap.unit v2@95@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=> (< v2@95@01 3) (and (< v2@95@01 3) (f2%precondition $Snap.unit v2@95@01))))
(assert (or (< v2@95@01 3) (not (< v2@95@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 v2@95@01)
  (and
    (<= 0 v2@95@01)
    (=>
      (< v2@95@01 3)
      (and (< v2@95@01 3) (f2%precondition $Snap.unit v2@95@01)))
    (or (< v2@95@01 3) (not (< v2@95@01 3))))))
(assert (or (<= 0 v2@95@01) (not (<= 0 v2@95@01))))
(push) ; 4
; [then-branch: 90 | 0 <= v2@95@01 && v2@95@01 < 3 && f2(_, v2@95@01) | live]
; [else-branch: 90 | !(0 <= v2@95@01 && v2@95@01 < 3 && f2(_, v2@95@01)) | live]
(push) ; 5
; [then-branch: 90 | 0 <= v2@95@01 && v2@95@01 < 3 && f2(_, v2@95@01)]
(assert (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01))))
; [eval] (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] == v2))
(declare-const j2@96@01 Int)
(push) ; 6
; [eval] 0 <= j2 && (j2 < 3 && A[j2] == v2)
; [eval] 0 <= j2
(push) ; 7
; [then-branch: 91 | !(0 <= j2@96@01) | live]
; [else-branch: 91 | 0 <= j2@96@01 | live]
(push) ; 8
; [then-branch: 91 | !(0 <= j2@96@01)]
(assert (not (<= 0 j2@96@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 91 | 0 <= j2@96@01]
(assert (<= 0 j2@96@01))
; [eval] j2 < 3
(push) ; 9
; [then-branch: 92 | !(j2@96@01 < 3) | live]
; [else-branch: 92 | j2@96@01 < 3 | live]
(push) ; 10
; [then-branch: 92 | !(j2@96@01 < 3)]
(assert (not (< j2@96@01 3)))
(pop) ; 10
(push) ; 10
; [else-branch: 92 | j2@96@01 < 3]
(assert (< j2@96@01 3))
; [eval] A[j2] == v2
; [eval] A[j2]
(push) ; 11
(assert (not (>= j2@96@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (< j2@96@01 (Seq_length A@90@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j2@96@01 3) (not (< j2@96@01 3))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@96@01)
  (and (<= 0 j2@96@01) (or (< j2@96@01 3) (not (< j2@96@01 3))))))
(assert (or (<= 0 j2@96@01) (not (<= 0 j2@96@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j2@96@01 Int)) (!
  (and
    (=>
      (<= 0 j2@96@01)
      (and (<= 0 j2@96@01) (or (< j2@96@01 3) (not (< j2@96@01 3)))))
    (or (<= 0 j2@96@01) (not (<= 0 j2@96@01))))
  :pattern ((Seq_index A@90@01 j2@96@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@145@38@145@88-aux|)))
(pop) ; 5
(push) ; 5
; [else-branch: 90 | !(0 <= v2@95@01 && v2@95@01 < 3 && f2(_, v2@95@01))]
(assert (not (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))
  (and
    (<= 0 v2@95@01)
    (< v2@95@01 3)
    (f2 $Snap.unit v2@95@01)
    (exists ((j2@96@01 Int)) (!
      (and
        (=>
          (<= 0 j2@96@01)
          (and (<= 0 j2@96@01) (or (< j2@96@01 3) (not (< j2@96@01 3)))))
        (or (<= 0 j2@96@01) (not (<= 0 j2@96@01))))
      :pattern ((Seq_index A@90@01 j2@96@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@145@38@145@88-aux|)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01))))
  (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v2@95@01 Int)) (!
  (and
    (=>
      (<= 0 v2@95@01)
      (and
        (<= 0 v2@95@01)
        (=>
          (< v2@95@01 3)
          (and (< v2@95@01 3) (f2%precondition $Snap.unit v2@95@01)))
        (or (< v2@95@01 3) (not (< v2@95@01 3)))))
    (or (<= 0 v2@95@01) (not (<= 0 v2@95@01)))
    (=>
      (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))
      (and
        (<= 0 v2@95@01)
        (< v2@95@01 3)
        (f2 $Snap.unit v2@95@01)
        (exists ((j2@96@01 Int)) (!
          (and
            (=>
              (<= 0 j2@96@01)
              (and (<= 0 j2@96@01) (or (< j2@96@01 3) (not (< j2@96@01 3)))))
            (or (<= 0 j2@96@01) (not (<= 0 j2@96@01))))
          :pattern ((Seq_index A@90@01 j2@96@01))
          :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@145@38@145@88-aux|))))
    (or
      (not (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01))))
      (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))))
  :pattern ((f2%limited $Snap.unit v2@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@144@9@145@89-aux|)))
(assert (forall ((v2@95@01 Int)) (!
  (=> (and (<= 0 v2@95@01) (< v2@95@01 3)) (f2%precondition $Snap.unit v2@95@01))
  :pattern ((f2%limited $Snap.unit v2@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@144@9@145@89_precondition|)))
(push) ; 3
(assert (not (forall ((v2@95@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 v2@95@01) (< v2@95@01 3))
        (f2%precondition $Snap.unit v2@95@01))
      (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01))))
    (exists ((j2@96@01 Int)) (!
      (and
        (<= 0 j2@96@01)
        (and (< j2@96@01 3) (= (Seq_index A@90@01 j2@96@01) v2@95@01)))
      :pattern ((Seq_index A@90@01 j2@96@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@145@38@145@88|)))
  :pattern ((f2%limited $Snap.unit v2@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@144@9@145@89|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((v2@95@01 Int)) (!
  (=>
    (and (<= 0 v2@95@01) (and (< v2@95@01 3) (f2 $Snap.unit v2@95@01)))
    (exists ((j2@96@01 Int)) (!
      (and
        (<= 0 j2@96@01)
        (and (< j2@96@01 3) (= (Seq_index A@90@01 j2@96@01) v2@95@01)))
      :pattern ((Seq_index A@90@01 j2@96@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@145@38@145@88|)))
  :pattern ((f2%limited $Snap.unit v2@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@144@9@145@89|)))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const A@97@01 Seq<Int>)
(declare-const A@98@01 Seq<Int>)
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
; inhale |A| > 10
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@98@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale f2(0) ==> (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 > 0))
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] f2(0) ==> (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 > 0))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(assert (f2%precondition $Snap.unit 0))
(pop) ; 3
; Joined path conditions
(assert (f2%precondition $Snap.unit 0))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (f2 $Snap.unit 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 93 | f2(_, 0) | live]
; [else-branch: 93 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 93 | f2(_, 0)]
(assert (f2 $Snap.unit 0))
; [eval] (exists j1: Int :: 0 <= j1 && (j1 < 3 && j1 > 0))
(declare-const j1@101@01 Int)
(push) ; 5
; [eval] 0 <= j1 && (j1 < 3 && j1 > 0)
; [eval] 0 <= j1
(push) ; 6
; [then-branch: 94 | !(0 <= j1@101@01) | live]
; [else-branch: 94 | 0 <= j1@101@01 | live]
(push) ; 7
; [then-branch: 94 | !(0 <= j1@101@01)]
(assert (not (<= 0 j1@101@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 94 | 0 <= j1@101@01]
(assert (<= 0 j1@101@01))
; [eval] j1 < 3
(push) ; 8
; [then-branch: 95 | !(j1@101@01 < 3) | live]
; [else-branch: 95 | j1@101@01 < 3 | live]
(push) ; 9
; [then-branch: 95 | !(j1@101@01 < 3)]
(assert (not (< j1@101@01 3)))
(pop) ; 9
(push) ; 9
; [else-branch: 95 | j1@101@01 < 3]
(assert (< j1@101@01 3))
; [eval] j1 > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< j1@101@01 3) (not (< j1@101@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@101@01)
  (and (<= 0 j1@101@01) (or (< j1@101@01 3) (not (< j1@101@01 3))))))
(assert (or (<= 0 j1@101@01) (not (<= 0 j1@101@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (f2 $Snap.unit 0))
(assert (=>
  (f2 $Snap.unit 0)
  (exists ((j1@101@01 Int)) (!
    (and (<= 0 j1@101@01) (and (< j1@101@01 3) (> j1@101@01 0)))
    
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@152@20@152@65|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert f2(0) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
; [eval] f2(0) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | f2(_, 0) | live]
; [else-branch: 96 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 96 | f2(_, 0)]
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
(declare-const j2@102@01 Int)
(push) ; 5
; [eval] 0 <= j2 && (j2 < 3 && j2 > 0)
; [eval] 0 <= j2
(push) ; 6
; [then-branch: 97 | !(0 <= j2@102@01) | live]
; [else-branch: 97 | 0 <= j2@102@01 | live]
(push) ; 7
; [then-branch: 97 | !(0 <= j2@102@01)]
(assert (not (<= 0 j2@102@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | 0 <= j2@102@01]
(assert (<= 0 j2@102@01))
; [eval] j2 < 3
(push) ; 8
; [then-branch: 98 | !(j2@102@01 < 3) | live]
; [else-branch: 98 | j2@102@01 < 3 | live]
(push) ; 9
; [then-branch: 98 | !(j2@102@01 < 3)]
(assert (not (< j2@102@01 3)))
(pop) ; 9
(push) ; 9
; [else-branch: 98 | j2@102@01 < 3]
(assert (< j2@102@01 3))
; [eval] j2 > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< j2@102@01 3) (not (< j2@102@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@102@01)
  (and (<= 0 j2@102@01) (or (< j2@102@01 3) (not (< j2@102@01 3))))))
(assert (or (<= 0 j2@102@01) (not (<= 0 j2@102@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=>
  (f2 $Snap.unit 0)
  (exists ((j2@102@01 Int)) (!
    (and (<= 0 j2@102@01) (and (< j2@102@01 3) (> j2@102@01 0)))
    
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@155@20@155@65|)))))
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
; [eval] f2(0) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | f2(_, 0) | live]
; [else-branch: 99 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 99 | f2(_, 0)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
(declare-const j2@103@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= j2 && (j2 < 3 && j2 > 0)
; [eval] 0 <= j2
(push) ; 6
; [then-branch: 100 | !(0 <= j2@103@01) | live]
; [else-branch: 100 | 0 <= j2@103@01 | live]
(push) ; 7
; [then-branch: 100 | !(0 <= j2@103@01)]
(assert (not (<= 0 j2@103@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 100 | 0 <= j2@103@01]
(assert (<= 0 j2@103@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 8
; [then-branch: 101 | !(j2@103@01 < 3) | live]
; [else-branch: 101 | j2@103@01 < 3 | live]
(push) ; 9
; [then-branch: 101 | !(j2@103@01 < 3)]
(assert (not (< j2@103@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 101 | j2@103@01 < 3]
(assert (< j2@103@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< j2@103@01 3) (not (< j2@103@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@103@01)
  (and (<= 0 j2@103@01) (or (< j2@103@01 3) (not (< j2@103@01 3))))))
(assert (or (<= 0 j2@103@01) (not (<= 0 j2@103@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (f2 $Snap.unit 0)
  (exists ((j2@103@01 Int)) (!
    (and (<= 0 j2@103@01) (and (< j2@103@01 3) (> j2@103@01 0)))
    
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@155@20@155@65|)))))
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
; [eval] f2(0) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 102 | f2(_, 0) | live]
; [else-branch: 102 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 102 | f2(_, 0)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
(declare-const j2@104@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= j2 && (j2 < 3 && j2 > 0)
; [eval] 0 <= j2
(push) ; 6
; [then-branch: 103 | !(0 <= j2@104@01) | live]
; [else-branch: 103 | 0 <= j2@104@01 | live]
(push) ; 7
; [then-branch: 103 | !(0 <= j2@104@01)]
(assert (not (<= 0 j2@104@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 103 | 0 <= j2@104@01]
(assert (<= 0 j2@104@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 8
; [then-branch: 104 | !(j2@104@01 < 3) | live]
; [else-branch: 104 | j2@104@01 < 3 | live]
(push) ; 9
; [then-branch: 104 | !(j2@104@01 < 3)]
(assert (not (< j2@104@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 104 | j2@104@01 < 3]
(assert (< j2@104@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< j2@104@01 3) (not (< j2@104@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@104@01)
  (and (<= 0 j2@104@01) (or (< j2@104@01 3) (not (< j2@104@01 3))))))
(assert (or (<= 0 j2@104@01) (not (<= 0 j2@104@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (f2 $Snap.unit 0)
  (exists ((j2@104@01 Int)) (!
    (and (<= 0 j2@104@01) (and (< j2@104@01 3) (> j2@104@01 0)))
    
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@155@20@155@65|)))))
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
; [eval] f2(0) ==> (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 105 | f2(_, 0) | live]
; [else-branch: 105 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 105 | f2(_, 0)]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (exists j2: Int :: 0 <= j2 && (j2 < 3 && j2 > 0))
(declare-const j2@105@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= j2 && (j2 < 3 && j2 > 0)
; [eval] 0 <= j2
(push) ; 6
; [then-branch: 106 | !(0 <= j2@105@01) | live]
; [else-branch: 106 | 0 <= j2@105@01 | live]
(push) ; 7
; [then-branch: 106 | !(0 <= j2@105@01)]
(assert (not (<= 0 j2@105@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 106 | 0 <= j2@105@01]
(assert (<= 0 j2@105@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 < 3
(set-option :timeout 0)
(push) ; 8
; [then-branch: 107 | !(j2@105@01 < 3) | live]
; [else-branch: 107 | j2@105@01 < 3 | live]
(push) ; 9
; [then-branch: 107 | !(j2@105@01 < 3)]
(assert (not (< j2@105@01 3)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 107 | j2@105@01 < 3]
(assert (< j2@105@01 3))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j2 > 0
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< j2@105@01 3) (not (< j2@105@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@105@01)
  (and (<= 0 j2@105@01) (or (< j2@105@01 3) (not (< j2@105@01 3))))))
(assert (or (<= 0 j2@105@01) (not (<= 0 j2@105@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (f2 $Snap.unit 0)
  (exists ((j2@105@01 Int)) (!
    (and (<= 0 j2@105@01) (and (< j2@105@01 3) (> j2@105@01 0)))
    
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@155@20@155@65|)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const A@106@01 Seq<Int>)
(declare-const A@107@01 Seq<Int>)
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
; inhale |A| > 10
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@107@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale f2(0) ==>
;   (exists j1: Int :: { f2(j1) } 0 <= j1 && (j1 < 3 && f2(j1)))
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 $Snap.unit))
; [eval] f2(0) ==> (exists j1: Int :: { f2(j1) } 0 <= j1 && (j1 < 3 && f2(j1)))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(assert (f2%precondition $Snap.unit 0))
(pop) ; 3
; Joined path conditions
(assert (f2%precondition $Snap.unit 0))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (f2 $Snap.unit 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 108 | f2(_, 0) | live]
; [else-branch: 108 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 108 | f2(_, 0)]
(assert (f2 $Snap.unit 0))
; [eval] (exists j1: Int :: { f2(j1) } 0 <= j1 && (j1 < 3 && f2(j1)))
(declare-const j1@110@01 Int)
(push) ; 5
; [eval] 0 <= j1 && (j1 < 3 && f2(j1))
; [eval] 0 <= j1
(push) ; 6
; [then-branch: 109 | !(0 <= j1@110@01) | live]
; [else-branch: 109 | 0 <= j1@110@01 | live]
(push) ; 7
; [then-branch: 109 | !(0 <= j1@110@01)]
(assert (not (<= 0 j1@110@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 109 | 0 <= j1@110@01]
(assert (<= 0 j1@110@01))
; [eval] j1 < 3
(push) ; 8
; [then-branch: 110 | !(j1@110@01 < 3) | live]
; [else-branch: 110 | j1@110@01 < 3 | live]
(push) ; 9
; [then-branch: 110 | !(j1@110@01 < 3)]
(assert (not (< j1@110@01 3)))
(pop) ; 9
(push) ; 9
; [else-branch: 110 | j1@110@01 < 3]
(assert (< j1@110@01 3))
; [eval] f2(j1)
(push) ; 10
(assert (f2%precondition $Snap.unit j1@110@01))
(pop) ; 10
; Joined path conditions
(assert (f2%precondition $Snap.unit j1@110@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=> (< j1@110@01 3) (and (< j1@110@01 3) (f2%precondition $Snap.unit j1@110@01))))
(assert (or (< j1@110@01 3) (not (< j1@110@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@110@01)
  (and
    (<= 0 j1@110@01)
    (=>
      (< j1@110@01 3)
      (and (< j1@110@01 3) (f2%precondition $Snap.unit j1@110@01)))
    (or (< j1@110@01 3) (not (< j1@110@01 3))))))
(assert (or (<= 0 j1@110@01) (not (<= 0 j1@110@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j1@110@01 Int)) (!
  (and
    (=>
      (<= 0 j1@110@01)
      (and
        (<= 0 j1@110@01)
        (=>
          (< j1@110@01 3)
          (and (< j1@110@01 3) (f2%precondition $Snap.unit j1@110@01)))
        (or (< j1@110@01 3) (not (< j1@110@01 3)))))
    (or (<= 0 j1@110@01) (not (<= 0 j1@110@01))))
  :pattern ((f2%limited $Snap.unit j1@110@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@164@20@164@65-aux|)))
(assert (forall ((j1@110@01 Int)) (!
  (=>
    (and (<= 0 j1@110@01) (< j1@110@01 3))
    (f2%precondition $Snap.unit j1@110@01))
  :pattern ((f2%limited $Snap.unit j1@110@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@164@20@164@65|)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (f2 $Snap.unit 0)
  (and
    (f2 $Snap.unit 0)
    (exists ((j1@110@01 Int)) (!
      (and
        (=>
          (<= 0 j1@110@01)
          (and
            (<= 0 j1@110@01)
            (=>
              (< j1@110@01 3)
              (and (< j1@110@01 3) (f2%precondition $Snap.unit j1@110@01)))
            (or (< j1@110@01 3) (not (< j1@110@01 3)))))
        (or (<= 0 j1@110@01) (not (<= 0 j1@110@01))))
      :pattern ((f2%limited $Snap.unit j1@110@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@164@20@164@65-aux|))
    (forall ((j1@110@01 Int)) (!
      (=>
        (and (<= 0 j1@110@01) (< j1@110@01 3))
        (f2%precondition $Snap.unit j1@110@01))
      :pattern ((f2%limited $Snap.unit j1@110@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@164@20@164@65|)))))
(assert (f2 $Snap.unit 0))
(assert (=>
  (f2 $Snap.unit 0)
  (exists ((j1@110@01 Int)) (!
    (and (<= 0 j1@110@01) (and (< j1@110@01 3) (f2 $Snap.unit j1@110@01)))
    :pattern ((f2%limited $Snap.unit j1@110@01))
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@164@20@164@65|))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert f2(0) ==>
;   (exists j2: Int :: { f2(j2) } 0 <= j2 && (j2 < 3 && f2(j2)))
; [eval] f2(0) ==> (exists j2: Int :: { f2(j2) } 0 <= j2 && (j2 < 3 && f2(j2)))
; [eval] f2(0)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (f2 $Snap.unit 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 111 | f2(_, 0) | live]
; [else-branch: 111 | !(f2(_, 0)) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 111 | f2(_, 0)]
; [eval] (exists j2: Int :: { f2(j2) } 0 <= j2 && (j2 < 3 && f2(j2)))
(declare-const j2@111@01 Int)
(push) ; 5
; [eval] 0 <= j2 && (j2 < 3 && f2(j2))
; [eval] 0 <= j2
(push) ; 6
; [then-branch: 112 | !(0 <= j2@111@01) | live]
; [else-branch: 112 | 0 <= j2@111@01 | live]
(push) ; 7
; [then-branch: 112 | !(0 <= j2@111@01)]
(assert (not (<= 0 j2@111@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 112 | 0 <= j2@111@01]
(assert (<= 0 j2@111@01))
; [eval] j2 < 3
(push) ; 8
; [then-branch: 113 | !(j2@111@01 < 3) | live]
; [else-branch: 113 | j2@111@01 < 3 | live]
(push) ; 9
; [then-branch: 113 | !(j2@111@01 < 3)]
(assert (not (< j2@111@01 3)))
(pop) ; 9
(push) ; 9
; [else-branch: 113 | j2@111@01 < 3]
(assert (< j2@111@01 3))
; [eval] f2(j2)
(push) ; 10
(assert (f2%precondition $Snap.unit j2@111@01))
(pop) ; 10
; Joined path conditions
(assert (f2%precondition $Snap.unit j2@111@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=> (< j2@111@01 3) (and (< j2@111@01 3) (f2%precondition $Snap.unit j2@111@01))))
(assert (or (< j2@111@01 3) (not (< j2@111@01 3))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@111@01)
  (and
    (<= 0 j2@111@01)
    (=>
      (< j2@111@01 3)
      (and (< j2@111@01 3) (f2%precondition $Snap.unit j2@111@01)))
    (or (< j2@111@01 3) (not (< j2@111@01 3))))))
(assert (or (<= 0 j2@111@01) (not (<= 0 j2@111@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j2@111@01 Int)) (!
  (and
    (=>
      (<= 0 j2@111@01)
      (and
        (<= 0 j2@111@01)
        (=>
          (< j2@111@01 3)
          (and (< j2@111@01 3) (f2%precondition $Snap.unit j2@111@01)))
        (or (< j2@111@01 3) (not (< j2@111@01 3)))))
    (or (<= 0 j2@111@01) (not (<= 0 j2@111@01))))
  :pattern ((f2%limited $Snap.unit j2@111@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65-aux|)))
(assert (forall ((j2@111@01 Int)) (!
  (=>
    (and (<= 0 j2@111@01) (< j2@111@01 3))
    (f2%precondition $Snap.unit j2@111@01))
  :pattern ((f2%limited $Snap.unit j2@111@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65|)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (f2 $Snap.unit 0)
  (and
    (exists ((j2@111@01 Int)) (!
      (and
        (=>
          (<= 0 j2@111@01)
          (and
            (<= 0 j2@111@01)
            (=>
              (< j2@111@01 3)
              (and (< j2@111@01 3) (f2%precondition $Snap.unit j2@111@01)))
            (or (< j2@111@01 3) (not (< j2@111@01 3)))))
        (or (<= 0 j2@111@01) (not (<= 0 j2@111@01))))
      :pattern ((f2%limited $Snap.unit j2@111@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65-aux|))
    (forall ((j2@111@01 Int)) (!
      (=>
        (and (<= 0 j2@111@01) (< j2@111@01 3))
        (f2%precondition $Snap.unit j2@111@01))
      :pattern ((f2%limited $Snap.unit j2@111@01))
      :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65|)))))
(push) ; 3
(assert (not (=>
  (f2 $Snap.unit 0)
  (exists ((j2@111@01 Int)) (!
    (and (<= 0 j2@111@01) (and (< j2@111@01 3) (f2 $Snap.unit j2@111@01)))
    :pattern ((f2%limited $Snap.unit j2@111@01))
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (f2 $Snap.unit 0)
  (exists ((j2@111@01 Int)) (!
    (and (<= 0 j2@111@01) (and (< j2@111@01 3) (f2 $Snap.unit j2@111@01)))
    :pattern ((f2%limited $Snap.unit j2@111@01))
    :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@165@20@165@65|))))
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const A@112@01 Seq<$Ref>)
(declare-const A@113@01 Seq<$Ref>)
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
; inhale |A| > 10
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 $Snap.unit))
; [eval] |A| > 10
; [eval] |A|
(assert (> (Seq_length A@113@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] != null))
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 $Snap.unit))
; [eval] (exists j1: Int :: { A[j1] } 0 <= j1 && (j1 < 3 && A[j1] != null))
(declare-const j1@116@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j1 && (j1 < 3 && A[j1] != null)
; [eval] 0 <= j1
(push) ; 4
; [then-branch: 114 | !(0 <= j1@116@01) | live]
; [else-branch: 114 | 0 <= j1@116@01 | live]
(push) ; 5
; [then-branch: 114 | !(0 <= j1@116@01)]
(assert (not (<= 0 j1@116@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 114 | 0 <= j1@116@01]
(assert (<= 0 j1@116@01))
; [eval] j1 < 3
(push) ; 6
; [then-branch: 115 | !(j1@116@01 < 3) | live]
; [else-branch: 115 | j1@116@01 < 3 | live]
(push) ; 7
; [then-branch: 115 | !(j1@116@01 < 3)]
(assert (not (< j1@116@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 115 | j1@116@01 < 3]
(assert (< j1@116@01 3))
; [eval] A[j1] != null
; [eval] A[j1]
(push) ; 8
(assert (not (>= j1@116@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< j1@116@01 (Seq_length A@113@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j1@116@01 3) (not (< j1@116@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j1@116@01)
  (and (<= 0 j1@116@01) (or (< j1@116@01 3) (not (< j1@116@01 3))))))
(assert (or (<= 0 j1@116@01) (not (<= 0 j1@116@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j1@116@01 Int)) (!
  (and
    (=>
      (<= 0 j1@116@01)
      (and (<= 0 j1@116@01) (or (< j1@116@01 3) (not (< j1@116@01 3)))))
    (or (<= 0 j1@116@01) (not (<= 0 j1@116@01))))
  :pattern ((Seq_index A@113@01 j1@116@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@171@9@171@61-aux|)))
(assert (exists ((j1@116@01 Int)) (!
  (and
    (<= 0 j1@116@01)
    (and (< j1@116@01 3) (not (= (Seq_index A@113@01 j1@116@01) $Ref.null))))
  :pattern ((Seq_index A@113@01 j1@116@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@171@9@171@61|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] != null))
; [eval] (exists j2: Int :: { A[j2] } 0 <= j2 && (j2 < 3 && A[j2] != null))
(declare-const j2@117@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j2 && (j2 < 3 && A[j2] != null)
; [eval] 0 <= j2
(push) ; 4
; [then-branch: 116 | !(0 <= j2@117@01) | live]
; [else-branch: 116 | 0 <= j2@117@01 | live]
(push) ; 5
; [then-branch: 116 | !(0 <= j2@117@01)]
(assert (not (<= 0 j2@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 116 | 0 <= j2@117@01]
(assert (<= 0 j2@117@01))
; [eval] j2 < 3
(push) ; 6
; [then-branch: 117 | !(j2@117@01 < 3) | live]
; [else-branch: 117 | j2@117@01 < 3 | live]
(push) ; 7
; [then-branch: 117 | !(j2@117@01 < 3)]
(assert (not (< j2@117@01 3)))
(pop) ; 7
(push) ; 7
; [else-branch: 117 | j2@117@01 < 3]
(assert (< j2@117@01 3))
; [eval] A[j2] != null
; [eval] A[j2]
(push) ; 8
(assert (not (>= j2@117@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< j2@117@01 (Seq_length A@113@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (< j2@117@01 3) (not (< j2@117@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j2@117@01)
  (and (<= 0 j2@117@01) (or (< j2@117@01 3) (not (< j2@117@01 3))))))
(assert (or (<= 0 j2@117@01) (not (<= 0 j2@117@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((j2@117@01 Int)) (!
  (and
    (=>
      (<= 0 j2@117@01)
      (and (<= 0 j2@117@01) (or (< j2@117@01 3) (not (< j2@117@01 3)))))
    (or (<= 0 j2@117@01) (not (<= 0 j2@117@01))))
  :pattern ((Seq_index A@113@01 j2@117@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@172@9@172@61-aux|)))
(push) ; 3
(assert (not (exists ((j2@117@01 Int)) (!
  (and
    (<= 0 j2@117@01)
    (and (< j2@117@01 3) (not (= (Seq_index A@113@01 j2@117@01) $Ref.null))))
  :pattern ((Seq_index A@113@01 j2@117@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@172@9@172@61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (exists ((j2@117@01 Int)) (!
  (and
    (<= 0 j2@117@01)
    (and (< j2@117@01 3) (not (= (Seq_index A@113@01 j2@117@01) $Ref.null))))
  :pattern ((Seq_index A@113@01 j2@117@01))
  :qid |prog./silicon/silver/src/test/resources/all/basic/quantifiers.vpr@172@9@172@61|)))
(pop) ; 2
(pop) ; 1
