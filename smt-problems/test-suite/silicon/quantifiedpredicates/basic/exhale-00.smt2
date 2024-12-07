(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/exhale.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $PSF<pred1> 0)
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
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.$SnapToSet<$Snap>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Snap>To$Snap($SortWrappers.$SnapToSet<$Snap> x)))
    :pattern (($SortWrappers.$SnapToSet<$Snap> x))
    :qid |$Snap.Set<$Snap>To$SnapToSet<$Snap>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<pred1>To$Snap ($PSF<pred1>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<pred1> ($Snap) $PSF<pred1>)
(assert (forall ((x $PSF<pred1>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<pred1>($SortWrappers.$PSF<pred1>To$Snap x)))
    :pattern (($SortWrappers.$PSF<pred1>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<pred1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<pred1>To$Snap($SortWrappers.$SnapTo$PSF<pred1> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<pred1> x))
    :qid |$Snap.$PSF<pred1>To$SnapTo$PSF<pred1>|
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
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_skolem_diff (Set<$Snap> Set<$Snap>) $Snap)
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
; /predicate_snap_functions_declarations.smt2 [pred1: Int]
(declare-fun $PSF.domain_pred1 ($PSF<pred1>) Set<$Snap>)
(declare-fun $PSF.lookup_pred1 ($PSF<pred1> $Snap) Int)
(declare-fun $PSF.after_pred1 ($PSF<pred1> $PSF<pred1>) Bool)
(declare-fun $PSF.loc_pred1 (Int $Snap) Bool)
(declare-fun $PSF.perm_pred1 ($PPM $Snap) $Perm)
(declare-const $psfTOP_pred1 $PSF<pred1>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun pred1%trigger ($Snap $Ref) Bool)
(declare-fun pred2%trigger ($Snap $Ref $Perm) Bool)
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
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Snap)) (!
  (not (Set_in o (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in o (as Set_empty  Set<$Snap>)))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Snap))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Snap)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Snap) (o $Snap)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Snap)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (o $Snap)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
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
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Snap)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
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
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
; /predicate_snap_functions_axioms.smt2 [pred1: Int]
(assert (forall ((vs $PSF<pred1>) (ws $PSF<pred1>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_pred1 vs) ($PSF.domain_pred1 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_pred1 vs))
            (= ($PSF.lookup_pred1 vs x) ($PSF.lookup_pred1 ws x)))
          :pattern (($PSF.lookup_pred1 vs x) ($PSF.lookup_pred1 ws x))
          :qid |qp.$PSF<pred1>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<pred1>To$Snap vs)
              ($SortWrappers.$PSF<pred1>To$Snap ws)
              )
    :qid |qp.$PSF<pred1>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_pred1 pm s))
    :pattern (($PSF.perm_pred1 pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_pred1 f s) true)
    :pattern (($PSF.loc_pred1 f s)))))
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
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(x), write)
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap $t@2@01) x@1@01))
; [exec]
; assert x != null
; [eval] x != null
; [exec]
; fold acc(pred1(x), write)
(pop) ; 2
(pop) ; 1
; ---------- test01_qp ----------
(declare-const xs@4@01 Seq<$Ref>)
(declare-const y@5@01 $Ref)
(declare-const xs@6@01 Seq<$Ref>)
(declare-const y@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@6@01 y@7@01))
(declare-const x@9@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@6@01 x@9@01))
(pop) ; 2
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@6@01 x1@9@01)
      (Seq_contains xs@6@01 x2@9@01)
      (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (Seq_contains xs@6@01 x@9@01)
    (and (= (inv@10@01 x@9@01) x@9@01) (img@11@01 x@9@01)))
  :pattern ((Seq_contains xs@6@01 x@9@01))
  :pattern ((Seq_contains_trigger xs@6@01 x@9@01))
  :pattern ((Seq_contains_trigger xs@6@01 x@9@01))
  :pattern ((inv@10@01 x@9@01))
  :pattern ((img@11@01 x@9@01))
  :qid |quant-u-1|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@11@01 a) (Seq_contains xs@6@01 (inv@10@01 a)))
    (= (inv@10@01 a) a))
  :pattern ((inv@10@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@12@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@6@01 x@12@01))
(pop) ; 3
(declare-const $t@13@01 $PSF<pred1>)
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@12@01 $Ref) (x2@12@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@6@01 x1@12@01)
      (Seq_contains xs@6@01 x2@12@01)
      (= x1@12@01 x2@12@01))
    (= x1@12@01 x2@12@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@12@01 $Ref)) (!
  (=>
    (Seq_contains xs@6@01 x@12@01)
    (and (= (inv@14@01 x@12@01) x@12@01) (img@15@01 x@12@01)))
  :pattern ((Seq_contains xs@6@01 x@12@01))
  :pattern ((Seq_contains_trigger xs@6@01 x@12@01))
  :pattern ((Seq_contains_trigger xs@6@01 x@12@01))
  :pattern ((inv@14@01 x@12@01))
  :pattern ((img@15@01 x@12@01))
  :qid |quant-u-3|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@15@01 a) (Seq_contains xs@6@01 (inv@14@01 a)))
    (= (inv@14@01 a) a))
  :pattern ((inv@14@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((a $Ref)) $Perm
  (ite
    (= a y@7@01)
    ($Perm.min
      (ite
        (and (img@11@01 a) (Seq_contains xs@6@01 (inv@10@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@11@01 a) (Seq_contains xs@6@01 (inv@10@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@16@01 a))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@16@01 a) $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@7@01) (= (- $Perm.Write (pTaken@16@01 a)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $PSF<pred1>)
(declare-const s@18@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@11@01 y@7@01) (Seq_contains xs@6@01 (inv@10@01 y@7@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@7@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@17@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@7@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@8@01)) ($SortWrappers.$RefTo$Snap y@7@01))))))
(assert (not (= y@7@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@17@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@7@01))) y@7@01))
; [exec]
; assert y != null
; [eval] y != null
; [exec]
; fold acc(pred1(y), write)
(declare-const sm@19@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@19@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@7@01))
  ($PSF.lookup_pred1 (as sm@17@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@7@01))))
