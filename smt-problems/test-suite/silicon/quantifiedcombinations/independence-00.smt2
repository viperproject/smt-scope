(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr
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
(declare-sort $FVF<f> 0)
(declare-sort $PSF<p2> 0)
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<p2>To$Snap ($PSF<p2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p2> ($Snap) $PSF<p2>)
(assert (forall ((x $PSF<p2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p2>($SortWrappers.$PSF<p2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p2>To$Snap($SortWrappers.$SnapTo$PSF<p2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p2> x))
    :qid |$Snap.$PSF<p2>To$SnapTo$PSF<p2>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [p2: Int]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) Int)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 (Int $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p1%trigger ($Snap $Ref) Bool)
(declare-fun p2%trigger ($Snap $Ref Int) Bool)
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
; /field_value_functions_axioms.smt2 [f: Int]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; /predicate_snap_functions_axioms.smt2 [p2: Int]
(assert (forall ((vs $PSF<p2>) (ws $PSF<p2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p2 vs) ($PSF.domain_p2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p2 vs))
            (= ($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x)))
          :pattern (($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x))
          :qid |qp.$PSF<p2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p2>To$Snap vs)
              ($SortWrappers.$PSF<p2>To$Snap ws)
              )
    :qid |qp.$PSF<p2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p2 pm s))
    :pattern (($PSF.perm_p2 pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_p2 f s) true)
    :pattern (($PSF.loc_p2 f s)))))
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
; ---------- m1 ----------
(declare-const r@0@01 $Ref)
(declare-const xs@1@01 Seq<$Ref>)
(declare-const i@2@01 Int)
(declare-const r@3@01 $Ref)
(declare-const xs@4@01 Seq<$Ref>)
(declare-const i@5@01 Int)
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
; var c: Int
(declare-const c@6@01 Int)
; [exec]
; c := 2
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(declare-const x@8@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@4@01 x@8@01))
(pop) ; 3
(declare-fun inv@9@01 ($Ref Int) $Ref)
(declare-fun img@10@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@4@01 x1@8@01)
      (Seq_contains xs@4@01 x2@8@01)
      (= x1@8@01 x2@8@01))
    (= x1@8@01 x2@8@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Seq_contains xs@4@01 x@8@01)
    (and (= (inv@9@01 x@8@01 i@5@01) x@8@01) (img@10@01 x@8@01 i@5@01)))
  :pattern ((Seq_contains xs@4@01 x@8@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@8@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@8@01))
  :pattern ((inv@9@01 x@8@01 i@5@01))
  :pattern ((img@10@01 x@8@01 i@5@01))
  :qid |quant-u-1|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@10@01 a b) (Seq_contains xs@4@01 (inv@9@01 a b)))
    (and (= (inv@9@01 a b) a) (= i@5@01 b)))
  :pattern ((inv@9@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(declare-const x@11@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | !(x@11@01 in xs@4@01) | live]
; [else-branch: 0 | x@11@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 0 | !(x@11@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@11@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@11@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@11@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@11@01) (not (Seq_contains xs@4@01 x@11@01))))
(assert (and (Seq_contains xs@4@01 x@11@01) (> i@5@01 0)))
(pop) ; 3
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@11@01) (> i@5@01 0))
    (or (Seq_contains xs@4@01 x@11@01) (not (Seq_contains xs@4@01 x@11@01))))
  :pattern ((Seq_contains xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@11@01 $Ref) (x2@11@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@11@01) (> i@5@01 0))
      (and (Seq_contains xs@4@01 x2@11@01) (> i@5@01 0))
      (= x1@11@01 x2@11@01))
    (= x1@11@01 x2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@11@01) (> i@5@01 0))
    (and (= (inv@12@01 x@11@01) x@11@01) (img@13@01 x@11@01)))
  :pattern ((Seq_contains xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (Seq_contains xs@4@01 (inv@12@01 r)) (> i@5@01 0)))
    (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@11@01) (> i@5@01 0))
    (not (= x@11@01 $Ref.null)))
  :pattern ((Seq_contains xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@11@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@14@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 1 | !(x@14@01 in xs@4@01) | live]
; [else-branch: 1 | x@14@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 1 | !(x@14@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@14@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | x@14@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@14@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@14@01) (not (Seq_contains xs@4@01 x@14@01))))
(push) ; 4
; [then-branch: 2 | x@14@01 in xs@4@01 && i@5@01 > 0 | live]
; [else-branch: 2 | !(x@14@01 in xs@4@01 && i@5@01 > 0) | live]
(push) ; 5
; [then-branch: 2 | x@14@01 in xs@4@01 && i@5@01 > 0]
(assert (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@13@01 x@14@01)
  (and (Seq_contains xs@4@01 (inv@12@01 x@14@01)) (> i@5@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@14@01 in xs@4@01 && i@5@01 > 0)]
(assert (not (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0)))
  (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@14@01 $Ref)) (!
  (and
    (or (Seq_contains xs@4@01 x@14@01) (not (Seq_contains xs@4@01 x@14@01)))
    (or
      (not (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0)))
      (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))))
  :pattern ((Seq_contains xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@19@9@19@87-aux|)))
(assert (forall ((x@14@01 $Ref)) (!
  (and
    (or (Seq_contains xs@4@01 x@14@01) (not (Seq_contains xs@4@01 x@14@01)))
    (or
      (not (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0)))
      (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@19@9@19@87-aux|)))
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@14@01) (> i@5@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@7@01))) x@14@01)
      0))
  :pattern ((Seq_contains xs@4@01 x@14@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@19@9@19@87|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert c == 2
; [eval] c == 2
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@15@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@4@01 x@15@01))
(pop) ; 3
(declare-fun inv@16@01 ($Ref Int) $Ref)
(declare-fun img@17@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@15@01 $Ref) (x2@15@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@4@01 x1@15@01)
      (Seq_contains xs@4@01 x2@15@01)
      (= x1@15@01 x2@15@01))
    (= x1@15@01 x2@15@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@15@01 $Ref)) (!
  (=>
    (Seq_contains xs@4@01 x@15@01)
    (and (= (inv@16@01 x@15@01 i@5@01) x@15@01) (img@17@01 x@15@01 i@5@01)))
  :pattern ((Seq_contains xs@4@01 x@15@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@15@01))
  :pattern ((inv@16@01 x@15@01 i@5@01))
  :pattern ((img@17@01 x@15@01 i@5@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@17@01 a b) (Seq_contains xs@4@01 (inv@16@01 a b)))
    (and (= (inv@16@01 a b) a) (= i@5@01 b)))
  :pattern ((inv@16@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@4@01 (inv@16@01 a b))
      (img@17@01 a b)
      (and (= a (inv@16@01 a b)) (= b i@5@01)))
    ($Perm.min
      (ite
        (and (img@10@01 a b) (Seq_contains xs@4@01 (inv@9@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@10@01 a b) (Seq_contains xs@4@01 (inv@9@01 a b)))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 a b))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (Seq_contains xs@4@01 (inv@16@01 a b))
      (img@17@01 a b)
      (and (= a (inv@16@01 a b)) (= b i@5@01)))
    (= (- $Perm.Write (pTaken@18@01 a b)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $PSF<p2>)
(declare-const s@20@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@20@01 $Snap)) (!
  (=>
    (and
      (img@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@20@01)) ($SortWrappers.$SnapToInt ($Snap.second s@20@01)))
      (Seq_contains
        xs@4@01
        (inv@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@20@01)) ($SortWrappers.$SnapToInt ($Snap.second s@20@01)))))
    (and
      (not (= s@20@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@19@01  $PSF<p2>) s@20@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@7@01)) s@20@01))))
  :pattern (($PSF.lookup_p2 (as sm@19@01  $PSF<p2>) s@20@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@7@01)) s@20@01))
  :qid |qp.psmValDef0|)))
(declare-const x@21@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 3 | !(x@21@01 in xs@4@01) | live]
; [else-branch: 3 | x@21@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 3 | !(x@21@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@21@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | x@21@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@21@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@21@01) (not (Seq_contains xs@4@01 x@21@01))))
(assert (and (Seq_contains xs@4@01 x@21@01) (> i@5@01 0)))
(pop) ; 3
(declare-fun inv@22@01 ($Ref) $Ref)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@21@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@21@01) (> i@5@01 0))
    (or (Seq_contains xs@4@01 x@21@01) (not (Seq_contains xs@4@01 x@21@01))))
  :pattern ((Seq_contains xs@4@01 x@21@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@21@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@21@01))
  :pattern ((inv@22@01 x@21@01))
  :pattern ((img@23@01 x@21@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@21@01 $Ref) (x2@21@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 x1@21@01) (> i@5@01 0))
      (and (Seq_contains xs@4@01 x2@21@01) (> i@5@01 0))
      (= x1@21@01 x2@21@01))
    (= x1@21@01 x2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@21@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@21@01) (> i@5@01 0))
    (and (= (inv@22@01 x@21@01) x@21@01) (img@23@01 x@21@01)))
  :pattern ((Seq_contains xs@4@01 x@21@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@21@01))
  :pattern ((inv@22@01 x@21@01))
  :pattern ((img@23@01 x@21@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (and (Seq_contains xs@4@01 (inv@22@01 r)) (> i@5@01 0)))
    (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@4@01 (inv@22@01 r)) (> i@5@01 0))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    ($Perm.min
      (ite
        (and
          (img@13@01 r)
          (and (Seq_contains xs@4@01 (inv@12@01 r)) (> i@5@01 0)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 r)
          (and (Seq_contains xs@4@01 (inv@12@01 r)) (> i@5@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@24@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@4@01 (inv@22@01 r)) (> i@5@01 0))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@25@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (Seq_contains xs@4@01 (inv@12@01 r)) (> i@5@01 0)))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@7@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@7@01))) r))
  :qid |qp.fvfValDef1|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@26@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 4 | !(x@26@01 in xs@4@01) | live]
