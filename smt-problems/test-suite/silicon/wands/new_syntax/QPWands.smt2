(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr
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
(declare-sort $PSF<wand@2> 0)
(declare-sort $PSF<wand@4> 0)
(declare-sort $PSF<wand@1> 0)
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
(declare-fun $SortWrappers.$PSF<wand@2>To$Snap ($PSF<wand@2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<wand@2> ($Snap) $PSF<wand@2>)
(assert (forall ((x $PSF<wand@2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<wand@2>($SortWrappers.$PSF<wand@2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<wand@2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<wand@2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<wand@2>To$Snap($SortWrappers.$SnapTo$PSF<wand@2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<wand@2> x))
    :qid |$Snap.$PSF<wand@2>To$SnapTo$PSF<wand@2>|
    )))
(declare-fun $SortWrappers.$PSF<wand@4>To$Snap ($PSF<wand@4>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<wand@4> ($Snap) $PSF<wand@4>)
(assert (forall ((x $PSF<wand@4>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<wand@4>($SortWrappers.$PSF<wand@4>To$Snap x)))
    :pattern (($SortWrappers.$PSF<wand@4>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<wand@4>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<wand@4>To$Snap($SortWrappers.$SnapTo$PSF<wand@4> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<wand@4> x))
    :qid |$Snap.$PSF<wand@4>To$SnapTo$PSF<wand@4>|
    )))
(declare-fun $SortWrappers.$PSF<wand@1>To$Snap ($PSF<wand@1>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<wand@1> ($Snap) $PSF<wand@1>)
(assert (forall ((x $PSF<wand@1>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<wand@1>($SortWrappers.$PSF<wand@1>To$Snap x)))
    :pattern (($SortWrappers.$PSF<wand@1>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<wand@1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<wand@1>To$Snap($SortWrappers.$SnapTo$PSF<wand@1> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<wand@1> x))
    :qid |$Snap.$PSF<wand@1>To$SnapTo$PSF<wand@1>|
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
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) --* acc(Ref.f, Perm) && (acc(Ref.f, Perm) && Ref.f == old[lhs](Ref.f)): Snap]
(declare-fun $PSF.domain_wand@0 ($PSF<wand@0>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@0 ($PSF<wand@0> $Snap) $Snap)
(declare-fun $PSF.after_wand@0 ($PSF<wand@0> $PSF<wand@0>) Bool)
(declare-fun $PSF.loc_wand@0 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@0 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@0 $PSF<wand@0>)
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) --* acc(Ref.f, Perm) && acc(Ref.f, Perm): Snap]
(declare-fun $PSF.domain_wand@2 ($PSF<wand@2>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@2 ($PSF<wand@2> $Snap) $Snap)
(declare-fun $PSF.after_wand@2 ($PSF<wand@2> $PSF<wand@2>) Bool)
(declare-fun $PSF.loc_wand@2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@2 $PSF<wand@2>)
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) && Ref.f == Int --* acc(Ref.f, Perm): Snap]
(declare-fun $PSF.domain_wand@1 ($PSF<wand@1>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@1 ($PSF<wand@1> $Snap) $Snap)
(declare-fun $PSF.after_wand@1 ($PSF<wand@1> $PSF<wand@1>) Bool)
(declare-fun $PSF.loc_wand@1 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@1 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@1 $PSF<wand@1>)
; /predicate_snap_functions_declarations.smt2 [Bool --* acc(Ref.f, Perm): Snap]
(declare-fun $PSF.domain_wand@4 ($PSF<wand@4>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@4 ($PSF<wand@4> $Snap) $Snap)
(declare-fun $PSF.after_wand@4 ($PSF<wand@4> $PSF<wand@4>) Bool)
(declare-fun $PSF.loc_wand@4 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@4 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@4 $PSF<wand@4>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
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
; /predicate_snap_functions_axioms.smt2 [wand@2: Snap]
(assert (forall ((vs $PSF<wand@2>) (ws $PSF<wand@2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_wand@2 vs) ($PSF.domain_wand@2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_wand@2 vs))
            (= ($PSF.lookup_wand@2 vs x) ($PSF.lookup_wand@2 ws x)))
          :pattern (($PSF.lookup_wand@2 vs x) ($PSF.lookup_wand@2 ws x))
          :qid |qp.$PSF<wand@2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<wand@2>To$Snap vs)
              ($SortWrappers.$PSF<wand@2>To$Snap ws)
              )
    :qid |qp.$PSF<wand@2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_wand@2 pm s))
    :pattern (($PSF.perm_wand@2 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_wand@2 f s) true)
    :pattern (($PSF.loc_wand@2 f s)))))
; /predicate_snap_functions_axioms.smt2 [wand@4: Snap]
(assert (forall ((vs $PSF<wand@4>) (ws $PSF<wand@4>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_wand@4 vs) ($PSF.domain_wand@4 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_wand@4 vs))
            (= ($PSF.lookup_wand@4 vs x) ($PSF.lookup_wand@4 ws x)))
          :pattern (($PSF.lookup_wand@4 vs x) ($PSF.lookup_wand@4 ws x))
          :qid |qp.$PSF<wand@4>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<wand@4>To$Snap vs)
              ($SortWrappers.$PSF<wand@4>To$Snap ws)
              )
    :qid |qp.$PSF<wand@4>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_wand@4 pm s))
    :pattern (($PSF.perm_wand@4 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_wand@4 f s) true)
    :pattern (($PSF.loc_wand@4 f s)))))