(declare-const x@20@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@6@01 x@20@01))
(pop) ; 3
(declare-fun inv@21@01 ($Ref) $Ref)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@20@01 $Ref) (x2@20@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@6@01 x1@20@01)
      (Seq_contains xs@6@01 x2@20@01)
      (= x1@20@01 x2@20@01))
    (= x1@20@01 x2@20@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@20@01 $Ref)) (!
  (=>
    (Seq_contains xs@6@01 x@20@01)
    (and (= (inv@21@01 x@20@01) x@20@01) (img@22@01 x@20@01)))
  :pattern ((Seq_contains xs@6@01 x@20@01))
  :pattern ((Seq_contains_trigger xs@6@01 x@20@01))
  :pattern ((inv@21@01 x@20@01))
  :pattern ((img@22@01 x@20@01))
  :qid |pred1-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@22@01 a) (Seq_contains xs@6@01 (inv@21@01 a)))
    (= (inv@21@01 a) a))
  :pattern ((inv@21@01 a))
  :qid |pred1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((a $Ref)) $Perm
  (ite
    (and (Seq_contains xs@6@01 (inv@21@01 a)) (img@22@01 a) (= a (inv@21@01 a)))
    ($Perm.min
      (ite
        (and (img@11@01 a) (Seq_contains xs@6@01 (inv@10@01 a)))
        (- $Perm.Write (pTaken@16@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@24@01 ((a $Ref)) $Perm
  (ite
    (and (Seq_contains xs@6@01 (inv@21@01 a)) (img@22@01 a) (= a (inv@21@01 a)))
    ($Perm.min
      (ite (= a y@7@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@23@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@11@01 a) (Seq_contains xs@6@01 (inv@10@01 a)))
        (- $Perm.Write (pTaken@16@01 a))
        $Perm.No)
      (pTaken@23@01 a))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@6@01 (inv@21@01 a)) (img@22@01 a) (= a (inv@21@01 a)))
    (= (- $Perm.Write (pTaken@23@01 a)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@24@01 y@7@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@6@01 (inv@21@01 a)) (img@22@01 a) (= a (inv@21@01 a)))
    (= (- (- $Perm.Write (pTaken@23@01 a)) (pTaken@24@01 a)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@25@01 $PSF<pred1>)
(declare-const s@26@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@26@01 $Snap)) (!
  (and
    (=>
      (Set_in s@26@01 ($PSF.domain_pred1 (as sm@25@01  $PSF<pred1>)))
      (and
        (Seq_contains xs@6@01 (inv@21@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
        (img@22@01 ($SortWrappers.$SnapTo$Ref s@26@01))))
    (=>
      (and
        (Seq_contains xs@6@01 (inv@21@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
        (img@22@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
      (Set_in s@26@01 ($PSF.domain_pred1 (as sm@25@01  $PSF<pred1>)))))
  :pattern ((Set_in s@26@01 ($PSF.domain_pred1 (as sm@25@01  $PSF<pred1>))))
  :qid |qp.psmDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@26@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains xs@6@01 (inv@21@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
        (img@22@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
      (= ($SortWrappers.$SnapTo$Ref s@26@01) y@7@01))
    (and
      (not (= s@26@01 $Snap.unit))
      (=
        ($PSF.lookup_pred1 (as sm@25@01  $PSF<pred1>) s@26@01)
        ($PSF.lookup_pred1 (as sm@19@01  $PSF<pred1>) s@26@01))))
  :pattern (($PSF.lookup_pred1 (as sm@25@01  $PSF<pred1>) s@26@01))
  :pattern (($PSF.lookup_pred1 (as sm@19@01  $PSF<pred1>) s@26@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@26@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains xs@6@01 (inv@21@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
        (img@22@01 ($SortWrappers.$SnapTo$Ref s@26@01)))
      (ite
        (and
          (img@11@01 ($SortWrappers.$SnapTo$Ref s@26@01))
          (Seq_contains xs@6@01 (inv@10@01 ($SortWrappers.$SnapTo$Ref s@26@01))))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@16@01 ($SortWrappers.$SnapTo$Ref s@26@01))))
        false))
    (and
      (not (= s@26@01 $Snap.unit))
      (=
        ($PSF.lookup_pred1 (as sm@25@01  $PSF<pred1>) s@26@01)
        ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@8@01)) s@26@01))))
  :pattern (($PSF.lookup_pred1 (as sm@25@01  $PSF<pred1>) s@26@01))
  :pattern (($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@8@01)) s@26@01))
  :qid |qp.psmValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- test02_qp ----------
(declare-const xs@27@01 Seq<$Ref>)
(declare-const y@28@01 $Ref)
(declare-const xs@29@01 Seq<$Ref>)
(declare-const y@30@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@29@01 y@30@01))
(declare-const x@32@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@29@01 x@32@01))
(pop) ; 2
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@32@01 $Ref) (x2@32@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@29@01 x1@32@01)
      (Seq_contains xs@29@01 x2@32@01)
      (= x1@32@01 x2@32@01))
    (= x1@32@01 x2@32@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@32@01 $Ref)) (!
  (=>
    (Seq_contains xs@29@01 x@32@01)
    (and (= (inv@33@01 x@32@01) x@32@01) (img@34@01 x@32@01)))
  :pattern ((Seq_contains xs@29@01 x@32@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@32@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@32@01))
  :pattern ((inv@33@01 x@32@01))
  :pattern ((img@34@01 x@32@01))
  :qid |quant-u-15|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@34@01 a) (Seq_contains xs@29@01 (inv@33@01 a)))
    (= (inv@33@01 a) a))
  :pattern ((inv@33@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(declare-const x@36@01 $Ref)
(push) ; 3
; [eval] (x in xs) && x != y
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | !(x@36@01 in xs@29@01) | live]
; [else-branch: 0 | x@36@01 in xs@29@01 | live]
(push) ; 5
; [then-branch: 0 | !(x@36@01 in xs@29@01)]
(assert (not (Seq_contains xs@29@01 x@36@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@36@01 in xs@29@01]
(assert (Seq_contains xs@29@01 x@36@01))
; [eval] x != y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@29@01 x@36@01) (not (Seq_contains xs@29@01 x@36@01))))
(assert (and (Seq_contains xs@29@01 x@36@01) (not (= x@36@01 y@30@01))))
(pop) ; 3
(declare-fun inv@37@01 ($Ref) $Ref)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@36@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@29@01 x@36@01) (not (= x@36@01 y@30@01)))
    (or (Seq_contains xs@29@01 x@36@01) (not (Seq_contains xs@29@01 x@36@01))))
  :pattern ((Seq_contains xs@29@01 x@36@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@36@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@36@01))
  :pattern ((inv@37@01 x@36@01))
  :pattern ((img@38@01 x@36@01))
  :qid |pred1-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@36@01 $Ref) (x2@36@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@29@01 x1@36@01) (not (= x1@36@01 y@30@01)))
      (and (Seq_contains xs@29@01 x2@36@01) (not (= x2@36@01 y@30@01)))
      (= x1@36@01 x2@36@01))
    (= x1@36@01 x2@36@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@36@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@29@01 x@36@01) (not (= x@36@01 y@30@01)))
    (and (= (inv@37@01 x@36@01) x@36@01) (img@38@01 x@36@01)))
  :pattern ((Seq_contains xs@29@01 x@36@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@36@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@36@01))
  :pattern ((inv@37@01 x@36@01))
  :pattern ((img@38@01 x@36@01))
  :qid |quant-u-17|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and
      (img@38@01 a)
      (and (Seq_contains xs@29@01 (inv@37@01 a)) (not (= (inv@37@01 a) y@30@01))))
    (= (inv@37@01 a) a))
  :pattern ((inv@37@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@39@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@39@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@35@01))))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((a $Ref)) $Perm
  (ite
    (= a y@30@01)
    ($Perm.min
      (ite
        (and (img@34@01 a) (Seq_contains xs@29@01 (inv@33@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@34@01 a) (Seq_contains xs@29@01 (inv@33@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 a))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@40@01 a) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@30@01) (= (- $Perm.Write (pTaken@40@01 a)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $PSF<pred1>)
(declare-const s@42@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@34@01 y@30@01) (Seq_contains xs@29@01 (inv@33@01 y@30@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@30@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@41@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@31@01)) ($SortWrappers.$RefTo$Snap y@30@01))))))
(assert (not (= y@30@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@41@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))) y@30@01))
; [exec]
; assert y != null
; [eval] y != null
; [exec]
; fold acc(pred1(y), write)
(declare-const sm@43@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@43@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))
  ($PSF.lookup_pred1 (as sm@41@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))))