; [else-branch: 4 | x@26@01 in xs@4@01 | live]
(push) ; 5
; [then-branch: 4 | !(x@26@01 in xs@4@01)]
(assert (not (Seq_contains xs@4@01 x@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | x@26@01 in xs@4@01]
(assert (Seq_contains xs@4@01 x@26@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@4@01 x@26@01) (not (Seq_contains xs@4@01 x@26@01))))
(push) ; 4
; [then-branch: 5 | x@26@01 in xs@4@01 && i@5@01 > 0 | live]
; [else-branch: 5 | !(x@26@01 in xs@4@01 && i@5@01 > 0) | live]
(push) ; 5
; [then-branch: 5 | x@26@01 in xs@4@01 && i@5@01 > 0]
(assert (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@13@01 x@26@01)
  (and (Seq_contains xs@4@01 (inv@12@01 x@26@01)) (> i@5@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(x@26@01 in xs@4@01 && i@5@01 > 0)]
(assert (not (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0)))
  (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@26@01 $Ref)) (!
  (and
    (or (Seq_contains xs@4@01 x@26@01) (not (Seq_contains xs@4@01 x@26@01)))
    (or
      (not (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0)))
      (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))))
  :pattern ((Seq_contains xs@4@01 x@26@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@21@9@21@87-aux|)))
(assert (forall ((x@26@01 $Ref)) (!
  (and
    (or (Seq_contains xs@4@01 x@26@01) (not (Seq_contains xs@4@01 x@26@01)))
    (or
      (not (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0)))
      (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))))
  :pattern ((Seq_contains_trigger xs@4@01 x@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@21@9@21@87-aux|)))
(push) ; 3
(assert (not (forall ((x@26@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) x@26@01) 0))
  :pattern ((Seq_contains xs@4@01 x@26@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@26@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@21@9@21@87|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@26@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@4@01 x@26@01) (> i@5@01 0))
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) x@26@01) 0))
  :pattern ((Seq_contains xs@4@01 x@26@01))
  :pattern ((Seq_contains_trigger xs@4@01 x@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@21@9@21@87|)))
; [exec]
; assert c == 2
; [eval] c == 2
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const r@27@01 $Ref)
(declare-const xs@28@01 Seq<$Ref>)
(declare-const i@29@01 Int)
(declare-const r@30@01 $Ref)
(declare-const xs@31@01 Seq<$Ref>)
(declare-const i@32@01 Int)
(push) ; 1
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(assert (= ($Snap.first $t@33@01) $Snap.unit))
; [eval] !((r in xs))
; [eval] (r in xs)
(assert (not (Seq_contains xs@31@01 r@30@01)))
(declare-const sm@34@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@34@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@33@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@35@01 Int)
(declare-const sm@36@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@36@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))
  $t@35@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(declare-const x@38@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@31@01 x@38@01))
(pop) ; 3
(declare-fun inv@39@01 ($Ref Int) $Ref)
(declare-fun img@40@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@38@01 $Ref) (x2@38@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@31@01 x1@38@01)
      (Seq_contains xs@31@01 x2@38@01)
      (= x1@38@01 x2@38@01))
    (= x1@38@01 x2@38@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (Seq_contains xs@31@01 x@38@01)
    (and (= (inv@39@01 x@38@01 i@32@01) x@38@01) (img@40@01 x@38@01 i@32@01)))
  :pattern ((Seq_contains xs@31@01 x@38@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@38@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@38@01))
  :pattern ((inv@39@01 x@38@01 i@32@01))
  :pattern ((img@40@01 x@38@01 i@32@01))
  :qid |quant-u-13|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@40@01 a b) (Seq_contains xs@31@01 (inv@39@01 a b)))
    (and (= (inv@39@01 a b) a) (= i@32@01 b)))
  :pattern ((inv@39@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@37@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@37@01))
    ($Snap.second ($Snap.second $t@37@01)))))
(declare-const x@41@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 6 | !(x@41@01 in xs@31@01) | live]
; [else-branch: 6 | x@41@01 in xs@31@01 | live]
(push) ; 5
; [then-branch: 6 | !(x@41@01 in xs@31@01)]
(assert (not (Seq_contains xs@31@01 x@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | x@41@01 in xs@31@01]
(assert (Seq_contains xs@31@01 x@41@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@31@01 x@41@01) (not (Seq_contains xs@31@01 x@41@01))))
(assert (and (Seq_contains xs@31@01 x@41@01) (> i@32@01 0)))
(pop) ; 3
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@41@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@41@01) (> i@32@01 0))
    (or (Seq_contains xs@31@01 x@41@01) (not (Seq_contains xs@31@01 x@41@01))))
  :pattern ((Seq_contains xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((inv@42@01 x@41@01))
  :pattern ((img@43@01 x@41@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@41@01 $Ref) (x2@41@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@31@01 x1@41@01) (> i@32@01 0))
      (and (Seq_contains xs@31@01 x2@41@01) (> i@32@01 0))
      (= x1@41@01 x2@41@01))
    (= x1@41@01 x2@41@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@41@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@41@01) (> i@32@01 0))
    (and (= (inv@42@01 x@41@01) x@41@01) (img@43@01 x@41@01)))
  :pattern ((Seq_contains xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((inv@42@01 x@41@01))
  :pattern ((img@43@01 x@41@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@43@01 r) (and (Seq_contains xs@31@01 (inv@42@01 r)) (> i@32@01 0)))
    (= (inv@42@01 r) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@41@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@41@01) (> i@32@01 0))
    (not (= x@41@01 $Ref.null)))
  :pattern ((Seq_contains xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@41@01))
  :pattern ((inv@42@01 x@41@01))
  :pattern ((img@43@01 x@41@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@37@01)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@44@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 7 | !(x@44@01 in xs@31@01) | live]
; [else-branch: 7 | x@44@01 in xs@31@01 | live]
(push) ; 5
; [then-branch: 7 | !(x@44@01 in xs@31@01)]
(assert (not (Seq_contains xs@31@01 x@44@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | x@44@01 in xs@31@01]
(assert (Seq_contains xs@31@01 x@44@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@31@01 x@44@01) (not (Seq_contains xs@31@01 x@44@01))))
(push) ; 4
; [then-branch: 8 | x@44@01 in xs@31@01 && i@32@01 > 0 | live]
; [else-branch: 8 | !(x@44@01 in xs@31@01 && i@32@01 > 0) | live]
(push) ; 5
; [then-branch: 8 | x@44@01 in xs@31@01 && i@32@01 > 0]
(assert (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@43@01 x@44@01)
  (and (Seq_contains xs@31@01 (inv@42@01 x@44@01)) (> i@32@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(x@44@01 in xs@31@01 && i@32@01 > 0)]
(assert (not (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0)))
  (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@44@01 $Ref)) (!
  (and
    (or (Seq_contains xs@31@01 x@44@01) (not (Seq_contains xs@31@01 x@44@01)))
    (or
      (not (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0)))
      (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0))))
  :pattern ((Seq_contains xs@31@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@33@9@33@87-aux|)))
(assert (forall ((x@44@01 $Ref)) (!
  (and
    (or (Seq_contains xs@31@01 x@44@01) (not (Seq_contains xs@31@01 x@44@01)))
    (or
      (not (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0)))
      (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0))))
  :pattern ((Seq_contains_trigger xs@31@01 x@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@33@9@33@87-aux|)))
(assert (forall ((x@44@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@44@01) (> i@32@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@37@01))) x@44@01)
      0))
  :pattern ((Seq_contains xs@31@01 x@44@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@33@9@33@87|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p2(r, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@30@01) (= b i@32@01))
    ($Perm.min
      (ite (and (= a r@30@01) (= b i@32@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@46@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@30@01) (= b i@32@01))
    ($Perm.min
      (ite
        (and (img@40@01 a b) (Seq_contains xs@31@01 (inv@39@01 a b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@45@01 a b)))
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
(assert (not (= (- $Perm.Write (pTaken@45@01 r@30@01 i@32@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@30@01) (= b i@32@01))
    (= (- $Perm.Write (pTaken@45@01 a b)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $PSF<p2>)
(declare-const s@48@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@30@01)
        ($SortWrappers.IntTo$Snap i@32@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01)))
    ($PSF.lookup_p2 (as sm@34@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01))))))
(assert (=>
  (and
    (img@40@01 r@30@01 i@32@01)
    (Seq_contains xs@31@01 (inv@39@01 r@30@01 i@32@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@30@01)
          ($SortWrappers.IntTo$Snap i@32@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@30@01)
        ($SortWrappers.IntTo$Snap i@32@01)))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@37@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@30@01)
        ($SortWrappers.IntTo$Snap i@32@01)))))))
(assert (not (= r@30@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@30@01)
  ($SortWrappers.IntTo$Snap i@32@01)))) r@30@01 i@32@01))
; [exec]
; fold acc(p2(r, i), write)
(declare-const sm@49@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@49@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))
  ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@50@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@31@01 x@50@01))
