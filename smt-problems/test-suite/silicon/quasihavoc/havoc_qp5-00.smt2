(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:26:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr
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
(declare-sort $PSF<Pair> 0)
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
(declare-fun $SortWrappers.$PSF<Pair>To$Snap ($PSF<Pair>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Pair> ($Snap) $PSF<Pair>)
(assert (forall ((x $PSF<Pair>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Pair>($SortWrappers.$PSF<Pair>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Pair>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Pair>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Pair>To$Snap($SortWrappers.$SnapTo$PSF<Pair> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Pair> x))
    :qid |$Snap.$PSF<Pair>To$SnapTo$PSF<Pair>|
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
; /predicate_snap_functions_declarations.smt2 [Pair: Snap]
(declare-fun $PSF.domain_Pair ($PSF<Pair>) Set<$Snap>)
(declare-fun $PSF.lookup_Pair ($PSF<Pair> $Snap) $Snap)
(declare-fun $PSF.after_Pair ($PSF<Pair> $PSF<Pair>) Bool)
(declare-fun $PSF.loc_Pair ($Snap $Snap) Bool)
(declare-fun $PSF.perm_Pair ($PPM $Snap) $Perm)
(declare-const $psfTOP_Pair $PSF<Pair>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Pair%trigger ($Snap $Ref $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [Pair: Snap]
(assert (forall ((vs $PSF<Pair>) (ws $PSF<Pair>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Pair vs) ($PSF.domain_Pair ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Pair vs))
            (= ($PSF.lookup_Pair vs x) ($PSF.lookup_Pair ws x)))
          :pattern (($PSF.lookup_Pair vs x) ($PSF.lookup_Pair ws x))
          :qid |qp.$PSF<Pair>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Pair>To$Snap vs)
              ($SortWrappers.$PSF<Pair>To$Snap ws)
              )
    :qid |qp.$PSF<Pair>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Pair pm s))
    :pattern (($PSF.perm_Pair pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_Pair f s) true)
    :pattern (($PSF.loc_Pair f s)))))
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
; ---------- foo ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const s@2@01 Seq<$Ref>)
(declare-const t@3@01 Seq<$Ref>)
(declare-const x@4@01 $Ref)
(declare-const y@5@01 $Ref)
(declare-const s@6@01 Seq<$Ref>)
(declare-const t@7@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] |s| == |t|
; [eval] |s|
; [eval] |t|
(assert (= (Seq_length s@6@01) (Seq_length t@7@01)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] |s| >= 2
; [eval] |s|
(assert (>= (Seq_length s@6@01) 2))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { s[i], s[j] } 0 <= i && (i < j && j < |s|) ==> s[i] != s[j])
(declare-const i@9@01 Int)
(declare-const j@10@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |s|) ==> s[i] != s[j]
; [eval] 0 <= i && (i < j && j < |s|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@9@01) | live]
; [else-branch: 0 | 0 <= i@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < j
(push) ; 5
; [then-branch: 1 | !(i@9@01 < j@10@01) | live]
; [else-branch: 1 | i@9@01 < j@10@01 | live]
(push) ; 6
; [then-branch: 1 | !(i@9@01 < j@10@01)]
(assert (not (< i@9@01 j@10@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@9@01 < j@10@01]
(assert (< i@9@01 j@10@01))
; [eval] j < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@9@01 j@10@01) (not (< i@9@01 j@10@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@9@01)
  (and (<= 0 i@9@01) (or (< i@9@01 j@10@01) (not (< i@9@01 j@10@01))))))
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@9@01 && i@9@01 < j@10@01 && j@10@01 < |s@6@01| | live]
; [else-branch: 2 | !(0 <= i@9@01 && i@9@01 < j@10@01 && j@10@01 < |s@6@01|) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@9@01 && i@9@01 < j@10@01 && j@10@01 < |s@6@01|]
(assert (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01)))))
; [eval] s[i] != s[j]
; [eval] s[i]
(push) ; 5
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@9@01 (Seq_length s@6@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[j]
(push) ; 5
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@9@01 && i@9@01 < j@10@01 && j@10@01 < |s@6@01|)]
(assert (not
  (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))
  (and (<= 0 i@9@01) (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01)))))
  (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (<= 0 i@9@01)
      (and (<= 0 i@9@01) (or (< i@9@01 j@10@01) (not (< i@9@01 j@10@01)))))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01)))
    (=>
      (and
        (<= 0 i@9@01)
        (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))
      (and (<= 0 i@9@01) (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))
    (or
      (not
        (and
          (<= 0 i@9@01)
          (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01)))))
      (and
        (<= 0 i@9@01)
        (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))))
  :pattern ((Seq_index s@6@01 i@9@01) (Seq_index s@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@10@14@10@82-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (and (< i@9@01 j@10@01) (< j@10@01 (Seq_length s@6@01))))
    (not (= (Seq_index s@6@01 i@9@01) (Seq_index s@6@01 j@10@01))))
  :pattern ((Seq_index s@6@01 i@9@01) (Seq_index s@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@10@14@10@82|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@11@01) | live]