(declare-const x@44@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && x != y
; [eval] (x in xs)
(push) ; 4
; [then-branch: 1 | !(x@44@01 in xs@29@01) | live]
; [else-branch: 1 | x@44@01 in xs@29@01 | live]
(push) ; 5
; [then-branch: 1 | !(x@44@01 in xs@29@01)]
(assert (not (Seq_contains xs@29@01 x@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | x@44@01 in xs@29@01]
(assert (Seq_contains xs@29@01 x@44@01))
; [eval] x != y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@29@01 x@44@01) (not (Seq_contains xs@29@01 x@44@01))))
(assert (and (Seq_contains xs@29@01 x@44@01) (not (= x@44@01 y@30@01))))
(pop) ; 3
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@44@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@29@01 x@44@01) (not (= x@44@01 y@30@01)))
    (or (Seq_contains xs@29@01 x@44@01) (not (Seq_contains xs@29@01 x@44@01))))
  :pattern ((Seq_contains xs@29@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@44@01))
  :pattern ((inv@45@01 x@44@01))
  :pattern ((img@46@01 x@44@01))
  :qid |pred1-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@44@01 $Ref) (x2@44@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@29@01 x1@44@01) (not (= x1@44@01 y@30@01)))
      (and (Seq_contains xs@29@01 x2@44@01) (not (= x2@44@01 y@30@01)))
      (= x1@44@01 x2@44@01))
    (= x1@44@01 x2@44@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@44@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@29@01 x@44@01) (not (= x@44@01 y@30@01)))
    (and (= (inv@45@01 x@44@01) x@44@01) (img@46@01 x@44@01)))
  :pattern ((Seq_contains xs@29@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@29@01 x@44@01))
  :pattern ((inv@45@01 x@44@01))
  :pattern ((img@46@01 x@44@01))
  :qid |pred1-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and
      (img@46@01 a)
      (and (Seq_contains xs@29@01 (inv@45@01 a)) (not (= (inv@45@01 a) y@30@01))))
    (= (inv@45@01 a) a))
  :pattern ((inv@45@01 a))
  :qid |pred1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((a $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@29@01 (inv@45@01 a)) (not (= (inv@45@01 a) y@30@01)))
      (img@46@01 a)
      (= a (inv@45@01 a)))
    ($Perm.min
      (ite
        (and (img@34@01 a) (Seq_contains xs@29@01 (inv@33@01 a)))
        (- $Perm.Write (pTaken@40@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@48@01 ((a $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@29@01 (inv@45@01 a)) (not (= (inv@45@01 a) y@30@01)))
      (img@46@01 a)
      (= a (inv@45@01 a)))
    ($Perm.min
      (ite (= a y@30@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@47@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@34@01 a) (Seq_contains xs@29@01 (inv@33@01 a)))
        (- $Perm.Write (pTaken@40@01 a))
        $Perm.No)
      (pTaken@47@01 a))
    $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@29@01 (inv@45@01 a)) (not (= (inv@45@01 a) y@30@01)))
      (img@46@01 a)
      (= a (inv@45@01 a)))
    (= (- $Perm.Write (pTaken@47@01 a)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $PSF<pred1>)
(declare-const s@50@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@50@01 $Snap)) (!
  (and
    (=>
      (Set_in s@50@01 ($PSF.domain_pred1 (as sm@49@01  $PSF<pred1>)))
      (and
        (and
          (Seq_contains xs@29@01 (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
          (not (= (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)) y@30@01)))
        (img@46@01 ($SortWrappers.$SnapTo$Ref s@50@01))))
    (=>
      (and
        (and
          (Seq_contains xs@29@01 (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
          (not (= (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)) y@30@01)))
        (img@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
      (Set_in s@50@01 ($PSF.domain_pred1 (as sm@49@01  $PSF<pred1>)))))
  :pattern ((Set_in s@50@01 ($PSF.domain_pred1 (as sm@49@01  $PSF<pred1>))))
  :qid |qp.psmDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@50@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@29@01 (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
          (not (= (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)) y@30@01)))
        (img@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
      (= ($SortWrappers.$SnapTo$Ref s@50@01) y@30@01))
    (and
      (not (= s@50@01 $Snap.unit))
      (=
        ($PSF.lookup_pred1 (as sm@49@01  $PSF<pred1>) s@50@01)
        ($PSF.lookup_pred1 (as sm@43@01  $PSF<pred1>) s@50@01))))
  :pattern (($PSF.lookup_pred1 (as sm@49@01  $PSF<pred1>) s@50@01))
  :pattern (($PSF.lookup_pred1 (as sm@43@01  $PSF<pred1>) s@50@01))
  :qid |qp.psmValDef5|)))
