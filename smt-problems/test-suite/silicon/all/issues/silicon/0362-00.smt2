(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0362.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort $PSF<P> 0)
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
(declare-fun $SortWrappers.$PSF<P>To$Snap ($PSF<P>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<P> ($Snap) $PSF<P>)
(assert (forall ((x $PSF<P>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<P>($SortWrappers.$PSF<P>To$Snap x)))
    :pattern (($SortWrappers.$PSF<P>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<P>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<P>To$Snap($SortWrappers.$SnapTo$PSF<P> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<P> x))
    :qid |$Snap.$PSF<P>To$SnapTo$PSF<P>|
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
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun P_state ($Snap $Ref Int) Int)
(declare-fun P_state%limited ($Snap $Ref Int) Int)
(declare-fun P_state%stateless ($Ref Int) Bool)
(declare-fun P_state%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [P: Snap]
(assert (forall ((vs $PSF<P>) (ws $PSF<P>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_P vs) ($PSF.domain_P ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_P vs))
            (= ($PSF.lookup_P vs x) ($PSF.lookup_P ws x)))
          :pattern (($PSF.lookup_P vs x) ($PSF.lookup_P ws x))
          :qid |qp.$PSF<P>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<P>To$Snap vs)
              ($SortWrappers.$PSF<P>To$Snap ws)
              )
    :qid |qp.$PSF<P>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_P pm s))
    :pattern (($PSF.perm_P pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (x@1@00 Int)) (!
  (= (P_state%limited s@$ r@0@00 x@1@00) (P_state s@$ r@0@00 x@1@00))
  :pattern ((P_state s@$ r@0@00 x@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (x@1@00 Int)) (!
  (P_state%stateless r@0@00 x@1@00)
  :pattern ((P_state%limited s@$ r@0@00 x@1@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
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
; var rs: Seq[Ref]
(declare-const rs@0@01 Seq<$Ref>)
; [exec]
; var xs: Seq[Int]
(declare-const xs@1@01 Seq<Int>)
; [exec]
; var nondet: Int
(declare-const nondet@2@01 Int)
; [exec]
; inhale (forall r: Ref, x: Int ::
;     { P(r, x) }
;     (r in rs) && (x in xs) ==> acc(P(r, x), write))
(declare-const r@3@01 $Ref)
(declare-const x@4@01 Int)
(push) ; 3
; [eval] (r in rs) && (x in xs)
; [eval] (r in rs)
(push) ; 4
; [then-branch: 0 | !(r@3@01 in rs@0@01) | live]
; [else-branch: 0 | r@3@01 in rs@0@01 | live]
(push) ; 5
; [then-branch: 0 | !(r@3@01 in rs@0@01)]
(assert (not (Seq_contains rs@0@01 r@3@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | r@3@01 in rs@0@01]
(assert (Seq_contains rs@0@01 r@3@01))
; [eval] (x in xs)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains rs@0@01 r@3@01) (not (Seq_contains rs@0@01 r@3@01))))
(assert (and (Seq_contains rs@0@01 r@3@01) (Seq_contains xs@1@01 x@4@01)))
(declare-const sm@5@01 $PSF<P>)
(declare-const s@6@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@7@01 $PSF<P>)
(declare-fun inv@8@01 ($Ref Int) $Ref)
(declare-fun img@9@01 ($Ref Int) Bool)
(declare-fun inv@10@01 ($Ref Int) Int)
(declare-fun img@11@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@3@01 $Ref) (x@4@01 Int)) (!
  (=>
    (and (Seq_contains rs@0@01 r@3@01) (Seq_contains xs@1@01 x@4@01))
    (or (Seq_contains rs@0@01 r@3@01) (not (Seq_contains rs@0@01 r@3@01))))
  :pattern (($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@3@01)
    ($SortWrappers.IntTo$Snap x@4@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@3@01)
    ($SortWrappers.IntTo$Snap x@4@01))))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@3@01 $Ref) (x1@4@01 Int) (r2@3@01 $Ref) (x2@4@01 Int)) (!
  (=>
    (and
      (and (Seq_contains rs@0@01 r1@3@01) (Seq_contains xs@1@01 x1@4@01))
      (and (Seq_contains rs@0@01 r2@3@01) (Seq_contains xs@1@01 x2@4@01))
      (and (= r1@3@01 r2@3@01) (= x1@4@01 x2@4@01)))
    (and (= r1@3@01 r2@3@01) (= x1@4@01 x2@4@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@3@01 $Ref) (x@4@01 Int)) (!
  (=>
    (and (Seq_contains rs@0@01 r@3@01) (Seq_contains xs@1@01 x@4@01))
    (and
      (and
        (= (inv@8@01 r@3@01 x@4@01) r@3@01)
        (= (inv@10@01 r@3@01 x@4@01) x@4@01))
      (and (img@9@01 r@3@01 x@4@01) (img@11@01 r@3@01 x@4@01))))
  :pattern (($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@3@01)
    ($SortWrappers.IntTo$Snap x@4@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@3@01)
    ($SortWrappers.IntTo$Snap x@4@01))))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@9@01 r x) (img@11@01 r x))
      (and
        (Seq_contains rs@0@01 (inv@8@01 r x))
        (Seq_contains xs@1@01 (inv@10@01 r x))))
    (and (= (inv@8@01 r x) r) (= (inv@10@01 r x) x)))
  :pattern ((inv@8@01 r x))
  :pattern ((inv@10@01 r x))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@12@01 $PSF<P>)