(pop) ; 3
(declare-fun inv@51@01 ($Ref Int) $Ref)
(declare-fun img@52@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@50@01 $Ref) (x2@50@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@31@01 x1@50@01)
      (Seq_contains xs@31@01 x2@50@01)
      (= x1@50@01 x2@50@01))
    (= x1@50@01 x2@50@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@50@01 $Ref)) (!
  (=>
    (Seq_contains xs@31@01 x@50@01)
    (and (= (inv@51@01 x@50@01 i@32@01) x@50@01) (img@52@01 x@50@01 i@32@01)))
  :pattern ((Seq_contains xs@31@01 x@50@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@50@01))
  :pattern ((inv@51@01 x@50@01 i@32@01))
  :pattern ((img@52@01 x@50@01 i@32@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@52@01 a b) (Seq_contains xs@31@01 (inv@51@01 a b)))
    (and (= (inv@51@01 a b) a) (= i@32@01 b)))
  :pattern ((inv@51@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@31@01 (inv@51@01 a b))
      (img@52@01 a b)
      (and (= a (inv@51@01 a b)) (= b i@32@01)))
    ($Perm.min
      (ite
        (and (img@40@01 a b) (Seq_contains xs@31@01 (inv@39@01 a b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@54@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@31@01 (inv@51@01 a b))
      (img@52@01 a b)
      (and (= a (inv@51@01 a b)) (= b i@32@01)))
    ($Perm.min
      (ite (and (= a r@30@01) (= b i@32@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@53@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@40@01 a b) (Seq_contains xs@31@01 (inv@39@01 a b)))
        $Perm.Write
        $Perm.No)
      (pTaken@53@01 a b))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (Seq_contains xs@31@01 (inv@51@01 a b))
      (img@52@01 a b)
      (and (= a (inv@51@01 a b)) (= b i@32@01)))
    (= (- $Perm.Write (pTaken@53@01 a b)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $PSF<p2>)
(declare-const s@56@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@56@01 $Snap)) (!
  (and
    (=>
      (Set_in s@56@01 ($PSF.domain_p2 (as sm@55@01  $PSF<p2>)))
      (and
        (Seq_contains
          xs@31@01
          (inv@51@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
        (img@52@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))))
    (=>
      (and
        (Seq_contains
          xs@31@01
          (inv@51@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
        (img@52@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (Set_in s@56@01 ($PSF.domain_p2 (as sm@55@01  $PSF<p2>)))))
  :pattern ((Set_in s@56@01 ($PSF.domain_p2 (as sm@55@01  $PSF<p2>))))
  :qid |qp.psmDomDef6|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@31@01
          (inv@51@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
        (img@52@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) r@30@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@56@01)) i@32@01)))
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@55@01  $PSF<p2>) s@56@01)
        ($PSF.lookup_p2 (as sm@49@01  $PSF<p2>) s@56@01))))
  :pattern (($PSF.lookup_p2 (as sm@55@01  $PSF<p2>) s@56@01))
  :pattern (($PSF.lookup_p2 (as sm@49@01  $PSF<p2>) s@56@01))
  :qid |qp.psmValDef4|)))
(assert (forall ((s@56@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@31@01
          (inv@51@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
        (img@52@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))
      (and
        (img@40@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01)))
        (Seq_contains
          xs@31@01
          (inv@39@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@56@01)) ($SortWrappers.$SnapToInt ($Snap.second s@56@01))))))
    (and
      (not (= s@56@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@55@01  $PSF<p2>) s@56@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@37@01)) s@56@01))))
  :pattern (($PSF.lookup_p2 (as sm@55@01  $PSF<p2>) s@56@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@37@01)) s@56@01))
  :qid |qp.psmValDef5|)))
(declare-const x@57@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 9 | !(x@57@01 in xs@31@01) | live]
; [else-branch: 9 | x@57@01 in xs@31@01 | live]
(push) ; 5
; [then-branch: 9 | !(x@57@01 in xs@31@01)]
(assert (not (Seq_contains xs@31@01 x@57@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | x@57@01 in xs@31@01]
(assert (Seq_contains xs@31@01 x@57@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@31@01 x@57@01) (not (Seq_contains xs@31@01 x@57@01))))
(assert (and (Seq_contains xs@31@01 x@57@01) (> i@32@01 0)))
(pop) ; 3
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@57@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@57@01) (> i@32@01 0))
    (or (Seq_contains xs@31@01 x@57@01) (not (Seq_contains xs@31@01 x@57@01))))
  :pattern ((Seq_contains xs@31@01 x@57@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@57@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@57@01))
  :pattern ((inv@58@01 x@57@01))
  :pattern ((img@59@01 x@57@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@57@01 $Ref) (x2@57@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@31@01 x1@57@01) (> i@32@01 0))
      (and (Seq_contains xs@31@01 x2@57@01) (> i@32@01 0))
      (= x1@57@01 x2@57@01))
    (= x1@57@01 x2@57@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@57@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@57@01) (> i@32@01 0))
    (and (= (inv@58@01 x@57@01) x@57@01) (img@59@01 x@57@01)))
  :pattern ((Seq_contains xs@31@01 x@57@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@57@01))
  :pattern ((inv@58@01 x@57@01))
  :pattern ((img@59@01 x@57@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@59@01 r) (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0)))
    (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0))
      (img@59@01 r)
      (= r (inv@58@01 r)))
    ($Perm.min
      (ite
        (and
          (img@43@01 r)
          (and (Seq_contains xs@31@01 (inv@42@01 r)) (> i@32@01 0)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@43@01 r)
          (and (Seq_contains xs@31@01 (inv@42@01 r)) (> i@32@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@60@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0))
      (img@59@01 r)
      (= r (inv@58@01 r)))
    (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@61@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@61@01  $FVF<f>)))
      (and
        (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0))
        (img@59@01 r)))
    (=>
      (and
        (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0))
        (img@59@01 r))
      (Set_in r ($FVF.domain_f (as sm@61@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@61@01  $FVF<f>))))
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (Seq_contains xs@31@01 (inv@58@01 r)) (> i@32@01 0))
        (img@59@01 r))
      (and
        (img@43@01 r)
        (and (Seq_contains xs@31@01 (inv@42@01 r)) (> i@32@01 0))))
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@37@01))) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@37@01))) r))
  :qid |qp.fvfValDef7|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@62@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 10 | !(x@62@01 in xs@31@01) | live]
; [else-branch: 10 | x@62@01 in xs@31@01 | live]
(push) ; 5
; [then-branch: 10 | !(x@62@01 in xs@31@01)]
(assert (not (Seq_contains xs@31@01 x@62@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | x@62@01 in xs@31@01]
(assert (Seq_contains xs@31@01 x@62@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@31@01 x@62@01) (not (Seq_contains xs@31@01 x@62@01))))
(push) ; 4
; [then-branch: 11 | x@62@01 in xs@31@01 && i@32@01 > 0 | live]
; [else-branch: 11 | !(x@62@01 in xs@31@01 && i@32@01 > 0) | live]
(push) ; 5
; [then-branch: 11 | x@62@01 in xs@31@01 && i@32@01 > 0]
(assert (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@43@01 x@62@01)
  (and (Seq_contains xs@31@01 (inv@42@01 x@62@01)) (> i@32@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(x@62@01 in xs@31@01 && i@32@01 > 0)]
(assert (not (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0)))
  (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@62@01 $Ref)) (!
  (and
    (or (Seq_contains xs@31@01 x@62@01) (not (Seq_contains xs@31@01 x@62@01)))
    (or
      (not (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0)))
      (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))))
  :pattern ((Seq_contains xs@31@01 x@62@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@36@9@36@87-aux|)))
(assert (forall ((x@62@01 $Ref)) (!
  (and
    (or (Seq_contains xs@31@01 x@62@01) (not (Seq_contains xs@31@01 x@62@01)))
    (or
      (not (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0)))
      (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))))
  :pattern ((Seq_contains_trigger xs@31@01 x@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@36@9@36@87-aux|)))
(push) ; 3
(assert (not (forall ((x@62@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@37@01))) x@62@01)
      0))
  :pattern ((Seq_contains xs@31@01 x@62@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@62@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@36@9@36@87|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@62@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@31@01 x@62@01) (> i@32@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@37@01))) x@62@01)
      0))
  :pattern ((Seq_contains xs@31@01 x@62@01))
  :pattern ((Seq_contains_trigger xs@31@01 x@62@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@36@9@36@87|)))
; [exec]
; unfold acc(p2(r, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@30@01) (= b i@32@01))
    ($Perm.min
      (ite (and (= a r@30@01) (= b i@32@01)) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@63@01 r@30@01 i@32@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@30@01) (= b i@32@01))
    (= (- $Perm.Write (pTaken@63@01 a b)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@64@01 $PSF<p2>)
(declare-const s@65@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@30@01)
        ($SortWrappers.IntTo$Snap i@32@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01)))
    ($PSF.lookup_p2 (as sm@49@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@30@01)
  ($SortWrappers.IntTo$Snap i@32@01)))) r@30@01 i@32@01))
; [exec]
; fold acc(p2(r, i), write)
(declare-const sm@66@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@66@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))
  ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@30@01)
    ($SortWrappers.IntTo$Snap i@32@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@30@01) (= b i@32@01))
    ($Perm.min
      (ite (and (= a r@30@01) (= b i@32@01)) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@67@01 r@30@01 i@32@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@30@01) (= b i@32@01))
    (= (- $Perm.Write (pTaken@67@01 a b)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $PSF<p2>)
(declare-const s@69@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@30@01)
        ($SortWrappers.IntTo$Snap i@32@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@68@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01)))
    ($PSF.lookup_p2 (as sm@66@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@30@01)
      ($SortWrappers.IntTo$Snap i@32@01))))))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const r@70@01 $Ref)
