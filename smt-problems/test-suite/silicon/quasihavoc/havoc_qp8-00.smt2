(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:26:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/havoc_qp8.vpr
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
(declare-sort $PSF<P> 0)
(declare-sort $PSF<wand@0> 0)
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
(declare-fun $SortWrappers.$PSF<wand@0>To$Snap ($PSF<wand@0>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<wand@0> ($Snap) $PSF<wand@0>)
(assert (forall ((x $PSF<wand@0>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<wand@0>($SortWrappers.$PSF<wand@0>To$Snap x)))
    :pattern (($SortWrappers.$PSF<wand@0>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<wand@0>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<wand@0>To$Snap($SortWrappers.$SnapTo$PSF<wand@0> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<wand@0> x))
    :qid |$Snap.$PSF<wand@0>To$SnapTo$PSF<wand@0>|
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
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) && Ref.f == Int --* acc(P(Ref), Perm): Snap]
(declare-fun $PSF.domain_wand@0 ($PSF<wand@0>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@0 ($PSF<wand@0> $Snap) $Snap)
(declare-fun $PSF.after_wand@0 ($PSF<wand@0> $PSF<wand@0>) Bool)
(declare-fun $PSF.loc_wand@0 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@0 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@0 $PSF<wand@0>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [wand@0: Snap]
(assert (forall ((vs $PSF<wand@0>) (ws $PSF<wand@0>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_wand@0 vs) ($PSF.domain_wand@0 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_wand@0 vs))
            (= ($PSF.lookup_wand@0 vs x) ($PSF.lookup_wand@0 ws x)))
          :pattern (($PSF.lookup_wand@0 vs x) ($PSF.lookup_wand@0 ws x))
          :qid |qp.$PSF<wand@0>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<wand@0>To$Snap vs)
              ($SortWrappers.$PSF<wand@0>To$Snap ws)
              )
    :qid |qp.$PSF<wand@0>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_wand@0 pm s))
    :pattern (($PSF.perm_wand@0 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_wand@0 f s) true)
    :pattern (($PSF.loc_wand@0 f s)))))
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
(declare-const s@0@01 Seq<$Ref>)
(declare-const s@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { s[i], s[j] } 0 <= i && (i < j && j < |s|) ==> s[i] != s[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |s|) ==> s[i] != s[j]
; [eval] 0 <= i && (i < j && j < |s|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@3@01) | live]
; [else-branch: 0 | 0 <= i@3@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@3@01)]
(assert (not (<= 0 i@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@3@01]
(assert (<= 0 i@3@01))
; [eval] i < j
(push) ; 5
; [then-branch: 1 | !(i@3@01 < j@4@01) | live]
; [else-branch: 1 | i@3@01 < j@4@01 | live]
(push) ; 6
; [then-branch: 1 | !(i@3@01 < j@4@01)]
(assert (not (< i@3@01 j@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@3@01 < j@4@01]
(assert (< i@3@01 j@4@01))
; [eval] j < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@3@01 j@4@01) (not (< i@3@01 j@4@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@3@01)
  (and (<= 0 i@3@01) (or (< i@3@01 j@4@01) (not (< i@3@01 j@4@01))))))
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@3@01 && i@3@01 < j@4@01 && j@4@01 < |s@1@01| | live]
; [else-branch: 2 | !(0 <= i@3@01 && i@3@01 < j@4@01 && j@4@01 < |s@1@01|) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@3@01 && i@3@01 < j@4@01 && j@4@01 < |s@1@01|]
(assert (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01)))))
; [eval] s[i] != s[j]
; [eval] s[i]
(push) ; 5
(assert (not (>= i@3@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@3@01 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[j]
(push) ; 5
(assert (not (>= j@4@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@3@01 && i@3@01 < j@4@01 && j@4@01 < |s@1@01|)]
(assert (not (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))
  (and (<= 0 i@3@01) (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01)))))
; Joined path conditions
(assert (or
  (not
    (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01)))))
  (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (<= 0 i@3@01)
      (and (<= 0 i@3@01) (or (< i@3@01 j@4@01) (not (< i@3@01 j@4@01)))))
    (or (<= 0 i@3@01) (not (<= 0 i@3@01)))
    (=>
      (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))
      (and (<= 0 i@3@01) (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))
    (or
      (not
        (and
          (<= 0 i@3@01)
          (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01)))))
      (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))))
  :pattern ((Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp8.vpr@12@14@12@82-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (and (< i@3@01 j@4@01) (< j@4@01 (Seq_length s@1@01))))
    (not (= (Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))))
  :pattern ((Seq_index s@1@01 i@3@01) (Seq_index s@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp8.vpr@12@14@12@82|)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(declare-const i@5@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@5@01) | live]
; [else-branch: 3 | 0 <= i@5@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(assert (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01))))
; [eval] s[i]
(push) ; 3
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@6@01 ($Ref) Int)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01)))
    (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
  :pattern ((Seq_index s@1@01 i@5@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@5@01) (< i1@5@01 (Seq_length s@1@01)))
      (and (<= 0 i2@5@01) (< i2@5@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@5@01) (Seq_index s@1@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01)))
    (and
      (= (inv@6@01 (Seq_index s@1@01 i@5@01)) i@5@01)
      (img@7@01 (Seq_index s@1@01 i@5@01))))
  :pattern ((Seq_index s@1@01 i@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 (Seq_length s@1@01)))
    (not (= (Seq_index s@1@01 i@5@01) $Ref.null)))
  :pattern ((Seq_index s@1@01 i@5@01))
  :qid |f-permImpliesNonNull|)))