; /predicate_snap_functions_axioms.smt2 [wand@1: Snap]
(assert (forall ((vs $PSF<wand@1>) (ws $PSF<wand@1>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_wand@1 vs) ($PSF.domain_wand@1 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_wand@1 vs))
            (= ($PSF.lookup_wand@1 vs x) ($PSF.lookup_wand@1 ws x)))
          :pattern (($PSF.lookup_wand@1 vs x) ($PSF.lookup_wand@1 ws x))
          :qid |qp.$PSF<wand@1>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<wand@1>To$Snap vs)
              ($SortWrappers.$PSF<wand@1>To$Snap ws)
              )
    :qid |qp.$PSF<wand@1>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_wand@1 pm s))
    :pattern (($PSF.perm_wand@1 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_wand@1 f s) true)
    :pattern (($PSF.loc_wand@1 f s)))))
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
; ---------- test0 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const y@1@01 $Ref)
(declare-const xs@2@01 Seq<$Ref>)
(declare-const y@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const x@5@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@2@01 x@5@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 x1@5@01)
      (Seq_contains xs@2@01 x2@5@01)
      (= x1@5@01 x2@5@01))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@5@01)
    (and (= (inv@6@01 x@5@01) x@5@01) (img@7@01 x@5@01)))
  :pattern ((Seq_contains xs@2@01 x@5@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@5@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@5@01))
  :pattern ((inv@6@01 x@5@01))
  :pattern ((img@7@01 x@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r))) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Seq_contains xs@2@01 x@5@01) (not (= x@5@01 $Ref.null)))
  :pattern ((Seq_contains xs@2@01 x@5@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@5@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@5@01))
  :pattern ((inv@6@01 x@5@01))
  :pattern ((img@7@01 x@5@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@8@01 Int)
(declare-const j@9@01 Int)
(push) ; 2
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@8@01) | live]
; [else-branch: 0 | 0 <= i@8@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@8@01)]
(assert (not (<= 0 i@8@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@8@01]
(assert (<= 0 i@8@01))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 1 | !(0 <= j@9@01) | live]
; [else-branch: 1 | 0 <= j@9@01 | live]
(push) ; 6
; [then-branch: 1 | !(0 <= j@9@01)]
(assert (not (<= 0 j@9@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | 0 <= j@9@01]
(assert (<= 0 j@9@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 2 | !(i@8@01 < |xs@2@01|) | live]
; [else-branch: 2 | i@8@01 < |xs@2@01| | live]
(push) ; 8
; [then-branch: 2 | !(i@8@01 < |xs@2@01|)]
(assert (not (< i@8@01 (Seq_length xs@2@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | i@8@01 < |xs@2@01|]
(assert (< i@8@01 (Seq_length xs@2@01)))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 3 | !(j@9@01 < |xs@2@01|) | live]
; [else-branch: 3 | j@9@01 < |xs@2@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@9@01 < |xs@2@01|)]
(assert (not (< j@9@01 (Seq_length xs@2@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@9@01 < |xs@2@01|]
(assert (< j@9@01 (Seq_length xs@2@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@9@01 (Seq_length xs@2@01)) (not (< j@9@01 (Seq_length xs@2@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@8@01 (Seq_length xs@2@01))
  (and
    (< i@8@01 (Seq_length xs@2@01))
    (or (< j@9@01 (Seq_length xs@2@01)) (not (< j@9@01 (Seq_length xs@2@01)))))))
(assert (or (< i@8@01 (Seq_length xs@2@01)) (not (< i@8@01 (Seq_length xs@2@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@9@01)
  (and
    (<= 0 j@9@01)
    (=>
      (< i@8@01 (Seq_length xs@2@01))
      (and
        (< i@8@01 (Seq_length xs@2@01))
        (or
          (< j@9@01 (Seq_length xs@2@01))
          (not (< j@9@01 (Seq_length xs@2@01))))))
    (or (< i@8@01 (Seq_length xs@2@01)) (not (< i@8@01 (Seq_length xs@2@01)))))))
(assert (or (<= 0 j@9@01) (not (<= 0 j@9@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@8@01)
  (and
    (<= 0 i@8@01)
    (=>
      (<= 0 j@9@01)
      (and
        (<= 0 j@9@01)
        (=>
          (< i@8@01 (Seq_length xs@2@01))
          (and
            (< i@8@01 (Seq_length xs@2@01))
            (or
              (< j@9@01 (Seq_length xs@2@01))
              (not (< j@9@01 (Seq_length xs@2@01))))))
        (or
          (< i@8@01 (Seq_length xs@2@01))
          (not (< i@8@01 (Seq_length xs@2@01))))))
    (or (<= 0 j@9@01) (not (<= 0 j@9@01))))))
(assert (or (<= 0 i@8@01) (not (<= 0 i@8@01))))
(push) ; 3
; [then-branch: 4 | 0 <= i@8@01 && 0 <= j@9@01 && i@8@01 < |xs@2@01| && j@9@01 < |xs@2@01| && i@8@01 != j@9@01 | live]
; [else-branch: 4 | !(0 <= i@8@01 && 0 <= j@9@01 && i@8@01 < |xs@2@01| && j@9@01 < |xs@2@01| && i@8@01 != j@9@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i@8@01 && 0 <= j@9@01 && i@8@01 < |xs@2@01| && j@9@01 < |xs@2@01| && i@8@01 != j@9@01]
(assert (and
  (<= 0 i@8@01)
  (and
    (<= 0 j@9@01)
    (and
      (< i@8@01 (Seq_length xs@2@01))
      (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i@8@01 && 0 <= j@9@01 && i@8@01 < |xs@2@01| && j@9@01 < |xs@2@01| && i@8@01 != j@9@01)]
(assert (not
  (and
    (<= 0 i@8@01)
    (and
      (<= 0 j@9@01)
      (and
        (< i@8@01 (Seq_length xs@2@01))
        (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@8@01)
    (and
      (<= 0 j@9@01)
      (and
        (< i@8@01 (Seq_length xs@2@01))
        (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))
  (and
    (<= 0 i@8@01)
    (<= 0 j@9@01)
    (< i@8@01 (Seq_length xs@2@01))
    (< j@9@01 (Seq_length xs@2@01))
    (not (= i@8@01 j@9@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@8@01)
      (and
        (<= 0 j@9@01)
        (and
          (< i@8@01 (Seq_length xs@2@01))
          (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01)))))))
  (and
    (<= 0 i@8@01)
    (and
      (<= 0 j@9@01)
      (and
        (< i@8@01 (Seq_length xs@2@01))
        (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (and
    (=>
      (<= 0 i@8@01)
      (and
        (<= 0 i@8@01)
        (=>
          (<= 0 j@9@01)
          (and
            (<= 0 j@9@01)
            (=>
              (< i@8@01 (Seq_length xs@2@01))
              (and
                (< i@8@01 (Seq_length xs@2@01))
                (or
                  (< j@9@01 (Seq_length xs@2@01))
                  (not (< j@9@01 (Seq_length xs@2@01))))))
            (or
              (< i@8@01 (Seq_length xs@2@01))
              (not (< i@8@01 (Seq_length xs@2@01))))))
        (or (<= 0 j@9@01) (not (<= 0 j@9@01)))))
    (or (<= 0 i@8@01) (not (<= 0 i@8@01)))
    (=>
      (and
        (<= 0 i@8@01)
        (and
          (<= 0 j@9@01)
          (and
            (< i@8@01 (Seq_length xs@2@01))
            (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))
      (and
        (<= 0 i@8@01)
        (<= 0 j@9@01)
        (< i@8@01 (Seq_length xs@2@01))
        (< j@9@01 (Seq_length xs@2@01))
        (not (= i@8@01 j@9@01))))
    (or
      (not
        (and
          (<= 0 i@8@01)
          (and
            (<= 0 j@9@01)
            (and
              (< i@8@01 (Seq_length xs@2@01))
              (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01)))))))
      (and
        (<= 0 i@8@01)
        (and
          (<= 0 j@9@01)
          (and
            (< i@8@01 (Seq_length xs@2@01))
            (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))))
  :pattern ((Seq_index xs@2@01 i@8@01) (Seq_index xs@2@01 j@9@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@11@10@11@26-aux|)))
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (=>
    (and
      (<= 0 i@8@01)
      (and
        (<= 0 j@9@01)
        (and
          (< i@8@01 (Seq_length xs@2@01))
          (and (< j@9@01 (Seq_length xs@2@01)) (not (= i@8@01 j@9@01))))))
    (not (= (Seq_index xs@2@01 i@8@01) (Seq_index xs@2@01 j@9@01))))
  :pattern ((Seq_index xs@2@01 i@8@01) (Seq_index xs@2@01 j@9@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@11@10@11@26|)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] |xs| >= 1
; [eval] |xs|
(assert (>= (Seq_length xs@2@01) 1))
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@10@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (not (= y@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var toGo: Seq[Ref]
(declare-const toGo@11@01 Seq<$Ref>)
; [exec]
; var completed: Seq[Ref]
(declare-const completed@12@01 Seq<$Ref>)
; [exec]
; var some: Ref
(declare-const some@13@01 $Ref)
; [exec]
; xs[0].f := 0
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@3@01 (Seq_index xs@2@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@2@01 0))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@15@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@2@01 0))
    ($Perm.min
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@14@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@14@01 r) $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (Seq_index xs@2@01 0)) (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@16@01  $FVF<f>) (Seq_index xs@2@01 0)) 0))
; [exec]
; y.f := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@17@01 r)))
    $Perm.No))
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@17@01 y@3@01)) $Perm.No)))
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
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01) 1))
; [exec]
; label setupComplete
; [exec]
; toGo := xs
; [exec]
; completed := Seq[Ref]()
; [eval] Seq[Ref]()
(declare-const localX@21@01 $Ref)
(declare-const completed@22@01 Seq<$Ref>)
(declare-const toGo@23@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(declare-const x@25@01 $Ref)
(push) ; 4
; [eval] (x in completed)
(assert (Seq_contains completed@22@01 x@25@01))
(pop) ; 4
(declare-fun inv@26@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) $Ref)
(declare-fun img@27@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@25@01 $Ref) (x2@25@01 $Ref)) (!
  (=>
    (and
      (Seq_contains completed@22@01 x1@25@01)
      (Seq_contains completed@22@01 x2@25@01)
      (= x1@25@01 x2@25@01))
    (= x1@25@01 x2@25@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@25@01 $Ref)) (!
  (=>
    (Seq_contains completed@22@01 x@25@01)
    (and
      (=
        (inv@26@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        x@25@01)
      (img@27@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  :pattern ((Seq_contains completed@22@01 x@25@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@25@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@25@01))
  :pattern ((inv@26@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :pattern ((img@27@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :qid |quant-u-10|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
    (and
      (= y@3@01 x0)
      (= $Perm.Write x1)
      (= (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7) x2)
      (= $Perm.Write x3)
      (= y@3@01 x4)
      (= $Perm.Write x5)
      (= y@3@01 x6)
      (= y@3@01 x7)))
  :pattern ((inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (= ($Snap.first ($Snap.second $t@24@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { toGo[i], toGo[j] } 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j])
(declare-const i@28@01 Int)
(declare-const j@29@01 Int)
(push) ; 4
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j]
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j)))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 5 | !(0 <= i@28@01) | live]
; [else-branch: 5 | 0 <= i@28@01 | live]
(push) ; 6
; [then-branch: 5 | !(0 <= i@28@01)]
(assert (not (<= 0 i@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | 0 <= i@28@01]
(assert (<= 0 i@28@01))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 6 | !(0 <= j@29@01) | live]
; [else-branch: 6 | 0 <= j@29@01 | live]
(push) ; 8
; [then-branch: 6 | !(0 <= j@29@01)]
(assert (not (<= 0 j@29@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 6 | 0 <= j@29@01]
(assert (<= 0 j@29@01))
; [eval] i < |toGo|
; [eval] |toGo|
(push) ; 9
; [then-branch: 7 | !(i@28@01 < |toGo@23@01|) | live]
; [else-branch: 7 | i@28@01 < |toGo@23@01| | live]
(push) ; 10
; [then-branch: 7 | !(i@28@01 < |toGo@23@01|)]
(assert (not (< i@28@01 (Seq_length toGo@23@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 7 | i@28@01 < |toGo@23@01|]
(assert (< i@28@01 (Seq_length toGo@23@01)))
; [eval] j < |toGo|
; [eval] |toGo|
(push) ; 11
; [then-branch: 8 | !(j@29@01 < |toGo@23@01|) | live]
; [else-branch: 8 | j@29@01 < |toGo@23@01| | live]
(push) ; 12
; [then-branch: 8 | !(j@29@01 < |toGo@23@01|)]
(assert (not (< j@29@01 (Seq_length toGo@23@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 8 | j@29@01 < |toGo@23@01|]
(assert (< j@29@01 (Seq_length toGo@23@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@29@01 (Seq_length toGo@23@01))
  (not (< j@29@01 (Seq_length toGo@23@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@28@01 (Seq_length toGo@23@01))
  (and
    (< i@28@01 (Seq_length toGo@23@01))
    (or
      (< j@29@01 (Seq_length toGo@23@01))
      (not (< j@29@01 (Seq_length toGo@23@01)))))))
(assert (or
  (< i@28@01 (Seq_length toGo@23@01))
  (not (< i@28@01 (Seq_length toGo@23@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@29@01)
  (and
    (<= 0 j@29@01)
    (=>
      (< i@28@01 (Seq_length toGo@23@01))
      (and
        (< i@28@01 (Seq_length toGo@23@01))
        (or
          (< j@29@01 (Seq_length toGo@23@01))
          (not (< j@29@01 (Seq_length toGo@23@01))))))
    (or
      (< i@28@01 (Seq_length toGo@23@01))
      (not (< i@28@01 (Seq_length toGo@23@01)))))))
(assert (or (<= 0 j@29@01) (not (<= 0 j@29@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@28@01)
  (and
    (<= 0 i@28@01)
    (=>
      (<= 0 j@29@01)
      (and
        (<= 0 j@29@01)
        (=>
          (< i@28@01 (Seq_length toGo@23@01))
          (and
            (< i@28@01 (Seq_length toGo@23@01))
            (or
              (< j@29@01 (Seq_length toGo@23@01))
              (not (< j@29@01 (Seq_length toGo@23@01))))))
        (or
          (< i@28@01 (Seq_length toGo@23@01))
          (not (< i@28@01 (Seq_length toGo@23@01))))))
    (or (<= 0 j@29@01) (not (<= 0 j@29@01))))))
(assert (or (<= 0 i@28@01) (not (<= 0 i@28@01))))
(push) ; 5
; [then-branch: 9 | 0 <= i@28@01 && 0 <= j@29@01 && i@28@01 < |toGo@23@01| && j@29@01 < |toGo@23@01| && i@28@01 != j@29@01 | live]
; [else-branch: 9 | !(0 <= i@28@01 && 0 <= j@29@01 && i@28@01 < |toGo@23@01| && j@29@01 < |toGo@23@01| && i@28@01 != j@29@01) | live]
(push) ; 6
; [then-branch: 9 | 0 <= i@28@01 && 0 <= j@29@01 && i@28@01 < |toGo@23@01| && j@29@01 < |toGo@23@01| && i@28@01 != j@29@01]
(assert (and
  (<= 0 i@28@01)
  (and
    (<= 0 j@29@01)
    (and
      (< i@28@01 (Seq_length toGo@23@01))
      (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01)))))))
; [eval] toGo[i] != toGo[j]
; [eval] toGo[i]
(push) ; 7
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] toGo[j]
(push) ; 7
(assert (not (>= j@29@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(0 <= i@28@01 && 0 <= j@29@01 && i@28@01 < |toGo@23@01| && j@29@01 < |toGo@23@01| && i@28@01 != j@29@01)]
(assert (not
  (and
    (<= 0 i@28@01)
    (and
      (<= 0 j@29@01)
      (and
        (< i@28@01 (Seq_length toGo@23@01))
        (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@28@01)
    (and
      (<= 0 j@29@01)
      (and
        (< i@28@01 (Seq_length toGo@23@01))
        (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))
  (and
    (<= 0 i@28@01)
    (<= 0 j@29@01)
    (< i@28@01 (Seq_length toGo@23@01))
    (< j@29@01 (Seq_length toGo@23@01))
    (not (= i@28@01 j@29@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@28@01)
      (and
        (<= 0 j@29@01)
        (and
          (< i@28@01 (Seq_length toGo@23@01))
          (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01)))))))
  (and
    (<= 0 i@28@01)
    (and
      (<= 0 j@29@01)
      (and
        (< i@28@01 (Seq_length toGo@23@01))
        (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (and
    (=>
      (<= 0 i@28@01)
      (and
        (<= 0 i@28@01)
        (=>
          (<= 0 j@29@01)
          (and
            (<= 0 j@29@01)
            (=>
              (< i@28@01 (Seq_length toGo@23@01))
              (and
                (< i@28@01 (Seq_length toGo@23@01))
                (or
                  (< j@29@01 (Seq_length toGo@23@01))
                  (not (< j@29@01 (Seq_length toGo@23@01))))))
            (or
              (< i@28@01 (Seq_length toGo@23@01))
              (not (< i@28@01 (Seq_length toGo@23@01))))))
        (or (<= 0 j@29@01) (not (<= 0 j@29@01)))))
    (or (<= 0 i@28@01) (not (<= 0 i@28@01)))
    (=>
      (and
        (<= 0 i@28@01)
        (and
          (<= 0 j@29@01)
          (and
            (< i@28@01 (Seq_length toGo@23@01))
            (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))
      (and
        (<= 0 i@28@01)
        (<= 0 j@29@01)
        (< i@28@01 (Seq_length toGo@23@01))
        (< j@29@01 (Seq_length toGo@23@01))
        (not (= i@28@01 j@29@01))))
    (or
      (not
        (and
          (<= 0 i@28@01)
          (and
            (<= 0 j@29@01)
            (and
              (< i@28@01 (Seq_length toGo@23@01))
              (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01)))))))
      (and
        (<= 0 i@28@01)
        (and
          (<= 0 j@29@01)
          (and
            (< i@28@01 (Seq_length toGo@23@01))
            (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))))
  :pattern ((Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117-aux|)))
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (=>
    (and
      (<= 0 i@28@01)
      (and
        (<= 0 j@29@01)
        (and
          (< i@28@01 (Seq_length toGo@23@01))
          (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))
    (not (= (Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))))
  :pattern ((Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|)))
(assert (=
  ($Snap.second ($Snap.second $t@24@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@24@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
(declare-const x@30@01 $Ref)
(push) ; 4
; [eval] (x in toGo)
(assert (Seq_contains toGo@23@01 x@30@01))
(pop) ; 4
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@30@01 $Ref) (x2@30@01 $Ref)) (!
  (=>
    (and
      (Seq_contains toGo@23@01 x1@30@01)
      (Seq_contains toGo@23@01 x2@30@01)
      (= x1@30@01 x2@30@01))
    (= x1@30@01 x2@30@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (Seq_contains toGo@23@01 x@30@01)
    (and (= (inv@31@01 x@30@01) x@30@01) (img@32@01 x@30@01)))
  :pattern ((Seq_contains toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@30@01 $Ref)) (!
  (=> (Seq_contains toGo@23@01 x@30@01) (not (= x@30@01 $Ref.null)))
  :pattern ((Seq_contains toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@24@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
  $Snap.unit))
; [eval] xs == completed ++ toGo
; [eval] completed ++ toGo
(assert (Seq_equal xs@2@01 (Seq_append completed@22@01 toGo@23@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in toGo) } (x in toGo) ==> x.f == old[setupComplete](x.f))
(declare-const x@33@01 $Ref)
(push) ; 4
; [eval] (x in toGo) ==> x.f == old[setupComplete](x.f)
; [eval] (x in toGo)
(push) ; 5
; [then-branch: 10 | x@33@01 in toGo@23@01 | live]
; [else-branch: 10 | !(x@33@01 in toGo@23@01) | live]
(push) ; 6
; [then-branch: 10 | x@33@01 in toGo@23@01]
(assert (Seq_contains toGo@23@01 x@33@01))
; [eval] x.f == old[setupComplete](x.f)
(push) ; 7
(assert (not (and (img@32@01 x@33@01) (Seq_contains toGo@23@01 (inv@31@01 x@33@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(declare-const sm@34@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_f (as pm@35@01  $FPM) x@33@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(x@33@01 in toGo@23@01)]
(assert (not (Seq_contains toGo@23@01 x@33@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Joined path conditions
(assert (or (not (Seq_contains toGo@23@01 x@33@01)) (Seq_contains toGo@23@01 x@33@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@33@01 $Ref)) (!
  (or (not (Seq_contains toGo@23@01 x@33@01)) (Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@33@01 $Ref)) (!
  (or (not (Seq_contains toGo@23@01 x@33@01)) (Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Seq_contains toGo@23@01 x@33@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) x@33@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@33@01)))
  :pattern ((Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
(declare-const sm@36@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  $Snap.unit))
; [eval] y.f == 1
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(declare-const pm@38@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@38@01  $FPM) r)
    (+
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_f (as pm@38@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) y@3@01) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in completed) } (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f)))
(declare-const x@39@01 $Ref)
(push) ; 4
; [eval] (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
; [eval] (x in completed)
(push) ; 5
; [then-branch: 11 | x@39@01 in completed@22@01 | live]
; [else-branch: 11 | !(x@39@01 in completed@22@01) | live]
(push) ; 6
; [then-branch: 11 | x@39@01 in completed@22@01]
(assert (Seq_contains completed@22@01 x@39@01))
; [eval] (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
(push) ; 7
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref) (x@39@01 $Ref)) $Perm
  (ite
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@39@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    ($Perm.min
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 x0 x1 x2 x3 x4 x5 x6 x7 x@39@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (= (pTaken@40@01 x0 x1 x2 x3 x4 x5 x6 x7 x@39@01) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@39@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    (= (- $Perm.Write (pTaken@40@01 x0 x1 x2 x3 x4 x5 x6 x7 x@39@01)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $PSF<wand@0>)
(declare-const s@42@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
    (Seq_contains
      completed@22@01
      (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))
      ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref) (x@39@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@44@01 ((r $Ref) (x@39@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@43@01 r x@39@01)))
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
(assert (not (= (- $Perm.Write (pTaken@43@01 y@3@01 x@39@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@43@01 r x@39@01)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@45@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)))
(assert (=>
  (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
  (=
    ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01))))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
(declare-fun sm@46@01 ($Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))))
(assert (not (= x@39@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(declare-const sm@47@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= y@3@01 x@39@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@39@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
  $Snap.unit))
; [eval] y.f == old[lhs](y.f)
(declare-const sm@48@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@39@01)
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (sm@46@01 x@39@01) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@49@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@49@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] old[lhs](y.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef9|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= x@39@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
    ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@39@01 y@3@01)) (not (= y@3@01 x@39@01))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
  :pattern ((inv@31@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write))
; [eval] x.f == old[setupComplete](x.f)
(declare-const sm@50@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@39@01)
    (=
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
      ($FVF.lookup_f (sm@46@01 x@39@01) r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef16|)))
(declare-const pm@51@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@51@01  $FPM) x@39@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= x@39@01 y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 x@39@01) (Seq_contains xs@2@01 (inv@6@01 x@39@01)))
        (- $Perm.Write (pTaken@14@01 x@39@01))
        $Perm.No))
    (ite (= x@39@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (=>
    (and
      (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
      (Seq_contains
        completed@22@01
        (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))
        ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
  (=
    ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
  (=>
    (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
  (=
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
  (=
    ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(assert (and
  (=
    ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))
  (not (= x@39@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@39@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    $Snap.unit)
  (forall ((r $Ref)) (!
    (=>
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (=
        ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (= r x@39@01)
      (=
        ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
        ($FVF.lookup_f (sm@46@01 x@39@01) r)))
    :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
    :qid |qp.fvfValDef12|))
  (=
    ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
  (not (= x@39@01 y@3@01))
  (not (= y@3@01 x@39@01))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
    :pattern ((inv@31@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
  (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (= r x@39@01)
      (=
        ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
        ($FVF.lookup_f (sm@46@01 x@39@01) r)))
    :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (=
        ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef16|))))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(x@39@01 in completed@22@01)]
(assert (not (Seq_contains completed@22@01 x@39@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (Seq_contains completed@22@01 x@39@01)
  (and
    (Seq_contains completed@22@01 x@39@01)
    (=>
      (and
        (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        (Seq_contains
          completed@22@01
          (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))
          ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
    (=>
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
    (=
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
    (=
      ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (=
      ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (not (= x@39@01 $Ref.null))
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@39@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (=
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@39@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      $Snap.unit)
    (forall ((r $Ref)) (!
      (=>
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
      :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (=>
        (= r x@39@01)
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
          ($FVF.lookup_f (sm@46@01 x@39@01) r)))
      :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
      :qid |qp.fvfValDef11|))
    (forall ((r $Ref)) (!
      (=>
        (= r y@3@01)
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
      :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
      :qid |qp.fvfValDef12|))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
    (not (= x@39@01 y@3@01))
    (not (= y@3@01 x@39@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
      :pattern ((inv@31@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
    (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
    (forall ((r $Ref)) (!
      (=>
        (= r y@3@01)
        (=
          ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
      :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
      :qid |qp.fvfValDef14|))
    (forall ((r $Ref)) (!
      (=>
        (= r x@39@01)
        (=
          ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
          ($FVF.lookup_f (sm@46@01 x@39@01) r)))
      :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
      :qid |qp.fvfValDef15|))
    (forall ((r $Ref)) (!
      (=>
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (=
          ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
      :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
      :qid |qp.fvfValDef16|)))))
; Joined path conditions
(assert (or
  (not (Seq_contains completed@22@01 x@39@01))
  (Seq_contains completed@22@01 x@39@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@39@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@22@01 x@39@01)
      (and
        (Seq_contains completed@22@01 x@39@01)
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@39@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=>
          (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
          (=
            ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@39@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef10|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef11|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef12|))
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
        (not (= x@39@01 y@3@01))
        (not (= y@3@01 x@39@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef14|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef15|))
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef16|))))
    (or
      (not (Seq_contains completed@22@01 x@39@01))
      (Seq_contains completed@22@01 x@39@01)))
  :pattern ((Seq_contains completed@22@01 x@39@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@39@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@22@01 x@39@01)
      (and
        (Seq_contains completed@22@01 x@39@01)
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@39@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=>
          (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
          (=
            ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@39@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef10|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef11|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef12|))
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
        (not (= x@39@01 y@3@01))
        (not (= y@3@01 x@39@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef14|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef15|))
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef16|))))
    (or
      (not (Seq_contains completed@22@01 x@39@01))
      (Seq_contains completed@22@01 x@39@01)))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Seq_contains completed@22@01 x@39@01)
    (=
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) x@39@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@39@01)))
  :pattern ((Seq_contains completed@22@01 x@39@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const x@52@01 $Ref)
(push) ; 4
; [eval] (x in completed)
(assert (Seq_contains (as Seq_empty  Seq<$Ref>) x@52@01))
(pop) ; 4
(declare-fun inv@53@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) $Ref)
(declare-fun img@54@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@52@01 $Ref) (x2@52@01 $Ref)) (!
  (=>
    (and
      (Seq_contains (as Seq_empty  Seq<$Ref>) x1@52@01)
      (Seq_contains (as Seq_empty  Seq<$Ref>) x2@52@01)
      (= x1@52@01 x2@52@01))
    (= x1@52@01 x2@52@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Seq_contains (as Seq_empty  Seq<$Ref>) x@52@01)
    (and
      (=
        (inv@53@01 y@3@01 $Perm.Write x@52@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        x@52@01)
      (img@54@01 y@3@01 $Perm.Write x@52@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  :pattern ((Seq_contains (as Seq_empty  Seq<$Ref>) x@52@01))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@52@01))
  :pattern ((inv@53@01 y@3@01 $Perm.Write x@52@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :pattern ((img@54@01 y@3@01 $Perm.Write x@52@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (img@54@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (Seq_contains
        (as Seq_empty  Seq<$Ref>)
        (inv@53@01 x0 x1 x2 x3 x4 x5 x6 x7)))
    (and
      (= y@3@01 x0)
      (= $Perm.Write x1)
      (= (inv@53@01 x0 x1 x2 x3 x4 x5 x6 x7) x2)
      (= $Perm.Write x3)
      (= y@3@01 x4)
      (= $Perm.Write x5)
      (= y@3@01 x6)
      (= y@3@01 x7)))
  :pattern ((inv@53@01 x0 x1 x2 x3 x4 x5 x6 x7))
  :qid |wand@0-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (Seq_contains
        (as Seq_empty  Seq<$Ref>)
        (inv@53@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@54@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@53@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    false)
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@55@01 $PSF<wand@0>)
(declare-const s@56@01 $Snap)
; Definitional axioms for snapshot map values
; [eval] (forall i: Int, j: Int :: { toGo[i], toGo[j] } 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j])
(declare-const i@57@01 Int)
(declare-const j@58@01 Int)
(push) ; 4
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j]
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j)))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 12 | !(0 <= i@57@01) | live]
; [else-branch: 12 | 0 <= i@57@01 | live]
(push) ; 6
; [then-branch: 12 | !(0 <= i@57@01)]
(assert (not (<= 0 i@57@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | 0 <= i@57@01]
(assert (<= 0 i@57@01))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 13 | !(0 <= j@58@01) | live]
; [else-branch: 13 | 0 <= j@58@01 | live]
(push) ; 8
; [then-branch: 13 | !(0 <= j@58@01)]
(assert (not (<= 0 j@58@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | 0 <= j@58@01]
(assert (<= 0 j@58@01))
; [eval] i < |toGo|
; [eval] |toGo|
(push) ; 9
; [then-branch: 14 | !(i@57@01 < |xs@2@01|) | live]
; [else-branch: 14 | i@57@01 < |xs@2@01| | live]
(push) ; 10
; [then-branch: 14 | !(i@57@01 < |xs@2@01|)]
(assert (not (< i@57@01 (Seq_length xs@2@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 14 | i@57@01 < |xs@2@01|]
(assert (< i@57@01 (Seq_length xs@2@01)))
; [eval] j < |toGo|
; [eval] |toGo|
(push) ; 11
; [then-branch: 15 | !(j@58@01 < |xs@2@01|) | live]
; [else-branch: 15 | j@58@01 < |xs@2@01| | live]
(push) ; 12
; [then-branch: 15 | !(j@58@01 < |xs@2@01|)]
(assert (not (< j@58@01 (Seq_length xs@2@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 15 | j@58@01 < |xs@2@01|]
(assert (< j@58@01 (Seq_length xs@2@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@58@01 (Seq_length xs@2@01)) (not (< j@58@01 (Seq_length xs@2@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@57@01 (Seq_length xs@2@01))
  (and
    (< i@57@01 (Seq_length xs@2@01))
    (or (< j@58@01 (Seq_length xs@2@01)) (not (< j@58@01 (Seq_length xs@2@01)))))))
(assert (or (< i@57@01 (Seq_length xs@2@01)) (not (< i@57@01 (Seq_length xs@2@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@58@01)
  (and
    (<= 0 j@58@01)
    (=>
      (< i@57@01 (Seq_length xs@2@01))
      (and
        (< i@57@01 (Seq_length xs@2@01))
        (or
          (< j@58@01 (Seq_length xs@2@01))
          (not (< j@58@01 (Seq_length xs@2@01))))))
    (or (< i@57@01 (Seq_length xs@2@01)) (not (< i@57@01 (Seq_length xs@2@01)))))))
(assert (or (<= 0 j@58@01) (not (<= 0 j@58@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@57@01)
  (and
    (<= 0 i@57@01)
    (=>
      (<= 0 j@58@01)
      (and
        (<= 0 j@58@01)
        (=>
          (< i@57@01 (Seq_length xs@2@01))
          (and
            (< i@57@01 (Seq_length xs@2@01))
            (or
              (< j@58@01 (Seq_length xs@2@01))
              (not (< j@58@01 (Seq_length xs@2@01))))))
        (or
          (< i@57@01 (Seq_length xs@2@01))
          (not (< i@57@01 (Seq_length xs@2@01))))))
    (or (<= 0 j@58@01) (not (<= 0 j@58@01))))))
(assert (or (<= 0 i@57@01) (not (<= 0 i@57@01))))
(push) ; 5
; [then-branch: 16 | 0 <= i@57@01 && 0 <= j@58@01 && i@57@01 < |xs@2@01| && j@58@01 < |xs@2@01| && i@57@01 != j@58@01 | live]
; [else-branch: 16 | !(0 <= i@57@01 && 0 <= j@58@01 && i@57@01 < |xs@2@01| && j@58@01 < |xs@2@01| && i@57@01 != j@58@01) | live]
(push) ; 6
; [then-branch: 16 | 0 <= i@57@01 && 0 <= j@58@01 && i@57@01 < |xs@2@01| && j@58@01 < |xs@2@01| && i@57@01 != j@58@01]
(assert (and
  (<= 0 i@57@01)
  (and
    (<= 0 j@58@01)
    (and
      (< i@57@01 (Seq_length xs@2@01))
      (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01)))))))
; [eval] toGo[i] != toGo[j]
; [eval] toGo[i]
(push) ; 7
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] toGo[j]
(push) ; 7
(assert (not (>= j@58@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(0 <= i@57@01 && 0 <= j@58@01 && i@57@01 < |xs@2@01| && j@58@01 < |xs@2@01| && i@57@01 != j@58@01)]
(assert (not
  (and
    (<= 0 i@57@01)
    (and
      (<= 0 j@58@01)
      (and
        (< i@57@01 (Seq_length xs@2@01))
        (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@57@01)
    (and
      (<= 0 j@58@01)
      (and
        (< i@57@01 (Seq_length xs@2@01))
        (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))
  (and
    (<= 0 i@57@01)
    (<= 0 j@58@01)
    (< i@57@01 (Seq_length xs@2@01))
    (< j@58@01 (Seq_length xs@2@01))
    (not (= i@57@01 j@58@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@57@01)
      (and
        (<= 0 j@58@01)
        (and
          (< i@57@01 (Seq_length xs@2@01))
          (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01)))))))
  (and
    (<= 0 i@57@01)
    (and
      (<= 0 j@58@01)
      (and
        (< i@57@01 (Seq_length xs@2@01))
        (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@57@01 Int) (j@58@01 Int)) (!
  (and
    (=>
      (<= 0 i@57@01)
      (and
        (<= 0 i@57@01)
        (=>
          (<= 0 j@58@01)
          (and
            (<= 0 j@58@01)
            (=>
              (< i@57@01 (Seq_length xs@2@01))
              (and
                (< i@57@01 (Seq_length xs@2@01))
                (or
                  (< j@58@01 (Seq_length xs@2@01))
                  (not (< j@58@01 (Seq_length xs@2@01))))))
            (or
              (< i@57@01 (Seq_length xs@2@01))
              (not (< i@57@01 (Seq_length xs@2@01))))))
        (or (<= 0 j@58@01) (not (<= 0 j@58@01)))))
    (or (<= 0 i@57@01) (not (<= 0 i@57@01)))
    (=>
      (and
        (<= 0 i@57@01)
        (and
          (<= 0 j@58@01)
          (and
            (< i@57@01 (Seq_length xs@2@01))
            (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))
      (and
        (<= 0 i@57@01)
        (<= 0 j@58@01)
        (< i@57@01 (Seq_length xs@2@01))
        (< j@58@01 (Seq_length xs@2@01))
        (not (= i@57@01 j@58@01))))
    (or
      (not
        (and
          (<= 0 i@57@01)
          (and
            (<= 0 j@58@01)
            (and
              (< i@57@01 (Seq_length xs@2@01))
              (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01)))))))
      (and
        (<= 0 i@57@01)
        (and
          (<= 0 j@58@01)
          (and
            (< i@57@01 (Seq_length xs@2@01))
            (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))))
  :pattern ((Seq_index xs@2@01 i@57@01) (Seq_index xs@2@01 j@58@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117-aux|)))
(push) ; 4
(assert (not (forall ((i@57@01 Int) (j@58@01 Int)) (!
  (=>
    (and
      (<= 0 i@57@01)
      (and
        (<= 0 j@58@01)
        (and
          (< i@57@01 (Seq_length xs@2@01))
          (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))
    (not (= (Seq_index xs@2@01 i@57@01) (Seq_index xs@2@01 j@58@01))))
  :pattern ((Seq_index xs@2@01 i@57@01) (Seq_index xs@2@01 j@58@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@57@01 Int) (j@58@01 Int)) (!
  (=>
    (and
      (<= 0 i@57@01)
      (and
        (<= 0 j@58@01)
        (and
          (< i@57@01 (Seq_length xs@2@01))
          (and (< j@58@01 (Seq_length xs@2@01)) (not (= i@57@01 j@58@01))))))
    (not (= (Seq_index xs@2@01 i@57@01) (Seq_index xs@2@01 j@58@01))))
  :pattern ((Seq_index xs@2@01 i@57@01) (Seq_index xs@2@01 j@58@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|)))
(declare-const x@59@01 $Ref)
(push) ; 4
; [eval] (x in toGo)
(assert (Seq_contains xs@2@01 x@59@01))
(pop) ; 4
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@59@01 $Ref) (x2@59@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 x1@59@01)
      (Seq_contains xs@2@01 x2@59@01)
      (= x1@59@01 x2@59@01))
    (= x1@59@01 x2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@59@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@59@01)
    (and (= (inv@60@01 x@59@01) x@59@01) (img@61@01 x@59@01)))
  :pattern ((Seq_contains xs@2@01 x@59@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@59@01))
  :pattern ((inv@60@01 x@59@01))
  :pattern ((img@61@01 x@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@61@01 r) (Seq_contains xs@2@01 (inv@60@01 r)))
    (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@2@01 (inv@60@01 r)) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@2@01 (inv@60@01 r)) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@62@01 r)))
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and (Seq_contains xs@2@01 (inv@60@01 r)) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)))
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
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
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
    (and (Seq_contains xs@2@01 (inv@60@01 r)) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@2@01 0) (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)
    (pTaken@63@01 (Seq_index xs@2@01 0)))
  $Perm.No)))
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
    (and (Seq_contains xs@2@01 (inv@60@01 r)) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
; [eval] xs == completed ++ toGo
; [eval] completed ++ toGo
(set-option :timeout 0)
(push) ; 4
(assert (not (Seq_equal xs@2@01 (Seq_append (as Seq_empty  Seq<$Ref>) xs@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal xs@2@01 (Seq_append (as Seq_empty  Seq<$Ref>) xs@2@01)))
; [eval] (forall x: Ref :: { (x in toGo) } (x in toGo) ==> x.f == old[setupComplete](x.f))
(declare-const x@66@01 $Ref)
(push) ; 4
; [eval] (x in toGo) ==> x.f == old[setupComplete](x.f)
; [eval] (x in toGo)
(push) ; 5
; [then-branch: 17 | x@66@01 in xs@2@01 | live]
; [else-branch: 17 | !(x@66@01 in xs@2@01) | live]
(push) ; 6
; [then-branch: 17 | x@66@01 in xs@2@01]
(assert (Seq_contains xs@2@01 x@66@01))
; [eval] x.f == old[setupComplete](x.f)
(declare-const sm@67@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
(declare-const pm@68@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@68@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_f (as pm@68@01  $FPM) x@66@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef23|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= x@66@01 y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 x@66@01) (Seq_contains xs@2@01 (inv@6@01 x@66@01)))
        (- $Perm.Write (pTaken@14@01 x@66@01))
        $Perm.No))
    (ite (= x@66@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(x@66@01 in xs@2@01)]
(assert (not (Seq_contains xs@2@01 x@66@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@68@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
; Joined path conditions
(assert (or (not (Seq_contains xs@2@01 x@66@01)) (Seq_contains xs@2@01 x@66@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@68@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@66@01 $Ref)) (!
  (or (not (Seq_contains xs@2@01 x@66@01)) (Seq_contains xs@2@01 x@66@01))
  :pattern ((Seq_contains xs@2@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@66@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@66@01 $Ref)) (!
  (or (not (Seq_contains xs@2@01 x@66@01)) (Seq_contains xs@2@01 x@66@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@66@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@69@01 y@3@01)) $Perm.No)))
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
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@70@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01)))
; [eval] y.f == 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef23|))))
(set-option :timeout 0)
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (+
      $Perm.Write
      (ite
        (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
        (- $Perm.Write (pTaken@14@01 y@3@01))
        $Perm.No))
    (ite (= y@3@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) y@3@01) 1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@67@01  $FVF<f>) y@3@01) 1))
; [eval] (forall x: Ref :: { (x in completed) } (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f)))
(declare-const x@71@01 $Ref)
(push) ; 4
; [eval] (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
; [eval] (x in completed)
(push) ; 5
; [then-branch: 18 | x@71@01 in Nil | live]
; [else-branch: 18 | !(x@71@01 in Nil) | live]
(push) ; 6
; [then-branch: 18 | x@71@01 in Nil]
(assert (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
; [eval] (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
(push) ; 7
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 8
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@71@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    false)
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref) (x@71@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@73@01 ((r $Ref) (x@71@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@72@01 r x@71@01)))
    $Perm.No))
(define-fun pTaken@74@01 ((r $Ref) (x@71@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@72@01 r x@71@01)) (pTaken@73@01 r x@71@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@72@01 y@3@01 x@71@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@72@01 r x@71@01)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= y@3@01 (Seq_index xs@2@01 0))
  (=
    ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@16@01  $FVF<f>) y@3@01))))
(assert (=>
  (ite
    (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
    (< $Perm.No (- $Perm.Write (pTaken@14@01 y@3@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01))))
(assert (=
  ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01)))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
(declare-fun sm@75@01 ($Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@75@01 x@71@01) x@71@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= x@71@01 (Seq_index xs@2@01 0))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (= x@71@01 (Seq_index xs@2@01 0)))
(declare-const $t@76@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (= r (Seq_index xs@2@01 0))
      (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    (=>
      (= r x@71@01)
      (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (sm@75@01 x@71@01) r))))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (sm@75@01 x@71@01) r))
  :pattern (($FVF.lookup_f $t@76@01 r))
  :qid |quant-u-35|)))
(assert (not (= x@71@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(declare-const sm@77@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@77@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= y@3@01 (Seq_index xs@2@01 0))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (= y@3@01 (Seq_index xs@2@01 0)))
(declare-const $t@78@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (= r (Seq_index xs@2@01 0))
      (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f $t@76@01 r)))
    (=>
      (= r y@3@01)
      (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f (as sm@77@01  $FVF<f>) r))))
  :pattern (($FVF.lookup_f $t@76@01 r))
  :pattern (($FVF.lookup_f (as sm@77@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |quant-u-36|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@71@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
  $Snap.unit))
; [eval] y.f == old[lhs](y.f)
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef27|)))
(declare-const pm@80@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@80@01  $FPM) r)
    (+
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@80@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] old[lhs](y.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef18|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= y@3@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
        (- $Perm.Write (pTaken@14@01 y@3@01))
        $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@79@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
  :pattern ((inv@6@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@2@01 0)) $Perm.Write))
; [eval] x.f == old[setupComplete](x.f)
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@82@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(set-option :timeout 0)
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@82@01  $FPM) x@71@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef23|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= x@71@01 y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 x@71@01) (Seq_contains xs@2@01 (inv@6@01 x@71@01)))
        (- $Perm.Write (pTaken@14@01 x@71@01))
        $Perm.No))
    (ite (= x@71@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@80@01  $FPM) r)
    (+
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
(assert (and
  (=>
    (= y@3@01 (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) y@3@01)))
  (=>
    (ite
      (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 y@3@01)))
      false)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01)))
  (=
    ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01))
  (=
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
  (=
    ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(assert (and
  (=
    ($FVF.lookup_f (sm@75@01 x@71@01) x@71@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))
  (= x@71@01 (Seq_index xs@2@01 0))
  (forall ((r $Ref)) (!
    (and
      (=>
        (= r (Seq_index xs@2@01 0))
        (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
      (=>
        (= r x@71@01)
        (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (sm@75@01 x@71@01) r))))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (sm@75@01 x@71@01) r))
    :pattern (($FVF.lookup_f $t@76@01 r))
    :qid |quant-u-35|))
  (not (= x@71@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@77@01  $FVF<f>) y@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
  (= y@3@01 (Seq_index xs@2@01 0))
  (forall ((r $Ref)) (!
    (and
      (=>
        (= r (Seq_index xs@2@01 0))
        (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f $t@76@01 r)))
      (=>
        (= r y@3@01)
        (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f (as sm@77@01  $FVF<f>) r))))
    :pattern (($FVF.lookup_f $t@76@01 r))
    :pattern (($FVF.lookup_f (as sm@77@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@78@01 r))
    :qid |quant-u-36|))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@71@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    $Snap.unit)
  (=
    ($FVF.lookup_f (as sm@79@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
    :pattern ((inv@6@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@2@01 0)) $Perm.Write)))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(x@71@01 in Nil)]
(assert (not (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@80@01  $FPM) r)
    (+
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
  (and
    (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
    (=>
      (= y@3@01 (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) y@3@01)))
    (=>
      (ite
        (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 y@3@01)))
        false)
      (=
        ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01)))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01))
    (=
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
    (=
      ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@71@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@71@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (=
      ($FVF.lookup_f (sm@75@01 x@71@01) x@71@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (= x@71@01 (Seq_index xs@2@01 0))
    (forall ((r $Ref)) (!
      (and
        (=>
          (= r (Seq_index xs@2@01 0))
          (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
        (=>
          (= r x@71@01)
          (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (sm@75@01 x@71@01) r))))
      :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (sm@75@01 x@71@01) r))
      :pattern (($FVF.lookup_f $t@76@01 r))
      :qid |quant-u-35|))
    (not (= x@71@01 $Ref.null))
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@71@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@71@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (=
      ($FVF.lookup_f (as sm@77@01  $FVF<f>) y@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (= y@3@01 (Seq_index xs@2@01 0))
    (forall ((r $Ref)) (!
      (and
        (=>
          (= r (Seq_index xs@2@01 0))
          (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f $t@76@01 r)))
        (=>
          (= r y@3@01)
          (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f (as sm@77@01  $FVF<f>) r))))
      :pattern (($FVF.lookup_f $t@76@01 r))
      :pattern (($FVF.lookup_f (as sm@77@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f $t@78@01 r))
      :qid |quant-u-36|))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@71@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      $Snap.unit)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
      :pattern ((inv@6@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@2@01 0)) $Perm.Write))))
; Joined path conditions
(assert (or
  (not (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
  (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@80@01  $FPM) r)
    (+
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@65@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (= ($FVF.lookup_f (as sm@81@01  $FVF<f>) r) ($FVF.lookup_f $t@78@01 r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@78@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (ite (= r (Seq_index xs@2@01 0)) (/ (to_real 3) (to_real 1)) $Perm.No)
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@67@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@71@01 $Ref)) (!
  (and
    (=>
      (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
      (and
        (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
        (=>
          (= y@3@01 (Seq_index xs@2@01 0))
          (=
            ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f (as sm@16@01  $FVF<f>) y@3@01)))
        (=>
          (ite
            (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
            (< $Perm.No (- $Perm.Write (pTaken@14@01 y@3@01)))
            false)
          (=
            ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01)))
        (=
          ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@75@01 x@71@01) x@71@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (= x@71@01 (Seq_index xs@2@01 0))
        (forall ((r $Ref)) (!
          (and
            (=>
              (= r (Seq_index xs@2@01 0))
              (=
                ($FVF.lookup_f $t@76@01 r)
                ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
            (=>
              (= r x@71@01)
              (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (sm@75@01 x@71@01) r))))
          :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@75@01 x@71@01) r))
          :pattern (($FVF.lookup_f $t@76@01 r))
          :qid |quant-u-35|))
        (not (= x@71@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@77@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (= y@3@01 (Seq_index xs@2@01 0))
        (forall ((r $Ref)) (!
          (and
            (=>
              (= r (Seq_index xs@2@01 0))
              (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f $t@76@01 r)))
            (=>
              (= r y@3@01)
              (=
                ($FVF.lookup_f $t@78@01 r)
                ($FVF.lookup_f (as sm@77@01  $FVF<f>) r))))
          :pattern (($FVF.lookup_f $t@76@01 r))
          :pattern (($FVF.lookup_f (as sm@77@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f $t@78@01 r))
          :qid |quant-u-36|))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (=
          ($FVF.lookup_f (as sm@79@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
          :pattern ((inv@6@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@2@01 0)) $Perm.Write)))
    (or
      (not (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
      (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)))
  :pattern ((Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@71@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@71@01 $Ref)) (!
  (and
    (=>
      (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
      (and
        (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
        (=>
          (= y@3@01 (Seq_index xs@2@01 0))
          (=
            ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f (as sm@16@01  $FVF<f>) y@3@01)))
        (=>
          (ite
            (and (img@7@01 y@3@01) (Seq_contains xs@2@01 (inv@6@01 y@3@01)))
            (< $Perm.No (- $Perm.Write (pTaken@14@01 y@3@01)))
            false)
          (=
            ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) y@3@01)))
        (=
          ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@3@01))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@75@01 x@71@01) x@71@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (= x@71@01 (Seq_index xs@2@01 0))
        (forall ((r $Ref)) (!
          (and
            (=>
              (= r (Seq_index xs@2@01 0))
              (=
                ($FVF.lookup_f $t@76@01 r)
                ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
            (=>
              (= r x@71@01)
              (= ($FVF.lookup_f $t@76@01 r) ($FVF.lookup_f (sm@75@01 x@71@01) r))))
          :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@75@01 x@71@01) r))
          :pattern (($FVF.lookup_f $t@76@01 r))
          :qid |quant-u-35|))
        (not (= x@71@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@71@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@77@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (= y@3@01 (Seq_index xs@2@01 0))
        (forall ((r $Ref)) (!
          (and
            (=>
              (= r (Seq_index xs@2@01 0))
              (= ($FVF.lookup_f $t@78@01 r) ($FVF.lookup_f $t@76@01 r)))
            (=>
              (= r y@3@01)
              (=
                ($FVF.lookup_f $t@78@01 r)
                ($FVF.lookup_f (as sm@77@01  $FVF<f>) r))))
          :pattern (($FVF.lookup_f $t@76@01 r))
          :pattern (($FVF.lookup_f (as sm@77@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f $t@78@01 r))
          :qid |quant-u-36|))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@55@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@71@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (=
          ($FVF.lookup_f (as sm@79@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@65@01  $FVF<f>) y@3@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@80@01  $FPM) r) $Perm.Write)
          :pattern ((inv@6@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@80@01  $FPM) (Seq_index xs@2@01 0)) $Perm.Write)))
    (or
      (not (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
      (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@71@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(push) ; 4
(assert (not (forall ((x@71@01 $Ref)) (!
  (=>
    (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) x@71@01)
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) x@71@01)))
  :pattern ((Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@71@01))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@71@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) x@71@01)
      ($FVF.lookup_f (as sm@67@01  $FVF<f>) x@71@01)))
  :pattern ((Seq_contains (as Seq_empty  Seq<$Ref>) x@71@01))
  :pattern ((Seq_contains_trigger (as Seq_empty  Seq<$Ref>) x@71@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@38@01  $FPM) r)
    (+
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@39@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (=
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  $Snap.unit))
(assert (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) y@3@01) 1))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  $Snap.unit))
(assert (forall ((x@39@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@22@01 x@39@01)
      (and
        (Seq_contains completed@22@01 x@39@01)
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@39@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=>
          (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
          (=
            ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@39@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef10|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef11|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef12|))
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
        (not (= x@39@01 y@3@01))
        (not (= y@3@01 x@39@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef14|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef15|))
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef16|))))
    (or
      (not (Seq_contains completed@22@01 x@39@01))
      (Seq_contains completed@22@01 x@39@01)))
  :pattern ((Seq_contains completed@22@01 x@39@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@39@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@22@01 x@39@01)
      (and
        (Seq_contains completed@22@01 x@39@01)
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@39@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@39@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@39@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=>
          (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
          (=
            ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@46@01 x@39@01) x@39@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@39@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@39@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@47@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@39@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef10|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef11|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef12|))
        (=
          ($FVF.lookup_f (as sm@48@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
        (not (= x@39@01 y@3@01))
        (not (= y@3@01 x@39@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@49@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@49@01  $FPM) x@39@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@49@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
          :qid |qp.fvfValDef14|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@39@01)
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@46@01 x@39@01) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@46@01 x@39@01) r))
          :qid |qp.fvfValDef15|))
        (forall ((r $Ref)) (!
          (=>
            (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
            (=
              ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef16|))))
    (or
      (not (Seq_contains completed@22@01 x@39@01))
      (Seq_contains completed@22@01 x@39@01)))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Seq_contains completed@22@01 x@39@01)
    (=
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) x@39@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@39@01)))
  :pattern ((Seq_contains completed@22@01 x@39@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@39@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite
          (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
          (- $Perm.Write (pTaken@14@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((x@30@01 $Ref)) (!
  (=>
    (Seq_contains toGo@23@01 x@30@01)
    (and (= (inv@31@01 x@30@01) x@30@01) (img@32@01 x@30@01)))
  :pattern ((Seq_contains toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |quant-u-12|)))
(assert (forall ((x@30@01 $Ref)) (!
  (=> (Seq_contains toGo@23@01 x@30@01) (not (= x@30@01 $Ref.null)))
  :pattern ((Seq_contains toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@30@01))
  :pattern ((inv@31@01 x@30@01))
  :pattern ((img@32@01 x@30@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@24@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
  $Snap.unit))
(assert (Seq_equal xs@2@01 (Seq_append completed@22@01 toGo@23@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
  $Snap.unit))
(assert (forall ((x@33@01 $Ref)) (!
  (or (not (Seq_contains toGo@23@01 x@33@01)) (Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@33@01 $Ref)) (!
  (or (not (Seq_contains toGo@23@01 x@33@01)) (Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Seq_contains toGo@23@01 x@33@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) x@33@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@33@01)))
  :pattern ((Seq_contains toGo@23@01 x@33@01))
  :pattern ((Seq_contains_trigger toGo@23@01 x@33@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
    (and
      (= y@3@01 x0)
      (= $Perm.Write x1)
      (= (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7) x2)
      (= $Perm.Write x3)
      (= y@3@01 x4)
      (= $Perm.Write x5)
      (= y@3@01 x6)
      (= y@3@01 x7)))
  :pattern ((inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7))
  :qid |wand@0-fctOfInv|)))
(assert (forall ((x@25@01 $Ref)) (!
  (=>
    (Seq_contains completed@22@01 x@25@01)
    (and
      (=
        (inv@26@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        x@25@01)
      (img@27@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  :pattern ((Seq_contains completed@22@01 x@25@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@25@01))
  :pattern ((Seq_contains_trigger completed@22@01 x@25@01))
  :pattern ((inv@26@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :pattern ((img@27@01 y@3@01 $Perm.Write x@25@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :qid |quant-u-10|)))
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (= ($Snap.first ($Snap.second $t@24@01)) $Snap.unit))
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (and
    (=>
      (<= 0 i@28@01)
      (and
        (<= 0 i@28@01)
        (=>
          (<= 0 j@29@01)
          (and
            (<= 0 j@29@01)
            (=>
              (< i@28@01 (Seq_length toGo@23@01))
              (and
                (< i@28@01 (Seq_length toGo@23@01))
                (or
                  (< j@29@01 (Seq_length toGo@23@01))
                  (not (< j@29@01 (Seq_length toGo@23@01))))))
            (or
              (< i@28@01 (Seq_length toGo@23@01))
              (not (< i@28@01 (Seq_length toGo@23@01))))))
        (or (<= 0 j@29@01) (not (<= 0 j@29@01)))))
    (or (<= 0 i@28@01) (not (<= 0 i@28@01)))
    (=>
      (and
        (<= 0 i@28@01)
        (and
          (<= 0 j@29@01)
          (and
            (< i@28@01 (Seq_length toGo@23@01))
            (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))
      (and
        (<= 0 i@28@01)
        (<= 0 j@29@01)
        (< i@28@01 (Seq_length toGo@23@01))
        (< j@29@01 (Seq_length toGo@23@01))
        (not (= i@28@01 j@29@01))))
    (or
      (not
        (and
          (<= 0 i@28@01)
          (and
            (<= 0 j@29@01)
            (and
              (< i@28@01 (Seq_length toGo@23@01))
              (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01)))))))
      (and
        (<= 0 i@28@01)
        (and
          (<= 0 j@29@01)
          (and
            (< i@28@01 (Seq_length toGo@23@01))
            (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))))
  :pattern ((Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117-aux|)))
(assert (forall ((i@28@01 Int) (j@29@01 Int)) (!
  (=>
    (and
      (<= 0 i@28@01)
      (and
        (<= 0 j@29@01)
        (and
          (< i@28@01 (Seq_length toGo@23@01))
          (and (< j@29@01 (Seq_length toGo@23@01)) (not (= i@28@01 j@29@01))))))
    (not (= (Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))))
  :pattern ((Seq_index toGo@23@01 i@28@01) (Seq_index toGo@23@01 j@29@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|)))
(assert (=
  ($Snap.second ($Snap.second $t@24@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@24@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
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
; [eval] |toGo| != 0
; [eval] |toGo|
(pop) ; 5
(push) ; 5
; [eval] !(|toGo| != 0)
; [eval] |toGo| != 0
; [eval] |toGo|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] |toGo| != 0
; [eval] |toGo|
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_length toGo@23@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_length toGo@23@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | |toGo@23@01| != 0 | live]
; [else-branch: 19 | |toGo@23@01| == 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | |toGo@23@01| != 0]
(assert (not (= (Seq_length toGo@23@01) 0)))
; [exec]
; var localX: Ref
(declare-const localX@83@01 $Ref)
; [exec]
; localX := toGo[0]
; [eval] toGo[0]
(push) ; 6
(assert (not (< 0 (Seq_length toGo@23@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const localX@84@01 $Ref)
(assert (= localX@84@01 (Seq_index toGo@23@01 0)))
; [exec]
; package acc(y.f, write) --*
; acc(localX.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) {
; }
(push) ; 6
(declare-const $t@85@01 $Snap)
(declare-const sm@86@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@86@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt $t@85@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((r $Ref)) (!
  (=> (= r localX@84@01) false)
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@87@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@3@01 localX@84@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (= r localX@84@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@88@01 y@3@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@88@01 r) $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r localX@84@01) (= (- $Perm.Write (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((r $Ref)) (!
  (=> (= r localX@84@01) (= (- $Perm.Write (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@89@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= localX@84@01 y@3@01)
  (=
    ($FVF.lookup_f (as sm@89@01  $FVF<f>) localX@84@01)
    ($FVF.lookup_f (as sm@86@01  $FVF<f>) localX@84@01))))
(assert (= (as sm@87@01  $FVF<f>) (as sm@89@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@3@01 localX@84@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@90@01 ((r $Ref)) $Perm
  (ite
    (= r localX@84@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@88@01 r)))
    $Perm.No))
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (= r localX@84@01)
    ($Perm.min
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@90@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@90@01 r))
    $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@90@01 r) $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r localX@84@01)
    (= (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@90@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@92@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@32@01 localX@84@01)
    (Seq_contains toGo@23@01 (inv@31@01 localX@84@01)))
  (=
    ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) localX@84@01))))
(assert (=>
  (= localX@84@01 y@3@01)
  (=
    ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01)
    ($FVF.lookup_f (as sm@36@01  $FVF<f>) localX@84@01))))
(assert (= (as sm@87@01  $FVF<f>) (as sm@92@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@93@01 $FVF<f>)
(declare-const $t@94@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r localX@84@01) (< $Perm.No (pTaken@88@01 r)) false)
    (= ($FVF.lookup_f $t@93@01 r) ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@93@01 r))
  :qid |quant-u-46|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite (= r localX@84@01) (< $Perm.No (pTaken@88@01 r)) false)
      (= ($FVF.lookup_f $t@94@01 r) ($FVF.lookup_f $t@93@01 r)))
    (=>
      (ite
        (= r localX@84@01)
        (< $Perm.No (- $Perm.Write (pTaken@88@01 r)))
        false)
      (= ($FVF.lookup_f $t@94@01 r) ($FVF.lookup_f (as sm@92@01  $FVF<f>) r))))
  :pattern (($FVF.lookup_f $t@93@01 r))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@94@01 r))
  :qid |quant-u-47|)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) false)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@96@01 y@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@96@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@97@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@86@01  $FVF<f>) y@3@01)))
(assert (= (as sm@95@01  $FVF<f>) (as sm@97@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= y@3@01 localX@84@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const $t@98@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (= ($FVF.lookup_f $t@98@01 r) ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@98@01 r))
  :qid |quant-u-52|)))
; [eval] y.f == old[lhs](y.f)
(declare-const sm@99@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r localX@84@01)
    (= ($FVF.lookup_f (as sm@99@01  $FVF<f>) r) ($FVF.lookup_f $t@94@01 r)))
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@94@01 r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (= ($FVF.lookup_f (as sm@99@01  $FVF<f>) r) ($FVF.lookup_f $t@98@01 r)))
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@98@01 r))
  :qid |qp.fvfValDef37|)))
(declare-const pm@100@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@100@01  $FPM) r)
    (+
      (ite (= r localX@84@01) $Perm.Write $Perm.No)
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(set-option :timeout 0)
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_f (as pm@100@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] old[lhs](y.f)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@86@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@86@01  $FVF<f>) r))
  :qid |qp.fvfValDef35|)))
(push) ; 7
(assert (not (=
  ($FVF.lookup_f (as sm@99@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@99@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01)))
; Create MagicWandSnapFunction for wand acc(y.f, write) --* acc(localX.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f))
(declare-const mwsf@101@01 $MWSF)
(assert (forall (($t@85@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@101@01 $t@85@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@101@01 $t@85@01))
  :qid |quant-u-53|)))
(declare-const sm@102@01 $PSF<wand@0>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap localX@84@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))
  ($Snap.combine
    $t@85@01
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01))
        $Snap.unit)))))
(pop) ; 6
(push) ; 6
(assert (=
  ($FVF.lookup_f (as sm@86@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt $t@85@01)))
(assert (and
  (=>
    (= localX@84@01 y@3@01)
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) localX@84@01)
      ($FVF.lookup_f (as sm@86@01  $FVF<f>) localX@84@01)))
  (= (as sm@87@01  $FVF<f>) (as sm@89@01  $FVF<f>))
  (=>
    (and
      (img@32@01 localX@84@01)
      (Seq_contains toGo@23@01 (inv@31@01 localX@84@01)))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) localX@84@01)))
  (=>
    (= localX@84@01 y@3@01)
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) localX@84@01)))
  (= (as sm@87@01  $FVF<f>) (as sm@92@01  $FVF<f>))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@86@01  $FVF<f>) y@3@01))
  (= (as sm@95@01  $FVF<f>) (as sm@97@01  $FVF<f>))))
(assert (and
  (forall (($t@85@01 $Snap)) (!
    (=
      (MWSF_apply mwsf@101@01 $t@85@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01))
          $Snap.unit)))
    :pattern ((MWSF_apply mwsf@101@01 $t@85@01))
    :qid |quant-u-53|))
  (=
    ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap localX@84@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))
    ($Snap.combine
      $t@85@01
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@92@01  $FVF<f>) localX@84@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@97@01  $FVF<f>) y@3@01))
          $Snap.unit))))))
; [exec]
; completed := completed ++ Seq(localX)
; [eval] completed ++ Seq(localX)
; [eval] Seq(localX)
(assert (= (Seq_length (Seq_singleton localX@84@01)) 1))
(declare-const completed@103@01 Seq<$Ref>)
(assert (= completed@103@01 (Seq_append completed@22@01 (Seq_singleton localX@84@01))))
; [exec]
; toGo := toGo[1..]
; [eval] toGo[1..]
(declare-const toGo@104@01 Seq<$Ref>)
(assert (= toGo@104@01 (Seq_drop toGo@23@01 1)))
; Loop head block: Re-establish invariant
(declare-const x@105@01 $Ref)
(push) ; 7
; [eval] (x in completed)
(assert (Seq_contains completed@103@01 x@105@01))
(pop) ; 7
(declare-fun inv@106@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) $Ref)
(declare-fun img@107@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((x1@105@01 $Ref) (x2@105@01 $Ref)) (!
  (=>
    (and
      (Seq_contains completed@103@01 x1@105@01)
      (Seq_contains completed@103@01 x2@105@01)
      (= x1@105@01 x2@105@01))
    (= x1@105@01 x2@105@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@105@01 $Ref)) (!
  (=>
    (Seq_contains completed@103@01 x@105@01)
    (and
      (=
        (inv@106@01 y@3@01 $Perm.Write x@105@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        x@105@01)
      (img@107@01 y@3@01 $Perm.Write x@105@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  :pattern ((Seq_contains completed@103@01 x@105@01))
  :pattern ((Seq_contains_trigger completed@103@01 x@105@01))
  :pattern ((inv@106@01 y@3@01 $Perm.Write x@105@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :pattern ((img@107@01 y@3@01 $Perm.Write x@105@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (img@107@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (Seq_contains completed@103@01 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7)))
    (and
      (= y@3@01 x0)
      (= $Perm.Write x1)
      (= (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7) x2)
      (= $Perm.Write x3)
      (= y@3@01 x4)
      (= $Perm.Write x5)
      (= y@3@01 x6)
      (= y@3@01 x7)))
  :pattern ((inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
  :qid |wand@0-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) $Perm
  (ite
    (and
      (Seq_contains completed@103@01 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@107@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    ($Perm.min
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@109@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) $Perm
  (ite
    (and
      (Seq_contains completed@103@01 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@107@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    ($Perm.min
      (ite
        (and
          (= x0 y@3@01)
          (= x1 $Perm.Write)
          (= x2 localX@84@01)
          (= x3 $Perm.Write)
          (= x4 y@3@01)
          (= x5 $Perm.Write)
          (= x6 y@3@01)
          (= x7 y@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@108@01 x0 x1 x2 x3 x4 x5 x6 x7)))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 x0 x1 x2 x3 x4 x5 x6 x7))
    $Perm.No)
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (Seq_contains completed@103@01 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@107@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    (= (- $Perm.Write (pTaken@108@01 x0 x1 x2 x3 x4 x5 x6 x7)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (pTaken@109@01 y@3@01 $Perm.Write localX@84@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (Seq_contains completed@103@01 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@107@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@106@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    (=
      (-
        (- $Perm.Write (pTaken@108@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (pTaken@109@01 x0 x1 x2 x3 x4 x5 x6 x7))
      $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@110@01 $PSF<wand@0>)
(declare-const s@111@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@111@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01))))))))
        y@3@01)
      (=
        ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01))))))))
        $Perm.Write)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))))
        localX@84@01)
      (=
        ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01))))))
        $Perm.Write)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@111@01)))))
        y@3@01)
      (=
        ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@111@01))))
        $Perm.Write)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@111@01)))
        y@3@01)
      (= ($SortWrappers.$SnapTo$Ref ($Snap.second s@111@01)) y@3@01))
    (and
      (not (= s@111@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) s@111@01)
        ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) s@111@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) s@111@01))
  :pattern (($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) s@111@01))
  :qid |qp.psmValDef39|)))