(declare-const s@13@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@13@01 $Snap)) (!
  (=>
    (and
      (and
        (img@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@13@01)) ($SortWrappers.$SnapToInt ($Snap.second s@13@01)))
        (img@11@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@13@01)) ($SortWrappers.$SnapToInt ($Snap.second s@13@01))))
      (and
        (Seq_contains
          rs@0@01
          (inv@8@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@13@01)) ($SortWrappers.$SnapToInt ($Snap.second s@13@01))))
        (Seq_contains
          xs@1@01
          (inv@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@13@01)) ($SortWrappers.$SnapToInt ($Snap.second s@13@01))))))
    (and
      (not (= s@13@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@12@01  $PSF<P>) s@13@01)
        ($PSF.lookup_P $t@7@01 s@13@01))))
  :pattern (($PSF.lookup_P (as sm@12@01  $PSF<P>) s@13@01))
  :pattern (($PSF.lookup_P $t@7@01 s@13@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@13@01 $Snap)) (!
  ($PSF.loc_P ($PSF.lookup_P $t@7@01 s@13@01) s@13@01)
  :pattern (($PSF.lookup_P (as sm@12@01  $PSF<P>) s@13@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (Seq_contains rs@0@01 (inv@8@01 r x))
      (Seq_contains xs@1@01 (inv@10@01 r x)))
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern ((inv@8@01 r x) (inv@10@01 r x))
  :qid |quant-u-4|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre_havoc
; [exec]
; exhale (forall r: Ref, x: Int ::
;     { P(r, x) }
;     acc(P(r, x), old[pre_havoc](perm(P(r, x)))))
(declare-const r@14@01 $Ref)
(declare-const x@15@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] old[pre_havoc](perm(P(r, x)))
; [eval] perm(P(r, x))
; Definitional axioms for snapshot map values
(declare-const pm@16@01 $PPM)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef4|)))
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@14@01)
  ($SortWrappers.IntTo$Snap x@15@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@14@01)
  ($SortWrappers.IntTo$Snap x@15@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@17@01 ($Ref Int) $Ref)
(declare-fun img@18@01 ($Ref Int) Bool)
(declare-fun inv@19@01 ($Ref Int) Int)
(declare-fun img@20@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef4|)))
; Nested auxiliary terms: non-globals
(assert (forall ((r@14@01 $Ref) (x@15@01 Int)) (!
  ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01)))
  :pattern (($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01))))
  :qid |P-aux|)))
(push) ; 3
(assert (not (forall ((r@14@01 $Ref) (x@15@01 Int)) (!
  (or
    (=
      ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@14@01)
        ($SortWrappers.IntTo$Snap x@15@01)))
      $Perm.No)
    (<
      $Perm.No
      ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@14@01)
        ($SortWrappers.IntTo$Snap x@15@01)))))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@14@01 $Ref) (x1@15@01 Int) (r2@14@01 $Ref) (x2@15@01 Int)) (!
  (=>
    (and
      (and
        ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@14@01)
          ($SortWrappers.IntTo$Snap x1@15@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@14@01)
          ($SortWrappers.IntTo$Snap x1@15@01)))
        (<
          $Perm.No
          ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r1@14@01)
            ($SortWrappers.IntTo$Snap x1@15@01)))))
      (and
        ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@14@01)
          ($SortWrappers.IntTo$Snap x2@15@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@14@01)
          ($SortWrappers.IntTo$Snap x2@15@01)))
        (<
          $Perm.No
          ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r2@14@01)
            ($SortWrappers.IntTo$Snap x2@15@01)))))
      (and (= r1@14@01 r2@14@01) (= x1@15@01 x2@15@01)))
    (and (= r1@14@01 r2@14@01) (= x1@15@01 x2@15@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@14@01 $Ref) (x@15@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@14@01)
        ($SortWrappers.IntTo$Snap x@15@01))))
    (and
      (and
        (= (inv@17@01 r@14@01 x@15@01) r@14@01)
        (= (inv@19@01 r@14@01 x@15@01) x@15@01))
      (and (img@18@01 r@14@01 x@15@01) (img@20@01 r@14@01 x@15@01))))
  :pattern (($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@14@01)
    ($SortWrappers.IntTo$Snap x@15@01))))
  :qid |P-invOfFct|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@18@01 r x) (img@20@01 r x))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@17@01 r x))
          ($SortWrappers.IntTo$Snap (inv@19@01 r x))))))
    (and (= (inv@17@01 r x) r) (= (inv@19@01 r x) x)))
  :pattern ((inv@17@01 r x))
  :pattern ((inv@19@01 r x))
  :qid |P-fctOfInv|)))