; [else-branch: 3 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(assert (and (<= 0 i@11@01) (< i@11@01 (Seq_length s@6@01))))
; [eval] s[i]
(push) ; 3
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] t[i]
(push) ; 3
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@11@01 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@12@01 ($Ref $Ref) Int)
(declare-fun img@13@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 (Seq_length s@6@01)))
    (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
  :pattern ((Seq_index s@6@01 i@11@01))
  :pattern ((Seq_index t@7@01 i@11@01))
  :qid |Pair-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@01) (< i1@11@01 (Seq_length s@6@01)))
      (and (<= 0 i2@11@01) (< i2@11@01 (Seq_length s@6@01)))
      (and
        (= (Seq_index s@6@01 i1@11@01) (Seq_index s@6@01 i2@11@01))
        (= (Seq_index t@7@01 i1@11@01) (Seq_index t@7@01 i2@11@01))))
    (= i1@11@01 i2@11@01))
  
  :qid |Pair-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 (Seq_length s@6@01)))
    (and
      (=
        (inv@12@01 (Seq_index s@6@01 i@11@01) (Seq_index t@7@01 i@11@01))
        i@11@01)
      (img@13@01 (Seq_index s@6@01 i@11@01) (Seq_index t@7@01 i@11@01))))
  :pattern ((Seq_index s@6@01 i@11@01))
  :pattern ((Seq_index t@7@01 i@11@01))
  :qid |quant-u-1|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (img@13@01 x y)
      (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
    (and
      (= (Seq_index s@6@01 (inv@12@01 x y)) x)
      (= (Seq_index t@7@01 (inv@12@01 x y)) y)))
  :pattern ((inv@12@01 x y))
  :qid |Pair-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  $Snap.unit))
