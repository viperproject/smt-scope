(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:03:31
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._quantifiedpermissions_._sets_._generalised_shape.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
(declare-sort $FVF<g> 0)
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
(declare-fun $SortWrappers.$FVF<g>To$Snap ($FVF<g>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<g> ($Snap) $FVF<g>)
(assert (forall ((x $FVF<g>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<g>($SortWrappers.$FVF<g>To$Snap x)))
    :pattern (($SortWrappers.$FVF<g>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<g>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<g>To$Snap($SortWrappers.$SnapTo$FVF<g> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<g> x))
    :qid |$Snap.$FVF<g>To$SnapTo$FVF<g>|
    )))
; ////////// Symbols
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_disjoint (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_disjoint (Set<Int> Set<Int>) Bool)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_disjoint (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [g: Ref]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) $Ref)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g ($Ref $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap Set<$Ref> Set<$Ref>) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.card_non_negative|)))
(assert (forall ((e $Ref)) (!
  (not (Set_in e (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in e (as Set_empty  Set<$Ref>)))
  :qid |$Set[Ref]_prog.in_empty_set|)))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Ref)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Ref]_prog.empty_set_cardinality|)))
(assert (forall ((e $Ref)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Ref]_prog.in_singleton_set|)))
(assert (forall ((e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Ref]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Ref)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Ref]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Ref]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Ref]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Ref]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Ref>) (e $Ref)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Ref]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Ref]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Ref]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Ref]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Ref]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Ref]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Ref]_prog.in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>) (e $Ref)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Ref]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Ref)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Ref]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Ref)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Ref]_prog.native_equality|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Ref)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Ref]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Ref>) (s2 Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Ref]_prog.cardinality_difference|)))
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.card_non_negative|)))
(assert (forall ((e Int)) (!
  (not (Set_in e (as Set_empty  Set<Int>)))
  :pattern ((Set_in e (as Set_empty  Set<Int>)))
  :qid |$Set[Int]_prog.in_empty_set|)))
(assert (forall ((s Set<Int>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Int)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.empty_set_cardinality|)))
(assert (forall ((e Int)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Int]_prog.in_singleton_set|)))
(assert (forall ((e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Int]_prog.in_singleton_set_equality|)))
(assert (forall ((e Int)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Int]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Int]_prog.in_unionone_same|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Int]_prog.in_unionone_other|)))
(assert (forall ((s Set<Int>) (e1 Int) (e2 Int)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Int]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Int>) (e Int)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Int]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Int]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Int]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Int]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Int]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Int]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Int]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Int]_prog.in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>) (e Int)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Int]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Int)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Int]_prog.subset_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Int)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.equality_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Int]_prog.native_equality|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Int)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Int]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Int>) (s2 Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Int]_prog.cardinality_difference|)))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.card_non_negative|)))
(assert (forall ((e $Snap)) (!
  (not (Set_in e (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in e (as Set_empty  Set<$Snap>)))
  :qid |$Set[Snap]_prog.in_empty_set|)))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e $Snap)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Snap]_prog.empty_set_cardinality|)))
(assert (forall ((e $Snap)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Snap]_prog.in_singleton_set|)))
(assert (forall ((e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Snap]_prog.in_singleton_set_equality|)))
(assert (forall ((e $Snap)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Snap]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Snap]_prog.in_unionone_same|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Snap]_prog.in_unionone_other|)))
(assert (forall ((s Set<$Snap>) (e1 $Snap) (e2 $Snap)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Snap]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<$Snap>) (e $Snap)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Snap]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Snap]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Snap]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Snap]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Snap]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Snap]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Snap]_prog.in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>) (e $Snap)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Snap]_prog.not_in_difference|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e $Snap)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Snap]_prog.subset_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e $Snap)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.equality_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Snap]_prog.native_equality|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e $Snap)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Snap]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<$Snap>) (s2 Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference s1 s2)) (Set_card (Set_difference s2 s1)))
        (Set_card (Set_intersection s1 s2)))
      (Set_card (Set_union s1 s2)))
    (=
      (Set_card (Set_difference s1 s2))
      (- (Set_card s1) (Set_card (Set_intersection s1 s2)))))
  :pattern ((Set_card (Set_difference s1 s2)))
  :qid |$Set[Snap]_prog.cardinality_difference|)))
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
; /field_value_functions_axioms.smt2 [g: Ref]
(assert (forall ((vs $FVF<g>) (ws $FVF<g>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_g vs) ($FVF.domain_g ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_g vs))
            (= ($FVF.lookup_g vs x) ($FVF.lookup_g ws x)))
          :pattern (($FVF.lookup_g vs x) ($FVF.lookup_g ws x))
          :qid |qp.$FVF<g>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<g>To$Snap vs)
              ($SortWrappers.$FVF<g>To$Snap ws)
              )
    :qid |qp.$FVF<g>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_g pm r))
    :pattern (($FVF.perm_g pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
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
; ---------- test05 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const ys@1@01 Set<$Ref>)
(declare-const x1@2@01 $Ref)
(declare-const x2@3@01 $Ref)
(declare-const xs@4@01 Set<$Ref>)
(declare-const ys@5@01 Set<$Ref>)
(declare-const x1@6@01 $Ref)
(declare-const x2@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@8@01 $Ref)
(push) ; 2
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | x@8@01 in xs@4@01 | live]
; [else-branch: 0 | !(x@8@01 in xs@4@01) | live]
(push) ; 4
; [then-branch: 0 | x@8@01 in xs@4@01]
(assert (Set_in x@8@01 xs@4@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(x@8@01 in xs@4@01)]
(assert (not (Set_in x@8@01 xs@4@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@8@01 xs@4@01)) (Set_in x@8@01 xs@4@01)))
(assert (and (not (Set_in x@8@01 ys@5@01)) (Set_in x@8@01 xs@4@01)))
(pop) ; 2
(declare-const $t@9@01 $FVF<f>)
(declare-fun inv@10@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (not (Set_in x@8@01 ys@5@01)) (Set_in x@8@01 xs@4@01))
    (or (not (Set_in x@8@01 xs@4@01)) (Set_in x@8@01 xs@4@01)))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((inv@10@01 x@8@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (not (Set_in x@8@01 ys@5@01)) (Set_in x@8@01 xs@4@01))
    (= (inv@10@01 x@8@01) x@8@01))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((inv@10@01 x@8@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@10@01 r) ys@5@01)) (Set_in (inv@10@01 r) xs@4@01))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (not (Set_in x@8@01 ys@5@01)) (Set_in x@8@01 xs@4@01))
    (not (= x@8@01 $Ref.null)))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((inv@10@01 x@8@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@11@01 Int)
; [exec]
; inhale (x1 in xs)
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] (x1 in xs)
(assert (Set_in x1@6@01 xs@4@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (x2 in xs)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] (x2 in xs)
(assert (Set_in x2@7@01 xs@4@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale !((x1 in ys))
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(assert (not (Set_in x1@6@01 ys@5@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x1 != null
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] x1 != null
(assert (not (= x1@6@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x2 != null
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] x2 != null
(assert (not (= x2@7@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x1.f
(declare-const sm@17@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@10@01 r) ys@5@01)) (Set_in (inv@10@01 r) xs@4@01))
    (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) r) ($FVF.lookup_f $t@9@01 r)))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@9@01 r))
  :qid |qp.fvfValDef0|)))
(declare-const pm@18@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@18@01  $FPM) r)
    (ite
      (and (not (Set_in (inv@10@01 r) ys@5@01)) (Set_in (inv@10@01 r) xs@4@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@18@01  $FPM) r))
  :qid |qp.resPrmSumDef1|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@18@01  $FPM) x1@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@19@01 Int)
(assert (= a@19@01 ($FVF.lookup_f (as sm@17@01  $FVF<f>) x1@6@01)))
; [exec]
; a := x2.f
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@10@01 r) ys@5@01)) (Set_in (inv@10@01 r) xs@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@9@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@9@01 r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@21@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@21@01  $FPM) r)
    (ite
      (and (not (Set_in (inv@10@01 r) ys@5@01)) (Set_in (inv@10@01 r) xs@4@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@21@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@21@01  $FPM) x2@7@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@22@01 Set<$Ref>)
(declare-const y1@23@01 $Ref)
(declare-const xs@24@01 Set<$Ref>)
(declare-const y1@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(declare-const x@27@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@27@01 xs@24@01))
(pop) ; 2
(declare-fun inv@28@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=> (Set_in x@27@01 xs@24@01) (= (inv@28@01 x@27@01) x@27@01))
  :pattern ((Set_in x@27@01 xs@24@01))
  :pattern ((inv@28@01 x@27@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@28@01 r) xs@24@01) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=> (Set_in x@27@01 xs@24@01) (not (= x@27@01 $Ref.null)))
  :pattern ((Set_in x@27@01 xs@24@01))
  :pattern ((inv@28@01 x@27@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(declare-const x@29@01 $Ref)
(push) ; 2
; [eval] (x in xs) && x.f != 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 1 | x@29@01 in xs@24@01 | live]
; [else-branch: 1 | !(x@29@01 in xs@24@01) | live]
(push) ; 4
; [then-branch: 1 | x@29@01 in xs@24@01]
(assert (Set_in x@29@01 xs@24@01))
; [eval] x.f != 0
(declare-const sm@30@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@28@01 r) xs@24@01)
    (=
      ($FVF.lookup_f (as sm@30@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@31@01  $FPM) r)
    (ite (Set_in (inv@28@01 r) xs@24@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_f (as pm@31@01  $FPM) x@29@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(x@29@01 in xs@24@01)]
(assert (not (Set_in x@29@01 xs@24@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@28@01 r) xs@24@01)
    (=
      ($FVF.lookup_f (as sm@30@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@31@01  $FPM) r)
    (ite (Set_in (inv@28@01 r) xs@24@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or (not (Set_in x@29@01 xs@24@01)) (Set_in x@29@01 xs@24@01)))
(assert (and
  (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01) 0))
  (Set_in x@29@01 xs@24@01)))
(pop) ; 2
(declare-fun inv@32@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@28@01 r) xs@24@01)
    (=
      ($FVF.lookup_f (as sm@30@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@31@01  $FPM) r)
    (ite (Set_in (inv@28@01 r) xs@24@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@29@01 $Ref)) (!
  (=>
    (and
      (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01) 0))
      (Set_in x@29@01 xs@24@01))
    (or (not (Set_in x@29@01 xs@24@01)) (Set_in x@29@01 xs@24@01)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01))
  :pattern ((Set_in x@29@01 xs@24@01))
  :pattern ((inv@32@01 x@29@01))
  :qid |g-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@29@01 $Ref)) (!
  (=>
    (and
      (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01) 0))
      (Set_in x@29@01 xs@24@01))
    (= (inv@32@01 x@29@01) x@29@01))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01))
  :pattern ((Set_in x@29@01 xs@24@01))
  :pattern ((inv@32@01 x@29@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) (inv@32@01 r)) 0))
      (Set_in (inv@32@01 r) xs@24@01))
    (= (inv@32@01 r) r))
  :pattern ((inv@32@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@29@01 $Ref)) (!
  (=>
    (and
      (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01) 0))
      (Set_in x@29@01 xs@24@01))
    (not (= x@29@01 $Ref.null)))
  :pattern (($FVF.lookup_f (as sm@30@01  $FVF<f>) x@29@01))
  :pattern ((Set_in x@29@01 xs@24@01))
  :pattern ((inv@32@01 x@29@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@26@01)) $Snap.unit))
; [eval] (y1 in xs)
(assert (Set_in y1@25@01 xs@24@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@33@01 Int)
; [exec]
; var r: Ref
(declare-const r@34@01 $Ref)
; [exec]
; a := y1.f
(declare-const sm@35@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@28@01 r) xs@24@01)
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r)))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@26@01)) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@36@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@36@01  $FPM) r)
    (ite (Set_in (inv@28@01 r) xs@24@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@36@01  $FPM) y1@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@37@01 Int)
(assert (= a@37@01 ($FVF.lookup_f (as sm@35@01  $FVF<f>) y1@25@01)))
; [exec]
; r := y1.g
(declare-const sm@38@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) (inv@32@01 r)) 0))
      (Set_in (inv@32@01 r) xs@24@01))
    (=
      ($FVF.lookup_g (as sm@38@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@26@01))) r)))
  :pattern (($FVF.lookup_g (as sm@38@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@26@01))) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@39@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@39@01  $FPM) r)
    (ite
      (and
        (not (= ($FVF.lookup_f (as sm@30@01  $FVF<f>) (inv@32@01 r)) 0))
        (Set_in (inv@32@01 r) xs@24@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@39@01  $FPM) y1@25@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const x1@40@01 $Ref)
(declare-const x1@41@01 $Ref)
(push) ; 1
(declare-const $t@42@01 $Ref)
(declare-const sm@43@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_g (as sm@43@01  $FVF<g>) x1@41@01) $t@42@01))
(assert (<= $Perm.No (ite (= x1@41@01 x1@41@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x1@41@01 x1@41@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x1@41@01 x1@41@01) (not (= x1@41@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(declare-const x@45@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@45@01 (Set_singleton x1@41@01)))
(pop) ; 3
(declare-fun inv@46@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@45@01 $Ref)) (!
  (=> (Set_in x@45@01 (Set_singleton x1@41@01)) (= (inv@46@01 x@45@01) x@45@01))
  :pattern ((Set_in x@45@01 (Set_singleton x1@41@01)))
  :pattern ((inv@46@01 x@45@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@46@01 r) (Set_singleton x1@41@01)) (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@45@01 $Ref)) (!
  (=> (Set_in x@45@01 (Set_singleton x1@41@01)) (not (= x@45@01 $Ref.null)))
  :pattern ((Set_in x@45@01 (Set_singleton x1@41@01)))
  :pattern ((inv@46@01 x@45@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@47@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@47@01  $FVF<g>) x1@41@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.second $t@44@01))))
(pop) ; 2
(push) ; 2
(declare-const x@48@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@48@01 (Set_singleton x1@41@01)))
(pop) ; 3
(declare-fun inv@49@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@48@01 $Ref) (x2@48@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@48@01 (Set_singleton x1@41@01))
      (Set_in x2@48@01 (Set_singleton x1@41@01))
      (= x1@48@01 x2@48@01))
    (= x1@48@01 x2@48@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@48@01 $Ref)) (!
  (=> (Set_in x@48@01 (Set_singleton x1@41@01)) (= (inv@49@01 x@48@01) x@48@01))
  :pattern ((Set_in x@48@01 (Set_singleton x1@41@01)))
  :pattern ((inv@49@01 x@48@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@49@01 r) (Set_singleton x1@41@01)) (= (inv@49@01 r) r))
  :pattern ((inv@49@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@49@01 r) (Set_singleton x1@41@01))
    ($Perm.min (ite (= r x1@41@01) $Perm.Write $Perm.No) $Perm.Write)
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
  (- (ite (= x1@41@01 x1@41@01) $Perm.Write $Perm.No) (pTaken@50@01 x1@41@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@49@01 r) (Set_singleton x1@41@01))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@41@01)
    (=
      ($FVF.lookup_g (as sm@51@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@43@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@51@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@43@01  $FVF<g>) r))
  :qid |qp.fvfValDef10|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=> (= r x1@41@01) false)
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
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
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=> (= r x1@41@01) false)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test14 ----------
(declare-const x1@52@01 $Ref)
(declare-const x1@53@01 $Ref)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(declare-const sm@55@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@55@01  $FVF<g>) x1@53@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@54@01))))
(assert (<= $Perm.No (ite (= x1@53@01 x1@53@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x1@53@01 x1@53@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x1@53@01 x1@53@01) (not (= x1@53@01 $Ref.null))))
(declare-const sm@56@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@53@01)
    (=
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@55@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@56@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@55@01  $FVF<g>) r))
  :qid |qp.fvfValDef11|)))
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@57@01  $FPM) r)
    (ite (= r x1@53@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@57@01  $FPM) x1@53@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@58@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@58@01  $FVF<f>) ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@54@01))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01)
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01)
      ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01)
    ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
  (not (= ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(declare-const x@60@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@60@01 (Set_singleton x1@53@01)))
(pop) ; 3
(declare-fun inv@61@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@60@01 $Ref)) (!
  (=> (Set_in x@60@01 (Set_singleton x1@53@01)) (= (inv@61@01 x@60@01) x@60@01))
  :pattern ((Set_in x@60@01 (Set_singleton x1@53@01)))
  :pattern ((inv@61@01 x@60@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@61@01 r) (Set_singleton x1@53@01)) (= (inv@61@01 r) r))
  :pattern ((inv@61@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@60@01 $Ref)) (!
  (=> (Set_in x@60@01 (Set_singleton x1@53@01)) (not (= x@60@01 $Ref.null)))
  :pattern ((Set_in x@60@01 (Set_singleton x1@53@01)))
  :pattern ((inv@61@01 x@60@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@62@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@62@01 (Set_singleton x1@53@01)))
(declare-const sm@63@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@61@01 r) (Set_singleton x1@53@01))
    (=
      ($FVF.lookup_g (as sm@63@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@59@01)) r)))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@59@01)) r))
  :qid |qp.fvfValDef13|)))
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@64@01  $FPM) r)
    (ite (Set_in (inv@61@01 r) (Set_singleton x1@53@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@64@01  $FPM) x@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@65@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@61@01 r) (Set_singleton x1@53@01))
    (=
      ($FVF.lookup_g (as sm@63@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@59@01)) r)))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@59@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@64@01  $FPM) r)
    (ite (Set_in (inv@61@01 r) (Set_singleton x1@53@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@62@01 $Ref)) (!
  (=>
    (Set_in x@62@01 (Set_singleton x1@53@01))
    (= (inv@65@01 ($FVF.lookup_g (as sm@63@01  $FVF<g>) x@62@01)) x@62@01))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) x@62@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@65@01 r) (Set_singleton x1@53@01))
    (= ($FVF.lookup_g (as sm@63@01  $FVF<g>) (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@62@01 $Ref)) (!
  (=>
    (Set_in x@62@01 (Set_singleton x1@53@01))
    (not (= ($FVF.lookup_g (as sm@63@01  $FVF<g>) x@62@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) x@62@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@66@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@66@01 (Set_singleton x1@53@01)))
(pop) ; 3
(declare-fun inv@67@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@66@01 $Ref) (x2@66@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@66@01 (Set_singleton x1@53@01))
      (Set_in x2@66@01 (Set_singleton x1@53@01))
      (= x1@66@01 x2@66@01))
    (= x1@66@01 x2@66@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@66@01 $Ref)) (!
  (=> (Set_in x@66@01 (Set_singleton x1@53@01)) (= (inv@67@01 x@66@01) x@66@01))
  :pattern ((Set_in x@66@01 (Set_singleton x1@53@01)))
  :pattern ((inv@67@01 x@66@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@67@01 r) (Set_singleton x1@53@01)) (= (inv@67@01 r) r))
  :pattern ((inv@67@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@67@01 r) (Set_singleton x1@53@01))
    ($Perm.min (ite (= r x1@53@01) $Perm.Write $Perm.No) $Perm.Write)
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
  (- (ite (= x1@53@01 x1@53@01) $Perm.Write $Perm.No) (pTaken@68@01 x1@53@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@67@01 r) (Set_singleton x1@53@01))
    (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@53@01)
    (=
      ($FVF.lookup_g (as sm@69@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@55@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@69@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@55@01  $FVF<g>) r))
  :qid |qp.fvfValDef15|)))
(declare-const x@70@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@70@01 (Set_singleton x1@53@01)))
(push) ; 4
(assert (not (= x@70@01 x1@53@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@71@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@70@01 $Ref) (x2@70@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@70@01 (Set_singleton x1@53@01))
      (Set_in x2@70@01 (Set_singleton x1@53@01))
      (=
        ($FVF.lookup_g (as sm@69@01  $FVF<g>) x1@70@01)
        ($FVF.lookup_g (as sm@69@01  $FVF<g>) x2@70@01)))
    (= x1@70@01 x2@70@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@70@01 $Ref)) (!
  (=>
    (Set_in x@70@01 (Set_singleton x1@53@01))
    (= (inv@71@01 ($FVF.lookup_g (as sm@69@01  $FVF<g>) x@70@01)) x@70@01))
  :pattern (($FVF.lookup_g (as sm@69@01  $FVF<g>) x@70@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@71@01 r) (Set_singleton x1@53@01))
    (= ($FVF.lookup_g (as sm@69@01  $FVF<g>) (inv@71@01 r)) r))
  :pattern ((inv@71@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@71@01 r) (Set_singleton x1@53@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
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
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01)
        ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
      $Perm.Write
      $Perm.No)
    (pTaken@72@01 ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@71@01 r) (Set_singleton x1@53@01))
    (= (- $Perm.Write (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@56@01  $FVF<g>) x1@53@01))
    (=
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@58@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(pop) ; 2
(pop) ; 1
; ---------- test13 ----------
(declare-const x1@74@01 $Ref)
(declare-const x1@75@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (not (= x1@75@01 $Ref.null)))
(declare-const sm@77@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@77@01  $FVF<f>) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@76@01))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01)))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01)))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01)) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@78@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@78@01 (Set_singleton x1@75@01)))
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
; ---------- test10 ----------
(declare-const x1@79@01 $Ref)
(declare-const x2@80@01 $Ref)
(declare-const x1@81@01 $Ref)
(declare-const x2@82@01 $Ref)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(declare-const sm@84@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@84@01  $FVF<g>) x1@81@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@83@01))))
(assert (<= $Perm.No (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x1@81@01 x1@81@01) (not (= x1@81@01 $Ref.null))))
(assert (=
  ($Snap.second $t@83@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@83@01))
    ($Snap.second ($Snap.second $t@83@01)))))
(declare-const sm@85@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@81@01)
    (=
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@85@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@84@01  $FVF<g>) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@86@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@86@01  $FPM) r)
    (ite (= r x1@81@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@86@01  $FPM) x1@81@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@88@01  $FVF<f>) ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@83@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
    $k@87@01
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
    $k@87@01
    $Perm.No)
  $Perm.Write))
(assert (=>
  (ite
    (=
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
      ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
    (< $Perm.No $k@87@01)
    false)
  (not (= ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@83@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@83@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@83@01))))))
(declare-const sm@89@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@89@01  $FVF<g>) x2@82@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@83@01))))))
(assert (<= $Perm.No (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x2@82@01 x2@82@01) (not (= x2@82@01 $Ref.null))))
(declare-const sm@90@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@82@01)
    (=
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@89@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@90@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@89@01  $FVF<g>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@81@01)
    (=
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@90@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@84@01  $FVF<g>) r))
  :qid |qp.fvfValDef20|)))
(declare-const pm@91@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@91@01  $FPM) r)
    (+
      (ite (= r x2@82@01) $Perm.Write $Perm.No)
      (ite (= r x1@81@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@91@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@91@01  $FPM) x2@82@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const $k@92@01 $Perm)
(assert ($Perm.isReadVar $k@92@01))
(declare-const sm@93@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@93@01  $FVF<f>) ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@83@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
    $k@92@01
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
    $k@92@01
    $Perm.No)
  $Perm.Write))
