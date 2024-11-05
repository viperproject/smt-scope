(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:20:45
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._all_._issues_._silicon_._0335.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array_ 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.Array_To$Snap (Array_) $Snap)
(declare-fun $SortWrappers.$SnapToArray_ ($Snap) Array_)
(assert (forall ((x Array_)) (!
    (= x ($SortWrappers.$SnapToArray_($SortWrappers.Array_To$Snap x)))
    :pattern (($SortWrappers.Array_To$Snap x))
    :qid |$Snap.$SnapToArray_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array_To$Snap($SortWrappers.$SnapToArray_ x)))
    :pattern (($SortWrappers.$SnapToArray_ x))
    :qid |$Snap.Array_To$SnapToArray_|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
; ////////// Symbols
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
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun len<Int> (Array_) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun array%trigger ($Snap Array_) Bool)
(declare-fun tree%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((a Array_) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (len<Int> a)) (and (< j (len<Int> a)) (not (= i j))))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
; ---------- _treeToArray ----------
(declare-const root@0@01 $Ref)
(declare-const a@1@01 Array_)
(declare-const i@2@01 Int)
(declare-const root@3@01 $Ref)
(declare-const a@4@01 Array_)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 3
(assert (tree%trigger ($Snap.first $t@7@01) root@3@01))
(assert (=
  ($Snap.first $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@7@01))
    ($Snap.second ($Snap.first $t@7@01)))))
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01)))))
(assert (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null))))
(declare-const sm@9@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
(assert (not (= root@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))))
; [eval] root.left != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@7@01))) != Null | live]
; [else-branch: 0 | First:(Second:(First:($t@7@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:(Second:(First:($t@7@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(set-option :timeout 0)
(push) ; 6
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@10@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@11@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 2 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 2 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@12@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 6
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@14@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 5 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 5 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@15@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:(Second:(First:($t@7@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null)))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 6
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@16@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@17@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 9 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 9 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@18@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 6
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@20@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 12 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 12 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(push) ; 9
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@21@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@22@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@12@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@15@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@18@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@21@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No))
  (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write)
  (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (not (= root@3@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No))
  (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write)
  (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (not (= root@3@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No))
  (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write)
  (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (not (= root@3@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No))
  (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write)
  (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (not (= root@3@01 $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))))
(assert (as joined_unfolding@22@01  Bool))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(tree(root), write)
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@23@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(assert (<= $Perm.No (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= root@3@01 root@3@01) (not (= root@3@01 $Ref.null))))
(declare-const sm@24@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (not (= root@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 15 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@25@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 17 | 0 <= i@25@01 | live]
; [else-branch: 17 | !(0 <= i@25@01) | live]
(push) ; 7
; [then-branch: 17 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 17 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@25@01)) (<= 0 i@25@01)))
(assert (and (< i@25@01 (len<Int> a@4@01)) (<= 0 i@25@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@26@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (< i@25@01 (len<Int> a@4@01)) (<= 0 i@25@01))
    (or (not (<= 0 i@25@01)) (<= 0 i@25@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (< i@25@01 (len<Int> a@4@01)) (<= 0 i@25@01))
    (= (inv@26@01 (loc<Ref> a@4@01 i@25@01)) i@25@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r)))
    (= (loc<Ref> a@4@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (< i@25@01 (len<Int> a@4@01)) (<= 0 i@25@01))
    (not (= (loc<Ref> a@4@01 i@25@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r)))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) r))
  :pattern ((inv@26@01 r))
  :qid |quant-u-5|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@28@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 18 | 0 <= i@28@01 | live]
; [else-branch: 18 | !(0 <= i@28@01) | live]
(push) ; 7
; [then-branch: 18 | 0 <= i@28@01]
(assert (<= 0 i@28@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 18 | !(0 <= i@28@01)]
(assert (not (<= 0 i@28@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@28@01)) (<= 0 i@28@01)))
(assert (and (< i@28@01 (len<Int> a@4@01)) (<= 0 i@28@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@29@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (< i@28@01 (len<Int> a@4@01)) (<= 0 i@28@01))
    (or (not (<= 0 i@28@01)) (<= 0 i@28@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 i@28@01)) (loc<Ref> a@4@01 i@28@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@28@01 Int) (i2@28@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@28@01 (len<Int> a@4@01)) (<= 0 i1@28@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 i1@28@01)) (loc<Ref> a@4@01 i1@28@01)))
      (and
        (and (< i2@28@01 (len<Int> a@4@01)) (<= 0 i2@28@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 i2@28@01)) (loc<Ref> a@4@01 i2@28@01)))
      (= (loc<Ref> a@4@01 i1@28@01) (loc<Ref> a@4@01 i2@28@01)))
    (= i1@28@01 i2@28@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (< i@28@01 (len<Int> a@4@01)) (<= 0 i@28@01))
    (= (inv@29@01 (loc<Ref> a@4@01 i@28@01)) i@28@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) (loc<Ref> a@4@01 i@28@01)) (loc<Ref> a@4@01 i@28@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
    (= (loc<Ref> a@4@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@27@01  $FVF<val>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-7|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@30@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@30@01 r))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
    (= (- $Perm.Write (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@32@01  $FVF<val>)))
      (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r))))
    (=>
      (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
      (Set_in r ($FVF.domain_val (as sm@32@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@32@01  $FVF<val>))))
  :qid |qp.fvfDomDef18|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
      (and (< (inv@26@01 r) (len<Int> a@4@01)) (<= 0 (inv@26@01 r))))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@29@01 r) (len<Int> a@4@01)) (<= 0 (inv@29@01 r)))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@32@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [exec]