; [eval] (forall i: Int :: { s[i] } { t[i] } 0 <= i && i < |s| ==> (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i))
(declare-const i@14@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |s| ==> (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i)
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@14@01) | live]
; [else-branch: 4 | 0 <= i@14@01 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@14@01)]
(assert (not (<= 0 i@14@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@14@01]
(assert (<= 0 i@14@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@14@01) (not (<= 0 i@14@01))))
(push) ; 3
; [then-branch: 5 | 0 <= i@14@01 && i@14@01 < |s@6@01| | live]
; [else-branch: 5 | !(0 <= i@14@01 && i@14@01 < |s@6@01|) | live]
(push) ; 4
; [then-branch: 5 | 0 <= i@14@01 && i@14@01 < |s@6@01|]
(assert (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01))))
; [eval] (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i)
; [eval] s[i]
(push) ; 5
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] t[i]
(push) ; 5
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@14@01 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [eval] s[i]
(push) ; 6
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] t[i]
(push) ; 6
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@14@01 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((x $Ref) (y $Ref) (i@14@01 Int)) $Perm
  (ite
    (and (= x (Seq_index s@6@01 i@14@01)) (= y (Seq_index t@7@01 i@14@01)))
    ($Perm.min
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@15@01 x y i@14@01))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@15@01 x y i@14@01) $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x (Seq_index s@6@01 i@14@01)) (= y (Seq_index t@7@01 i@14@01)))
    (= (- $Perm.Write (pTaken@15@01 x y i@14@01)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $PSF<Pair>)
(declare-const s@17@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@13@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
    (and
      (<= 0 (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01)))
      (<
        (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
        (Seq_length s@6@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
      ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
(assert (Pair%trigger ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))) (Seq_index
  s@6@01
  i@14@01) (Seq_index t@7@01 i@14@01)))
(assert (=
  ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
    ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
(assert (not (= (Seq_index s@6@01 i@14@01) $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
    ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index t@7@01 i@14@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
  $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))))
; [eval] s[i].f == i
; [eval] s[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (and
      (img@13@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
      (and
        (<= 0 (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01)))
        (<
          (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
          (Seq_length s@6@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))
          $Snap.unit))
      (=
        ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
        ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
  (Pair%trigger ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))) (Seq_index
    s@6@01
    i@14@01) (Seq_index t@7@01 i@14@01))
  (=
    ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
      ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
  (not (= (Seq_index s@6@01 i@14@01) $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
      ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
  (not (= (Seq_index t@7@01 i@14@01) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(0 <= i@14@01 && i@14@01 < |s@6@01|)]
(assert (not (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))
  (and
    (<= 0 i@14@01)
    (< i@14@01 (Seq_length s@6@01))
    (=>
      (and
        (img@13@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
        (and
          (<=
            0
            (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01)))
          (<
            (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
            (Seq_length s@6@01))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))
            $Snap.unit))
        (=
          ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
          ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
    (Pair%trigger ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))) (Seq_index
      s@6@01
      i@14@01) (Seq_index t@7@01 i@14@01))
    (=
      ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
        ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
    (not (= (Seq_index s@6@01 i@14@01) $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
        ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
    (not (= (Seq_index t@7@01 i@14@01) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01))))
  (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int)) (!
  (and
    (or (<= 0 i@14@01) (not (<= 0 i@14@01)))
    (=>
      (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))
      (and
        (<= 0 i@14@01)
        (< i@14@01 (Seq_length s@6@01))
        (=>
          (and
            (img@13@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
            (and
              (<=
                0
                (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01)))
              (<
                (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
                (Seq_length s@6@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))
                $Snap.unit))
            (=
              ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
              ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
        (Pair%trigger ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))) (Seq_index
          s@6@01
          i@14@01) (Seq_index t@7@01 i@14@01))
        (=
          ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
            ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
        (not (= (Seq_index s@6@01 i@14@01) $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
            ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
        (not (= (Seq_index t@7@01 i@14@01) $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))))
    (or
      (not (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01))))
      (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))))
  :pattern ((Seq_index s@6@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@13@14@14@58-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (and
    (or (<= 0 i@14@01) (not (<= 0 i@14@01)))
    (=>
      (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))
      (and
        (<= 0 i@14@01)
        (< i@14@01 (Seq_length s@6@01))
        (=>
          (and
            (img@13@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
            (and
              (<=
                0
                (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01)))
              (<
                (inv@12@01 (Seq_index s@6@01 i@14@01) (Seq_index t@7@01 i@14@01))
                (Seq_length s@6@01))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))
                $Snap.unit))
            (=
              ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
              ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
        (Pair%trigger ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))) (Seq_index
          s@6@01
          i@14@01) (Seq_index t@7@01 i@14@01))
        (=
          ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
            ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))))
        (not (= (Seq_index s@6@01 i@14@01) $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
            ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))
        (not (= (Seq_index t@7@01 i@14@01) $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))))))
    (or
      (not (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01))))
      (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))))
  :pattern ((Seq_index t@7@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@13@14@14@58-aux|)))
(assert (forall ((i@14@01 Int)) (!
  (=>
    (and (<= 0 i@14@01) (< i@14@01 (Seq_length s@6@01)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@16@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@14@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@14@01))))))
      i@14@01))
  :pattern ((Seq_index s@6@01 i@14@01))
  :pattern ((Seq_index t@7@01 i@14@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@13@14@14@58|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] x == s[0]
; [eval] s[0]
(push) ; 2
(assert (not (< 0 (Seq_length s@6@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= x@4@01 (Seq_index s@6@01 0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] y == t[0]
; [eval] t[0]
(push) ; 2
(assert (not (< 0 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= y@5@01 (Seq_index t@7@01 0)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; quasihavoc Pair(x, y)
(declare-const sm@18@01 $PSF<Pair>)
; axiomatized snapshot map after havoc
(assert (forall ((s@$ $Snap)) (!
  (=>
    (not
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) x@4@01)
        (= ($SortWrappers.$SnapTo$Ref ($Snap.second s@$)) y@5@01)))
    (=
      ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) s@$)
      ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) s@$)))
  :pattern (($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) s@$))
  :pattern (($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))) s@$))
  :qid |qp.smValDef0|)))
; [exec]
; unfold acc(Pair(x, y), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and (= x x@4@01) (= y y@5@01))
    ($Perm.min
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
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
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@19@01 x y))
    $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@19@01 x y) $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x x@4@01) (= y y@5@01))
    (= (- $Perm.Write (pTaken@19@01 x y)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $PSF<Pair>)
(declare-const s@21@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@13@01 x@4@01 y@5@01)
    (and
      (<= 0 (inv@12@01 x@4@01 y@5@01))
      (< (inv@12@01 x@4@01 y@5@01) (Seq_length s@6@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@4@01)
          ($SortWrappers.$RefTo$Snap y@5@01))
        $Snap.unit))
    (=
      ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@4@01)
        ($SortWrappers.$RefTo$Snap y@5@01)))
      ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@4@01)
        ($SortWrappers.$RefTo$Snap y@5@01)))))))