(assert (forall ((s@111@01 $Snap)) (!
  (=>
    (and
      (img@27@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@111@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@111@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@111@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@111@01)))
      (Seq_contains
        completed@22@01
        (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@111@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@111@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@111@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@111@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@111@01)))))
    (and
      (not (= s@111@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) s@111@01)
        ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) s@111@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) s@111@01))
  :pattern (($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) s@111@01))
  :qid |qp.psmValDef40|)))
; [eval] (forall i: Int, j: Int :: { toGo[i], toGo[j] } 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j])
(declare-const i@112@01 Int)
(declare-const j@113@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j))) ==> toGo[i] != toGo[j]
; [eval] 0 <= i && (0 <= j && (i < |toGo| && (j < |toGo| && i != j)))
; [eval] 0 <= i
(push) ; 8
; [then-branch: 20 | !(0 <= i@112@01) | live]
; [else-branch: 20 | 0 <= i@112@01 | live]
(push) ; 9
; [then-branch: 20 | !(0 <= i@112@01)]
(assert (not (<= 0 i@112@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | 0 <= i@112@01]
(assert (<= 0 i@112@01))
; [eval] 0 <= j
(push) ; 10
; [then-branch: 21 | !(0 <= j@113@01) | live]
; [else-branch: 21 | 0 <= j@113@01 | live]
(push) ; 11
; [then-branch: 21 | !(0 <= j@113@01)]
(assert (not (<= 0 j@113@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 21 | 0 <= j@113@01]
(assert (<= 0 j@113@01))
; [eval] i < |toGo|
; [eval] |toGo|
(push) ; 12
; [then-branch: 22 | !(i@112@01 < |toGo@104@01|) | live]
; [else-branch: 22 | i@112@01 < |toGo@104@01| | live]
(push) ; 13
; [then-branch: 22 | !(i@112@01 < |toGo@104@01|)]
(assert (not (< i@112@01 (Seq_length toGo@104@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 22 | i@112@01 < |toGo@104@01|]
(assert (< i@112@01 (Seq_length toGo@104@01)))
; [eval] j < |toGo|
; [eval] |toGo|
(push) ; 14
; [then-branch: 23 | !(j@113@01 < |toGo@104@01|) | live]
; [else-branch: 23 | j@113@01 < |toGo@104@01| | live]
(push) ; 15
; [then-branch: 23 | !(j@113@01 < |toGo@104@01|)]
(assert (not (< j@113@01 (Seq_length toGo@104@01))))
(pop) ; 15
(push) ; 15
; [else-branch: 23 | j@113@01 < |toGo@104@01|]
(assert (< j@113@01 (Seq_length toGo@104@01)))
; [eval] i != j
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@113@01 (Seq_length toGo@104@01))
  (not (< j@113@01 (Seq_length toGo@104@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@112@01 (Seq_length toGo@104@01))
  (and
    (< i@112@01 (Seq_length toGo@104@01))
    (or
      (< j@113@01 (Seq_length toGo@104@01))
      (not (< j@113@01 (Seq_length toGo@104@01)))))))
(assert (or
  (< i@112@01 (Seq_length toGo@104@01))
  (not (< i@112@01 (Seq_length toGo@104@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@113@01)
  (and
    (<= 0 j@113@01)
    (=>
      (< i@112@01 (Seq_length toGo@104@01))
      (and
        (< i@112@01 (Seq_length toGo@104@01))
        (or
          (< j@113@01 (Seq_length toGo@104@01))
          (not (< j@113@01 (Seq_length toGo@104@01))))))
    (or
      (< i@112@01 (Seq_length toGo@104@01))
      (not (< i@112@01 (Seq_length toGo@104@01)))))))
(assert (or (<= 0 j@113@01) (not (<= 0 j@113@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@112@01)
  (and
    (<= 0 i@112@01)
    (=>
      (<= 0 j@113@01)
      (and
        (<= 0 j@113@01)
        (=>
          (< i@112@01 (Seq_length toGo@104@01))
          (and
            (< i@112@01 (Seq_length toGo@104@01))
            (or
              (< j@113@01 (Seq_length toGo@104@01))
              (not (< j@113@01 (Seq_length toGo@104@01))))))
        (or
          (< i@112@01 (Seq_length toGo@104@01))
          (not (< i@112@01 (Seq_length toGo@104@01))))))
    (or (<= 0 j@113@01) (not (<= 0 j@113@01))))))
(assert (or (<= 0 i@112@01) (not (<= 0 i@112@01))))
(push) ; 8
; [then-branch: 24 | 0 <= i@112@01 && 0 <= j@113@01 && i@112@01 < |toGo@104@01| && j@113@01 < |toGo@104@01| && i@112@01 != j@113@01 | live]
; [else-branch: 24 | !(0 <= i@112@01 && 0 <= j@113@01 && i@112@01 < |toGo@104@01| && j@113@01 < |toGo@104@01| && i@112@01 != j@113@01) | live]
(push) ; 9
; [then-branch: 24 | 0 <= i@112@01 && 0 <= j@113@01 && i@112@01 < |toGo@104@01| && j@113@01 < |toGo@104@01| && i@112@01 != j@113@01]
(assert (and
  (<= 0 i@112@01)
  (and
    (<= 0 j@113@01)
    (and
      (< i@112@01 (Seq_length toGo@104@01))
      (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01)))))))
; [eval] toGo[i] != toGo[j]
; [eval] toGo[i]
(push) ; 10
(assert (not (>= i@112@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] toGo[j]
(push) ; 10
(assert (not (>= j@113@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 24 | !(0 <= i@112@01 && 0 <= j@113@01 && i@112@01 < |toGo@104@01| && j@113@01 < |toGo@104@01| && i@112@01 != j@113@01)]
(assert (not
  (and
    (<= 0 i@112@01)
    (and
      (<= 0 j@113@01)
      (and
        (< i@112@01 (Seq_length toGo@104@01))
        (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@112@01)
    (and
      (<= 0 j@113@01)
      (and
        (< i@112@01 (Seq_length toGo@104@01))
        (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01))))))
  (and
    (<= 0 i@112@01)
    (<= 0 j@113@01)
    (< i@112@01 (Seq_length toGo@104@01))
    (< j@113@01 (Seq_length toGo@104@01))
    (not (= i@112@01 j@113@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@112@01)
      (and
        (<= 0 j@113@01)
        (and
          (< i@112@01 (Seq_length toGo@104@01))
          (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01)))))))
  (and
    (<= 0 i@112@01)
    (and
      (<= 0 j@113@01)
      (and
        (< i@112@01 (Seq_length toGo@104@01))
        (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@112@01 Int) (j@113@01 Int)) (!
  (and
    (=>
      (<= 0 i@112@01)
      (and
        (<= 0 i@112@01)
        (=>
          (<= 0 j@113@01)
          (and
            (<= 0 j@113@01)
            (=>
              (< i@112@01 (Seq_length toGo@104@01))
              (and
                (< i@112@01 (Seq_length toGo@104@01))
                (or
                  (< j@113@01 (Seq_length toGo@104@01))
                  (not (< j@113@01 (Seq_length toGo@104@01))))))
            (or
              (< i@112@01 (Seq_length toGo@104@01))
              (not (< i@112@01 (Seq_length toGo@104@01))))))
        (or (<= 0 j@113@01) (not (<= 0 j@113@01)))))
    (or (<= 0 i@112@01) (not (<= 0 i@112@01)))
    (=>
      (and
        (<= 0 i@112@01)
        (and
          (<= 0 j@113@01)
          (and
            (< i@112@01 (Seq_length toGo@104@01))
            (and
              (< j@113@01 (Seq_length toGo@104@01))
              (not (= i@112@01 j@113@01))))))
      (and
        (<= 0 i@112@01)
        (<= 0 j@113@01)
        (< i@112@01 (Seq_length toGo@104@01))
        (< j@113@01 (Seq_length toGo@104@01))
        (not (= i@112@01 j@113@01))))
    (or
      (not
        (and
          (<= 0 i@112@01)
          (and
            (<= 0 j@113@01)
            (and
              (< i@112@01 (Seq_length toGo@104@01))
              (and
                (< j@113@01 (Seq_length toGo@104@01))
                (not (= i@112@01 j@113@01)))))))
      (and
        (<= 0 i@112@01)
        (and
          (<= 0 j@113@01)
          (and
            (< i@112@01 (Seq_length toGo@104@01))
            (and
              (< j@113@01 (Seq_length toGo@104@01))
              (not (= i@112@01 j@113@01))))))))
  :pattern ((Seq_index toGo@104@01 i@112@01) (Seq_index toGo@104@01 j@113@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117-aux|)))
(push) ; 7
(assert (not (forall ((i@112@01 Int) (j@113@01 Int)) (!
  (=>
    (and
      (<= 0 i@112@01)
      (and
        (<= 0 j@113@01)
        (and
          (< i@112@01 (Seq_length toGo@104@01))
          (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01))))))
    (not (= (Seq_index toGo@104@01 i@112@01) (Seq_index toGo@104@01 j@113@01))))
  :pattern ((Seq_index toGo@104@01 i@112@01) (Seq_index toGo@104@01 j@113@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@112@01 Int) (j@113@01 Int)) (!
  (=>
    (and
      (<= 0 i@112@01)
      (and
        (<= 0 j@113@01)
        (and
          (< i@112@01 (Seq_length toGo@104@01))
          (and (< j@113@01 (Seq_length toGo@104@01)) (not (= i@112@01 j@113@01))))))
    (not (= (Seq_index toGo@104@01 i@112@01) (Seq_index toGo@104@01 j@113@01))))
  :pattern ((Seq_index toGo@104@01 i@112@01) (Seq_index toGo@104@01 j@113@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@21@15@21@117|)))
(declare-const x@114@01 $Ref)
(push) ; 7
; [eval] (x in toGo)
(assert (Seq_contains toGo@104@01 x@114@01))
(pop) ; 7
(declare-fun inv@115@01 ($Ref) $Ref)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((x1@114@01 $Ref) (x2@114@01 $Ref)) (!
  (=>
    (and
      (Seq_contains toGo@104@01 x1@114@01)
      (Seq_contains toGo@104@01 x2@114@01)
      (= x1@114@01 x2@114@01))
    (= x1@114@01 x2@114@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@114@01 $Ref)) (!
  (=>
    (Seq_contains toGo@104@01 x@114@01)
    (and (= (inv@115@01 x@114@01) x@114@01) (img@116@01 x@114@01)))
  :pattern ((Seq_contains toGo@104@01 x@114@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@114@01))
  :pattern ((inv@115@01 x@114@01))
  :pattern ((img@116@01 x@114@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (Seq_contains toGo@104@01 (inv@115@01 r)))
    (= (inv@115@01 r) r))
  :pattern ((inv@115@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains toGo@104@01 (inv@115@01 r))
      (img@116@01 r)
      (= r (inv@115@01 r)))
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@118@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains toGo@104@01 (inv@115@01 r))
      (img@116@01 r)
      (= r (inv@115@01 r)))
    ($Perm.min
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@117@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)
      (pTaken@117@01 r))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains toGo@104@01 (inv@115@01 r))
      (img@116@01 r)
      (= r (inv@115@01 r)))
    (= (- $Perm.Write (pTaken@117@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@119@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
; [eval] xs == completed ++ toGo
; [eval] completed ++ toGo
(set-option :timeout 0)
(push) ; 7
(assert (not (Seq_equal xs@2@01 (Seq_append completed@103@01 toGo@104@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(assert (Seq_equal xs@2@01 (Seq_append completed@103@01 toGo@104@01)))
; [eval] (forall x: Ref :: { (x in toGo) } (x in toGo) ==> x.f == old[setupComplete](x.f))
(declare-const x@120@01 $Ref)
(push) ; 7
; [eval] (x in toGo) ==> x.f == old[setupComplete](x.f)
; [eval] (x in toGo)
(push) ; 8
; [then-branch: 25 | x@120@01 in toGo@104@01 | live]
; [else-branch: 25 | !(x@120@01 in toGo@104@01) | live]
(push) ; 9
; [then-branch: 25 | x@120@01 in toGo@104@01]
(assert (Seq_contains toGo@104@01 x@120@01))
; [eval] x.f == old[setupComplete](x.f)
(declare-const sm@121@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@122@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_f (as pm@122@01  $FPM) x@120@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= x@120@01 y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 x@120@01) (Seq_contains xs@2@01 (inv@6@01 x@120@01)))
        (- $Perm.Write (pTaken@14@01 x@120@01))
        $Perm.No))
    (ite (= x@120@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 25 | !(x@120@01 in toGo@104@01)]
(assert (not (Seq_contains toGo@104@01 x@120@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or
  (not (Seq_contains toGo@104@01 x@120@01))
  (Seq_contains toGo@104@01 x@120@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite (= r y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@120@01 $Ref)) (!
  (or
    (not (Seq_contains toGo@104@01 x@120@01))
    (Seq_contains toGo@104@01 x@120@01))
  :pattern ((Seq_contains toGo@104@01 x@120@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@120@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(assert (forall ((x@120@01 $Ref)) (!
  (or
    (not (Seq_contains toGo@104@01 x@120@01))
    (Seq_contains toGo@104@01 x@120@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@120@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76-aux|)))
(push) ; 7
(assert (not (forall ((x@120@01 $Ref)) (!
  (=>
    (Seq_contains toGo@104@01 x@120@01)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) x@120@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@120@01)))
  :pattern ((Seq_contains toGo@104@01 x@120@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@120@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@120@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@120@01 $Ref)) (!
  (=>
    (Seq_contains toGo@104@01 x@120@01)
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) x@120@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@120@01)))
  :pattern ((Seq_contains toGo@104@01 x@120@01))
  :pattern ((Seq_contains_trigger toGo@104@01 x@120@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@24@15@24@76|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@123@01 y@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-66|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@124@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@124@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)))
; [eval] y.f == 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
    :qid |qp.fvfValDef43|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef44|))))
(set-option :timeout 0)
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      (- $Perm.Write (pTaken@90@01 y@3@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) y@3@01) 1)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) y@3@01) 1))
; [eval] (forall x: Ref :: { (x in completed) } (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f)))
(declare-const x@125@01 $Ref)
(push) ; 7
; [eval] (x in completed) ==> (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
; [eval] (x in completed)
(push) ; 8
; [then-branch: 26 | x@125@01 in completed@103@01 | live]
; [else-branch: 26 | !(x@125@01 in completed@103@01) | live]
(push) ; 9
; [then-branch: 26 | x@125@01 in completed@103@01]
(assert (Seq_contains completed@103@01 x@125@01))
; [eval] (applying acc(y.f, write) --* acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)) in x.f == old[setupComplete](x.f))
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= localX@84@01 x@125@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@126@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref) (x@125@01 $Ref)) $Perm
  (ite
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@125@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    ($Perm.min
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@127@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref) (x@125@01 $Ref)) $Perm
  (ite
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@125@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    ($Perm.min
      (ite
        (and
          (= x0 y@3@01)
          (= x1 $Perm.Write)
          (= x2 localX@84@01)
          (= x3 $Perm.Write)
          (= x4 y@3@01)
          (= x5 $Perm.Write)
          (= x6 y@3@01)
          (= x7 y@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@126@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      (pTaken@126@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01))
    $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (= (pTaken@126@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01) $Perm.No)
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@125@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    (= (- $Perm.Write (pTaken@126@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (pTaken@127@01 y@3@01 $Perm.Write localX@84@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01 x@125@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (= (pTaken@127@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01) $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 x@125@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    (=
      (-
        (- $Perm.Write (pTaken@126@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01))
        (pTaken@127@01 x0 x1 x2 x3 x4 x5 x6 x7 x@125@01))
      $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= x@125@01 localX@84@01)
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))
      ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
(assert (=>
  (and
    (img@27@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
    (Seq_contains
      completed@22@01
      (inv@26@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))
      ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@128@01 ((r $Ref) (x@125@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@129@01 ((r $Ref) (x@125@01 $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@128@01 r x@125@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@128@01 y@3@01 x@125@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@128@01 r x@125@01)) $Perm.No))
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
    (< $Perm.No (- $Perm.Write (pTaken@90@01 y@3@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01))))
(assert (=
  ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
(declare-fun sm@130@01 ($Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))))
(assert (not (= x@125@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(declare-const sm@131@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= y@3@01 x@125@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap x@125@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
  $Snap.unit))
; [eval] y.f == old[lhs](y.f)
(declare-const sm@132@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@125@01)
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
      ($FVF.lookup_f (sm@130@01 x@125@01) r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfValDef49|)))
(declare-const pm@133@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@133@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (- $Perm.Write (pTaken@90@01 r))
          $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@133@01  $FPM) r))
  :qid |qp.resPrmSumDef50|)))
(set-option :timeout 0)
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_f (as pm@133@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] old[lhs](y.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef41|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
    :qid |qp.fvfValDef42|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      (- $Perm.Write (pTaken@90@01 y@3@01))
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@132@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= x@125@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
    ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@125@01 y@3@01)) (not (= y@3@01 x@125@01))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@133@01  $FPM) r) $Perm.Write)
  :pattern ((inv@31@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@133@01  $FPM) x@125@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@133@01  $FPM) y@3@01) $Perm.Write))
; [eval] x.f == old[setupComplete](x.f)
(declare-const sm@134@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@125@01)
    (=
      ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
      ($FVF.lookup_f (sm@130@01 x@125@01) r)))
  :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef53|)))
(declare-const pm@135@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@135@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@135@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(set-option :timeout 0)
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_f (as pm@135@01  $FPM) x@125@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] old[setupComplete](x.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@2@01 0))
      (=
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= x@125@01 y@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@7@01 x@125@01) (Seq_contains xs@2@01 (inv@6@01 x@125@01)))
        (- $Perm.Write (pTaken@14@01 x@125@01))
        $Perm.No))
    (ite (= x@125@01 (Seq_index xs@2@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@133@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (- $Perm.Write (pTaken@90@01 r))
          $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@133@01  $FPM) r))
  :qid |qp.resPrmSumDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@135@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@135@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (=>
    (= x@125@01 localX@84@01)
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))
        ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
  (=>
    (and
      (img@27@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
      (Seq_contains
        completed@22@01
        (inv@26@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))
        ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
  (=>
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 y@3@01)))
      false)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
  (=
    ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
  (=
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
  (=
    ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(assert (and
  (=
    ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))
  (not (= x@125@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap x@125@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    $Snap.unit)
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef47|))
  (forall ((r $Ref)) (!
    (=>
      (= r x@125@01)
      (=
        ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
        ($FVF.lookup_f (sm@130@01 x@125@01) r)))
    :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
    :qid |qp.fvfValDef48|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
    :qid |qp.fvfValDef49|))
  (=
    ($FVF.lookup_f (as sm@132@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
  (not (= x@125@01 y@3@01))
  (not (= y@3@01 x@125@01))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@133@01  $FPM) r) $Perm.Write)
    :pattern ((inv@31@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@133@01  $FPM) x@125@01) $Perm.Write)
  (<= ($FVF.perm_f (as pm@133@01  $FPM) y@3@01) $Perm.Write)
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
    :qid |qp.fvfValDef51|))
  (forall ((r $Ref)) (!
    (=>
      (= r x@125@01)
      (=
        ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
        ($FVF.lookup_f (sm@130@01 x@125@01) r)))
    :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
    :qid |qp.fvfValDef52|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef53|))))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | !(x@125@01 in completed@103@01)]