(assert (=>
  (ite
    (=
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
      ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
    (< $Perm.No $k@92@01)
    false)
  (not (= ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(declare-const x@95@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
(declare-const $k@96@01 $Perm)
(assert ($Perm.isReadVar $k@96@01))
(pop) ; 3
(declare-fun inv@97@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@96@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@95@01 $Ref)) (!
  (=>
    (Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (or (= $k@96@01 $Perm.No) (< $Perm.No $k@96@01)))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@95@01 $Ref)) (!
  (=>
    (and
      (Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@96@01))
    (= (inv@97@01 x@95@01) x@95@01))
  :pattern ((Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
  :pattern ((inv@97@01 x@95@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@97@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@96@01))
    (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@95@01 $Ref)) (!
  (<= $Perm.No $k@96@01)
  :pattern ((Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
  :pattern ((inv@97@01 x@95@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@95@01 $Ref)) (!
  (<= $k@96@01 $Perm.Write)
  :pattern ((Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
  :pattern ((inv@97@01 x@95@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@95@01 $Ref)) (!
  (=>
    (and
      (Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@96@01))
    (not (= x@95@01 $Ref.null)))
  :pattern ((Set_in x@95@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
  :pattern ((inv@97@01 x@95@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@98@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@98@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
(declare-const sm@99@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@97@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@96@01)
      false)
    (=
      ($FVF.lookup_g (as sm@99@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@94@01)) r)))
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@94@01)) r))
  :qid |qp.fvfValDef22|)))
(declare-const pm@100@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@100@01  $FPM) r)
    (ite
      (Set_in (inv@97@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      $k@96@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@100@01  $FPM) x@98@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@101@01 $Perm)
(assert ($Perm.isReadVar $k@101@01))
(pop) ; 3
(declare-fun inv@102@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@97@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@96@01)
      false)
    (=
      ($FVF.lookup_g (as sm@99@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@94@01)) r)))
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@94@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@100@01  $FPM) r)
    (ite
      (Set_in (inv@97@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      $k@96@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert ($Perm.isReadVar $k@101@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@98@01 $Ref)) (!
  (=>
    (Set_in x@98@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (or (= $k@101@01 $Perm.No) (< $Perm.No $k@101@01)))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@98@01 $Ref)) (!
  (=>
    (and
      (Set_in x@98@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@101@01))
    (= (inv@102@01 ($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01)) x@98@01))
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@102@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@101@01))
    (= ($FVF.lookup_g (as sm@99@01  $FVF<g>) (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@98@01 $Ref)) (!
  (<= $Perm.No $k@101@01)
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@98@01 $Ref)) (!
  (<= $k@101@01 $Perm.Write)
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@98@01 $Ref)) (!
  (=>
    (and
      (Set_in x@98@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@101@01))
    (not (= ($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@99@01  $FVF<g>) x@98@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@103@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
(declare-const $k@104@01 $Perm)
(assert ($Perm.isReadVar $k@104@01))
(pop) ; 3
(declare-fun inv@105@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@104@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@103@01 $Ref)) (!
  (=>
    (Set_in x@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (or (= $k@104@01 $Perm.No) (< $Perm.No $k@104@01)))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@103@01 $Ref) (x2@103@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@104@01))
      (and
        (Set_in x2@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@104@01))
      (= x1@103@01 x2@103@01))
    (= x1@103@01 x2@103@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@103@01 $Ref)) (!
  (=>
    (and
      (Set_in x@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@104@01))
    (= (inv@105@01 x@103@01) x@103@01))
  :pattern ((Set_in x@103@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
  :pattern ((inv@105@01 x@103@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@105@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
      (< $Perm.No $k@104@01))
    (= (inv@105@01 r) r))
  :pattern ((inv@105@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@105@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    ($Perm.min (ite (= r x2@82@01) $Perm.Write $Perm.No) $k@104@01)
    $Perm.No))
(define-fun pTaken@107@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@105@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    ($Perm.min
      (ite (= r x1@81@01) $Perm.Write $Perm.No)
      (- $k@104@01 (pTaken@106@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@104@01
(assert (=>
  (not (= (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x2@82@01 x2@82@01)
    (<
      (ite
        (Set_in (inv@105@01 x2@82@01) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        $k@104@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (Set_in (inv@105@01 x2@82@01) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        $k@104@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@105@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (= (- $k@104@01 (pTaken@106@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@104@01
(assert (=>
  (not (= (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x1@81@01 x1@81@01)
    (<
      (ite
        (Set_in (inv@105@01 x1@81@01) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        $k@104@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (Set_in (inv@105@01 x1@81@01) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        $k@104@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@105@01 r) (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (= (- (- $k@104@01 (pTaken@106@01 r)) (pTaken@107@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@108@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@82@01)
    (=
      ($FVF.lookup_g (as sm@108@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@89@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@108@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@89@01  $FVF<g>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@81@01)
    (=
      ($FVF.lookup_g (as sm@108@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@108@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@84@01  $FVF<g>) r))
  :qid |qp.fvfValDef27|)))
(declare-const x@109@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@109@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
(declare-const $k@110@01 $Perm)
(assert ($Perm.isReadVar $k@110@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@109@01 x2@82@01) $Perm.Write $Perm.No)
    (ite (= x@109@01 x1@81@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@111@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@110@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@109@01 $Ref)) (!
  (=>
    (Set_in x@109@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (or (= $k@110@01 $Perm.No) (< $Perm.No $k@110@01)))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@109@01 $Ref) (x2@109@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@109@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@110@01))
      (and
        (Set_in x2@109@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@110@01))
      (=
        ($FVF.lookup_g (as sm@108@01  $FVF<g>) x1@109@01)
        ($FVF.lookup_g (as sm@108@01  $FVF<g>) x2@109@01)))
    (= x1@109@01 x2@109@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (- (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No) (pTaken@107@01 x1@81@01))
    (- (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No) (pTaken@106@01 x2@82@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (- (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No) (pTaken@106@01 x2@82@01))
    (- (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No) (pTaken@107@01 x1@81@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      $k@87@01
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      $k@92@01
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      $k@92@01
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      $k@87@01
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No)
        (pTaken@107@01 x1@81@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No)
        (pTaken@106@01 x2@82@01))))
  (not
    (=
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) x1@81@01)
      ($FVF.lookup_g (as sm@89@01  $FVF<g>) x2@82@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@82@01 x2@82@01) $Perm.Write $Perm.No)
        (pTaken@106@01 x2@82@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@81@01 x1@81@01) $Perm.Write $Perm.No)
        (pTaken@107@01 x1@81@01))))
  (not
    (=
      ($FVF.lookup_g (as sm@89@01  $FVF<g>) x2@82@01)
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) x1@81@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      (< $Perm.No $k@87@01)
      false)
    (ite
      (=
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      (< $Perm.No $k@92@01)
      false))
  (not
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      ($FVF.lookup_f (as sm@93@01  $FVF<f>) ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01)
        ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      (< $Perm.No $k@92@01)
      false)
    (ite
      (=
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)
        ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      (< $Perm.No $k@87@01)
      false))
  (not
    (=
      ($FVF.lookup_f (as sm@93@01  $FVF<f>) ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@112@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
      (< $Perm.No $k@87@01)
      false)
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
      (< $Perm.No $k@92@01)
      false)
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@93@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@93@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(declare-const pm@113@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (= r ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
        $k@87@01
        $Perm.No)
      (ite
        (= r ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
        $k@92@01
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (<=
  ($FVF.perm_f (as pm@113@01  $FPM) ($FVF.lookup_g (as sm@85@01  $FVF<g>) x1@81@01))
  $Perm.Write))
(assert (<=
  ($FVF.perm_f (as pm@113@01  $FPM) ($FVF.lookup_g (as sm@90@01  $FVF<g>) x2@82@01))
  $Perm.Write))
(declare-const sm@114@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (< $Perm.No (- (ite (= r x1@81@01) $Perm.Write $Perm.No) (pTaken@107@01 r)))
    (=
      ($FVF.lookup_g (as sm@114@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@84@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@114@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@84@01  $FVF<g>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (< $Perm.No (- (ite (= r x2@82@01) $Perm.Write $Perm.No) (pTaken@106@01 r)))
    (=
      ($FVF.lookup_g (as sm@114@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@89@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@114@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@89@01  $FVF<g>) r))
  :qid |qp.fvfValDef32|)))
(declare-const pm@115@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@115@01  $FPM) r)
    (+
      (- (ite (= r x1@81@01) $Perm.Write $Perm.No) (pTaken@107@01 r))
      (- (ite (= r x2@82@01) $Perm.Write $Perm.No) (pTaken@106@01 r))))
  :pattern (($FVF.perm_g (as pm@115@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (<= ($FVF.perm_g (as pm@115@01  $FPM) x1@81@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@115@01  $FPM) x2@82@01) $Perm.Write))
(declare-const x@116@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@116@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01)))
(declare-const $k@117@01 $Perm)
(assert ($Perm.isReadVar $k@117@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@116@01 x2@82@01) $Perm.Write $Perm.No)
    (ite (= x@116@01 x1@81@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@118@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@117@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@116@01 $Ref)) (!
  (=>
    (Set_in x@116@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
    (or (= $k@117@01 $Perm.No) (< $Perm.No $k@117@01)))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@116@01 $Ref) (x2@116@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@116@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@117@01))
      (and
        (Set_in x2@116@01 (Set_unionone (Set_singleton x1@81@01) x2@82@01))
        (< $Perm.No $k@117@01))
      (=
        ($FVF.lookup_g (as sm@108@01  $FVF<g>) x1@116@01)
        ($FVF.lookup_g (as sm@108@01  $FVF<g>) x2@116@01)))
    (= x1@116@01 x2@116@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test15 ----------
(declare-const x1@119@01 $Ref)
(declare-const x2@120@01 $Ref)
(declare-const x1@121@01 $Ref)
(declare-const x2@122@01 $Ref)
(push) ; 1
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 ($Snap.combine ($Snap.first $t@123@01) ($Snap.second $t@123@01))))
(declare-const sm@124@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@124@01  $FVF<g>) x1@121@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@123@01))))
(assert (<= $Perm.No (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x1@121@01 x1@121@01) (not (= x1@121@01 $Ref.null))))
(assert (=
  ($Snap.second $t@123@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@123@01))
    ($Snap.second ($Snap.second $t@123@01)))))
(declare-const sm@125@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@121@01)
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@125@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@126@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@126@01  $FPM) r)
    (ite (= r x1@121@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@126@01  $FPM) x1@121@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@127@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@127@01  $FVF<f>) ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@123@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
    ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
  (not (= ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@123@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@123@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))
(declare-const sm@128@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@128@01  $FVF<g>) x2@122@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@123@01))))))
(assert (<= $Perm.No (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x2@122@01 x2@122@01) (not (= x2@122@01 $Ref.null))))
(declare-const sm@129@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@122@01)
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@129@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@128@01  $FVF<g>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@121@01)
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@129@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :qid |qp.fvfValDef37|)))
(declare-const pm@130@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@130@01  $FPM) r)
    (+
      (ite (= r x2@122@01) $Perm.Write $Perm.No)
      (ite (= r x1@121@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@130@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@130@01  $FPM) x2@122@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@131@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@131@01  $FVF<f>) ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
    ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
  (not (= ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@132@01 $Snap)
(assert (= $t@132@01 ($Snap.combine ($Snap.first $t@132@01) ($Snap.second $t@132@01))))
(declare-const x@133@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
(declare-const $k@134@01 $Perm)
(assert ($Perm.isReadVar $k@134@01))
(pop) ; 3
(declare-fun inv@135@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@134@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@133@01 $Ref)) (!
  (=>
    (Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (or (= $k@134@01 $Perm.No) (< $Perm.No $k@134@01)))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (and
      (Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01))
    (= (inv@135@01 x@133@01) x@133@01))
  :pattern ((Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
  :pattern ((inv@135@01 x@133@01))
  :qid |quant-u-45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01))
    (= (inv@135@01 r) r))
  :pattern ((inv@135@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@133@01 $Ref)) (!
  (<= $Perm.No $k@134@01)
  :pattern ((Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
  :pattern ((inv@135@01 x@133@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@133@01 $Ref)) (!
  (<= $k@134@01 $Perm.Write)
  :pattern ((Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
  :pattern ((inv@135@01 x@133@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (and
      (Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01))
    (not (= x@133@01 $Ref.null)))
  :pattern ((Set_in x@133@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
  :pattern ((inv@135@01 x@133@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@132@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@132@01))
    ($Snap.second ($Snap.second $t@132@01)))))
(assert (= ($Snap.first ($Snap.second $t@132@01)) $Snap.unit))
; [eval] x1.g != x2.g
(declare-const sm@136@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01)
      false)
    (=
      ($FVF.lookup_g (as sm@136@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r)))
  :pattern (($FVF.lookup_g (as sm@136@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r))
  :qid |qp.fvfValDef39|)))
(declare-const pm@137@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@137@01  $FPM) r)
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      $k@134@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@137@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@137@01  $FPM) x1@121@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@138@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01)
      false)
    (=
      ($FVF.lookup_g (as sm@138@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r)))
  :pattern (($FVF.lookup_g (as sm@138@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r))
  :qid |qp.fvfValDef41|)))
(declare-const pm@139@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@139@01  $FPM) r)
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      $k@134@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@139@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@139@01  $FPM) x2@122@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@136@01  $FVF<g>) x1@121@01)
    ($FVF.lookup_g (as sm@138@01  $FVF<g>) x2@122@01))))
(declare-const x@140@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@140@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
(declare-const sm@141@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01)
      false)
    (=
      ($FVF.lookup_g (as sm@141@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r)))
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r))
  :qid |qp.fvfValDef43|)))
(declare-const pm@142@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@142@01  $FPM) r)
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      $k@134@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@142@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@142@01  $FPM) x@140@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@143@01 $Perm)
(assert ($Perm.isReadVar $k@143@01))
(pop) ; 3
(declare-fun inv@144@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@134@01)
      false)
    (=
      ($FVF.lookup_g (as sm@141@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r)))
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@132@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@142@01  $FPM) r)
    (ite
      (Set_in (inv@135@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      $k@134@01
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@142@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
(assert ($Perm.isReadVar $k@143@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@140@01 $Ref)) (!
  (=>
    (Set_in x@140@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (or (= $k@143@01 $Perm.No) (< $Perm.No $k@143@01)))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@140@01 $Ref)) (!
  (=>
    (and
      (Set_in x@140@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@143@01))
    (= (inv@144@01 ($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01)) x@140@01))
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01))
  :qid |quant-u-47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@144@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@143@01))
    (= ($FVF.lookup_g (as sm@141@01  $FVF<g>) (inv@144@01 r)) r))
  :pattern ((inv@144@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@140@01 $Ref)) (!
  (<= $Perm.No $k@143@01)
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@140@01 $Ref)) (!
  (<= $k@143@01 $Perm.Write)
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@140@01 $Ref)) (!
  (=>
    (and
      (Set_in x@140@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@143@01))
    (not (= ($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@141@01  $FVF<g>) x@140@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@145@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
(declare-const $k@146@01 $Perm)
(assert ($Perm.isReadVar $k@146@01))
(pop) ; 3
(declare-fun inv@147@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@146@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@145@01 $Ref)) (!
  (=>
    (Set_in x@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (or (= $k@146@01 $Perm.No) (< $Perm.No $k@146@01)))
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@145@01 $Ref) (x2@145@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        (< $Perm.No $k@146@01))
      (and
        (Set_in x2@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        (< $Perm.No $k@146@01))
      (= x1@145@01 x2@145@01))
    (= x1@145@01 x2@145@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@145@01 $Ref)) (!
  (=>
    (and
      (Set_in x@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@146@01))
    (= (inv@147@01 x@145@01) x@145@01))
  :pattern ((Set_in x@145@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
  :pattern ((inv@147@01 x@145@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@147@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@146@01))
    (= (inv@147@01 r) r))
  :pattern ((inv@147@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@148@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@147@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    ($Perm.min (ite (= r x2@122@01) $Perm.Write $Perm.No) $k@146@01)
    $Perm.No))
(define-fun pTaken@149@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@147@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    ($Perm.min
      (ite (= r x1@121@01) $Perm.Write $Perm.No)
      (- $k@146@01 (pTaken@148@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@146@01
(assert (=>
  (not (= (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x2@122@01 x2@122@01)
    (<
      (ite
        (Set_in (inv@147@01 x2@122@01) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@146@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (Set_in (inv@147@01 x2@122@01) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@146@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (= (- $k@146@01 (pTaken@148@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@146@01
(assert (=>
  (not (= (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x1@121@01 x1@121@01)
    (<
      (ite
        (Set_in (inv@147@01 x1@121@01) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@146@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (Set_in (inv@147@01 x1@121@01) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@146@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (= (- (- $k@146@01 (pTaken@148@01 r)) (pTaken@149@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@122@01)
    (=
      ($FVF.lookup_g (as sm@150@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@150@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@128@01  $FVF<g>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@121@01)
    (=
      ($FVF.lookup_g (as sm@150@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@150@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :qid |qp.fvfValDef48|)))
; [eval] x1.g != x2.g
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite (= x1@121@01 x2@122@01) $Perm.Write $Perm.No)
    (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No)
    (ite (= x2@122@01 x1@121@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@150@01  $FVF<g>) x1@121@01)
    ($FVF.lookup_g (as sm@150@01  $FVF<g>) x2@122@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No)
    (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= x1@121@01 x1@121@01) $Perm.Write $Perm.No)
    (ite (= x2@122@01 x2@122@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (= x2@122@01 x2@122@01) (= x1@121@01 x1@121@01))
  (not
    (=
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) x1@121@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and (= x1@121@01 x1@121@01) (= x2@122@01 x2@122@01))
  (not
    (=
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) x2@122@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
      ($FVF.lookup_f (as sm@127@01  $FVF<f>) ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@127@01  $FVF<f>) ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x2@122@01 x1@121@01)) (not (= x1@121@01 x2@122@01)))
  (and
    (not
      (=
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)))
    (not
      (=
        ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
        ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))))))
(declare-const sm@151@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (=
      ($FVF.lookup_f (as sm@151@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@151@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (=
      ($FVF.lookup_f (as sm@151@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@127@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@151@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@127@01  $FVF<f>) r))
  :qid |qp.fvfValDef50|)))
(declare-const pm@152@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@152@01  $FPM) r)
    (+
      (ite
        (= r ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (ite
        (= r ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@152@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (<=
  ($FVF.perm_f (as pm@152@01  $FPM) ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
  $Perm.Write))
(assert (<=
  ($FVF.perm_f (as pm@152@01  $FPM) ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
  $Perm.Write))
; Definitional axioms for snapshot map values
(declare-const pm@153@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@153@01  $FPM) r)
    (+
      (ite (= r x2@122@01) $Perm.Write $Perm.No)
      (ite (= r x1@121@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef52|)))
(assert (<= ($FVF.perm_g (as pm@153@01  $FPM) x2@122@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@153@01  $FPM) x1@121@01) $Perm.Write))
; [eval] x1.g != x2.g
(declare-const sm@154@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@121@01)
    (=
      ($FVF.lookup_g (as sm@154@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@154@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@122@01)
    (=
      ($FVF.lookup_g (as sm@154@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@154@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@128@01  $FVF<g>) r))
  :qid |qp.fvfValDef54|)))
(declare-const pm@155@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@155@01  $FPM) r)
    (+
      (ite (= r x1@121@01) $Perm.Write $Perm.No)
      (ite (= r x2@122@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@155@01  $FPM) r))
  :qid |qp.resPrmSumDef55|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@155@01  $FPM) x1@121@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@156@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@121@01)
    (=
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@122@01)
    (=
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@128@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@128@01  $FVF<g>) r))
  :qid |qp.fvfValDef57|)))
(declare-const pm@157@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@157@01  $FPM) r)
    (+
      (ite (= r x1@121@01) $Perm.Write $Perm.No)
      (ite (= r x2@122@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@157@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@157@01  $FPM) x2@122@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@154@01  $FVF<g>) x1@121@01)
    ($FVF.lookup_g (as sm@156@01  $FVF<g>) x2@122@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@154@01  $FVF<g>) x1@121@01)
    ($FVF.lookup_g (as sm@156@01  $FVF<g>) x2@122@01))))
(declare-const x@158@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@158@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01)))
(declare-const $k@159@01 $Perm)
(assert ($Perm.isReadVar $k@159@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@158@01 x2@122@01) $Perm.Write $Perm.No)
    (ite (= x@158@01 x1@121@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@160@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@159@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@158@01 $Ref)) (!
  (=>
    (Set_in x@158@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (or (= $k@159@01 $Perm.No) (< $Perm.No $k@159@01)))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@158@01 $Ref) (x2@158@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@158@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        (< $Perm.No $k@159@01))
      (and
        (Set_in x2@158@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        (< $Perm.No $k@159@01))
      (=
        ($FVF.lookup_g (as sm@150@01  $FVF<g>) x1@158@01)
        ($FVF.lookup_g (as sm@150@01  $FVF<g>) x2@158@01)))
    (= x1@158@01 x2@158@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@158@01 $Ref)) (!
  (=>
    (and
      (Set_in x@158@01 (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@159@01))
    (= (inv@160@01 ($FVF.lookup_g (as sm@150@01  $FVF<g>) x@158@01)) x@158@01))
  :pattern (($FVF.lookup_g (as sm@150@01  $FVF<g>) x@158@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@160@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
      (< $Perm.No $k@159@01))
    (= ($FVF.lookup_g (as sm@150@01  $FVF<g>) (inv@160@01 r)) r))
  :pattern ((inv@160@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@160@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $k@159@01)
    $Perm.No))
(define-fun pTaken@162@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@160@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (- $k@159@01 (pTaken@161@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@159@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
          ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)
      ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (<
      (ite
        (Set_in (inv@160@01 ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@159@01
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    (<
      (ite
        (Set_in (inv@160@01 ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01)) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@159@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@160@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (= (- $k@159@01 (pTaken@161@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@159@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
          ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)
      ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (<
      (ite
        (Set_in (inv@160@01 ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@159@01
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    (<
      (ite
        (Set_in (inv@160@01 ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01)) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
        $k@159@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@160@01 r) (Set_unionone (Set_singleton x1@121@01) x2@122@01))
    (= (- (- $k@159@01 (pTaken@161@01 r)) (pTaken@162@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@163@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@125@01  $FVF<g>) x1@121@01))
    (=
      ($FVF.lookup_f (as sm@163@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@127@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@127@01  $FVF<f>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@129@01  $FVF<g>) x2@122@01))
    (=
      ($FVF.lookup_f (as sm@163@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@131@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@163@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :qid |qp.fvfValDef62|)))
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const x1@164@01 $Ref)
(declare-const x2@165@01 $Ref)
(declare-const x3@166@01 $Ref)
(declare-const x4@167@01 $Ref)
(declare-const x5@168@01 $Ref)
(declare-const x6@169@01 $Ref)
(declare-const x1@170@01 $Ref)
(declare-const x2@171@01 $Ref)
(declare-const x3@172@01 $Ref)
(declare-const x4@173@01 $Ref)
(declare-const x5@174@01 $Ref)
(declare-const x6@175@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@176@01 $Snap)
(assert (= $t@176@01 ($Snap.combine ($Snap.first $t@176@01) ($Snap.second $t@176@01))))
(declare-const sm@177@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@177@01  $FVF<g>) x1@170@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@176@01))))
(assert (<= $Perm.No (ite (= x1@170@01 x1@170@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x1@170@01 x1@170@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x1@170@01 x1@170@01) (not (= x1@170@01 $Ref.null))))
(assert (=
  ($Snap.second $t@176@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@176@01))
    ($Snap.second ($Snap.second $t@176@01)))))
(declare-const sm@178@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@178@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef63|)))
(declare-const pm@179@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@179@01  $FPM) r)
    (ite (= r x1@170@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@179@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@179@01  $FPM) x1@170@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@180@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@176@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
  (not (= ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@176@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@176@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
(declare-const sm@181@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@181@01  $FVF<g>) x2@171@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@176@01))))))
(assert (<= $Perm.No (ite (= x2@171@01 x2@171@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x2@171@01 x2@171@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x2@171@01 x2@171@01) (not (= x2@171@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@176@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@176@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
(declare-const sm@182@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@182@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@182@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef66|)))
(declare-const pm@183@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@183@01  $FPM) r)
    (+
      (ite (= r x2@171@01) $Perm.Write $Perm.No)
      (ite (= r x1@170@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@183@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@183@01  $FPM) x2@171@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@184@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
  (not (= ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
(declare-const sm@185@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@185@01  $FVF<g>) x3@172@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
(assert (<= $Perm.No (ite (= x3@172@01 x3@172@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x3@172@01 x3@172@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x3@172@01 x3@172@01) (not (= x3@172@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
(declare-const sm@186@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@186@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@186@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@186@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef70|)))
(declare-const pm@187@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@187@01  $FPM) r)
    (+
      (+
        (ite (= r x3@172@01) $Perm.Write $Perm.No)
        (ite (= r x2@171@01) $Perm.Write $Perm.No))
      (ite (= r x1@170@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@187@01  $FPM) r))
  :qid |qp.resPrmSumDef71|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@187@01  $FPM) x3@172@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@188@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (not (= ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
(declare-const sm@189@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@189@01  $FVF<g>) x4@173@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
(assert (<= $Perm.No (ite (= x4@173@01 x4@173@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x4@173@01 x4@173@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x4@173@01 x4@173@01) (not (= x4@173@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))
(declare-const sm@190@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@190@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef75|)))
(declare-const pm@191@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@191@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r x4@173@01) $Perm.Write $Perm.No)
          (ite (= r x3@172@01) $Perm.Write $Perm.No))
        (ite (= r x2@171@01) $Perm.Write $Perm.No))
      (ite (= r x1@170@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@191@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@191@01  $FPM) x4@173@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@192@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (not (= ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))
(declare-const sm@193@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@193@01  $FVF<g>) x5@174@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))
(assert (<= $Perm.No (ite (= x5@174@01 x5@174@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x5@174@01 x5@174@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x5@174@01 x5@174@01) (not (= x5@174@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))))
(declare-const sm@194@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@194@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@194@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@194@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@194@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@194@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef81|)))
(declare-const pm@195@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@195@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x5@174@01) $Perm.Write $Perm.No)
            (ite (= r x4@173@01) $Perm.Write $Perm.No))
          (ite (= r x3@172@01) $Perm.Write $Perm.No))
        (ite (= r x2@171@01) $Perm.Write $Perm.No))
      (ite (= r x1@170@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@195@01  $FPM) r))
  :qid |qp.resPrmSumDef82|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@195@01  $FPM) x5@174@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@196@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  (not (= ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))))
(declare-const sm@197@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@197@01  $FVF<g>) x6@175@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))))
(assert (<= $Perm.No (ite (= x6@175@01 x6@175@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= x6@175@01 x6@175@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= x6@175@01 x6@175@01) (not (= x6@175@01 $Ref.null))))
(declare-const sm@198@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x6@175@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@197@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@197@01  $FVF<g>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@198@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef88|)))
(declare-const pm@199@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@199@01  $FPM) r)
    (+
      (+
        (+
          (+
            (+
              (ite (= r x6@175@01) $Perm.Write $Perm.No)
              (ite (= r x5@174@01) $Perm.Write $Perm.No))
            (ite (= r x4@173@01) $Perm.Write $Perm.No))
          (ite (= r x3@172@01) $Perm.Write $Perm.No))
        (ite (= r x2@171@01) $Perm.Write $Perm.No))
      (ite (= r x1@170@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@199@01  $FPM) r))
  :qid |qp.resPrmSumDef89|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@199@01  $FPM) x6@175@01))))
(check-sat)
; unsat
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(declare-const sm@200@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@176@01))))))))))))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
  (not (= ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; test10(x1, x6)
; Precomputing data for removing quantified permissions
(define-fun pTaken@201@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min (ite (= r x1@170@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@202@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min
      (ite (= r x6@175@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@201@01 r)))
    $Perm.No))
(define-fun pTaken@203@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min
      (ite (= r x5@174@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@201@01 r)) (pTaken@202@01 r)))
    $Perm.No))
(define-fun pTaken@204@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min
      (ite (= r x4@173@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@201@01 r)) (pTaken@202@01 r))
        (pTaken@203@01 r)))
    $Perm.No))
(define-fun pTaken@205@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min
      (ite (= r x3@172@01) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@201@01 r)) (pTaken@202@01 r))
          (pTaken@203@01 r))
        (pTaken@204@01 r)))
    $Perm.No))
(define-fun pTaken@206@01 ((r $Ref)) $Perm
  (ite
    (= r x1@170@01)
    ($Perm.min
      (ite (= r x2@171@01) $Perm.Write $Perm.No)
      (-
        (-
          (-
            (- (- $Perm.Write (pTaken@201@01 r)) (pTaken@202@01 r))
            (pTaken@203@01 r))
          (pTaken@204@01 r))
        (pTaken@205@01 r)))
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
    (ite (= x1@170@01 x1@170@01) $Perm.Write $Perm.No)
    (pTaken@201@01 x1@170@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x1@170@01) (= (- $Perm.Write (pTaken@201@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@207@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= x1@170@01 x6@175@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@197@01  $FVF<g>) x1@170@01))))
(assert (=>
  (= x1@170@01 x5@174@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@193@01  $FVF<g>) x1@170@01))))
(assert (=>
  (= x1@170@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x1@170@01))))
(assert (=>
  (= x1@170@01 x3@172@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@185@01  $FVF<g>) x1@170@01))))
(assert (=>
  (= x1@170@01 x2@171@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@181@01  $FVF<g>) x1@170@01))))
(assert (=>
  (= x1@170@01 x1@170@01)
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@177@01  $FVF<g>) x1@170@01))))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x6@175@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@197@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@197@01  $FVF<g>) r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@170@01)
    (=
      ($FVF.lookup_g (as sm@207@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@177@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@207@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@177@01  $FVF<g>) r))
  :qid |qp.fvfValDef95|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (+
            (ite (= x1@170@01 x6@175@01) $Perm.Write $Perm.No)
            (ite (= x1@170@01 x5@174@01) $Perm.Write $Perm.No))
          (ite (= x1@170@01 x4@173@01) $Perm.Write $Perm.No))
        (ite (= x1@170@01 x3@172@01) $Perm.Write $Perm.No))
      (ite (= x1@170@01 x2@171@01) $Perm.Write $Perm.No))
    (ite (= x1@170@01 x1@170@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@208@01 $Perm)
(assert ($Perm.isReadVar $k@208@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      $k@208@01)
    $Perm.No))
(define-fun pTaken@210@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      (- $k@208@01 (pTaken@209@01 r)))
    $Perm.No))
(define-fun pTaken@211@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      (- (- $k@208@01 (pTaken@209@01 r)) (pTaken@210@01 r)))
    $Perm.No))
(define-fun pTaken@212@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      (- (- (- $k@208@01 (pTaken@209@01 r)) (pTaken@210@01 r)) (pTaken@211@01 r)))
    $Perm.No))
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@208@01 (pTaken@209@01 r)) (pTaken@210@01 r))
          (pTaken@211@01 r))
        (pTaken@212@01 r)))
    $Perm.No))
(define-fun pTaken@214@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@208@01 (pTaken@209@01 r)) (pTaken@210@01 r))
            (pTaken@211@01 r))
          (pTaken@212@01 r))
        (pTaken@213@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@208@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
      ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
          ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
        $k@208@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
          ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
        $k@208@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    (= (- $k@208@01 (pTaken@209@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@215@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)
    ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
  (=
    ($FVF.lookup_f (as sm@215@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x1@170@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref)) $Perm
  (ite
    (= r x6@175@01)
    ($Perm.min (ite (= r x6@175@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@217@01 ((r $Ref)) $Perm
  (ite
    (= r x6@175@01)
    ($Perm.min
      (ite (= r x5@174@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@216@01 r)))
    $Perm.No))
(define-fun pTaken@218@01 ((r $Ref)) $Perm
  (ite
    (= r x6@175@01)
    ($Perm.min
      (ite (= r x4@173@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r)))
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (= r x6@175@01)
    ($Perm.min
      (ite (= r x3@172@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r))
        (pTaken@218@01 r)))
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (= r x6@175@01)
    ($Perm.min
      (ite (= r x2@171@01) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r))
          (pTaken@218@01 r))
        (pTaken@219@01 r)))
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
    (ite (= x6@175@01 x6@175@01) $Perm.Write $Perm.No)
    (pTaken@216@01 x6@175@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x6@175@01) (= (- $Perm.Write (pTaken@216@01 r)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@221@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= x6@175@01 x6@175@01)
  (=
    ($FVF.lookup_g (as sm@221@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@197@01  $FVF<g>) x6@175@01))))
(assert (=>
  (= x6@175@01 x5@174@01)
  (=
    ($FVF.lookup_g (as sm@221@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@193@01  $FVF<g>) x6@175@01))))
(assert (=>
  (= x6@175@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@221@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x6@175@01))))
(assert (=>
  (= x6@175@01 x3@172@01)
  (=
    ($FVF.lookup_g (as sm@221@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@185@01  $FVF<g>) x6@175@01))))
(assert (=>
  (= x6@175@01 x2@171@01)
  (=
    ($FVF.lookup_g (as sm@221@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@181@01  $FVF<g>) x6@175@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (+
            (ite (= x6@175@01 x6@175@01) $Perm.Write $Perm.No)
            (ite (= x6@175@01 x5@174@01) $Perm.Write $Perm.No))
          (ite (= x6@175@01 x4@173@01) $Perm.Write $Perm.No))
        (ite (= x6@175@01 x3@172@01) $Perm.Write $Perm.No))
      (ite (= x6@175@01 x2@171@01) $Perm.Write $Perm.No))
    (ite (= x6@175@01 x1@170@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@222@01 $Perm)
(assert ($Perm.isReadVar $k@222@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
  ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@223@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      $k@222@01)
    $Perm.No))
(define-fun pTaken@224@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
          $Perm.Write
          $Perm.No)
        (pTaken@209@01 r))
      (- $k@222@01 (pTaken@223@01 r)))
    $Perm.No))
(define-fun pTaken@225@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      (- (- $k@222@01 (pTaken@223@01 r)) (pTaken@224@01 r)))
    $Perm.No))