(assert (=
  ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@4@01)
    ($SortWrappers.$RefTo$Snap y@5@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@4@01)
      ($SortWrappers.$RefTo$Snap y@5@01))))
    ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@4@01)
      ($SortWrappers.$RefTo$Snap y@5@01)))))))
(assert (not (= x@4@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@4@01)
    ($SortWrappers.$RefTo$Snap y@5@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@4@01)
      ($SortWrappers.$RefTo$Snap y@5@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@4@01)
      ($SortWrappers.$RefTo$Snap y@5@01))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@4@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@5@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@4@01)
    ($SortWrappers.$RefTo$Snap y@5@01)))))
  $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@4@01)
    ($SortWrappers.$RefTo$Snap y@5@01)))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@4@01)
    ($SortWrappers.$RefTo$Snap y@5@01))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Pair%trigger ($PSF.lookup_Pair (as sm@20@01  $PSF<Pair>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap x@4@01)
  ($SortWrappers.$RefTo$Snap y@5@01))) x@4@01 y@5@01))
; [exec]
; assert (forall i: Int ::
;     { s[i] }
;     { t[i] }
;     1 <= i && i < |s| ==>
;     (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i))
; [eval] (forall i: Int :: { s[i] } { t[i] } 1 <= i && i < |s| ==> (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i))
(declare-const i@22@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 1 <= i && i < |s| ==> (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i)
; [eval] 1 <= i && i < |s|
; [eval] 1 <= i
(push) ; 4
; [then-branch: 6 | !(1 <= i@22@01) | live]
; [else-branch: 6 | 1 <= i@22@01 | live]
(push) ; 5
; [then-branch: 6 | !(1 <= i@22@01)]
(assert (not (<= 1 i@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 1 <= i@22@01]
(assert (<= 1 i@22@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 1 i@22@01) (not (<= 1 i@22@01))))
(push) ; 4
; [then-branch: 7 | 1 <= i@22@01 && i@22@01 < |s@6@01| | live]
; [else-branch: 7 | !(1 <= i@22@01 && i@22@01 < |s@6@01|) | live]
(push) ; 5
; [then-branch: 7 | 1 <= i@22@01 && i@22@01 < |s@6@01|]
(assert (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01))))
; [eval] (unfolding acc(Pair(s[i], t[i]), write) in s[i].f == i)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] t[i]
(push) ; 6
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@22@01 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [eval] s[i]
(push) ; 7
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] t[i]
(push) ; 7
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@22@01 (Seq_length t@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((x $Ref) (y $Ref) (i@22@01 Int)) $Perm
  (ite
    (and (= x (Seq_index s@6@01 i@22@01)) (= y (Seq_index t@7@01 i@22@01)))
    ($Perm.min
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
        (- $Perm.Write (pTaken@19@01 x y))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 x y)
          (and (<= 0 (inv@12@01 x y)) (< (inv@12@01 x y) (Seq_length s@6@01))))
        (- $Perm.Write (pTaken@19@01 x y))
        $Perm.No)
      (pTaken@23@01 x y i@22@01))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@23@01 x y i@22@01) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x (Seq_index s@6@01 i@22@01)) (= y (Seq_index t@7@01 i@22@01)))
    (= (- $Perm.Write (pTaken@23@01 x y i@22@01)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $PSF<Pair>)
(declare-const s@25@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@13@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
      (and
        (<= 0 (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01)))
        (<
          (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
          (Seq_length s@6@01))))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@19@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))
        $Snap.unit))
    (=
      ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
      ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
(assert (Pair%trigger ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))) (Seq_index
  s@6@01
  i@22@01) (Seq_index t@7@01 i@22@01)))