(assert (forall ((s@50@01 $Snap)) (!
  (=>
    (and
      (and
        (and
          (Seq_contains xs@29@01 (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
          (not (= (inv@45@01 ($SortWrappers.$SnapTo$Ref s@50@01)) y@30@01)))
        (img@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
      (ite
        (and
          (img@34@01 ($SortWrappers.$SnapTo$Ref s@50@01))
          (Seq_contains xs@29@01 (inv@33@01 ($SortWrappers.$SnapTo$Ref s@50@01))))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@40@01 ($SortWrappers.$SnapTo$Ref s@50@01))))
        false))
    (and
      (not (= s@50@01 $Snap.unit))
      (=
        ($PSF.lookup_pred1 (as sm@49@01  $PSF<pred1>) s@50@01)
        ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@31@01)) s@50@01))))
  :pattern (($PSF.lookup_pred1 (as sm@49@01  $PSF<pred1>) s@50@01))
  :pattern (($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@31@01)) s@50@01))
  :qid |qp.psmValDef6|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((a $Ref)) $Perm
  (ite
    (= a y@30@01)
    ($Perm.min (ite (= a y@30@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@51@01 y@30@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@30@01) (= (- $Perm.Write (pTaken@51@01 a)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $PSF<pred1>)
(declare-const s@53@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@30@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@52@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01))
    ($PSF.lookup_pred1 (as sm@43@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@30@01)))))