(define-fun pTaken@226@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      (- (- (- $k@222@01 (pTaken@223@01 r)) (pTaken@224@01 r)) (pTaken@225@01 r)))
    $Perm.No))
(define-fun pTaken@227@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@222@01 (pTaken@223@01 r)) (pTaken@224@01 r))
          (pTaken@225@01 r))
        (pTaken@226@01 r)))
    $Perm.No))
(define-fun pTaken@228@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@222@01 (pTaken@223@01 r)) (pTaken@224@01 r))
            (pTaken@225@01 r))
          (pTaken@226@01 r))
        (pTaken@227@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@222@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
      ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
          ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
        $k@222@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
          ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
        $k@222@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    (= (- $k@222@01 (pTaken@223@01 r)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@229@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)
    ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
  (=
    ($FVF.lookup_f (as sm@229@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@207@01  $FVF<g>) x6@175@01)))))
(declare-const $t@230@01 $Snap)
(assert (= $t@230@01 ($Snap.combine ($Snap.first $t@230@01) ($Snap.second $t@230@01))))
(declare-const x@231@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
(declare-const $k@232@01 $Perm)
(assert ($Perm.isReadVar $k@232@01))
(pop) ; 3
(declare-fun inv@233@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@232@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@231@01 $Ref)) (!
  (=>
    (Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (or (= $k@232@01 $Perm.No) (< $Perm.No $k@232@01)))
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@231@01 $Ref)) (!
  (=>
    (and
      (Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01))
    (= (inv@233@01 x@231@01) x@231@01))
  :pattern ((Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
  :pattern ((inv@233@01 x@231@01))
  :qid |quant-u-73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01))
    (= (inv@233@01 r) r))
  :pattern ((inv@233@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@231@01 $Ref)) (!
  (<= $Perm.No $k@232@01)
  :pattern ((Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
  :pattern ((inv@233@01 x@231@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@231@01 $Ref)) (!
  (<= $k@232@01 $Perm.Write)
  :pattern ((Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
  :pattern ((inv@233@01 x@231@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@231@01 $Ref)) (!
  (=>
    (and
      (Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01))
    (not (= x@231@01 $Ref.null)))
  :pattern ((Set_in x@231@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
  :pattern ((inv@233@01 x@231@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@234@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@234@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01)))
(declare-const sm@235@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef119|)))
(declare-const pm@236@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@236@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
              $k@232@01
              $Perm.No)
            (ite (= r x5@174@01) $Perm.Write $Perm.No))
          (ite (= r x4@173@01) $Perm.Write $Perm.No))
        (ite (= r x3@172@01) $Perm.Write $Perm.No))
      (ite (= r x2@171@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@236@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@236@01  $FPM) x@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(declare-const $k@237@01 $Perm)
(assert ($Perm.isReadVar $k@237@01))
(pop) ; 3
(declare-fun inv@238@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@235@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@236@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite
              (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
              $k@232@01
              $Perm.No)
            (ite (= r x5@174@01) $Perm.Write $Perm.No))
          (ite (= r x4@173@01) $Perm.Write $Perm.No))
        (ite (= r x3@172@01) $Perm.Write $Perm.No))
      (ite (= r x2@171@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@236@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(assert ($Perm.isReadVar $k@237@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@234@01 $Ref)) (!
  (=>
    (Set_in x@234@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (or (= $k@237@01 $Perm.No) (< $Perm.No $k@237@01)))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@234@01 $Ref)) (!
  (=>
    (and
      (Set_in x@234@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@237@01))
    (= (inv@238@01 ($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01)) x@234@01))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@238@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@237@01))
    (= ($FVF.lookup_g (as sm@235@01  $FVF<g>) (inv@238@01 r)) r))
  :pattern ((inv@238@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@234@01 $Ref)) (!
  (<= $Perm.No $k@237@01)
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@234@01 $Ref)) (!
  (<= $k@237@01 $Perm.Write)
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@234@01 $Ref)) (!
  (=>
    (and
      (Set_in x@234@01 (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@237@01))
    (not (= ($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@235@01  $FVF<g>) x@234@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; test10(x2, x5)
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((r $Ref)) $Perm
  (ite
    (= r x2@171@01)
    ($Perm.min (ite (= r x2@171@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@240@01 ((r $Ref)) $Perm
  (ite
    (= r x2@171@01)
    ($Perm.min
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)
      (- $Perm.Write (pTaken@239@01 r)))
    $Perm.No))
(define-fun pTaken@241@01 ((r $Ref)) $Perm
  (ite
    (= r x2@171@01)
    ($Perm.min
      (ite (= r x5@174@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@239@01 r)) (pTaken@240@01 r)))
    $Perm.No))
(define-fun pTaken@242@01 ((r $Ref)) $Perm
  (ite
    (= r x2@171@01)
    ($Perm.min
      (ite (= r x4@173@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@239@01 r)) (pTaken@240@01 r))
        (pTaken@241@01 r)))
    $Perm.No))
(define-fun pTaken@243@01 ((r $Ref)) $Perm
  (ite
    (= r x2@171@01)
    ($Perm.min
      (ite (= r x3@172@01) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@239@01 r)) (pTaken@240@01 r))
          (pTaken@241@01 r))
        (pTaken@242@01 r)))
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
    (ite (= x2@171@01 x2@171@01) $Perm.Write $Perm.No)
    (pTaken@239@01 x2@171@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x2@171@01) (= (- $Perm.Write (pTaken@239@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@244@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (Set_in (inv@233@01 x2@171@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@232@01)
    false)
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) x2@171@01))))
(assert (=>
  (= x2@171@01 x5@174@01)
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@193@01  $FVF<g>) x2@171@01))))
(assert (=>
  (= x2@171@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x2@171@01))))
(assert (=>
  (= x2@171@01 x3@172@01)
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@185@01  $FVF<g>) x2@171@01))))
(assert (=>
  (= x2@171@01 x2@171@01)
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@181@01  $FVF<g>) x2@171@01))))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@244@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@244@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@174@01)
    (=
      ($FVF.lookup_g (as sm@244@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@193@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@244@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@193@01  $FVF<g>) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@244@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@244@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@244@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@244@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@171@01)
    (=
      ($FVF.lookup_g (as sm@244@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@181@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@244@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@181@01  $FVF<g>) r))
  :qid |qp.fvfValDef125|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (Set_in (inv@233@01 x2@171@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
            $k@232@01
            $Perm.No)
          (ite (= x2@171@01 x5@174@01) $Perm.Write $Perm.No))
        (ite (= x2@171@01 x4@173@01) $Perm.Write $Perm.No))
      (ite (= x2@171@01 x3@172@01) $Perm.Write $Perm.No))
    (ite (= x2@171@01 x2@171@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@245@01 $Perm)
(assert ($Perm.isReadVar $k@245@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@246@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      $k@245@01)
    $Perm.No))
(define-fun pTaken@247@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
          $Perm.Write
          $Perm.No)
        (pTaken@223@01 r))
      (- $k@245@01 (pTaken@246@01 r)))
    $Perm.No))
(define-fun pTaken@248@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
          $Perm.Write
          $Perm.No)
        (pTaken@209@01 r))
      (- (- $k@245@01 (pTaken@246@01 r)) (pTaken@247@01 r)))
    $Perm.No))
(define-fun pTaken@249@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      (- (- (- $k@245@01 (pTaken@246@01 r)) (pTaken@247@01 r)) (pTaken@248@01 r)))
    $Perm.No))
(define-fun pTaken@250@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@245@01 (pTaken@246@01 r)) (pTaken@247@01 r))
          (pTaken@248@01 r))
        (pTaken@249@01 r)))
    $Perm.No))
(define-fun pTaken@251@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@245@01 (pTaken@246@01 r)) (pTaken@247@01 r))
            (pTaken@248@01 r))
          (pTaken@249@01 r))
        (pTaken@250@01 r)))
    $Perm.No))
(define-fun pTaken@252@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($Perm.min
      (ite
        (Set_in (inv@238@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@237@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (- $k@245@01 (pTaken@246@01 r)) (pTaken@247@01 r))
              (pTaken@248@01 r))
            (pTaken@249@01 r))
          (pTaken@250@01 r))
        (pTaken@251@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@245@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
      ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
        $k@245@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
        $k@245@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    (= (- $k@245@01 (pTaken@246@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@253@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      (pTaken@223@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
(assert (=>
  (ite
    (Set_in (inv@238@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@237@01)
    false)
  (=
    ($FVF.lookup_f (as sm@253@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@230@01)) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x2@171@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@254@01 ((r $Ref)) $Perm
  (ite
    (= r x5@174@01)
    ($Perm.min (ite (= r x5@174@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@255@01 ((r $Ref)) $Perm
  (ite
    (= r x5@174@01)
    ($Perm.min
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)
      (- $Perm.Write (pTaken@254@01 r)))
    $Perm.No))
(define-fun pTaken@256@01 ((r $Ref)) $Perm
  (ite
    (= r x5@174@01)
    ($Perm.min
      (ite (= r x4@173@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@254@01 r)) (pTaken@255@01 r)))
    $Perm.No))
(define-fun pTaken@257@01 ((r $Ref)) $Perm
  (ite
    (= r x5@174@01)
    ($Perm.min
      (ite (= r x3@172@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@254@01 r)) (pTaken@255@01 r))
        (pTaken@256@01 r)))
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
    (ite (= x5@174@01 x5@174@01) $Perm.Write $Perm.No)
    (pTaken@254@01 x5@174@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x5@174@01) (= (- $Perm.Write (pTaken@254@01 r)) $Perm.No))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@258@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (Set_in (inv@233@01 x5@174@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@232@01)
    false)
  (=
    ($FVF.lookup_g (as sm@258@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) x5@174@01))))
(assert (=>
  (= x5@174@01 x5@174@01)
  (=
    ($FVF.lookup_g (as sm@258@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@193@01  $FVF<g>) x5@174@01))))
(assert (=>
  (= x5@174@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@258@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x5@174@01))))
(assert (=>
  (= x5@174@01 x3@172@01)
  (=
    ($FVF.lookup_g (as sm@258@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@185@01  $FVF<g>) x5@174@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (Set_in (inv@233@01 x5@174@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
            $k@232@01
            $Perm.No)
          (ite (= x5@174@01 x5@174@01) $Perm.Write $Perm.No))
        (ite (= x5@174@01 x4@173@01) $Perm.Write $Perm.No))
      (ite (= x5@174@01 x3@172@01) $Perm.Write $Perm.No))
    (ite (= x5@174@01 x2@171@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@259@01 $Perm)
(assert ($Perm.isReadVar $k@259@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
  ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@260@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      $k@259@01)
    $Perm.No))
(define-fun pTaken@261@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
          $Perm.Write
          $Perm.No)
        (pTaken@246@01 r))
      (- $k@259@01 (pTaken@260@01 r)))
    $Perm.No))
(define-fun pTaken@262@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
          $Perm.Write
          $Perm.No)
        (pTaken@223@01 r))
      (- (- $k@259@01 (pTaken@260@01 r)) (pTaken@261@01 r)))
    $Perm.No))
(define-fun pTaken@263@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
          $Perm.Write
          $Perm.No)
        (pTaken@209@01 r))
      (- (- (- $k@259@01 (pTaken@260@01 r)) (pTaken@261@01 r)) (pTaken@262@01 r)))
    $Perm.No))
(define-fun pTaken@264@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@259@01 (pTaken@260@01 r)) (pTaken@261@01 r))
          (pTaken@262@01 r))
        (pTaken@263@01 r)))
    $Perm.No))
(define-fun pTaken@265@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@259@01 (pTaken@260@01 r)) (pTaken@261@01 r))
            (pTaken@262@01 r))
          (pTaken@263@01 r))
        (pTaken@264@01 r)))
    $Perm.No))
(define-fun pTaken@266@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($Perm.min
      (ite
        (Set_in (inv@238@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@237@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (- $k@259@01 (pTaken@260@01 r)) (pTaken@261@01 r))
              (pTaken@262@01 r))
            (pTaken@263@01 r))
          (pTaken@264@01 r))
        (pTaken@265@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@259@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
      ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
        $k@259@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
        $k@259@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    (= (- $k@259@01 (pTaken@260@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@267@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      (pTaken@246@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      (pTaken@223@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)
    ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(assert (=>
  (ite
    (Set_in (inv@238@01 ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@237@01)
    false)
  (=
    ($FVF.lookup_f (as sm@267@01  $FVF<f>) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@230@01)) ($FVF.lookup_g (as sm@244@01  $FVF<g>) x5@174@01)))))
(declare-const $t@268@01 $Snap)
(assert (= $t@268@01 ($Snap.combine ($Snap.first $t@268@01) ($Snap.second $t@268@01))))
(declare-const x@269@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
(declare-const $k@270@01 $Perm)
(assert ($Perm.isReadVar $k@270@01))
(pop) ; 3
(declare-fun inv@271@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@270@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@269@01 $Ref)) (!
  (=>
    (Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (or (= $k@270@01 $Perm.No) (< $Perm.No $k@270@01)))
  
  :qid |quant-u-88|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@269@01 $Ref)) (!
  (=>
    (and
      (Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01))
    (= (inv@271@01 x@269@01) x@269@01))
  :pattern ((Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
  :pattern ((inv@271@01 x@269@01))
  :qid |quant-u-89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01))
    (= (inv@271@01 r) r))
  :pattern ((inv@271@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@269@01 $Ref)) (!
  (<= $Perm.No $k@270@01)
  :pattern ((Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
  :pattern ((inv@271@01 x@269@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@269@01 $Ref)) (!
  (<= $k@270@01 $Perm.Write)
  :pattern ((Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
  :pattern ((inv@271@01 x@269@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@269@01 $Ref)) (!
  (=>
    (and
      (Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01))
    (not (= x@269@01 $Ref.null)))
  :pattern ((Set_in x@269@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
  :pattern ((inv@271@01 x@269@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@272@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@272@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01)))
(declare-const sm@273@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01)
      false)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r))
  :qid |qp.fvfValDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef149|)))
(declare-const pm@274@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@274@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
            $k@270@01
            $Perm.No)
          (ite
            (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
            $k@232@01
            $Perm.No))
        (ite (= r x4@173@01) $Perm.Write $Perm.No))
      (ite (= r x3@172@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@274@01  $FPM) r))
  :qid |qp.resPrmSumDef150|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@274@01  $FPM) x@272@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@275@01 $Perm)
(assert ($Perm.isReadVar $k@275@01))
(pop) ; 3
(declare-fun inv@276@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01)
      false)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r))
  :qid |qp.fvfValDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef148|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@273@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef149|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@274@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
            $k@270@01
            $Perm.No)
          (ite
            (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
            $k@232@01
            $Perm.No))
        (ite (= r x4@173@01) $Perm.Write $Perm.No))
      (ite (= r x3@172@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@274@01  $FPM) r))
  :qid |qp.resPrmSumDef150|)))
(assert ($Perm.isReadVar $k@275@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@272@01 $Ref)) (!
  (=>
    (Set_in x@272@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (or (= $k@275@01 $Perm.No) (< $Perm.No $k@275@01)))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@272@01 $Ref)) (!
  (=>
    (and
      (Set_in x@272@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@275@01))
    (= (inv@276@01 ($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01)) x@272@01))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01))
  :qid |quant-u-91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@276@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@275@01))
    (= ($FVF.lookup_g (as sm@273@01  $FVF<g>) (inv@276@01 r)) r))
  :pattern ((inv@276@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@272@01 $Ref)) (!
  (<= $Perm.No $k@275@01)
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@272@01 $Ref)) (!
  (<= $k@275@01 $Perm.Write)
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@272@01 $Ref)) (!
  (=>
    (and
      (Set_in x@272@01 (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@275@01))
    (not (= ($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@273@01  $FVF<g>) x@272@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; test10(x3, x4)
; Precomputing data for removing quantified permissions
(define-fun pTaken@277@01 ((r $Ref)) $Perm
  (ite
    (= r x3@172@01)
    ($Perm.min (ite (= r x3@172@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@278@01 ((r $Ref)) $Perm
  (ite
    (= r x3@172@01)
    ($Perm.min
      (ite
        (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
        $k@270@01
        $Perm.No)
      (- $Perm.Write (pTaken@277@01 r)))
    $Perm.No))
(define-fun pTaken@279@01 ((r $Ref)) $Perm
  (ite
    (= r x3@172@01)
    ($Perm.min
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)
      (- (- $Perm.Write (pTaken@277@01 r)) (pTaken@278@01 r)))
    $Perm.No))
(define-fun pTaken@280@01 ((r $Ref)) $Perm
  (ite
    (= r x3@172@01)
    ($Perm.min
      (ite (= r x4@173@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@277@01 r)) (pTaken@278@01 r))
        (pTaken@279@01 r)))
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
    (ite (= x3@172@01 x3@172@01) $Perm.Write $Perm.No)
    (pTaken@277@01 x3@172@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x3@172@01) (= (- $Perm.Write (pTaken@277@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@281@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (Set_in (inv@271@01 x3@172@01) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (< $Perm.No $k@270@01)
    false)
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) x3@172@01))))
(assert (=>
  (ite
    (Set_in (inv@233@01 x3@172@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@232@01)
    false)
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) x3@172@01))))
(assert (=>
  (= x3@172@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x3@172@01))))
(assert (=>
  (= x3@172@01 x3@172@01)
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g (as sm@185@01  $FVF<g>) x3@172@01))))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01)
      false)
    (=
      ($FVF.lookup_g (as sm@281@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r)))
  :pattern (($FVF.lookup_g (as sm@281@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r))
  :qid |qp.fvfValDef151|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@281@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@281@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef152|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@173@01)
    (=
      ($FVF.lookup_g (as sm@281@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@189@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@281@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@189@01  $FVF<g>) r))
  :qid |qp.fvfValDef153|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@172@01)
    (=
      ($FVF.lookup_g (as sm@281@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@185@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@281@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@185@01  $FVF<g>) r))
  :qid |qp.fvfValDef154|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (ite
          (Set_in (inv@271@01 x3@172@01) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
          $k@270@01
          $Perm.No)
        (ite
          (Set_in (inv@233@01 x3@172@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
          $k@232@01
          $Perm.No))
      (ite (= x3@172@01 x4@173@01) $Perm.Write $Perm.No))
    (ite (= x3@172@01 x3@172@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@282@01 $Perm)
(assert ($Perm.isReadVar $k@282@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@283@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      $k@282@01)
    $Perm.No))
(define-fun pTaken@284@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
          $Perm.Write
          $Perm.No)
        (pTaken@260@01 r))
      (- $k@282@01 (pTaken@283@01 r)))
    $Perm.No))
(define-fun pTaken@285@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
          $Perm.Write
          $Perm.No)
        (pTaken@246@01 r))
      (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r)))
    $Perm.No))
(define-fun pTaken@286@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
          $Perm.Write
          $Perm.No)
        (pTaken@223@01 r))
      (- (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r)) (pTaken@285@01 r)))
    $Perm.No))
(define-fun pTaken@287@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
          $Perm.Write
          $Perm.No)
        (pTaken@209@01 r))
      (-
        (-
          (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r))
          (pTaken@285@01 r))
        (pTaken@286@01 r)))
    $Perm.No))
(define-fun pTaken@288@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r))
            (pTaken@285@01 r))
          (pTaken@286@01 r))
        (pTaken@287@01 r)))
    $Perm.No))
(define-fun pTaken@289@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (ite
        (Set_in (inv@238@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@237@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r))
              (pTaken@285@01 r))
            (pTaken@286@01 r))
          (pTaken@287@01 r))
        (pTaken@288@01 r)))
    $Perm.No))
(define-fun pTaken@290@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($Perm.min
      (ite
        (Set_in (inv@276@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
        $k@275@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (-
                (- (- $k@282@01 (pTaken@283@01 r)) (pTaken@284@01 r))
                (pTaken@285@01 r))
              (pTaken@286@01 r))
            (pTaken@287@01 r))
          (pTaken@288@01 r))
        (pTaken@289@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@282@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
      ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
        $k@282@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
        $k@282@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    (= (- $k@282@01 (pTaken@283@01 r)) $Perm.No))
  
  :qid |quant-u-97|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@291@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      (pTaken@260@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      (pTaken@246@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      (pTaken@223@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (ite
    (Set_in (inv@238@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@237@01)
    false)
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@230@01)) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
(assert (=>
  (ite
    (Set_in (inv@276@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (< $Perm.No $k@275@01)
    false)
  (=
    ($FVF.lookup_f (as sm@291@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@268@01)) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x3@172@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@292@01 ((r $Ref)) $Perm
  (ite
    (= r x4@173@01)
    ($Perm.min (ite (= r x4@173@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@293@01 ((r $Ref)) $Perm
  (ite
    (= r x4@173@01)
    ($Perm.min
      (ite
        (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
        $k@270@01
        $Perm.No)
      (- $Perm.Write (pTaken@292@01 r)))
    $Perm.No))
(define-fun pTaken@294@01 ((r $Ref)) $Perm
  (ite
    (= r x4@173@01)
    ($Perm.min
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)
      (- (- $Perm.Write (pTaken@292@01 r)) (pTaken@293@01 r)))
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
    (ite (= x4@173@01 x4@173@01) $Perm.Write $Perm.No)
    (pTaken@292@01 x4@173@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r x4@173@01) (= (- $Perm.Write (pTaken@292@01 r)) $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@295@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (Set_in (inv@271@01 x4@173@01) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (< $Perm.No $k@270@01)
    false)
  (=
    ($FVF.lookup_g (as sm@295@01  $FVF<g>) x4@173@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) x4@173@01))))
(assert (=>
  (ite
    (Set_in (inv@233@01 x4@173@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@232@01)
    false)
  (=
    ($FVF.lookup_g (as sm@295@01  $FVF<g>) x4@173@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) x4@173@01))))
(assert (=>
  (= x4@173@01 x4@173@01)
  (=
    ($FVF.lookup_g (as sm@295@01  $FVF<g>) x4@173@01)
    ($FVF.lookup_g (as sm@189@01  $FVF<g>) x4@173@01))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (ite
          (Set_in (inv@271@01 x4@173@01) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
          $k@270@01
          $Perm.No)
        (ite
          (Set_in (inv@233@01 x4@173@01) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
          $k@232@01
          $Perm.No))
      (ite (= x4@173@01 x4@173@01) $Perm.Write $Perm.No))
    (ite (= x4@173@01 x3@172@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@296@01 $Perm)
(assert ($Perm.isReadVar $k@296@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
  ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@297@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      $k@296@01)
    $Perm.No))
(define-fun pTaken@298@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
          $Perm.Write
          $Perm.No)
        (pTaken@283@01 r))
      (- $k@296@01 (pTaken@297@01 r)))
    $Perm.No))
(define-fun pTaken@299@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
          $Perm.Write
          $Perm.No)
        (pTaken@260@01 r))
      (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r)))
    $Perm.No))
(define-fun pTaken@300@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
          $Perm.Write
          $Perm.No)
        (pTaken@246@01 r))
      (- (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r)) (pTaken@299@01 r)))
    $Perm.No))
(define-fun pTaken@301@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
          $Perm.Write
          $Perm.No)
        (pTaken@223@01 r))
      (-
        (-
          (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r))
          (pTaken@299@01 r))
        (pTaken@300@01 r)))
    $Perm.No))
(define-fun pTaken@302@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (-
        (ite
          (= r ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
          $Perm.Write
          $Perm.No)
        (pTaken@209@01 r))
      (-
        (-
          (-
            (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r))
            (pTaken@299@01 r))
          (pTaken@300@01 r))
        (pTaken@301@01 r)))
    $Perm.No))
(define-fun pTaken@303@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (ite
        (Set_in (inv@238@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@237@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r))
              (pTaken@299@01 r))
            (pTaken@300@01 r))
          (pTaken@301@01 r))
        (pTaken@302@01 r)))
    $Perm.No))
(define-fun pTaken@304@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($Perm.min
      (ite
        (Set_in (inv@276@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
        $k@275@01
        $Perm.No)
      (-
        (-
          (-
            (-
              (-
                (- (- $k@296@01 (pTaken@297@01 r)) (pTaken@298@01 r))
                (pTaken@299@01 r))
              (pTaken@300@01 r))
            (pTaken@301@01 r))
          (pTaken@302@01 r))
        (pTaken@303@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@296@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
      ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
        $k@296@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
        $k@296@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    (= (- $k@296@01 (pTaken@297@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@305@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@186@01  $FVF<g>) x3@172@01))
        $Perm.Write
        $Perm.No)
      (pTaken@283@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@188@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@194@01  $FVF<g>) x5@174@01))
        $Perm.Write
        $Perm.No)
      (pTaken@260@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@196@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@182@01  $FVF<g>) x2@171@01))
        $Perm.Write
        $Perm.No)
      (pTaken@246@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@184@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@198@01  $FVF<g>) x6@175@01))
        $Perm.Write
        $Perm.No)
      (pTaken@223@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@200@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (=
          ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
          ($FVF.lookup_g (as sm@178@01  $FVF<g>) x1@170@01))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@180@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)
    ($FVF.lookup_g (as sm@190@01  $FVF<g>) x4@173@01))
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f (as sm@192@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (ite
    (Set_in (inv@238@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
    (< $Perm.No $k@237@01)
    false)
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@230@01)) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(assert (=>
  (ite
    (Set_in (inv@276@01 ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
    (< $Perm.No $k@275@01)
    false)
  (=
    ($FVF.lookup_f (as sm@305@01  $FVF<f>) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01))
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@268@01)) ($FVF.lookup_g (as sm@281@01  $FVF<g>) x4@173@01)))))
(declare-const $t@306@01 $Snap)
(assert (= $t@306@01 ($Snap.combine ($Snap.first $t@306@01) ($Snap.second $t@306@01))))
(declare-const x@307@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
(declare-const $k@308@01 $Perm)
(assert ($Perm.isReadVar $k@308@01))
(pop) ; 3
(declare-fun inv@309@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@308@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@307@01 $Ref)) (!
  (=>
    (Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
    (or (= $k@308@01 $Perm.No) (< $Perm.No $k@308@01)))
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@307@01 $Ref)) (!
  (=>
    (and
      (Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@308@01))
    (= (inv@309@01 x@307@01) x@307@01))
  :pattern ((Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
  :pattern ((inv@309@01 x@307@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@309@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@308@01))
    (= (inv@309@01 r) r))
  :pattern ((inv@309@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@307@01 $Ref)) (!
  (<= $Perm.No $k@308@01)
  :pattern ((Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
  :pattern ((inv@309@01 x@307@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@307@01 $Ref)) (!
  (<= $k@308@01 $Perm.Write)
  :pattern ((Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
  :pattern ((inv@309@01 x@307@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@307@01 $Ref)) (!
  (=>
    (and
      (Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@308@01))
    (not (= x@307@01 $Ref.null)))
  :pattern ((Set_in x@307@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
  :pattern ((inv@309@01 x@307@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@310@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@310@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01)))
(declare-const sm@311@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@309@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@308@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@306@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@306@01)) r))
  :qid |qp.fvfValDef176|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r))
  :qid |qp.fvfValDef177|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef178|)))
(declare-const pm@312@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@312@01  $FPM) r)
    (+
      (+
        (ite
          (Set_in (inv@309@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
          $k@308@01
          $Perm.No)
        (ite
          (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
          $k@270@01
          $Perm.No))
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@312@01  $FPM) r))
  :qid |qp.resPrmSumDef179|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@312@01  $FPM) x@310@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@313@01 $Perm)
(assert ($Perm.isReadVar $k@313@01))
(pop) ; 3
(declare-fun inv@314@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@309@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@308@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@306@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@306@01)) r))
  :qid |qp.fvfValDef176|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
      (< $Perm.No $k@270@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@268@01)) r))
  :qid |qp.fvfValDef177|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
      (< $Perm.No $k@232@01)
      false)
    (=
      ($FVF.lookup_g (as sm@311@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@230@01)) r))
  :qid |qp.fvfValDef178|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@312@01  $FPM) r)
    (+
      (+
        (ite
          (Set_in (inv@309@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
          $k@308@01
          $Perm.No)
        (ite
          (Set_in (inv@271@01 r) (Set_unionone (Set_singleton x2@171@01) x5@174@01))
          $k@270@01
          $Perm.No))
      (ite
        (Set_in (inv@233@01 r) (Set_unionone (Set_singleton x1@170@01) x6@175@01))
        $k@232@01
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@312@01  $FPM) r))
  :qid |qp.resPrmSumDef179|)))