; _treeToArray(root.right, a, 0)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 ($Snap.combine ($Snap.first $t@33@01) ($Snap.second $t@33@01))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@33@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(set-option :timeout 0)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@33@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.first $t@33@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@33@01))
    ($Snap.second ($Snap.first $t@33@01)))))
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@34@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@33@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
(declare-const sm@35@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.first $t@33@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@33@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@33@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(First:($t@33@01))) != Null | live]
; [else-branch: 20 | First:(Second:(First:($t@33@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | First:(Second:(First:($t@33@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
    $Ref.null)))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:(Second:(Second:(First:($t@33@01))))) != Null | live]
; [else-branch: 21 | First:(Second:(Second:(Second:(First:($t@33@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 21 | First:(Second:(Second:(Second:(First:($t@33@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@37@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@38@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(declare-const pm@39@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@39@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef29|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@39@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const sm@40@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(declare-const pm@41@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@41@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resTrgDef34|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@41@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@42@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@42@01  Int)
    ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@42@01  Int)
    ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@42@01  Int)
    ($FVF.lookup_val (as sm@40@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@42@01  Int)
    ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@39@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef29|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@41@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resTrgDef34|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | First:(Second:(Second:(Second:(First:($t@33@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(declare-const sm@43@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef37|)))
(declare-const pm@44@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@44@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@44@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@43@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@44@01  $FPM) r))
  :qid |qp.resTrgDef39|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@43@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 9
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@44@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@45@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@46@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@47@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef45|)))
(declare-const pm@48@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@48@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@48@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const sm@49@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef50|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@50@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@50@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@51@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@51@01  Int)
    ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@51@01  Int)
    ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@51@01  Int)
    ($FVF.lookup_val (as sm@49@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@51@01  Int)
    ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@48@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@50@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 20 | First:(Second:(First:($t@33@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(Second:(Second:(First:($t@33@01))))) != Null | live]
; [else-branch: 28 | First:(Second:(Second:(Second:(First:($t@33@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 28 | First:(Second:(Second:(Second:(First:($t@33@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(declare-const sm@52@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef55|)))
(declare-const pm@53@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@53@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef57|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@53@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@54@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@55@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@56@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@57@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef65|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@57@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const sm@58@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef68|)))
(declare-const pm@59@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@59@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resTrgDef70|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@59@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@60@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@60@01  Int)
    ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@60@01  Int)
    ($FVF.lookup_val (as sm@56@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@60@01  Int)
    ($FVF.lookup_val (as sm@58@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@60@01  Int)
    ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@57@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef65|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@59@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resTrgDef70|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 28 | First:(Second:(Second:(Second:(First:($t@33@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@61@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@62@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@63@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef76|)))
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@64@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@64@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const sm@65@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef81|)))
(declare-const pm@66@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@66@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resTrgDef83|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@66@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@67@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@67@01  Int)
    ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@67@01  Int)
    ($FVF.lookup_val (as sm@63@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@67@01  Int)
    ($FVF.lookup_val (as sm@65@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@67@01  Int)
    ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@64@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@66@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resTrgDef83|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@68@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@68@01  Bool)
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@42@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@68@01  Bool)
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@51@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null))
  (=
    (as joined_unfolding@68@01  Bool)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@60@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null))
  (=
    (as joined_unfolding@68@01  Bool)
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@67@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@35@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@35@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@39@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@41@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resTrgDef34|)))
(assert (and
  (tree%trigger ($Snap.first $t@33@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@33@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@33@01))
      ($Snap.second ($Snap.first $t@33@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@33@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@33@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@33@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@42@01  Int)
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@42@01  Int)
        ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@42@01  Int)
        ($FVF.lookup_val (as sm@40@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@42@01  Int)
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@40@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@44@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@44@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@43@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@44@01  $FPM) r))
  :qid |qp.resTrgDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@48@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@48@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@50@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@50@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert (and
  (tree%trigger ($Snap.first $t@33@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@33@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@33@01))
      ($Snap.second ($Snap.first $t@33@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@33@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@33@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@33@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@43@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@51@01  Int)
        ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@51@01  Int)
        ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@51@01  Int)
        ($FVF.lookup_val (as sm@49@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@51@01  Int)
        ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@46@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@49@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@53@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@34@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@56@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@56@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@57@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef68|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@59@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resTrgDef70|)))
(assert (and
  (tree%trigger ($Snap.first $t@33@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@33@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@33@01))
      ($Snap.second ($Snap.first $t@33@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@33@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@33@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@33@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@60@01  Int)
        ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@60@01  Int)
        ($FVF.lookup_val (as sm@56@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@60@01  Int)
        ($FVF.lookup_val (as sm@58@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@60@01  Int)
        ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@56@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@63@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@63@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@64@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@64@01  $FPM) r))
  :qid |qp.resTrgDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :qid |qp.fvfValDef80|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef81|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@66@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@61@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@66@01  $FPM) r))
  :qid |qp.resTrgDef83|)))
(assert (and
  (tree%trigger ($Snap.first $t@33@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@33@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@33@01))
      ($Snap.second ($Snap.first $t@33@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@33@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@35@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@33@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@33@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@33@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@33@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@67@01  Int)
        ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@67@01  Int)
        ($FVF.lookup_val (as sm@63@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@67@01  Int)
        ($FVF.lookup_val (as sm@65@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@67@01  Int)
        ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@62@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@63@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@65@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@33@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@33@01))))
        $Ref.null)))))