(assert (not (Seq_contains completed@103@01 x@125@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@133@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (- $Perm.Write (pTaken@90@01 r))
          $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@133@01  $FPM) r))
  :qid |qp.resPrmSumDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@135@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@135@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (Seq_contains completed@103@01 x@125@01)
  (and
    (Seq_contains completed@103@01 x@125@01)
    (=>
      (= x@125@01 localX@84@01)
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))
          ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
    (=>
      (and
        (img@27@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        (Seq_contains
          completed@22@01
          (inv@26@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))
          ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
    (=>
      (ite
        (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 y@3@01)))
        false)
      (=
        ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
    (=
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
    (=
      ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))
        ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (=
      ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
    (not (= x@125@01 $Ref.null))
    (=
      ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap x@125@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (=
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap x@125@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01))))))
      $Snap.unit)
    (forall ((r $Ref)) (!
      (=>
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
          false)
        (=
          ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
      :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
      :qid |qp.fvfValDef47|))
    (forall ((r $Ref)) (!
      (=>
        (= r x@125@01)
        (=
          ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
          ($FVF.lookup_f (sm@130@01 x@125@01) r)))
      :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
      :qid |qp.fvfValDef48|))
    (forall ((r $Ref)) (!
      (=>
        (= r y@3@01)
        (=
          ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
          ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
      :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
      :qid |qp.fvfValDef49|))
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) y@3@01)
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
    (not (= x@125@01 y@3@01))
    (not (= y@3@01 x@125@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@133@01  $FPM) r) $Perm.Write)
      :pattern ((inv@31@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@133@01  $FPM) x@125@01) $Perm.Write)
    (<= ($FVF.perm_f (as pm@133@01  $FPM) y@3@01) $Perm.Write)
    (forall ((r $Ref)) (!
      (=>
        (= r y@3@01)
        (=
          ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
          ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
      :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
      :qid |qp.fvfValDef51|))
    (forall ((r $Ref)) (!
      (=>
        (= r x@125@01)
        (=
          ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
          ($FVF.lookup_f (sm@130@01 x@125@01) r)))
      :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
      :qid |qp.fvfValDef52|))
    (forall ((r $Ref)) (!
      (=>
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
          false)
        (=
          ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
      :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
      :qid |qp.fvfValDef53|)))))
; Joined path conditions
(assert (or
  (not (Seq_contains completed@103@01 x@125@01))
  (Seq_contains completed@103@01 x@125@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@133@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          (- $Perm.Write (pTaken@90@01 r))
          $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@133@01  $FPM) r))
  :qid |qp.resPrmSumDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@119@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@119@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@135@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r x@125@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@135@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@7@01 r) (Seq_contains xs@2@01 (inv@6@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@2@01 0))
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@16@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@16@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@125@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@103@01 x@125@01)
      (and
        (Seq_contains completed@103@01 x@125@01)
        (=>
          (= x@125@01 localX@84@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@125@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@125@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=>
          (ite
            (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
            (< $Perm.No (- $Perm.Write (pTaken@90@01 y@3@01)))
            false)
          (=
            ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@125@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (ite
              (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
              (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
              false)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef47|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@125@01)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@130@01 x@125@01) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
          :qid |qp.fvfValDef48|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
          :qid |qp.fvfValDef49|))
        (=
          ($FVF.lookup_f (as sm@132@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
        (not (= x@125@01 y@3@01))
        (not (= y@3@01 x@125@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@133@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@133@01  $FPM) x@125@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@133@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
          :qid |qp.fvfValDef51|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@125@01)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@130@01 x@125@01) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
          :qid |qp.fvfValDef52|))
        (forall ((r $Ref)) (!
          (=>
            (ite
              (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
              (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
              false)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef53|))))
    (or
      (not (Seq_contains completed@103@01 x@125@01))
      (Seq_contains completed@103@01 x@125@01)))
  :pattern ((Seq_contains completed@103@01 x@125@01))
  :pattern ((Seq_contains_trigger completed@103@01 x@125@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(assert (forall ((x@125@01 $Ref)) (!
  (and
    (=>
      (Seq_contains completed@103@01 x@125@01)
      (and
        (Seq_contains completed@103@01 x@125@01)
        (=>
          (= x@125@01 localX@84@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@125@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 (as sm@102@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=>
          (and
            (img@27@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
            (Seq_contains
              completed@22@01
              (inv@26@01 y@3@01 $Perm.Write x@125@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap y@3@01)
                              ($SortWrappers.$PermTo$Snap $Perm.Write))
                            ($SortWrappers.$RefTo$Snap x@125@01))
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap y@3@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01)))
              ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap y@3@01)
                            ($SortWrappers.$PermTo$Snap $Perm.Write))
                          ($SortWrappers.$RefTo$Snap x@125@01))
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap y@3@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$RefTo$Snap y@3@01))))))
        (=>
          (ite
            (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
            (< $Perm.No (- $Perm.Write (pTaken@90@01 y@3@01)))
            false)
          (=
            ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01)))
        (=
          ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01))
        (=
          ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
        (=
          ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))
            ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (=
          ($FVF.lookup_f (sm@130@01 x@125@01) x@125@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))))
        (not (= x@125@01 $Ref.null))
        (=
          ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))
            ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap y@3@01)
                          ($SortWrappers.$PermTo$Snap $Perm.Write))
                        ($SortWrappers.$RefTo$Snap x@125@01))
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap y@3@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($FVF.lookup_f (as sm@131@01  $FVF<f>) y@3@01)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@110@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($Snap.combine
                        ($SortWrappers.$RefTo$Snap y@3@01)
                        ($SortWrappers.$PermTo$Snap $Perm.Write))
                      ($SortWrappers.$RefTo$Snap x@125@01))
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap y@3@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$RefTo$Snap y@3@01))))))
          $Snap.unit)
        (forall ((r $Ref)) (!
          (=>
            (ite
              (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
              (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
              false)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef47|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@125@01)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@130@01 x@125@01) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
          :qid |qp.fvfValDef48|))
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
          :qid |qp.fvfValDef49|))
        (=
          ($FVF.lookup_f (as sm@132@01  $FVF<f>) y@3@01)
          ($FVF.lookup_f (as sm@119@01  $FVF<f>) y@3@01))
        (not (= x@125@01 y@3@01))
        (not (= y@3@01 x@125@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@133@01  $FPM) r) $Perm.Write)
          :pattern ((inv@31@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@133@01  $FPM) x@125@01) $Perm.Write)
        (<= ($FVF.perm_f (as pm@133@01  $FPM) y@3@01) $Perm.Write)
        (forall ((r $Ref)) (!
          (=>
            (= r y@3@01)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
          :qid |qp.fvfValDef51|))
        (forall ((r $Ref)) (!
          (=>
            (= r x@125@01)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f (sm@130@01 x@125@01) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f (sm@130@01 x@125@01) r))
          :qid |qp.fvfValDef52|))
        (forall ((r $Ref)) (!
          (=>
            (ite
              (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
              (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
              false)
            (=
              ($FVF.lookup_f (as sm@134@01  $FVF<f>) r)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
          :pattern (($FVF.lookup_f (as sm@134@01  $FVF<f>) r))
          :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
          :qid |qp.fvfValDef53|))))
    (or
      (not (Seq_contains completed@103@01 x@125@01))
      (Seq_contains completed@103@01 x@125@01)))
  :pattern ((Seq_contains_trigger completed@103@01 x@125@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37-aux|)))