(assert ($Perm.isReadVar $k@313@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@310@01 $Ref)) (!
  (=>
    (Set_in x@310@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
    (or (= $k@313@01 $Perm.No) (< $Perm.No $k@313@01)))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@310@01 $Ref)) (!
  (=>
    (and
      (Set_in x@310@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@313@01))
    (= (inv@314@01 ($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01)) x@310@01))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@314@01 r) (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@313@01))
    (= ($FVF.lookup_g (as sm@311@01  $FVF<g>) (inv@314@01 r)) r))
  :pattern ((inv@314@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@310@01 $Ref)) (!
  (<= $Perm.No $k@313@01)
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@310@01 $Ref)) (!
  (<= $k@313@01 $Perm.Write)
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@310@01 $Ref)) (!
  (=>
    (and
      (Set_in x@310@01 (Set_unionone (Set_singleton x3@172@01) x4@173@01))
      (< $Perm.No $k@313@01))
    (not (= ($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@311@01  $FVF<g>) x@310@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const xs@315@01 Set<$Ref>)
(declare-const y1@316@01 $Ref)
(declare-const y2@317@01 $Ref)
(declare-const y3@318@01 $Ref)
(declare-const xs@319@01 Set<$Ref>)
(declare-const y1@320@01 $Ref)
(declare-const y2@321@01 $Ref)
(declare-const y3@322@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@323@01 $Snap)
(assert (= $t@323@01 ($Snap.combine ($Snap.first $t@323@01) ($Snap.second $t@323@01))))
(declare-const x@324@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@324@01 xs@319@01))
(pop) ; 2
(declare-fun inv@325@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@324@01 $Ref)) (!
  (=> (Set_in x@324@01 xs@319@01) (= (inv@325@01 x@324@01) x@324@01))
  :pattern ((Set_in x@324@01 xs@319@01))
  :pattern ((inv@325@01 x@324@01))
  :qid |quant-u-109|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@325@01 r) xs@319@01) (= (inv@325@01 r) r))
  :pattern ((inv@325@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@324@01 $Ref)) (!
  (=> (Set_in x@324@01 xs@319@01) (not (= x@324@01 $Ref.null)))
  :pattern ((Set_in x@324@01 xs@319@01))
  :pattern ((inv@325@01 x@324@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@323@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@323@01))
    ($Snap.second ($Snap.second $t@323@01)))))
(assert (= ($Snap.first ($Snap.second $t@323@01)) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } (x1 in xs) && ((x2 in xs) && x1 != x2) ==> x1.g != x2.g)
(declare-const x1@326@01 $Ref)
(declare-const x2@327@01 $Ref)
(push) ; 2
; [eval] (x1 in xs) && ((x2 in xs) && x1 != x2) ==> x1.g != x2.g
; [eval] (x1 in xs) && ((x2 in xs) && x1 != x2)
; [eval] (x1 in xs)
(push) ; 3
; [then-branch: 2 | x1@326@01 in xs@319@01 | live]
; [else-branch: 2 | !(x1@326@01 in xs@319@01) | live]
(push) ; 4
; [then-branch: 2 | x1@326@01 in xs@319@01]
(assert (Set_in x1@326@01 xs@319@01))
; [eval] (x2 in xs)
(push) ; 5
; [then-branch: 3 | x2@327@01 in xs@319@01 | live]
; [else-branch: 3 | !(x2@327@01 in xs@319@01) | live]
(push) ; 6
; [then-branch: 3 | x2@327@01 in xs@319@01]
(assert (Set_in x2@327@01 xs@319@01))
; [eval] x1 != x2
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(x2@327@01 in xs@319@01)]
(assert (not (Set_in x2@327@01 xs@319@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x2@327@01 xs@319@01)) (Set_in x2@327@01 xs@319@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(x1@326@01 in xs@319@01)]
(assert (not (Set_in x1@326@01 xs@319@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (Set_in x1@326@01 xs@319@01)
  (and
    (Set_in x1@326@01 xs@319@01)
    (or (not (Set_in x2@327@01 xs@319@01)) (Set_in x2@327@01 xs@319@01)))))
; Joined path conditions
(assert (or (not (Set_in x1@326@01 xs@319@01)) (Set_in x1@326@01 xs@319@01)))
(push) ; 3
; [then-branch: 4 | x1@326@01 != x2@327@01 && x2@327@01 in xs@319@01 && x1@326@01 in xs@319@01 | live]
; [else-branch: 4 | !(x1@326@01 != x2@327@01 && x2@327@01 in xs@319@01 && x1@326@01 in xs@319@01) | live]
(push) ; 4
; [then-branch: 4 | x1@326@01 != x2@327@01 && x2@327@01 in xs@319@01 && x1@326@01 in xs@319@01]
(assert (and
  (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
  (Set_in x1@326@01 xs@319@01)))
; [eval] x1.g != x2.g
(declare-const sm@328@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@328@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@328@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef180|)))
(declare-const pm@329@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@329@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@329@01  $FPM) r))
  :qid |qp.resPrmSumDef181|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_g (as pm@329@01  $FPM) x1@326@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const sm@330@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@330@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@330@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef182|)))
(declare-const pm@331@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@331@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@331@01  $FPM) r))
  :qid |qp.resPrmSumDef183|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_g (as pm@331@01  $FPM) x2@327@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(x1@326@01 != x2@327@01 && x2@327@01 in xs@319@01 && x1@326@01 in xs@319@01)]
(assert (not
  (and
    (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
    (Set_in x1@326@01 xs@319@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@328@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@328@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@329@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@329@01  $FPM) r))
  :qid |qp.resPrmSumDef181|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@330@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@330@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@331@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@331@01  $FPM) r))
  :qid |qp.resPrmSumDef183|)))
(assert (=>
  (and
    (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
    (Set_in x1@326@01 xs@319@01))
  (and
    (not (= x1@326@01 x2@327@01))
    (Set_in x2@327@01 xs@319@01)
    (Set_in x1@326@01 xs@319@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
      (Set_in x1@326@01 xs@319@01)))
  (and
    (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
    (Set_in x1@326@01 xs@319@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@328@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@328@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@329@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@329@01  $FPM) r))
  :qid |qp.resPrmSumDef181|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@330@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@330@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@331@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@331@01  $FPM) r))
  :qid |qp.resPrmSumDef183|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@326@01 $Ref) (x2@327@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@326@01 xs@319@01)
      (and
        (Set_in x1@326@01 xs@319@01)
        (or (not (Set_in x2@327@01 xs@319@01)) (Set_in x2@327@01 xs@319@01))))
    (or (not (Set_in x1@326@01 xs@319@01)) (Set_in x1@326@01 xs@319@01))
    (=>
      (and
        (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
        (Set_in x1@326@01 xs@319@01))
      (and
        (not (= x1@326@01 x2@327@01))
        (Set_in x2@327@01 xs@319@01)
        (Set_in x1@326@01 xs@319@01)))
    (or
      (not
        (and
          (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
          (Set_in x1@326@01 xs@319@01)))
      (and
        (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
        (Set_in x1@326@01 xs@319@01))))
  :pattern ((Set_in x1@326@01 xs@319@01) (Set_in x2@327@01 xs@319@01))
  :qid |prog.l85-aux|)))
(assert (forall ((x1@326@01 $Ref) (x2@327@01 $Ref)) (!
  (=>
    (and
      (and (not (= x1@326@01 x2@327@01)) (Set_in x2@327@01 xs@319@01))
      (Set_in x1@326@01 xs@319@01))
    (not
      (=
        ($FVF.lookup_g (as sm@328@01  $FVF<g>) x1@326@01)
        ($FVF.lookup_g (as sm@330@01  $FVF<g>) x2@327@01))))
  :pattern ((Set_in x1@326@01 xs@319@01) (Set_in x2@327@01 xs@319@01))
  :qid |prog.l85|)))
(assert (=
  ($Snap.second ($Snap.second $t@323@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@323@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))
(declare-const x@332@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@332@01 xs@319@01))
(declare-const sm@333@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@333@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@333@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef184|)))
(declare-const pm@334@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@334@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@334@01  $FPM) r))
  :qid |qp.resPrmSumDef185|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@334@01  $FPM) x@332@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@335@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@333@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@333@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef184|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@334@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@334@01  $FPM) r))
  :qid |qp.resPrmSumDef185|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@332@01 $Ref)) (!
  (=>
    (Set_in x@332@01 xs@319@01)
    (= (inv@335@01 ($FVF.lookup_g (as sm@333@01  $FVF<g>) x@332@01)) x@332@01))
  :pattern (($FVF.lookup_g (as sm@333@01  $FVF<g>) x@332@01))
  :qid |quant-u-111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@335@01 r) xs@319@01)
    (= ($FVF.lookup_g (as sm@333@01  $FVF<g>) (inv@335@01 r)) r))
  :pattern ((inv@335@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@332@01 $Ref)) (!
  (=>
    (Set_in x@332@01 xs@319@01)
    (not (= ($FVF.lookup_g (as sm@333@01  $FVF<g>) x@332@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@333@01  $FVF<g>) x@332@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@323@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
  $Snap.unit))
; [eval] (y1 in xs)
(assert (Set_in y1@320@01 xs@319@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))
  $Snap.unit))
; [eval] (y2 in xs)
(assert (Set_in y2@321@01 xs@319@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))
  $Snap.unit))
; [eval] (y3 in xs)
(assert (Set_in y3@322@01 xs@319@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@323@01))))))
  $Snap.unit))
; [eval] y1 != y2
(assert (not (= y1@320@01 y2@321@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@336@01 Int)
; [exec]
; inhale y1.g != null
(declare-const $t@337@01 $Snap)
(assert (= $t@337@01 $Snap.unit))
; [eval] y1.g != null
(declare-const sm@338@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@338@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@338@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef186|)))
(declare-const pm@339@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@339@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@339@01  $FPM) r))
  :qid |qp.resPrmSumDef187|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@339@01  $FPM) y1@320@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_g (as sm@338@01  $FVF<g>) y1@320@01) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale y2.g != null
(declare-const $t@340@01 $Snap)
(assert (= $t@340@01 $Snap.unit))
; [eval] y2.g != null
(declare-const sm@341@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@341@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@341@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef188|)))
(declare-const pm@342@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@342@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@342@01  $FPM) r))
  :qid |qp.resPrmSumDef189|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@342@01  $FPM) y2@321@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_g (as sm@341@01  $FVF<g>) y2@321@01) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := y1.g.f
(declare-const sm@343@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@343@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@343@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef190|)))
(declare-const pm@344@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@344@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@344@01  $FPM) r))
  :qid |qp.resPrmSumDef191|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@344@01  $FPM) y1@320@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@345@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@335@01 r) xs@319@01)
    (=
      ($FVF.lookup_f (as sm@345@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@345@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r))
  :qid |qp.fvfValDef192|)))
(declare-const pm@346@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@346@01  $FPM) r)
    (ite (Set_in (inv@335@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@346@01  $FPM) r))
  :qid |qp.resPrmSumDef193|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@346@01  $FPM) ($FVF.lookup_g (as sm@343@01  $FVF<g>) y1@320@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@347@01 Int)
(assert (=
  a@347@01
  ($FVF.lookup_f (as sm@345@01  $FVF<f>) ($FVF.lookup_g (as sm@343@01  $FVF<g>) y1@320@01))))
; [exec]
; assert y1.g != y2.g
; [eval] y1.g != y2.g
(declare-const sm@348@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@348@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@348@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef194|)))
(declare-const pm@349@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@349@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@349@01  $FPM) r))
  :qid |qp.resPrmSumDef195|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@349@01  $FPM) y1@320@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@350@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@350@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@350@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef196|)))
(declare-const pm@351@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@351@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@351@01  $FPM) r))
  :qid |qp.resPrmSumDef197|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@351@01  $FPM) y2@321@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@348@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@350@01  $FVF<g>) y2@321@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@348@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@350@01  $FVF<g>) y2@321@01))))
; [exec]
; assert y1.g != y3.g || y2.g != y3.g
; [eval] y1.g != y3.g || y2.g != y3.g
; [eval] y1.g != y3.g
(declare-const sm@352@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@352@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@352@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef198|)))
(declare-const pm@353@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@353@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@353@01  $FPM) r))
  :qid |qp.resPrmSumDef199|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@353@01  $FPM) y1@320@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@354@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@354@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@354@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef200|)))
(declare-const pm@355@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@355@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@355@01  $FPM) r))
  :qid |qp.resPrmSumDef201|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@355@01  $FPM) y3@322@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 5 | Lookup(g, sm@352@01, y1@320@01) != Lookup(g, sm@354@01, y3@322@01) | live]
; [else-branch: 5 | Lookup(g, sm@352@01, y1@320@01) == Lookup(g, sm@354@01, y3@322@01) | live]
(push) ; 4
; [then-branch: 5 | Lookup(g, sm@352@01, y1@320@01) != Lookup(g, sm@354@01, y3@322@01)]
(assert (not
  (=
    ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | Lookup(g, sm@352@01, y1@320@01) == Lookup(g, sm@354@01, y3@322@01)]
(assert (=
  ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
  ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01)))
; [eval] y2.g != y3.g
(declare-const sm@356@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@356@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@356@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef202|)))
(declare-const pm@357@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@357@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@357@01  $FPM) r))
  :qid |qp.resPrmSumDef203|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_g (as pm@357@01  $FPM) y2@321@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const sm@358@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@358@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@358@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef204|)))
(declare-const pm@359@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@359@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@359@01  $FPM) r))
  :qid |qp.resPrmSumDef205|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_g (as pm@359@01  $FPM) y3@322@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@356@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@356@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef202|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@357@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@357@01  $FPM) r))
  :qid |qp.resPrmSumDef203|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@358@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@358@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef204|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@359@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@359@01  $FPM) r))
  :qid |qp.resPrmSumDef205|)))
(assert (or
  (=
    ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01))
  (not
    (=
      ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
      ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01)))))
(push) ; 3
(assert (not (or
  (not
    (=
      ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
      ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01)))
  (not
    (=
      ($FVF.lookup_g (as sm@356@01  $FVF<g>) y2@321@01)
      ($FVF.lookup_g (as sm@358@01  $FVF<g>) y3@322@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (or
  (not
    (=
      ($FVF.lookup_g (as sm@352@01  $FVF<g>) y1@320@01)
      ($FVF.lookup_g (as sm@354@01  $FVF<g>) y3@322@01)))
  (not
    (=
      ($FVF.lookup_g (as sm@356@01  $FVF<g>) y2@321@01)
      ($FVF.lookup_g (as sm@358@01  $FVF<g>) y3@322@01)))))
; [exec]
; assert y1.g != y3.g && y2.g != y3.g
; [eval] y1.g != y3.g
(declare-const sm@360@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@360@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@360@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef206|)))
(declare-const pm@361@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@361@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@361@01  $FPM) r))
  :qid |qp.resPrmSumDef207|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@361@01  $FPM) y1@320@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@362@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@362@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@362@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef208|)))
(declare-const pm@363@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@363@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@363@01  $FPM) r))
  :qid |qp.resPrmSumDef209|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@363@01  $FPM) y3@322@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@360@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@362@01  $FVF<g>) y3@322@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@364@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@335@01 r) xs@319@01)
    (=
      ($FVF.lookup_f (as sm@364@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@364@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r))
  :qid |qp.fvfValDef210|)))
(declare-const pm@365@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@365@01  $FPM) r)
    (ite (Set_in (inv@335@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@365@01  $FPM) r))
  :qid |qp.resPrmSumDef211|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@365@01  $FPM) r) $Perm.Write)
  :pattern ((inv@335@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@366@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@366@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@366@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef212|)))
(declare-const pm@367@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@367@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@367@01  $FPM) r))
  :qid |qp.resPrmSumDef213|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@367@01  $FPM) r) $Perm.Write)
  :pattern ((inv@325@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_in (inv@325@01 y1@320@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in (inv@325@01 y3@322@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@366@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@366@01  $FVF<g>) y3@322@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@368@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@335@01 r) xs@319@01)
    (=
      ($FVF.lookup_f (as sm@368@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@368@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@323@01)))) r))
  :qid |qp.fvfValDef214|)))
(declare-const pm@369@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@369@01  $FPM) r)
    (ite (Set_in (inv@335@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@369@01  $FPM) r))
  :qid |qp.resPrmSumDef215|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@369@01  $FPM) r) $Perm.Write)
  :pattern ((inv@335@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@370@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@325@01 r) xs@319@01)
    (=
      ($FVF.lookup_g (as sm@370@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r)))
  :pattern (($FVF.lookup_g (as sm@370@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@323@01)) r))
  :qid |qp.fvfValDef216|)))
(declare-const pm@371@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@371@01  $FPM) r)
    (ite (Set_in (inv@325@01 r) xs@319@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_g (as pm@371@01  $FPM) r))
  :qid |qp.resPrmSumDef217|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@371@01  $FPM) r) $Perm.Write)
  :pattern ((inv@325@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_in (inv@325@01 y1@320@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in (inv@325@01 y3@322@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@370@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@370@01  $FVF<g>) y3@322@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Definitional axioms for snapshot map values
; Assume upper permission bound for field g
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_in (inv@325@01 y1@320@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in (inv@325@01 y3@322@01) xs@319@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@370@01  $FVF<g>) y1@320@01)
    ($FVF.lookup_g (as sm@370@01  $FVF<g>) y3@322@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const xs@372@01 Set<$Ref>)
(declare-const ys@373@01 Set<$Ref>)
(declare-const x@374@01 $Ref)
(declare-const xs@375@01 Set<$Ref>)
(declare-const ys@376@01 Set<$Ref>)
(declare-const x@377@01 $Ref)
(push) ; 1
(declare-const $t@378@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@379@01 Int)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@378@01 ($Snap.combine ($Snap.first $t@378@01) ($Snap.second $t@378@01))))
(declare-const x@380@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 6 | x@380@01 in xs@375@01 | live]
; [else-branch: 6 | !(x@380@01 in xs@375@01) | live]
(push) ; 5
; [then-branch: 6 | x@380@01 in xs@375@01]
(assert (Set_in x@380@01 xs@375@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(x@380@01 in xs@375@01)]
(assert (not (Set_in x@380@01 xs@375@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@380@01 xs@375@01)) (Set_in x@380@01 xs@375@01)))
(assert (and (not (Set_in x@380@01 ys@376@01)) (Set_in x@380@01 xs@375@01)))
(pop) ; 3
(declare-fun inv@381@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@380@01 $Ref)) (!
  (=>
    (and (not (Set_in x@380@01 ys@376@01)) (Set_in x@380@01 xs@375@01))
    (or (not (Set_in x@380@01 xs@375@01)) (Set_in x@380@01 xs@375@01)))
  :pattern ((Set_in x@380@01 ys@376@01))
  :pattern ((Set_in x@380@01 xs@375@01))
  :pattern ((inv@381@01 x@380@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@380@01 $Ref)) (!
  (=>
    (and (not (Set_in x@380@01 ys@376@01)) (Set_in x@380@01 xs@375@01))
    (= (inv@381@01 x@380@01) x@380@01))
  :pattern ((Set_in x@380@01 ys@376@01))
  :pattern ((Set_in x@380@01 xs@375@01))
  :pattern ((inv@381@01 x@380@01))
  :qid |quant-u-113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (= (inv@381@01 r) r))
  :pattern ((inv@381@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@380@01 $Ref)) (!
  (=>
    (and (not (Set_in x@380@01 ys@376@01)) (Set_in x@380@01 xs@375@01))
    (not (= x@380@01 $Ref.null)))
  :pattern ((Set_in x@380@01 ys@376@01))
  :pattern ((Set_in x@380@01 xs@375@01))
  :pattern ((inv@381@01 x@380@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@378@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@378@01))
    ($Snap.second ($Snap.second $t@378@01)))))
(declare-const x@382@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 7 | x@382@01 in xs@375@01 | live]
; [else-branch: 7 | !(x@382@01 in xs@375@01) | live]
(push) ; 5
; [then-branch: 7 | x@382@01 in xs@375@01]
(assert (Set_in x@382@01 xs@375@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 8 | !(x@382@01 in ys@376@01) | live]
; [else-branch: 8 | x@382@01 in ys@376@01 | live]
(push) ; 7
; [then-branch: 8 | !(x@382@01 in ys@376@01)]
(assert (not (Set_in x@382@01 ys@376@01)))
; [eval] x.f != 0
(declare-const sm@383@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@383@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef218|)))
(declare-const pm@384@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@384@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@384@01  $FPM) r))
  :qid |qp.resPrmSumDef219|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@384@01  $FPM) x@382@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 8 | x@382@01 in ys@376@01]
(assert (Set_in x@382@01 ys@376@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@383@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef218|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@384@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@384@01  $FPM) r))
  :qid |qp.resPrmSumDef219|)))
; Joined path conditions
(assert (or (Set_in x@382@01 ys@376@01) (not (Set_in x@382@01 ys@376@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(x@382@01 in xs@375@01)]
(assert (not (Set_in x@382@01 xs@375@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@383@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef218|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@384@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@384@01  $FPM) r))
  :qid |qp.resPrmSumDef219|)))
(assert (=>
  (Set_in x@382@01 xs@375@01)
  (and
    (Set_in x@382@01 xs@375@01)
    (or (Set_in x@382@01 ys@376@01) (not (Set_in x@382@01 ys@376@01))))))
; Joined path conditions
(assert (or (not (Set_in x@382@01 xs@375@01)) (Set_in x@382@01 xs@375@01)))
(assert (and
  (and
    (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01) 0))
    (not (Set_in x@382@01 ys@376@01)))
  (Set_in x@382@01 xs@375@01)))
(pop) ; 3
(declare-fun inv@385@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@383@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef218|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@384@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@384@01  $FPM) r))
  :qid |qp.resPrmSumDef219|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@382@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01) 0))
        (not (Set_in x@382@01 ys@376@01)))
      (Set_in x@382@01 xs@375@01))
    (and
      (=>
        (Set_in x@382@01 xs@375@01)
        (and
          (Set_in x@382@01 xs@375@01)
          (or (Set_in x@382@01 ys@376@01) (not (Set_in x@382@01 ys@376@01)))))
      (or (not (Set_in x@382@01 xs@375@01)) (Set_in x@382@01 xs@375@01))))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01))
  :pattern ((Set_in x@382@01 ys@376@01))
  :pattern ((Set_in x@382@01 xs@375@01))
  :pattern ((inv@385@01 x@382@01))
  :qid |g-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@382@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01) 0))
        (not (Set_in x@382@01 ys@376@01)))
      (Set_in x@382@01 xs@375@01))
    (= (inv@385@01 x@382@01) x@382@01))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01))
  :pattern ((Set_in x@382@01 ys@376@01))
  :pattern ((Set_in x@382@01 xs@375@01))
  :pattern ((inv@385@01 x@382@01))
  :qid |quant-u-115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (= (inv@385@01 r) r))
  :pattern ((inv@385@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@382@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01) 0))
        (not (Set_in x@382@01 ys@376@01)))
      (Set_in x@382@01 xs@375@01))
    (not (= x@382@01 $Ref.null)))
  :pattern (($FVF.lookup_f (as sm@383@01  $FVF<f>) x@382@01))
  :pattern ((Set_in x@382@01 ys@376@01))
  :pattern ((Set_in x@382@01 xs@375@01))
  :pattern ((inv@385@01 x@382@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@378@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@378@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@378@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@378@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@386@01 $Ref)
(declare-const x2@387@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 9 | x1@386@01 in xs@375@01 | live]
; [else-branch: 9 | !(x1@386@01 in xs@375@01) | live]
(push) ; 5
; [then-branch: 9 | x1@386@01 in xs@375@01]
(assert (Set_in x1@386@01 xs@375@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 10 | !(x1@386@01 in ys@376@01) | live]
; [else-branch: 10 | x1@386@01 in ys@376@01 | live]
(push) ; 7
; [then-branch: 10 | !(x1@386@01 in ys@376@01)]
(assert (not (Set_in x1@386@01 ys@376@01)))
; [eval] x1.f != 0
(declare-const sm@388@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@388@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef220|)))
(declare-const pm@389@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@389@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@389@01  $FPM) r))
  :qid |qp.resPrmSumDef221|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@389@01  $FPM) x1@386@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 11 | Lookup(f, sm@388@01, x1@386@01) != 0 | live]
; [else-branch: 11 | Lookup(f, sm@388@01, x1@386@01) == 0 | live]
(push) ; 9
; [then-branch: 11 | Lookup(f, sm@388@01, x1@386@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(declare-const sm@390@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@390@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@390@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef222|)))
(declare-const pm@391@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@391@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@391@01  $FPM) r))
  :qid |qp.resPrmSumDef223|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@391@01  $FPM) x1@386@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 12 | !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01) | live]