(assert (forall ((r $Ref) (x Int)) (!
  ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x)))
  :pattern ((inv@17@01 r x) (inv@19@01 r x))
  :qid |quant-u-6|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref) (x Int)) $Perm
  (ite
    (and
      (and (img@18@01 r x) (img@20@01 r x))
      (and (= r (inv@17@01 r x)) (= x (inv@19@01 r x))))
    ($Perm.min
      (ite
        (and
          (and (img@9@01 r x) (img@11@01 r x))
          (and
            (Seq_contains rs@0@01 (inv@8@01 r x))
            (Seq_contains xs@1@01 (inv@10@01 r x))))
        $Perm.Write
        $Perm.No)
      ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@17@01 r x))
        ($SortWrappers.IntTo$Snap (inv@19@01 r x)))))
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
(assert (not (forall ((r $Ref) (x Int)) (!
  (=
    (-
      (ite
        (and
          (and (img@9@01 r x) (img@11@01 r x))
          (and
            (Seq_contains rs@0@01 (inv@8@01 r x))
            (Seq_contains xs@1@01 (inv@10@01 r x))))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r x))
    $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@18@01 r x) (img@20@01 r x))
      (and (= r (inv@17@01 r x)) (= x (inv@19@01 r x))))
    (=
      (-
        ($PSF.perm_P (as pm@16@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@17@01 r x))
          ($SortWrappers.IntTo$Snap (inv@19@01 r x))))
        (pTaken@21@01 r x))
      $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [exec]
; inhale (forall r: Ref, x: Int ::
;     { P(r, x) }
;     acc(P(r, x), old[pre_havoc](perm(P(r, x)))))
(declare-const r@22@01 $Ref)
(declare-const x@23@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] old[pre_havoc](perm(P(r, x)))
; [eval] perm(P(r, x))
; Definitional axioms for snapshot map values
(declare-const pm@24@01 $PPM)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef5|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef6|)))
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@22@01)
  ($SortWrappers.IntTo$Snap x@23@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@22@01)
  ($SortWrappers.IntTo$Snap x@23@01))))
(declare-const sm@25@01 $PSF<P>)
(declare-const s@26@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@27@01 $PSF<P>)
(declare-fun inv@28@01 ($Ref Int) $Ref)
(declare-fun img@29@01 ($Ref Int) Bool)
(declare-fun inv@30@01 ($Ref Int) Int)
(declare-fun img@31@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef5|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef6|)))
; Nested auxiliary terms: non-globals
(assert (forall ((r@22@01 $Ref) (x@23@01 Int)) (!
  ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01)))
  :pattern (($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))))
  :qid |P-aux|)))
(push) ; 3
(assert (not (forall ((r@22@01 $Ref) (x@23@01 Int)) (!
  (or
    (=
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@22@01)
        ($SortWrappers.IntTo$Snap x@23@01)))
      $Perm.No)
    (<
      $Perm.No
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@22@01)
        ($SortWrappers.IntTo$Snap x@23@01)))))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@22@01 $Ref) (x1@23@01 Int) (r2@22@01 $Ref) (x2@23@01 Int)) (!
  (=>
    (and
      (<
        $Perm.No
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@22@01)
          ($SortWrappers.IntTo$Snap x1@23@01))))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@22@01)
          ($SortWrappers.IntTo$Snap x2@23@01))))
      (and (= r1@22@01 r2@22@01) (= x1@23@01 x2@23@01)))
    (and (= r1@22@01 r2@22@01) (= x1@23@01 x2@23@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@22@01 $Ref) (x@23@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@22@01)
        ($SortWrappers.IntTo$Snap x@23@01))))
    (and
      (and
        (= (inv@28@01 r@22@01 x@23@01) r@22@01)
        (= (inv@30@01 r@22@01 x@23@01) x@23@01))
      (and (img@29@01 r@22@01 x@23@01) (img@31@01 r@22@01 x@23@01))))
  :pattern (($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@29@01 r x) (img@31@01 r x))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))))
    (and (= (inv@28@01 r x) r) (= (inv@30@01 r x) x)))
  :pattern ((inv@28@01 r x))
  :pattern ((inv@30@01 r x))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((r@22@01 $Ref) (x@23@01 Int)) (!
  (<=
    $Perm.No
    ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@22@01)
      ($SortWrappers.IntTo$Snap x@23@01))))
  :pattern (($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@22@01)
    ($SortWrappers.IntTo$Snap x@23@01))))
  :qid |P-permAtLeastZero|)))
(declare-const sm@32@01 $PSF<P>)
(declare-const s@33@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@29@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@33@01)) ($SortWrappers.$SnapToInt ($Snap.second s@33@01)))
        (img@31@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@33@01)) ($SortWrappers.$SnapToInt ($Snap.second s@33@01))))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@33@01)) ($SortWrappers.$SnapToInt ($Snap.second s@33@01))))
          ($SortWrappers.IntTo$Snap (inv@30@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@33@01)) ($SortWrappers.$SnapToInt ($Snap.second s@33@01)))))))
      false)
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@32@01  $PSF<P>) s@33@01)
        ($PSF.lookup_P $t@27@01 s@33@01))))
  :pattern (($PSF.lookup_P (as sm@32@01  $PSF<P>) s@33@01))
  :pattern (($PSF.lookup_P $t@27@01 s@33@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@33@01 $Snap)) (!
  ($PSF.loc_P ($PSF.lookup_P $t@27@01 s@33@01) s@33@01)
  :pattern (($PSF.lookup_P (as sm@32@01  $PSF<P>) s@33@01))
  :qid |qp.psmResTrgDef9|)))