(push) ; 7
(assert (not (forall ((x@125@01 $Ref)) (!
  (=>
    (Seq_contains completed@103@01 x@125@01)
    (=
      ($FVF.lookup_f (as sm@134@01  $FVF<f>) x@125@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@125@01)))
  :pattern ((Seq_contains completed@103@01 x@125@01))
  :pattern ((Seq_contains_trigger completed@103@01 x@125@01))
  :pattern ((Seq_contains_trigger completed@103@01 x@125@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@125@01 $Ref)) (!
  (=>
    (Seq_contains completed@103@01 x@125@01)
    (=
      ($FVF.lookup_f (as sm@134@01  $FVF<f>) x@125@01)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) x@125@01)))
  :pattern ((Seq_contains completed@103@01 x@125@01))
  :pattern ((Seq_contains_trigger completed@103@01 x@125@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@27@15@29@37|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 19 | |toGo@23@01| == 0]
(assert (= (Seq_length toGo@23@01) 0))
(pop) ; 5
; [eval] !(|toGo| != 0)
; [eval] |toGo| != 0
; [eval] |toGo|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (Seq_length toGo@23@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_length toGo@23@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | |toGo@23@01| == 0 | live]
; [else-branch: 27 | |toGo@23@01| != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | |toGo@23@01| == 0]
(assert (= (Seq_length toGo@23@01) 0))
; [exec]
; assert (forall x: Ref ::(x in xs) ==>
;     acc(y.f, write) --*
;     acc(x.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f)))
(declare-const x@136@01 $Ref)
(push) ; 6
; [eval] (x in xs)
(assert (Seq_contains xs@2@01 x@136@01))
(pop) ; 6
(declare-fun inv@137@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) $Ref)
(declare-fun img@138@01 ($Ref $Perm $Ref $Perm $Ref $Perm $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@136@01 $Ref) (x2@136@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 x1@136@01)
      (Seq_contains xs@2@01 x2@136@01)
      (= x1@136@01 x2@136@01))
    (= x1@136@01 x2@136@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@136@01 $Ref)) (!
  (=>
    (Seq_contains xs@2@01 x@136@01)
    (and
      (=
        (inv@137@01 y@3@01 $Perm.Write x@136@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
        x@136@01)
      (img@138@01 y@3@01 $Perm.Write x@136@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  :pattern ((Seq_contains xs@2@01 x@136@01))
  :pattern ((Seq_contains_trigger xs@2@01 x@136@01))
  :pattern ((inv@137@01 y@3@01 $Perm.Write x@136@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :pattern ((img@138@01 y@3@01 $Perm.Write x@136@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (img@138@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (Seq_contains xs@2@01 (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7)))
    (and
      (= y@3@01 x0)
      (= $Perm.Write x1)
      (= (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7) x2)
      (= $Perm.Write x3)
      (= y@3@01 x4)
      (= $Perm.Write x5)
      (= y@3@01 x6)
      (= y@3@01 x7)))
  :pattern ((inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7))
  :qid |wand@0-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@2@01 (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@138@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    ($Perm.min
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      (pTaken@139@01 x0 x1 x2 x3 x4 x5 x6 x7))
    $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@2@01 (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7))
      (img@138@01 x0 x1 x2 x3 x4 x5 x6 x7)
      (and
        (= x0 y@3@01)
        (= x1 $Perm.Write)
        (= x2 (inv@137@01 x0 x1 x2 x3 x4 x5 x6 x7))
        (= x3 $Perm.Write)
        (= x4 y@3@01)
        (= x5 $Perm.Write)
        (= x6 y@3@01)
        (= x7 y@3@01)))
    (= (- $Perm.Write (pTaken@139@01 x0 x1 x2 x3 x4 x5 x6 x7)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((s@42@01 $Snap)) (!
  (=>
    (and
      (img@27@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@42@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@42@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@42@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@42@01)))
      (Seq_contains
        completed@22@01
        (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01))))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@42@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@42@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@42@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@42@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second s@42@01)))))
    (and
      (not (= s@42@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) s@42@01)
        ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) s@42@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@41@01  $PSF<wand@0>) s@42@01))
  :pattern (($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) s@42@01))
  :qid |qp.psmValDef7|)))
; [exec]
; some := xs[0]
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 6
(assert (not (< 0 (Seq_length xs@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const some@140@01 $Ref)
(assert (= some@140@01 (Seq_index xs@2@01 0)))
; [exec]
; apply acc(y.f, write) --*
;   acc(some.f, write) && (acc(y.f, write) && y.f == old[lhs](y.f))
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) $Perm
  (ite
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 some@140@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    ($Perm.min
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 x0 x1 x2 x3 x4 x5 x6 x7)
          (Seq_contains completed@22@01 (inv@26@01 x0 x1 x2 x3 x4 x5 x6 x7)))
        $Perm.Write
        $Perm.No)
      (pTaken@141@01 x0 x1 x2 x3 x4 x5 x6 x7))
    $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (= (pTaken@141@01 x0 x1 x2 x3 x4 x5 x6 x7) $Perm.No)
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm) (x6 $Ref) (x7 $Ref)) (!
  (=>
    (and
      (= x0 y@3@01)
      (= x1 $Perm.Write)
      (= x2 some@140@01)
      (= x3 $Perm.Write)
      (= x4 y@3@01)
      (= x5 $Perm.Write)
      (= x6 y@3@01)
      (= x7 y@3@01))
    (= (- $Perm.Write (pTaken@141@01 x0 x1 x2 x3 x4 x5 x6 x7)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@142@01 $PSF<wand@0>)
(declare-const s@143@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@27@01 y@3@01 $Perm.Write some@140@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)
    (Seq_contains
      completed@22@01
      (inv@26@01 y@3@01 $Perm.Write some@140@01 $Perm.Write y@3@01 $Perm.Write y@3@01 y@3@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap y@3@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap some@140@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap y@3@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$RefTo$Snap y@3@01))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap some@140@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))
      ($PSF.lookup_wand@0 ($SortWrappers.$SnapTo$PSF<wand@0> ($Snap.first $t@24@01)) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@3@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap some@140@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@3@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$RefTo$Snap y@3@01)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min (ite (= r y@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@145@01 ((r $Ref)) $Perm
  (ite
    (= r y@3@01)
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@144@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@144@01 y@3@01)) $Perm.No)))
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
  (=> (= r y@3@01) (= (- $Perm.Write (pTaken@144@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@36@01  $FVF<f>) y@3@01)))
(assert (=>
  (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
  (=
    ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) y@3@01))))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@140@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@140@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))))
(declare-const sm@146@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@146@01  $FVF<f>) some@140@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))))
(assert (not (= some@140@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@140@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@3@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@140@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@3@01))
      ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(declare-const sm@147@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@147@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01)))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= y@3@01 some@140@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_wand@0 (as sm@142@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@3@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@140@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$RefTo$Snap y@3@01))))))
  $Snap.unit))
; [eval] y.f == old[lhs](y.f)
(declare-const sm@148@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@148@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@148@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r some@140@01)
    (=
      ($FVF.lookup_f (as sm@148@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@148@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@148@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@147@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@148@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@147@01  $FVF<f>) r))
  :qid |qp.fvfValDef58|)))
(declare-const pm@149@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@149@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
          $Perm.Write
          $Perm.No)
        (ite (= r some@140@01) $Perm.Write $Perm.No))
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@149@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(set-option :timeout 0)
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@149@01  $FPM) y@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old[lhs](y.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@36@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@36@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef9|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    $Perm.Write
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@148@01  $FVF<f>) y@3@01)
  ($FVF.lookup_f (as sm@45@01  $FVF<f>) y@3@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= some@140@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@146@01  $FVF<f>) some@140@01)
    ($FVF.lookup_f (as sm@147@01  $FVF<f>) y@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@147@01  $FVF<f>) y@3@01)
    ($FVF.lookup_f (as sm@146@01  $FVF<f>) some@140@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= some@140@01 y@3@01)) (not (= y@3@01 some@140@01))))
(assert (and (not (= some@140@01 y@3@01)) (not (= y@3@01 some@140@01))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@149@01  $FPM) r) $Perm.Write)
  :pattern ((inv@31@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@149@01  $FPM) some@140@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@149@01  $FPM) y@3@01) $Perm.Write))
; [exec]
; assert some.f == 0
; [eval] some.f == 0
(declare-const sm@150@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@147@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@147@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r some@140@01)
    (=
      ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
    (=
      ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
  :qid |qp.fvfValDef62|)))
(declare-const pm@151@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@151@01  $FPM) r)
    (+
      (+
        (ite (= r y@3@01) $Perm.Write $Perm.No)
        (ite (= r some@140@01) $Perm.Write $Perm.No))
      (ite
        (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@151@01  $FPM) r))
  :qid |qp.resPrmSumDef63|)))
(set-option :timeout 0)
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@151@01  $FPM) some@140@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) some@140@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) some@140@01) 0))
; [exec]
; assert y.f == 1
; [eval] y.f == 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r y@3@01)
      (=
        ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@147@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@147@01  $FVF<f>) r))
    :qid |qp.fvfValDef60|))
  (forall ((r $Ref)) (!
    (=>
      (= r some@140@01)
      (=
        ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
    :qid |qp.fvfValDef61|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@32@01 r) (Seq_contains toGo@23@01 (inv@31@01 r)))
      (=
        ($FVF.lookup_f (as sm@150@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@24@01)))) r))
    :qid |qp.fvfValDef62|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+ $Perm.Write (ite (= y@3@01 some@140@01) $Perm.Write $Perm.No))
    (ite
      (and (img@32@01 y@3@01) (Seq_contains toGo@23@01 (inv@31@01 y@3@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) y@3@01) 1)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) y@3@01) 1))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | |toGo@23@01| != 0]
(assert (not (= (Seq_length toGo@23@01) 0)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@152@01 $Ref)
(declare-const x@153@01 $Ref)
(push) ; 1
(declare-const i@154@01 Int)
(push) ; 2
(pop) ; 2
(declare-const $t@155@01 $PSF<wand@1>)
(declare-fun inv@156@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@157@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@154@01 Int)) (!
  (and
    (=
      (inv@156@01 x@153@01 $Perm.Write x@153@01 i@154@01 x@153@01 $Perm.Write)
      i@154@01)
    (img@157@01 x@153@01 $Perm.Write x@153@01 i@154@01 x@153@01 $Perm.Write))
  :pattern ((inv@156@01 x@153@01 $Perm.Write x@153@01 i@154@01 x@153@01 $Perm.Write))
  :pattern ((img@157@01 x@153@01 $Perm.Write x@153@01 i@154@01 x@153@01 $Perm.Write))
  :qid |quant-u-89|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (img@157@01 x0 x1 x2 x3 x4 x5)
    (and
      (= x@153@01 x0)
      (= $Perm.Write x1)
      (= x@153@01 x2)
      (= (inv@156@01 x0 x1 x2 x3 x4 x5) x3)
      (= x@153@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@156@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@1-fctOfInv|)))
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
; exhale (forall i: Int ::true ==>
;     acc(x.f, write) && x.f == i - 1 --* acc(x.f, write))
(declare-const i@158@01 Int)
(push) ; 3
; [eval] i - 1
(pop) ; 3
(declare-fun inv@159@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@160@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@158@01 Int) (i2@158@01 Int)) (!
  (=> (= (- i1@158@01 1) (- i2@158@01 1)) (= i1@158@01 i2@158@01))
  
  :qid |wand@1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@158@01@rw0 Int)) (!
  (and
    (=
      (inv@159@01 x@153@01 $Perm.Write x@153@01 i@158@01@rw0 x@153@01 $Perm.Write)
      (+ i@158@01@rw0 1))
    (img@160@01 x@153@01 $Perm.Write x@153@01 i@158@01@rw0 x@153@01 $Perm.Write))
  :pattern ((inv@159@01 x@153@01 $Perm.Write x@153@01 i@158@01@rw0 x@153@01 $Perm.Write))
  :pattern ((img@160@01 x@153@01 $Perm.Write x@153@01 i@158@01@rw0 x@153@01 $Perm.Write))
  :qid |wand@1-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (img@160@01 x0 x1 x2 x3 x4 x5)
    (and
      (= x@153@01 x0)
      (= $Perm.Write x1)
      (= x@153@01 x2)
      (= (- (inv@159@01 x0 x1 x2 x3 x4 x5) 1) x3)
      (= x@153@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@159@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@1-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@158@01 Int)) (!
  (= (- i@158@01 1) i@158@01)
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (img@160@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (- (inv@159@01 x0 x1 x2 x3 x4 x5) 1))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
      (pTaken@161@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@161@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@160@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (- (inv@159@01 x0 x1 x2 x3 x4 x5) 1))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@161@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@162@01 $PSF<wand@1>)
(declare-const s@163@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@163@01 $Snap)) (!
  (=>
    (img@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@163@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@163@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@163@01))))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first ($Snap.first s@163@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@163@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@163@01)))
    (and
      (not (= s@163@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@1 (as sm@162@01  $PSF<wand@1>) s@163@01)
        ($PSF.lookup_wand@1 $t@155@01 s@163@01))))
  :pattern (($PSF.lookup_wand@1 (as sm@162@01  $PSF<wand@1>) s@163@01))
  :pattern (($PSF.lookup_wand@1 $t@155@01 s@163@01))
  :qid |qp.psmValDef64|)))