(declare-const xs@71@01 Seq<$Ref>)
(declare-const i@72@01 Int)
(declare-const r@73@01 $Ref)
(declare-const xs@74@01 Seq<$Ref>)
(declare-const i@75@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] !((r in xs))
; [eval] (r in xs)
(assert (not (Seq_contains xs@74@01 r@73@01)))
; [eval] -1
(declare-const sm@77@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@77@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($SortWrappers.$SnapToInt ($Snap.second $t@76@01))))
(assert (<= $Perm.No (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] -1
(declare-const $t@78@01 Int)
(declare-const sm@79@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@79@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  $t@78@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 ($Snap.combine ($Snap.first $t@80@01) ($Snap.second $t@80@01))))
(declare-const x@81@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@74@01 x@81@01))
(pop) ; 3
(declare-fun inv@82@01 ($Ref Int) $Ref)
(declare-fun img@83@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@81@01 $Ref) (x2@81@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@74@01 x1@81@01)
      (Seq_contains xs@74@01 x2@81@01)
      (= x1@81@01 x2@81@01))
    (= x1@81@01 x2@81@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@81@01 $Ref)) (!
  (=>
    (Seq_contains xs@74@01 x@81@01)
    (and (= (inv@82@01 x@81@01 i@75@01) x@81@01) (img@83@01 x@81@01 i@75@01)))
  :pattern ((Seq_contains xs@74@01 x@81@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@81@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@81@01))
  :pattern ((inv@82@01 x@81@01 i@75@01))
  :pattern ((img@83@01 x@81@01 i@75@01))
  :qid |quant-u-34|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@83@01 a b) (Seq_contains xs@74@01 (inv@82@01 a b)))
    (and (= (inv@82@01 a b) a) (= i@75@01 b)))
  :pattern ((inv@82@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@80@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@80@01))
    ($Snap.second ($Snap.second $t@80@01)))))
(declare-const x@84@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 12 | !(x@84@01 in xs@74@01) | live]
; [else-branch: 12 | x@84@01 in xs@74@01 | live]
(push) ; 5
; [then-branch: 12 | !(x@84@01 in xs@74@01)]
(assert (not (Seq_contains xs@74@01 x@84@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | x@84@01 in xs@74@01]
(assert (Seq_contains xs@74@01 x@84@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@74@01 x@84@01) (not (Seq_contains xs@74@01 x@84@01))))
(assert (and (Seq_contains xs@74@01 x@84@01) (> i@75@01 0)))
(pop) ; 3
(declare-fun inv@85@01 ($Ref) $Ref)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@84@01) (> i@75@01 0))
    (or (Seq_contains xs@74@01 x@84@01) (not (Seq_contains xs@74@01 x@84@01))))
  :pattern ((Seq_contains xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@84@01 $Ref) (x2@84@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@74@01 x1@84@01) (> i@75@01 0))
      (and (Seq_contains xs@74@01 x2@84@01) (> i@75@01 0))
      (= x1@84@01 x2@84@01))
    (= x1@84@01 x2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@84@01) (> i@75@01 0))
    (and (= (inv@85@01 x@84@01) x@84@01) (img@86@01 x@84@01)))
  :pattern ((Seq_contains xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@86@01 r) (and (Seq_contains xs@74@01 (inv@85@01 r)) (> i@75@01 0)))
    (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@84@01) (> i@75@01 0))
    (not (= x@84@01 $Ref.null)))
  :pattern ((Seq_contains xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@84@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@80@01)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@87@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 13 | !(x@87@01 in xs@74@01) | live]
; [else-branch: 13 | x@87@01 in xs@74@01 | live]
(push) ; 5
; [then-branch: 13 | !(x@87@01 in xs@74@01)]
(assert (not (Seq_contains xs@74@01 x@87@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | x@87@01 in xs@74@01]
(assert (Seq_contains xs@74@01 x@87@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@74@01 x@87@01) (not (Seq_contains xs@74@01 x@87@01))))
(push) ; 4
; [then-branch: 14 | x@87@01 in xs@74@01 && i@75@01 > 0 | live]
; [else-branch: 14 | !(x@87@01 in xs@74@01 && i@75@01 > 0) | live]
(push) ; 5
; [then-branch: 14 | x@87@01 in xs@74@01 && i@75@01 > 0]
(assert (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@86@01 x@87@01)
  (and (Seq_contains xs@74@01 (inv@85@01 x@87@01)) (> i@75@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(x@87@01 in xs@74@01 && i@75@01 > 0)]
(assert (not (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0)))
  (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@87@01 $Ref)) (!
  (and
    (or (Seq_contains xs@74@01 x@87@01) (not (Seq_contains xs@74@01 x@87@01)))
    (or
      (not (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0)))
      (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0))))
  :pattern ((Seq_contains xs@74@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@87@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@48@9@48@87-aux|)))
(assert (forall ((x@87@01 $Ref)) (!
  (and
    (or (Seq_contains xs@74@01 x@87@01) (not (Seq_contains xs@74@01 x@87@01)))
    (or
      (not (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0)))
      (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0))))
  :pattern ((Seq_contains_trigger xs@74@01 x@87@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@48@9@48@87-aux|)))
(assert (forall ((x@87@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@87@01) (> i@75@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@80@01))) x@87@01)
      0))
  :pattern ((Seq_contains xs@74@01 x@87@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@87@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@48@9@48@87|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p2(r, -1), write)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@73@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@73@01) (= b (- 0 1))) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@89@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@73@01) (= b (- 0 1)))
    ($Perm.min
      (ite
        (and (img@83@01 a b) (Seq_contains xs@74@01 (inv@82@01 a b)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@88@01 a b)))
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@88@01 r@73@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@73@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@88@01 a b)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@90@01 $PSF<p2>)
(declare-const s@91@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@73@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@90@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@77@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(assert (=>
  (and
    (img@83@01 r@73@01 (- 0 1))
    (Seq_contains xs@74@01 (inv@82@01 r@73@01 (- 0 1))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@73@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@90@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@80@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(assert (not (= r@73@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@90@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@73@01)
  ($SortWrappers.IntTo$Snap (- 0 1))))) r@73@01 (- 0 1)))
; [exec]
; fold acc(p2(r, -1), write)
; [eval] -1
(declare-const sm@92@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@92@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($PSF.lookup_p2 (as sm@90@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@93@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@74@01 x@93@01))
(pop) ; 3
(declare-fun inv@94@01 ($Ref Int) $Ref)
(declare-fun img@95@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@93@01 $Ref) (x2@93@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@74@01 x1@93@01)
      (Seq_contains xs@74@01 x2@93@01)
      (= x1@93@01 x2@93@01))
    (= x1@93@01 x2@93@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@93@01 $Ref)) (!
  (=>
    (Seq_contains xs@74@01 x@93@01)
    (and (= (inv@94@01 x@93@01 i@75@01) x@93@01) (img@95@01 x@93@01 i@75@01)))
  :pattern ((Seq_contains xs@74@01 x@93@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@93@01))
  :pattern ((inv@94@01 x@93@01 i@75@01))
  :pattern ((img@95@01 x@93@01 i@75@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@95@01 a b) (Seq_contains xs@74@01 (inv@94@01 a b)))
    (and (= (inv@94@01 a b) a) (= i@75@01 b)))
  :pattern ((inv@94@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@96@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@74@01 (inv@94@01 a b))
      (img@95@01 a b)
      (and (= a (inv@94@01 a b)) (= b i@75@01)))
    ($Perm.min
      (ite
        (and (img@83@01 a b) (Seq_contains xs@74@01 (inv@82@01 a b)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@97@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@74@01 (inv@94@01 a b))
      (img@95@01 a b)
      (and (= a (inv@94@01 a b)) (= b i@75@01)))
    ($Perm.min
      (ite (and (= a r@73@01) (= b (- 0 1))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@96@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@83@01 a b) (Seq_contains xs@74@01 (inv@82@01 a b)))
        $Perm.Write
        $Perm.No)
      (pTaken@96@01 a b))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (Seq_contains xs@74@01 (inv@94@01 a b))
      (img@95@01 a b)
      (and (= a (inv@94@01 a b)) (= b i@75@01)))
    (= (- $Perm.Write (pTaken@96@01 a b)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@98@01 $PSF<p2>)
(declare-const s@99@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@99@01 $Snap)) (!
  (and
    (=>
      (Set_in s@99@01 ($PSF.domain_p2 (as sm@98@01  $PSF<p2>)))
      (and
        (Seq_contains
          xs@74@01
          (inv@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
        (img@95@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01)))))
    (=>
      (and
        (Seq_contains
          xs@74@01
          (inv@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
        (img@95@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
      (Set_in s@99@01 ($PSF.domain_p2 (as sm@98@01  $PSF<p2>)))))
  :pattern ((Set_in s@99@01 ($PSF.domain_p2 (as sm@98@01  $PSF<p2>))))
  :qid |qp.psmDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@99@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@74@01
          (inv@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
        (img@95@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) r@73@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@99@01)) (- 0 1))))
    (and
      (not (= s@99@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@98@01  $PSF<p2>) s@99@01)
        ($PSF.lookup_p2 (as sm@92@01  $PSF<p2>) s@99@01))))
  :pattern (($PSF.lookup_p2 (as sm@98@01  $PSF<p2>) s@99@01))
  :pattern (($PSF.lookup_p2 (as sm@92@01  $PSF<p2>) s@99@01))
  :qid |qp.psmValDef13|)))
(assert (forall ((s@99@01 $Snap)) (!
  (=>
    (and
      (and
        (Seq_contains
          xs@74@01
          (inv@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
        (img@95@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))
      (and
        (img@83@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01)))
        (Seq_contains
          xs@74@01
          (inv@82@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@99@01)) ($SortWrappers.$SnapToInt ($Snap.second s@99@01))))))
    (and
      (not (= s@99@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@98@01  $PSF<p2>) s@99@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@80@01)) s@99@01))))
  :pattern (($PSF.lookup_p2 (as sm@98@01  $PSF<p2>) s@99@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@80@01)) s@99@01))
  :qid |qp.psmValDef14|)))