(assert (forall ((r $Ref) (x Int)) (!
  ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x)))
  :pattern ((inv@28@01 r x) (inv@30@01 r x))
  :qid |quant-u-12|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] nondet == 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= nondet@2@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | nondet@2@01 == 0 | live]
; [else-branch: 1 | nondet@2@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | nondet@2@01 == 0]
(assert (= nondet@2@01 0))
; [exec]
; inhale (forall r: Ref, x: Int ::
;     { P_state(r, x) }
;     none < old[pre_havoc](perm(P(r, x))) ==> P_state(r, x) != 0)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] (forall r: Ref, x: Int :: { P_state(r, x) } none < old[pre_havoc](perm(P(r, x))) ==> P_state(r, x) != 0)
(declare-const r@35@01 $Ref)
(declare-const x@36@01 Int)
(push) ; 4
; [eval] none < old[pre_havoc](perm(P(r, x))) ==> P_state(r, x) != 0
; [eval] none < old[pre_havoc](perm(P(r, x)))
; [eval] old[pre_havoc](perm(P(r, x)))
; [eval] perm(P(r, x))
; Definitional axioms for snapshot map values
(declare-const pm@37@01 $PPM)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef11|)))
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))))
(push) ; 5
; [then-branch: 2 | Z < PredicatePermLookup(P, pm@37@01, List(r@35@01, x@36@01)) | live]
; [else-branch: 2 | !(Z < PredicatePermLookup(P, pm@37@01, List(r@35@01, x@36@01))) | live]
(push) ; 6
; [then-branch: 2 | Z < PredicatePermLookup(P, pm@37@01, List(r@35@01, x@36@01))]
(assert (<
  $Perm.No
  ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01)))))
; [eval] P_state(r, x) != 0
; [eval] P_state(r, x)
(push) ; 7
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@38@01 ((r $Ref) (x Int) (r@35@01 $Ref) (x@36@01 Int)) $Perm
  (ite
    (and (= r r@35@01) (= x x@36@01))
    ($Perm.min
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=
    (-
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
        $Perm.No)
      (pTaken@38@01 r x r@35@01 x@36@01))
    $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (x Int)) (!
  (= (pTaken@38@01 r x r@35@01 x@36@01) $Perm.No)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=>
    (and (= r r@35@01) (= x x@36@01))
    (= (- $Perm.Write (pTaken@38@01 r x r@35@01 x@36@01)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and (img@29@01 r@35@01 x@36@01) (img@31@01 r@35@01 x@36@01))
    (<
      $Perm.No
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@28@01 r@35@01 x@36@01))
        ($SortWrappers.IntTo$Snap (inv@30@01 r@35@01 x@36@01)))))
    false)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))
        $Snap.unit))
    (=
      ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@35@01)
        ($SortWrappers.IntTo$Snap x@36@01)))
      ($PSF.lookup_P $t@27@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@35@01)
        ($SortWrappers.IntTo$Snap x@36@01)))))))
(assert ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))))
(assert (P_state%precondition ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@35@01)
  ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01))
(pop) ; 7
; Joined path conditions
(assert (and
  ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01)))
  (=>
    (ite
      (and (img@29@01 r@35@01 x@36@01) (img@31@01 r@35@01 x@36@01))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r@35@01 x@36@01))
          ($SortWrappers.IntTo$Snap (inv@30@01 r@35@01 x@36@01)))))
      false)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@35@01)
            ($SortWrappers.IntTo$Snap x@36@01))
          $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01)))
        ($PSF.lookup_P $t@27@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))))))
  ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01)))
  (P_state%precondition ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 2 | !(Z < PredicatePermLookup(P, pm@37@01, List(r@35@01, x@36@01)))]
(assert (not
  (<
    $Perm.No
    ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (<
    $Perm.No
    ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))))
  (and
    (<
      $Perm.No
      ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@35@01)
        ($SortWrappers.IntTo$Snap x@36@01))))
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01)))
    (=>
      (ite
        (and (img@29@01 r@35@01 x@36@01) (img@31@01 r@35@01 x@36@01))
        (<
          $Perm.No
          ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap (inv@28@01 r@35@01 x@36@01))
            ($SortWrappers.IntTo$Snap (inv@30@01 r@35@01 x@36@01)))))
        false)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@35@01)
              ($SortWrappers.IntTo$Snap x@36@01))
            $Snap.unit))
        (=
          ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@35@01)
            ($SortWrappers.IntTo$Snap x@36@01)))
          ($PSF.lookup_P $t@27@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@35@01)
            ($SortWrappers.IntTo$Snap x@36@01))))))
    ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01)))
    (P_state%precondition ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01))))