; [else-branch: 12 | Lookup(g, sm@390@01, x1@386@01) in xs@375@01 | live]
(push) ; 11
; [then-branch: 12 | !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 13 | x2@387@01 in xs@375@01 | live]
; [else-branch: 13 | !(x2@387@01 in xs@375@01) | live]
(push) ; 13
; [then-branch: 13 | x2@387@01 in xs@375@01]
(assert (Set_in x2@387@01 xs@375@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 14 | !(x2@387@01 in ys@376@01) | live]
; [else-branch: 14 | x2@387@01 in ys@376@01 | live]
(push) ; 15
; [then-branch: 14 | !(x2@387@01 in ys@376@01)]
(assert (not (Set_in x2@387@01 ys@376@01)))
; [eval] x2.f != 0
(declare-const sm@392@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(declare-const pm@393@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(push) ; 16
(assert (not (< $Perm.No ($FVF.perm_f (as pm@393@01  $FPM) x2@387@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 15 | Lookup(f, sm@392@01, x2@387@01) != 0 | live]
; [else-branch: 15 | Lookup(f, sm@392@01, x2@387@01) == 0 | live]
(push) ; 17
; [then-branch: 15 | Lookup(f, sm@392@01, x2@387@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(declare-const sm@394@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(declare-const pm@395@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(push) ; 18
(assert (not (< $Perm.No ($FVF.perm_g (as pm@395@01  $FPM) x2@387@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 16 | !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01) | live]
; [else-branch: 16 | Lookup(g, sm@394@01, x2@387@01) in xs@375@01 | live]
(push) ; 19
; [then-branch: 16 | !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
; [eval] x1 != x2
(pop) ; 19
(push) ; 19
; [else-branch: 16 | Lookup(g, sm@394@01, x2@387@01) in xs@375@01]
(assert (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
  (not (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 15 | Lookup(f, sm@392@01, x2@387@01) == 0]
(assert (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
    (or
      (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
      (not (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 14 | x2@387@01 in ys@376@01]
(assert (Set_in x2@387@01 ys@376@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (not (Set_in x2@387@01 ys@376@01))
  (and
    (not (Set_in x2@387@01 ys@376@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (or
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
    (or
      (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
      (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))))))
; Joined path conditions
(assert (or (Set_in x2@387@01 ys@376@01) (not (Set_in x2@387@01 ys@376@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 13 | !(x2@387@01 in xs@375@01)]
(assert (not (Set_in x2@387@01 xs@375@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (Set_in x2@387@01 xs@375@01)
  (and
    (Set_in x2@387@01 xs@375@01)
    (=>
      (not (Set_in x2@387@01 ys@376@01))
      (and
        (not (Set_in x2@387@01 ys@376@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
            (or
              (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
        (or
          (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
          (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))))
    (or (Set_in x2@387@01 ys@376@01) (not (Set_in x2@387@01 ys@376@01))))))
; Joined path conditions
(assert (or (not (Set_in x2@387@01 xs@375@01)) (Set_in x2@387@01 xs@375@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | Lookup(g, sm@390@01, x1@386@01) in xs@375@01]
(assert (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
  (and
    (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
    (=>
      (Set_in x2@387@01 xs@375@01)
      (and
        (Set_in x2@387@01 xs@375@01)
        (=>
          (not (Set_in x2@387@01 ys@376@01))
          (and
            (not (Set_in x2@387@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
                (or
                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
              (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))))
        (or (Set_in x2@387@01 ys@376@01) (not (Set_in x2@387@01 ys@376@01)))))
    (or (not (Set_in x2@387@01 xs@375@01)) (Set_in x2@387@01 xs@375@01)))))
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
  (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | Lookup(f, sm@388@01, x1@386@01) == 0]
(assert (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@390@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@390@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef222|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@391@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@391@01  $FPM) r))
  :qid |qp.resPrmSumDef223|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
    (=>
      (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
      (and
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (=>
          (Set_in x2@387@01 xs@375@01)
          (and
            (Set_in x2@387@01 xs@375@01)
            (=>
              (not (Set_in x2@387@01 ys@376@01))
              (and
                (not (Set_in x2@387@01 ys@376@01))
                (=>
                  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
                  (and
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
                    (or
                      (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                (or
                  (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
                  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))))
            (or (Set_in x2@387@01 ys@376@01) (not (Set_in x2@387@01 ys@376@01)))))
        (or (not (Set_in x2@387@01 xs@375@01)) (Set_in x2@387@01 xs@375@01))))
    (or
      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
      (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
  (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | x1@386@01 in ys@376@01]
(assert (Set_in x1@386@01 ys@376@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@388@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef220|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@389@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@389@01  $FPM) r))
  :qid |qp.resPrmSumDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@390@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@390@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef222|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@391@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@391@01  $FPM) r))
  :qid |qp.resPrmSumDef223|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (not (Set_in x1@386@01 ys@376@01))
  (and
    (not (Set_in x1@386@01 ys@376@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (=>
          (not
            (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
          (and
            (not
              (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
            (=>
              (Set_in x2@387@01 xs@375@01)
              (and
                (Set_in x2@387@01 xs@375@01)
                (=>
                  (not (Set_in x2@387@01 ys@376@01))
                  (and
                    (not (Set_in x2@387@01 ys@376@01))
                    (=>
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
                      (and
                        (not
                          (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
                        (or
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                          (not
                            (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                    (or
                      (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))))
                (or
                  (Set_in x2@387@01 ys@376@01)
                  (not (Set_in x2@387@01 ys@376@01)))))
            (or (not (Set_in x2@387@01 xs@375@01)) (Set_in x2@387@01 xs@375@01))))
        (or
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
    (or
      (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
      (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))))))
; Joined path conditions
(assert (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(x1@386@01 in xs@375@01)]
(assert (not (Set_in x1@386@01 xs@375@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@388@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef220|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@389@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@389@01  $FPM) r))
  :qid |qp.resPrmSumDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@390@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@390@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef222|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@391@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@391@01  $FPM) r))
  :qid |qp.resPrmSumDef223|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (=>
  (Set_in x1@386@01 xs@375@01)
  (and
    (Set_in x1@386@01 xs@375@01)
    (=>
      (not (Set_in x1@386@01 ys@376@01))
      (and
        (not (Set_in x1@386@01 ys@376@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
            (=>
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                (=>
                  (Set_in x2@387@01 xs@375@01)
                  (and
                    (Set_in x2@387@01 xs@375@01)
                    (=>
                      (not (Set_in x2@387@01 ys@376@01))
                      (and
                        (not (Set_in x2@387@01 ys@376@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0))
                            (or
                              (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                              (not
                                (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                        (or
                          (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)
                          (not
                            (=
                              ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                              0)))))
                    (or
                      (Set_in x2@387@01 ys@376@01)
                      (not (Set_in x2@387@01 ys@376@01)))))
                (or
                  (not (Set_in x2@387@01 xs@375@01))
                  (Set_in x2@387@01 xs@375@01))))
            (or
              (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
        (or
          (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
          (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
    (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01))))))
; Joined path conditions
(assert (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01)))
(push) ; 4
; [then-branch: 17 | x1@386@01 != x2@387@01 && !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01) && Lookup(f, sm@392@01, x2@387@01) != 0 && !(x2@387@01 in ys@376@01) && x2@387@01 in xs@375@01 && !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01) && Lookup(f, sm@388@01, x1@386@01) != 0 && !(x1@386@01 in ys@376@01) && x1@386@01 in xs@375@01 | live]
; [else-branch: 17 | !(x1@386@01 != x2@387@01 && !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01) && Lookup(f, sm@392@01, x2@387@01) != 0 && !(x2@387@01 in ys@376@01) && x2@387@01 in xs@375@01 && !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01) && Lookup(f, sm@388@01, x1@386@01) != 0 && !(x1@386@01 in ys@376@01) && x1@386@01 in xs@375@01) | live]
(push) ; 5
; [then-branch: 17 | x1@386@01 != x2@387@01 && !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01) && Lookup(f, sm@392@01, x2@387@01) != 0 && !(x2@387@01 in ys@376@01) && x2@387@01 in xs@375@01 && !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01) && Lookup(f, sm@388@01, x1@386@01) != 0 && !(x1@386@01 in ys@376@01) && x1@386@01 in xs@375@01]
(assert (and
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (not (= x1@386@01 x2@387@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
            (not (Set_in x2@387@01 ys@376@01)))
          (Set_in x2@387@01 xs@375@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
      (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
    (not (Set_in x1@386@01 ys@376@01)))
  (Set_in x1@386@01 xs@375@01)))
; [eval] x1.g != x2.g
(declare-const sm@396@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@396@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@396@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef228|)))
(declare-const pm@397@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@397@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@397@01  $FPM) r))
  :qid |qp.resPrmSumDef229|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@397@01  $FPM) x1@386@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const sm@398@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@398@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@398@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef230|)))
(declare-const pm@399@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@399@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef231|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@399@01  $FPM) x2@387@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(x1@386@01 != x2@387@01 && !(Lookup(g, sm@394@01, x2@387@01) in xs@375@01) && Lookup(f, sm@392@01, x2@387@01) != 0 && !(x2@387@01 in ys@376@01) && x2@387@01 in xs@375@01 && !(Lookup(g, sm@390@01, x1@386@01) in xs@375@01) && Lookup(f, sm@388@01, x1@386@01) != 0 && !(x1@386@01 in ys@376@01) && x1@386@01 in xs@375@01)]
(assert (not
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@386@01 x2@387@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
              (not (Set_in x2@387@01 ys@376@01)))
            (Set_in x2@387@01 xs@375@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
      (not (Set_in x1@386@01 ys@376@01)))
    (Set_in x1@386@01 xs@375@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@396@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@396@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef228|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@397@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@397@01  $FPM) r))
  :qid |qp.resPrmSumDef229|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@398@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@398@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef230|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@399@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef231|)))
(assert (=>
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@386@01 x2@387@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
              (not (Set_in x2@387@01 ys@376@01)))
            (Set_in x2@387@01 xs@375@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
      (not (Set_in x1@386@01 ys@376@01)))
    (Set_in x1@386@01 xs@375@01))
  (and
    (not (= x1@386@01 x2@387@01))
    (not (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
    (not (Set_in x2@387@01 ys@376@01))
    (Set_in x2@387@01 xs@375@01)
    (not (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
    (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
    (not (Set_in x1@386@01 ys@376@01))
    (Set_in x1@386@01 xs@375@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@386@01 x2@387@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                (not (Set_in x2@387@01 ys@376@01)))
              (Set_in x2@387@01 xs@375@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
          (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
        (not (Set_in x1@386@01 ys@376@01)))
      (Set_in x1@386@01 xs@375@01)))
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@386@01 x2@387@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
              (not (Set_in x2@387@01 ys@376@01)))
            (Set_in x2@387@01 xs@375@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
      (not (Set_in x1@386@01 ys@376@01)))
    (Set_in x1@386@01 xs@375@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@388@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef220|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@389@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@389@01  $FPM) r))
  :qid |qp.resPrmSumDef221|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@390@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@390@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef222|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@391@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@391@01  $FPM) r))
  :qid |qp.resPrmSumDef223|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@392@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@392@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef224|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@393@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@393@01  $FPM) r))
  :qid |qp.resPrmSumDef225|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@394@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@394@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef226|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@395@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@395@01  $FPM) r))
  :qid |qp.resPrmSumDef227|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@396@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@396@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef228|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@397@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@397@01  $FPM) r))
  :qid |qp.resPrmSumDef229|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@398@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@398@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef230|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@399@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@399@01  $FPM) r))
  :qid |qp.resPrmSumDef231|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in x2@387@01 xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in x2@387@01 ys@376@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in x2@387@01 xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in x2@387@01 ys@376@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in x2@387@01 xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in x2@387@01 ys@376@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@386@01 xs@375@01)
      (and
        (Set_in x1@386@01 xs@375@01)
        (=>
          (not (Set_in x1@386@01 ys@376@01))
          (and
            (not (Set_in x1@386@01 ys@376@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
                    (=>
                      (Set_in x2@387@01 xs@375@01)
                      (and
                        (Set_in x2@387@01 xs@375@01)
                        (=>
                          (not (Set_in x2@387@01 ys@376@01))
                          (and
                            (not (Set_in x2@387@01 ys@376@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01)
                                  0)))))
                        (or
                          (Set_in x2@387@01 ys@376@01)
                          (not (Set_in x2@387@01 ys@376@01)))))
                    (or
                      (not (Set_in x2@387@01 xs@375@01))
                      (Set_in x2@387@01 xs@375@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))))
            (or
              (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))))
        (or (Set_in x1@386@01 ys@376@01) (not (Set_in x1@386@01 ys@376@01)))))
    (or (not (Set_in x1@386@01 xs@375@01)) (Set_in x1@386@01 xs@375@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))
      (and
        (not (= x1@386@01 x2@387@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0))
        (not (Set_in x2@387@01 ys@376@01))
        (Set_in x2@387@01 xs@375@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01))
        (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0))
        (not (Set_in x1@386@01 ys@376@01))
        (Set_in x1@386@01 xs@375@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@386@01 x2@387@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                    (not (Set_in x2@387@01 ys@376@01)))
                  (Set_in x2@387@01 xs@375@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
              (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
            (not (Set_in x1@386@01 ys@376@01)))
          (Set_in x1@386@01 xs@375@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@386@01 x2@387@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                    (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                  (not (Set_in x2@387@01 ys@376@01)))
                (Set_in x2@387@01 xs@375@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
            (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
          (not (Set_in x1@386@01 ys@376@01)))
        (Set_in x1@386@01 xs@375@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@386@01 $Ref) (x2@387@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@386@01 x2@387@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01)))
                  (not (= ($FVF.lookup_f (as sm@392@01  $FVF<f>) x2@387@01) 0)))
                (not (Set_in x2@387@01 ys@376@01)))
              (Set_in x2@387@01 xs@375@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01)))
          (not (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) x1@386@01) 0)))
        (not (Set_in x1@386@01 ys@376@01)))
      (Set_in x1@386@01 xs@375@01))
    (not
      (=
        ($FVF.lookup_g (as sm@396@01  $FVF<g>) x1@386@01)
        ($FVF.lookup_g (as sm@398@01  $FVF<g>) x2@387@01))))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in x2@387@01 xs@375@01))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in x2@387@01 ys@376@01))
  :pattern ((Set_in x1@386@01 xs@375@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in x2@387@01 xs@375@01))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in x2@387@01 ys@376@01))
  :pattern ((Set_in x1@386@01 ys@376@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in x2@387@01 xs@375@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in x2@387@01 ys@376@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@390@01  $FVF<g>) x1@386@01) xs@375@01) (Set_in ($FVF.lookup_g (as sm@394@01  $FVF<g>) x2@387@01) xs@375@01))
  :qid |prog.l119|)))
(declare-const x@400@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 18 | x@400@01 in xs@375@01 | live]
; [else-branch: 18 | !(x@400@01 in xs@375@01) | live]
(push) ; 5
; [then-branch: 18 | x@400@01 in xs@375@01]
(assert (Set_in x@400@01 xs@375@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 19 | !(x@400@01 in ys@376@01) | live]
; [else-branch: 19 | x@400@01 in ys@376@01 | live]
(push) ; 7
; [then-branch: 19 | !(x@400@01 in ys@376@01)]
(assert (not (Set_in x@400@01 ys@376@01)))
; [eval] x.f != 0
(declare-const sm@401@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@401@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@401@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef232|)))
(declare-const pm@402@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef233|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@402@01  $FPM) x@400@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 20 | Lookup(f, sm@401@01, x@400@01) != 0 | live]
; [else-branch: 20 | Lookup(f, sm@401@01, x@400@01) == 0 | live]
(push) ; 9
; [then-branch: 20 | Lookup(f, sm@401@01, x@400@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(declare-const sm@403@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@403@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@403@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef234|)))
(declare-const pm@404@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@404@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@404@01  $FPM) r))
  :qid |qp.resPrmSumDef235|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@404@01  $FPM) x@400@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 20 | Lookup(f, sm@401@01, x@400@01) == 0]
(assert (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@403@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@403@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef234|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@404@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@404@01  $FPM) r))
  :qid |qp.resPrmSumDef235|)))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)
  (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | x@400@01 in ys@376@01]
(assert (Set_in x@400@01 ys@376@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@401@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@401@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef232|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef233|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@403@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@403@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef234|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@404@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@404@01  $FPM) r))
  :qid |qp.resPrmSumDef235|)))
(assert (=>
  (not (Set_in x@400@01 ys@376@01))
  (and
    (not (Set_in x@400@01 ys@376@01))
    (or
      (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)
      (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0))))))
; Joined path conditions
(assert (or (Set_in x@400@01 ys@376@01) (not (Set_in x@400@01 ys@376@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(x@400@01 in xs@375@01)]
(assert (not (Set_in x@400@01 xs@375@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@401@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@401@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef232|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef233|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@403@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@403@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef234|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@404@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@404@01  $FPM) r))
  :qid |qp.resPrmSumDef235|)))
(assert (=>
  (Set_in x@400@01 xs@375@01)
  (and
    (Set_in x@400@01 xs@375@01)
    (=>
      (not (Set_in x@400@01 ys@376@01))
      (and
        (not (Set_in x@400@01 ys@376@01))
        (or
          (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))))
    (or (Set_in x@400@01 ys@376@01) (not (Set_in x@400@01 ys@376@01))))))
; Joined path conditions
(assert (or (not (Set_in x@400@01 xs@375@01)) (Set_in x@400@01 xs@375@01)))
(assert (and
  (and
    (and
      (not (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) x@400@01) xs@375@01))
      (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))
    (not (Set_in x@400@01 ys@376@01)))
  (Set_in x@400@01 xs@375@01)))
(declare-const sm@405@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@405@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@405@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef236|)))
(declare-const pm@406@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@406@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@406@01  $FPM) r))
  :qid |qp.resPrmSumDef237|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@406@01  $FPM) x@400@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@407@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@401@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@401@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef232|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@402@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@381@01 r) ys@376@01))
        (Set_in (inv@381@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@402@01  $FPM) r))
  :qid |qp.resPrmSumDef233|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@403@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@403@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef234|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@404@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@404@01  $FPM) r))
  :qid |qp.resPrmSumDef235|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
        (not (Set_in (inv@385@01 r) ys@376@01)))
      (Set_in (inv@385@01 r) xs@375@01))
    (=
      ($FVF.lookup_g (as sm@405@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r)))
  :pattern (($FVF.lookup_g (as sm@405@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@378@01))) r))
  :qid |qp.fvfValDef236|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@406@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@383@01  $FVF<f>) (inv@385@01 r)) 0))
          (not (Set_in (inv@385@01 r) ys@376@01)))
        (Set_in (inv@385@01 r) xs@375@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@406@01  $FPM) r))
  :qid |qp.resPrmSumDef237|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@400@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) x@400@01) xs@375@01))
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))
        (not (Set_in x@400@01 ys@376@01)))
      (Set_in x@400@01 xs@375@01))
    (and
      (=>
        (Set_in x@400@01 xs@375@01)
        (and
          (Set_in x@400@01 xs@375@01)
          (=>
            (not (Set_in x@400@01 ys@376@01))
            (and
              (not (Set_in x@400@01 ys@376@01))
              (or
                (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)
                (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))))
          (or (Set_in x@400@01 ys@376@01) (not (Set_in x@400@01 ys@376@01)))))
      (or (not (Set_in x@400@01 xs@375@01)) (Set_in x@400@01 xs@375@01))))
  :pattern (($FVF.lookup_g (as sm@405@01  $FVF<g>) x@400@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@400@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) x@400@01) xs@375@01))
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))
        (not (Set_in x@400@01 ys@376@01)))
      (Set_in x@400@01 xs@375@01))
    (= (inv@407@01 ($FVF.lookup_g (as sm@405@01  $FVF<g>) x@400@01)) x@400@01))
  :pattern (($FVF.lookup_g (as sm@405@01  $FVF<g>) x@400@01))
  :qid |quant-u-117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) (inv@407@01 r)) xs@375@01))
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) (inv@407@01 r)) 0)))
        (not (Set_in (inv@407@01 r) ys@376@01)))
      (Set_in (inv@407@01 r) xs@375@01))
    (= ($FVF.lookup_g (as sm@405@01  $FVF<g>) (inv@407@01 r)) r))
  :pattern ((inv@407@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@400@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) x@400@01) xs@375@01))
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) x@400@01) 0)))
        (not (Set_in x@400@01 ys@376@01)))
      (Set_in x@400@01 xs@375@01))
    (not (= ($FVF.lookup_g (as sm@405@01  $FVF<g>) x@400@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@405@01  $FVF<g>) x@400@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@378@01 xs@375@01 ys@376@01))
; [exec]
; inhale (x in xs)
(declare-const $t@408@01 $Snap)
(assert (= $t@408@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@377@01 xs@375@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@409@01 $Snap)
(assert (= $t@409@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@377@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@410@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) (inv@407@01 r)) xs@375@01))
          (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) (inv@407@01 r)) 0)))
        (not (Set_in (inv@407@01 r) ys@376@01)))
      (Set_in (inv@407@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@410@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@378@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@410@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@378@01)))) r))
  :qid |qp.fvfValDef238|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@381@01 r) ys@376@01))
      (Set_in (inv@381@01 r) xs@375@01))
    (=
      ($FVF.lookup_f (as sm@410@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r)))
  :pattern (($FVF.lookup_f (as sm@410@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@378@01)) r))
  :qid |qp.fvfValDef239|)))
(declare-const pm@411@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@411@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@403@01  $FVF<g>) (inv@407@01 r)) xs@375@01))
              (not (= ($FVF.lookup_f (as sm@401@01  $FVF<f>) (inv@407@01 r)) 0)))
            (not (Set_in (inv@407@01 r) ys@376@01)))
          (Set_in (inv@407@01 r) xs@375@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@381@01 r) ys@376@01))
          (Set_in (inv@381@01 r) xs@375@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@411@01  $FPM) r))
  :qid |qp.resPrmSumDef240|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@411@01  $FPM) x@377@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@412@01 Set<$Ref>)
(declare-const ys@413@01 Set<$Ref>)
(declare-const x@414@01 $Ref)
(declare-const xs@415@01 Set<$Ref>)
(declare-const ys@416@01 Set<$Ref>)
(declare-const x@417@01 $Ref)
(push) ; 1
(declare-const $t@418@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@419@01 Int)
; [exec]
; var b: Ref
(declare-const b@420@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@418@01 ($Snap.combine ($Snap.first $t@418@01) ($Snap.second $t@418@01))))
(declare-const x@421@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 21 | x@421@01 in xs@415@01 | live]
; [else-branch: 21 | !(x@421@01 in xs@415@01) | live]
(push) ; 5
; [then-branch: 21 | x@421@01 in xs@415@01]
(assert (Set_in x@421@01 xs@415@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(x@421@01 in xs@415@01)]
(assert (not (Set_in x@421@01 xs@415@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@421@01 xs@415@01)) (Set_in x@421@01 xs@415@01)))
(assert (and (not (Set_in x@421@01 ys@416@01)) (Set_in x@421@01 xs@415@01)))
(pop) ; 3
(declare-fun inv@422@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@421@01 $Ref)) (!
  (=>
    (and (not (Set_in x@421@01 ys@416@01)) (Set_in x@421@01 xs@415@01))
    (or (not (Set_in x@421@01 xs@415@01)) (Set_in x@421@01 xs@415@01)))
  :pattern ((Set_in x@421@01 ys@416@01))
  :pattern ((Set_in x@421@01 xs@415@01))
  :pattern ((inv@422@01 x@421@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@421@01 $Ref)) (!
  (=>
    (and (not (Set_in x@421@01 ys@416@01)) (Set_in x@421@01 xs@415@01))
    (= (inv@422@01 x@421@01) x@421@01))
  :pattern ((Set_in x@421@01 ys@416@01))
  :pattern ((Set_in x@421@01 xs@415@01))
  :pattern ((inv@422@01 x@421@01))
  :qid |quant-u-119|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (= (inv@422@01 r) r))
  :pattern ((inv@422@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@421@01 $Ref)) (!
  (=>
    (and (not (Set_in x@421@01 ys@416@01)) (Set_in x@421@01 xs@415@01))
    (not (= x@421@01 $Ref.null)))
  :pattern ((Set_in x@421@01 ys@416@01))
  :pattern ((Set_in x@421@01 xs@415@01))
  :pattern ((inv@422@01 x@421@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@418@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@418@01))
    ($Snap.second ($Snap.second $t@418@01)))))
(declare-const x@423@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 22 | x@423@01 in xs@415@01 | live]
; [else-branch: 22 | !(x@423@01 in xs@415@01) | live]
(push) ; 5
; [then-branch: 22 | x@423@01 in xs@415@01]
(assert (Set_in x@423@01 xs@415@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 23 | !(x@423@01 in ys@416@01) | live]
; [else-branch: 23 | x@423@01 in ys@416@01 | live]
(push) ; 7
; [then-branch: 23 | !(x@423@01 in ys@416@01)]
(assert (not (Set_in x@423@01 ys@416@01)))
; [eval] x.f != 0
(declare-const sm@424@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@424@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef241|)))
(declare-const pm@425@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@425@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@425@01  $FPM) r))
  :qid |qp.resPrmSumDef242|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@425@01  $FPM) x@423@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 23 | x@423@01 in ys@416@01]
(assert (Set_in x@423@01 ys@416@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@424@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef241|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@425@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@425@01  $FPM) r))
  :qid |qp.resPrmSumDef242|)))
; Joined path conditions
(assert (or (Set_in x@423@01 ys@416@01) (not (Set_in x@423@01 ys@416@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(x@423@01 in xs@415@01)]
(assert (not (Set_in x@423@01 xs@415@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@424@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef241|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@425@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@425@01  $FPM) r))
  :qid |qp.resPrmSumDef242|)))
(assert (=>
  (Set_in x@423@01 xs@415@01)
  (and
    (Set_in x@423@01 xs@415@01)
    (or (Set_in x@423@01 ys@416@01) (not (Set_in x@423@01 ys@416@01))))))
; Joined path conditions
(assert (or (not (Set_in x@423@01 xs@415@01)) (Set_in x@423@01 xs@415@01)))
(assert (and
  (and
    (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01) 0))
    (not (Set_in x@423@01 ys@416@01)))
  (Set_in x@423@01 xs@415@01)))
(pop) ; 3
(declare-fun inv@426@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@424@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef241|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@425@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@425@01  $FPM) r))
  :qid |qp.resPrmSumDef242|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@423@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01) 0))
        (not (Set_in x@423@01 ys@416@01)))
      (Set_in x@423@01 xs@415@01))
    (and
      (=>
        (Set_in x@423@01 xs@415@01)
        (and
          (Set_in x@423@01 xs@415@01)
          (or (Set_in x@423@01 ys@416@01) (not (Set_in x@423@01 ys@416@01)))))
      (or (not (Set_in x@423@01 xs@415@01)) (Set_in x@423@01 xs@415@01))))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01))
  :pattern ((Set_in x@423@01 ys@416@01))
  :pattern ((Set_in x@423@01 xs@415@01))
  :pattern ((inv@426@01 x@423@01))
  :qid |g-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@423@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01) 0))
        (not (Set_in x@423@01 ys@416@01)))
      (Set_in x@423@01 xs@415@01))
    (= (inv@426@01 x@423@01) x@423@01))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01))
  :pattern ((Set_in x@423@01 ys@416@01))
  :pattern ((Set_in x@423@01 xs@415@01))
  :pattern ((inv@426@01 x@423@01))
  :qid |quant-u-121|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (= (inv@426@01 r) r))
  :pattern ((inv@426@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@423@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01) 0))
        (not (Set_in x@423@01 ys@416@01)))
      (Set_in x@423@01 xs@415@01))
    (not (= x@423@01 $Ref.null)))
  :pattern (($FVF.lookup_f (as sm@424@01  $FVF<f>) x@423@01))
  :pattern ((Set_in x@423@01 ys@416@01))
  :pattern ((Set_in x@423@01 xs@415@01))
  :pattern ((inv@426@01 x@423@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@418@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@418@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@418@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@418@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@427@01 $Ref)
(declare-const x2@428@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 24 | x1@427@01 in xs@415@01 | live]
; [else-branch: 24 | !(x1@427@01 in xs@415@01) | live]
(push) ; 5
; [then-branch: 24 | x1@427@01 in xs@415@01]
(assert (Set_in x1@427@01 xs@415@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 25 | !(x1@427@01 in ys@416@01) | live]
; [else-branch: 25 | x1@427@01 in ys@416@01 | live]
(push) ; 7
; [then-branch: 25 | !(x1@427@01 in ys@416@01)]
(assert (not (Set_in x1@427@01 ys@416@01)))
; [eval] x1.f != 0
(declare-const sm@429@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@429@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@429@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef243|)))
(declare-const pm@430@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@430@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@430@01  $FPM) r))
  :qid |qp.resPrmSumDef244|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@430@01  $FPM) x1@427@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 26 | Lookup(f, sm@429@01, x1@427@01) != 0 | live]
; [else-branch: 26 | Lookup(f, sm@429@01, x1@427@01) == 0 | live]
(push) ; 9
; [then-branch: 26 | Lookup(f, sm@429@01, x1@427@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(declare-const sm@431@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@431@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@431@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef245|)))
(declare-const pm@432@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@432@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@432@01  $FPM) r))
  :qid |qp.resPrmSumDef246|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@432@01  $FPM) x1@427@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 27 | !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01) | live]