(declare-const x@100@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 15 | !(x@100@01 in xs@74@01) | live]
; [else-branch: 15 | x@100@01 in xs@74@01 | live]
(push) ; 5
; [then-branch: 15 | !(x@100@01 in xs@74@01)]
(assert (not (Seq_contains xs@74@01 x@100@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | x@100@01 in xs@74@01]
(assert (Seq_contains xs@74@01 x@100@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@74@01 x@100@01) (not (Seq_contains xs@74@01 x@100@01))))
(assert (and (Seq_contains xs@74@01 x@100@01) (> i@75@01 0)))
(pop) ; 3
(declare-fun inv@101@01 ($Ref) $Ref)
(declare-fun img@102@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@100@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@100@01) (> i@75@01 0))
    (or (Seq_contains xs@74@01 x@100@01) (not (Seq_contains xs@74@01 x@100@01))))
  :pattern ((Seq_contains xs@74@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@100@01))
  :pattern ((inv@101@01 x@100@01))
  :pattern ((img@102@01 x@100@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@100@01 $Ref) (x2@100@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@74@01 x1@100@01) (> i@75@01 0))
      (and (Seq_contains xs@74@01 x2@100@01) (> i@75@01 0))
      (= x1@100@01 x2@100@01))
    (= x1@100@01 x2@100@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@100@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@100@01) (> i@75@01 0))
    (and (= (inv@101@01 x@100@01) x@100@01) (img@102@01 x@100@01)))
  :pattern ((Seq_contains xs@74@01 x@100@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@100@01))
  :pattern ((inv@101@01 x@100@01))
  :pattern ((img@102@01 x@100@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@102@01 r)
      (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0)))
    (= (inv@101@01 r) r))
  :pattern ((inv@101@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    ($Perm.min
      (ite
        (and
          (img@86@01 r)
          (and (Seq_contains xs@74@01 (inv@85@01 r)) (> i@75@01 0)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@86@01 r)
          (and (Seq_contains xs@74@01 (inv@85@01 r)) (> i@75@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0))
      (img@102@01 r)
      (= r (inv@101@01 r)))
    (= (- $Perm.Write (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@104@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@104@01  $FVF<f>)))
      (and
        (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0))
        (img@102@01 r)))
    (=>
      (and
        (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0))
        (img@102@01 r))
      (Set_in r ($FVF.domain_f (as sm@104@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@104@01  $FVF<f>))))
  :qid |qp.fvfDomDef17|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (Seq_contains xs@74@01 (inv@101@01 r)) (> i@75@01 0))
        (img@102@01 r))
      (and
        (img@86@01 r)
        (and (Seq_contains xs@74@01 (inv@85@01 r)) (> i@75@01 0))))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@80@01))) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@80@01))) r))
  :qid |qp.fvfValDef16|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@105@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 16 | !(x@105@01 in xs@74@01) | live]
; [else-branch: 16 | x@105@01 in xs@74@01 | live]
(push) ; 5
; [then-branch: 16 | !(x@105@01 in xs@74@01)]
(assert (not (Seq_contains xs@74@01 x@105@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | x@105@01 in xs@74@01]
(assert (Seq_contains xs@74@01 x@105@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@74@01 x@105@01) (not (Seq_contains xs@74@01 x@105@01))))
(push) ; 4
; [then-branch: 17 | x@105@01 in xs@74@01 && i@75@01 > 0 | live]
; [else-branch: 17 | !(x@105@01 in xs@74@01 && i@75@01 > 0) | live]
(push) ; 5
; [then-branch: 17 | x@105@01 in xs@74@01 && i@75@01 > 0]
(assert (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@86@01 x@105@01)
  (and (Seq_contains xs@74@01 (inv@85@01 x@105@01)) (> i@75@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(x@105@01 in xs@74@01 && i@75@01 > 0)]
(assert (not (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0)))
  (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@105@01 $Ref)) (!
  (and
    (or (Seq_contains xs@74@01 x@105@01) (not (Seq_contains xs@74@01 x@105@01)))
    (or
      (not (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0)))
      (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))))
  :pattern ((Seq_contains xs@74@01 x@105@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@51@9@51@87-aux|)))
(assert (forall ((x@105@01 $Ref)) (!
  (and
    (or (Seq_contains xs@74@01 x@105@01) (not (Seq_contains xs@74@01 x@105@01)))
    (or
      (not (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0)))
      (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))))
  :pattern ((Seq_contains_trigger xs@74@01 x@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@51@9@51@87-aux|)))
(push) ; 3
(assert (not (forall ((x@105@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@80@01))) x@105@01)
      0))
  :pattern ((Seq_contains xs@74@01 x@105@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@105@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@51@9@51@87|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@105@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@74@01 x@105@01) (> i@75@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@80@01))) x@105@01)
      0))
  :pattern ((Seq_contains xs@74@01 x@105@01))
  :pattern ((Seq_contains_trigger xs@74@01 x@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@51@9@51@87|)))
; [exec]
; unfold acc(p2(r, -1), write)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@106@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@73@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@73@01) (= b (- 0 1))) $Perm.Write $Perm.No)
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@106@01 r@73@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@73@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@106@01 a b)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@107@01 $PSF<p2>)
(declare-const s@108@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@73@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@92@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@73@01)
  ($SortWrappers.IntTo$Snap (- 0 1))))) r@73@01 (- 0 1)))
; [exec]
; fold acc(p2(r, -1), write)
; [eval] -1
(declare-const sm@109@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@109@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@73@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))))
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@110@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@73@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@73@01) (= b (- 0 1))) $Perm.Write $Perm.No)
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@110@01 r@73@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@73@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@110@01 a b)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@111@01 $PSF<p2>)
(declare-const s@112@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@73@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@111@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@109@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@73@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const r@113@01 $Ref)
(declare-const xs@114@01 Seq<$Ref>)
(declare-const i@115@01 Int)
(declare-const r@116@01 $Ref)
(declare-const xs@117@01 Seq<$Ref>)
(declare-const i@118@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 ($Snap.combine ($Snap.first $t@119@01) ($Snap.second $t@119@01))))
(assert (=
  ($Snap.second $t@119@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@119@01))
    ($Snap.second ($Snap.second $t@119@01)))))
(assert (= ($Snap.first ($Snap.second $t@119@01)) $Snap.unit))
; [eval] (r in xs)
(assert (Seq_contains xs@117@01 r@116@01))
(assert (= ($Snap.second ($Snap.second $t@119@01)) $Snap.unit))
; [eval] i > 0
(assert (> i@118@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@120@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const $t@121@01 $Snap)
(assert (= $t@121@01 ($Snap.combine ($Snap.first $t@121@01) ($Snap.second $t@121@01))))
(declare-const x@122@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@117@01 x@122@01))
(pop) ; 3
(declare-fun inv@123@01 ($Ref Int) $Ref)
(declare-fun img@124@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@122@01 $Ref) (x2@122@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@117@01 x1@122@01)
      (Seq_contains xs@117@01 x2@122@01)
      (= x1@122@01 x2@122@01))
    (= x1@122@01 x2@122@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@122@01 $Ref)) (!
  (=>
    (Seq_contains xs@117@01 x@122@01)
    (and
      (= (inv@123@01 x@122@01 i@118@01) x@122@01)
      (img@124@01 x@122@01 i@118@01)))
  :pattern ((Seq_contains xs@117@01 x@122@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@122@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@122@01))
  :pattern ((inv@123@01 x@122@01 i@118@01))
  :pattern ((img@124@01 x@122@01 i@118@01))
  :qid |quant-u-55|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@124@01 a b) (Seq_contains xs@117@01 (inv@123@01 a b)))
    (and (= (inv@123@01 a b) a) (= i@118@01 b)))
  :pattern ((inv@123@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@121@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@121@01))
    ($Snap.second ($Snap.second $t@121@01)))))
(declare-const x@125@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 18 | !(x@125@01 in xs@117@01) | live]
; [else-branch: 18 | x@125@01 in xs@117@01 | live]
(push) ; 5
; [then-branch: 18 | !(x@125@01 in xs@117@01)]
(assert (not (Seq_contains xs@117@01 x@125@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | x@125@01 in xs@117@01]
(assert (Seq_contains xs@117@01 x@125@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@117@01 x@125@01) (not (Seq_contains xs@117@01 x@125@01))))
(assert (and (Seq_contains xs@117@01 x@125@01) (> i@118@01 0)))
(pop) ; 3
(declare-fun inv@126@01 ($Ref) $Ref)
(declare-fun img@127@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@125@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@125@01) (> i@118@01 0))
    (or
      (Seq_contains xs@117@01 x@125@01)
      (not (Seq_contains xs@117@01 x@125@01))))
  :pattern ((Seq_contains xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((inv@126@01 x@125@01))
  :pattern ((img@127@01 x@125@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@125@01 $Ref) (x2@125@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@117@01 x1@125@01) (> i@118@01 0))
      (and (Seq_contains xs@117@01 x2@125@01) (> i@118@01 0))
      (= x1@125@01 x2@125@01))
    (= x1@125@01 x2@125@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@125@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@125@01) (> i@118@01 0))
    (and (= (inv@126@01 x@125@01) x@125@01) (img@127@01 x@125@01)))
  :pattern ((Seq_contains xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((inv@126@01 x@125@01))
  :pattern ((img@127@01 x@125@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@01 r)
      (and (Seq_contains xs@117@01 (inv@126@01 r)) (> i@118@01 0)))
    (= (inv@126@01 r) r))
  :pattern ((inv@126@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@125@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@125@01) (> i@118@01 0))
    (not (= x@125@01 $Ref.null)))
  :pattern ((Seq_contains xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@125@01))
  :pattern ((inv@126@01 x@125@01))
  :pattern ((img@127@01 x@125@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@121@01)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@128@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 19 | !(x@128@01 in xs@117@01) | live]