(assert (as joined_unfolding@68@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
  (- (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) (pTaken@69@01 root@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in root@3@01 ($FVF.domain_val (as sm@70@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= root@3@01 root@3@01)
  (=
    ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 35 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 35 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.first $t@33@01))))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@71@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@71@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01)))
(declare-const sm@72@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef88|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@72@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 37 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 37 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(set-option :timeout 0)
(push) ; 11
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@73@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@74@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@73@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef90|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 39 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 39 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@73@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef90|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef87|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@73@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef90|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@71@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@72@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (and
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) root@3@01) root@3@01)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@72@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@74@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@72@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@74@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
; [else-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@75@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 42 | 0 <= i@75@01 | live]
; [else-branch: 42 | !(0 <= i@75@01) | live]
(push) ; 7
; [then-branch: 42 | 0 <= i@75@01]
(assert (<= 0 i@75@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 42 | !(0 <= i@75@01)]
(assert (not (<= 0 i@75@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@75@01)) (<= 0 i@75@01)))
(assert (and (< i@75@01 (len<Int> a@4@01)) (<= 0 i@75@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@76@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (< i@75@01 (len<Int> a@4@01)) (<= 0 i@75@01))
    (or (not (<= 0 i@75@01)) (<= 0 i@75@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@75@01)) (loc<Ref> a@4@01 i@75@01)))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (< i@75@01 (len<Int> a@4@01)) (<= 0 i@75@01))
    (= (inv@76@01 (loc<Ref> a@4@01 i@75@01)) i@75@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@75@01)) (loc<Ref> a@4@01 i@75@01)))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r)))
    (= (loc<Ref> a@4@01 (inv@76@01 r)) r))
  :pattern ((inv@76@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (< i@75@01 (len<Int> a@4@01)) (<= 0 i@75@01))
    (not (= (loc<Ref> a@4@01 i@75@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@75@01)) (loc<Ref> a@4@01 i@75@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@77@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r)))
    (=
      ($FVF.lookup_val (as sm@77@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@77@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@77@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@77@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef92|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@77@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) r) r))
  :pattern ((inv@76@01 r))
  :qid |quant-u-16|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@78@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 43 | 0 <= i@78@01 | live]