(declare-const i@8@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |s|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@8@01) | live]
; [else-branch: 4 | 0 <= i@8@01 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@8@01)]
(assert (not (<= 0 i@8@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@8@01]
(assert (<= 0 i@8@01))
; [eval] i < |s|
; [eval] |s|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@8@01) (not (<= 0 i@8@01))))
(assert (and (<= 0 i@8@01) (< i@8@01 (Seq_length s@1@01))))
; [eval] s[i]
(push) ; 3
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 3
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 3
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@9@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@10@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (<= 0 i@8@01) (< i@8@01 (Seq_length s@1@01)))
    (or (<= 0 i@8@01) (not (<= 0 i@8@01))))
  :pattern ((Seq_index s@1@01 i@8@01))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@8@01 Int) (i2@8@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@8@01) (< i1@8@01 (Seq_length s@1@01)))
      (and (<= 0 i2@8@01) (< i2@8@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 i1@8@01) (Seq_index s@1@01 i2@8@01)))
    (= i1@8@01 i2@8@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (<= 0 i@8@01) (< i@8@01 (Seq_length s@1@01)))
    (and
      (=
        (inv@9@01 (Seq_index s@1@01 i@8@01) $Perm.Write (Seq_index s@1@01 i@8@01) 3 (Seq_index
          s@1@01
          i@8@01) $Perm.Write)
        i@8@01)
      (img@10@01 (Seq_index s@1@01 i@8@01) $Perm.Write (Seq_index s@1@01 i@8@01) 3 (Seq_index
        s@1@01
        i@8@01) $Perm.Write)))
  :pattern ((Seq_index s@1@01 i@8@01))
  :qid |quant-u-3|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@10@01 x0 x1 x2 x3 x4 x5)
      (and
        (<= 0 (inv@9@01 x0 x1 x2 x3 x4 x5))
        (< (inv@9@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
    (and
      (= (Seq_index s@1@01 (inv@9@01 x0 x1 x2 x3 x4 x5)) x0)
      (= $Perm.Write x1)
      (= (Seq_index s@1@01 (inv@9@01 x0 x1 x2 x3 x4 x5)) x2)
      (= 3 x3)
      (= (Seq_index s@1@01 (inv@9@01 x0 x1 x2 x3 x4 x5)) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@9@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@11@01 Int)
; [exec]
; i := 0
(declare-const i@12@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@12@01))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (= ($Snap.first ($Snap.second $t@13@01)) $Snap.unit))
; [eval] i <= |s|
; [eval] |s|
(assert (<= i@12@01 (Seq_length s@1@01)))
(assert (=
  ($Snap.second ($Snap.second $t@13@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))
(declare-const k@14@01 Int)
(push) ; 4
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 5
; [then-branch: 5 | !(i@12@01 <= k@14@01) | live]
; [else-branch: 5 | i@12@01 <= k@14@01 | live]
(push) ; 6
; [then-branch: 5 | !(i@12@01 <= k@14@01)]
(assert (not (<= i@12@01 k@14@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | i@12@01 <= k@14@01]
(assert (<= i@12@01 k@14@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= i@12@01 k@14@01) (not (<= i@12@01 k@14@01))))
(assert (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (or (<= i@12@01 k@14@01) (not (<= i@12@01 k@14@01))))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@14@01 Int) (k2@14@01 Int)) (!
  (=>
    (and
      (and (<= i@12@01 k1@14@01) (< k1@14@01 (Seq_length s@1@01)))
      (and (<= i@12@01 k2@14@01) (< k2@14@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@14@01) (Seq_index s@1@01 k2@14@01)))
    (= k1@14@01 k2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (and
      (= (inv@15@01 (Seq_index s@1@01 k@14@01)) k@14@01)
      (img@16@01 (Seq_index s@1@01 k@14@01))))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@01 r)
      (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (not (= (Seq_index s@1@01 k@14@01) $Ref.null)))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
(declare-const k@17@01 Int)
(push) ; 4
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 5
; [then-branch: 6 | !(i@12@01 <= k@17@01) | live]
; [else-branch: 6 | i@12@01 <= k@17@01 | live]
(push) ; 6
; [then-branch: 6 | !(i@12@01 <= k@17@01)]
(assert (not (<= i@12@01 k@17@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | i@12@01 <= k@17@01]
(assert (<= i@12@01 k@17@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= i@12@01 k@17@01) (not (<= i@12@01 k@17@01))))
(assert (and (<= i@12@01 k@17@01) (< k@17@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@17@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 5
(assert (not (>= k@17@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 5
(assert (not (>= k@17@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@18@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@19@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@17@01 Int)) (!
  (=>
    (and (<= i@12@01 k@17@01) (< k@17@01 (Seq_length s@1@01)))
    (or (<= i@12@01 k@17@01) (not (<= i@12@01 k@17@01))))
  :pattern ((Seq_index s@1@01 k@17@01))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@17@01 Int) (k2@17@01 Int)) (!
  (=>
    (and
      (and (<= i@12@01 k1@17@01) (< k1@17@01 (Seq_length s@1@01)))
      (and (<= i@12@01 k2@17@01) (< k2@17@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@17@01) (Seq_index s@1@01 k2@17@01)))
    (= k1@17@01 k2@17@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@17@01 Int)) (!
  (=>
    (and (<= i@12@01 k@17@01) (< k@17@01 (Seq_length s@1@01)))
    (and
      (=
        (inv@18@01 (Seq_index s@1@01 k@17@01) $Perm.Write (Seq_index
          s@1@01
          k@17@01) 3 (Seq_index s@1@01 k@17@01) $Perm.Write)
        k@17@01)
      (img@19@01 (Seq_index s@1@01 k@17@01) $Perm.Write (Seq_index
        s@1@01
        k@17@01) 3 (Seq_index s@1@01 k@17@01) $Perm.Write)))
  :pattern ((Seq_index s@1@01 k@17@01))
  :qid |quant-u-7|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@19@01 x0 x1 x2 x3 x4 x5)
      (and
        (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
        (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
    (and
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x0)
      (= $Perm.Write x1)
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x2)
      (= 3 x3)
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@18@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
(declare-const k@20@01 Int)
(push) ; 4
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 7 | !(0 <= k@20@01) | live]
; [else-branch: 7 | 0 <= k@20@01 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= k@20@01)]
(assert (not (<= 0 k@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= k@20@01]
(assert (<= 0 k@20@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
(assert (and (<= 0 k@20@01) (< k@20@01 i@12@01)))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@20@01 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 i@12@01))
    (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
  :pattern ((Seq_index s@1@01 k@20@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@20@01 Int) (k2@20@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@20@01) (< k1@20@01 i@12@01))
      (and (<= 0 k2@20@01) (< k2@20@01 i@12@01))
      (= (Seq_index s@1@01 k1@20@01) (Seq_index s@1@01 k2@20@01)))
    (= k1@20@01 k2@20@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 i@12@01))
    (and
      (= (inv@21@01 (Seq_index s@1@01 k@20@01)) k@20@01)
      (img@22@01 (Seq_index s@1@01 k@20@01))))
  :pattern ((Seq_index s@1@01 k@20@01))
  :qid |quant-u-9|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@22@01 x) (and (<= 0 (inv@21@01 x)) (< (inv@21@01 x) i@12@01)))
    (= (Seq_index s@1@01 (inv@21@01 x)) x))
  :pattern ((inv@21@01 x))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= |s|
; [eval] |s|
(push) ; 4
(assert (not (<= 0 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (Seq_length s@1@01)))
(declare-const k@23@01 Int)
(push) ; 4
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 5
; [then-branch: 8 | !(0 <= k@23@01) | live]
; [else-branch: 8 | 0 <= k@23@01 | live]
(push) ; 6
; [then-branch: 8 | !(0 <= k@23@01)]
(assert (not (<= 0 k@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | 0 <= k@23@01]
(assert (<= 0 k@23@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@23@01) (not (<= 0 k@23@01))))
(assert (and (<= 0 k@23@01) (< k@23@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@23@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@23@01 Int)) (!
  (=>
    (and (<= 0 k@23@01) (< k@23@01 (Seq_length s@1@01)))
    (or (<= 0 k@23@01) (not (<= 0 k@23@01))))
  :pattern ((Seq_index s@1@01 k@23@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@23@01 Int) (k2@23@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@23@01) (< k1@23@01 (Seq_length s@1@01)))
      (and (<= 0 k2@23@01) (< k2@23@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@23@01) (Seq_index s@1@01 k2@23@01)))
    (= k1@23@01 k2@23@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@23@01 Int)) (!
  (=>
    (and (<= 0 k@23@01) (< k@23@01 (Seq_length s@1@01)))
    (and
      (= (inv@24@01 (Seq_index s@1@01 k@23@01)) k@23@01)
      (img@25@01 (Seq_index s@1@01 k@23@01))))
  :pattern ((Seq_index s@1@01 k@23@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length s@1@01)))
      (img@25@01 r)
      (= r (Seq_index s@1@01 (inv@24@01 r))))
    ($Perm.min
      (ite
        (and
          (img@7@01 r)
          (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (Seq_length s@1@01))))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@7@01 r)
          (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-12|))))
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
      (and (<= 0 (inv@24@01 r)) (< (inv@24@01 r) (Seq_length s@1@01)))
      (img@25@01 r)
      (= r (Seq_index s@1@01 (inv@24@01 r))))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (Seq_length s@1@01))))
    (=
      ($FVF.lookup_f (as sm@27@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_f (as sm@27@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef0|)))
(declare-const k@28@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 5
; [then-branch: 9 | !(0 <= k@28@01) | live]
; [else-branch: 9 | 0 <= k@28@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= k@28@01)]
(assert (not (<= 0 k@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= k@28@01]
(assert (<= 0 k@28@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@28@01) (not (<= 0 k@28@01))))
(assert (and (<= 0 k@28@01) (< k@28@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@28@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 5
(assert (not (>= k@28@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 5
(assert (not (>= k@28@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@29@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@30@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@28@01 Int)) (!
  (=>
    (and (<= 0 k@28@01) (< k@28@01 (Seq_length s@1@01)))
    (or (<= 0 k@28@01) (not (<= 0 k@28@01))))
  :pattern ((Seq_index s@1@01 k@28@01))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@28@01 Int) (k2@28@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@28@01) (< k1@28@01 (Seq_length s@1@01)))
      (and (<= 0 k2@28@01) (< k2@28@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@28@01) (Seq_index s@1@01 k2@28@01)))
    (= k1@28@01 k2@28@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@28@01 Int)) (!
  (=>
    (and (<= 0 k@28@01) (< k@28@01 (Seq_length s@1@01)))
    (and
      (=
        (inv@29@01 (Seq_index s@1@01 k@28@01) $Perm.Write (Seq_index
          s@1@01
          k@28@01) 3 (Seq_index s@1@01 k@28@01) $Perm.Write)
        k@28@01)
      (img@30@01 (Seq_index s@1@01 k@28@01) $Perm.Write (Seq_index
        s@1@01
        k@28@01) 3 (Seq_index s@1@01 k@28@01) $Perm.Write)))
  :pattern ((Seq_index s@1@01 k@28@01))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@30@01 x0 x1 x2 x3 x4 x5)
      (and
        (<= 0 (inv@29@01 x0 x1 x2 x3 x4 x5))
        (< (inv@29@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
    (and
      (= (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)) x0)
      (= $Perm.Write x1)
      (= (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)) x2)
      (= 3 x3)
      (= (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@29@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@0-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (and
        (<= 0 (inv@29@01 x0 x1 x2 x3 x4 x5))
        (< (inv@29@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01)))
      (img@30@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x1 $Perm.Write)
        (= x2 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x3 3)
        (= x4 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x5 $Perm.Write)))
    ($Perm.min
      (ite
        (and
          (img@10@01 x0 x1 x2 x3 x4 x5)
          (and
            (<= 0 (inv@9@01 x0 x1 x2 x3 x4 x5))
            (< (inv@9@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@10@01 x0 x1 x2 x3 x4 x5)
          (and
            (<= 0 (inv@9@01 x0 x1 x2 x3 x4 x5))
            (< (inv@9@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@31@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (and
        (<= 0 (inv@29@01 x0 x1 x2 x3 x4 x5))
        (< (inv@29@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01)))
      (img@30@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x1 $Perm.Write)
        (= x2 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x3 3)
        (= x4 (Seq_index s@1@01 (inv@29@01 x0 x1 x2 x3 x4 x5)))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@31@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $PSF<wand@0>)
(declare-const s@33@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (and
      (img@10@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@33@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@33@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@33@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@33@01)))
      (and
        (<=
          0
          (inv@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@33@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@33@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@33@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@33@01))))
        (<
          (inv@9@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@33@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@33@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@33@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@33@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@33@01)))
          (Seq_length s@1@01))))
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) s@33@01)
        ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.second ($Snap.second $t@2@01))) s@33@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) s@33@01))
  :pattern (($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.second ($Snap.second $t@2@01))) s@33@01))
  :qid |qp.psmValDef1|)))
(declare-const k@34@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 10 | !(0 <= k@34@01) | live]
; [else-branch: 10 | 0 <= k@34@01 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= k@34@01)]
(assert (not (<= 0 k@34@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= k@34@01]
(assert (<= 0 k@34@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@34@01) (not (<= 0 k@34@01))))
(assert (and (<= 0 k@34@01) (< k@34@01 0)))
; [eval] s[k]
(push) ; 5
(assert (not (>= k@34@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@34@01 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@35@01 ($Ref) Int)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@34@01 Int)) (!
  (=>
    (and (<= 0 k@34@01) (< k@34@01 0))
    (or (<= 0 k@34@01) (not (<= 0 k@34@01))))
  :pattern ((Seq_index s@1@01 k@34@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@34@01 Int) (k2@34@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@34@01) (< k1@34@01 0))
      (and (<= 0 k2@34@01) (< k2@34@01 0))
      (= (Seq_index s@1@01 k1@34@01) (Seq_index s@1@01 k2@34@01)))
    (= k1@34@01 k2@34@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@34@01 Int)) (!
  (=>
    (and (<= 0 k@34@01) (< k@34@01 0))
    (and
      (= (inv@35@01 (Seq_index s@1@01 k@34@01)) k@34@01)
      (img@36@01 (Seq_index s@1@01 k@34@01))))
  :pattern ((Seq_index s@1@01 k@34@01))
  :qid |P-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@36@01 x) (and (<= 0 (inv@35@01 x)) (< (inv@35@01 x) 0)))
    (= (Seq_index s@1@01 (inv@35@01 x)) x))
  :pattern ((inv@35@01 x))
  :qid |P-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@35@01 x)) (< (inv@35@01 x) 0))
      (img@36@01 x)
      (= x (Seq_index s@1@01 (inv@35@01 x))))
    false)
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@37@01 $PSF<P>)
(declare-const s@38@01 $Snap)
; Definitional axioms for snapshot map values
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@22@01 x) (and (<= 0 (inv@21@01 x)) (< (inv@21@01 x) i@12@01)))
    (= (Seq_index s@1@01 (inv@21@01 x)) x))
  :pattern ((inv@21@01 x))
  :qid |P-fctOfInv|)))
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 i@12@01))
    (and
      (= (inv@21@01 (Seq_index s@1@01 k@20@01)) k@20@01)
      (img@22@01 (Seq_index s@1@01 k@20@01))))
  :pattern ((Seq_index s@1@01 k@20@01))
  :qid |quant-u-9|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@19@01 x0 x1 x2 x3 x4 x5)
      (and
        (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
        (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
    (and
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x0)
      (= $Perm.Write x1)
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x2)
      (= 3 x3)
      (= (Seq_index s@1@01 (inv@18@01 x0 x1 x2 x3 x4 x5)) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@18@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@0-fctOfInv|)))