; Joined path conditions
(assert (or
  (not
    (<
      $Perm.No
      ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@35@01)
        ($SortWrappers.IntTo$Snap x@36@01)))))
  (<
    $Perm.No
    ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@35@01 $Ref) (x@36@01 Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@35@01)
      ($SortWrappers.IntTo$Snap x@36@01)))
    (=>
      (<
        $Perm.No
        ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))))
      (and
        (<
          $Perm.No
          ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@35@01)
            ($SortWrappers.IntTo$Snap x@36@01))))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01)))
        (=>
          (ite
            (and (img@29@01 r@35@01 x@36@01) (img@31@01 r@35@01 x@36@01))
            (<
              $Perm.No
              ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
                ($SortWrappers.$RefTo$Snap (inv@28@01 r@35@01 x@36@01))
                ($SortWrappers.IntTo$Snap (inv@30@01 r@35@01 x@36@01)))))
            false)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@35@01)
                  ($SortWrappers.IntTo$Snap x@36@01))
                $Snap.unit))
            (=
              ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@35@01)
                ($SortWrappers.IntTo$Snap x@36@01)))
              ($PSF.lookup_P $t@27@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@35@01)
                ($SortWrappers.IntTo$Snap x@36@01))))))
        ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01)))
        (P_state%precondition ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01)))
    (or
      (not
        (<
          $Perm.No
          ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@35@01)
            ($SortWrappers.IntTo$Snap x@36@01)))))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))))))
  :pattern ((P_state%limited ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0362.vpr@20@12@22@27-aux|)))
(assert (forall ((r@35@01 $Ref) (x@36@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@37@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@35@01)
        ($SortWrappers.IntTo$Snap x@36@01))))
    (not
      (=
        (P_state ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@35@01)
          ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01)
        0)))
  :pattern ((P_state%limited ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@35@01)
    ($SortWrappers.IntTo$Snap x@36@01))) r@35@01 x@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0362.vpr@20@12@22@27|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | nondet@2@01 != 0]
(assert (not (= nondet@2@01 0)))
(pop) ; 3
; [eval] !(nondet == 0)
; [eval] nondet == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= nondet@2@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | nondet@2@01 != 0 | live]
; [else-branch: 3 | nondet@2@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | nondet@2@01 != 0]
(assert (not (= nondet@2@01 0)))
; [eval] nondet == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= nondet@2@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | nondet@2@01 == 1 | live]
; [else-branch: 4 | nondet@2@01 != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | nondet@2@01 == 1]
(assert (= nondet@2@01 1))
; [exec]
; assert (forall r: Ref, x: Int ::none < old[pre_havoc](perm(P(r, x))) ==>
;     acc(P(r, x), write))
(declare-const r@39@01 $Ref)
(declare-const x@40@01 Int)
(push) ; 5
; [eval] none < old[pre_havoc](perm(P(r, x)))
; [eval] old[pre_havoc](perm(P(r, x)))
; [eval] perm(P(r, x))
; Definitional axioms for snapshot map values
(declare-const pm@41@01 $PPM)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef13|)))
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@39@01)
  ($SortWrappers.IntTo$Snap x@40@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@39@01)
  ($SortWrappers.IntTo$Snap x@40@01))))
(assert (<
  $Perm.No
  ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@39@01)
    ($SortWrappers.IntTo$Snap x@40@01)))))
(pop) ; 5
(declare-fun inv@42@01 ($Ref Int) $Ref)
(declare-fun img@43@01 ($Ref Int) Bool)
(declare-fun inv@44@01 ($Ref Int) Int)
(declare-fun img@45@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and
        (and (img@9@01 r x) (img@11@01 r x))
        (and
          (Seq_contains rs@0@01 (inv@8@01 r x))
          (Seq_contains xs@1@01 (inv@10@01 r x))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@7@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef13|)))