; [else-branch: 43 | !(0 <= i@78@01) | live]
(push) ; 7
; [then-branch: 43 | 0 <= i@78@01]
(assert (<= 0 i@78@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 43 | !(0 <= i@78@01)]
(assert (not (<= 0 i@78@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@78@01)) (<= 0 i@78@01)))
(assert (and (< i@78@01 (len<Int> a@4@01)) (<= 0 i@78@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@79@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and (< i@78@01 (len<Int> a@4@01)) (<= 0 i@78@01))
    (or (not (<= 0 i@78@01)) (<= 0 i@78@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) (loc<Ref> a@4@01 i@78@01)) (loc<Ref> a@4@01 i@78@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@78@01 Int) (i2@78@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@78@01 (len<Int> a@4@01)) (<= 0 i1@78@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) (loc<Ref> a@4@01 i1@78@01)) (loc<Ref> a@4@01 i1@78@01)))
      (and
        (and (< i2@78@01 (len<Int> a@4@01)) (<= 0 i2@78@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) (loc<Ref> a@4@01 i2@78@01)) (loc<Ref> a@4@01 i2@78@01)))
      (= (loc<Ref> a@4@01 i1@78@01) (loc<Ref> a@4@01 i2@78@01)))
    (= i1@78@01 i2@78@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and (< i@78@01 (len<Int> a@4@01)) (<= 0 i@78@01))
    (= (inv@79@01 (loc<Ref> a@4@01 i@78@01)) i@78@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) (loc<Ref> a@4@01 i@78@01)) (loc<Ref> a@4@01 i@78@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
    (= (loc<Ref> a@4@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@77@01  $FVF<val>) r) r))
  :pattern ((inv@79@01 r))
  :qid |quant-u-18|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@81@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@80@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
    (= (- $Perm.Write (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@82@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@82@01  $FVF<val>)))
      (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r))))
    (=>
      (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
      (Set_in r ($FVF.domain_val (as sm@82@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@82@01  $FVF<val>))))
  :qid |qp.fvfDomDef97|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
      (and (< (inv@76@01 r) (len<Int> a@4@01)) (<= 0 (inv@76@01 r))))
    (=
      ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@79@01 r) (len<Int> a@4@01)) (<= 0 (inv@79@01 r)))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@82@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
; [then-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
; [else-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@83@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
  (- (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No) (pTaken@83@01 root@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@83@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@84@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in root@3@01 ($FVF.domain_val (as sm@84@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= root@3@01 root@3@01)
  (=
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 46 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 46 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; [eval] root.right != null
; [then-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 7
; [else-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@84@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        $Snap.unit)))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@85@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@85@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@84@01  $FVF<val>) root@3@01)))
(declare-const sm@86@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@86@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef102|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@86@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 48 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 48 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
; [then-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 10
; [else-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 11
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@87@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@87@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@88@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef104|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 50 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 50 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
; [then-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 13
; [else-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(push) ; 14
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@87@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@86@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfValDef101|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef104|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@85@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@86@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@86@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@88@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@86@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@88@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 15 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@89@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 53 | 0 <= i@89@01 | live]
; [else-branch: 53 | !(0 <= i@89@01) | live]
(push) ; 7
; [then-branch: 53 | 0 <= i@89@01]
(assert (<= 0 i@89@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 53 | !(0 <= i@89@01)]
(assert (not (<= 0 i@89@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@89@01)) (<= 0 i@89@01)))
(assert (and (< i@89@01 (len<Int> a@4@01)) (<= 0 i@89@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@90@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (< i@89@01 (len<Int> a@4@01)) (<= 0 i@89@01))
    (or (not (<= 0 i@89@01)) (<= 0 i@89@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@89@01)) (loc<Ref> a@4@01 i@89@01)))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (< i@89@01 (len<Int> a@4@01)) (<= 0 i@89@01))
    (= (inv@90@01 (loc<Ref> a@4@01 i@89@01)) i@89@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@89@01)) (loc<Ref> a@4@01 i@89@01)))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r)))
    (= (loc<Ref> a@4@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@89@01 Int)) (!
  (=>
    (and (< i@89@01 (len<Int> a@4@01)) (<= 0 i@89@01))
    (not (= (loc<Ref> a@4@01 i@89@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@89@01)) (loc<Ref> a@4@01 i@89@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@91@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r)))
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r))
  :pattern ((inv@90@01 r))
  :qid |quant-u-27|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@92@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 54 | 0 <= i@92@01 | live]