(assert (forall ((k@17@01 Int)) (!
  (=>
    (and (<= i@12@01 k@17@01) (< k@17@01 (Seq_length s@1@01)))
    (and
      (=
        (inv@18@01 (Seq_index s@1@01 k@17@01) $Perm.Write (Seq_index
          s@1@01
          k@17@01) 3 (Seq_index s@1@01 k@17@01) $Perm.Write)
        k@17@01)
      (img@19@01 (Seq_index s@1@01 k@17@01) $Perm.Write (Seq_index
        s@1@01
        k@17@01) 3 (Seq_index s@1@01 k@17@01) $Perm.Write)))
  :pattern ((Seq_index s@1@01 k@17@01))
  :qid |quant-u-7|)))
(assert (forall ((k@20@01 Int)) (!
  (=>
    (and (<= 0 k@20@01) (< k@20@01 i@12@01))
    (or (<= 0 k@20@01) (not (<= 0 k@20@01))))
  :pattern ((Seq_index s@1@01 k@20@01))
  :qid |P-aux|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@01 r)
      (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (and
      (= (inv@15@01 (Seq_index s@1@01 k@14@01)) k@14@01)
      (img@16@01 (Seq_index s@1@01 k@14@01))))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |quant-u-5|)))
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (not (= (Seq_index s@1@01 k@14@01) $Ref.null)))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
(assert (forall ((k@17@01 Int)) (!
  (=>
    (and (<= i@12@01 k@17@01) (< k@17@01 (Seq_length s@1@01)))
    (or (<= i@12@01 k@17@01) (not (<= i@12@01 k@17@01))))
  :pattern ((Seq_index s@1@01 k@17@01))
  :qid |wand@0-aux|)))
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
(assert (<= 0 i@12@01))
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (= ($Snap.first ($Snap.second $t@13@01)) $Snap.unit))
(assert (<= i@12@01 (Seq_length s@1@01)))
(assert (=
  ($Snap.second ($Snap.second $t@13@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))
(assert (forall ((k@14@01 Int)) (!
  (=>
    (and (<= i@12@01 k@14@01) (< k@14@01 (Seq_length s@1@01)))
    (or (<= i@12@01 k@14@01) (not (<= i@12@01 k@14@01))))
  :pattern ((Seq_index s@1@01 k@14@01))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
(push) ; 5
; [eval] !(i < |s|)
; [eval] i < |s|
; [eval] |s|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < |s|
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@12@01 (Seq_length s@1@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@12@01 (Seq_length s@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@12@01 < |s@1@01| | live]
; [else-branch: 11 | !(i@12@01 < |s@1@01|) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | i@12@01 < |s@1@01|]
(assert (< i@12@01 (Seq_length s@1@01)))
; [exec]
; quasihavoc acc(s[i].f, write) && s[i].f == 3 --* acc(P(s[i]), write)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@39@01 $PSF<wand@0>)
; axiomatized snapshot map after havoc
(assert (forall ((s@$ $Snap)) (!
  (=>
    (not
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@$))))))
          (Seq_index s@1@01 i@12@01))
        (=
          ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@$))))))
          $Perm.Write)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@$)))))
          (Seq_index s@1@01 i@12@01))
        (=
          ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@$))))
          3)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@$)))
          (Seq_index s@1@01 i@12@01))
        (= ($SortWrappers.$SnapTo$Perm ($Snap.second s@$)) $Perm.Write)))
    (=
      ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))) s@$)
      ($PSF.lookup_wand@0 (as sm@39@01  $PSF<wand@0>) s@$)))
  :pattern (($PSF.lookup_wand@0 (as sm@39@01  $PSF<wand@0>) s@$))
  :pattern (($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))) s@$))
  :qid |qp.smValDef0|)))