; [else-branch: 27 | Lookup(g, sm@431@01, x1@427@01) in xs@415@01 | live]
(push) ; 11
; [then-branch: 27 | !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 28 | x2@428@01 in xs@415@01 | live]
; [else-branch: 28 | !(x2@428@01 in xs@415@01) | live]
(push) ; 13
; [then-branch: 28 | x2@428@01 in xs@415@01]
(assert (Set_in x2@428@01 xs@415@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 29 | !(x2@428@01 in ys@416@01) | live]
; [else-branch: 29 | x2@428@01 in ys@416@01 | live]
(push) ; 15
; [then-branch: 29 | !(x2@428@01 in ys@416@01)]
(assert (not (Set_in x2@428@01 ys@416@01)))
; [eval] x2.f != 0
(declare-const sm@433@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(declare-const pm@434@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(push) ; 16
(assert (not (< $Perm.No ($FVF.perm_f (as pm@434@01  $FPM) x2@428@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 30 | Lookup(f, sm@433@01, x2@428@01) != 0 | live]
; [else-branch: 30 | Lookup(f, sm@433@01, x2@428@01) == 0 | live]
(push) ; 17
; [then-branch: 30 | Lookup(f, sm@433@01, x2@428@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(declare-const sm@435@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(declare-const pm@436@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(push) ; 18
(assert (not (< $Perm.No ($FVF.perm_g (as pm@436@01  $FPM) x2@428@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 31 | !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01) | live]
; [else-branch: 31 | Lookup(g, sm@435@01, x2@428@01) in xs@415@01 | live]
(push) ; 19
; [then-branch: 31 | !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
; [eval] x1 != x2
(pop) ; 19
(push) ; 19
; [else-branch: 31 | Lookup(g, sm@435@01, x2@428@01) in xs@415@01]
(assert (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
  (not (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 30 | Lookup(f, sm@433@01, x2@428@01) == 0]
(assert (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
    (or
      (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
      (not (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 29 | x2@428@01 in ys@416@01]
(assert (Set_in x2@428@01 ys@416@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (not (Set_in x2@428@01 ys@416@01))
  (and
    (not (Set_in x2@428@01 ys@416@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (or
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
    (or
      (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
      (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))))))
; Joined path conditions
(assert (or (Set_in x2@428@01 ys@416@01) (not (Set_in x2@428@01 ys@416@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 28 | !(x2@428@01 in xs@415@01)]
(assert (not (Set_in x2@428@01 xs@415@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (Set_in x2@428@01 xs@415@01)
  (and
    (Set_in x2@428@01 xs@415@01)
    (=>
      (not (Set_in x2@428@01 ys@416@01))
      (and
        (not (Set_in x2@428@01 ys@416@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
            (or
              (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
        (or
          (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
          (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))))
    (or (Set_in x2@428@01 ys@416@01) (not (Set_in x2@428@01 ys@416@01))))))
; Joined path conditions
(assert (or (not (Set_in x2@428@01 xs@415@01)) (Set_in x2@428@01 xs@415@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 27 | Lookup(g, sm@431@01, x1@427@01) in xs@415@01]
(assert (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
  (and
    (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
    (=>
      (Set_in x2@428@01 xs@415@01)
      (and
        (Set_in x2@428@01 xs@415@01)
        (=>
          (not (Set_in x2@428@01 ys@416@01))
          (and
            (not (Set_in x2@428@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
                (or
                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
              (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))))
        (or (Set_in x2@428@01 ys@416@01) (not (Set_in x2@428@01 ys@416@01)))))
    (or (not (Set_in x2@428@01 xs@415@01)) (Set_in x2@428@01 xs@415@01)))))
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
  (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | Lookup(f, sm@429@01, x1@427@01) == 0]
(assert (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@431@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@431@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef245|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@432@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@432@01  $FPM) r))
  :qid |qp.resPrmSumDef246|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
    (=>
      (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
      (and
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (=>
          (Set_in x2@428@01 xs@415@01)
          (and
            (Set_in x2@428@01 xs@415@01)
            (=>
              (not (Set_in x2@428@01 ys@416@01))
              (and
                (not (Set_in x2@428@01 ys@416@01))
                (=>
                  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
                  (and
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
                    (or
                      (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                (or
                  (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
                  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))))
            (or (Set_in x2@428@01 ys@416@01) (not (Set_in x2@428@01 ys@416@01)))))
        (or (not (Set_in x2@428@01 xs@415@01)) (Set_in x2@428@01 xs@415@01))))
    (or
      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
      (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
  (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | x1@427@01 in ys@416@01]
(assert (Set_in x1@427@01 ys@416@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@429@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@429@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef243|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@430@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@430@01  $FPM) r))
  :qid |qp.resPrmSumDef244|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@431@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@431@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef245|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@432@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@432@01  $FPM) r))
  :qid |qp.resPrmSumDef246|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (not (Set_in x1@427@01 ys@416@01))
  (and
    (not (Set_in x1@427@01 ys@416@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (=>
          (not
            (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
          (and
            (not
              (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
            (=>
              (Set_in x2@428@01 xs@415@01)
              (and
                (Set_in x2@428@01 xs@415@01)
                (=>
                  (not (Set_in x2@428@01 ys@416@01))
                  (and
                    (not (Set_in x2@428@01 ys@416@01))
                    (=>
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
                      (and
                        (not
                          (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
                        (or
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                          (not
                            (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                    (or
                      (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))))
                (or
                  (Set_in x2@428@01 ys@416@01)
                  (not (Set_in x2@428@01 ys@416@01)))))
            (or (not (Set_in x2@428@01 xs@415@01)) (Set_in x2@428@01 xs@415@01))))
        (or
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
    (or
      (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
      (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))))))
; Joined path conditions
(assert (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(x1@427@01 in xs@415@01)]
(assert (not (Set_in x1@427@01 xs@415@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@429@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@429@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef243|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@430@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@430@01  $FPM) r))
  :qid |qp.resPrmSumDef244|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@431@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@431@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef245|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@432@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@432@01  $FPM) r))
  :qid |qp.resPrmSumDef246|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (=>
  (Set_in x1@427@01 xs@415@01)
  (and
    (Set_in x1@427@01 xs@415@01)
    (=>
      (not (Set_in x1@427@01 ys@416@01))
      (and
        (not (Set_in x1@427@01 ys@416@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
            (=>
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                (=>
                  (Set_in x2@428@01 xs@415@01)
                  (and
                    (Set_in x2@428@01 xs@415@01)
                    (=>
                      (not (Set_in x2@428@01 ys@416@01))
                      (and
                        (not (Set_in x2@428@01 ys@416@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0))
                            (or
                              (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                              (not
                                (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                        (or
                          (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)
                          (not
                            (=
                              ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                              0)))))
                    (or
                      (Set_in x2@428@01 ys@416@01)
                      (not (Set_in x2@428@01 ys@416@01)))))
                (or
                  (not (Set_in x2@428@01 xs@415@01))
                  (Set_in x2@428@01 xs@415@01))))
            (or
              (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
        (or
          (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
          (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
    (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01))))))
; Joined path conditions
(assert (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01)))
(push) ; 4
; [then-branch: 32 | x1@427@01 != x2@428@01 && !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01) && Lookup(f, sm@433@01, x2@428@01) != 0 && !(x2@428@01 in ys@416@01) && x2@428@01 in xs@415@01 && !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01) && Lookup(f, sm@429@01, x1@427@01) != 0 && !(x1@427@01 in ys@416@01) && x1@427@01 in xs@415@01 | live]
; [else-branch: 32 | !(x1@427@01 != x2@428@01 && !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01) && Lookup(f, sm@433@01, x2@428@01) != 0 && !(x2@428@01 in ys@416@01) && x2@428@01 in xs@415@01 && !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01) && Lookup(f, sm@429@01, x1@427@01) != 0 && !(x1@427@01 in ys@416@01) && x1@427@01 in xs@415@01) | live]
(push) ; 5
; [then-branch: 32 | x1@427@01 != x2@428@01 && !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01) && Lookup(f, sm@433@01, x2@428@01) != 0 && !(x2@428@01 in ys@416@01) && x2@428@01 in xs@415@01 && !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01) && Lookup(f, sm@429@01, x1@427@01) != 0 && !(x1@427@01 in ys@416@01) && x1@427@01 in xs@415@01]
(assert (and
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (not (= x1@427@01 x2@428@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
            (not (Set_in x2@428@01 ys@416@01)))
          (Set_in x2@428@01 xs@415@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
      (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
    (not (Set_in x1@427@01 ys@416@01)))
  (Set_in x1@427@01 xs@415@01)))
; [eval] x1.g != x2.g
(declare-const sm@437@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@437@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@437@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef251|)))
(declare-const pm@438@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@438@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@438@01  $FPM) r))
  :qid |qp.resPrmSumDef252|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@438@01  $FPM) x1@427@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const sm@439@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@439@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@439@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef253|)))
(declare-const pm@440@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@440@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@440@01  $FPM) r))
  :qid |qp.resPrmSumDef254|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@440@01  $FPM) x2@428@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(x1@427@01 != x2@428@01 && !(Lookup(g, sm@435@01, x2@428@01) in xs@415@01) && Lookup(f, sm@433@01, x2@428@01) != 0 && !(x2@428@01 in ys@416@01) && x2@428@01 in xs@415@01 && !(Lookup(g, sm@431@01, x1@427@01) in xs@415@01) && Lookup(f, sm@429@01, x1@427@01) != 0 && !(x1@427@01 in ys@416@01) && x1@427@01 in xs@415@01)]
(assert (not
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@427@01 x2@428@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
              (not (Set_in x2@428@01 ys@416@01)))
            (Set_in x2@428@01 xs@415@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
      (not (Set_in x1@427@01 ys@416@01)))
    (Set_in x1@427@01 xs@415@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@437@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@437@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef251|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@438@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@438@01  $FPM) r))
  :qid |qp.resPrmSumDef252|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@439@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@439@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef253|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@440@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@440@01  $FPM) r))
  :qid |qp.resPrmSumDef254|)))
(assert (=>
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@427@01 x2@428@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
              (not (Set_in x2@428@01 ys@416@01)))
            (Set_in x2@428@01 xs@415@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
      (not (Set_in x1@427@01 ys@416@01)))
    (Set_in x1@427@01 xs@415@01))
  (and
    (not (= x1@427@01 x2@428@01))
    (not (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
    (not (Set_in x2@428@01 ys@416@01))
    (Set_in x2@428@01 xs@415@01)
    (not (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
    (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
    (not (Set_in x1@427@01 ys@416@01))
    (Set_in x1@427@01 xs@415@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@427@01 x2@428@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                (not (Set_in x2@428@01 ys@416@01)))
              (Set_in x2@428@01 xs@415@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
          (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
        (not (Set_in x1@427@01 ys@416@01)))
      (Set_in x1@427@01 xs@415@01)))
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@427@01 x2@428@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
              (not (Set_in x2@428@01 ys@416@01)))
            (Set_in x2@428@01 xs@415@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
      (not (Set_in x1@427@01 ys@416@01)))
    (Set_in x1@427@01 xs@415@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@429@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@429@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef243|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@430@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@430@01  $FPM) r))
  :qid |qp.resPrmSumDef244|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@431@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@431@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef245|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@432@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@432@01  $FPM) r))
  :qid |qp.resPrmSumDef246|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@433@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@433@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef247|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@434@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@434@01  $FPM) r))
  :qid |qp.resPrmSumDef248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@435@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@435@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef249|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@436@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@436@01  $FPM) r))
  :qid |qp.resPrmSumDef250|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@437@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@437@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef251|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@438@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@438@01  $FPM) r))
  :qid |qp.resPrmSumDef252|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@439@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@439@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef253|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@440@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@440@01  $FPM) r))
  :qid |qp.resPrmSumDef254|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in x2@428@01 xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in x2@428@01 ys@416@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in x2@428@01 xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in x2@428@01 ys@416@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in x2@428@01 xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in x2@428@01 ys@416@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@427@01 xs@415@01)
      (and
        (Set_in x1@427@01 xs@415@01)
        (=>
          (not (Set_in x1@427@01 ys@416@01))
          (and
            (not (Set_in x1@427@01 ys@416@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
                    (=>
                      (Set_in x2@428@01 xs@415@01)
                      (and
                        (Set_in x2@428@01 xs@415@01)
                        (=>
                          (not (Set_in x2@428@01 ys@416@01))
                          (and
                            (not (Set_in x2@428@01 ys@416@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01)
                                  0)))))
                        (or
                          (Set_in x2@428@01 ys@416@01)
                          (not (Set_in x2@428@01 ys@416@01)))))
                    (or
                      (not (Set_in x2@428@01 xs@415@01))
                      (Set_in x2@428@01 xs@415@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))))
            (or
              (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))))
        (or (Set_in x1@427@01 ys@416@01) (not (Set_in x1@427@01 ys@416@01)))))
    (or (not (Set_in x1@427@01 xs@415@01)) (Set_in x1@427@01 xs@415@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))
      (and
        (not (= x1@427@01 x2@428@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0))
        (not (Set_in x2@428@01 ys@416@01))
        (Set_in x2@428@01 xs@415@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01))
        (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0))
        (not (Set_in x1@427@01 ys@416@01))
        (Set_in x1@427@01 xs@415@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@427@01 x2@428@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                    (not (Set_in x2@428@01 ys@416@01)))
                  (Set_in x2@428@01 xs@415@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
              (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
            (not (Set_in x1@427@01 ys@416@01)))
          (Set_in x1@427@01 xs@415@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@427@01 x2@428@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                    (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                  (not (Set_in x2@428@01 ys@416@01)))
                (Set_in x2@428@01 xs@415@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
            (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
          (not (Set_in x1@427@01 ys@416@01)))
        (Set_in x1@427@01 xs@415@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@427@01 $Ref) (x2@428@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@427@01 x2@428@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01)))
                  (not (= ($FVF.lookup_f (as sm@433@01  $FVF<f>) x2@428@01) 0)))
                (not (Set_in x2@428@01 ys@416@01)))
              (Set_in x2@428@01 xs@415@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01)))
          (not (= ($FVF.lookup_f (as sm@429@01  $FVF<f>) x1@427@01) 0)))
        (not (Set_in x1@427@01 ys@416@01)))
      (Set_in x1@427@01 xs@415@01))
    (not
      (=
        ($FVF.lookup_g (as sm@437@01  $FVF<g>) x1@427@01)
        ($FVF.lookup_g (as sm@439@01  $FVF<g>) x2@428@01))))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in x2@428@01 xs@415@01))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in x2@428@01 ys@416@01))
  :pattern ((Set_in x1@427@01 xs@415@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in x2@428@01 xs@415@01))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in x2@428@01 ys@416@01))
  :pattern ((Set_in x1@427@01 ys@416@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in x2@428@01 xs@415@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in x2@428@01 ys@416@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@431@01  $FVF<g>) x1@427@01) xs@415@01) (Set_in ($FVF.lookup_g (as sm@435@01  $FVF<g>) x2@428@01) xs@415@01))
  :qid |prog.l119|)))
(declare-const x@441@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 33 | x@441@01 in xs@415@01 | live]
; [else-branch: 33 | !(x@441@01 in xs@415@01) | live]
(push) ; 5
; [then-branch: 33 | x@441@01 in xs@415@01]
(assert (Set_in x@441@01 xs@415@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 34 | !(x@441@01 in ys@416@01) | live]
; [else-branch: 34 | x@441@01 in ys@416@01 | live]
(push) ; 7
; [then-branch: 34 | !(x@441@01 in ys@416@01)]
(assert (not (Set_in x@441@01 ys@416@01)))
; [eval] x.f != 0
(declare-const sm@442@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@442@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@442@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef255|)))
(declare-const pm@443@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@443@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@443@01  $FPM) r))
  :qid |qp.resPrmSumDef256|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@443@01  $FPM) x@441@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 35 | Lookup(f, sm@442@01, x@441@01) != 0 | live]
; [else-branch: 35 | Lookup(f, sm@442@01, x@441@01) == 0 | live]
(push) ; 9
; [then-branch: 35 | Lookup(f, sm@442@01, x@441@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(declare-const sm@444@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@444@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@444@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef257|)))
(declare-const pm@445@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@445@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@445@01  $FPM) r))
  :qid |qp.resPrmSumDef258|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@445@01  $FPM) x@441@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 35 | Lookup(f, sm@442@01, x@441@01) == 0]
(assert (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@444@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@444@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef257|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@445@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@445@01  $FPM) r))
  :qid |qp.resPrmSumDef258|)))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)
  (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | x@441@01 in ys@416@01]
(assert (Set_in x@441@01 ys@416@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@442@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@442@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef255|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@443@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@443@01  $FPM) r))
  :qid |qp.resPrmSumDef256|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@444@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@444@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef257|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@445@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@445@01  $FPM) r))
  :qid |qp.resPrmSumDef258|)))
(assert (=>
  (not (Set_in x@441@01 ys@416@01))
  (and
    (not (Set_in x@441@01 ys@416@01))
    (or
      (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)
      (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0))))))
; Joined path conditions
(assert (or (Set_in x@441@01 ys@416@01) (not (Set_in x@441@01 ys@416@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | !(x@441@01 in xs@415@01)]
(assert (not (Set_in x@441@01 xs@415@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@442@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@442@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef255|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@443@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@443@01  $FPM) r))
  :qid |qp.resPrmSumDef256|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@444@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@444@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef257|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@445@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@445@01  $FPM) r))
  :qid |qp.resPrmSumDef258|)))
(assert (=>
  (Set_in x@441@01 xs@415@01)
  (and
    (Set_in x@441@01 xs@415@01)
    (=>
      (not (Set_in x@441@01 ys@416@01))
      (and
        (not (Set_in x@441@01 ys@416@01))
        (or
          (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))))
    (or (Set_in x@441@01 ys@416@01) (not (Set_in x@441@01 ys@416@01))))))
; Joined path conditions
(assert (or (not (Set_in x@441@01 xs@415@01)) (Set_in x@441@01 xs@415@01)))
(assert (and
  (and
    (and
      (not (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) x@441@01) xs@415@01))
      (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))
    (not (Set_in x@441@01 ys@416@01)))
  (Set_in x@441@01 xs@415@01)))
(declare-const sm@446@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@446@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@446@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef259|)))
(declare-const pm@447@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@447@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@447@01  $FPM) r))
  :qid |qp.resPrmSumDef260|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@447@01  $FPM) x@441@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@448@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@442@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@442@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef255|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@443@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@422@01 r) ys@416@01))
        (Set_in (inv@422@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@443@01  $FPM) r))
  :qid |qp.resPrmSumDef256|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@444@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@444@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef257|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@445@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@445@01  $FPM) r))
  :qid |qp.resPrmSumDef258|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@446@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@446@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef259|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@447@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@447@01  $FPM) r))
  :qid |qp.resPrmSumDef260|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@441@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) x@441@01) xs@415@01))
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))
        (not (Set_in x@441@01 ys@416@01)))
      (Set_in x@441@01 xs@415@01))
    (and
      (=>
        (Set_in x@441@01 xs@415@01)
        (and
          (Set_in x@441@01 xs@415@01)
          (=>
            (not (Set_in x@441@01 ys@416@01))
            (and
              (not (Set_in x@441@01 ys@416@01))
              (or
                (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)
                (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))))
          (or (Set_in x@441@01 ys@416@01) (not (Set_in x@441@01 ys@416@01)))))
      (or (not (Set_in x@441@01 xs@415@01)) (Set_in x@441@01 xs@415@01))))
  :pattern (($FVF.lookup_g (as sm@446@01  $FVF<g>) x@441@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@441@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) x@441@01) xs@415@01))
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))
        (not (Set_in x@441@01 ys@416@01)))
      (Set_in x@441@01 xs@415@01))
    (= (inv@448@01 ($FVF.lookup_g (as sm@446@01  $FVF<g>) x@441@01)) x@441@01))
  :pattern (($FVF.lookup_g (as sm@446@01  $FVF<g>) x@441@01))
  :qid |quant-u-123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) (inv@448@01 r)) xs@415@01))
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) (inv@448@01 r)) 0)))
        (not (Set_in (inv@448@01 r) ys@416@01)))
      (Set_in (inv@448@01 r) xs@415@01))
    (= ($FVF.lookup_g (as sm@446@01  $FVF<g>) (inv@448@01 r)) r))
  :pattern ((inv@448@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@441@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) x@441@01) xs@415@01))
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) x@441@01) 0)))
        (not (Set_in x@441@01 ys@416@01)))
      (Set_in x@441@01 xs@415@01))
    (not (= ($FVF.lookup_g (as sm@446@01  $FVF<g>) x@441@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@446@01  $FVF<g>) x@441@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@418@01 xs@415@01 ys@416@01))
; [exec]
; inhale (x in xs)
(declare-const $t@449@01 $Snap)
(assert (= $t@449@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@417@01 xs@415@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@450@01 $Snap)
(assert (= $t@450@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@417@01 ys@416@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@451@01 $Snap)
(assert (= $t@451@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@417@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@452@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) (inv@448@01 r)) xs@415@01))
          (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) (inv@448@01 r)) 0)))
        (not (Set_in (inv@448@01 r) ys@416@01)))
      (Set_in (inv@448@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@452@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@418@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@452@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@418@01)))) r))
  :qid |qp.fvfValDef261|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@422@01 r) ys@416@01))
      (Set_in (inv@422@01 r) xs@415@01))
    (=
      ($FVF.lookup_f (as sm@452@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r)))
  :pattern (($FVF.lookup_f (as sm@452@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@418@01)) r))
  :qid |qp.fvfValDef262|)))
(declare-const pm@453@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@453@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@444@01  $FVF<g>) (inv@448@01 r)) xs@415@01))
              (not (= ($FVF.lookup_f (as sm@442@01  $FVF<f>) (inv@448@01 r)) 0)))
            (not (Set_in (inv@448@01 r) ys@416@01)))
          (Set_in (inv@448@01 r) xs@415@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@422@01 r) ys@416@01))
          (Set_in (inv@422@01 r) xs@415@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@453@01  $FPM) r))
  :qid |qp.resPrmSumDef263|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@453@01  $FPM) x@417@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@454@01 Int)
(assert (= a@454@01 ($FVF.lookup_f (as sm@452@01  $FVF<f>) x@417@01)))
; [exec]
; b := x.g
(declare-const sm@455@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
        (not (Set_in (inv@426@01 r) ys@416@01)))
      (Set_in (inv@426@01 r) xs@415@01))
    (=
      ($FVF.lookup_g (as sm@455@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r)))
  :pattern (($FVF.lookup_g (as sm@455@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@418@01))) r))
  :qid |qp.fvfValDef264|)))
(declare-const pm@456@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@456@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@424@01  $FVF<f>) (inv@426@01 r)) 0))
          (not (Set_in (inv@426@01 r) ys@416@01)))
        (Set_in (inv@426@01 r) xs@415@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@456@01  $FPM) r))
  :qid |qp.resPrmSumDef265|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@456@01  $FPM) x@417@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@457@01 Set<$Ref>)
(declare-const ys@458@01 Set<$Ref>)
(declare-const x@459@01 $Ref)
(declare-const xs@460@01 Set<$Ref>)
(declare-const ys@461@01 Set<$Ref>)
(declare-const x@462@01 $Ref)
(push) ; 1
(declare-const $t@463@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@464@01 Int)
; [exec]
; var b: Ref
(declare-const b@465@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@463@01 ($Snap.combine ($Snap.first $t@463@01) ($Snap.second $t@463@01))))
(declare-const x@466@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 36 | x@466@01 in xs@460@01 | live]
; [else-branch: 36 | !(x@466@01 in xs@460@01) | live]
(push) ; 5
; [then-branch: 36 | x@466@01 in xs@460@01]
(assert (Set_in x@466@01 xs@460@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(push) ; 5
; [else-branch: 36 | !(x@466@01 in xs@460@01)]
(assert (not (Set_in x@466@01 xs@460@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@466@01 xs@460@01)) (Set_in x@466@01 xs@460@01)))
(assert (and (not (Set_in x@466@01 ys@461@01)) (Set_in x@466@01 xs@460@01)))
(pop) ; 3
(declare-fun inv@467@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@466@01 $Ref)) (!
  (=>
    (and (not (Set_in x@466@01 ys@461@01)) (Set_in x@466@01 xs@460@01))
    (or (not (Set_in x@466@01 xs@460@01)) (Set_in x@466@01 xs@460@01)))
  :pattern ((Set_in x@466@01 ys@461@01))
  :pattern ((Set_in x@466@01 xs@460@01))
  :pattern ((inv@467@01 x@466@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@466@01 $Ref)) (!
  (=>
    (and (not (Set_in x@466@01 ys@461@01)) (Set_in x@466@01 xs@460@01))
    (= (inv@467@01 x@466@01) x@466@01))
  :pattern ((Set_in x@466@01 ys@461@01))
  :pattern ((Set_in x@466@01 xs@460@01))
  :pattern ((inv@467@01 x@466@01))
  :qid |quant-u-125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (= (inv@467@01 r) r))
  :pattern ((inv@467@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@466@01 $Ref)) (!
  (=>
    (and (not (Set_in x@466@01 ys@461@01)) (Set_in x@466@01 xs@460@01))
    (not (= x@466@01 $Ref.null)))
  :pattern ((Set_in x@466@01 ys@461@01))
  :pattern ((Set_in x@466@01 xs@460@01))
  :pattern ((inv@467@01 x@466@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@463@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@463@01))
    ($Snap.second ($Snap.second $t@463@01)))))
(declare-const x@468@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 37 | x@468@01 in xs@460@01 | live]
; [else-branch: 37 | !(x@468@01 in xs@460@01) | live]
(push) ; 5
; [then-branch: 37 | x@468@01 in xs@460@01]
(assert (Set_in x@468@01 xs@460@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 38 | !(x@468@01 in ys@461@01) | live]
; [else-branch: 38 | x@468@01 in ys@461@01 | live]
(push) ; 7
; [then-branch: 38 | !(x@468@01 in ys@461@01)]
(assert (not (Set_in x@468@01 ys@461@01)))
; [eval] x.f != 0
(declare-const sm@469@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@469@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef266|)))
(declare-const pm@470@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@470@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@470@01  $FPM) r))
  :qid |qp.resPrmSumDef267|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@470@01  $FPM) x@468@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 38 | x@468@01 in ys@461@01]
(assert (Set_in x@468@01 ys@461@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@469@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef266|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@470@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@470@01  $FPM) r))
  :qid |qp.resPrmSumDef267|)))
; Joined path conditions
(assert (or (Set_in x@468@01 ys@461@01) (not (Set_in x@468@01 ys@461@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 37 | !(x@468@01 in xs@460@01)]
(assert (not (Set_in x@468@01 xs@460@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@469@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef266|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@470@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@470@01  $FPM) r))
  :qid |qp.resPrmSumDef267|)))
(assert (=>
  (Set_in x@468@01 xs@460@01)
  (and
    (Set_in x@468@01 xs@460@01)
    (or (Set_in x@468@01 ys@461@01) (not (Set_in x@468@01 ys@461@01))))))
; Joined path conditions
(assert (or (not (Set_in x@468@01 xs@460@01)) (Set_in x@468@01 xs@460@01)))
(assert (and
  (and
    (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01) 0))
    (not (Set_in x@468@01 ys@461@01)))
  (Set_in x@468@01 xs@460@01)))
(pop) ; 3
(declare-fun inv@471@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@469@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef266|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@470@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@470@01  $FPM) r))
  :qid |qp.resPrmSumDef267|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@468@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01) 0))
        (not (Set_in x@468@01 ys@461@01)))
      (Set_in x@468@01 xs@460@01))
    (and
      (=>
        (Set_in x@468@01 xs@460@01)
        (and
          (Set_in x@468@01 xs@460@01)
          (or (Set_in x@468@01 ys@461@01) (not (Set_in x@468@01 ys@461@01)))))
      (or (not (Set_in x@468@01 xs@460@01)) (Set_in x@468@01 xs@460@01))))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01))
  :pattern ((Set_in x@468@01 ys@461@01))
  :pattern ((Set_in x@468@01 xs@460@01))
  :pattern ((inv@471@01 x@468@01))
  :qid |g-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@468@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01) 0))
        (not (Set_in x@468@01 ys@461@01)))
      (Set_in x@468@01 xs@460@01))
    (= (inv@471@01 x@468@01) x@468@01))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01))
  :pattern ((Set_in x@468@01 ys@461@01))
  :pattern ((Set_in x@468@01 xs@460@01))
  :pattern ((inv@471@01 x@468@01))
  :qid |quant-u-127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (= (inv@471@01 r) r))
  :pattern ((inv@471@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@468@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01) 0))
        (not (Set_in x@468@01 ys@461@01)))
      (Set_in x@468@01 xs@460@01))
    (not (= x@468@01 $Ref.null)))
  :pattern (($FVF.lookup_f (as sm@469@01  $FVF<f>) x@468@01))
  :pattern ((Set_in x@468@01 ys@461@01))
  :pattern ((Set_in x@468@01 xs@460@01))
  :pattern ((inv@471@01 x@468@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@463@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@463@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@463@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@463@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@472@01 $Ref)
(declare-const x2@473@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 39 | x1@472@01 in xs@460@01 | live]
; [else-branch: 39 | !(x1@472@01 in xs@460@01) | live]
(push) ; 5
; [then-branch: 39 | x1@472@01 in xs@460@01]
(assert (Set_in x1@472@01 xs@460@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 40 | !(x1@472@01 in ys@461@01) | live]
; [else-branch: 40 | x1@472@01 in ys@461@01 | live]
(push) ; 7
; [then-branch: 40 | !(x1@472@01 in ys@461@01)]
(assert (not (Set_in x1@472@01 ys@461@01)))
; [eval] x1.f != 0
(declare-const sm@474@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@474@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@474@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef268|)))
(declare-const pm@475@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@475@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@475@01  $FPM) r))
  :qid |qp.resPrmSumDef269|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@475@01  $FPM) x1@472@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 41 | Lookup(f, sm@474@01, x1@472@01) != 0 | live]
; [else-branch: 41 | Lookup(f, sm@474@01, x1@472@01) == 0 | live]
(push) ; 9
; [then-branch: 41 | Lookup(f, sm@474@01, x1@472@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(declare-const sm@476@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@476@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@476@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef270|)))
(declare-const pm@477@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@477@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@477@01  $FPM) r))
  :qid |qp.resPrmSumDef271|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@477@01  $FPM) x1@472@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 42 | !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01) | live]