(assert (=
  ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
    ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@4@01 (Seq_index s@6@01 i@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@5@01 (Seq_index s@6@01 i@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index s@6@01 i@22@01) $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
    ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@4@01 (Seq_index t@7@01 i@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@5@01 (Seq_index t@7@01 i@22@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index t@7@01 i@22@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
  $Snap.unit))
; [eval] x.f == y.f
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))))
; [eval] s[i].f == i
; [eval] s[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (ite
      (and
        (img@13@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
        (and
          (<=
            0
            (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01)))
          (<
            (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
            (Seq_length s@6@01))))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@19@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))
          $Snap.unit))
      (=
        ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
        ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
  (Pair%trigger ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
    ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))) (Seq_index
    s@6@01
    i@22@01) (Seq_index t@7@01 i@22@01))
  (=
    ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
      ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
  (not (= (Seq_index s@6@01 i@22@01) $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
      ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
  (not (= (Seq_index t@7@01 i@22@01) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(1 <= i@22@01 && i@22@01 < |s@6@01|)]
(assert (not (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))
  (and
    (<= 1 i@22@01)
    (< i@22@01 (Seq_length s@6@01))
    (=>
      (ite
        (and
          (img@13@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
          (and
            (<=
              0
              (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01)))
            (<
              (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
              (Seq_length s@6@01))))
        (<
          $Perm.No
          (-
            $Perm.Write
            (pTaken@19@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))
            $Snap.unit))
        (=
          ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
          ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
    (Pair%trigger ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
      ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))) (Seq_index
      s@6@01
      i@22@01) (Seq_index t@7@01 i@22@01))
    (=
      ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
        ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
    (not (= (Seq_index s@6@01 i@22@01) $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
        ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
    (not (= (Seq_index t@7@01 i@22@01) $Ref.null))
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))))))
; Joined path conditions
(assert (or
  (not (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01))))
  (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@22@01 Int)) (!
  (and
    (or (<= 1 i@22@01) (not (<= 1 i@22@01)))
    (=>
      (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))
      (and
        (<= 1 i@22@01)
        (< i@22@01 (Seq_length s@6@01))
        (=>
          (ite
            (and
              (img@13@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
              (and
                (<=
                  0
                  (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index
                    t@7@01
                    i@22@01)))
                (<
                  (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index
                    t@7@01
                    i@22@01))
                  (Seq_length s@6@01))))
            (<
              $Perm.No
              (-
                $Perm.Write
                (pTaken@19@01 (Seq_index s@6@01 i@22@01) (Seq_index
                  t@7@01
                  i@22@01))))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))
                $Snap.unit))
            (=
              ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
              ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
        (Pair%trigger ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))) (Seq_index
          s@6@01
          i@22@01) (Seq_index t@7@01 i@22@01))
        (=
          ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
            ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
        (not (= (Seq_index s@6@01 i@22@01) $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
            ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
        (not (= (Seq_index t@7@01 i@22@01) $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))))
    (or
      (not (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01))))
      (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))))
  :pattern ((Seq_index s@6@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@21@12@22@54-aux|)))
(assert (forall ((i@22@01 Int)) (!
  (and
    (or (<= 1 i@22@01) (not (<= 1 i@22@01)))
    (=>
      (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))
      (and
        (<= 1 i@22@01)
        (< i@22@01 (Seq_length s@6@01))
        (=>
          (ite
            (and
              (img@13@01 (Seq_index s@6@01 i@22@01) (Seq_index t@7@01 i@22@01))
              (and
                (<=
                  0
                  (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index
                    t@7@01
                    i@22@01)))
                (<
                  (inv@12@01 (Seq_index s@6@01 i@22@01) (Seq_index
                    t@7@01
                    i@22@01))
                  (Seq_length s@6@01))))
            (<
              $Perm.No
              (-
                $Perm.Write
                (pTaken@19@01 (Seq_index s@6@01 i@22@01) (Seq_index
                  t@7@01
                  i@22@01))))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                  ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))
                $Snap.unit))
            (=
              ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
              ($PSF.lookup_Pair (as sm@18@01  $PSF<Pair>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
                ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
        (Pair%trigger ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
          ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))) (Seq_index
          s@6@01
          i@22@01) (Seq_index t@7@01 i@22@01))
        (=
          ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
            ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))))
        (not (= (Seq_index s@6@01 i@22@01) $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
            ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
              ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))
        (not (= (Seq_index t@7@01 i@22@01) $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
            ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))))))
    (or
      (not (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01))))
      (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))))
  :pattern ((Seq_index t@7@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@21@12@22@54-aux|)))
(push) ; 3
(assert (not (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
      i@22@01))
  :pattern ((Seq_index s@6@01 i@22@01))
  :pattern ((Seq_index t@7@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@21@12@22@54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 1 i@22@01) (< i@22@01 (Seq_length s@6@01)))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_Pair (as sm@24@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (Seq_index s@6@01 i@22@01))
        ($SortWrappers.$RefTo$Snap (Seq_index t@7@01 i@22@01))))))
      i@22@01))
  :pattern ((Seq_index s@6@01 i@22@01))
  :pattern ((Seq_index t@7@01 i@22@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp5.vpr@21@12@22@54|)))
(pop) ; 2
(pop) ; 1