; [exec]
; s[i].f := 3
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index s@1@01 i@12@01))
    ($Perm.min
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@40@01 r) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@1@01 i@12@01))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@41@01  $FVF<f>) (Seq_index s@1@01 i@12@01)) 3))
; [exec]
; apply acc(s[i].f, write) && s[i].f == 3 --* acc(P(s[i]), write)
; [eval] s[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (= x0 (Seq_index s@1@01 i@12@01))
      (= x1 $Perm.Write)
      (= x2 (Seq_index s@1@01 i@12@01))
      (= x3 3)
      (= x4 (Seq_index s@1@01 i@12@01))
      (= x5 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (img@19@01 x0 x1 x2 x3 x4 x5)
          (and
            (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
            (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@19@01 x0 x1 x2 x3 x4 x5)
          (and
            (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
            (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@42@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@42@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 (Seq_index s@1@01 i@12@01))
      (= x1 $Perm.Write)
      (= x2 (Seq_index s@1@01 i@12@01))
      (= x3 3)
      (= x4 (Seq_index s@1@01 i@12@01))
      (= x5 $Perm.Write))
    (= (- $Perm.Write (pTaken@42@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $PSF<wand@0>)
(declare-const s@44@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@19@01 (Seq_index s@1@01 i@12@01) $Perm.Write (Seq_index s@1@01 i@12@01) 3 (Seq_index
      s@1@01
      i@12@01) $Perm.Write)
    (and
      (<=
        i@12@01
        (inv@18@01 (Seq_index s@1@01 i@12@01) $Perm.Write (Seq_index
          s@1@01
          i@12@01) 3 (Seq_index s@1@01 i@12@01) $Perm.Write))
      (<
        (inv@18@01 (Seq_index s@1@01 i@12@01) $Perm.Write (Seq_index
          s@1@01
          i@12@01) 3 (Seq_index s@1@01 i@12@01) $Perm.Write)
        (Seq_length s@1@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
              ($SortWrappers.IntTo$Snap 3))
            ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@43@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
            ($SortWrappers.IntTo$Snap 3))
          ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 (as sm@39@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
            ($SortWrappers.IntTo$Snap 3))
          ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; [eval] s[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index s@1@01 i@12@01))
    ($Perm.min
      (ite (= r (Seq_index s@1@01 i@12@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index s@1@01 i@12@01))
    ($Perm.min
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
        (- $Perm.Write (pTaken@40@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@45@01 r)))
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
(assert (not (=
  (-
    (ite
      (= (Seq_index s@1@01 i@12@01) (Seq_index s@1@01 i@12@01))
      $Perm.Write
      $Perm.No)
    (pTaken@45@01 (Seq_index s@1@01 i@12@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index s@1@01 i@12@01))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@16@01 (Seq_index s@1@01 i@12@01))
      (and
        (<= i@12@01 (inv@15@01 (Seq_index s@1@01 i@12@01)))
        (< (inv@15@01 (Seq_index s@1@01 i@12@01)) (Seq_length s@1@01))))
    (< $Perm.No (- $Perm.Write (pTaken@40@01 (Seq_index s@1@01 i@12@01))))
    false)
  (=
    ($FVF.lookup_f (as sm@47@01  $FVF<f>) (Seq_index s@1@01 i@12@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@13@01)))) (Seq_index
      s@1@01
      i@12@01)))))
(assert (=>
  (= (Seq_index s@1@01 i@12@01) (Seq_index s@1@01 i@12@01))
  (=
    ($FVF.lookup_f (as sm@47@01  $FVF<f>) (Seq_index s@1@01 i@12@01))
    ($FVF.lookup_f (as sm@41@01  $FVF<f>) (Seq_index s@1@01 i@12@01)))))
; [eval] s[i].f == 3
; [eval] s[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
        (< $Perm.No (- $Perm.Write (pTaken@40@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@13@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@13@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index s@1@01 i@12@01))
      (=
        ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@41@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@16@01 (Seq_index s@1@01 i@12@01))
        (and
          (<= i@12@01 (inv@15@01 (Seq_index s@1@01 i@12@01)))
          (< (inv@15@01 (Seq_index s@1@01 i@12@01)) (Seq_length s@1@01))))
      (- $Perm.Write (pTaken@40@01 (Seq_index s@1@01 i@12@01)))
      $Perm.No)
    (ite
      (= (Seq_index s@1@01 i@12@01) (Seq_index s@1@01 i@12@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (= ($FVF.lookup_f (as sm@47@01  $FVF<f>) (Seq_index s@1@01 i@12@01)) 3)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@47@01  $FVF<f>) (Seq_index s@1@01 i@12@01)) 3))
(assert (=
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@47@01  $FVF<f>) (Seq_index
      s@1@01
      i@12@01)))
    $Snap.unit)
  ($Snap.first ($PSF.lookup_wand@0 (as sm@43@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
        ($SortWrappers.IntTo$Snap 3))
      ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
; [eval] s[i]
(push) ; 6
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@48@01 $PSF<P>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_P (as sm@48@01  $PSF<P>) ($SortWrappers.$RefTo$Snap (Seq_index
    s@1@01
    i@12@01)))
  ($Snap.second ($PSF.lookup_wand@0 (as sm@43@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
        ($SortWrappers.IntTo$Snap 3))
      ($SortWrappers.$RefTo$Snap (Seq_index s@1@01 i@12@01)))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (<=
  $Perm.No
  (ite
    (= (Seq_index s@1@01 i@12@01) (Seq_index s@1@01 i@12@01))
    $Perm.Write
    $Perm.No)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@16@01 r)
        (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
      (< $Perm.No (- $Perm.Write (pTaken@40@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@13@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@13@01)))) r))
  :qid |qp.fvfValDef5|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (ite
      (and
        (img@16@01 r)
        (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
      (- $Perm.Write (pTaken@40@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
  :pattern ((inv@15@01 r))
  :qid |qp-fld-prm-bnd|)))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@51@01 Int)
(assert (= i@51@01 (+ i@12@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@51@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@51@01))
; [eval] i <= |s|
; [eval] |s|
(push) ; 6
(assert (not (<= i@51@01 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@51@01 (Seq_length s@1@01)))
(declare-const k@52@01 Int)
(push) ; 6
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 7
; [then-branch: 12 | !(i@51@01 <= k@52@01) | live]
; [else-branch: 12 | i@51@01 <= k@52@01 | live]
(push) ; 8
; [then-branch: 12 | !(i@51@01 <= k@52@01)]
(assert (not (<= i@51@01 k@52@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | i@51@01 <= k@52@01]
(assert (<= i@51@01 k@52@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= i@51@01 k@52@01) (not (<= i@51@01 k@52@01))))
(assert (and (<= i@51@01 k@52@01) (< k@52@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 7
(assert (not (>= k@52@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@53@01 ($Ref) Int)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@52@01 Int)) (!
  (=>
    (and (<= i@51@01 k@52@01) (< k@52@01 (Seq_length s@1@01)))
    (or (<= i@51@01 k@52@01) (not (<= i@51@01 k@52@01))))
  :pattern ((Seq_index s@1@01 k@52@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k1@52@01 Int) (k2@52@01 Int)) (!
  (=>
    (and
      (and (<= i@51@01 k1@52@01) (< k1@52@01 (Seq_length s@1@01)))
      (and (<= i@51@01 k2@52@01) (< k2@52@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@52@01) (Seq_index s@1@01 k2@52@01)))
    (= k1@52@01 k2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@52@01 Int)) (!
  (=>
    (and (<= i@51@01 k@52@01) (< k@52@01 (Seq_length s@1@01)))
    (and
      (= (inv@53@01 (Seq_index s@1@01 k@52@01)) k@52@01)
      (img@54@01 (Seq_index s@1@01 k@52@01))))
  :pattern ((Seq_index s@1@01 k@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@01 r)
      (and (<= i@51@01 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length s@1@01))))
    (= (Seq_index s@1@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= i@51@01 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length s@1@01)))
      (img@54@01 r)
      (= r (Seq_index s@1@01 (inv@53@01 r))))
    ($Perm.min
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
        (- $Perm.Write (pTaken@40@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@16@01 r)
          (and (<= i@12@01 (inv@15@01 r)) (< (inv@15@01 r) (Seq_length s@1@01))))
        (- $Perm.Write (pTaken@40@01 r))
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= i@51@01 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length s@1@01)))
      (img@54@01 r)
      (= r (Seq_index s@1@01 (inv@53@01 r))))
    (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const k@56@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] i <= k && k < |s|
; [eval] i <= k
(push) ; 7
; [then-branch: 13 | !(i@51@01 <= k@56@01) | live]
; [else-branch: 13 | i@51@01 <= k@56@01 | live]
(push) ; 8
; [then-branch: 13 | !(i@51@01 <= k@56@01)]
(assert (not (<= i@51@01 k@56@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | i@51@01 <= k@56@01]
(assert (<= i@51@01 k@56@01))
; [eval] k < |s|
; [eval] |s|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= i@51@01 k@56@01) (not (<= i@51@01 k@56@01))))
(assert (and (<= i@51@01 k@56@01) (< k@56@01 (Seq_length s@1@01))))
; [eval] s[k]
(push) ; 7
(assert (not (>= k@56@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 7
(assert (not (>= k@56@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] s[k]
(push) ; 7
(assert (not (>= k@56@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@57@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@58@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@56@01 Int)) (!
  (=>
    (and (<= i@51@01 k@56@01) (< k@56@01 (Seq_length s@1@01)))
    (or (<= i@51@01 k@56@01) (not (<= i@51@01 k@56@01))))
  :pattern ((Seq_index s@1@01 k@56@01))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k1@56@01 Int) (k2@56@01 Int)) (!
  (=>
    (and
      (and (<= i@51@01 k1@56@01) (< k1@56@01 (Seq_length s@1@01)))
      (and (<= i@51@01 k2@56@01) (< k2@56@01 (Seq_length s@1@01)))
      (= (Seq_index s@1@01 k1@56@01) (Seq_index s@1@01 k2@56@01)))
    (= k1@56@01 k2@56@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@56@01 Int)) (!
  (=>
    (and (<= i@51@01 k@56@01) (< k@56@01 (Seq_length s@1@01)))
    (and
      (=
        (inv@57@01 (Seq_index s@1@01 k@56@01) $Perm.Write (Seq_index
          s@1@01
          k@56@01) 3 (Seq_index s@1@01 k@56@01) $Perm.Write)
        k@56@01)
      (img@58@01 (Seq_index s@1@01 k@56@01) $Perm.Write (Seq_index
        s@1@01
        k@56@01) 3 (Seq_index s@1@01 k@56@01) $Perm.Write)))
  :pattern ((Seq_index s@1@01 k@56@01))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@58@01 x0 x1 x2 x3 x4 x5)
      (and
        (<= i@51@01 (inv@57@01 x0 x1 x2 x3 x4 x5))
        (< (inv@57@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
    (and
      (= (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)) x0)
      (= $Perm.Write x1)
      (= (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)) x2)
      (= 3 x3)
      (= (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@57@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@0-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@59@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (and
        (<= i@51@01 (inv@57@01 x0 x1 x2 x3 x4 x5))
        (< (inv@57@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01)))
      (img@58@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x1 $Perm.Write)
        (= x2 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x3 3)
        (= x4 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite
          (and
            (img@19@01 x0 x1 x2 x3 x4 x5)
            (and
              (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
              (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
          $Perm.Write
          $Perm.No)
        (pTaken@42@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite
          (and
            (img@19@01 x0 x1 x2 x3 x4 x5)
            (and
              (<= i@12@01 (inv@18@01 x0 x1 x2 x3 x4 x5))
              (< (inv@18@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01))))
          $Perm.Write
          $Perm.No)
        (pTaken@42@01 x0 x1 x2 x3 x4 x5))
      (pTaken@59@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (and
        (<= i@51@01 (inv@57@01 x0 x1 x2 x3 x4 x5))
        (< (inv@57@01 x0 x1 x2 x3 x4 x5) (Seq_length s@1@01)))
      (img@58@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x1 $Perm.Write)
        (= x2 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x3 3)
        (= x4 (Seq_index s@1@01 (inv@57@01 x0 x1 x2 x3 x4 x5)))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@59@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@60@01 $PSF<wand@0>)
(declare-const s@61@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@61@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (img@19@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@61@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@61@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@61@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@61@01)))
            (and
              (<=
                i@12@01
                (inv@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@61@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@61@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@61@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@61@01))))
              (<
                (inv@18@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@61@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@61@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@61@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@61@01)))
                (Seq_length s@1@01))))
          $Perm.Write
          $Perm.No)
        (pTaken@42@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@61@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@61@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@61@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@61@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@61@01)))))
    (and
      (not (= s@61@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@60@01  $PSF<wand@0>) s@61@01)
        ($PSF.lookup_wand@0 (as sm@39@01  $PSF<wand@0>) s@61@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@60@01  $PSF<wand@0>) s@61@01))
  :pattern (($PSF.lookup_wand@0 (as sm@39@01  $PSF<wand@0>) s@61@01))
  :qid |qp.psmValDef7|)))
(declare-const k@62@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 7
; [then-branch: 14 | !(0 <= k@62@01) | live]
; [else-branch: 14 | 0 <= k@62@01 | live]
(push) ; 8
; [then-branch: 14 | !(0 <= k@62@01)]
(assert (not (<= 0 k@62@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | 0 <= k@62@01]
(assert (<= 0 k@62@01))
; [eval] k < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
(assert (and (<= 0 k@62@01) (< k@62@01 i@51@01)))
; [eval] s[k]
(push) ; 7
(assert (not (>= k@62@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< k@62@01 (Seq_length s@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@63@01 ($Ref) Int)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (<= 0 k@62@01) (< k@62@01 i@51@01))
    (or (<= 0 k@62@01) (not (<= 0 k@62@01))))
  :pattern ((Seq_index s@1@01 k@62@01))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k1@62@01 Int) (k2@62@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@62@01) (< k1@62@01 i@51@01))
      (and (<= 0 k2@62@01) (< k2@62@01 i@51@01))
      (= (Seq_index s@1@01 k1@62@01) (Seq_index s@1@01 k2@62@01)))
    (= k1@62@01 k2@62@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (<= 0 k@62@01) (< k@62@01 i@51@01))
    (and
      (= (inv@63@01 (Seq_index s@1@01 k@62@01)) k@62@01)
      (img@64@01 (Seq_index s@1@01 k@62@01))))
  :pattern ((Seq_index s@1@01 k@62@01))
  :qid |P-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@64@01 x) (and (<= 0 (inv@63@01 x)) (< (inv@63@01 x) i@51@01)))
    (= (Seq_index s@1@01 (inv@63@01 x)) x))
  :pattern ((inv@63@01 x))
  :qid |P-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@65@01 ((x $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@63@01 x)) (< (inv@63@01 x) i@51@01))
      (img@64@01 x)
      (= x (Seq_index s@1@01 (inv@63@01 x))))
    ($Perm.min
      (ite
        (and (img@22@01 x) (and (<= 0 (inv@21@01 x)) (< (inv@21@01 x) i@12@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@66@01 ((x $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@63@01 x)) (< (inv@63@01 x) i@51@01))
      (img@64@01 x)
      (= x (Seq_index s@1@01 (inv@63@01 x))))
    ($Perm.min
      (ite (= x (Seq_index s@1@01 i@12@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@65@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@22@01 x) (and (<= 0 (inv@21@01 x)) (< (inv@21@01 x) i@12@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@65@01 x))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@63@01 x)) (< (inv@63@01 x) i@51@01))
      (img@64@01 x)
      (= x (Seq_index s@1@01 (inv@63@01 x))))
    (= (- $Perm.Write (pTaken@65@01 x)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index s@1@01 i@12@01) (Seq_index s@1@01 i@12@01))
      $Perm.Write
      $Perm.No)
    (pTaken@66@01 (Seq_index s@1@01 i@12@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@63@01 x)) (< (inv@63@01 x) i@51@01))
      (img@64@01 x)
      (= x (Seq_index s@1@01 (inv@63@01 x))))
    (= (- (- $Perm.Write (pTaken@65@01 x)) (pTaken@66@01 x)) $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $PSF<P>)