; [exec]
; assert (forall i: Int ::true ==>
;     acc(x.f, write) && x.f == i --* acc(x.f, write))
(declare-const i@164@01 Int)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
(declare-fun inv@165@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@166@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@164@01 Int)) (!
  (and
    (=
      (inv@165@01 x@153@01 $Perm.Write x@153@01 i@164@01 x@153@01 $Perm.Write)
      i@164@01)
    (img@166@01 x@153@01 $Perm.Write x@153@01 i@164@01 x@153@01 $Perm.Write))
  :pattern ((inv@165@01 x@153@01 $Perm.Write x@153@01 i@164@01 x@153@01 $Perm.Write))
  :pattern ((img@166@01 x@153@01 $Perm.Write x@153@01 i@164@01 x@153@01 $Perm.Write))
  :qid |wand@1-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (img@166@01 x0 x1 x2 x3 x4 x5)
    (and
      (= x@153@01 x0)
      (= $Perm.Write x1)
      (= x@153@01 x2)
      (= (inv@165@01 x0 x1 x2 x3 x4 x5) x3)
      (= x@153@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@165@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (img@166@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@165@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
        (pTaken@161@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
        (pTaken@161@01 x0 x1 x2 x3 x4 x5))
      (pTaken@167@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@167@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@166@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@165@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@167@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@166@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@165@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@167@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-100|))))
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
(declare-const i@168@01 Int)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
(declare-fun inv@169@01 ($Ref $Perm $Ref Int $Ref $Perm) Int)
(declare-fun img@170@01 ($Ref $Perm $Ref Int $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@168@01 Int)) (!
  (and
    (=
      (inv@169@01 x@153@01 $Perm.Write x@153@01 i@168@01 x@153@01 $Perm.Write)
      i@168@01)
    (img@170@01 x@153@01 $Perm.Write x@153@01 i@168@01 x@153@01 $Perm.Write))
  :pattern ((inv@169@01 x@153@01 $Perm.Write x@153@01 i@168@01 x@153@01 $Perm.Write))
  :pattern ((img@170@01 x@153@01 $Perm.Write x@153@01 i@168@01 x@153@01 $Perm.Write))
  :qid |wand@1-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (img@170@01 x0 x1 x2 x3 x4 x5)
    (and
      (= x@153@01 x0)
      (= $Perm.Write x1)
      (= x@153@01 x2)
      (= (inv@169@01 x0 x1 x2 x3 x4 x5) x3)
      (= x@153@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@169@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@1-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@171@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (img@170@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@169@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
        (pTaken@161@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite (img@157@01 x0 x1 x2 x3 x4 x5) $Perm.Write $Perm.No)
        (pTaken@161@01 x0 x1 x2 x3 x4 x5))
      (pTaken@171@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@171@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@170@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@169@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@171@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 Int) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@170@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 x@153@01)
        (= x1 $Perm.Write)
        (= x2 x@153@01)
        (= x3 (inv@169@01 x0 x1 x2 x3 x4 x5))
        (= x4 x@153@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@171@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const xs@172@01 Seq<$Ref>)
(declare-const y@173@01 $Ref)
(declare-const xs@174@01 Seq<$Ref>)
(declare-const y@175@01 $Ref)
(push) ; 1
(declare-const x@176@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@174@01 x@176@01))
(pop) ; 2
(declare-const $t@177@01 $PSF<wand@2>)
(declare-fun inv@178@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@179@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@176@01 $Ref) (x2@176@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@174@01 x1@176@01)
      (Seq_contains xs@174@01 x2@176@01)
      (= x1@176@01 x2@176@01))
    (= x1@176@01 x2@176@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@176@01 $Ref)) (!
  (=>
    (Seq_contains xs@174@01 x@176@01)
    (and
      (=
        (inv@178@01 y@175@01 $Perm.Write x@176@01 $Perm.Write y@175@01 $Perm.Write)
        x@176@01)
      (img@179@01 y@175@01 $Perm.Write x@176@01 $Perm.Write y@175@01 $Perm.Write)))
  :pattern ((Seq_contains xs@174@01 x@176@01))
  :pattern ((Seq_contains_trigger xs@174@01 x@176@01))
  :pattern ((Seq_contains_trigger xs@174@01 x@176@01))
  :pattern ((inv@178@01 y@175@01 $Perm.Write x@176@01 $Perm.Write y@175@01 $Perm.Write))
  :pattern ((img@179@01 y@175@01 $Perm.Write x@176@01 $Perm.Write y@175@01 $Perm.Write))
  :qid |quant-u-107|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@179@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@174@01 (inv@178@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@175@01 x0)
      (= $Perm.Write x1)
      (= (inv@178@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@175@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@178@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
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
; assert (forall x: Ref ::(x in xs) ==>
;     acc(y.f, write) --* acc(y.f, write) && acc(x.f, write))
(declare-const x@180@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@174@01 x@180@01))
(pop) ; 3
(declare-fun inv@181@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@182@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@180@01 $Ref) (x2@180@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@174@01 x1@180@01)
      (Seq_contains xs@174@01 x2@180@01)
      (= x1@180@01 x2@180@01))
    (= x1@180@01 x2@180@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@180@01 $Ref)) (!
  (=>
    (Seq_contains xs@174@01 x@180@01)
    (and
      (=
        (inv@181@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@180@01 $Perm.Write)
        x@180@01)
      (img@182@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@180@01 $Perm.Write)))
  :pattern ((Seq_contains xs@174@01 x@180@01))
  :pattern ((Seq_contains_trigger xs@174@01 x@180@01))
  :pattern ((inv@181@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@180@01 $Perm.Write))
  :pattern ((img@182@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@180@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@182@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@174@01 (inv@181@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@175@01 x0)
      (= $Perm.Write x1)
      (= y@175@01 x2)
      (= $Perm.Write x3)
      (= (inv@181@01 x0 x1 x2 x3 x4 x5) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@181@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x@180@01 $Ref)) (!
  (= y@175@01 x@180@01)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@183@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains xs@174@01 (inv@181@01 x0 x1 x2 x3 x4 x5))
      (img@182@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@181@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    ($Perm.min
      (ite
        (and
          (img@179@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@174@01 (inv@178@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@179@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@174@01 (inv@178@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      (pTaken@183@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@183@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@174@01 (inv@181@01 x0 x1 x2 x3 x4 x5))
      (img@182@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@181@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@183@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@174@01 (inv@181@01 x0 x1 x2 x3 x4 x5))
      (img@182@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@181@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@183@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-113|))))
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
(declare-const x@184@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Seq_contains xs@174@01 x@184@01))
(pop) ; 3
(declare-fun inv@185@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@186@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@184@01 $Ref) (x2@184@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@174@01 x1@184@01)
      (Seq_contains xs@174@01 x2@184@01)
      (= x1@184@01 x2@184@01))
    (= x1@184@01 x2@184@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@184@01 $Ref)) (!
  (=>
    (Seq_contains xs@174@01 x@184@01)
    (and
      (=
        (inv@185@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@184@01 $Perm.Write)
        x@184@01)
      (img@186@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@184@01 $Perm.Write)))
  :pattern ((Seq_contains xs@174@01 x@184@01))
  :pattern ((Seq_contains_trigger xs@174@01 x@184@01))
  :pattern ((inv@185@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@184@01 $Perm.Write))
  :pattern ((img@186@01 y@175@01 $Perm.Write y@175@01 $Perm.Write x@184@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@186@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@174@01 (inv@185@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@175@01 x0)
      (= $Perm.Write x1)
      (= y@175@01 x2)
      (= $Perm.Write x3)
      (= (inv@185@01 x0 x1 x2 x3 x4 x5) x4)
      (= $Perm.Write x5)))
  :pattern ((inv@185@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x@184@01 $Ref)) (!
  (= y@175@01 x@184@01)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains xs@174@01 (inv@185@01 x0 x1 x2 x3 x4 x5))
      (img@186@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@185@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    ($Perm.min
      (ite
        (and
          (img@179@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@174@01 (inv@178@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@179@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@174@01 (inv@178@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      (pTaken@187@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@187@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@174@01 (inv@185@01 x0 x1 x2 x3 x4 x5))
      (img@186@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@185@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@187@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@174@01 (inv@185@01 x0 x1 x2 x3 x4 x5))
      (img@186@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@175@01)
        (= x1 $Perm.Write)
        (= x2 y@175@01)
        (= x3 $Perm.Write)
        (= x4 (inv@185@01 x0 x1 x2 x3 x4 x5))
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@187@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const xs@188@01 Seq<$Ref>)
(declare-const y@189@01 $Ref)
(declare-const xs@190@01 Seq<$Ref>)
(declare-const y@191@01 $Ref)
(push) ; 1
(declare-const $t@192@01 $Snap)
(assert (= $t@192@01 ($Snap.combine ($Snap.first $t@192@01) ($Snap.second $t@192@01))))
(declare-const x@193@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@190@01 x@193@01))
(pop) ; 2
(declare-fun inv@194@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@195@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@193@01 $Ref) (x2@193@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@190@01 x1@193@01)
      (Seq_contains xs@190@01 x2@193@01)
      (= x1@193@01 x2@193@01))
    (= x1@193@01 x2@193@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@193@01 $Ref)) (!
  (=>
    (Seq_contains xs@190@01 x@193@01)
    (and
      (=
        (inv@194@01 y@191@01 $Perm.Write x@193@01 $Perm.Write y@191@01 $Perm.Write)
        x@193@01)
      (img@195@01 y@191@01 $Perm.Write x@193@01 $Perm.Write y@191@01 $Perm.Write)))
  :pattern ((Seq_contains xs@190@01 x@193@01))
  :pattern ((Seq_contains_trigger xs@190@01 x@193@01))
  :pattern ((Seq_contains_trigger xs@190@01 x@193@01))
  :pattern ((inv@194@01 y@191@01 $Perm.Write x@193@01 $Perm.Write y@191@01 $Perm.Write))
  :pattern ((img@195@01 y@191@01 $Perm.Write x@193@01 $Perm.Write y@191@01 $Perm.Write))
  :qid |quant-u-121|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@195@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@191@01 x0)
      (= $Perm.Write x1)
      (= (inv@194@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@191@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@194@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
; Permissons are non-negative
(assert (=
  ($Snap.second $t@192@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@192@01))
    ($Snap.second ($Snap.second $t@192@01)))))
(assert (= ($Snap.first ($Snap.second $t@192@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@196@01 Int)
(declare-const j@197@01 Int)
(push) ; 2
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 28 | !(0 <= i@196@01) | live]
; [else-branch: 28 | 0 <= i@196@01 | live]
(push) ; 4
; [then-branch: 28 | !(0 <= i@196@01)]
(assert (not (<= 0 i@196@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 28 | 0 <= i@196@01]
(assert (<= 0 i@196@01))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 29 | !(0 <= j@197@01) | live]
; [else-branch: 29 | 0 <= j@197@01 | live]
(push) ; 6
; [then-branch: 29 | !(0 <= j@197@01)]
(assert (not (<= 0 j@197@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | 0 <= j@197@01]
(assert (<= 0 j@197@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 30 | !(i@196@01 < |xs@190@01|) | live]
; [else-branch: 30 | i@196@01 < |xs@190@01| | live]
(push) ; 8
; [then-branch: 30 | !(i@196@01 < |xs@190@01|)]
(assert (not (< i@196@01 (Seq_length xs@190@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 30 | i@196@01 < |xs@190@01|]
(assert (< i@196@01 (Seq_length xs@190@01)))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 31 | !(j@197@01 < |xs@190@01|) | live]
; [else-branch: 31 | j@197@01 < |xs@190@01| | live]
(push) ; 10
; [then-branch: 31 | !(j@197@01 < |xs@190@01|)]
(assert (not (< j@197@01 (Seq_length xs@190@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 31 | j@197@01 < |xs@190@01|]
(assert (< j@197@01 (Seq_length xs@190@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@197@01 (Seq_length xs@190@01))
  (not (< j@197@01 (Seq_length xs@190@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@196@01 (Seq_length xs@190@01))
  (and
    (< i@196@01 (Seq_length xs@190@01))
    (or
      (< j@197@01 (Seq_length xs@190@01))
      (not (< j@197@01 (Seq_length xs@190@01)))))))
(assert (or
  (< i@196@01 (Seq_length xs@190@01))
  (not (< i@196@01 (Seq_length xs@190@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@197@01)
  (and
    (<= 0 j@197@01)
    (=>
      (< i@196@01 (Seq_length xs@190@01))
      (and
        (< i@196@01 (Seq_length xs@190@01))
        (or
          (< j@197@01 (Seq_length xs@190@01))
          (not (< j@197@01 (Seq_length xs@190@01))))))
    (or
      (< i@196@01 (Seq_length xs@190@01))
      (not (< i@196@01 (Seq_length xs@190@01)))))))
(assert (or (<= 0 j@197@01) (not (<= 0 j@197@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@196@01)
  (and
    (<= 0 i@196@01)
    (=>
      (<= 0 j@197@01)
      (and
        (<= 0 j@197@01)
        (=>
          (< i@196@01 (Seq_length xs@190@01))
          (and
            (< i@196@01 (Seq_length xs@190@01))
            (or
              (< j@197@01 (Seq_length xs@190@01))
              (not (< j@197@01 (Seq_length xs@190@01))))))
        (or
          (< i@196@01 (Seq_length xs@190@01))
          (not (< i@196@01 (Seq_length xs@190@01))))))
    (or (<= 0 j@197@01) (not (<= 0 j@197@01))))))
(assert (or (<= 0 i@196@01) (not (<= 0 i@196@01))))
(push) ; 3
; [then-branch: 32 | 0 <= i@196@01 && 0 <= j@197@01 && i@196@01 < |xs@190@01| && j@197@01 < |xs@190@01| && i@196@01 != j@197@01 | live]
; [else-branch: 32 | !(0 <= i@196@01 && 0 <= j@197@01 && i@196@01 < |xs@190@01| && j@197@01 < |xs@190@01| && i@196@01 != j@197@01) | live]
(push) ; 4
; [then-branch: 32 | 0 <= i@196@01 && 0 <= j@197@01 && i@196@01 < |xs@190@01| && j@197@01 < |xs@190@01| && i@196@01 != j@197@01]
(assert (and
  (<= 0 i@196@01)
  (and
    (<= 0 j@197@01)
    (and
      (< i@196@01 (Seq_length xs@190@01))
      (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@196@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@197@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 32 | !(0 <= i@196@01 && 0 <= j@197@01 && i@196@01 < |xs@190@01| && j@197@01 < |xs@190@01| && i@196@01 != j@197@01)]
(assert (not
  (and
    (<= 0 i@196@01)
    (and
      (<= 0 j@197@01)
      (and
        (< i@196@01 (Seq_length xs@190@01))
        (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@196@01)
    (and
      (<= 0 j@197@01)
      (and
        (< i@196@01 (Seq_length xs@190@01))
        (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))
  (and
    (<= 0 i@196@01)
    (<= 0 j@197@01)
    (< i@196@01 (Seq_length xs@190@01))
    (< j@197@01 (Seq_length xs@190@01))
    (not (= i@196@01 j@197@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@196@01)
      (and
        (<= 0 j@197@01)
        (and
          (< i@196@01 (Seq_length xs@190@01))
          (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01)))))))
  (and
    (<= 0 i@196@01)
    (and
      (<= 0 j@197@01)
      (and
        (< i@196@01 (Seq_length xs@190@01))
        (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@196@01 Int) (j@197@01 Int)) (!
  (and
    (=>
      (<= 0 i@196@01)
      (and
        (<= 0 i@196@01)
        (=>
          (<= 0 j@197@01)
          (and
            (<= 0 j@197@01)
            (=>
              (< i@196@01 (Seq_length xs@190@01))
              (and
                (< i@196@01 (Seq_length xs@190@01))
                (or
                  (< j@197@01 (Seq_length xs@190@01))
                  (not (< j@197@01 (Seq_length xs@190@01))))))
            (or
              (< i@196@01 (Seq_length xs@190@01))
              (not (< i@196@01 (Seq_length xs@190@01))))))
        (or (<= 0 j@197@01) (not (<= 0 j@197@01)))))
    (or (<= 0 i@196@01) (not (<= 0 i@196@01)))
    (=>
      (and
        (<= 0 i@196@01)
        (and
          (<= 0 j@197@01)
          (and
            (< i@196@01 (Seq_length xs@190@01))
            (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))
      (and
        (<= 0 i@196@01)
        (<= 0 j@197@01)
        (< i@196@01 (Seq_length xs@190@01))
        (< j@197@01 (Seq_length xs@190@01))
        (not (= i@196@01 j@197@01))))
    (or
      (not
        (and
          (<= 0 i@196@01)
          (and
            (<= 0 j@197@01)
            (and
              (< i@196@01 (Seq_length xs@190@01))
              (and
                (< j@197@01 (Seq_length xs@190@01))
                (not (= i@196@01 j@197@01)))))))
      (and
        (<= 0 i@196@01)
        (and
          (<= 0 j@197@01)
          (and
            (< i@196@01 (Seq_length xs@190@01))
            (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))))
  :pattern ((Seq_index xs@190@01 i@196@01) (Seq_index xs@190@01 j@197@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@59@10@59@26-aux|)))
(assert (forall ((i@196@01 Int) (j@197@01 Int)) (!
  (=>
    (and
      (<= 0 i@196@01)
      (and
        (<= 0 j@197@01)
        (and
          (< i@196@01 (Seq_length xs@190@01))
          (and (< j@197@01 (Seq_length xs@190@01)) (not (= i@196@01 j@197@01))))))
    (not (= (Seq_index xs@190@01 i@196@01) (Seq_index xs@190@01 j@197@01))))
  :pattern ((Seq_index xs@190@01 i@196@01) (Seq_index xs@190@01 j@197@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@59@10@59@26|)))
(assert (=
  ($Snap.second ($Snap.second $t@192@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@192@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@192@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@192@01))) $Snap.unit))
; [eval] |xs| > 0
; [eval] |xs|
(assert (> (Seq_length xs@190@01) 0))
(assert (not (= y@191@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var some: Ref
(declare-const some@198@01 $Ref)
; [exec]
; some := xs[0]
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@190@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const some@199@01 $Ref)
(assert (= some@199@01 (Seq_index xs@190@01 0)))
; [exec]
; package true --* acc(some.f, write) && acc(y.f, write) {
;   apply acc(y.f, write) --* acc(some.f, write) && acc(y.f, write)
; }
(push) ; 3
(declare-const $t@200@01 $Snap)
(assert (= $t@200@01 $Snap.unit))
; [exec]
; apply acc(y.f, write) --* acc(some.f, write) && acc(y.f, write)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 y@191@01)
      (= x1 $Perm.Write)
      (= x2 some@199@01)
      (= x3 $Perm.Write)
      (= x4 y@191@01)
      (= x5 $Perm.Write))
    false)
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@201@01 $PSF<wand@2>)
(declare-const s@202@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 y@191@01)
      (= x1 $Perm.Write)
      (= x2 some@199@01)
      (= x3 $Perm.Write)
      (= x4 y@191@01)
      (= x5 $Perm.Write))
    false)
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@203@01 $PSF<wand@2>)
(declare-const s@204@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (= (as sm@201@01  $PSF<wand@2>) (as sm@203@01  $PSF<wand@2>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@205@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (= x0 y@191@01)
      (= x1 $Perm.Write)
      (= x2 some@199@01)
      (= x3 $Perm.Write)
      (= x4 y@191@01)
      (= x5 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (img@195@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@195@01 x0 x1 x2 x3 x4 x5)
          (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
        $Perm.Write
        $Perm.No)
      (pTaken@205@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (= (pTaken@205@01 x0 x1 x2 x3 x4 x5) $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 y@191@01)
      (= x1 $Perm.Write)
      (= x2 some@199@01)
      (= x3 $Perm.Write)
      (= x4 y@191@01)
      (= x5 $Perm.Write))
    (= (- $Perm.Write (pTaken@205@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@206@01 $PSF<wand@2>)
(declare-const s@207@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@195@01 y@191@01 $Perm.Write some@199@01 $Perm.Write y@191@01 $Perm.Write)
    (Seq_contains
      xs@190@01
      (inv@194@01 y@191@01 $Perm.Write some@199@01 $Perm.Write y@191@01 $Perm.Write)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@191@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@199@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@191@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@2 ($SortWrappers.$SnapTo$PSF<wand@2> ($Snap.first $t@192@01)) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
(assert (= (as sm@201@01  $PSF<wand@2>) (as sm@206@01  $PSF<wand@2>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
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
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@192@01)))
  ($Snap.first ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@191@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@199@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@191@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@191@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@199@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@191@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(assert (not (= some@199@01 $Ref.null)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= some@199@01 y@191@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@191@01 some@199@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= some@199@01 y@191@01)) (not (= y@191@01 some@199@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@191@01 some@199@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@191@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@199@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@191@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= some@199@01 y@191@01)) (not (= y@191@01 some@199@01))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= some@199@01 y@191@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= some@199@01 y@191@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand true --* acc(some.f, write) && acc(y.f, write)
(declare-const mwsf@208@01 $MWSF)
(assert (forall (($t@200@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@208@01 $t@200@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  :pattern ((MWSF_apply mwsf@208@01 $t@200@01))
  :qid |quant-u-128|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@200@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@208@01 $t@200@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@191@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@199@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@191@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  :pattern ((MWSF_apply mwsf@208@01 $t@200@01))
  :qid |quant-u-129|)))
(assert (and
  (= (as sm@201@01  $PSF<wand@2>) (as sm@203@01  $PSF<wand@2>))
  (=>
    (and
      (img@195@01 y@191@01 $Perm.Write some@199@01 $Perm.Write y@191@01 $Perm.Write)
      (Seq_contains
        xs@190@01
        (inv@194@01 y@191@01 $Perm.Write some@199@01 $Perm.Write y@191@01 $Perm.Write)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap y@191@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap some@199@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap y@191@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@2 (as sm@206@01  $PSF<wand@2>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@191@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@199@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@191@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@2 ($SortWrappers.$SnapTo$PSF<wand@2> ($Snap.first $t@192@01)) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap y@191@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap some@199@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@191@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (= (as sm@201@01  $PSF<wand@2>) (as sm@206@01  $PSF<wand@2>))))
(assert true)
; [exec]
; assert (forall x: Ref ::(x in xs[1..]) ==>
;     acc(y.f, write) --* acc(x.f, write) && acc(y.f, write))
(declare-const x@209@01 $Ref)
(push) ; 4
; [eval] (x in xs[1..])
; [eval] xs[1..]
(assert (Seq_contains (Seq_drop xs@190@01 1) x@209@01))
(pop) ; 4
(declare-fun inv@210@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@211@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@209@01 $Ref) (x2@209@01 $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_drop xs@190@01 1) x1@209@01)
      (Seq_contains (Seq_drop xs@190@01 1) x2@209@01)
      (= x1@209@01 x2@209@01))
    (= x1@209@01 x2@209@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@209@01 $Ref)) (!
  (=>
    (Seq_contains (Seq_drop xs@190@01 1) x@209@01)
    (and
      (=
        (inv@210@01 y@191@01 $Perm.Write x@209@01 $Perm.Write y@191@01 $Perm.Write)
        x@209@01)
      (img@211@01 y@191@01 $Perm.Write x@209@01 $Perm.Write y@191@01 $Perm.Write)))
  :pattern ((Seq_contains (Seq_drop xs@190@01 1) x@209@01))
  :pattern ((Seq_contains_trigger (Seq_drop xs@190@01 1) x@209@01))
  :pattern ((inv@210@01 y@191@01 $Perm.Write x@209@01 $Perm.Write y@191@01 $Perm.Write))
  :pattern ((img@211@01 y@191@01 $Perm.Write x@209@01 $Perm.Write y@191@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@211@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains (Seq_drop xs@190@01 1) (inv@210@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@191@01 x0)
      (= $Perm.Write x1)
      (= (inv@210@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@191@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@210@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@212@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains (Seq_drop xs@190@01 1) (inv@210@01 x0 x1 x2 x3 x4 x5))
      (img@211@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@210@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
      (pTaken@212@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains (Seq_drop xs@190@01 1) (inv@210@01 x0 x1 x2 x3 x4 x5))
      (img@211@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@210@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@212@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@213@01 $PSF<wand@2>)
(declare-const s@214@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@214@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (img@195@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@214@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@214@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@214@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@214@01)))
            (Seq_contains
              xs@190@01
              (inv@194@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@214@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@214@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@214@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@214@01)))))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@214@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@214@01))))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@214@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@214@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@214@01)))))
    (and
      (not (= s@214@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@2 (as sm@213@01  $PSF<wand@2>) s@214@01)
        ($PSF.lookup_wand@2 ($SortWrappers.$SnapTo$PSF<wand@2> ($Snap.first $t@192@01)) s@214@01))))
  :pattern (($PSF.lookup_wand@2 (as sm@213@01  $PSF<wand@2>) s@214@01))
  :pattern (($PSF.lookup_wand@2 ($SortWrappers.$SnapTo$PSF<wand@2> ($Snap.first $t@192@01)) s@214@01))
  :qid |qp.psmValDef66|)))
; [exec]
; assert (forall x: Ref ::(x in xs) ==>
;     acc(y.f, write) --* acc(x.f, write) && acc(y.f, write))
(declare-const x@215@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@190@01 x@215@01))
(pop) ; 4
(declare-fun inv@216@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@217@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@215@01 $Ref) (x2@215@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@190@01 x1@215@01)
      (Seq_contains xs@190@01 x2@215@01)
      (= x1@215@01 x2@215@01))
    (= x1@215@01 x2@215@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@215@01 $Ref)) (!
  (=>
    (Seq_contains xs@190@01 x@215@01)
    (and
      (=
        (inv@216@01 y@191@01 $Perm.Write x@215@01 $Perm.Write y@191@01 $Perm.Write)
        x@215@01)
      (img@217@01 y@191@01 $Perm.Write x@215@01 $Perm.Write y@191@01 $Perm.Write)))
  :pattern ((Seq_contains xs@190@01 x@215@01))
  :pattern ((Seq_contains_trigger xs@190@01 x@215@01))
  :pattern ((inv@216@01 y@191@01 $Perm.Write x@215@01 $Perm.Write y@191@01 $Perm.Write))
  :pattern ((img@217@01 y@191@01 $Perm.Write x@215@01 $Perm.Write y@191@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@217@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@190@01 (inv@216@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@191@01 x0)
      (= $Perm.Write x1)
      (= (inv@216@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@191@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@216@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@218@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains xs@190@01 (inv@216@01 x0 x1 x2 x3 x4 x5))
      (img@217@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@216@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
      (pTaken@218@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@190@01 (inv@216@01 x0 x1 x2 x3 x4 x5))
      (img@217@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@216@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@218@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@190@01 (inv@216@01 x0 x1 x2 x3 x4 x5))
      (img@217@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@216@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@218@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const x@219@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@190@01 x@219@01))
(pop) ; 4
(declare-fun inv@220@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@221@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@219@01 $Ref) (x2@219@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@190@01 x1@219@01)
      (Seq_contains xs@190@01 x2@219@01)
      (= x1@219@01 x2@219@01))
    (= x1@219@01 x2@219@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@219@01 $Ref)) (!
  (=>
    (Seq_contains xs@190@01 x@219@01)
    (and
      (=
        (inv@220@01 y@191@01 $Perm.Write x@219@01 $Perm.Write y@191@01 $Perm.Write)
        x@219@01)
      (img@221@01 y@191@01 $Perm.Write x@219@01 $Perm.Write y@191@01 $Perm.Write)))
  :pattern ((Seq_contains xs@190@01 x@219@01))
  :pattern ((Seq_contains_trigger xs@190@01 x@219@01))
  :pattern ((inv@220@01 y@191@01 $Perm.Write x@219@01 $Perm.Write y@191@01 $Perm.Write))
  :pattern ((img@221@01 y@191@01 $Perm.Write x@219@01 $Perm.Write y@191@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@221@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains xs@190@01 (inv@220@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@191@01 x0)
      (= $Perm.Write x1)
      (= (inv@220@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@191@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@220@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@222@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains xs@190@01 (inv@220@01 x0 x1 x2 x3 x4 x5))
      (img@221@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@220@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=
    (-
      (-
        (ite
          (and
            (img@195@01 x0 x1 x2 x3 x4 x5)
            (Seq_contains xs@190@01 (inv@194@01 x0 x1 x2 x3 x4 x5)))
          $Perm.Write
          $Perm.No)
        (pTaken@205@01 x0 x1 x2 x3 x4 x5))
      (pTaken@222@01 x0 x1 x2 x3 x4 x5))
    $Perm.No)
  
  :qid |quant-u-140|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@190@01 (inv@220@01 x0 x1 x2 x3 x4 x5))
      (img@221@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@220@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@222@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@190@01 (inv@220@01 x0 x1 x2 x3 x4 x5))
      (img@221@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@191@01)
        (= x1 $Perm.Write)
        (= x2 (inv@220@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@191@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@222@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const xs@223@01 Seq<$Ref>)
(declare-const y@224@01 $Ref)
(declare-const xs@225@01 Seq<$Ref>)
(declare-const y@226@01 $Ref)
(push) ; 1
(declare-const $t@227@01 $Snap)
(assert (= $t@227@01 ($Snap.combine ($Snap.first $t@227@01) ($Snap.second $t@227@01))))
(declare-const x@228@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@225@01 x@228@01))
(pop) ; 2
(declare-fun inv@229@01 ($Ref) $Ref)
(declare-fun img@230@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@228@01 $Ref) (x2@228@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@225@01 x1@228@01)
      (Seq_contains xs@225@01 x2@228@01)
      (= x1@228@01 x2@228@01))
    (= x1@228@01 x2@228@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@228@01 $Ref)) (!
  (=>
    (Seq_contains xs@225@01 x@228@01)
    (and (= (inv@229@01 x@228@01) x@228@01) (img@230@01 x@228@01)))
  :pattern ((Seq_contains xs@225@01 x@228@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@228@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@228@01))
  :pattern ((inv@229@01 x@228@01))
  :pattern ((img@230@01 x@228@01))
  :qid |quant-u-143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
    (= (inv@229@01 r) r))
  :pattern ((inv@229@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@228@01 $Ref)) (!
  (=> (Seq_contains xs@225@01 x@228@01) (not (= x@228@01 $Ref.null)))
  :pattern ((Seq_contains xs@225@01 x@228@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@228@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@228@01))
  :pattern ((inv@229@01 x@228@01))
  :pattern ((img@230@01 x@228@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@227@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@227@01))
    ($Snap.second ($Snap.second $t@227@01)))))
(assert (= ($Snap.first ($Snap.second $t@227@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@231@01 Int)
(declare-const j@232@01 Int)
(push) ; 2
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] 0 <= i && (0 <= j && (i < |xs| && (j < |xs| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 33 | !(0 <= i@231@01) | live]
; [else-branch: 33 | 0 <= i@231@01 | live]
(push) ; 4
; [then-branch: 33 | !(0 <= i@231@01)]
(assert (not (<= 0 i@231@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | 0 <= i@231@01]
(assert (<= 0 i@231@01))
; [eval] 0 <= j
(push) ; 5
; [then-branch: 34 | !(0 <= j@232@01) | live]
; [else-branch: 34 | 0 <= j@232@01 | live]
(push) ; 6
; [then-branch: 34 | !(0 <= j@232@01)]
(assert (not (<= 0 j@232@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | 0 <= j@232@01]
(assert (<= 0 j@232@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 35 | !(i@231@01 < |xs@225@01|) | live]
; [else-branch: 35 | i@231@01 < |xs@225@01| | live]
(push) ; 8
; [then-branch: 35 | !(i@231@01 < |xs@225@01|)]
(assert (not (< i@231@01 (Seq_length xs@225@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | i@231@01 < |xs@225@01|]
(assert (< i@231@01 (Seq_length xs@225@01)))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 36 | !(j@232@01 < |xs@225@01|) | live]
; [else-branch: 36 | j@232@01 < |xs@225@01| | live]
(push) ; 10
; [then-branch: 36 | !(j@232@01 < |xs@225@01|)]
(assert (not (< j@232@01 (Seq_length xs@225@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 36 | j@232@01 < |xs@225@01|]
(assert (< j@232@01 (Seq_length xs@225@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@232@01 (Seq_length xs@225@01))
  (not (< j@232@01 (Seq_length xs@225@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@231@01 (Seq_length xs@225@01))
  (and
    (< i@231@01 (Seq_length xs@225@01))
    (or
      (< j@232@01 (Seq_length xs@225@01))
      (not (< j@232@01 (Seq_length xs@225@01)))))))
(assert (or
  (< i@231@01 (Seq_length xs@225@01))
  (not (< i@231@01 (Seq_length xs@225@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@232@01)
  (and
    (<= 0 j@232@01)
    (=>
      (< i@231@01 (Seq_length xs@225@01))
      (and
        (< i@231@01 (Seq_length xs@225@01))
        (or
          (< j@232@01 (Seq_length xs@225@01))
          (not (< j@232@01 (Seq_length xs@225@01))))))
    (or
      (< i@231@01 (Seq_length xs@225@01))
      (not (< i@231@01 (Seq_length xs@225@01)))))))
(assert (or (<= 0 j@232@01) (not (<= 0 j@232@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@231@01)
  (and
    (<= 0 i@231@01)
    (=>
      (<= 0 j@232@01)
      (and
        (<= 0 j@232@01)
        (=>
          (< i@231@01 (Seq_length xs@225@01))
          (and
            (< i@231@01 (Seq_length xs@225@01))
            (or
              (< j@232@01 (Seq_length xs@225@01))
              (not (< j@232@01 (Seq_length xs@225@01))))))
        (or
          (< i@231@01 (Seq_length xs@225@01))
          (not (< i@231@01 (Seq_length xs@225@01))))))
    (or (<= 0 j@232@01) (not (<= 0 j@232@01))))))
(assert (or (<= 0 i@231@01) (not (<= 0 i@231@01))))
(push) ; 3
; [then-branch: 37 | 0 <= i@231@01 && 0 <= j@232@01 && i@231@01 < |xs@225@01| && j@232@01 < |xs@225@01| && i@231@01 != j@232@01 | live]
; [else-branch: 37 | !(0 <= i@231@01 && 0 <= j@232@01 && i@231@01 < |xs@225@01| && j@232@01 < |xs@225@01| && i@231@01 != j@232@01) | live]
(push) ; 4
; [then-branch: 37 | 0 <= i@231@01 && 0 <= j@232@01 && i@231@01 < |xs@225@01| && j@232@01 < |xs@225@01| && i@231@01 != j@232@01]
(assert (and
  (<= 0 i@231@01)
  (and
    (<= 0 j@232@01)
    (and
      (< i@231@01 (Seq_length xs@225@01))
      (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@231@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@232@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(0 <= i@231@01 && 0 <= j@232@01 && i@231@01 < |xs@225@01| && j@232@01 < |xs@225@01| && i@231@01 != j@232@01)]
(assert (not
  (and
    (<= 0 i@231@01)
    (and
      (<= 0 j@232@01)
      (and
        (< i@231@01 (Seq_length xs@225@01))
        (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@231@01)
    (and
      (<= 0 j@232@01)
      (and
        (< i@231@01 (Seq_length xs@225@01))
        (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))
  (and
    (<= 0 i@231@01)
    (<= 0 j@232@01)
    (< i@231@01 (Seq_length xs@225@01))
    (< j@232@01 (Seq_length xs@225@01))
    (not (= i@231@01 j@232@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@231@01)
      (and
        (<= 0 j@232@01)
        (and
          (< i@231@01 (Seq_length xs@225@01))
          (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01)))))))
  (and
    (<= 0 i@231@01)
    (and
      (<= 0 j@232@01)
      (and
        (< i@231@01 (Seq_length xs@225@01))
        (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@231@01 Int) (j@232@01 Int)) (!
  (and
    (=>
      (<= 0 i@231@01)
      (and
        (<= 0 i@231@01)
        (=>
          (<= 0 j@232@01)
          (and
            (<= 0 j@232@01)
            (=>
              (< i@231@01 (Seq_length xs@225@01))
              (and
                (< i@231@01 (Seq_length xs@225@01))
                (or
                  (< j@232@01 (Seq_length xs@225@01))
                  (not (< j@232@01 (Seq_length xs@225@01))))))
            (or
              (< i@231@01 (Seq_length xs@225@01))
              (not (< i@231@01 (Seq_length xs@225@01))))))
        (or (<= 0 j@232@01) (not (<= 0 j@232@01)))))
    (or (<= 0 i@231@01) (not (<= 0 i@231@01)))
    (=>
      (and
        (<= 0 i@231@01)
        (and
          (<= 0 j@232@01)
          (and
            (< i@231@01 (Seq_length xs@225@01))
            (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))
      (and
        (<= 0 i@231@01)
        (<= 0 j@232@01)
        (< i@231@01 (Seq_length xs@225@01))
        (< j@232@01 (Seq_length xs@225@01))
        (not (= i@231@01 j@232@01))))
    (or
      (not
        (and
          (<= 0 i@231@01)
          (and
            (<= 0 j@232@01)
            (and
              (< i@231@01 (Seq_length xs@225@01))
              (and
                (< j@232@01 (Seq_length xs@225@01))
                (not (= i@231@01 j@232@01)))))))
      (and
        (<= 0 i@231@01)
        (and
          (<= 0 j@232@01)
          (and
            (< i@231@01 (Seq_length xs@225@01))
            (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))))
  :pattern ((Seq_index xs@225@01 i@231@01) (Seq_index xs@225@01 j@232@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@83@10@83@26-aux|)))
(assert (forall ((i@231@01 Int) (j@232@01 Int)) (!
  (=>
    (and
      (<= 0 i@231@01)
      (and
        (<= 0 j@232@01)
        (and
          (< i@231@01 (Seq_length xs@225@01))
          (and (< j@232@01 (Seq_length xs@225@01)) (not (= i@231@01 j@232@01))))))
    (not (= (Seq_index xs@225@01 i@231@01) (Seq_index xs@225@01 j@232@01))))
  :pattern ((Seq_index xs@225@01 i@231@01) (Seq_index xs@225@01 j@232@01))
  :qid |prog./silicon/silver/src/test/resources/wands/new_syntax/QPWands.vpr@83@10@83@26|)))
(assert (=
  ($Snap.second ($Snap.second $t@227@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@227@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@227@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@227@01))) $Snap.unit))
; [eval] |xs| >= 1
; [eval] |xs|
(assert (>= (Seq_length xs@225@01) 1))
(declare-const sm@233@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@233@01  $FVF<f>) y@226@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@227@01))))))
(assert (not (= y@226@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var some: Ref
(declare-const some@234@01 $Ref)
; [exec]
; var completed: Seq[Ref]
(declare-const completed@235@01 Seq<$Ref>)
; [exec]
; xs[0].f := 0
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@225@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@226@01 (Seq_index xs@225@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@236@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@225@01 0))
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@237@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@225@01 0))
    ($Perm.min
      (ite (= r y@226@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@236@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@236@01 r))
    $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@236@01 r) $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@225@01 0))
    (= (- $Perm.Write (pTaken@236@01 r)) $Perm.No))
  
  :qid |quant-u-147|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@238@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@238@01  $FVF<f>) (Seq_index xs@225@01 0)) 0))
; [exec]
; y.f := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min (ite (= r y@226@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@240@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite (= r (Seq_index xs@225@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@239@01 r)))
    $Perm.No))
(define-fun pTaken@241@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@239@01 r)) (pTaken@240@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@239@01 y@226@01)) $Perm.No)))
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
  (=> (= r y@226@01) (= (- $Perm.Write (pTaken@239@01 r)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@242@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@242@01  $FVF<f>) y@226@01) 1))
; [exec]
; some := xs[0]
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@225@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const some@243@01 $Ref)
(assert (= some@243@01 (Seq_index xs@225@01 0)))
; [exec]
; package acc(y.f, write) --* acc(some.f, write) && acc(y.f, write) {
; }
(push) ; 3
(declare-const $t@244@01 $Snap)
(declare-const sm@245@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@245@01  $FVF<f>) y@226@01)
  ($SortWrappers.$SnapToInt $t@244@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r some@243@01) false)
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@246@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@226@01 some@243@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@247@01 ((r $Ref)) $Perm
  (ite
    (= r some@243@01)
    ($Perm.min (ite (= r y@226@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@247@01 y@226@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@247@01 r) $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r some@243@01) (= (- $Perm.Write (pTaken@247@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r some@243@01) (= (- $Perm.Write (pTaken@247@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@248@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= some@243@01 y@226@01)
  (=
    ($FVF.lookup_f (as sm@248@01  $FVF<f>) some@243@01)
    ($FVF.lookup_f (as sm@245@01  $FVF<f>) some@243@01))))
(assert (= (as sm@246@01  $FVF<f>) (as sm@248@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@226@01 some@243@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index xs@225@01 0) some@243@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@249@01 ((r $Ref)) $Perm
  (ite
    (= r some@243@01)
    ($Perm.min
      (ite (= r (Seq_index xs@225@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@247@01 r)))
    $Perm.No))
(define-fun pTaken@250@01 ((r $Ref)) $Perm
  (ite
    (= r some@243@01)
    ($Perm.min
      (ite (= r y@226@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@247@01 r)) (pTaken@249@01 r)))
    $Perm.No))
(define-fun pTaken@251@01 ((r $Ref)) $Perm
  (ite
    (= r some@243@01)
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@247@01 r)) (pTaken@249@01 r))
        (pTaken@250@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      $Perm.Write
      $Perm.No)
    (pTaken@249@01 (Seq_index xs@225@01 0)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@249@01 r) $Perm.No)
  
  :qid |quant-u-158|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r some@243@01)
    (= (- (- $Perm.Write (pTaken@247@01 r)) (pTaken@249@01 r)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@252@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= some@243@01 y@226@01)
  (=
    ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
    ($FVF.lookup_f (as sm@242@01  $FVF<f>) some@243@01))))
(assert (=>
  (ite
    (and
      (img@230@01 some@243@01)
      (Seq_contains xs@225@01 (inv@229@01 some@243@01)))
    (< $Perm.No (- $Perm.Write (pTaken@236@01 some@243@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) some@243@01))))
(assert (=>
  (= some@243@01 (Seq_index xs@225@01 0))
  (=
    ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
    ($FVF.lookup_f (as sm@238@01  $FVF<f>) some@243@01))))
(assert (= (as sm@246@01  $FVF<f>) (as sm@252@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@253@01 $FVF<f>)
(declare-const $t@254@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r some@243@01) (< $Perm.No (pTaken@247@01 r)) false)
    (= ($FVF.lookup_f $t@253@01 r) ($FVF.lookup_f (as sm@248@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@246@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@248@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@253@01 r))
  :qid |quant-u-160|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite (= r some@243@01) (< $Perm.No (pTaken@247@01 r)) false)
      (= ($FVF.lookup_f $t@254@01 r) ($FVF.lookup_f $t@253@01 r)))
    (=>
      (ite
        (= r some@243@01)
        (< $Perm.No (- $Perm.Write (pTaken@247@01 r)))
        false)
      (= ($FVF.lookup_f $t@254@01 r) ($FVF.lookup_f (as sm@252@01  $FVF<f>) r))))
  :pattern (($FVF.lookup_f $t@253@01 r))
  :pattern (($FVF.lookup_f (as sm@252@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@254@01 r))
  :qid |quant-u-161|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@226@01) false)
  
  :qid |quant-u-162|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@255@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@256@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite (= r y@226@01) (- $Perm.Write (pTaken@247@01 r)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (- (- $Perm.Write (pTaken@247@01 y@226@01)) (pTaken@256@01 y@226@01))
  $Perm.No)))
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
  (=> (= r y@226@01) (= (- $Perm.Write (pTaken@256@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@257@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No (- $Perm.Write (pTaken@247@01 y@226@01)))
  (=
    ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01)
    ($FVF.lookup_f (as sm@245@01  $FVF<f>) y@226@01))))
(assert (= (as sm@255@01  $FVF<f>) (as sm@257@01  $FVF<f>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@226@01 some@243@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@258@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (= ($FVF.lookup_f $t@258@01 r) ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@255@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@258@01 r))
  :qid |quant-u-166|)))
; Create MagicWandSnapFunction for wand acc(y.f, write) --* acc(some.f, write) && acc(y.f, write)
(declare-const mwsf@259@01 $MWSF)
(assert (forall (($t@244@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@259@01 $t@244@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01))
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01))))
  :pattern ((MWSF_apply mwsf@259@01 $t@244@01))
  :qid |quant-u-167|)))
(declare-const sm@260@01 $PSF<wand@2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  ($Snap.combine
    $t@244@01
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01))
      ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01))))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (=
  ($FVF.lookup_f (as sm@245@01  $FVF<f>) y@226@01)
  ($SortWrappers.$SnapToInt $t@244@01)))
(assert (and
  (=>
    (= some@243@01 y@226@01)
    (=
      ($FVF.lookup_f (as sm@248@01  $FVF<f>) some@243@01)
      ($FVF.lookup_f (as sm@245@01  $FVF<f>) some@243@01)))
  (= (as sm@246@01  $FVF<f>) (as sm@248@01  $FVF<f>))
  (=>
    (= some@243@01 y@226@01)
    (=
      ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
      ($FVF.lookup_f (as sm@242@01  $FVF<f>) some@243@01)))
  (=>
    (ite
      (and
        (img@230@01 some@243@01)
        (Seq_contains xs@225@01 (inv@229@01 some@243@01)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 some@243@01)))
      false)
    (=
      ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) some@243@01)))
  (=>
    (= some@243@01 (Seq_index xs@225@01 0))
    (=
      ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01)
      ($FVF.lookup_f (as sm@238@01  $FVF<f>) some@243@01)))
  (= (as sm@246@01  $FVF<f>) (as sm@252@01  $FVF<f>))))
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@247@01 y@226@01)))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f (as sm@245@01  $FVF<f>) y@226@01)))
  (= (as sm@255@01  $FVF<f>) (as sm@257@01  $FVF<f>))))
(assert (and
  (forall (($t@244@01 $Snap)) (!
    (=
      (MWSF_apply mwsf@259@01 $t@244@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01))
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01))))
    :pattern ((MWSF_apply mwsf@259@01 $t@244@01))
    :qid |quant-u-167|))
  (=
    ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    ($Snap.combine
      $t@244@01
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@252@01  $FVF<f>) some@243@01))
        ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@257@01  $FVF<f>) y@226@01)))))))
; [exec]
; completed := Seq(some)
; [eval] Seq(some)
(assert (= (Seq_length (Seq_singleton some@243@01)) 1))
(declare-const completed@261@01 Seq<$Ref>)
(assert (= completed@261@01 (Seq_singleton some@243@01)))
; [exec]
; assert (forall x: Ref ::(x in completed) ==>
;     acc(y.f, write) --* acc(x.f, write) && acc(y.f, write))
(declare-const x@262@01 $Ref)
(push) ; 4
; [eval] (x in completed)
(assert (Seq_contains completed@261@01 x@262@01))
(pop) ; 4
(declare-fun inv@263@01 ($Ref $Perm $Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@264@01 ($Ref $Perm $Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@262@01 $Ref) (x2@262@01 $Ref)) (!
  (=>
    (and
      (Seq_contains completed@261@01 x1@262@01)
      (Seq_contains completed@261@01 x2@262@01)
      (= x1@262@01 x2@262@01))
    (= x1@262@01 x2@262@01))
  
  :qid |wand@2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@262@01 $Ref)) (!
  (=>
    (Seq_contains completed@261@01 x@262@01)
    (and
      (=
        (inv@263@01 y@226@01 $Perm.Write x@262@01 $Perm.Write y@226@01 $Perm.Write)
        x@262@01)
      (img@264@01 y@226@01 $Perm.Write x@262@01 $Perm.Write y@226@01 $Perm.Write)))
  :pattern ((Seq_contains completed@261@01 x@262@01))
  :pattern ((Seq_contains_trigger completed@261@01 x@262@01))
  :pattern ((inv@263@01 y@226@01 $Perm.Write x@262@01 $Perm.Write y@226@01 $Perm.Write))
  :pattern ((img@264@01 y@226@01 $Perm.Write x@262@01 $Perm.Write y@226@01 $Perm.Write))
  :qid |wand@2-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (img@264@01 x0 x1 x2 x3 x4 x5)
      (Seq_contains completed@261@01 (inv@263@01 x0 x1 x2 x3 x4 x5)))
    (and
      (= y@226@01 x0)
      (= $Perm.Write x1)
      (= (inv@263@01 x0 x1 x2 x3 x4 x5) x2)
      (= $Perm.Write x3)
      (= y@226@01 x4)
      (= $Perm.Write x5)))
  :pattern ((inv@263@01 x0 x1 x2 x3 x4 x5))
  :qid |wand@2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@265@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (Seq_contains completed@261@01 (inv@263@01 x0 x1 x2 x3 x4 x5))
      (img@264@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@226@01)
        (= x1 $Perm.Write)
        (= x2 (inv@263@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@226@01)
        (= x5 $Perm.Write)))
    ($Perm.min
      (ite
        (and
          (= x0 y@226@01)
          (= x1 $Perm.Write)
          (= x2 some@243@01)
          (= x3 $Perm.Write)
          (= x4 y@226@01)
          (= x5 $Perm.Write))
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
(assert (not (=
  (-
    $Perm.Write
    (pTaken@265@01 y@226@01 $Perm.Write some@243@01 $Perm.Write y@226@01 $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (Seq_contains completed@261@01 (inv@263@01 x0 x1 x2 x3 x4 x5))
      (img@264@01 x0 x1 x2 x3 x4 x5)
      (and
        (= x0 y@226@01)
        (= x1 $Perm.Write)
        (= x2 (inv@263@01 x0 x1 x2 x3 x4 x5))
        (= x3 $Perm.Write)
        (= x4 y@226@01)
        (= x5 $Perm.Write)))
    (= (- $Perm.Write (pTaken@265@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-171|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@266@01 $PSF<wand@2>)
(declare-const s@267@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@267@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@267@01))))))
        y@226@01)
      (=
        ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first ($Snap.first ($Snap.first s@267@01))))))
        $Perm.Write)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first ($Snap.first ($Snap.first s@267@01)))))
        some@243@01)
      (=
        ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@267@01))))
        $Perm.Write)
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@267@01)))
        y@226@01)
      (= ($SortWrappers.$SnapTo$Perm ($Snap.second s@267@01)) $Perm.Write))
    (and
      (not (= s@267@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@2 (as sm@266@01  $PSF<wand@2>) s@267@01)
        ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) s@267@01))))
  :pattern (($PSF.lookup_wand@2 (as sm@266@01  $PSF<wand@2>) s@267@01))
  :pattern (($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) s@267@01))
  :qid |qp.psmValDef72|)))