(pop) ; 2
(pop) ; 1
; ---------- test03_qp ----------
(declare-const xs@54@01 Seq<$Ref>)
(declare-const y@55@01 $Ref)
(declare-const xs@56@01 Seq<$Ref>)
(declare-const y@57@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(assert (= ($Snap.first $t@58@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@56@01 y@57@01))
(declare-const x@59@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@56@01 x@59@01))
(pop) ; 2
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@59@01 $Ref) (x2@59@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@56@01 x1@59@01)
      (Seq_contains xs@56@01 x2@59@01)
      (= x1@59@01 x2@59@01))
    (= x1@59@01 x2@59@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@59@01 $Ref)) (!
  (=>
    (Seq_contains xs@56@01 x@59@01)
    (and (= (inv@60@01 x@59@01) x@59@01) (img@61@01 x@59@01)))
  :pattern ((Seq_contains xs@56@01 x@59@01))
  :pattern ((Seq_contains_trigger xs@56@01 x@59@01))
  :pattern ((Seq_contains_trigger xs@56@01 x@59@01))
  :pattern ((inv@60@01 x@59@01))
  :pattern ((img@61@01 x@59@01))
  :qid |quant-u-30|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
    (= (inv@60@01 a) a))
  :pattern ((inv@60@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((a $Ref)) $Perm
  (ite
    (= a y@57@01)
    ($Perm.min
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@62@01 a))
    $Perm.No)
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@62@01 a) $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@57@01) (= (- $Perm.Write (pTaken@62@01 a)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $PSF<pred1>)
(declare-const s@64@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@61@01 y@57@01) (Seq_contains xs@56@01 (inv@60@01 y@57@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@57@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@63@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@58@01)) ($SortWrappers.$RefTo$Snap y@57@01))))))
(assert (not (= y@57@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@63@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))) y@57@01))
; [exec]
; assert y != null
; [eval] y != null
; [exec]
; fold acc(pred1(y), write)
(declare-const sm@65@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@65@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))
  ($PSF.lookup_pred1 (as sm@63@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))))
; [exec]
; exhale acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((a $Ref)) $Perm
  (ite
    (= a y@57@01)
    ($Perm.min (ite (= a y@57@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@67@01 ((a $Ref)) $Perm
  (ite
    (= a y@57@01)
    ($Perm.min
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        (- $Perm.Write (pTaken@62@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@66@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@66@01 y@57@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@57@01) (= (- $Perm.Write (pTaken@66@01 a)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $PSF<pred1>)
(declare-const s@69@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@57@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@68@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))
    ($PSF.lookup_pred1 (as sm@65@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01)))))
(assert (=>
  (ite
    (and (img@61@01 y@57@01) (Seq_contains xs@56@01 (inv@60@01 y@57@01)))
    (< $Perm.No (- $Perm.Write (pTaken@62@01 y@57@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@57@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@68@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@57@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@58@01)) ($SortWrappers.$RefTo$Snap y@57@01))))))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(pred1(x), write))
(declare-const x@70@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@56@01 x@70@01))
(pop) ; 3
(declare-fun inv@71@01 ($Ref) $Ref)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@70@01 $Ref) (x2@70@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@56@01 x1@70@01)
      (Seq_contains xs@56@01 x2@70@01)
      (= x1@70@01 x2@70@01))
    (= x1@70@01 x2@70@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@70@01 $Ref)) (!
  (=>
    (Seq_contains xs@56@01 x@70@01)
    (and (= (inv@71@01 x@70@01) x@70@01) (img@72@01 x@70@01)))
  :pattern ((Seq_contains xs@56@01 x@70@01))
  :pattern ((Seq_contains_trigger xs@56@01 x@70@01))
  :pattern ((inv@71@01 x@70@01))
  :pattern ((img@72@01 x@70@01))
  :qid |pred1-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@72@01 a) (Seq_contains xs@56@01 (inv@71@01 a)))
    (= (inv@71@01 a) a))
  :pattern ((inv@71@01 a))
  :qid |pred1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((a $Ref)) $Perm
  (ite
    (and (Seq_contains xs@56@01 (inv@71@01 a)) (img@72@01 a) (= a (inv@71@01 a)))
    ($Perm.min
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        (- $Perm.Write (pTaken@62@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        (- $Perm.Write (pTaken@62@01 a))
        $Perm.No)
      (pTaken@73@01 a))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@56@01 (inv@71@01 a)) (img@72@01 a) (= a (inv@71@01 a)))
    (= (- $Perm.Write (pTaken@73@01 a)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@56@01 (inv@71@01 a)) (img@72@01 a) (= a (inv@71@01 a)))
    (= (- $Perm.Write (pTaken@73@01 a)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const x@74@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@56@01 x@74@01))