(declare-const s@68@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@68@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@68@01) (Seq_index s@1@01 i@12@01))
    (and
      (not (= s@68@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@67@01  $PSF<P>) s@68@01)
        ($PSF.lookup_P (as sm@48@01  $PSF<P>) s@68@01))))
  :pattern (($PSF.lookup_P (as sm@67@01  $PSF<P>) s@68@01))
  :pattern (($PSF.lookup_P (as sm@48@01  $PSF<P>) s@68@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@68@01 $Snap)) (!
  (=>
    (and
      (img@22@01 ($SortWrappers.$SnapTo$Ref s@68@01))
      (and
        (<= 0 (inv@21@01 ($SortWrappers.$SnapTo$Ref s@68@01)))
        (< (inv@21@01 ($SortWrappers.$SnapTo$Ref s@68@01)) i@12@01)))
    (and
      (not (= s@68@01 $Snap.unit))
      (=
        ($PSF.lookup_P (as sm@67@01  $PSF<P>) s@68@01)
        ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))) s@68@01))))
  :pattern (($PSF.lookup_P (as sm@67@01  $PSF<P>) s@68@01))
  :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))) s@68@01))
  :qid |qp.psmValDef9|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 11 | !(i@12@01 < |s@1@01|)]
(assert (not (< i@12@01 (Seq_length s@1@01))))
(pop) ; 5
; [eval] !(i < |s|)
; [eval] i < |s|
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@12@01 (Seq_length s@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@12@01 (Seq_length s@1@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | !(i@12@01 < |s@1@01|) | live]
; [else-branch: 15 | i@12@01 < |s@1@01| | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | !(i@12@01 < |s@1@01|)]
(assert (not (< i@12@01 (Seq_length s@1@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | i@12@01 < |s@1@01|]
(assert (< i@12@01 (Seq_length s@1@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