; [else-branch: 19 | x@128@01 in xs@117@01 | live]
(push) ; 5
; [then-branch: 19 | !(x@128@01 in xs@117@01)]
(assert (not (Seq_contains xs@117@01 x@128@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | x@128@01 in xs@117@01]
(assert (Seq_contains xs@117@01 x@128@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@117@01 x@128@01) (not (Seq_contains xs@117@01 x@128@01))))
(push) ; 4
; [then-branch: 20 | x@128@01 in xs@117@01 && i@118@01 > 0 | live]
; [else-branch: 20 | !(x@128@01 in xs@117@01 && i@118@01 > 0) | live]
(push) ; 5
; [then-branch: 20 | x@128@01 in xs@117@01 && i@118@01 > 0]
(assert (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@127@01 x@128@01)
  (and (Seq_contains xs@117@01 (inv@126@01 x@128@01)) (> i@118@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(x@128@01 in xs@117@01 && i@118@01 > 0)]
(assert (not (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0)))
  (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@128@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@117@01 x@128@01)
      (not (Seq_contains xs@117@01 x@128@01)))
    (or
      (not (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0)))
      (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0))))
  :pattern ((Seq_contains xs@117@01 x@128@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@128@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@64@10@64@88-aux|)))
(assert (forall ((x@128@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@117@01 x@128@01)
      (not (Seq_contains xs@117@01 x@128@01)))
    (or
      (not (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0)))
      (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0))))
  :pattern ((Seq_contains_trigger xs@117@01 x@128@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@64@10@64@88-aux|)))
(assert (forall ((x@128@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@128@01) (> i@118@01 0))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@121@01))) x@128@01)
      0))
  :pattern ((Seq_contains xs@117@01 x@128@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@128@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@64@10@64@88|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p1(r), write)
(assert (not (= r@116@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p1%trigger ($Snap.first $t@119@01) r@116@01))
; [exec]
; fold acc(p1(r), write)
; [exec]
; assert r.f > 0
; [eval] r.f > 0
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@127@01 r@116@01)
  (and (Seq_contains xs@117@01 (inv@126@01 r@116@01)) (> i@118@01 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@121@01))) r@116@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@121@01))) r@116@01)
  0))
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@129@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@117@01 x@129@01))
(pop) ; 3
(declare-fun inv@130@01 ($Ref Int) $Ref)
(declare-fun img@131@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@129@01 $Ref) (x2@129@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@117@01 x1@129@01)
      (Seq_contains xs@117@01 x2@129@01)
      (= x1@129@01 x2@129@01))
    (= x1@129@01 x2@129@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@129@01 $Ref)) (!
  (=>
    (Seq_contains xs@117@01 x@129@01)
    (and
      (= (inv@130@01 x@129@01 i@118@01) x@129@01)
      (img@131@01 x@129@01 i@118@01)))
  :pattern ((Seq_contains xs@117@01 x@129@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@129@01))
  :pattern ((inv@130@01 x@129@01 i@118@01))
  :pattern ((img@131@01 x@129@01 i@118@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@131@01 a b) (Seq_contains xs@117@01 (inv@130@01 a b)))
    (and (= (inv@130@01 a b) a) (= i@118@01 b)))
  :pattern ((inv@130@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@132@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@117@01 (inv@130@01 a b))
      (img@131@01 a b)
      (and (= a (inv@130@01 a b)) (= b i@118@01)))
    ($Perm.min
      (ite
        (and (img@124@01 a b) (Seq_contains xs@117@01 (inv@123@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@124@01 a b) (Seq_contains xs@117@01 (inv@123@01 a b)))
        $Perm.Write
        $Perm.No)
      (pTaken@132@01 a b))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (Seq_contains xs@117@01 (inv@130@01 a b))
      (img@131@01 a b)
      (and (= a (inv@130@01 a b)) (= b i@118@01)))
    (= (- $Perm.Write (pTaken@132@01 a b)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@133@01 $PSF<p2>)
(declare-const s@134@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@134@01 $Snap)) (!
  (=>
    (and
      (img@124@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@134@01)) ($SortWrappers.$SnapToInt ($Snap.second s@134@01)))
      (Seq_contains
        xs@117@01
        (inv@123@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@134@01)) ($SortWrappers.$SnapToInt ($Snap.second s@134@01)))))
    (and
      (not (= s@134@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@133@01  $PSF<p2>) s@134@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@121@01)) s@134@01))))
  :pattern (($PSF.lookup_p2 (as sm@133@01  $PSF<p2>) s@134@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@121@01)) s@134@01))
  :qid |qp.psmValDef20|)))
(declare-const x@135@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 21 | !(x@135@01 in xs@117@01) | live]
; [else-branch: 21 | x@135@01 in xs@117@01 | live]
(push) ; 5
; [then-branch: 21 | !(x@135@01 in xs@117@01)]
(assert (not (Seq_contains xs@117@01 x@135@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | x@135@01 in xs@117@01]
(assert (Seq_contains xs@117@01 x@135@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@117@01 x@135@01) (not (Seq_contains xs@117@01 x@135@01))))
(assert (and (Seq_contains xs@117@01 x@135@01) (> i@118@01 0)))
(pop) ; 3
(declare-fun inv@136@01 ($Ref) $Ref)
(declare-fun img@137@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@135@01) (> i@118@01 0))
    (or
      (Seq_contains xs@117@01 x@135@01)
      (not (Seq_contains xs@117@01 x@135@01))))
  :pattern ((Seq_contains xs@117@01 x@135@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@135@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@135@01))
  :pattern ((inv@136@01 x@135@01))
  :pattern ((img@137@01 x@135@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@135@01 $Ref) (x2@135@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@117@01 x1@135@01) (> i@118@01 0))
      (and (Seq_contains xs@117@01 x2@135@01) (> i@118@01 0))
      (= x1@135@01 x2@135@01))
    (= x1@135@01 x2@135@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@135@01) (> i@118@01 0))
    (and (= (inv@136@01 x@135@01) x@135@01) (img@137@01 x@135@01)))
  :pattern ((Seq_contains xs@117@01 x@135@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@135@01))
  :pattern ((inv@136@01 x@135@01))
  :pattern ((img@137@01 x@135@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@01 r)
      (and (Seq_contains xs@117@01 (inv@136@01 r)) (> i@118@01 0)))
    (= (inv@136@01 r) r))
  :pattern ((inv@136@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@117@01 (inv@136@01 r)) (> i@118@01 0))
      (img@137@01 r)
      (= r (inv@136@01 r)))
    ($Perm.min
      (ite
        (and
          (img@127@01 r)
          (and (Seq_contains xs@117@01 (inv@126@01 r)) (> i@118@01 0)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@127@01 r)
          (and (Seq_contains xs@117@01 (inv@126@01 r)) (> i@118@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@138@01 r))
    $Perm.No)
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@117@01 (inv@136@01 r)) (> i@118@01 0))
      (img@137@01 r)
      (= r (inv@136@01 r)))
    (= (- $Perm.Write (pTaken@138@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@139@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@01 r)
      (and (Seq_contains xs@117@01 (inv@126@01 r)) (> i@118@01 0)))
    (=
      ($FVF.lookup_f (as sm@139@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@121@01))) r)))
  :pattern (($FVF.lookup_f (as sm@139@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@121@01))) r))
  :qid |qp.fvfValDef21|)))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@140@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 22 | !(x@140@01 in xs@117@01) | live]
; [else-branch: 22 | x@140@01 in xs@117@01 | live]
(push) ; 5
; [then-branch: 22 | !(x@140@01 in xs@117@01)]
(assert (not (Seq_contains xs@117@01 x@140@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | x@140@01 in xs@117@01]
(assert (Seq_contains xs@117@01 x@140@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@117@01 x@140@01) (not (Seq_contains xs@117@01 x@140@01))))
(push) ; 4
; [then-branch: 23 | x@140@01 in xs@117@01 && i@118@01 > 0 | live]
; [else-branch: 23 | !(x@140@01 in xs@117@01 && i@118@01 > 0) | live]
(push) ; 5
; [then-branch: 23 | x@140@01 in xs@117@01 && i@118@01 > 0]
(assert (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0)))
; [eval] x.f > 0
(push) ; 6
(assert (not (and
  (img@127@01 x@140@01)
  (and (Seq_contains xs@117@01 (inv@126@01 x@140@01)) (> i@118@01 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(x@140@01 in xs@117@01 && i@118@01 > 0)]
(assert (not (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0)))
  (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@140@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@117@01 x@140@01)
      (not (Seq_contains xs@117@01 x@140@01)))
    (or
      (not (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0)))
      (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))))
  :pattern ((Seq_contains xs@117@01 x@140@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@68@10@68@88-aux|)))
(assert (forall ((x@140@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@117@01 x@140@01)
      (not (Seq_contains xs@117@01 x@140@01)))
    (or
      (not (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0)))
      (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))))
  :pattern ((Seq_contains_trigger xs@117@01 x@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@68@10@68@88-aux|)))
(push) ; 3
(assert (not (forall ((x@140@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))
    (> ($FVF.lookup_f (as sm@139@01  $FVF<f>) x@140@01) 0))
  :pattern ((Seq_contains xs@117@01 x@140@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@140@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@68@10@68@88|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@140@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@117@01 x@140@01) (> i@118@01 0))
    (> ($FVF.lookup_f (as sm@139@01  $FVF<f>) x@140@01) 0))
  :pattern ((Seq_contains xs@117@01 x@140@01))
  :pattern ((Seq_contains_trigger xs@117@01 x@140@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@68@10@68@88|)))