; [else-branch: 54 | !(0 <= i@92@01) | live]
(push) ; 7
; [then-branch: 54 | 0 <= i@92@01]
(assert (<= 0 i@92@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 54 | !(0 <= i@92@01)]
(assert (not (<= 0 i@92@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@92@01)) (<= 0 i@92@01)))
(assert (and (< i@92@01 (len<Int> a@4@01)) (<= 0 i@92@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@93@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and (< i@92@01 (len<Int> a@4@01)) (<= 0 i@92@01))
    (or (not (<= 0 i@92@01)) (<= 0 i@92@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> a@4@01 i@92@01)) (loc<Ref> a@4@01 i@92@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@92@01 Int) (i2@92@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@92@01 (len<Int> a@4@01)) (<= 0 i1@92@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> a@4@01 i1@92@01)) (loc<Ref> a@4@01 i1@92@01)))
      (and
        (and (< i2@92@01 (len<Int> a@4@01)) (<= 0 i2@92@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> a@4@01 i2@92@01)) (loc<Ref> a@4@01 i2@92@01)))
      (= (loc<Ref> a@4@01 i1@92@01) (loc<Ref> a@4@01 i2@92@01)))
    (= i1@92@01 i2@92@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@92@01 Int)) (!
  (=>
    (and (< i@92@01 (len<Int> a@4@01)) (<= 0 i@92@01))
    (= (inv@93@01 (loc<Ref> a@4@01 i@92@01)) i@92@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> a@4@01 i@92@01)) (loc<Ref> a@4@01 i@92@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
    (= (loc<Ref> a@4@01 (inv@93@01 r)) r))
  :pattern ((inv@93@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r))
  :pattern ((inv@93@01 r))
  :qid |quant-u-29|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@94@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
    (= (- $Perm.Write (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@96@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@96@01  $FVF<val>)))
      (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r))))
    (=>
      (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
      (Set_in r ($FVF.domain_val (as sm@96@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@96@01  $FVF<val>))))
  :qid |qp.fvfDomDef111|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
      (and (< (inv@90@01 r) (len<Int> a@4@01)) (<= 0 (inv@90@01 r))))
    (=
      ($FVF.lookup_val (as sm@96@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@96@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef108|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@93@01 r) (len<Int> a@4@01)) (<= 0 (inv@93@01 r)))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@96@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@96@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef109|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@96@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef110|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@96@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [exec]
; _treeToArray(root.right, a, 0)
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 ($Snap.combine ($Snap.first $t@97@01) ($Snap.second $t@97@01))))
(assert (= ($Snap.second $t@97@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 6
(assert (tree%trigger ($Snap.first $t@97@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.first $t@97@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@97@01))
    ($Snap.second ($Snap.first $t@97@01)))))
(declare-const sm@98@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@98@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@97@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
(declare-const sm@99@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.first $t@97@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@97@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@97@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 56 | First:(Second:(First:($t@97@01))) != Null | live]
; [else-branch: 56 | First:(Second:(First:($t@97@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 56 | First:(Second:(First:($t@97@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 57 | First:(Second:(Second:(Second:(First:($t@97@01))))) != Null | live]
; [else-branch: 57 | First:(Second:(Second:(Second:(First:($t@97@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 57 | First:(Second:(Second:(Second:(First:($t@97@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@100@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@101@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef117|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@102@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef120|)))
(declare-const pm@103@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@103@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resTrgDef122|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@103@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(declare-const sm@104@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef125|)))
(declare-const pm@105@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@105@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef126|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resTrgDef127|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@105@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@106@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@106@01  Int)
    ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@106@01  Int)
    ($FVF.lookup_val (as sm@102@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@106@01  Int)
    ($FVF.lookup_val (as sm@104@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@106@01  Int)
    ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef117|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef120|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@103@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resTrgDef122|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@105@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef126|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resTrgDef127|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 57 | First:(Second:(Second:(Second:(First:($t@97@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(declare-const sm@107@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef130|)))
(declare-const pm@108@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@108@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@107@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resTrgDef132|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@107@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 9
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@108@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@109@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@110@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef135|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@111@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef138|)))
(declare-const pm@112@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@112@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resTrgDef140|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@112@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(declare-const sm@113@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef143|)))
(declare-const pm@114@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@114@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef144|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resTrgDef145|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@114@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@115@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@115@01  Int)
    ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@115@01  Int)
    ($FVF.lookup_val (as sm@111@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@115@01  Int)
    ($FVF.lookup_val (as sm@113@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@115@01  Int)
    ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef135|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef138|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@112@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resTrgDef140|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@114@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef144|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resTrgDef145|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 56 | First:(Second:(First:($t@97@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@97@01))))) != Null | live]
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@97@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@97@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
    $Ref.null)))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(declare-const sm@116@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef147|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef148|)))
(declare-const pm@117@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@117@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@117@01  $FPM) r))
  :qid |qp.resPrmSumDef149|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@117@01  $FPM) r))
  :qid |qp.resTrgDef150|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 9
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@117@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@118@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@119@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef151|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef152|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef153|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@120@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef154|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef156|)))
(declare-const pm@121@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@121@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resPrmSumDef157|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resTrgDef158|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@121@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(declare-const sm@122@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef159|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef161|)))
(declare-const pm@123@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@123@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef162|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef163|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@123@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@124@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@124@01  Int)
    ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@124@01  Int)
    ($FVF.lookup_val (as sm@120@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@124@01  Int)
    ($FVF.lookup_val (as sm@122@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@124@01  Int)
    ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef151|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef152|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef153|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef154|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@121@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resPrmSumDef157|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resTrgDef158|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef159|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@123@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef162|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef163|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@97@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@125@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@126@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef164|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(declare-const sm@127@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef168|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef169|)))