; [else-branch: 42 | Lookup(g, sm@476@01, x1@472@01) in xs@460@01 | live]
(push) ; 11
; [then-branch: 42 | !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 43 | x2@473@01 in xs@460@01 | live]
; [else-branch: 43 | !(x2@473@01 in xs@460@01) | live]
(push) ; 13
; [then-branch: 43 | x2@473@01 in xs@460@01]
(assert (Set_in x2@473@01 xs@460@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 44 | !(x2@473@01 in ys@461@01) | live]
; [else-branch: 44 | x2@473@01 in ys@461@01 | live]
(push) ; 15
; [then-branch: 44 | !(x2@473@01 in ys@461@01)]
(assert (not (Set_in x2@473@01 ys@461@01)))
; [eval] x2.f != 0
(declare-const sm@478@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(declare-const pm@479@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(push) ; 16
(assert (not (< $Perm.No ($FVF.perm_f (as pm@479@01  $FPM) x2@473@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 45 | Lookup(f, sm@478@01, x2@473@01) != 0 | live]
; [else-branch: 45 | Lookup(f, sm@478@01, x2@473@01) == 0 | live]
(push) ; 17
; [then-branch: 45 | Lookup(f, sm@478@01, x2@473@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(declare-const sm@480@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(declare-const pm@481@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(push) ; 18
(assert (not (< $Perm.No ($FVF.perm_g (as pm@481@01  $FPM) x2@473@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 46 | !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01) | live]
; [else-branch: 46 | Lookup(g, sm@480@01, x2@473@01) in xs@460@01 | live]
(push) ; 19
; [then-branch: 46 | !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
; [eval] x1 != x2
(pop) ; 19
(push) ; 19
; [else-branch: 46 | Lookup(g, sm@480@01, x2@473@01) in xs@460@01]
(assert (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
  (not (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 45 | Lookup(f, sm@478@01, x2@473@01) == 0]
(assert (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
    (or
      (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
      (not (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 44 | x2@473@01 in ys@461@01]
(assert (Set_in x2@473@01 ys@461@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (not (Set_in x2@473@01 ys@461@01))
  (and
    (not (Set_in x2@473@01 ys@461@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (or
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
    (or
      (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
      (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))))))
; Joined path conditions
(assert (or (Set_in x2@473@01 ys@461@01) (not (Set_in x2@473@01 ys@461@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 43 | !(x2@473@01 in xs@460@01)]
(assert (not (Set_in x2@473@01 xs@460@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (Set_in x2@473@01 xs@460@01)
  (and
    (Set_in x2@473@01 xs@460@01)
    (=>
      (not (Set_in x2@473@01 ys@461@01))
      (and
        (not (Set_in x2@473@01 ys@461@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
            (or
              (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
        (or
          (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
          (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))))
    (or (Set_in x2@473@01 ys@461@01) (not (Set_in x2@473@01 ys@461@01))))))
; Joined path conditions
(assert (or (not (Set_in x2@473@01 xs@460@01)) (Set_in x2@473@01 xs@460@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 42 | Lookup(g, sm@476@01, x1@472@01) in xs@460@01]
(assert (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
  (and
    (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
    (=>
      (Set_in x2@473@01 xs@460@01)
      (and
        (Set_in x2@473@01 xs@460@01)
        (=>
          (not (Set_in x2@473@01 ys@461@01))
          (and
            (not (Set_in x2@473@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
                (or
                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
              (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))))
        (or (Set_in x2@473@01 ys@461@01) (not (Set_in x2@473@01 ys@461@01)))))
    (or (not (Set_in x2@473@01 xs@460@01)) (Set_in x2@473@01 xs@460@01)))))
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
  (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 41 | Lookup(f, sm@474@01, x1@472@01) == 0]
(assert (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@476@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@476@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef270|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@477@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@477@01  $FPM) r))
  :qid |qp.resPrmSumDef271|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
    (=>
      (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
      (and
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (=>
          (Set_in x2@473@01 xs@460@01)
          (and
            (Set_in x2@473@01 xs@460@01)
            (=>
              (not (Set_in x2@473@01 ys@461@01))
              (and
                (not (Set_in x2@473@01 ys@461@01))
                (=>
                  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
                  (and
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
                    (or
                      (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                (or
                  (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
                  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))))
            (or (Set_in x2@473@01 ys@461@01) (not (Set_in x2@473@01 ys@461@01)))))
        (or (not (Set_in x2@473@01 xs@460@01)) (Set_in x2@473@01 xs@460@01))))
    (or
      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
      (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
  (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | x1@472@01 in ys@461@01]
(assert (Set_in x1@472@01 ys@461@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@474@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@474@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef268|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@475@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@475@01  $FPM) r))
  :qid |qp.resPrmSumDef269|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@476@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@476@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef270|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@477@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@477@01  $FPM) r))
  :qid |qp.resPrmSumDef271|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (not (Set_in x1@472@01 ys@461@01))
  (and
    (not (Set_in x1@472@01 ys@461@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (=>
          (not
            (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
          (and
            (not
              (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
            (=>
              (Set_in x2@473@01 xs@460@01)
              (and
                (Set_in x2@473@01 xs@460@01)
                (=>
                  (not (Set_in x2@473@01 ys@461@01))
                  (and
                    (not (Set_in x2@473@01 ys@461@01))
                    (=>
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
                      (and
                        (not
                          (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
                        (or
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                          (not
                            (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                    (or
                      (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))))
                (or
                  (Set_in x2@473@01 ys@461@01)
                  (not (Set_in x2@473@01 ys@461@01)))))
            (or (not (Set_in x2@473@01 xs@460@01)) (Set_in x2@473@01 xs@460@01))))
        (or
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
    (or
      (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
      (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))))))
; Joined path conditions
(assert (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | !(x1@472@01 in xs@460@01)]
(assert (not (Set_in x1@472@01 xs@460@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@474@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@474@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef268|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@475@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@475@01  $FPM) r))
  :qid |qp.resPrmSumDef269|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@476@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@476@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef270|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@477@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@477@01  $FPM) r))
  :qid |qp.resPrmSumDef271|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (=>
  (Set_in x1@472@01 xs@460@01)
  (and
    (Set_in x1@472@01 xs@460@01)
    (=>
      (not (Set_in x1@472@01 ys@461@01))
      (and
        (not (Set_in x1@472@01 ys@461@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
            (=>
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                (=>
                  (Set_in x2@473@01 xs@460@01)
                  (and
                    (Set_in x2@473@01 xs@460@01)
                    (=>
                      (not (Set_in x2@473@01 ys@461@01))
                      (and
                        (not (Set_in x2@473@01 ys@461@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0))
                            (or
                              (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                              (not
                                (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                        (or
                          (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)
                          (not
                            (=
                              ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                              0)))))
                    (or
                      (Set_in x2@473@01 ys@461@01)
                      (not (Set_in x2@473@01 ys@461@01)))))
                (or
                  (not (Set_in x2@473@01 xs@460@01))
                  (Set_in x2@473@01 xs@460@01))))
            (or
              (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
        (or
          (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
          (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
    (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01))))))
; Joined path conditions
(assert (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01)))
(push) ; 4
; [then-branch: 47 | x1@472@01 != x2@473@01 && !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01) && Lookup(f, sm@478@01, x2@473@01) != 0 && !(x2@473@01 in ys@461@01) && x2@473@01 in xs@460@01 && !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01) && Lookup(f, sm@474@01, x1@472@01) != 0 && !(x1@472@01 in ys@461@01) && x1@472@01 in xs@460@01 | live]
; [else-branch: 47 | !(x1@472@01 != x2@473@01 && !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01) && Lookup(f, sm@478@01, x2@473@01) != 0 && !(x2@473@01 in ys@461@01) && x2@473@01 in xs@460@01 && !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01) && Lookup(f, sm@474@01, x1@472@01) != 0 && !(x1@472@01 in ys@461@01) && x1@472@01 in xs@460@01) | live]
(push) ; 5
; [then-branch: 47 | x1@472@01 != x2@473@01 && !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01) && Lookup(f, sm@478@01, x2@473@01) != 0 && !(x2@473@01 in ys@461@01) && x2@473@01 in xs@460@01 && !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01) && Lookup(f, sm@474@01, x1@472@01) != 0 && !(x1@472@01 in ys@461@01) && x1@472@01 in xs@460@01]
(assert (and
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (not (= x1@472@01 x2@473@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
            (not (Set_in x2@473@01 ys@461@01)))
          (Set_in x2@473@01 xs@460@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
      (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
    (not (Set_in x1@472@01 ys@461@01)))
  (Set_in x1@472@01 xs@460@01)))
; [eval] x1.g != x2.g
(declare-const sm@482@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@482@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@482@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef276|)))
(declare-const pm@483@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@483@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@483@01  $FPM) r))
  :qid |qp.resPrmSumDef277|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@483@01  $FPM) x1@472@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const sm@484@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@484@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@484@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef278|)))
(declare-const pm@485@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@485@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@485@01  $FPM) r))
  :qid |qp.resPrmSumDef279|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@485@01  $FPM) x2@473@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 47 | !(x1@472@01 != x2@473@01 && !(Lookup(g, sm@480@01, x2@473@01) in xs@460@01) && Lookup(f, sm@478@01, x2@473@01) != 0 && !(x2@473@01 in ys@461@01) && x2@473@01 in xs@460@01 && !(Lookup(g, sm@476@01, x1@472@01) in xs@460@01) && Lookup(f, sm@474@01, x1@472@01) != 0 && !(x1@472@01 in ys@461@01) && x1@472@01 in xs@460@01)]
(assert (not
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@472@01 x2@473@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
              (not (Set_in x2@473@01 ys@461@01)))
            (Set_in x2@473@01 xs@460@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
      (not (Set_in x1@472@01 ys@461@01)))
    (Set_in x1@472@01 xs@460@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@482@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@482@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef276|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@483@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@483@01  $FPM) r))
  :qid |qp.resPrmSumDef277|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@484@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@484@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef278|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@485@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@485@01  $FPM) r))
  :qid |qp.resPrmSumDef279|)))
(assert (=>
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@472@01 x2@473@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
              (not (Set_in x2@473@01 ys@461@01)))
            (Set_in x2@473@01 xs@460@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
      (not (Set_in x1@472@01 ys@461@01)))
    (Set_in x1@472@01 xs@460@01))
  (and
    (not (= x1@472@01 x2@473@01))
    (not (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
    (not (Set_in x2@473@01 ys@461@01))
    (Set_in x2@473@01 xs@460@01)
    (not (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
    (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
    (not (Set_in x1@472@01 ys@461@01))
    (Set_in x1@472@01 xs@460@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@472@01 x2@473@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                (not (Set_in x2@473@01 ys@461@01)))
              (Set_in x2@473@01 xs@460@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
          (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
        (not (Set_in x1@472@01 ys@461@01)))
      (Set_in x1@472@01 xs@460@01)))
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@472@01 x2@473@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
              (not (Set_in x2@473@01 ys@461@01)))
            (Set_in x2@473@01 xs@460@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
      (not (Set_in x1@472@01 ys@461@01)))
    (Set_in x1@472@01 xs@460@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@474@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@474@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef268|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@475@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@475@01  $FPM) r))
  :qid |qp.resPrmSumDef269|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@476@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@476@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef270|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@477@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@477@01  $FPM) r))
  :qid |qp.resPrmSumDef271|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@478@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@478@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef272|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@479@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@479@01  $FPM) r))
  :qid |qp.resPrmSumDef273|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@480@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@480@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef274|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@481@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@481@01  $FPM) r))
  :qid |qp.resPrmSumDef275|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@482@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@482@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef276|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@483@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@483@01  $FPM) r))
  :qid |qp.resPrmSumDef277|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@484@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@484@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef278|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@485@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@485@01  $FPM) r))
  :qid |qp.resPrmSumDef279|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in x2@473@01 xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in x2@473@01 ys@461@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in x2@473@01 xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in x2@473@01 ys@461@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in x2@473@01 xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in x2@473@01 ys@461@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@472@01 xs@460@01)
      (and
        (Set_in x1@472@01 xs@460@01)
        (=>
          (not (Set_in x1@472@01 ys@461@01))
          (and
            (not (Set_in x1@472@01 ys@461@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
                    (=>
                      (Set_in x2@473@01 xs@460@01)
                      (and
                        (Set_in x2@473@01 xs@460@01)
                        (=>
                          (not (Set_in x2@473@01 ys@461@01))
                          (and
                            (not (Set_in x2@473@01 ys@461@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01)
                                  0)))))
                        (or
                          (Set_in x2@473@01 ys@461@01)
                          (not (Set_in x2@473@01 ys@461@01)))))
                    (or
                      (not (Set_in x2@473@01 xs@460@01))
                      (Set_in x2@473@01 xs@460@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))))
            (or
              (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))))
        (or (Set_in x1@472@01 ys@461@01) (not (Set_in x1@472@01 ys@461@01)))))
    (or (not (Set_in x1@472@01 xs@460@01)) (Set_in x1@472@01 xs@460@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))
      (and
        (not (= x1@472@01 x2@473@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0))
        (not (Set_in x2@473@01 ys@461@01))
        (Set_in x2@473@01 xs@460@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01))
        (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0))
        (not (Set_in x1@472@01 ys@461@01))
        (Set_in x1@472@01 xs@460@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@472@01 x2@473@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                    (not (Set_in x2@473@01 ys@461@01)))
                  (Set_in x2@473@01 xs@460@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
              (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
            (not (Set_in x1@472@01 ys@461@01)))
          (Set_in x1@472@01 xs@460@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@472@01 x2@473@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                    (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                  (not (Set_in x2@473@01 ys@461@01)))
                (Set_in x2@473@01 xs@460@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
            (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
          (not (Set_in x1@472@01 ys@461@01)))
        (Set_in x1@472@01 xs@460@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@472@01 $Ref) (x2@473@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@472@01 x2@473@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01)))
                  (not (= ($FVF.lookup_f (as sm@478@01  $FVF<f>) x2@473@01) 0)))
                (not (Set_in x2@473@01 ys@461@01)))
              (Set_in x2@473@01 xs@460@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01)))
          (not (= ($FVF.lookup_f (as sm@474@01  $FVF<f>) x1@472@01) 0)))
        (not (Set_in x1@472@01 ys@461@01)))
      (Set_in x1@472@01 xs@460@01))
    (not
      (=
        ($FVF.lookup_g (as sm@482@01  $FVF<g>) x1@472@01)
        ($FVF.lookup_g (as sm@484@01  $FVF<g>) x2@473@01))))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in x2@473@01 xs@460@01))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in x2@473@01 ys@461@01))
  :pattern ((Set_in x1@472@01 xs@460@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in x2@473@01 xs@460@01))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in x2@473@01 ys@461@01))
  :pattern ((Set_in x1@472@01 ys@461@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in x2@473@01 xs@460@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in x2@473@01 ys@461@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@476@01  $FVF<g>) x1@472@01) xs@460@01) (Set_in ($FVF.lookup_g (as sm@480@01  $FVF<g>) x2@473@01) xs@460@01))
  :qid |prog.l119|)))
(declare-const x@486@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 48 | x@486@01 in xs@460@01 | live]
; [else-branch: 48 | !(x@486@01 in xs@460@01) | live]
(push) ; 5
; [then-branch: 48 | x@486@01 in xs@460@01]
(assert (Set_in x@486@01 xs@460@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 49 | !(x@486@01 in ys@461@01) | live]
; [else-branch: 49 | x@486@01 in ys@461@01 | live]
(push) ; 7
; [then-branch: 49 | !(x@486@01 in ys@461@01)]
(assert (not (Set_in x@486@01 ys@461@01)))
; [eval] x.f != 0
(declare-const sm@487@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@487@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@487@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef280|)))
(declare-const pm@488@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@488@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@488@01  $FPM) r))
  :qid |qp.resPrmSumDef281|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@488@01  $FPM) x@486@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 50 | Lookup(f, sm@487@01, x@486@01) != 0 | live]
; [else-branch: 50 | Lookup(f, sm@487@01, x@486@01) == 0 | live]
(push) ; 9
; [then-branch: 50 | Lookup(f, sm@487@01, x@486@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(declare-const sm@489@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@489@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@489@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef282|)))
(declare-const pm@490@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@490@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@490@01  $FPM) r))
  :qid |qp.resPrmSumDef283|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@490@01  $FPM) x@486@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 50 | Lookup(f, sm@487@01, x@486@01) == 0]
(assert (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@489@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@489@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef282|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@490@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@490@01  $FPM) r))
  :qid |qp.resPrmSumDef283|)))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)
  (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 49 | x@486@01 in ys@461@01]
(assert (Set_in x@486@01 ys@461@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@487@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@487@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef280|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@488@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@488@01  $FPM) r))
  :qid |qp.resPrmSumDef281|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@489@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@489@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef282|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@490@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@490@01  $FPM) r))
  :qid |qp.resPrmSumDef283|)))
(assert (=>
  (not (Set_in x@486@01 ys@461@01))
  (and
    (not (Set_in x@486@01 ys@461@01))
    (or
      (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)
      (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0))))))
; Joined path conditions
(assert (or (Set_in x@486@01 ys@461@01) (not (Set_in x@486@01 ys@461@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | !(x@486@01 in xs@460@01)]
(assert (not (Set_in x@486@01 xs@460@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@487@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@487@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef280|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@488@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@488@01  $FPM) r))
  :qid |qp.resPrmSumDef281|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@489@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@489@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef282|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@490@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@490@01  $FPM) r))
  :qid |qp.resPrmSumDef283|)))
(assert (=>
  (Set_in x@486@01 xs@460@01)
  (and
    (Set_in x@486@01 xs@460@01)
    (=>
      (not (Set_in x@486@01 ys@461@01))
      (and
        (not (Set_in x@486@01 ys@461@01))
        (or
          (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))))
    (or (Set_in x@486@01 ys@461@01) (not (Set_in x@486@01 ys@461@01))))))
; Joined path conditions
(assert (or (not (Set_in x@486@01 xs@460@01)) (Set_in x@486@01 xs@460@01)))
(assert (and
  (and
    (and
      (not (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) x@486@01) xs@460@01))
      (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))
    (not (Set_in x@486@01 ys@461@01)))
  (Set_in x@486@01 xs@460@01)))
(declare-const sm@491@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@491@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@491@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef284|)))
(declare-const pm@492@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@492@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@492@01  $FPM) r))
  :qid |qp.resPrmSumDef285|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@492@01  $FPM) x@486@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@493@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@487@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@487@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef280|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@488@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@467@01 r) ys@461@01))
        (Set_in (inv@467@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@488@01  $FPM) r))
  :qid |qp.resPrmSumDef281|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@489@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@489@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef282|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@490@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@490@01  $FPM) r))
  :qid |qp.resPrmSumDef283|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@491@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@491@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef284|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@492@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@492@01  $FPM) r))
  :qid |qp.resPrmSumDef285|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@486@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) x@486@01) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))
        (not (Set_in x@486@01 ys@461@01)))
      (Set_in x@486@01 xs@460@01))
    (and
      (=>
        (Set_in x@486@01 xs@460@01)
        (and
          (Set_in x@486@01 xs@460@01)
          (=>
            (not (Set_in x@486@01 ys@461@01))
            (and
              (not (Set_in x@486@01 ys@461@01))
              (or
                (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)
                (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))))
          (or (Set_in x@486@01 ys@461@01) (not (Set_in x@486@01 ys@461@01)))))
      (or (not (Set_in x@486@01 xs@460@01)) (Set_in x@486@01 xs@460@01))))
  :pattern (($FVF.lookup_g (as sm@491@01  $FVF<g>) x@486@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@486@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) x@486@01) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))
        (not (Set_in x@486@01 ys@461@01)))
      (Set_in x@486@01 xs@460@01))
    (= (inv@493@01 ($FVF.lookup_g (as sm@491@01  $FVF<g>) x@486@01)) x@486@01))
  :pattern (($FVF.lookup_g (as sm@491@01  $FVF<g>) x@486@01))
  :qid |quant-u-129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) (inv@493@01 r)) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) (inv@493@01 r)) 0)))
        (not (Set_in (inv@493@01 r) ys@461@01)))
      (Set_in (inv@493@01 r) xs@460@01))
    (= ($FVF.lookup_g (as sm@491@01  $FVF<g>) (inv@493@01 r)) r))
  :pattern ((inv@493@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@486@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) x@486@01) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) x@486@01) 0)))
        (not (Set_in x@486@01 ys@461@01)))
      (Set_in x@486@01 xs@460@01))
    (not (= ($FVF.lookup_g (as sm@491@01  $FVF<g>) x@486@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@491@01  $FVF<g>) x@486@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@463@01 xs@460@01 ys@461@01))
; [exec]
; inhale (x in xs)
(declare-const $t@494@01 $Snap)
(assert (= $t@494@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@462@01 xs@460@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@495@01 $Snap)
(assert (= $t@495@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@462@01 ys@461@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@496@01 $Snap)
(assert (= $t@496@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@462@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@497@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) (inv@493@01 r)) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) (inv@493@01 r)) 0)))
        (not (Set_in (inv@493@01 r) ys@461@01)))
      (Set_in (inv@493@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@497@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@463@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@497@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@463@01)))) r))
  :qid |qp.fvfValDef286|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@497@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@497@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef287|)))
(declare-const pm@498@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@498@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) (inv@493@01 r)) xs@460@01))
              (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) (inv@493@01 r)) 0)))
            (not (Set_in (inv@493@01 r) ys@461@01)))
          (Set_in (inv@493@01 r) xs@460@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@467@01 r) ys@461@01))
          (Set_in (inv@467@01 r) xs@460@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@498@01  $FPM) r))
  :qid |qp.resPrmSumDef288|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@498@01  $FPM) x@462@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@499@01 Int)
(assert (= a@499@01 ($FVF.lookup_f (as sm@497@01  $FVF<f>) x@462@01)))
; [exec]
; inhale a != 0
(declare-const $t@500@01 $Snap)
(assert (= $t@500@01 $Snap.unit))
; [eval] a != 0
(assert (not (= a@499@01 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := x.g
(declare-const sm@501@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@501@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@501@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef289|)))
(declare-const pm@502@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@502@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@502@01  $FPM) r))
  :qid |qp.resPrmSumDef290|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@502@01  $FPM) x@462@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const b@503@01 $Ref)
(assert (= b@503@01 ($FVF.lookup_g (as sm@501@01  $FVF<g>) x@462@01)))
; [exec]
; a := x.g.f
(declare-const sm@504@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
        (not (Set_in (inv@471@01 r) ys@461@01)))
      (Set_in (inv@471@01 r) xs@460@01))
    (=
      ($FVF.lookup_g (as sm@504@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r)))
  :pattern (($FVF.lookup_g (as sm@504@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@463@01))) r))
  :qid |qp.fvfValDef291|)))
(declare-const pm@505@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@505@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@469@01  $FVF<f>) (inv@471@01 r)) 0))
          (not (Set_in (inv@471@01 r) ys@461@01)))
        (Set_in (inv@471@01 r) xs@460@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@505@01  $FPM) r))
  :qid |qp.resPrmSumDef292|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@505@01  $FPM) x@462@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@506@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) (inv@493@01 r)) xs@460@01))
          (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) (inv@493@01 r)) 0)))
        (not (Set_in (inv@493@01 r) ys@461@01)))
      (Set_in (inv@493@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@506@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@463@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@506@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@463@01)))) r))
  :qid |qp.fvfValDef293|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@467@01 r) ys@461@01))
      (Set_in (inv@467@01 r) xs@460@01))
    (=
      ($FVF.lookup_f (as sm@506@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r)))
  :pattern (($FVF.lookup_f (as sm@506@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@463@01)) r))
  :qid |qp.fvfValDef294|)))
(declare-const pm@507@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@507@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@489@01  $FVF<g>) (inv@493@01 r)) xs@460@01))
              (not (= ($FVF.lookup_f (as sm@487@01  $FVF<f>) (inv@493@01 r)) 0)))
            (not (Set_in (inv@493@01 r) ys@461@01)))
          (Set_in (inv@493@01 r) xs@460@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@467@01 r) ys@461@01))
          (Set_in (inv@467@01 r) xs@460@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@507@01  $FPM) r))
  :qid |qp.resPrmSumDef295|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@507@01  $FPM) ($FVF.lookup_g (as sm@504@01  $FVF<g>) x@462@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@508@01 Set<$Ref>)
(declare-const ys@509@01 Set<$Ref>)
(declare-const x@510@01 $Ref)
(declare-const xs@511@01 Set<$Ref>)
(declare-const ys@512@01 Set<$Ref>)
(declare-const x@513@01 $Ref)
(push) ; 1
(declare-const $t@514@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@515@01 Int)
; [exec]
; var b: Ref
(declare-const b@516@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@514@01 ($Snap.combine ($Snap.first $t@514@01) ($Snap.second $t@514@01))))
(declare-const x@517@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 51 | x@517@01 in xs@511@01 | live]
; [else-branch: 51 | !(x@517@01 in xs@511@01) | live]
(push) ; 5
; [then-branch: 51 | x@517@01 in xs@511@01]
(assert (Set_in x@517@01 xs@511@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(push) ; 5
; [else-branch: 51 | !(x@517@01 in xs@511@01)]
(assert (not (Set_in x@517@01 xs@511@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@517@01 xs@511@01)) (Set_in x@517@01 xs@511@01)))
(assert (and (not (Set_in x@517@01 ys@512@01)) (Set_in x@517@01 xs@511@01)))
(pop) ; 3
(declare-fun inv@518@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@517@01 $Ref)) (!
  (=>
    (and (not (Set_in x@517@01 ys@512@01)) (Set_in x@517@01 xs@511@01))
    (or (not (Set_in x@517@01 xs@511@01)) (Set_in x@517@01 xs@511@01)))
  :pattern ((Set_in x@517@01 ys@512@01))
  :pattern ((Set_in x@517@01 xs@511@01))
  :pattern ((inv@518@01 x@517@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@517@01 $Ref)) (!
  (=>
    (and (not (Set_in x@517@01 ys@512@01)) (Set_in x@517@01 xs@511@01))
    (= (inv@518@01 x@517@01) x@517@01))
  :pattern ((Set_in x@517@01 ys@512@01))
  :pattern ((Set_in x@517@01 xs@511@01))
  :pattern ((inv@518@01 x@517@01))
  :qid |quant-u-131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (= (inv@518@01 r) r))
  :pattern ((inv@518@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@517@01 $Ref)) (!
  (=>
    (and (not (Set_in x@517@01 ys@512@01)) (Set_in x@517@01 xs@511@01))
    (not (= x@517@01 $Ref.null)))
  :pattern ((Set_in x@517@01 ys@512@01))
  :pattern ((Set_in x@517@01 xs@511@01))
  :pattern ((inv@518@01 x@517@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@514@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@514@01))
    ($Snap.second ($Snap.second $t@514@01)))))
(declare-const x@519@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 52 | x@519@01 in xs@511@01 | live]
; [else-branch: 52 | !(x@519@01 in xs@511@01) | live]
(push) ; 5
; [then-branch: 52 | x@519@01 in xs@511@01]
(assert (Set_in x@519@01 xs@511@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 53 | !(x@519@01 in ys@512@01) | live]
; [else-branch: 53 | x@519@01 in ys@512@01 | live]
(push) ; 7
; [then-branch: 53 | !(x@519@01 in ys@512@01)]
(assert (not (Set_in x@519@01 ys@512@01)))
; [eval] x.f != 0
(declare-const sm@520@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@520@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef296|)))
(declare-const pm@521@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@521@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@521@01  $FPM) r))
  :qid |qp.resPrmSumDef297|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@521@01  $FPM) x@519@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 53 | x@519@01 in ys@512@01]
(assert (Set_in x@519@01 ys@512@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@520@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef296|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@521@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@521@01  $FPM) r))
  :qid |qp.resPrmSumDef297|)))
; Joined path conditions
(assert (or (Set_in x@519@01 ys@512@01) (not (Set_in x@519@01 ys@512@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | !(x@519@01 in xs@511@01)]
(assert (not (Set_in x@519@01 xs@511@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@520@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef296|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@521@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@521@01  $FPM) r))
  :qid |qp.resPrmSumDef297|)))
(assert (=>
  (Set_in x@519@01 xs@511@01)
  (and
    (Set_in x@519@01 xs@511@01)
    (or (Set_in x@519@01 ys@512@01) (not (Set_in x@519@01 ys@512@01))))))
; Joined path conditions
(assert (or (not (Set_in x@519@01 xs@511@01)) (Set_in x@519@01 xs@511@01)))
(assert (and
  (and
    (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01) 0))
    (not (Set_in x@519@01 ys@512@01)))
  (Set_in x@519@01 xs@511@01)))
(pop) ; 3
(declare-fun inv@522@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@520@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef296|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@521@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@521@01  $FPM) r))
  :qid |qp.resPrmSumDef297|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@519@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01) 0))
        (not (Set_in x@519@01 ys@512@01)))
      (Set_in x@519@01 xs@511@01))
    (and
      (=>
        (Set_in x@519@01 xs@511@01)
        (and
          (Set_in x@519@01 xs@511@01)
          (or (Set_in x@519@01 ys@512@01) (not (Set_in x@519@01 ys@512@01)))))
      (or (not (Set_in x@519@01 xs@511@01)) (Set_in x@519@01 xs@511@01))))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01))
  :pattern ((Set_in x@519@01 ys@512@01))
  :pattern ((Set_in x@519@01 xs@511@01))
  :pattern ((inv@522@01 x@519@01))
  :qid |g-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@519@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01) 0))
        (not (Set_in x@519@01 ys@512@01)))
      (Set_in x@519@01 xs@511@01))
    (= (inv@522@01 x@519@01) x@519@01))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01))
  :pattern ((Set_in x@519@01 ys@512@01))
  :pattern ((Set_in x@519@01 xs@511@01))
  :pattern ((inv@522@01 x@519@01))
  :qid |quant-u-133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (= (inv@522@01 r) r))
  :pattern ((inv@522@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@519@01 $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01) 0))
        (not (Set_in x@519@01 ys@512@01)))
      (Set_in x@519@01 xs@511@01))
    (not (= x@519@01 $Ref.null)))
  :pattern (($FVF.lookup_f (as sm@520@01  $FVF<f>) x@519@01))
  :pattern ((Set_in x@519@01 ys@512@01))
  :pattern ((Set_in x@519@01 xs@511@01))
  :pattern ((inv@522@01 x@519@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@514@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@514@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@514@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@514@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@523@01 $Ref)
(declare-const x2@524@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 54 | x1@523@01 in xs@511@01 | live]
; [else-branch: 54 | !(x1@523@01 in xs@511@01) | live]
(push) ; 5
; [then-branch: 54 | x1@523@01 in xs@511@01]
(assert (Set_in x1@523@01 xs@511@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 55 | !(x1@523@01 in ys@512@01) | live]
; [else-branch: 55 | x1@523@01 in ys@512@01 | live]
(push) ; 7
; [then-branch: 55 | !(x1@523@01 in ys@512@01)]
(assert (not (Set_in x1@523@01 ys@512@01)))
; [eval] x1.f != 0
(declare-const sm@525@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@525@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@525@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef298|)))
(declare-const pm@526@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@526@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@526@01  $FPM) r))
  :qid |qp.resPrmSumDef299|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@526@01  $FPM) x1@523@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 56 | Lookup(f, sm@525@01, x1@523@01) != 0 | live]