; [exec]
; unfold acc(p1(r), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; fold acc(p1(r), write)
; [exec]
; assert r.f > 0
; [eval] r.f > 0
(declare-const sm@141@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@142@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@142@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@142@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@142@01  $FPM) r@116@01))))
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
; [eval] r.f > 0
(declare-const sm@143@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@144@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@144@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@144@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@144@01  $FPM) r@116@01))))
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
; [eval] r.f > 0
(declare-const sm@145@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@146@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@146@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@146@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@146@01  $FPM) r@116@01))))
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
; [eval] r.f > 0
(declare-const sm@147@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@148@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@148@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@148@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@148@01  $FPM) r@116@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const r@149@01 $Ref)
(declare-const r2@150@01 $Ref)
(declare-const xs@151@01 Seq<$Ref>)
(declare-const i@152@01 Int)
(declare-const r@153@01 $Ref)
(declare-const r2@154@01 $Ref)
(declare-const xs@155@01 Seq<$Ref>)
(declare-const i@156@01 Int)
(push) ; 1
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 ($Snap.combine ($Snap.first $t@157@01) ($Snap.second $t@157@01))))
(declare-const sm@158@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@158@01  $FVF<f>) r@153@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@157@01))))
(assert (not (= r@153@01 $Ref.null)))
(assert (=
  ($Snap.second $t@157@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@157@01))
    ($Snap.second ($Snap.second $t@157@01)))))
(declare-const sm@159@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@159@01  $FVF<f>) r2@154@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@157@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@154@01 r@153@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@154@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@157@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@157@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@157@01))))))
; [eval] r2 != null
; [eval] r != null
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const $t@160@01 $Snap)
(assert (= $t@160@01 ($Snap.combine ($Snap.first $t@160@01) ($Snap.second $t@160@01))))
(declare-const x@161@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@155@01 x@161@01))
(pop) ; 3
(declare-fun inv@162@01 ($Ref Int) $Ref)
(declare-fun img@163@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@161@01 $Ref) (x2@161@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@155@01 x1@161@01)
      (Seq_contains xs@155@01 x2@161@01)
      (= x1@161@01 x2@161@01))
    (= x1@161@01 x2@161@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@161@01 $Ref)) (!
  (=>
    (Seq_contains xs@155@01 x@161@01)
    (and
      (= (inv@162@01 x@161@01 i@156@01) x@161@01)
      (img@163@01 x@161@01 i@156@01)))
  :pattern ((Seq_contains xs@155@01 x@161@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@161@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@161@01))
  :pattern ((inv@162@01 x@161@01 i@156@01))
  :pattern ((img@163@01 x@161@01 i@156@01))
  :qid |quant-u-67|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@163@01 a b) (Seq_contains xs@155@01 (inv@162@01 a b)))
    (and (= (inv@162@01 a b) a) (= i@156@01 b)))
  :pattern ((inv@162@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@160@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@160@01))
    ($Snap.second ($Snap.second $t@160@01)))))
(declare-const x@164@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 24 | !(x@164@01 in xs@155@01) | live]
; [else-branch: 24 | x@164@01 in xs@155@01 | live]
(push) ; 5
; [then-branch: 24 | !(x@164@01 in xs@155@01)]
(assert (not (Seq_contains xs@155@01 x@164@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | x@164@01 in xs@155@01]
(assert (Seq_contains xs@155@01 x@164@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@155@01 x@164@01) (not (Seq_contains xs@155@01 x@164@01))))
(assert (and (Seq_contains xs@155@01 x@164@01) (> i@156@01 0)))
(pop) ; 3
(declare-fun inv@165@01 ($Ref) $Ref)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@164@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@164@01) (> i@156@01 0))
    (or
      (Seq_contains xs@155@01 x@164@01)
      (not (Seq_contains xs@155@01 x@164@01))))
  :pattern ((Seq_contains xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((inv@165@01 x@164@01))
  :pattern ((img@166@01 x@164@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@164@01 $Ref) (x2@164@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@155@01 x1@164@01) (> i@156@01 0))
      (and (Seq_contains xs@155@01 x2@164@01) (> i@156@01 0))
      (= x1@164@01 x2@164@01))
    (= x1@164@01 x2@164@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@164@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@164@01) (> i@156@01 0))
    (and (= (inv@165@01 x@164@01) x@164@01) (img@166@01 x@164@01)))
  :pattern ((Seq_contains xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((inv@165@01 x@164@01))
  :pattern ((img@166@01 x@164@01))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (= (inv@165@01 r) r))
  :pattern ((inv@165@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@164@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@164@01) (> i@156@01 0))
    (not (= x@164@01 $Ref.null)))
  :pattern ((Seq_contains xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@164@01))
  :pattern ((inv@165@01 x@164@01))
  :pattern ((img@166@01 x@164@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@160@01)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@167@01 $Ref)
(push) ; 3
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 25 | !(x@167@01 in xs@155@01) | live]
; [else-branch: 25 | x@167@01 in xs@155@01 | live]
(push) ; 5
; [then-branch: 25 | !(x@167@01 in xs@155@01)]
(assert (not (Seq_contains xs@155@01 x@167@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | x@167@01 in xs@155@01]
(assert (Seq_contains xs@155@01 x@167@01))
; [eval] i > 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@155@01 x@167@01) (not (Seq_contains xs@155@01 x@167@01))))
(push) ; 4
; [then-branch: 26 | x@167@01 in xs@155@01 && i@156@01 > 0 | live]
; [else-branch: 26 | !(x@167@01 in xs@155@01 && i@156@01 > 0) | live]
(push) ; 5
; [then-branch: 26 | x@167@01 in xs@155@01 && i@156@01 > 0]
(assert (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0)))
; [eval] x.f > 0
(declare-const sm@168@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@153@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef28|)))
(declare-const pm@169@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@169@01  $FPM) r)
    (+
      (+
        (ite (= r r@153@01) $Perm.Write $Perm.No)
        (ite (= r r2@154@01) $Perm.Write $Perm.No))
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@169@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@169@01  $FPM) x@167@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(x@167@01 in xs@155@01 && i@156@01 > 0)]
(assert (not (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@153@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@169@01  $FPM) r)
    (+
      (+
        (ite (= r r@153@01) $Perm.Write $Perm.No)
        (ite (= r r2@154@01) $Perm.Write $Perm.No))
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@169@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0)))
  (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r r@153@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@168@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@168@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@169@01  $FPM) r)
    (+
      (+
        (ite (= r r@153@01) $Perm.Write $Perm.No)
        (ite (= r r2@154@01) $Perm.Write $Perm.No))
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@169@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@167@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@155@01 x@167@01)
      (not (Seq_contains xs@155@01 x@167@01)))
    (or
      (not (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0)))
      (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0))))
  :pattern ((Seq_contains xs@155@01 x@167@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@82@12@82@88-aux|)))
(assert (forall ((x@167@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@155@01 x@167@01)
      (not (Seq_contains xs@155@01 x@167@01)))
    (or
      (not (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0)))
      (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0))))
  :pattern ((Seq_contains_trigger xs@155@01 x@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@82@12@82@88-aux|)))
(assert (forall ((x@167@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@167@01) (> i@156@01 0))
    (> ($FVF.lookup_f (as sm@168@01  $FVF<f>) x@167@01) 0))
  :pattern ((Seq_contains xs@155@01 x@167@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@82@12@82@88|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i)
; [eval] r != null
; Precomputing data for removing quantified permissions
(define-fun pTaken@170@01 ((r $Ref)) $Perm
  (ite
    (= r r@153@01)
    ($Perm.min (ite (= r r@153@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@171@01 ((r $Ref)) $Perm
  (ite
    (= r r@153@01)
    ($Perm.min
      (ite (= r r2@154@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@170@01 r)))
    $Perm.No))
(define-fun pTaken@172@01 ((r $Ref)) $Perm
  (ite
    (= r r@153@01)
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@170@01 r)) (pTaken@171@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@170@01 r@153@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@153@01) (= (- $Perm.Write (pTaken@170@01 r)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)
  ($FVF.lookup_f (as sm@158@01  $FVF<f>) r@153@01)))
(assert (=>
  (= r@153@01 r2@154@01)
  (=
    ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)
    ($FVF.lookup_f (as sm@159@01  $FVF<f>) r@153@01))))
(assert (=>
  (and
    (img@166@01 r@153@01)
    (and (Seq_contains xs@155@01 (inv@165@01 r@153@01)) (> i@156@01 0)))
  (=
    ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r@153@01))))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))))))
(assert (=
  ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01))))
  $Snap.unit))
; [eval] r != null
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))))
    ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))))
  $Snap.unit))
; [eval] r.g == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01))))))
  i@156@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@173@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@173@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@173@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@173@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@173@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(declare-const pm@174@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@174@01  $FPM) r)
    (+
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)
      (ite (= r r2@154@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@174@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@174@01  $FPM) r) $Perm.Write)
  :pattern ((inv@165@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@174@01  $FPM) r2@154@01) $Perm.Write))
; [exec]
; assert r.g == i
; [eval] r.g == i
; [exec]
; package acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@175@01 $Snap)
(declare-const sm@176@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@176@01  $FVF<f>) r@153@01)
  ($SortWrappers.$SnapToInt $t@175@01)))
; [eval] r != null
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] r.g == i
; Create MagicWandSnapFunction for wand acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i)
(declare-const mwsf@177@01 $MWSF)
(assert (forall (($t@175@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@177@01 $t@175@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@177@01 $t@175@01))
  :qid |quant-u-73|)))
; [eval] r != null
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@175@01 $Snap)) (!
  (and
    (=
      ($FVF.lookup_f (as sm@176@01  $FVF<f>) r@153@01)
      ($SortWrappers.$SnapToInt $t@175@01))
    (=
      (MWSF_apply mwsf@177@01 $t@175@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@168@01  $FVF<f>) r@153@01)))))
          $Snap.unit))))
  :pattern ((MWSF_apply mwsf@177@01 $t@175@01))
  :qid |quant-u-74|)))