(declare-const pm@128@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@128@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resPrmSumDef170|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resTrgDef171|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@128@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(declare-const sm@129@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef172|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef173|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef174|)))
(declare-const pm@130@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@130@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resPrmSumDef175|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resTrgDef176|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(push) ; 12
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@130@01  $FPM) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@131@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@131@01  Int)
    ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@131@01  Int)
    ($FVF.lookup_val (as sm@127@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@131@01  Int)
    ($FVF.lookup_val (as sm@129@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@131@01  Int)
    ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef164|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef168|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef169|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@128@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resPrmSumDef170|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resTrgDef171|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef172|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef173|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef174|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@130@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resPrmSumDef175|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resTrgDef176|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@132@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@132@01  Bool)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@106@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@132@01  Bool)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@115@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null))
  (=
    (as joined_unfolding@132@01  Bool)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@124@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null))
  (=
    (as joined_unfolding@132@01  Bool)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@131@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@102@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef119|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@102@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef120|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@103@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef121|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@103@01  $FPM) r))
  :qid |qp.resTrgDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@104@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@104@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@105@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef126|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@105@01  $FPM) r))
  :qid |qp.resTrgDef127|)))
(assert (and
  (tree%trigger ($Snap.first $t@97@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@97@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@97@01))
      ($Snap.second ($Snap.first $t@97@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@97@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@97@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@97@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@97@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@106@01  Int)
        ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@106@01  Int)
        ($FVF.lookup_val (as sm@102@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@106@01  Int)
        ($FVF.lookup_val (as sm@104@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@106@01  Int)
        ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@102@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@104@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@107@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@107@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@108@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@107@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@108@01  $FPM) r))
  :qid |qp.resTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef135|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef138|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@112@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef139|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@112@01  $FPM) r))
  :qid |qp.resTrgDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@114@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef144|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@109@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@114@01  $FPM) r))
  :qid |qp.resTrgDef145|)))
(assert (and
  (tree%trigger ($Snap.first $t@97@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@97@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@97@01))
      ($Snap.second ($Snap.first $t@97@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@97@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@97@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@97@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@97@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
      $Snap.unit)
    ($FVF.loc_val ($FVF.lookup_val (as sm@107@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@115@01  Int)
        ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@115@01  Int)
        ($FVF.lookup_val (as sm@111@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@115@01  Int)
        ($FVF.lookup_val (as sm@113@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@115@01  Int)
        ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@111@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef146|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef147|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef148|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@117@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@117@01  $FPM) r))
  :qid |qp.resPrmSumDef149|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@117@01  $FPM) r))
  :qid |qp.resTrgDef150|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef151|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@119@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef152|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@119@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef153|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef154|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@120@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef155|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@120@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef156|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@121@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resPrmSumDef157|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@121@01  $FPM) r))
  :qid |qp.resTrgDef158|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef159|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef160|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef161|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@123@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef162|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@123@01  $FPM) r))
  :qid |qp.resTrgDef163|)))