; Nested auxiliary terms: non-globals
(assert (forall ((r@39@01 $Ref) (x@40@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@39@01)
        ($SortWrappers.IntTo$Snap x@40@01))))
    ($PSF.loc_P ($PSF.lookup_P (as sm@12@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@39@01)
      ($SortWrappers.IntTo$Snap x@40@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@39@01)
      ($SortWrappers.IntTo$Snap x@40@01))))
  :pattern ((inv@42@01 r@39@01 x@40@01))
  :pattern ((inv@44@01 r@39@01 x@40@01))
  :pattern ((img@43@01 r@39@01 x@40@01))
  :pattern ((img@45@01 r@39@01 x@40@01))
  :qid |P-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((r1@39@01 $Ref) (x1@40@01 Int) (r2@39@01 $Ref) (x2@40@01 Int)) (!
  (=>
    (and
      (and
        (<
          $Perm.No
          ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r1@39@01)
            ($SortWrappers.IntTo$Snap x1@40@01))))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@39@01)
          ($SortWrappers.IntTo$Snap x1@40@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@39@01)
          ($SortWrappers.IntTo$Snap x1@40@01))))
      (and
        (<
          $Perm.No
          ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r2@39@01)
            ($SortWrappers.IntTo$Snap x2@40@01))))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@39@01)
          ($SortWrappers.IntTo$Snap x2@40@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@39@01)
          ($SortWrappers.IntTo$Snap x2@40@01))))
      (and (= r1@39@01 r2@39@01) (= x1@40@01 x2@40@01)))
    (and (= r1@39@01 r2@39@01) (= x1@40@01 x2@40@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@39@01 $Ref) (x@40@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@39@01)
        ($SortWrappers.IntTo$Snap x@40@01))))
    (and
      (and
        (= (inv@42@01 r@39@01 x@40@01) r@39@01)
        (= (inv@44@01 r@39@01 x@40@01) x@40@01))
      (and (img@43@01 r@39@01 x@40@01) (img@45@01 r@39@01 x@40@01))))
  :pattern ((inv@42@01 r@39@01 x@40@01))
  :pattern ((inv@44@01 r@39@01 x@40@01))
  :pattern ((img@43@01 r@39@01 x@40@01))
  :pattern ((img@45@01 r@39@01 x@40@01))
  :qid |P-invOfFct|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@43@01 r x) (img@45@01 r x))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@42@01 r x))
          ($SortWrappers.IntTo$Snap (inv@44@01 r x))))))
    (and (= (inv@42@01 r x) r) (= (inv@44@01 r x) x)))
  :pattern ((inv@42@01 r x))
  :pattern ((inv@44@01 r x))
  :qid |P-fctOfInv|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@42@01 r x))
        ($SortWrappers.IntTo$Snap (inv@44@01 r x)))))
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern ((inv@42@01 r x) (inv@44@01 r x))
  :qid |quant-u-18|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref) (x Int)) $Perm
  (ite
    (and
      (<
        $Perm.No
        ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@42@01 r x))
          ($SortWrappers.IntTo$Snap (inv@44@01 r x)))))
      (and (img@43@01 r x) (img@45@01 r x))
      (and (= r (inv@42@01 r x)) (= x (inv@44@01 r x))))
    ($Perm.min
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=
    (-
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
        $Perm.No)
      (pTaken@46@01 r x))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (<
        $Perm.No
        ($PSF.perm_P (as pm@41@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@42@01 r x))
          ($SortWrappers.IntTo$Snap (inv@44@01 r x)))))
      (and (img@43@01 r x) (img@45@01 r x))
      (and (= r (inv@42@01 r x)) (= x (inv@44@01 r x))))
    (= (- $Perm.Write (pTaken@46@01 r x)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | nondet@2@01 != 1]
(assert (not (= nondet@2@01 1)))
(pop) ; 4
; [eval] !(nondet == 1)
; [eval] nondet == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= nondet@2@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | nondet@2@01 != 1 | live]
; [else-branch: 5 | nondet@2@01 == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | nondet@2@01 != 1]
(assert (not (= nondet@2@01 1)))
; [eval] nondet == 2
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 2))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= nondet@2@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | nondet@2@01 == 2 | live]
; [else-branch: 6 | nondet@2@01 != 2 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | nondet@2@01 == 2]
(assert (= nondet@2@01 2))
; [exec]
; assert (forall r: Ref, x: Int ::none < perm(P(r, x)) ==>
;     acc(P(r, x), write))
(declare-const r@47@01 $Ref)
(declare-const x@48@01 Int)
(push) ; 6
; [eval] none < perm(P(r, x))
; [eval] perm(P(r, x))
; Definitional axioms for snapshot map values
(declare-const pm@49@01 $PPM)
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and (img@29@01 r x) (img@31@01 r x))
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
        ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef15|)))
(assert ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@47@01)
  ($SortWrappers.IntTo$Snap x@48@01))) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@47@01)
  ($SortWrappers.IntTo$Snap x@48@01))))
(assert (<
  $Perm.No
  ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@47@01)
    ($SortWrappers.IntTo$Snap x@48@01)))))
(pop) ; 6
(declare-fun inv@50@01 ($Ref Int) $Ref)
(declare-fun img@51@01 ($Ref Int) Bool)
(declare-fun inv@52@01 ($Ref Int) Int)
(declare-fun img@53@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref) (x Int)) (!
  (=
    ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    (ite
      (and (img@29@01 r x) (img@31@01 r x))
      ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
        ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
      $Perm.No))
  :pattern (($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref) (x Int)) (!
  (and
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x)))
    ($PSF.loc_P ($PSF.lookup_P $t@27@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern (($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r)
    ($SortWrappers.IntTo$Snap x))))
  :qid |qp.resTrgDef15|)))