(assert true)
; [exec]
; exhale (forall x: Ref ::(x in xs) ==> acc(p2(x, i), write)) &&
;   (forall x: Ref ::(x in xs) && i > 0 ==> acc(x.f, write)) &&
;   (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@178@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@155@01 x@178@01))
(pop) ; 4
(declare-fun inv@179@01 ($Ref Int) $Ref)
(declare-fun img@180@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@178@01 $Ref) (x2@178@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@155@01 x1@178@01)
      (Seq_contains xs@155@01 x2@178@01)
      (= x1@178@01 x2@178@01))
    (= x1@178@01 x2@178@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@178@01 $Ref)) (!
  (=>
    (Seq_contains xs@155@01 x@178@01)
    (and
      (= (inv@179@01 x@178@01 i@156@01) x@178@01)
      (img@180@01 x@178@01 i@156@01)))
  :pattern ((Seq_contains xs@155@01 x@178@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@178@01))
  :pattern ((inv@179@01 x@178@01 i@156@01))
  :pattern ((img@180@01 x@178@01 i@156@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@180@01 a b) (Seq_contains xs@155@01 (inv@179@01 a b)))
    (and (= (inv@179@01 a b) a) (= i@156@01 b)))
  :pattern ((inv@179@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@181@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (Seq_contains xs@155@01 (inv@179@01 a b))
      (img@180@01 a b)
      (and (= a (inv@179@01 a b)) (= b i@156@01)))
    ($Perm.min
      (ite
        (and (img@163@01 a b) (Seq_contains xs@155@01 (inv@162@01 a b)))
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
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@163@01 a b) (Seq_contains xs@155@01 (inv@162@01 a b)))
        $Perm.Write
        $Perm.No)
      (pTaken@181@01 a b))
    $Perm.No)
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (Seq_contains xs@155@01 (inv@179@01 a b))
      (img@180@01 a b)
      (and (= a (inv@179@01 a b)) (= b i@156@01)))
    (= (- $Perm.Write (pTaken@181@01 a b)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@182@01 $PSF<p2>)
(declare-const s@183@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@183@01 $Snap)) (!
  (=>
    (and
      (img@163@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@183@01)) ($SortWrappers.$SnapToInt ($Snap.second s@183@01)))
      (Seq_contains
        xs@155@01
        (inv@162@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@183@01)) ($SortWrappers.$SnapToInt ($Snap.second s@183@01)))))
    (and
      (not (= s@183@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@182@01  $PSF<p2>) s@183@01)
        ($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@160@01)) s@183@01))))
  :pattern (($PSF.lookup_p2 (as sm@182@01  $PSF<p2>) s@183@01))
  :pattern (($PSF.lookup_p2 ($SortWrappers.$SnapTo$PSF<p2> ($Snap.first $t@160@01)) s@183@01))
  :qid |qp.psmValDef33|)))
(declare-const x@184@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 27 | !(x@184@01 in xs@155@01) | live]
; [else-branch: 27 | x@184@01 in xs@155@01 | live]
(push) ; 6
; [then-branch: 27 | !(x@184@01 in xs@155@01)]
(assert (not (Seq_contains xs@155@01 x@184@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | x@184@01 in xs@155@01]
(assert (Seq_contains xs@155@01 x@184@01))
; [eval] i > 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@155@01 x@184@01) (not (Seq_contains xs@155@01 x@184@01))))
(assert (and (Seq_contains xs@155@01 x@184@01) (> i@156@01 0)))
(pop) ; 4
(declare-fun inv@185@01 ($Ref) $Ref)
(declare-fun img@186@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@184@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@184@01) (> i@156@01 0))
    (or
      (Seq_contains xs@155@01 x@184@01)
      (not (Seq_contains xs@155@01 x@184@01))))
  :pattern ((Seq_contains xs@155@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@184@01))
  :pattern ((inv@185@01 x@184@01))
  :pattern ((img@186@01 x@184@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@184@01 $Ref) (x2@184@01 $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@155@01 x1@184@01) (> i@156@01 0))
      (and (Seq_contains xs@155@01 x2@184@01) (> i@156@01 0))
      (= x1@184@01 x2@184@01))
    (= x1@184@01 x2@184@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@184@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@184@01) (> i@156@01 0))
    (and (= (inv@185@01 x@184@01) x@184@01) (img@186@01 x@184@01)))
  :pattern ((Seq_contains xs@155@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@184@01))
  :pattern ((inv@185@01 x@184@01))
  :pattern ((img@186@01 x@184@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@186@01 r)
      (and (Seq_contains xs@155@01 (inv@185@01 r)) (> i@156@01 0)))
    (= (inv@185@01 r) r))
  :pattern ((inv@185@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@155@01 (inv@185@01 r)) (> i@156@01 0))
      (img@186@01 r)
      (= r (inv@185@01 r)))
    ($Perm.min
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@188@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (Seq_contains xs@155@01 (inv@185@01 r)) (> i@156@01 0))
      (img@186@01 r)
      (= r (inv@185@01 r)))
    ($Perm.min
      (ite (= r r2@154@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@187@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)
      (pTaken@187@01 r))
    $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (Seq_contains xs@155@01 (inv@185@01 r)) (> i@156@01 0))
      (img@186@01 r)
      (= r (inv@185@01 r)))
    (= (- $Perm.Write (pTaken@187@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) && i > 0 ==> x.f > 0)
(declare-const x@189@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs) && i > 0 ==> x.f > 0
; [eval] (x in xs) && i > 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 28 | !(x@189@01 in xs@155@01) | live]
; [else-branch: 28 | x@189@01 in xs@155@01 | live]
(push) ; 6
; [then-branch: 28 | !(x@189@01 in xs@155@01)]
(assert (not (Seq_contains xs@155@01 x@189@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | x@189@01 in xs@155@01]
(assert (Seq_contains xs@155@01 x@189@01))
; [eval] i > 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Seq_contains xs@155@01 x@189@01) (not (Seq_contains xs@155@01 x@189@01))))
(push) ; 5
; [then-branch: 29 | x@189@01 in xs@155@01 && i@156@01 > 0 | live]
; [else-branch: 29 | !(x@189@01 in xs@155@01 && i@156@01 > 0) | live]
(push) ; 6
; [then-branch: 29 | x@189@01 in xs@155@01 && i@156@01 > 0]
(assert (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0)))
; [eval] x.f > 0
(declare-const sm@190@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef35|)))
(declare-const pm@191@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@191@01  $FPM) r)
    (+
      (ite (= r r2@154@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@191@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_f (as pm@191@01  $FPM) x@189@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 29 | !(x@189@01 in xs@155@01 && i@156@01 > 0)]
(assert (not (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@191@01  $FPM) r)
    (+
      (ite (= r r2@154@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@191@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Joined path conditions
(assert (or
  (not (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0)))
  (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@154@01)
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@166@01 r)
      (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@160@01))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@191@01  $FPM) r)
    (+
      (ite (= r r2@154@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@166@01 r)
          (and (Seq_contains xs@155@01 (inv@165@01 r)) (> i@156@01 0)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@191@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@189@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@155@01 x@189@01)
      (not (Seq_contains xs@155@01 x@189@01)))
    (or
      (not (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0)))
      (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))))
  :pattern ((Seq_contains xs@155@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@86@12@86@88-aux|)))
(assert (forall ((x@189@01 $Ref)) (!
  (and
    (or
      (Seq_contains xs@155@01 x@189@01)
      (not (Seq_contains xs@155@01 x@189@01)))
    (or
      (not (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0)))
      (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))))
  :pattern ((Seq_contains_trigger xs@155@01 x@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@86@12@86@88-aux|)))
(push) ; 4
(assert (not (forall ((x@189@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))
    (> ($FVF.lookup_f (as sm@190@01  $FVF<f>) x@189@01) 0))
  :pattern ((Seq_contains xs@155@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@86@12@86@88|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@189@01 $Ref)) (!
  (=>
    (and (Seq_contains xs@155@01 x@189@01) (> i@156@01 0))
    (> ($FVF.lookup_f (as sm@190@01  $FVF<f>) x@189@01) 0))
  :pattern ((Seq_contains xs@155@01 x@189@01))
  :pattern ((Seq_contains_trigger xs@155@01 x@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedcombinations/independence.vpr@86@12@86@88|)))
; [exec]
; apply acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i)
; [eval] r2 != null
; Precomputing data for removing quantified permissions
(define-fun pTaken@192@01 ((r $Ref)) $Perm
  (ite
    (= r r2@154@01)
    ($Perm.min (ite (= r r2@154@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@192@01 r2@154@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r2@154@01) (= (- $Perm.Write (pTaken@192@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@193@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)
  ($FVF.lookup_f (as sm@159@01  $FVF<f>) r2@154@01)))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))))))
(assert (=
  ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01))))
  $Snap.unit))
; [eval] r2 != null
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))))
    ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))))
  $Snap.unit))
; [eval] r2.g == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01))))))
  i@156@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert r2.g == i
; [eval] r2.g == i
; [exec]
; package acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@194@01 $Snap)
(declare-const sm@195@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@195@01  $FVF<f>) r2@154@01)
  ($SortWrappers.$SnapToInt $t@194@01)))
; [eval] r2 != null
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] r2.g == i
; Create MagicWandSnapFunction for wand acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i)
(declare-const mwsf@196@01 $MWSF)
(assert (forall (($t@194@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@196@01 $t@194@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@196@01 $t@194@01))
  :qid |quant-u-86|)))
; [eval] r2 != null
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@194@01 $Snap)) (!
  (and
    (=
      ($FVF.lookup_f (as sm@195@01  $FVF<f>) r2@154@01)
      ($SortWrappers.$SnapToInt $t@194@01))
    (=
      (MWSF_apply mwsf@196@01 $t@194@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@157@01)))) ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@193@01  $FVF<f>) r2@154@01)))))
          $Snap.unit))))
  :pattern ((MWSF_apply mwsf@196@01 $t@194@01))
  :qid |quant-u-87|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