; [else-branch: 56 | Lookup(f, sm@525@01, x1@523@01) == 0 | live]
(push) ; 9
; [then-branch: 56 | Lookup(f, sm@525@01, x1@523@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(declare-const sm@527@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@527@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@527@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef300|)))
(declare-const pm@528@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@528@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@528@01  $FPM) r))
  :qid |qp.resPrmSumDef301|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@528@01  $FPM) x1@523@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 57 | !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01) | live]
; [else-branch: 57 | Lookup(g, sm@527@01, x1@523@01) in xs@511@01 | live]
(push) ; 11
; [then-branch: 57 | !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 58 | x2@524@01 in xs@511@01 | live]
; [else-branch: 58 | !(x2@524@01 in xs@511@01) | live]
(push) ; 13
; [then-branch: 58 | x2@524@01 in xs@511@01]
(assert (Set_in x2@524@01 xs@511@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 59 | !(x2@524@01 in ys@512@01) | live]
; [else-branch: 59 | x2@524@01 in ys@512@01 | live]
(push) ; 15
; [then-branch: 59 | !(x2@524@01 in ys@512@01)]
(assert (not (Set_in x2@524@01 ys@512@01)))
; [eval] x2.f != 0
(declare-const sm@529@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(declare-const pm@530@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(push) ; 16
(assert (not (< $Perm.No ($FVF.perm_f (as pm@530@01  $FPM) x2@524@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 60 | Lookup(f, sm@529@01, x2@524@01) != 0 | live]
; [else-branch: 60 | Lookup(f, sm@529@01, x2@524@01) == 0 | live]
(push) ; 17
; [then-branch: 60 | Lookup(f, sm@529@01, x2@524@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(declare-const sm@531@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(declare-const pm@532@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(push) ; 18
(assert (not (< $Perm.No ($FVF.perm_g (as pm@532@01  $FPM) x2@524@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 61 | !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01) | live]
; [else-branch: 61 | Lookup(g, sm@531@01, x2@524@01) in xs@511@01 | live]
(push) ; 19
; [then-branch: 61 | !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01)]
(assert (not (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
; [eval] x1 != x2
(pop) ; 19
(push) ; 19
; [else-branch: 61 | Lookup(g, sm@531@01, x2@524@01) in xs@511@01]
(assert (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
  (not (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 60 | Lookup(f, sm@529@01, x2@524@01) == 0]
(assert (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
(pop) ; 17
(pop) ; 16
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
    (or
      (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
      (not (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 59 | x2@524@01 in ys@512@01]
(assert (Set_in x2@524@01 ys@512@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (not (Set_in x2@524@01 ys@512@01))
  (and
    (not (Set_in x2@524@01 ys@512@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (or
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
    (or
      (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
      (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))))))
; Joined path conditions
(assert (or (Set_in x2@524@01 ys@512@01) (not (Set_in x2@524@01 ys@512@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 58 | !(x2@524@01 in xs@511@01)]
(assert (not (Set_in x2@524@01 xs@511@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (Set_in x2@524@01 xs@511@01)
  (and
    (Set_in x2@524@01 xs@511@01)
    (=>
      (not (Set_in x2@524@01 ys@512@01))
      (and
        (not (Set_in x2@524@01 ys@512@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
            (or
              (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
        (or
          (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
          (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))))
    (or (Set_in x2@524@01 ys@512@01) (not (Set_in x2@524@01 ys@512@01))))))
; Joined path conditions
(assert (or (not (Set_in x2@524@01 xs@511@01)) (Set_in x2@524@01 xs@511@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 57 | Lookup(g, sm@527@01, x1@523@01) in xs@511@01]
(assert (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
  (and
    (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
    (=>
      (Set_in x2@524@01 xs@511@01)
      (and
        (Set_in x2@524@01 xs@511@01)
        (=>
          (not (Set_in x2@524@01 ys@512@01))
          (and
            (not (Set_in x2@524@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
                (or
                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
              (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))))
        (or (Set_in x2@524@01 ys@512@01) (not (Set_in x2@524@01 ys@512@01)))))
    (or (not (Set_in x2@524@01 xs@511@01)) (Set_in x2@524@01 xs@511@01)))))
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
  (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 56 | Lookup(f, sm@525@01, x1@523@01) == 0]
(assert (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@527@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@527@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef300|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@528@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@528@01  $FPM) r))
  :qid |qp.resPrmSumDef301|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
  (and
    (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
    (=>
      (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
      (and
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (=>
          (Set_in x2@524@01 xs@511@01)
          (and
            (Set_in x2@524@01 xs@511@01)
            (=>
              (not (Set_in x2@524@01 ys@512@01))
              (and
                (not (Set_in x2@524@01 ys@512@01))
                (=>
                  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
                  (and
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
                    (or
                      (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                (or
                  (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
                  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))))
            (or (Set_in x2@524@01 ys@512@01) (not (Set_in x2@524@01 ys@512@01)))))
        (or (not (Set_in x2@524@01 xs@511@01)) (Set_in x2@524@01 xs@511@01))))
    (or
      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
      (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))))))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
  (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | x1@523@01 in ys@512@01]
(assert (Set_in x1@523@01 ys@512@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@525@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@525@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef298|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@526@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@526@01  $FPM) r))
  :qid |qp.resPrmSumDef299|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@527@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@527@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef300|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@528@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@528@01  $FPM) r))
  :qid |qp.resPrmSumDef301|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (not (Set_in x1@523@01 ys@512@01))
  (and
    (not (Set_in x1@523@01 ys@512@01))
    (=>
      (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
      (and
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (=>
          (not
            (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
          (and
            (not
              (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
            (=>
              (Set_in x2@524@01 xs@511@01)
              (and
                (Set_in x2@524@01 xs@511@01)
                (=>
                  (not (Set_in x2@524@01 ys@512@01))
                  (and
                    (not (Set_in x2@524@01 ys@512@01))
                    (=>
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
                      (and
                        (not
                          (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
                        (or
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                          (not
                            (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                    (or
                      (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))))
                (or
                  (Set_in x2@524@01 ys@512@01)
                  (not (Set_in x2@524@01 ys@512@01)))))
            (or (not (Set_in x2@524@01 xs@511@01)) (Set_in x2@524@01 xs@511@01))))
        (or
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
          (not
            (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
    (or
      (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
      (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))))))
; Joined path conditions
(assert (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | !(x1@523@01 in xs@511@01)]
(assert (not (Set_in x1@523@01 xs@511@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@525@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@525@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef298|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@526@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@526@01  $FPM) r))
  :qid |qp.resPrmSumDef299|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@527@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@527@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef300|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@528@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@528@01  $FPM) r))
  :qid |qp.resPrmSumDef301|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (=>
  (Set_in x1@523@01 xs@511@01)
  (and
    (Set_in x1@523@01 xs@511@01)
    (=>
      (not (Set_in x1@523@01 ys@512@01))
      (and
        (not (Set_in x1@523@01 ys@512@01))
        (=>
          (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
          (and
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
            (=>
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                (=>
                  (Set_in x2@524@01 xs@511@01)
                  (and
                    (Set_in x2@524@01 xs@511@01)
                    (=>
                      (not (Set_in x2@524@01 ys@512@01))
                      (and
                        (not (Set_in x2@524@01 ys@512@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0))
                            (or
                              (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                              (not
                                (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                        (or
                          (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)
                          (not
                            (=
                              ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                              0)))))
                    (or
                      (Set_in x2@524@01 ys@512@01)
                      (not (Set_in x2@524@01 ys@512@01)))))
                (or
                  (not (Set_in x2@524@01 xs@511@01))
                  (Set_in x2@524@01 xs@511@01))))
            (or
              (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
        (or
          (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
          (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
    (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01))))))
; Joined path conditions
(assert (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01)))
(push) ; 4
; [then-branch: 62 | x1@523@01 != x2@524@01 && !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01) && Lookup(f, sm@529@01, x2@524@01) != 0 && !(x2@524@01 in ys@512@01) && x2@524@01 in xs@511@01 && !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01) && Lookup(f, sm@525@01, x1@523@01) != 0 && !(x1@523@01 in ys@512@01) && x1@523@01 in xs@511@01 | live]
; [else-branch: 62 | !(x1@523@01 != x2@524@01 && !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01) && Lookup(f, sm@529@01, x2@524@01) != 0 && !(x2@524@01 in ys@512@01) && x2@524@01 in xs@511@01 && !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01) && Lookup(f, sm@525@01, x1@523@01) != 0 && !(x1@523@01 in ys@512@01) && x1@523@01 in xs@511@01) | live]
(push) ; 5
; [then-branch: 62 | x1@523@01 != x2@524@01 && !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01) && Lookup(f, sm@529@01, x2@524@01) != 0 && !(x2@524@01 in ys@512@01) && x2@524@01 in xs@511@01 && !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01) && Lookup(f, sm@525@01, x1@523@01) != 0 && !(x1@523@01 in ys@512@01) && x1@523@01 in xs@511@01]
(assert (and
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (not (= x1@523@01 x2@524@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
            (not (Set_in x2@524@01 ys@512@01)))
          (Set_in x2@524@01 xs@511@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
      (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
    (not (Set_in x1@523@01 ys@512@01)))
  (Set_in x1@523@01 xs@511@01)))
; [eval] x1.g != x2.g
(declare-const sm@533@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@533@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@533@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef306|)))
(declare-const pm@534@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@534@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@534@01  $FPM) r))
  :qid |qp.resPrmSumDef307|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@534@01  $FPM) x1@523@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(declare-const sm@535@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@535@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@535@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef308|)))
(declare-const pm@536@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@536@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@536@01  $FPM) r))
  :qid |qp.resPrmSumDef309|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_g (as pm@536@01  $FPM) x2@524@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 62 | !(x1@523@01 != x2@524@01 && !(Lookup(g, sm@531@01, x2@524@01) in xs@511@01) && Lookup(f, sm@529@01, x2@524@01) != 0 && !(x2@524@01 in ys@512@01) && x2@524@01 in xs@511@01 && !(Lookup(g, sm@527@01, x1@523@01) in xs@511@01) && Lookup(f, sm@525@01, x1@523@01) != 0 && !(x1@523@01 in ys@512@01) && x1@523@01 in xs@511@01)]
(assert (not
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@523@01 x2@524@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
              (not (Set_in x2@524@01 ys@512@01)))
            (Set_in x2@524@01 xs@511@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
      (not (Set_in x1@523@01 ys@512@01)))
    (Set_in x1@523@01 xs@511@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@533@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@533@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef306|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@534@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@534@01  $FPM) r))
  :qid |qp.resPrmSumDef307|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@535@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@535@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef308|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@536@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@536@01  $FPM) r))
  :qid |qp.resPrmSumDef309|)))
(assert (=>
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@523@01 x2@524@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
              (not (Set_in x2@524@01 ys@512@01)))
            (Set_in x2@524@01 xs@511@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
      (not (Set_in x1@523@01 ys@512@01)))
    (Set_in x1@523@01 xs@511@01))
  (and
    (not (= x1@523@01 x2@524@01))
    (not (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
    (not (Set_in x2@524@01 ys@512@01))
    (Set_in x2@524@01 xs@511@01)
    (not (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
    (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
    (not (Set_in x1@523@01 ys@512@01))
    (Set_in x1@523@01 xs@511@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@523@01 x2@524@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                (not (Set_in x2@524@01 ys@512@01)))
              (Set_in x2@524@01 xs@511@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
          (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
        (not (Set_in x1@523@01 ys@512@01)))
      (Set_in x1@523@01 xs@511@01)))
  (and
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (not (= x1@523@01 x2@524@01))
                  (not
                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
              (not (Set_in x2@524@01 ys@512@01)))
            (Set_in x2@524@01 xs@511@01))
          (not
            (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
      (not (Set_in x1@523@01 ys@512@01)))
    (Set_in x1@523@01 xs@511@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@525@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@525@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef298|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@526@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@526@01  $FPM) r))
  :qid |qp.resPrmSumDef299|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@527@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@527@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef300|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@528@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@528@01  $FPM) r))
  :qid |qp.resPrmSumDef301|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@529@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@529@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef302|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@530@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@530@01  $FPM) r))
  :qid |qp.resPrmSumDef303|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@531@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@531@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef304|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@532@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@532@01  $FPM) r))
  :qid |qp.resPrmSumDef305|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@533@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@533@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef306|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@534@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@534@01  $FPM) r))
  :qid |qp.resPrmSumDef307|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@535@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@535@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef308|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@536@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@536@01  $FPM) r))
  :qid |qp.resPrmSumDef309|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in x2@524@01 xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in x2@524@01 ys@512@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in x2@524@01 xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in x2@524@01 ys@512@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in x2@524@01 xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in x2@524@01 ys@512@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@523@01 xs@511@01)
      (and
        (Set_in x1@523@01 xs@511@01)
        (=>
          (not (Set_in x1@523@01 ys@512@01))
          (and
            (not (Set_in x1@523@01 ys@512@01))
            (=>
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
              (and
                (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
                    (=>
                      (Set_in x2@524@01 xs@511@01)
                      (and
                        (Set_in x2@524@01 xs@511@01)
                        (=>
                          (not (Set_in x2@524@01 ys@512@01))
                          (and
                            (not (Set_in x2@524@01 ys@512@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                    0))
                                (or
                                  (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)
                                  (not
                                    (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))))
                            (or
                              (=
                                ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                0)
                              (not
                                (=
                                  ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01)
                                  0)))))
                        (or
                          (Set_in x2@524@01 ys@512@01)
                          (not (Set_in x2@524@01 ys@512@01)))))
                    (or
                      (not (Set_in x2@524@01 xs@511@01))
                      (Set_in x2@524@01 xs@511@01))))
                (or
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)
                  (not
                    (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))))
            (or
              (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))))
        (or (Set_in x1@523@01 ys@512@01) (not (Set_in x1@523@01 ys@512@01)))))
    (or (not (Set_in x1@523@01 xs@511@01)) (Set_in x1@523@01 xs@511@01))
    (=>
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))
      (and
        (not (= x1@523@01 x2@524@01))
        (not
          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0))
        (not (Set_in x2@524@01 ys@512@01))
        (Set_in x2@524@01 xs@511@01)
        (not
          (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01))
        (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0))
        (not (Set_in x1@523@01 ys@512@01))
        (Set_in x1@523@01 xs@511@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= x1@523@01 x2@524@01))
                        (not
                          (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                      (not
                        (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                    (not (Set_in x2@524@01 ys@512@01)))
                  (Set_in x2@524@01 xs@511@01))
                (not
                  (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
              (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
            (not (Set_in x1@523@01 ys@512@01)))
          (Set_in x1@523@01 xs@511@01)))
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (and
                      (not (= x1@523@01 x2@524@01))
                      (not
                        (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                    (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                  (not (Set_in x2@524@01 ys@512@01)))
                (Set_in x2@524@01 xs@511@01))
              (not
                (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
            (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
          (not (Set_in x1@523@01 ys@512@01)))
        (Set_in x1@523@01 xs@511@01))))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :qid |prog.l119-aux|)))
(assert (forall ((x1@523@01 $Ref) (x2@524@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and
            (and
              (and
                (and
                  (and
                    (not (= x1@523@01 x2@524@01))
                    (not
                      (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01)))
                  (not (= ($FVF.lookup_f (as sm@529@01  $FVF<f>) x2@524@01) 0)))
                (not (Set_in x2@524@01 ys@512@01)))
              (Set_in x2@524@01 xs@511@01))
            (not
              (Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01)))
          (not (= ($FVF.lookup_f (as sm@525@01  $FVF<f>) x1@523@01) 0)))
        (not (Set_in x1@523@01 ys@512@01)))
      (Set_in x1@523@01 xs@511@01))
    (not
      (=
        ($FVF.lookup_g (as sm@533@01  $FVF<g>) x1@523@01)
        ($FVF.lookup_g (as sm@535@01  $FVF<g>) x2@524@01))))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in x2@524@01 xs@511@01))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in x2@524@01 ys@512@01))
  :pattern ((Set_in x1@523@01 xs@511@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in x2@524@01 xs@511@01))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in x2@524@01 ys@512@01))
  :pattern ((Set_in x1@523@01 ys@512@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in x2@524@01 xs@511@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in x2@524@01 ys@512@01))
  :pattern ((Set_in ($FVF.lookup_g (as sm@527@01  $FVF<g>) x1@523@01) xs@511@01) (Set_in ($FVF.lookup_g (as sm@531@01  $FVF<g>) x2@524@01) xs@511@01))
  :qid |prog.l119|)))
(declare-const x@537@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 63 | x@537@01 in xs@511@01 | live]
; [else-branch: 63 | !(x@537@01 in xs@511@01) | live]
(push) ; 5
; [then-branch: 63 | x@537@01 in xs@511@01]
(assert (Set_in x@537@01 xs@511@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 64 | !(x@537@01 in ys@512@01) | live]
; [else-branch: 64 | x@537@01 in ys@512@01 | live]
(push) ; 7
; [then-branch: 64 | !(x@537@01 in ys@512@01)]
(assert (not (Set_in x@537@01 ys@512@01)))
; [eval] x.f != 0
(declare-const sm@538@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@538@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@538@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef310|)))
(declare-const pm@539@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@539@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@539@01  $FPM) r))
  :qid |qp.resPrmSumDef311|)))
(push) ; 8
(assert (not (< $Perm.No ($FVF.perm_f (as pm@539@01  $FPM) x@537@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 65 | Lookup(f, sm@538@01, x@537@01) != 0 | live]
; [else-branch: 65 | Lookup(f, sm@538@01, x@537@01) == 0 | live]
(push) ; 9
; [then-branch: 65 | Lookup(f, sm@538@01, x@537@01) != 0]
(assert (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(declare-const sm@540@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@540@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@540@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef312|)))
(declare-const pm@541@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@541@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@541@01  $FPM) r))
  :qid |qp.resPrmSumDef313|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_g (as pm@541@01  $FPM) x@537@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 65 | Lookup(f, sm@538@01, x@537@01) == 0]
(assert (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@540@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@540@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef312|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@541@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@541@01  $FPM) r))
  :qid |qp.resPrmSumDef313|)))
; Joined path conditions
(assert (or
  (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)
  (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 64 | x@537@01 in ys@512@01]
(assert (Set_in x@537@01 ys@512@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@538@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@538@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef310|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@539@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@539@01  $FPM) r))
  :qid |qp.resPrmSumDef311|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@540@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@540@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef312|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@541@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@541@01  $FPM) r))
  :qid |qp.resPrmSumDef313|)))
(assert (=>
  (not (Set_in x@537@01 ys@512@01))
  (and
    (not (Set_in x@537@01 ys@512@01))
    (or
      (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)
      (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0))))))
; Joined path conditions
(assert (or (Set_in x@537@01 ys@512@01) (not (Set_in x@537@01 ys@512@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | !(x@537@01 in xs@511@01)]
(assert (not (Set_in x@537@01 xs@511@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@538@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@538@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef310|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@539@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@539@01  $FPM) r))
  :qid |qp.resPrmSumDef311|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@540@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@540@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef312|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@541@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@541@01  $FPM) r))
  :qid |qp.resPrmSumDef313|)))
(assert (=>
  (Set_in x@537@01 xs@511@01)
  (and
    (Set_in x@537@01 xs@511@01)
    (=>
      (not (Set_in x@537@01 ys@512@01))
      (and
        (not (Set_in x@537@01 ys@512@01))
        (or
          (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))))
    (or (Set_in x@537@01 ys@512@01) (not (Set_in x@537@01 ys@512@01))))))
; Joined path conditions
(assert (or (not (Set_in x@537@01 xs@511@01)) (Set_in x@537@01 xs@511@01)))
(assert (and
  (and
    (and
      (not (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) x@537@01) xs@511@01))
      (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))
    (not (Set_in x@537@01 ys@512@01)))
  (Set_in x@537@01 xs@511@01)))
(declare-const sm@542@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@542@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@542@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef314|)))
(declare-const pm@543@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@543@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@543@01  $FPM) r))
  :qid |qp.resPrmSumDef315|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@543@01  $FPM) x@537@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@544@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@538@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@538@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef310|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@539@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@518@01 r) ys@512@01))
        (Set_in (inv@518@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@539@01  $FPM) r))
  :qid |qp.resPrmSumDef311|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@540@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@540@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef312|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@541@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@541@01  $FPM) r))
  :qid |qp.resPrmSumDef313|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@542@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@542@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef314|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@543@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@543@01  $FPM) r))
  :qid |qp.resPrmSumDef315|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@537@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) x@537@01) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))
        (not (Set_in x@537@01 ys@512@01)))
      (Set_in x@537@01 xs@511@01))
    (and
      (=>
        (Set_in x@537@01 xs@511@01)
        (and
          (Set_in x@537@01 xs@511@01)
          (=>
            (not (Set_in x@537@01 ys@512@01))
            (and
              (not (Set_in x@537@01 ys@512@01))
              (or
                (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)
                (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))))
          (or (Set_in x@537@01 ys@512@01) (not (Set_in x@537@01 ys@512@01)))))
      (or (not (Set_in x@537@01 xs@511@01)) (Set_in x@537@01 xs@511@01))))
  :pattern (($FVF.lookup_g (as sm@542@01  $FVF<g>) x@537@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@537@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) x@537@01) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))
        (not (Set_in x@537@01 ys@512@01)))
      (Set_in x@537@01 xs@511@01))
    (= (inv@544@01 ($FVF.lookup_g (as sm@542@01  $FVF<g>) x@537@01)) x@537@01))
  :pattern (($FVF.lookup_g (as sm@542@01  $FVF<g>) x@537@01))
  :qid |quant-u-135|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) (inv@544@01 r)) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) (inv@544@01 r)) 0)))
        (not (Set_in (inv@544@01 r) ys@512@01)))
      (Set_in (inv@544@01 r) xs@511@01))
    (= ($FVF.lookup_g (as sm@542@01  $FVF<g>) (inv@544@01 r)) r))
  :pattern ((inv@544@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@537@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) x@537@01) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) x@537@01) 0)))
        (not (Set_in x@537@01 ys@512@01)))
      (Set_in x@537@01 xs@511@01))
    (not (= ($FVF.lookup_g (as sm@542@01  $FVF<g>) x@537@01) $Ref.null)))
  :pattern (($FVF.lookup_g (as sm@542@01  $FVF<g>) x@537@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@514@01 xs@511@01 ys@512@01))
; [exec]
; inhale (x in xs)
(declare-const $t@545@01 $Snap)
(assert (= $t@545@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@513@01 xs@511@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@546@01 $Snap)
(assert (= $t@546@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@513@01 ys@512@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@547@01 $Snap)
(assert (= $t@547@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@513@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@548@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) (inv@544@01 r)) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) (inv@544@01 r)) 0)))
        (not (Set_in (inv@544@01 r) ys@512@01)))
      (Set_in (inv@544@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@548@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@514@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@548@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@514@01)))) r))
  :qid |qp.fvfValDef316|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@548@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@548@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef317|)))
(declare-const pm@549@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@549@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) (inv@544@01 r)) xs@511@01))
              (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) (inv@544@01 r)) 0)))
            (not (Set_in (inv@544@01 r) ys@512@01)))
          (Set_in (inv@544@01 r) xs@511@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@518@01 r) ys@512@01))
          (Set_in (inv@518@01 r) xs@511@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@549@01  $FPM) r))
  :qid |qp.resPrmSumDef318|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@549@01  $FPM) x@513@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@550@01 Int)
(assert (= a@550@01 ($FVF.lookup_f (as sm@548@01  $FVF<f>) x@513@01)))
; [exec]
; inhale a != 0
(declare-const $t@551@01 $Snap)
(assert (= $t@551@01 $Snap.unit))
; [eval] a != 0
(assert (not (= a@550@01 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := x.g
(declare-const sm@552@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@552@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@552@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef319|)))
(declare-const pm@553@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@553@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@553@01  $FPM) r))
  :qid |qp.resPrmSumDef320|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@553@01  $FPM) x@513@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const b@554@01 $Ref)
(assert (= b@554@01 ($FVF.lookup_g (as sm@552@01  $FVF<g>) x@513@01)))
; [exec]
; inhale !((x.g in xs))
(declare-const $t@555@01 $Snap)
(assert (= $t@555@01 $Snap.unit))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(declare-const sm@556@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@556@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@556@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef321|)))
(declare-const pm@557@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@557@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@557@01  $FPM) r))
  :qid |qp.resPrmSumDef322|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@557@01  $FPM) x@513@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (Set_in ($FVF.lookup_g (as sm@556@01  $FVF<g>) x@513@01) xs@511@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.g != null
(declare-const $t@558@01 $Snap)
(assert (= $t@558@01 $Snap.unit))
; [eval] x.g != null
(declare-const sm@559@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@559@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@559@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef323|)))
(declare-const pm@560@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@560@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@560@01  $FPM) r))
  :qid |qp.resPrmSumDef324|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@560@01  $FPM) x@513@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_g (as sm@559@01  $FVF<g>) x@513@01) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := x.g.f
(declare-const sm@561@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
        (not (Set_in (inv@522@01 r) ys@512@01)))
      (Set_in (inv@522@01 r) xs@511@01))
    (=
      ($FVF.lookup_g (as sm@561@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r)))
  :pattern (($FVF.lookup_g (as sm@561@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@514@01))) r))
  :qid |qp.fvfValDef325|)))
(declare-const pm@562@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@562@01  $FPM) r)
    (ite
      (and
        (and
          (not (= ($FVF.lookup_f (as sm@520@01  $FVF<f>) (inv@522@01 r)) 0))
          (not (Set_in (inv@522@01 r) ys@512@01)))
        (Set_in (inv@522@01 r) xs@511@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@562@01  $FPM) r))
  :qid |qp.resPrmSumDef326|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@562@01  $FPM) x@513@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@563@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (not
            (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) (inv@544@01 r)) xs@511@01))
          (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) (inv@544@01 r)) 0)))
        (not (Set_in (inv@544@01 r) ys@512@01)))
      (Set_in (inv@544@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@563@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@514@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@563@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@514@01)))) r))
  :qid |qp.fvfValDef327|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@518@01 r) ys@512@01))
      (Set_in (inv@518@01 r) xs@511@01))
    (=
      ($FVF.lookup_f (as sm@563@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r)))
  :pattern (($FVF.lookup_f (as sm@563@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@514@01)) r))
  :qid |qp.fvfValDef328|)))
(declare-const pm@564@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@564@01  $FPM) r)
    (+
      (ite
        (and
          (and
            (and
              (not
                (Set_in ($FVF.lookup_g (as sm@540@01  $FVF<g>) (inv@544@01 r)) xs@511@01))
              (not (= ($FVF.lookup_f (as sm@538@01  $FVF<f>) (inv@544@01 r)) 0)))
            (not (Set_in (inv@544@01 r) ys@512@01)))
          (Set_in (inv@544@01 r) xs@511@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (not (Set_in (inv@518@01 r) ys@512@01))
          (Set_in (inv@518@01 r) xs@511@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@564@01  $FPM) r))
  :qid |qp.resPrmSumDef329|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@564@01  $FPM) ($FVF.lookup_g (as sm@561@01  $FVF<g>) x@513@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const a@565@01 Int)
(assert (=
  a@565@01
  ($FVF.lookup_f (as sm@563@01  $FVF<f>) ($FVF.lookup_g (as sm@561@01  $FVF<g>) x@513@01))))
(pop) ; 2
(pop) ; 1