(pop) ; 3
(declare-fun inv@75@01 ($Ref) $Ref)
(declare-fun img@76@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@74@01 $Ref) (x2@74@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@56@01 x1@74@01)
      (Seq_contains xs@56@01 x2@74@01)
      (= x1@74@01 x2@74@01))
    (= x1@74@01 x2@74@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@74@01 $Ref)) (!
  (=>
    (Seq_contains xs@56@01 x@74@01)
    (and (= (inv@75@01 x@74@01) x@74@01) (img@76@01 x@74@01)))
  :pattern ((Seq_contains xs@56@01 x@74@01))
  :pattern ((Seq_contains_trigger xs@56@01 x@74@01))
  :pattern ((inv@75@01 x@74@01))
  :pattern ((img@76@01 x@74@01))
  :qid |pred1-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@76@01 a) (Seq_contains xs@56@01 (inv@75@01 a)))
    (= (inv@75@01 a) a))
  :pattern ((inv@75@01 a))
  :qid |pred1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((a $Ref)) $Perm
  (ite
    (and (Seq_contains xs@56@01 (inv@75@01 a)) (img@76@01 a) (= a (inv@75@01 a)))
    ($Perm.min
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        (- $Perm.Write (pTaken@62@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@61@01 a) (Seq_contains xs@56@01 (inv@60@01 a)))
        (- $Perm.Write (pTaken@62@01 a))
        $Perm.No)
      (pTaken@77@01 a))
    $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@56@01 (inv@75@01 a)) (img@76@01 a) (= a (inv@75@01 a)))
    (= (- $Perm.Write (pTaken@77@01 a)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Seq_contains xs@56@01 (inv@75@01 a)) (img@76@01 a) (= a (inv@75@01 a)))
    (= (- $Perm.Write (pTaken@77@01 a)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test04_qp ----------
(declare-const xs@78@01 Seq<$Ref>)
(declare-const y@79@01 $Ref)
(declare-const xs@80@01 Seq<$Ref>)
(declare-const y@81@01 $Ref)
(push) ; 1
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (= ($Snap.first $t@82@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@80@01 y@81@01))
(declare-const x@83@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@80@01 x@83@01))
(pop) ; 2
(declare-fun inv@84@01 ($Ref) $Ref)
(declare-fun img@85@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@83@01 $Ref) (x2@83@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@80@01 x1@83@01)
      (Seq_contains xs@80@01 x2@83@01)
      (= x1@83@01 x2@83@01))
    (= x1@83@01 x2@83@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@83@01 $Ref)) (!
  (=>
    (Seq_contains xs@80@01 x@83@01)
    (and (= (inv@84@01 x@83@01) x@83@01) (img@85@01 x@83@01)))
  :pattern ((Seq_contains xs@80@01 x@83@01))
  :pattern ((Seq_contains_trigger xs@80@01 x@83@01))
  :pattern ((Seq_contains_trigger xs@80@01 x@83@01))
  :pattern ((inv@84@01 x@83@01))
  :pattern ((img@85@01 x@83@01))
  :qid |quant-u-47|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
    (= (inv@84@01 a) a))
  :pattern ((inv@84@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((a $Ref)) $Perm
  (ite
    (= a y@81@01)
    ($Perm.min
      (ite
        (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@86@01 a))
    $Perm.No)
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@86@01 a) $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@81@01) (= (- $Perm.Write (pTaken@86@01 a)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@87@01 $PSF<pred1>)
(declare-const s@88@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@85@01 y@81@01) (Seq_contains xs@80@01 (inv@84@01 y@81@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@81@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@87@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@82@01)) ($SortWrappers.$RefTo$Snap y@81@01))))))
(assert (not (= y@81@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@87@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))) y@81@01))
; [exec]
; assert y != null
; [eval] y != null
; [exec]
; fold acc(pred1(y), write)
(declare-const sm@89@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@89@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))
  ($PSF.lookup_pred1 (as sm@87@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))))
; [exec]
; exhale acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@90@01 ((a $Ref)) $Perm
  (ite
    (= a y@81@01)
    ($Perm.min (ite (= a y@81@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@91@01 ((a $Ref)) $Perm
  (ite
    (= a y@81@01)
    ($Perm.min
      (ite
        (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
        (- $Perm.Write (pTaken@86@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@90@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@90@01 y@81@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@81@01) (= (- $Perm.Write (pTaken@90@01 a)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@92@01 $PSF<pred1>)
(declare-const s@93@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@81@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@92@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))
    ($PSF.lookup_pred1 (as sm@89@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01)))))
(assert (=>
  (ite
    (and (img@85@01 y@81@01) (Seq_contains xs@80@01 (inv@84@01 y@81@01)))
    (< $Perm.No (- $Perm.Write (pTaken@86@01 y@81@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@81@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@92@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@81@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@82@01)) ($SortWrappers.$RefTo$Snap y@81@01))))))
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((a $Ref)) $Perm
  (ite
    (= a y@81@01)
    ($Perm.min
      (ite
        (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
        (- $Perm.Write (pTaken@86@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@85@01 a) (Seq_contains xs@80@01 (inv@84@01 a)))
        (- $Perm.Write (pTaken@86@01 a))
        $Perm.No)
      (pTaken@94@01 a))
    $Perm.No)
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@94@01 a) $Perm.No)
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@81@01) (= (- $Perm.Write (pTaken@94@01 a)) $Perm.No))
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@81@01) (= (- $Perm.Write (pTaken@94@01 a)) $Perm.No))
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test05_qp ----------
(declare-const xs@95@01 Seq<$Ref>)
(declare-const y@96@01 $Ref)
(declare-const xs@97@01 Seq<$Ref>)
(declare-const y@98@01 $Ref)
(push) ; 1
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.first $t@99@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@97@01 y@98@01))
(assert (=
  ($Snap.second $t@99@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@99@01))
    ($Snap.second ($Snap.second $t@99@01)))))