(assert (and
  (tree%trigger ($Snap.first $t@97@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@97@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@97@01))
      ($Snap.second ($Snap.first $t@97@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@97@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@97@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@97@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@97@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@124@01  Int)
        ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@124@01  Int)
        ($FVF.lookup_val (as sm@120@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@124@01  Int)
        ($FVF.lookup_val (as sm@122@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@124@01  Int)
        ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@119@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@120@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef164|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef165|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef166|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@127@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef168|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@127@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef169|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@128@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resPrmSumDef170|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@128@01  $FPM) r))
  :qid |qp.resTrgDef171|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef172|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@129@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@125@01  $FVF<val>) r))
  :qid |qp.fvfValDef173|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@129@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef174|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@130@01  $FPM) r)
    (+
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (ite
        (=
          r
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resPrmSumDef175|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@125@01  $FVF<val>) r) r))
  :pattern (($FVF.perm_val (as pm@130@01  $FPM) r))
  :qid |qp.resTrgDef176|)))
(assert (and
  (tree%trigger ($Snap.first $t@97@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@97@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@97@01))
      ($Snap.second ($Snap.first $t@97@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@97@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@97@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@97@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@97@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@97@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@131@01  Int)
        ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@131@01  Int)
        ($FVF.lookup_val (as sm@127@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@131@01  Int)
        ($FVF.lookup_val (as sm@129@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@131@01  Int)
        ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@125@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@126@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)
        ($FVF.loc_val ($FVF.lookup_val (as sm@127@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        ($FVF.loc_val ($FVF.lookup_val (as sm@129@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@97@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@97@01))))
        $Ref.null)))))
(assert (as joined_unfolding@132@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
    (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No)
    (pTaken@133@01 root@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@134@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in root@3@01 ($FVF.domain_val (as sm@134@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= root@3@01 root@3@01)
  (=
    ($FVF.lookup_val (as sm@134@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 71 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 71 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 71 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@134@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.first $t@97@01))))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@135@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@135@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@134@01  $FVF<val>) root@3@01)))
(declare-const sm@136@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@136@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@135@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@136@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@135@01  $FVF<val>) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@135@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@136@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef181|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@136@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 73 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 73 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 9
; [else-branch: 73 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 11
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@137@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@137@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@138@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@138@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@138@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 75 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 75 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 12
; [else-branch: 75 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(push) ; 14
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@138@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@137@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@138@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@136@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@135@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@136@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@135@01  $FVF<val>) r))
  :qid |qp.fvfValDef180|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@135@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@136@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef181|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@138@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfValDef182|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@138@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef183|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@135@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@134@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@136@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (and
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@138@01  $FVF<val>) root@3@01) root@3@01)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@136@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@138@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@136@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@138@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
; [else-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@139@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 78 | 0 <= i@139@01 | live]
; [else-branch: 78 | !(0 <= i@139@01) | live]
(push) ; 7
; [then-branch: 78 | 0 <= i@139@01]
(assert (<= 0 i@139@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 78 | !(0 <= i@139@01)]
(assert (not (<= 0 i@139@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@139@01)) (<= 0 i@139@01)))
(assert (and (< i@139@01 (len<Int> a@4@01)) (<= 0 i@139@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@140@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (< i@139@01 (len<Int> a@4@01)) (<= 0 i@139@01))
    (or (not (<= 0 i@139@01)) (<= 0 i@139@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@139@01)) (loc<Ref> a@4@01 i@139@01)))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (< i@139@01 (len<Int> a@4@01)) (<= 0 i@139@01))
    (= (inv@140@01 (loc<Ref> a@4@01 i@139@01)) i@139@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@139@01)) (loc<Ref> a@4@01 i@139@01)))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r)))
    (= (loc<Ref> a@4@01 (inv@140@01 r)) r))
  :pattern ((inv@140@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (< i@139@01 (len<Int> a@4@01)) (<= 0 i@139@01))
    (not (= (loc<Ref> a@4@01 i@139@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@139@01)) (loc<Ref> a@4@01 i@139@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@141@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r)))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef185|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef186|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) r) r))
  :pattern ((inv@140@01 r))
  :qid |quant-u-38|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@142@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 79 | 0 <= i@142@01 | live]