; Nested auxiliary terms: non-globals
(assert (forall ((r@47@01 $Ref) (x@48@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap x@48@01))))
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap x@48@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap x@48@01))))
  :pattern ((inv@50@01 r@47@01 x@48@01))
  :pattern ((inv@52@01 r@47@01 x@48@01))
  :pattern ((img@51@01 r@47@01 x@48@01))
  :pattern ((img@53@01 r@47@01 x@48@01))
  :qid |P-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((r1@47@01 $Ref) (x1@48@01 Int) (r2@47@01 $Ref) (x2@48@01 Int)) (!
  (=>
    (and
      (and
        (<
          $Perm.No
          ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r1@47@01)
            ($SortWrappers.IntTo$Snap x1@48@01))))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@47@01)
          ($SortWrappers.IntTo$Snap x1@48@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@47@01)
          ($SortWrappers.IntTo$Snap x1@48@01))))
      (and
        (<
          $Perm.No
          ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r2@47@01)
            ($SortWrappers.IntTo$Snap x2@48@01))))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@47@01)
          ($SortWrappers.IntTo$Snap x2@48@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@47@01)
          ($SortWrappers.IntTo$Snap x2@48@01))))
      (and (= r1@47@01 r2@47@01) (= x1@48@01 x2@48@01)))
    (and (= r1@47@01 r2@47@01) (= x1@48@01 x2@48@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@47@01 $Ref) (x@48@01 Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap x@48@01))))
    (and
      (and
        (= (inv@50@01 r@47@01 x@48@01) r@47@01)
        (= (inv@52@01 r@47@01 x@48@01) x@48@01))
      (and (img@51@01 r@47@01 x@48@01) (img@53@01 r@47@01 x@48@01))))
  :pattern ((inv@50@01 r@47@01 x@48@01))
  :pattern ((inv@52@01 r@47@01 x@48@01))
  :pattern ((img@51@01 r@47@01 x@48@01))
  :pattern ((img@53@01 r@47@01 x@48@01))
  :qid |P-invOfFct|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@51@01 r x) (img@53@01 r x))
      (<
        $Perm.No
        ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@50@01 r x))
          ($SortWrappers.IntTo$Snap (inv@52@01 r x))))))
    (and (= (inv@50@01 r x) r) (= (inv@52@01 r x) x)))
  :pattern ((inv@50@01 r x))
  :pattern ((inv@52@01 r x))
  :qid |P-fctOfInv|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (<
      $Perm.No
      ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
        ($SortWrappers.$RefTo$Snap (inv@50@01 r x))
        ($SortWrappers.IntTo$Snap (inv@52@01 r x)))))
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern ((inv@50@01 r x) (inv@52@01 r x))
  :qid |quant-u-23|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref) (x Int)) $Perm
  (ite
    (and
      (<
        $Perm.No
        ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@50@01 r x))
          ($SortWrappers.IntTo$Snap (inv@52@01 r x)))))
      (and (img@51@01 r x) (img@53@01 r x))
      (and (= r (inv@50@01 r x)) (= x (inv@52@01 r x))))
    ($Perm.min
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
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
(assert (not (forall ((r $Ref) (x Int)) (!
  (=
    (-
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
        $Perm.No)
      (pTaken@54@01 r x))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (<
        $Perm.No
        ($PSF.perm_P (as pm@49@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@50@01 r x))
          ($SortWrappers.IntTo$Snap (inv@52@01 r x)))))
      (and (img@51@01 r x) (img@53@01 r x))
      (and (= r (inv@50@01 r x)) (= x (inv@52@01 r x))))
    (= (- $Perm.Write (pTaken@54@01 r x)) $Perm.No))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 6 | nondet@2@01 != 2]