(assert (= ($Snap.first ($Snap.second $t@99@01)) $Snap.unit))
; [eval] y != null
(assert (not (= y@98@01 $Ref.null)))
(declare-const x@100@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@97@01 x@100@01))
(pop) ; 2
(declare-fun inv@101@01 ($Ref) $Ref)
(declare-fun img@102@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@100@01 $Ref) (x2@100@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@97@01 x1@100@01)
      (Seq_contains xs@97@01 x2@100@01)
      (= x1@100@01 x2@100@01))
    (= x1@100@01 x2@100@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@100@01 $Ref)) (!
  (=>
    (Seq_contains xs@97@01 x@100@01)
    (and (= (inv@101@01 x@100@01) x@100@01) (img@102@01 x@100@01)))
  :pattern ((Seq_contains xs@97@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@97@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@97@01 x@100@01))
  :pattern ((inv@101@01 x@100@01))
  :pattern ((img@102@01 x@100@01))
  :qid |quant-u-60|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
    (= (inv@101@01 a) a))
  :pattern ((inv@101@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 a))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@103@01 a) $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@98@01) (= (- $Perm.Write (pTaken@103@01 a)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@104@01 $PSF<pred1>)
(declare-const s@105@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@102@01 y@98@01) (Seq_contains xs@97@01 (inv@101@01 y@98@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@98@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@104@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second ($Snap.second $t@99@01))) ($SortWrappers.$RefTo$Snap y@98@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@104@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))) y@98@01))
; [exec]
; y.f := 1
; [exec]
; fold acc(pred1(y), write)
(assert (pred1%trigger ($SortWrappers.IntTo$Snap 1) y@98@01))
(declare-const sm@106@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@106@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
  1))
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@107@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min (ite (= a y@98@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@108@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        (- $Perm.Write (pTaken@103@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@107@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@107@01 y@98@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@98@01) (= (- $Perm.Write (pTaken@107@01 a)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $PSF<pred1>)
(declare-const s@110@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@98@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
    ($PSF.lookup_pred1 (as sm@106@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01)))))
(assert (=>
  (ite
    (and (img@102@01 y@98@01) (Seq_contains xs@97@01 (inv@101@01 y@98@01)))
    (< $Perm.No (- $Perm.Write (pTaken@103@01 y@98@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@98@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second ($Snap.second $t@99@01))) ($SortWrappers.$RefTo$Snap y@98@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))) y@98@01))
; [exec]
; assert y.f == 1
; [eval] y.f == 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
  1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
  1))
; [exec]
; fold acc(pred1(y), write)
(declare-const sm@111@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@111@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
  ($PSF.lookup_pred1 (as sm@109@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))))
; [exec]
; exhale acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min (ite (= a y@98@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@113@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        (- $Perm.Write (pTaken@103@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@112@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@112@01 y@98@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@98@01) (= (- $Perm.Write (pTaken@112@01 a)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@114@01 $PSF<pred1>)
(declare-const s@115@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@98@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@114@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
    ($PSF.lookup_pred1 (as sm@111@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01)))))
(assert (=>
  (ite
    (and (img@102@01 y@98@01) (Seq_contains xs@97@01 (inv@101@01 y@98@01)))
    (< $Perm.No (- $Perm.Write (pTaken@103@01 y@98@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@98@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@114@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@98@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second ($Snap.second $t@99@01))) ($SortWrappers.$RefTo$Snap y@98@01))))))
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@116@01 ((a $Ref)) $Perm
  (ite
    (= a y@98@01)
    ($Perm.min
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        (- $Perm.Write (pTaken@103@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@102@01 a) (Seq_contains xs@97@01 (inv@101@01 a)))
        (- $Perm.Write (pTaken@103@01 a))
        $Perm.No)
      (pTaken@116@01 a))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@116@01 a) $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@98@01) (= (- $Perm.Write (pTaken@116@01 a)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@98@01) (= (- $Perm.Write (pTaken@116@01 a)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test06_qp ----------
(declare-const xs@117@01 Seq<$Ref>)
(declare-const y@118@01 $Ref)
(declare-const z@119@01 $Ref)
(declare-const xs@120@01 Seq<$Ref>)
(declare-const y@121@01 $Ref)
(declare-const z@122@01 $Ref)
(push) ; 1
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 ($Snap.combine ($Snap.first $t@123@01) ($Snap.second $t@123@01))))
(assert (= ($Snap.first $t@123@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@120@01 y@121@01))
(declare-const x@124@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@120@01 x@124@01))
(pop) ; 2
(declare-fun inv@125@01 ($Ref) $Ref)
(declare-fun img@126@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@124@01 $Ref) (x2@124@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@120@01 x1@124@01)
      (Seq_contains xs@120@01 x2@124@01)
      (= x1@124@01 x2@124@01))
    (= x1@124@01 x2@124@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@124@01 $Ref)) (!
  (=>
    (Seq_contains xs@120@01 x@124@01)
    (and (= (inv@125@01 x@124@01) x@124@01) (img@126@01 x@124@01)))
  :pattern ((Seq_contains xs@120@01 x@124@01))
  :pattern ((Seq_contains_trigger xs@120@01 x@124@01))
  :pattern ((Seq_contains_trigger xs@120@01 x@124@01))
  :pattern ((inv@125@01 x@124@01))
  :pattern ((img@126@01 x@124@01))
  :qid |quant-u-76|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@126@01 a) (Seq_contains xs@120@01 (inv@125@01 a)))
    (= (inv@125@01 a) a))
  :pattern ((inv@125@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((a $Ref)) $Perm
  (ite
    (= a y@121@01)
    ($Perm.min
      (ite
        (and (img@126@01 a) (Seq_contains xs@120@01 (inv@125@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@126@01 a) (Seq_contains xs@120@01 (inv@125@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@127@01 a))
    $Perm.No)
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@127@01 a) $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@121@01) (= (- $Perm.Write (pTaken@127@01 a)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $PSF<pred1>)
(declare-const s@129@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@126@01 y@121@01) (Seq_contains xs@120@01 (inv@125@01 y@121@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@121@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@128@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@121@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second $t@123@01)) ($SortWrappers.$RefTo$Snap y@121@01))))))
(assert (not (= y@121@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@128@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@121@01))) y@121@01))
; [exec]
; unfold acc(pred1(z), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((a $Ref)) $Perm
  (ite
    (= a z@122@01)
    ($Perm.min
      (ite
        (and (img@126@01 a) (Seq_contains xs@120@01 (inv@125@01 a)))
        (- $Perm.Write (pTaken@127@01 a))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@126@01 a) (Seq_contains xs@120@01 (inv@125@01 a)))
        (- $Perm.Write (pTaken@127@01 a))
        $Perm.No)
      (pTaken@130@01 a))
    $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@130@01 a) $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a z@122@01) (= (- $Perm.Write (pTaken@130@01 a)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((a $Ref)) (!
  (=> (= a z@122@01) (= (- $Perm.Write (pTaken@130@01 a)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test07_qp ----------
(declare-const xs@131@01 Seq<$Ref>)
(declare-const y@132@01 $Ref)
(declare-const xs@133@01 Seq<$Ref>)
(declare-const y@134@01 $Ref)
(push) ; 1
(declare-const $t@135@01 $Snap)
(assert (= $t@135@01 ($Snap.combine ($Snap.first $t@135@01) ($Snap.second $t@135@01))))
(assert (= ($Snap.first $t@135@01) $Snap.unit))
; [eval] (y in xs)
(assert (Seq_contains xs@133@01 y@134@01))
(assert (=
  ($Snap.second $t@135@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@135@01))
    ($Snap.second ($Snap.second $t@135@01)))))
(assert (= ($Snap.first ($Snap.second $t@135@01)) $Snap.unit))
; [eval] y != null
(assert (not (= y@134@01 $Ref.null)))
(declare-const x@136@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@133@01 x@136@01))
(pop) ; 2
(declare-fun inv@137@01 ($Ref) $Ref)
(declare-fun img@138@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@136@01 $Ref) (x2@136@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@133@01 x1@136@01)
      (Seq_contains xs@133@01 x2@136@01)
      (= x1@136@01 x2@136@01))
    (= x1@136@01 x2@136@01))
  
  :qid |pred1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@136@01 $Ref)) (!
  (=>
    (Seq_contains xs@133@01 x@136@01)
    (and (= (inv@137@01 x@136@01) x@136@01) (img@138@01 x@136@01)))
  :pattern ((Seq_contains xs@133@01 x@136@01))
  :pattern ((Seq_contains_trigger xs@133@01 x@136@01))
  :pattern ((Seq_contains_trigger xs@133@01 x@136@01))
  :pattern ((inv@137@01 x@136@01))
  :pattern ((img@138@01 x@136@01))
  :qid |quant-u-86|)))