; [exec]
; assert (applying acc(y.f, write) --* acc(some.f, write) && acc(y.f, write) in
;     some.f == 0)
; [eval] (applying acc(y.f, write) --* acc(some.f, write) && acc(y.f, write) in some.f == 0)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@268@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (= x0 y@226@01)
      (= x1 $Perm.Write)
      (= x2 some@243@01)
      (= x3 $Perm.Write)
      (= x4 y@226@01)
      (= x5 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (= x0 y@226@01)
          (= x1 $Perm.Write)
          (= x2 some@243@01)
          (= x3 $Perm.Write)
          (= x4 y@226@01)
          (= x5 $Perm.Write))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (pTaken@268@01 y@226@01 $Perm.Write some@243@01 $Perm.Write y@226@01 $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 y@226@01)
      (= x1 $Perm.Write)
      (= x2 some@243@01)
      (= x3 $Perm.Write)
      (= x4 y@226@01)
      (= x5 $Perm.Write))
    (= (- $Perm.Write (pTaken@268@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-174|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@269@01 $PSF<wand@2>)
(declare-const s@270@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      $Snap.unit))
  (=
    ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@271@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min (ite (= r y@226@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@272@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@271@01 r)))
    $Perm.No))
(define-fun pTaken@273@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@271@01 r)) (pTaken@272@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@271@01 y@226@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@226@01) (= (- $Perm.Write (pTaken@271@01 r)) $Perm.No))
  
  :qid |quant-u-177|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@274@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (= y@226@01 (Seq_index xs@225@01 0))
    (< $Perm.No (- $Perm.Write (pTaken@249@01 y@226@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
    ($FVF.lookup_f (as sm@238@01  $FVF<f>) y@226@01))))
(assert (=
  ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
  ($FVF.lookup_f (as sm@242@01  $FVF<f>) y@226@01)))
(assert (=>
  (ite
    (and (img@230@01 y@226@01) (Seq_contains xs@225@01 (inv@229@01 y@226@01)))
    (< $Perm.No (- $Perm.Write (pTaken@236@01 y@226@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) y@226@01))))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01))
  ($Snap.first ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (=
  ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(declare-const sm@275@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@275@01  $FVF<f>) some@243@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(declare-const $t@276@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite
        (= r (Seq_index xs@225@01 0))
        (< $Perm.No (- $Perm.Write (pTaken@249@01 r)))
        false)
      (= ($FVF.lookup_f $t@276@01 r) ($FVF.lookup_f (as sm@238@01  $FVF<f>) r)))
    (=>
      (= r some@243@01)
      (= ($FVF.lookup_f $t@276@01 r) ($FVF.lookup_f (as sm@275@01  $FVF<f>) r))))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@275@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@276@01 r))
  :qid |quant-u-178|)))
(assert (not (= some@243@01 $Ref.null)))
(declare-const sm@277@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@277@01  $FVF<f>) y@226@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= y@226@01 (Seq_index xs@225@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index xs@225@01 0) y@226@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write)
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    $Perm.Write
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write)
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (<
      $Perm.No
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write))
    false)
  (not
    (=
      ($FVF.lookup_f $t@276@01 (Seq_index xs@225@01 0))
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) y@226@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (<
      $Perm.No
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write))
    false)
  (not
    (=
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f $t@276@01 (Seq_index xs@225@01 0)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))))
(assert (and
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))))
(declare-const sm@278@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@278@01  $FVF<f>) r) ($FVF.lookup_f $t@276@01 r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@276@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@277@01  $FVF<f>) r))
  :qid |qp.fvfValDef79|)))
(declare-const pm@279@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@279@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
          (- $Perm.Write (pTaken@236@01 r))
          $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite (= r y@226@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@279@01  $FPM) r))
  :qid |qp.resPrmSumDef80|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@279@01  $FPM) r) $Perm.Write)
  :pattern ((inv@229@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@279@01  $FPM) (Seq_index xs@225@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@279@01  $FPM) y@226@01) $Perm.Write))
; [eval] some.f == 0
(declare-const sm@280@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@280@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@277@01  $FVF<f>) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) r) ($FVF.lookup_f $t@276@01 r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@276@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@280@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef83|)))
(declare-const pm@281@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@281@01  $FPM) r)
    (+
      (+
        (ite (= r y@226@01) $Perm.Write $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
(set-option :timeout 0)
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_f (as pm@281@01  $FPM) some@243@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@278@01  $FVF<f>) r) ($FVF.lookup_f $t@276@01 r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@276@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@277@01  $FVF<f>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@279@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
          (- $Perm.Write (pTaken@236@01 r))
          $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite (= r y@226@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@279@01  $FPM) r))
  :qid |qp.resPrmSumDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@280@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@277@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@277@01  $FVF<f>) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) r) ($FVF.lookup_f $t@276@01 r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@276@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@280@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@280@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@281@01  $FPM) r)
    (+
      (+
        (ite (= r y@226@01) $Perm.Write $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
(assert (and
  (not
    (=
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      $Snap.unit))
  (=
    ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))
  (=>
    (ite
      (= y@226@01 (Seq_index xs@225@01 0))
      (< $Perm.No (- $Perm.Write (pTaken@249@01 y@226@01)))
      false)
    (=
      ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f (as sm@238@01  $FVF<f>) y@226@01)))
  (=
    ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
    ($FVF.lookup_f (as sm@242@01  $FVF<f>) y@226@01))
  (=>
    (ite
      (and (img@230@01 y@226@01) (Seq_contains xs@225@01 (inv@229@01 y@226@01)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 y@226@01)))
      false)
    (=
      ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) y@226@01)))
  (=
    ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@274@01  $FVF<f>) y@226@01))
    ($Snap.first ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (=
    ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@275@01  $FVF<f>) some@243@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  (forall ((r $Ref)) (!
    (and
      (=>
        (ite
          (= r (Seq_index xs@225@01 0))
          (< $Perm.No (- $Perm.Write (pTaken@249@01 r)))
          false)
        (= ($FVF.lookup_f $t@276@01 r) ($FVF.lookup_f (as sm@238@01  $FVF<f>) r)))
      (=>
        (= r some@243@01)
        (= ($FVF.lookup_f $t@276@01 r) ($FVF.lookup_f (as sm@275@01  $FVF<f>) r))))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@275@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@276@01 r))
    :qid |quant-u-178|))
  (not (= some@243@01 $Ref.null))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@277@01  $FVF<f>) y@226@01)
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@279@01  $FPM) r) $Perm.Write)
    :pattern ((inv@229@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@279@01  $FPM) (Seq_index xs@225@01 0)) $Perm.Write)
  (<= ($FVF.perm_f (as pm@279@01  $FPM) y@226@01) $Perm.Write)))
(push) ; 4
(assert (not (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) some@243@01) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@280@01  $FVF<f>) some@243@01) 0))
; [exec]
; assert (applying acc(y.f, write) --* acc(some.f, write) && acc(y.f, write) in
;     y.f == 1)
; [eval] (applying acc(y.f, write) --* acc(some.f, write) && acc(y.f, write) in y.f == 1)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@282@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) $Perm
  (ite
    (and
      (= x0 y@226@01)
      (= x1 $Perm.Write)
      (= x2 some@243@01)
      (= x3 $Perm.Write)
      (= x4 y@226@01)
      (= x5 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (= x0 y@226@01)
          (= x1 $Perm.Write)
          (= x2 some@243@01)
          (= x3 $Perm.Write)
          (= x4 y@226@01)
          (= x5 $Perm.Write))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (pTaken@282@01 y@226@01 $Perm.Write some@243@01 $Perm.Write y@226@01 $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (x4 $Ref) (x5 $Perm)) (!
  (=>
    (and
      (= x0 y@226@01)
      (= x1 $Perm.Write)
      (= x2 some@243@01)
      (= x3 $Perm.Write)
      (= x4 y@226@01)
      (= x5 $Perm.Write))
    (= (- $Perm.Write (pTaken@282@01 x0 x1 x2 x3 x4 x5)) $Perm.No))
  
  :qid |quant-u-181|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      $Snap.unit))
  (=
    ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@283@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min (ite (= r y@226@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@284@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@283@01 r)))
    $Perm.No))
(define-fun pTaken@285@01 ((r $Ref)) $Perm
  (ite
    (= r y@226@01)
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@283@01 r)) (pTaken@284@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@283@01 y@226@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r y@226@01) (= (- $Perm.Write (pTaken@283@01 r)) $Perm.No))
  
  :qid |quant-u-184|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(declare-const sm@286@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@286@01  $FVF<f>) some@243@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(declare-const $t@287@01 $FVF<f>)
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (ite
        (= r (Seq_index xs@225@01 0))
        (< $Perm.No (- $Perm.Write (pTaken@249@01 r)))
        false)
      (= ($FVF.lookup_f $t@287@01 r) ($FVF.lookup_f (as sm@238@01  $FVF<f>) r)))
    (=>
      (= r some@243@01)
      (= ($FVF.lookup_f $t@287@01 r) ($FVF.lookup_f (as sm@286@01  $FVF<f>) r))))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@286@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@287@01 r))
  :qid |quant-u-185|)))
(declare-const sm@288@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@288@01  $FVF<f>) y@226@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap y@226@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap some@243@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@226@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= y@226@01 (Seq_index xs@225@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index xs@225@01 0) y@226@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write)
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    $Perm.Write
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write)
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (<
      $Perm.No
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write))
    false)
  (not
    (=
      ($FVF.lookup_f $t@287@01 (Seq_index xs@225@01 0))
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) y@226@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (<
      $Perm.No
      (+ (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))) $Perm.Write))
    false)
  (not
    (=
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f $t@287@01 (Seq_index xs@225@01 0)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))))
(assert (and
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))))
(declare-const sm@289@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@289@01  $FVF<f>) r) ($FVF.lookup_f $t@287@01 r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@287@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@288@01  $FVF<f>) r))
  :qid |qp.fvfValDef87|)))
(declare-const pm@290@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@290@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
          (- $Perm.Write (pTaken@236@01 r))
          $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite (= r y@226@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@290@01  $FPM) r))
  :qid |qp.resPrmSumDef88|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@290@01  $FPM) r) $Perm.Write)
  :pattern ((inv@229@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@290@01  $FPM) (Seq_index xs@225@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@290@01  $FPM) y@226@01) $Perm.Write))
; [eval] y.f == 1
(declare-const sm@291@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@291@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@288@01  $FVF<f>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@291@01  $FVF<f>) r) ($FVF.lookup_f $t@287@01 r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@287@01 r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@291@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef91|)))
(declare-const pm@292@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@292@01  $FPM) r)
    (+
      (+
        (ite (= r y@226@01) $Perm.Write $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@292@01  $FPM) r))
  :qid |qp.resPrmSumDef92|)))
(set-option :timeout 0)
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_f (as pm@292@01  $FPM) y@226@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@289@01  $FVF<f>) r) ($FVF.lookup_f $t@287@01 r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@287@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@289@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@289@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@288@01  $FVF<f>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@290@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
          (- $Perm.Write (pTaken@236@01 r))
          $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite (= r y@226@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@290@01  $FPM) r))
  :qid |qp.resPrmSumDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@291@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@288@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@288@01  $FVF<f>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write))
      false)
    (= ($FVF.lookup_f (as sm@291@01  $FVF<f>) r) ($FVF.lookup_f $t@287@01 r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@287@01 r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@291@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@291@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@292@01  $FPM) r)
    (+
      (+
        (ite (= r y@226@01) $Perm.Write $Perm.No)
        (ite
          (= r (Seq_index xs@225@01 0))
          (+ (- $Perm.Write (pTaken@249@01 r)) $Perm.Write)
          $Perm.No))
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@292@01  $FPM) r))
  :qid |qp.resPrmSumDef92|)))
(assert (and
  (not
    (=
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap y@226@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap some@243@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@226@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      $Snap.unit))
  (=
    ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    ($PSF.lookup_wand@2 (as sm@260@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@286@01  $FVF<f>) some@243@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  (forall ((r $Ref)) (!
    (and
      (=>
        (ite
          (= r (Seq_index xs@225@01 0))
          (< $Perm.No (- $Perm.Write (pTaken@249@01 r)))
          false)
        (= ($FVF.lookup_f $t@287@01 r) ($FVF.lookup_f (as sm@238@01  $FVF<f>) r)))
      (=>
        (= r some@243@01)
        (= ($FVF.lookup_f $t@287@01 r) ($FVF.lookup_f (as sm@286@01  $FVF<f>) r))))
    :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@286@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@287@01 r))
    :qid |quant-u-185|))))