; [else-branch: 79 | !(0 <= i@142@01) | live]
(push) ; 7
; [then-branch: 79 | 0 <= i@142@01]
(assert (<= 0 i@142@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(push) ; 7
; [else-branch: 79 | !(0 <= i@142@01)]
(assert (not (<= 0 i@142@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@142@01)) (<= 0 i@142@01)))
(assert (and (< i@142@01 (len<Int> a@4@01)) (<= 0 i@142@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@143@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and (< i@142@01 (len<Int> a@4@01)) (<= 0 i@142@01))
    (or (not (<= 0 i@142@01)) (<= 0 i@142@01)))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) (loc<Ref> a@4@01 i@142@01)) (loc<Ref> a@4@01 i@142@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@142@01 Int) (i2@142@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@142@01 (len<Int> a@4@01)) (<= 0 i1@142@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) (loc<Ref> a@4@01 i1@142@01)) (loc<Ref> a@4@01 i1@142@01)))
      (and
        (and (< i2@142@01 (len<Int> a@4@01)) (<= 0 i2@142@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) (loc<Ref> a@4@01 i2@142@01)) (loc<Ref> a@4@01 i2@142@01)))
      (= (loc<Ref> a@4@01 i1@142@01) (loc<Ref> a@4@01 i2@142@01)))
    (= i1@142@01 i2@142@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and (< i@142@01 (len<Int> a@4@01)) (<= 0 i@142@01))
    (= (inv@143@01 (loc<Ref> a@4@01 i@142@01)) i@142@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) (loc<Ref> a@4@01 i@142@01)) (loc<Ref> a@4@01 i@142@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
    (= (loc<Ref> a@4@01 (inv@143@01 r)) r))
  :pattern ((inv@143@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@141@01  $FVF<val>) r) r))
  :pattern ((inv@143@01 r))
  :qid |quant-u-40|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@145@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@144@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@144@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
    (= (- $Perm.Write (pTaken@144@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@146@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@146@01  $FVF<val>)))
      (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r))))
    (=>
      (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
      (Set_in r ($FVF.domain_val (as sm@146@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@146@01  $FVF<val>))))
  :qid |qp.fvfDomDef190|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
      (and (< (inv@140@01 r) (len<Int> a@4@01)) (<= 0 (inv@140@01 r))))
    (=
      ($FVF.lookup_val (as sm@146@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@146@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef187|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@143@01 r) (len<Int> a@4@01)) (<= 0 (inv@143@01 r)))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@146@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@146@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef188|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@146@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef189|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@146@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
; [then-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
; [else-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@147@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
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
    (ite (= root@3@01 root@3@01) $Perm.Write $Perm.No)
    (pTaken@147@01 root@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@147@01 r)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@148@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in root@3@01 ($FVF.domain_val (as sm@148@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= root@3@01 root@3@01)
  (=
    ($FVF.lookup_val (as sm@148@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 82 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 82 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 82 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
; [eval] root.right != null
; [then-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 7
; [else-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@148@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        $Snap.unit)))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@149@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@149@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@148@01  $FVF<val>) root@3@01)))
(declare-const sm@150@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@150@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@150@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :qid |qp.fvfValDef194|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@149@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@150@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef195|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@150@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 84 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 84 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 9
; [else-branch: 84 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
; [then-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 10
; [else-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(push) ; 11
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@151@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@151@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@152@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@152@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@151@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@151@01  $FVF<val>) r))
  :qid |qp.fvfValDef196|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@151@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef197|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@152@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 86 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 86 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 12
; [else-branch: 86 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
; [then-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 13
; [else-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(push) ; 14
(assert (not (= root@3@01 root@3@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@152@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@151@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@151@01  $FVF<val>) r))
  :qid |qp.fvfValDef196|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@151@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef197|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@151@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@152@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@150@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@149@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@150@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@149@01  $FVF<val>) r))
  :qid |qp.fvfValDef194|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@149@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@150@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef195|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@152@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@151@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@151@01  $FVF<val>) r))
  :qid |qp.fvfValDef196|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@151@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@152@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef197|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@149@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@148@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@150@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($FVF.lookup_val (as sm@151@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@152@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@150@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@152@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@150@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@152@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