(assert (forall ((a $Ref)) (!
  (=>
    (and (img@138@01 a) (Seq_contains xs@133@01 (inv@137@01 a)))
    (= (inv@137@01 a) a))
  :pattern ((inv@137@01 a))
  :qid |pred1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((a $Ref)) $Perm
  (ite
    (= a y@134@01)
    ($Perm.min
      (ite
        (and (img@138@01 a) (Seq_contains xs@133@01 (inv@137@01 a)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@138@01 a) (Seq_contains xs@133@01 (inv@137@01 a)))
        $Perm.Write
        $Perm.No)
      (pTaken@139@01 a))
    $Perm.No)
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((a $Ref)) (!
  (= (pTaken@139@01 a) $Perm.No)
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@134@01) (= (- $Perm.Write (pTaken@139@01 a)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@140@01 $PSF<pred1>)
(declare-const s@141@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@138@01 y@134@01) (Seq_contains xs@133@01 (inv@137@01 y@134@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@134@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@140@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second ($Snap.second $t@135@01))) ($SortWrappers.$RefTo$Snap y@134@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@140@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))) y@134@01))
; [exec]
; y.f := 1
; [exec]
; assert y.f == 1
; [eval] y.f == 1
; [exec]
; fold acc(pred1(y), write)
(assert (pred1%trigger ($SortWrappers.IntTo$Snap 1) y@134@01))
(declare-const sm@142@01 $PSF<pred1>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_pred1 (as sm@142@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
  1))
; [exec]
; unfold acc(pred1(y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@143@01 ((a $Ref)) $Perm
  (ite
    (= a y@134@01)
    ($Perm.min (ite (= a y@134@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@144@01 ((a $Ref)) $Perm
  (ite
    (= a y@134@01)
    ($Perm.min
      (ite
        (and (img@138@01 a) (Seq_contains xs@133@01 (inv@137@01 a)))
        (- $Perm.Write (pTaken@139@01 a))
        $Perm.No)
      (- $Perm.Write (pTaken@143@01 a)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@143@01 y@134@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=> (= a y@134@01) (= (- $Perm.Write (pTaken@143@01 a)) $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@145@01 $PSF<pred1>)
(declare-const s@146@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@134@01) $Snap.unit))
  (=
    ($PSF.lookup_pred1 (as sm@145@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
    ($PSF.lookup_pred1 (as sm@142@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01)))))
(assert (=>
  (ite
    (and (img@138@01 y@134@01) (Seq_contains xs@133@01 (inv@137@01 y@134@01)))
    (< $Perm.No (- $Perm.Write (pTaken@139@01 y@134@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@134@01) $Snap.unit))
    (=
      ($PSF.lookup_pred1 (as sm@145@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
      ($PSF.lookup_pred1 ($SortWrappers.$SnapTo$PSF<pred1> ($Snap.second ($Snap.second $t@135@01))) ($SortWrappers.$RefTo$Snap y@134@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_pred1 (as sm@145@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))) y@134@01))
; [exec]
; assert y.f == 1
; [eval] y.f == 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.lookup_pred1 (as sm@145@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
  1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.lookup_pred1 (as sm@145@01  $PSF<pred1>) ($SortWrappers.$RefTo$Snap y@134@01))
  1))
(pop) ; 2
(pop) ; 1