(assert (not (= nondet@2@01 2)))
(pop) ; 5
; [eval] !(nondet == 2)
; [eval] nondet == 2
(push) ; 5
(set-option :timeout 10)
(assert (not (= nondet@2@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= nondet@2@01 2))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | nondet@2@01 != 2 | live]
; [else-branch: 7 | nondet@2@01 == 2 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | nondet@2@01 != 2]
(assert (not (= nondet@2@01 2)))
; [exec]
; assert (forall r: Ref, x: Int ::(r in rs) && (x in xs) ==>
;     acc(P(r, x), write))
(declare-const r@55@01 $Ref)
(declare-const x@56@01 Int)
(push) ; 6
; [eval] (r in rs) && (x in xs)
; [eval] (r in rs)
(push) ; 7
; [then-branch: 8 | !(r@55@01 in rs@0@01) | live]
; [else-branch: 8 | r@55@01 in rs@0@01 | live]
(push) ; 8
; [then-branch: 8 | !(r@55@01 in rs@0@01)]
(assert (not (Seq_contains rs@0@01 r@55@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | r@55@01 in rs@0@01]
(assert (Seq_contains rs@0@01 r@55@01))
; [eval] (x in xs)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains rs@0@01 r@55@01) (not (Seq_contains rs@0@01 r@55@01))))
(assert (and (Seq_contains rs@0@01 r@55@01) (Seq_contains xs@1@01 x@56@01)))
(pop) ; 6
(declare-fun inv@57@01 ($Ref Int) $Ref)
(declare-fun img@58@01 ($Ref Int) Bool)
(declare-fun inv@59@01 ($Ref Int) Int)
(declare-fun img@60@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@55@01 $Ref) (x@56@01 Int)) (!
  (=>
    (and (Seq_contains rs@0@01 r@55@01) (Seq_contains xs@1@01 x@56@01))
    (or (Seq_contains rs@0@01 r@55@01) (not (Seq_contains rs@0@01 r@55@01))))
  :pattern ((Seq_contains rs@0@01 r@55@01) (Seq_contains xs@1@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (Seq_contains_trigger
    xs@1@01
    x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (Seq_contains_trigger
    xs@1@01
    x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((inv@57@01 r@55@01 x@56@01))
  :pattern ((inv@59@01 r@55@01 x@56@01))
  :pattern ((img@58@01 r@55@01 x@56@01))
  :pattern ((img@60@01 r@55@01 x@56@01))
  :qid |P-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((r1@55@01 $Ref) (x1@56@01 Int) (r2@55@01 $Ref) (x2@56@01 Int)) (!
  (=>
    (and
      (and
        (and (Seq_contains rs@0@01 r1@55@01) (Seq_contains xs@1@01 x1@56@01))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@55@01)
          ($SortWrappers.IntTo$Snap x1@56@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r1@55@01)
          ($SortWrappers.IntTo$Snap x1@56@01))))
      (and
        (and (Seq_contains rs@0@01 r2@55@01) (Seq_contains xs@1@01 x2@56@01))
        ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@55@01)
          ($SortWrappers.IntTo$Snap x2@56@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@55@01)
          ($SortWrappers.IntTo$Snap x2@56@01))))
      (and (= r1@55@01 r2@55@01) (= x1@56@01 x2@56@01)))
    (and (= r1@55@01 r2@55@01) (= x1@56@01 x2@56@01)))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@55@01 $Ref) (x@56@01 Int)) (!
  (=>
    (and (Seq_contains rs@0@01 r@55@01) (Seq_contains xs@1@01 x@56@01))
    (and
      (and
        (= (inv@57@01 r@55@01 x@56@01) r@55@01)
        (= (inv@59@01 r@55@01 x@56@01) x@56@01))
      (and (img@58@01 r@55@01 x@56@01) (img@60@01 r@55@01 x@56@01))))
  :pattern ((Seq_contains rs@0@01 r@55@01) (Seq_contains xs@1@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (Seq_contains_trigger
    xs@1@01
    x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains rs@0@01 r@55@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger rs@0@01 r@55@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@57@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (inv@59@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@58@01 r@55@01 x@56@01))
  :pattern ((Seq_contains xs@1@01 x@56@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((Seq_contains_trigger xs@1@01 x@56@01) (img@60@01 r@55@01 x@56@01))
  :pattern ((inv@57@01 r@55@01 x@56@01))
  :pattern ((inv@59@01 r@55@01 x@56@01))
  :pattern ((img@58@01 r@55@01 x@56@01))
  :pattern ((img@60@01 r@55@01 x@56@01))
  :qid |P-invOfFct|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and (img@58@01 r x) (img@60@01 r x))
      (and
        (Seq_contains rs@0@01 (inv@57@01 r x))
        (Seq_contains xs@1@01 (inv@59@01 r x))))
    (and (= (inv@57@01 r x) r) (= (inv@59@01 r x) x)))
  :pattern ((inv@57@01 r x))
  :pattern ((inv@59@01 r x))
  :qid |P-fctOfInv|)))
(assert (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (Seq_contains rs@0@01 (inv@57@01 r x))
      (Seq_contains xs@1@01 (inv@59@01 r x)))
    ($PSF.loc_P ($PSF.lookup_P (as sm@32@01  $PSF<P>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r)
      ($SortWrappers.IntTo$Snap x))))
  :pattern ((inv@57@01 r x) (inv@59@01 r x))
  :qid |quant-u-28|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref) (x Int)) $Perm
  (ite
    (and
      (and
        (Seq_contains rs@0@01 (inv@57@01 r x))
        (Seq_contains xs@1@01 (inv@59@01 r x)))
      (and (img@58@01 r x) (img@60@01 r x))
      (and (= r (inv@57@01 r x)) (= x (inv@59@01 r x))))
    ($Perm.min
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
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
(assert (not (forall ((r $Ref) (x Int)) (!
  (=
    (-
      (ite
        (and (img@29@01 r x) (img@31@01 r x))
        ($PSF.perm_P (as pm@24@01  $PPM) ($Snap.combine
          ($SortWrappers.$RefTo$Snap (inv@28@01 r x))
          ($SortWrappers.IntTo$Snap (inv@30@01 r x))))
        $Perm.No)
      (pTaken@61@01 r x))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (x Int)) (!
  (=>
    (and
      (and
        (Seq_contains rs@0@01 (inv@57@01 r x))
        (Seq_contains xs@1@01 (inv@59@01 r x)))
      (and (img@58@01 r x) (img@60@01 r x))
      (and (= r (inv@57@01 r x)) (= x (inv@59@01 r x))))
    (= (- $Perm.Write (pTaken@61@01 r x)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | nondet@2@01 == 2]
(assert (= nondet@2@01 2))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 5 | nondet@2@01 == 1]
(assert (= nondet@2@01 1))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | nondet@2@01 == 0]
(assert (= nondet@2@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