(assert (and
  (=
    ($FVF.lookup_f (as sm@288@01  $FVF<f>) y@226@01)
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($PSF.lookup_wand@2 (as sm@269@01  $PSF<wand@2>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap y@226@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap some@243@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@226@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
  (not (= (Seq_index xs@225@01 0) y@226@01))
  (not (= y@226@01 (Seq_index xs@225@01 0)))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_f (as pm@290@01  $FPM) r) $Perm.Write)
    :pattern ((inv@229@01 r))
    :qid |qp-fld-prm-bnd|))
  (<= ($FVF.perm_f (as pm@290@01  $FPM) (Seq_index xs@225@01 0)) $Perm.Write)
  (<= ($FVF.perm_f (as pm@290@01  $FPM) y@226@01) $Perm.Write)))
(push) ; 4
(assert (not (= ($FVF.lookup_f (as sm@291@01  $FVF<f>) y@226@01) 1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@291@01  $FVF<f>) y@226@01) 1))
; [exec]
; assert (forall x: Ref ::(x in xs[1..]) ==> acc(x.f, write))
(declare-const x@293@01 $Ref)
(push) ; 4
; [eval] (x in xs[1..])
; [eval] xs[1..]
(assert (Seq_contains (Seq_drop xs@225@01 1) x@293@01))
(pop) ; 4
(declare-fun inv@294@01 ($Ref) $Ref)
(declare-fun img@295@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@293@01 $Ref) (x2@293@01 $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_drop xs@225@01 1) x1@293@01)
      (Seq_contains (Seq_drop xs@225@01 1) x2@293@01)
      (= x1@293@01 x2@293@01))
    (= x1@293@01 x2@293@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@293@01 $Ref)) (!
  (=>
    (Seq_contains (Seq_drop xs@225@01 1) x@293@01)
    (and (= (inv@294@01 x@293@01) x@293@01) (img@295@01 x@293@01)))
  :pattern ((Seq_contains (Seq_drop xs@225@01 1) x@293@01))
  :pattern ((Seq_contains_trigger (Seq_drop xs@225@01 1) x@293@01))
  :pattern ((inv@294@01 x@293@01))
  :pattern ((img@295@01 x@293@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@295@01 r) (Seq_contains (Seq_drop xs@225@01 1) (inv@294@01 r)))
    (= (inv@294@01 r) r))
  :pattern ((inv@294@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@296@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_drop xs@225@01 1) (inv@294@01 r))
      (img@295@01 r)
      (= r (inv@294@01 r)))
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@297@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_drop xs@225@01 1) (inv@294@01 r))
      (img@295@01 r)
      (= r (inv@294@01 r)))
    ($Perm.min
      (ite (= r y@226@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@296@01 r)))
    $Perm.No))
(define-fun pTaken@298@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_drop xs@225@01 1) (inv@294@01 r))
      (img@295@01 r)
      (= r (inv@294@01 r)))
    ($Perm.min
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@296@01 r)) (pTaken@297@01 r)))
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
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (pTaken@296@01 r))
    $Perm.No)
  
  :qid |quant-u-188|))))
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
      (Seq_contains (Seq_drop xs@225@01 1) (inv@294@01 r))
      (img@295@01 r)
      (= r (inv@294@01 r)))
    (= (- $Perm.Write (pTaken@296@01 r)) $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@299@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@236@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@299@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r)))
  :pattern (($FVF.lookup_f (as sm@299@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@227@01)) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@226@01)
    (=
      ($FVF.lookup_f (as sm@299@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@242@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@299@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@242@01  $FVF<f>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r (Seq_index xs@225@01 0))
      (< $Perm.No (- $Perm.Write (pTaken@249@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@299@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@238@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@299@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@238@01  $FVF<f>) r))
  :qid |qp.fvfValDef95|)))
; [exec]
; assert (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@300@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@225@01 x@300@01))
(pop) ; 4
(declare-fun inv@301@01 ($Ref) $Ref)
(declare-fun img@302@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@300@01 $Ref) (x2@300@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@225@01 x1@300@01)
      (Seq_contains xs@225@01 x2@300@01)
      (= x1@300@01 x2@300@01))
    (= x1@300@01 x2@300@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@300@01 $Ref)) (!
  (=>
    (Seq_contains xs@225@01 x@300@01)
    (and (= (inv@301@01 x@300@01) x@300@01) (img@302@01 x@300@01)))
  :pattern ((Seq_contains xs@225@01 x@300@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@300@01))
  :pattern ((inv@301@01 x@300@01))
  :pattern ((img@302@01 x@300@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@302@01 r) (Seq_contains xs@225@01 (inv@301@01 r)))
    (= (inv@301@01 r) r))
  :pattern ((inv@301@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@303@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@304@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    ($Perm.min
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@303@01 r)))
    $Perm.No))
(define-fun pTaken@305@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    ($Perm.min
      (ite (= r y@226@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@303@01 r)) (pTaken@304@01 r)))
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
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (pTaken@303@01 r))
    $Perm.No)
  
  :qid |quant-u-192|))))
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
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    (= (- $Perm.Write (pTaken@303@01 r)) $Perm.No))
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0)))
      $Perm.No)
    (pTaken@304@01 (Seq_index xs@225@01 0)))
  $Perm.No)))
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
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    (= (- (- $Perm.Write (pTaken@303@01 r)) (pTaken@304@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@305@01 y@226@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@305@01 r) $Perm.No)
  
  :qid |quant-u-197|))))
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
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@303@01 r)) (pTaken@304@01 r))
        (pTaken@305@01 r))
      $Perm.No))
  
  :qid |quant-u-198|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@225@01 (inv@301@01 r))
      (img@302@01 r)
      (= r (inv@301@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@303@01 r)) (pTaken@304@01 r))
        (pTaken@305@01 r))
      $Perm.No))
  
  :qid |quant-u-198|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@226@01 (Seq_index xs@225@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    $Perm.Write
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0)))
      $Perm.No)
    $Perm.Write))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (< $Perm.No (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))))
    false)
  (not
    (=
      ($FVF.lookup_f (as sm@242@01  $FVF<f>) y@226@01)
      ($FVF.lookup_f (as sm@238@01  $FVF<f>) (Seq_index xs@225@01 0)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (ite
    (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
    (< $Perm.No (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0))))
    false)
  (not
    (=
      ($FVF.lookup_f (as sm@238@01  $FVF<f>) (Seq_index xs@225@01 0))
      ($FVF.lookup_f (as sm@242@01  $FVF<f>) y@226@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@306@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@306@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
          (- $Perm.Write (pTaken@236@01 r))
          $Perm.No)
        (ite (= r y@226@01) $Perm.Write $Perm.No))
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@306@01  $FPM) r))
  :qid |qp.resPrmSumDef96|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@306@01  $FPM) r) $Perm.Write)
  :pattern ((inv@229@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@306@01  $FPM) y@226@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@306@01  $FPM) (Seq_index xs@225@01 0)) $Perm.Write))
(declare-const x@307@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@225@01 x@307@01))
(pop) ; 4
(declare-fun inv@308@01 ($Ref) $Ref)
(declare-fun img@309@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@307@01 $Ref) (x2@307@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@225@01 x1@307@01)
      (Seq_contains xs@225@01 x2@307@01)
      (= x1@307@01 x2@307@01))
    (= x1@307@01 x2@307@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@307@01 $Ref)) (!
  (=>
    (Seq_contains xs@225@01 x@307@01)
    (and (= (inv@308@01 x@307@01) x@307@01) (img@309@01 x@307@01)))
  :pattern ((Seq_contains xs@225@01 x@307@01))
  :pattern ((Seq_contains_trigger xs@225@01 x@307@01))
  :pattern ((inv@308@01 x@307@01))
  :pattern ((img@309@01 x@307@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@309@01 r) (Seq_contains xs@225@01 (inv@308@01 r)))
    (= (inv@308@01 r) r))
  :pattern ((inv@308@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@310@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    ($Perm.min
      (ite
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@311@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    ($Perm.min
      (ite
        (= r (Seq_index xs@225@01 0))
        (- $Perm.Write (pTaken@249@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@310@01 r)))
    $Perm.No))
(define-fun pTaken@312@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    ($Perm.min
      (ite (= r y@226@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@310@01 r)) (pTaken@311@01 r)))
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
        (and (img@230@01 r) (Seq_contains xs@225@01 (inv@229@01 r)))
        (- $Perm.Write (pTaken@236@01 r))
        $Perm.No)
      (pTaken@310@01 r))
    $Perm.No)
  
  :qid |quant-u-201|))))
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
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    (= (- $Perm.Write (pTaken@310@01 r)) $Perm.No))
  
  :qid |quant-u-202|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@225@01 0) (Seq_index xs@225@01 0))
      (- $Perm.Write (pTaken@249@01 (Seq_index xs@225@01 0)))
      $Perm.No)
    (pTaken@311@01 (Seq_index xs@225@01 0)))
  $Perm.No)))
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
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    (= (- (- $Perm.Write (pTaken@310@01 r)) (pTaken@311@01 r)) $Perm.No))
  
  :qid |quant-u-204|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@312@01 y@226@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@312@01 r) $Perm.No)
  
  :qid |quant-u-206|))))
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
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@310@01 r)) (pTaken@311@01 r))
        (pTaken@312@01 r))
      $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains xs@225@01 (inv@308@01 r))
      (img@309@01 r)
      (= r (inv@308@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@310@01 r)) (pTaken@311@01 r))
        (pTaken@312@01 r))
      $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const xs@313@01 Seq<$Ref>)
(declare-const xs@314@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@315@01 $Snap)
(assert (= $t@315@01 ($Snap.combine ($Snap.first $t@315@01) ($Snap.second $t@315@01))))
(declare-const x@316@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Seq_contains xs@314@01 x@316@01))
(pop) ; 2
(declare-fun inv@317@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@318@01 (Bool $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@316@01 $Ref) (x2@316@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@314@01 x1@316@01)
      (Seq_contains xs@314@01 x2@316@01)
      (= x1@316@01 x2@316@01))
    (= x1@316@01 x2@316@01))
  
  :qid |wand@4-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@316@01 $Ref)) (!
  (=>
    (Seq_contains xs@314@01 x@316@01)
    (and
      (= (inv@317@01 true x@316@01 $Perm.Write) x@316@01)
      (img@318@01 true x@316@01 $Perm.Write)))
  :pattern ((Seq_contains xs@314@01 x@316@01))
  :pattern ((Seq_contains_trigger xs@314@01 x@316@01))
  :pattern ((Seq_contains_trigger xs@314@01 x@316@01))
  :pattern ((inv@317@01 true x@316@01 $Perm.Write))
  :pattern ((img@318@01 true x@316@01 $Perm.Write))
  :qid |quant-u-209|)))
(assert (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (img@318@01 x0 x1 x2) (Seq_contains xs@314@01 (inv@317@01 x0 x1 x2)))
    (and (= true x0) (= (inv@317@01 x0 x1 x2) x1) (= $Perm.Write x2)))
  :pattern ((inv@317@01 x0 x1 x2))
  :qid |wand@4-fctOfInv|)))
; Permissons are non-negative
(assert (= ($Snap.second $t@315@01) $Snap.unit))
; [eval] |xs| > 0
; [eval] |xs|
(assert (> (Seq_length xs@314@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (applying true --* acc(xs[0].f, write) in
;     xs[0].f == 0)
(declare-const $t@319@01 $Snap)
(assert (= $t@319@01 $Snap.unit))
; [eval] (applying true --* acc(xs[0].f, write) in xs[0].f == 0)
(push) ; 3
; [eval] xs[0]
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@320@01 ((x0 Bool) (x1 $Ref) (x2 $Perm)) $Perm
  (ite
    (and (= x0 true) (= x1 (Seq_index xs@314@01 0)) (= x2 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (img@318@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@317@01 x0 x1 x2)))
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
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@318@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@317@01 x0 x1 x2)))
        $Perm.Write
        $Perm.No)
      (pTaken@320@01 x0 x1 x2))
    $Perm.No)
  
  :qid |quant-u-211|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (= (pTaken@320@01 x0 x1 x2) $Perm.No)
  
  :qid |quant-u-212|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (= x0 true) (= x1 (Seq_index xs@314@01 0)) (= x2 $Perm.Write))
    (= (- $Perm.Write (pTaken@320@01 x0 x1 x2)) $Perm.No))
  
  :qid |quant-u-213|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@321@01 $PSF<wand@4>)
(declare-const s@322@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@318@01 true (Seq_index xs@314@01 0) $Perm.Write)
    (Seq_contains
      xs@314@01
      (inv@317@01 true (Seq_index xs@314@01 0) $Perm.Write)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.BoolTo$Snap true)
            ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@4 (as sm@321@01  $PSF<wand@4>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.BoolTo$Snap true)
          ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.BoolTo$Snap true)
          ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
(assert (=
  $Snap.unit
  ($Snap.first ($PSF.lookup_wand@4 (as sm@321@01  $PSF<wand@4>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.BoolTo$Snap true)
      ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index xs@314@01 0) $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] xs[0].f == 0
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (and
  (=>
    (and
      (img@318@01 true (Seq_index xs@314@01 0) $Perm.Write)
      (Seq_contains
        xs@314@01
        (inv@317@01 true (Seq_index xs@314@01 0) $Perm.Write)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.BoolTo$Snap true)
              ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@4 (as sm@321@01  $PSF<wand@4>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.BoolTo$Snap true)
            ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.BoolTo$Snap true)
            ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=
    $Snap.unit
    ($Snap.first ($PSF.lookup_wand@4 (as sm@321@01  $PSF<wand@4>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.BoolTo$Snap true)
        ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= (Seq_index xs@314@01 0) $Ref.null))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@4 (as sm@321@01  $PSF<wand@4>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.BoolTo$Snap true)
      ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package true --* (forall x: Ref ::(x in xs) ==> true --* acc(x.f, write)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@323@01 $Snap)
(assert (= $t@323@01 $Snap.unit))
(declare-const x@324@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@314@01 x@324@01))
(pop) ; 4
(declare-fun inv@325@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@326@01 (Bool $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@324@01 $Ref) (x2@324@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@314@01 x1@324@01)
      (Seq_contains xs@314@01 x2@324@01)
      (= x1@324@01 x2@324@01))
    (= x1@324@01 x2@324@01))
  
  :qid |wand@4-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@324@01 $Ref)) (!
  (=>
    (Seq_contains xs@314@01 x@324@01)
    (and
      (= (inv@325@01 true x@324@01 $Perm.Write) x@324@01)
      (img@326@01 true x@324@01 $Perm.Write)))
  :pattern ((Seq_contains xs@314@01 x@324@01))
  :pattern ((Seq_contains_trigger xs@314@01 x@324@01))
  :pattern ((inv@325@01 true x@324@01 $Perm.Write))
  :pattern ((img@326@01 true x@324@01 $Perm.Write))
  :qid |wand@4-invOfFct|)))
(assert (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (img@326@01 x0 x1 x2) (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2)))
    (and (= true x0) (= (inv@325@01 x0 x1 x2) x1) (= $Perm.Write x2)))
  :pattern ((inv@325@01 x0 x1 x2))
  :qid |wand@4-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  false
  
  :qid |quant-u-215|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2))
      (img@326@01 x0 x1 x2)
      (and (= x0 true) (= x1 (inv@325@01 x0 x1 x2)) (= x2 $Perm.Write)))
    false)
  
  :qid |quant-u-216|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@327@01 $PSF<wand@4>)
(declare-const s@328@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@329@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@330@01 (Bool $Ref $Perm) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2))
      (img@326@01 x0 x1 x2)
      (and (= x0 true) (= x1 (inv@325@01 x0 x1 x2)) (= x2 $Perm.Write)))
    false)
  
  :qid |quant-u-217|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@331@01 $PSF<wand@4>)
(declare-const s@332@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@333@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@334@01 (Bool $Ref $Perm) Bool)
(assert (= (as sm@327@01  $PSF<wand@4>) (as sm@331@01  $PSF<wand@4>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@335@01 ((x0 Bool) (x1 $Ref) (x2 $Perm)) $Perm
  (ite
    (and
      (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2))
      (img@326@01 x0 x1 x2)
      (and (= x0 true) (= x1 (inv@325@01 x0 x1 x2)) (= x2 $Perm.Write)))
    ($Perm.min
      (ite
        (and
          (img@318@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@317@01 x0 x1 x2)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@318@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@317@01 x0 x1 x2)))
        $Perm.Write
        $Perm.No)
      (pTaken@335@01 x0 x1 x2))
    $Perm.No)
  
  :qid |quant-u-219|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and
      (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2))
      (img@326@01 x0 x1 x2)
      (and (= x0 true) (= x1 (inv@325@01 x0 x1 x2)) (= x2 $Perm.Write)))
    (= (- $Perm.Write (pTaken@335@01 x0 x1 x2)) $Perm.No))
  
  :qid |quant-u-220|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@336@01 $PSF<wand@4>)
(declare-const s@337@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@337@01 $Snap)) (!
  (=>
    (and
      (img@318@01 ($SortWrappers.$SnapToBool ($Snap.first ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@337@01)))
      (Seq_contains
        xs@314@01
        (inv@317@01 ($SortWrappers.$SnapToBool ($Snap.first ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@337@01)))))
    (and
      (not (= s@337@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@4 (as sm@336@01  $PSF<wand@4>) s@337@01)
        ($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) s@337@01))))
  :pattern (($PSF.lookup_wand@4 (as sm@336@01  $PSF<wand@4>) s@337@01))
  :pattern (($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) s@337@01))
  :qid |qp.psmValDef98|)))
(declare-fun inv@338@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@339@01 (Bool $Ref $Perm) Bool)
(assert (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (img@339@01 x0 x1 x2) (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2)))
    (and (= true x0) (= (inv@338@01 x0 x1 x2) x1) (= $Perm.Write x2)))
  :pattern ((inv@338@01 x0 x1 x2))
  :qid |wand@4-fctOfInv|)))
(assert (forall ((x@324@01 $Ref)) (!
  (=>
    (Seq_contains xs@314@01 (inv@325@01 true x@324@01 $Perm.Write))
    (and
      (= (inv@338@01 true x@324@01 $Perm.Write) x@324@01)
      (img@339@01 true x@324@01 $Perm.Write)))
  :pattern ((inv@338@01 true x@324@01 $Perm.Write))
  :pattern ((img@339@01 true x@324@01 $Perm.Write))
  :qid |wand@4-invOfFct|)))
(assert (= (as sm@327@01  $PSF<wand@4>) (as sm@336@01  $PSF<wand@4>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* (forall x: Ref ::(x in xs) ==> true --* acc(x.f, write))
(declare-const mwsf@340@01 $MWSF)
(assert (forall (($t@323@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@340@01 $t@323@01)
    ($SortWrappers.$PSF<wand@4>To$Snap (as sm@336@01  $PSF<wand@4>)))
  :pattern ((MWSF_apply mwsf@340@01 $t@323@01))
  :qid |quant-u-221|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@323@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@340@01 $t@323@01)
    ($SortWrappers.$PSF<wand@4>To$Snap (as sm@336@01  $PSF<wand@4>)))
  :pattern ((MWSF_apply mwsf@340@01 $t@323@01))
  :qid |quant-u-222|)))
(assert (forall ((s@337@01 $Snap)) (!
  (=>
    (and
      (img@318@01 ($SortWrappers.$SnapToBool ($Snap.first ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@337@01)))
      (Seq_contains
        xs@314@01
        (inv@317@01 ($SortWrappers.$SnapToBool ($Snap.first ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@337@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@337@01)))))
    (and
      (not (= s@337@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@4 (as sm@336@01  $PSF<wand@4>) s@337@01)
        ($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) s@337@01))))
  :pattern (($PSF.lookup_wand@4 (as sm@336@01  $PSF<wand@4>) s@337@01))
  :pattern (($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> ($Snap.first $t@315@01)) s@337@01))
  :qid |qp.psmValDef98|)))
(assert (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (img@339@01 x0 x1 x2) (Seq_contains xs@314@01 (inv@325@01 x0 x1 x2)))
    (and (= true x0) (= (inv@338@01 x0 x1 x2) x1) (= $Perm.Write x2)))
  :pattern ((inv@338@01 x0 x1 x2))
  :qid |wand@4-fctOfInv|)))
(assert (forall ((x@324@01 $Ref)) (!
  (=>
    (Seq_contains xs@314@01 (inv@325@01 true x@324@01 $Perm.Write))
    (and
      (= (inv@338@01 true x@324@01 $Perm.Write) x@324@01)
      (img@339@01 true x@324@01 $Perm.Write)))
  :pattern ((inv@338@01 true x@324@01 $Perm.Write))
  :pattern ((img@339@01 true x@324@01 $Perm.Write))
  :qid |wand@4-invOfFct|)))
(assert (and
  (= (as sm@327@01  $PSF<wand@4>) (as sm@331@01  $PSF<wand@4>))
  (= (as sm@327@01  $PSF<wand@4>) (as sm@336@01  $PSF<wand@4>))))
; [exec]
; apply true --* (forall x: Ref ::(x in xs) ==> true --* acc(x.f, write))
(declare-const x@341@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Seq_contains xs@314@01 x@341@01))
(pop) ; 4
(declare-fun inv@342@01 (Bool $Ref $Perm) $Ref)
(declare-fun img@343@01 (Bool $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@341@01 $Ref) (x2@341@01 $Ref)) (!
  (=>
    (and
      (Seq_contains xs@314@01 x1@341@01)
      (Seq_contains xs@314@01 x2@341@01)
      (= x1@341@01 x2@341@01))
    (= x1@341@01 x2@341@01))
  
  :qid |wand@4-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@341@01 $Ref)) (!
  (=>
    (Seq_contains xs@314@01 x@341@01)
    (and
      (= (inv@342@01 true x@341@01 $Perm.Write) x@341@01)
      (img@343@01 true x@341@01 $Perm.Write)))
  :pattern ((Seq_contains xs@314@01 x@341@01))
  :pattern ((Seq_contains_trigger xs@314@01 x@341@01))
  :pattern ((Seq_contains_trigger xs@314@01 x@341@01))
  :pattern ((inv@342@01 true x@341@01 $Perm.Write))
  :pattern ((img@343@01 true x@341@01 $Perm.Write))
  :qid |quant-u-224|)))
(assert (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (img@343@01 x0 x1 x2) (Seq_contains xs@314@01 (inv@342@01 x0 x1 x2)))
    (and (= true x0) (= (inv@342@01 x0 x1 x2) x1) (= $Perm.Write x2)))
  :pattern ((inv@342@01 x0 x1 x2))
  :qid |wand@4-fctOfInv|)))
; Permissons are non-negative
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; apply true --* acc(xs[0].f, write)
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@344@01 ((x0 Bool) (x1 $Ref) (x2 $Perm)) $Perm
  (ite
    (and (= x0 true) (= x1 (Seq_index xs@314@01 0)) (= x2 $Perm.Write))
    ($Perm.min
      (ite
        (and
          (img@343@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@342@01 x0 x1 x2)))
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
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=
    (-
      (ite
        (and
          (img@343@01 x0 x1 x2)
          (Seq_contains xs@314@01 (inv@342@01 x0 x1 x2)))
        $Perm.Write
        $Perm.No)
      (pTaken@344@01 x0 x1 x2))
    $Perm.No)
  
  :qid |quant-u-226|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (= (pTaken@344@01 x0 x1 x2) $Perm.No)
  
  :qid |quant-u-227|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x0 Bool) (x1 $Ref) (x2 $Perm)) (!
  (=>
    (and (= x0 true) (= x1 (Seq_index xs@314@01 0)) (= x2 $Perm.Write))
    (= (- $Perm.Write (pTaken@344@01 x0 x1 x2)) $Perm.No))
  
  :qid |quant-u-228|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@345@01 $PSF<wand@4>)
(declare-const s@346@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@343@01 true (Seq_index xs@314@01 0) $Perm.Write)
    (Seq_contains
      xs@314@01
      (inv@342@01 true (Seq_index xs@314@01 0) $Perm.Write)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.BoolTo$Snap true)
            ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@4 (as sm@345@01  $PSF<wand@4>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.BoolTo$Snap true)
          ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@4 ($SortWrappers.$SnapTo$PSF<wand@4> (MWSF_apply mwsf@340@01 $Snap.unit)) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.BoolTo$Snap true)
          ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
(assert (=
  $Snap.unit
  ($Snap.first ($PSF.lookup_wand@4 (as sm@345@01  $PSF<wand@4>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.BoolTo$Snap true)
      ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert xs[0].f == 0
; [eval] xs[0].f == 0
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@314@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@4 (as sm@345@01  $PSF<wand@4>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.BoolTo$Snap true)
      ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@4 (as sm@345@01  $PSF<wand@4>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.BoolTo$Snap true)
      ($SortWrappers.$RefTo$Snap (Seq_index xs@314@01 0)))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  0))
; [exec]
; assert false
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
