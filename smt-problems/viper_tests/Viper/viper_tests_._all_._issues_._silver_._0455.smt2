(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:09:29
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._all_._issues_._silver_._0455.vpr
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
(declare-sort $FVF<next> 0)
(declare-sort $PSF<list2> 0)
(declare-sort $PSF<list> 0)
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
(declare-fun $SortWrappers.$FVF<next>To$Snap ($FVF<next>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<next> ($Snap) $FVF<next>)
(assert (forall ((x $FVF<next>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<next>($SortWrappers.$FVF<next>To$Snap x)))
    :pattern (($SortWrappers.$FVF<next>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<next>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<next>To$Snap($SortWrappers.$SnapTo$FVF<next> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<next> x))
    :qid |$Snap.$FVF<next>To$SnapTo$FVF<next>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<list2>To$Snap ($PSF<list2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<list2> ($Snap) $PSF<list2>)
(assert (forall ((x $PSF<list2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<list2>($SortWrappers.$PSF<list2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<list2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<list2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<list2>To$Snap($SortWrappers.$SnapTo$PSF<list2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<list2> x))
    :qid |$Snap.$PSF<list2>To$SnapTo$PSF<list2>|
    )))
(declare-fun $SortWrappers.$PSF<list>To$Snap ($PSF<list>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<list> ($Snap) $PSF<list>)
(assert (forall ((x $PSF<list>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<list>($SortWrappers.$PSF<list>To$Snap x)))
    :pattern (($SortWrappers.$PSF<list>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<list>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<list>To$Snap($SortWrappers.$SnapTo$PSF<list> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<list> x))
    :qid |$Snap.$PSF<list>To$SnapTo$PSF<list>|
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
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; /predicate_snap_functions_declarations.smt2 [list2: Snap]
(declare-fun $PSF.domain_list2 ($PSF<list2>) Set<$Snap>)
(declare-fun $PSF.lookup_list2 ($PSF<list2> $Snap) $Snap)
(declare-fun $PSF.after_list2 ($PSF<list2> $PSF<list2>) Bool)
(declare-fun $PSF.loc_list2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_list2 $PSF<list2>)
; /predicate_snap_functions_declarations.smt2 [list: Snap]
(declare-fun $PSF.domain_list ($PSF<list>) Set<$Snap>)
(declare-fun $PSF.lookup_list ($PSF<list> $Snap) $Snap)
(declare-fun $PSF.after_list ($PSF<list> $PSF<list>) Bool)
(declare-fun $PSF.loc_list ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list ($PPM $Snap) $Perm)
(declare-const $psfTOP_list $PSF<list>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length3_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length3_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%limited ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%stateless (Set<$Ref> $Ref Int Int) Bool)
(declare-fun length2_impl%precondition ($Snap Set<$Ref> $Ref Int Int) Bool)
(declare-fun foo ($Snap $Ref Int) Bool)
(declare-fun foo%limited ($Snap $Ref Int) Bool)
(declare-fun foo%stateless ($Ref Int) Bool)
(declare-fun foo%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list2%trigger ($Snap $Ref Int) Bool)
(declare-fun list%trigger ($Snap $Ref) Bool)
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
; /field_value_functions_axioms.smt2 [next: Ref]
(assert (forall ((vs $FVF<next>) (ws $FVF<next>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_next vs) ($FVF.domain_next ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_next vs))
            (= ($FVF.lookup_next vs x) ($FVF.lookup_next ws x)))
          :pattern (($FVF.lookup_next vs x) ($FVF.lookup_next ws x))
          :qid |qp.$FVF<next>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<next>To$Snap vs)
              ($SortWrappers.$FVF<next>To$Snap ws)
              )
    :qid |qp.$FVF<next>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_next pm r))
    :pattern (($FVF.perm_next pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_next f r) true)
    :pattern (($FVF.loc_next f r)))))
; /predicate_snap_functions_axioms.smt2 [list2: Snap]
(assert (forall ((vs $PSF<list2>) (ws $PSF<list2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_list2 vs) ($PSF.domain_list2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_list2 vs))
            (= ($PSF.lookup_list2 vs x) ($PSF.lookup_list2 ws x)))
          :pattern (($PSF.lookup_list2 vs x) ($PSF.lookup_list2 ws x))
          :qid |qp.$PSF<list2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<list2>To$Snap vs)
              ($SortWrappers.$PSF<list2>To$Snap ws)
              )
    :qid |qp.$PSF<list2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_list2 pm s))
    :pattern (($PSF.perm_list2 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_list2 f s) true)
    :pattern (($PSF.loc_list2 f s)))))
; /predicate_snap_functions_axioms.smt2 [list: Snap]
(assert (forall ((vs $PSF<list>) (ws $PSF<list>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_list vs) ($PSF.domain_list ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_list vs))
            (= ($PSF.lookup_list vs x) ($PSF.lookup_list ws x)))
          :pattern (($PSF.lookup_list vs x) ($PSF.lookup_list ws x))
          :qid |qp.$PSF<list>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<list>To$Snap vs)
              ($SortWrappers.$PSF<list>To$Snap ws)
              )
    :qid |qp.$PSF<list>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_list pm s))
    :pattern (($PSF.perm_list pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_list f s) true)
    :pattern (($PSF.loc_list f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@19@00 () $Perm)
(declare-fun inv@22@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun sm@20@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun joined_unfolding@47@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun $k@26@00 () $Perm)
(declare-fun $k@27@00 () $Perm)
(declare-fun $k@34@00 () $Perm)
(declare-fun $k@41@00 () $Perm)
(declare-fun inv@35@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun inv@42@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun sm@23@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@28@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@29@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@30@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@38@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@45@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@48@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@49@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun joined_unfolding@64@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun sm@53@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@55@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@56@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@57@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@60@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@62@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@65@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun $k@67@00 () $Perm)
(declare-fun inv@68@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun joined_unfolding@93@00 ($Snap Set<$Ref> $Ref Int Int $Ref) Bool)
(declare-fun $k@72@00 () $Perm)
(declare-fun $k@73@00 () $Perm)
(declare-fun $k@80@00 () $Perm)
(declare-fun $k@87@00 () $Perm)
(declare-fun inv@81@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun inv@88@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $Ref)
(declare-fun sm@69@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@74@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $FVF<next>)
(declare-fun sm@75@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@76@00 ($Snap Set<$Ref> $Ref Int Int $Ref) $PSF<list>)
(declare-fun sm@84@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@91@00 ($Snap Set<$Ref> $Ref Int Int) $PSF<list>)
(declare-fun sm@94@00 ($Snap Set<$Ref> $Ref Int Int) $FVF<next>)
(declare-fun sm@95@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun joined_unfolding@108@00 ($Snap $Ref Int Int) Bool)
(declare-fun sm@99@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun sm@101@00 ($Snap $Ref Int Int) $PSF<list2>)
(declare-fun sm@104@00 ($Snap $Ref Int) $PSF<list2>)
(declare-fun sm@106@00 ($Snap $Ref Int) $PSF<list2>)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (=
    (length3_impl%limited s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
    (length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (length3_impl%stateless xs@0@00 y@1@00 akk@2@00 res@3@00)
  :pattern ((length3_impl%limited s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (and
    (forall ((x@18@00 $Ref)) (!
      (=>
        (and (Set_in x@18@00 xs@0@00) (< $Perm.No $k@19@00))
        (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@18@00) x@18@00))
      :pattern ((Set_in x@18@00 xs@0@00))
      :pattern (($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) ($SortWrappers.$RefTo$Snap x@18@00)) ($SortWrappers.$RefTo$Snap x@18@00)))
      :qid |quant-u-9|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
          (< $Perm.No $k@19@00))
        (= (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@33@00 $Ref)) (!
      (=>
        (and (Set_in x@33@00 xs@0@00) (< $Perm.No $k@34@00))
        (= (inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@33@00) x@33@00))
      :pattern ((Set_in x@33@00 xs@0@00))
      :pattern ((inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@33@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
          (< $Perm.No $k@34@00))
        (= (inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@40@00 $Ref)) (!
      (=>
        (and (Set_in x@40@00 xs@0@00) (< $Perm.No $k@41@00))
        (= (inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@40@00) x@40@00))
      :pattern ((Set_in x@40@00 xs@0@00))
      :pattern ((inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x@40@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) xs@0@00)
          (< $Perm.No $k@41@00))
        (= (inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x) x))
      :pattern ((inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 x))
      :qid |list-fctOfInv|))
    (forall ((s@21@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list (sm@20@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@21@00))
      :qid |qp.psmResTrgDef0|))
    (forall ((s@24@00 $Snap)) (!
      (=>
        (ite
          (Set_in (inv@22@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@24@00)) xs@0@00)
          (< $Perm.No $k@19@00)
          false)
        (and
          (not (= s@24@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@24@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@24@00))))
      :pattern (($PSF.lookup_list (sm@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@24@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@24@00))
      :qid |qp.psmValDef1|))
    (forall ((s@24@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@24@00) s@24@00)
      :pattern (($PSF.lookup_list (sm@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@24@00))
      :qid |qp.psmResTrgDef2|))
    (forall ((s@39@00 $Snap)) (!
      (and
        (=>
          (Set_in s@39@00 ($PSF.domain_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))
          (and
            (Set_in (inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00)
            (< $Perm.No $k@34@00)))
        (=>
          (and
            (Set_in (inv@35@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@39@00)) xs@0@00)
            (< $Perm.No $k@34@00))
          (Set_in s@39@00 ($PSF.domain_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))))
      :pattern ((Set_in s@39@00 ($PSF.domain_list (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))))
      :qid |qp.psmDomDef14|))
    (forall ((s@46@00 $Snap)) (!
      (and
        (=>
          (Set_in s@46@00 ($PSF.domain_list (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))
          (and
            (Set_in (inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@46@00)) xs@0@00)
            (< $Perm.No $k@41@00)))
        (=>
          (and
            (Set_in (inv@42@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00 ($SortWrappers.$SnapTo$Ref s@46@00)) xs@0@00)
            (< $Perm.No $k@41@00))
          (Set_in s@46@00 ($PSF.domain_list (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)))))
      :pattern ((Set_in s@46@00 ($PSF.domain_list (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))))
      :qid |qp.psmDomDef20|))
    (forall ((s@46@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@46@00) s@46@00)
      :pattern (($PSF.lookup_list (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) s@46@00))
      :qid |qp.psmResTrgDef19|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@48@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) r))
      :qid |qp.fvfResTrgDef21|))
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@26@00)
    ($Perm.isReadVar $k@27@00)
    ($Perm.isReadVar $k@34@00)
    ($Perm.isReadVar $k@41@00)
    (=>
      (length3_impl%precondition s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
      (=
        (length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@0@00) (= x y@1@00))
            (ite
              (=
                ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                $Ref.null)
              (= res@3@00 akk@2@00)
              (length3_impl%limited (ite
                (and
                  (not
                    (=
                      ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                      $Ref.null))
                  (=
                    ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                    $Ref.null)
                  (and (= x y@1@00) (Set_in x xs@0@00)))
                ($SortWrappers.$PSF<list>To$Snap (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
                ($SortWrappers.$PSF<list>To$Snap (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))) xs@0@00 ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x) (+
                akk@2@00
                1) res@3@00)))
          :pattern ((Set_in x xs@0@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x))
          )))))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref) (akk@2@00 Int) (res@3@00 Int)) (!
  (=>
    (length3_impl%precondition s@$ xs@0@00 y@1@00 akk@2@00 res@3@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@0@00) (= x y@1@00))
        (ite
          (=
            ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
            $Ref.null)
          true
          (length3_impl%precondition (ite
            (and
              (not
                (=
                  ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x)
                $Ref.null)
              (and (= x y@1@00) (Set_in x xs@0@00)))
            ($SortWrappers.$PSF<list>To$Snap (sm@45@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
            ($SortWrappers.$PSF<list>To$Snap (sm@38@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))) xs@0@00 ($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x) (+
            akk@2@00
            1) res@3@00)))
      :pattern ((Set_in x xs@0@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@23@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@29@00 s@$ xs@0@00 y@1@00 akk@2@00 res@3@00) x))
      )))
  :pattern ((length3_impl s@$ xs@0@00 y@1@00 akk@2@00 res@3@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (=
    (length_impl%limited s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
    (length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (length_impl%stateless xs@5@00 y@6@00 akk@7@00 res@8@00)
  :pattern ((length_impl%limited s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (and
    (=
      ($PSF.lookup_list (sm@49@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap y@6@00))
      s@$)
    (forall ((s@54@00 $Snap)) (!
      (=>
        (= ($SortWrappers.$SnapTo$Ref s@54@00) y@6@00)
        (and
          (not (= s@54@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00)
            ($PSF.lookup_list (sm@49@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00))))
      :pattern (($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00))
      :pattern (($PSF.lookup_list (sm@49@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00))
      :qid |qp.psmValDef23|))
    (forall ((s@54@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list (sm@49@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00) s@54@00)
      :pattern (($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@54@00))
      :qid |qp.psmResTrgDef24|))
    (forall ((s@61@00 $Snap)) (!
      (Set_in s@61@00 ($PSF.domain_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)))
      :pattern ((Set_in s@61@00 ($PSF.domain_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))))
      :qid |qp.psmDomDef31|))
    (forall ((s@63@00 $Snap)) (!
      (Set_in s@63@00 ($PSF.domain_list (sm@62@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)))
      :pattern ((Set_in s@63@00 ($PSF.domain_list (sm@62@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))))
      :qid |qp.psmDomDef33|))
    (forall ((s@63@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list (sm@62@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) s@63@00))
      :qid |qp.psmResTrgDef32|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@65@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) r))
      :qid |qp.fvfResTrgDef34|))
    (=>
      (length_impl%precondition s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
      (=
        (length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@5@00) (= x y@6@00))
            (ite
              (=
                ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                $Ref.null)
              (= res@8@00 akk@7@00)
              (length_impl%limited (ite
                (and
                  (not
                    (=
                      ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                      $Ref.null))
                  (=
                    ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                    $Ref.null)
                  (and (= x y@6@00) (Set_in x xs@5@00)))
                ($PSF.lookup_list (sm@62@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))
                ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))) xs@5@00 ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x) (+
                akk@7@00
                1) res@8@00)))
          :pattern ((Set_in x xs@5@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x))
          )))))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (xs@5@00 Set<$Ref>) (y@6@00 $Ref) (akk@7@00 Int) (res@8@00 Int)) (!
  (=>
    (length_impl%precondition s@$ xs@5@00 y@6@00 akk@7@00 res@8@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@5@00) (= x y@6@00))
        (ite
          (=
            ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
            $Ref.null)
          true
          (length_impl%precondition (ite
            (and
              (not
                (=
                  ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)
                $Ref.null)
              (and (= x y@6@00) (Set_in x xs@5@00)))
            ($PSF.lookup_list (sm@62@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))
            ($PSF.lookup_list (sm@60@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x)))) xs@5@00 ($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x) (+
            akk@7@00
            1) res@8@00)))
      :pattern ((Set_in x xs@5@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@53@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@56@00 s@$ xs@5@00 y@6@00 akk@7@00 res@8@00) x))
      )))
  :pattern ((length_impl s@$ xs@5@00 y@6@00 akk@7@00 res@8@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (=
    (length2_impl%limited s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
    (length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (length2_impl%stateless xs@10@00 y@11@00 akk@12@00 res@13@00)
  :pattern ((length2_impl%limited s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (and
    (forall ((x@66@00 $Ref)) (!
      (=>
        (and (Set_in x@66@00 xs@10@00) (< $Perm.No $k@67@00))
        (= (inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@66@00) x@66@00))
      :pattern ((Set_in x@66@00 xs@10@00))
      :pattern ((inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@66@00))
      :qid |quant-u-36|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
          (< $Perm.No $k@67@00))
        (= (inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@79@00 $Ref)) (!
      (=>
        (and (Set_in x@79@00 xs@10@00) (< $Perm.No $k@80@00))
        (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00) x@79@00))
      :pattern ((Set_in x@79@00 xs@10@00))
      :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@79@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
          (< $Perm.No $k@80@00))
        (= (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((x@86@00 $Ref)) (!
      (=>
        (and (Set_in x@86@00 xs@10@00) (< $Perm.No $k@87@00))
        (= (inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@86@00) x@86@00))
      :pattern ((Set_in x@86@00 xs@10@00))
      :pattern ((inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x@86@00))
      :qid |list-invOfFct|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (Set_in (inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) xs@10@00)
          (< $Perm.No $k@87@00))
        (= (inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x) x))
      :pattern ((inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 x))
      :qid |list-fctOfInv|))
    (forall ((s@70@00 $Snap)) (!
      (=>
        (ite
          (Set_in (inv@68@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@70@00)) xs@10@00)
          (< $Perm.No $k@67@00)
          false)
        (and
          (not (= s@70@00 $Snap.unit))
          (=
            ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00)
            ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00))))
      :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
      :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00))
      :qid |qp.psmValDef35|))
    (forall ((s@70@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@70@00) s@70@00)
      :pattern (($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@70@00))
      :qid |qp.psmResTrgDef36|))
    (forall ((s@85@00 $Snap)) (!
      (and
        (=>
          (Set_in s@85@00 ($PSF.domain_list (sm@84@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@85@00)) xs@10@00)
            (< $Perm.No $k@80@00)))
        (=>
          (and
            (Set_in (inv@81@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@85@00)) xs@10@00)
            (< $Perm.No $k@80@00))
          (Set_in s@85@00 ($PSF.domain_list (sm@84@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))))
      :pattern ((Set_in s@85@00 ($PSF.domain_list (sm@84@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))))
      :qid |qp.psmDomDef48|))
    (forall ((s@92@00 $Snap)) (!
      (and
        (=>
          (Set_in s@92@00 ($PSF.domain_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))
          (and
            (Set_in (inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00)
            (< $Perm.No $k@87@00)))
        (=>
          (and
            (Set_in (inv@88@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00 ($SortWrappers.$SnapTo$Ref s@92@00)) xs@10@00)
            (< $Perm.No $k@87@00))
          (Set_in s@92@00 ($PSF.domain_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)))))
      :pattern ((Set_in s@92@00 ($PSF.domain_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))))
      :qid |qp.psmDomDef54|))
    (forall ((s@92@00 $Snap)) (!
      ($PSF.loc_list ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> s@$) s@92@00) s@92@00)
      :pattern (($PSF.lookup_list (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) s@92@00))
      :qid |qp.psmResTrgDef53|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_next (sm@94@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) r))
      :qid |qp.fvfResTrgDef55|))
    ($Perm.isReadVar $k@67@00)
    ($Perm.isReadVar $k@72@00)
    ($Perm.isReadVar $k@73@00)
    ($Perm.isReadVar $k@80@00)
    ($Perm.isReadVar $k@87@00)
    (=>
      (length2_impl%precondition s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
      (=
        (length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
        (forall ((x $Ref)) (!
          (=>
            (and (Set_in x xs@10@00) (= x y@11@00))
            (ite
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                $Ref.null)
              (= res@13@00 akk@12@00)
              (length2_impl%limited (ite
                (and
                  (not
                    (=
                      ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                      $Ref.null))
                  (=
                    ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                    $Ref.null)
                  (and (= x y@11@00) (Set_in x xs@10@00)))
                ($SortWrappers.$PSF<list>To$Snap (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
                ($SortWrappers.$PSF<list>To$Snap (sm@84@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x) (+
                akk@12@00
                1) res@13@00)))
          :pattern ((Set_in x xs@10@00))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x))))
          :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x))
          )))))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-51|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Set<$Ref>) (y@11@00 $Ref) (akk@12@00 Int) (res@13@00 Int)) (!
  (=>
    (length2_impl%precondition s@$ xs@10@00 y@11@00 akk@12@00 res@13@00)
    (forall ((x $Ref)) (!
      (=>
        (and (Set_in x xs@10@00) (= x y@11@00))
        (ite
          (=
            ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
            $Ref.null)
          true
          (length2_impl%precondition (ite
            (and
              (not
                (=
                  ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                  $Ref.null))
              (=
                ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x)
                $Ref.null)
              (and (= x y@11@00) (Set_in x xs@10@00)))
            ($SortWrappers.$PSF<list>To$Snap (sm@91@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
            ($SortWrappers.$PSF<list>To$Snap (sm@84@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))) xs@10@00 ($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x) (+
            akk@12@00
            1) res@13@00)))
      :pattern ((Set_in x xs@10@00))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list (sm@69@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) ($SortWrappers.$RefTo$Snap x))))
      :pattern (($FVF.lookup_next (sm@75@00 s@$ xs@10@00 y@11@00 akk@12@00 res@13@00) x))
      )))
  :pattern ((length2_impl s@$ xs@10@00 y@11@00 akk@12@00 res@13@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (= (foo%limited s@$ l@15@00 i@16@00) (foo s@$ l@15@00 i@16@00))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (foo%stateless l@15@00 i@16@00)
  :pattern ((foo%limited s@$ l@15@00 i@16@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (and
    (=
      ($PSF.lookup_list2 (sm@95@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap i@16@00)))
      s@$)
    (forall ((s@100@00 $Snap)) (!
      (=>
        (and
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@100@00)) l@15@00)
          (= ($SortWrappers.$SnapToInt ($Snap.second s@100@00)) i@16@00))
        (and
          (not (= s@100@00 $Snap.unit))
          (=
            ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) s@100@00)
            ($PSF.lookup_list2 (sm@95@00 s@$ l@15@00 i@16@00) s@100@00))))
      :pattern (($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) s@100@00))
      :pattern (($PSF.lookup_list2 (sm@95@00 s@$ l@15@00 i@16@00) s@100@00))
      :qid |qp.psmValDef57|))
    (forall ((s@100@00 $Snap)) (!
      ($PSF.loc_list2 ($PSF.lookup_list2 (sm@95@00 s@$ l@15@00 i@16@00) s@100@00) s@100@00)
      :pattern (($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) s@100@00))
      :qid |qp.psmResTrgDef58|))
    (forall ((s@105@00 $Snap)) (!
      (Set_in s@105@00 ($PSF.domain_list2 (sm@104@00 s@$ l@15@00 i@16@00)))
      :pattern ((Set_in s@105@00 ($PSF.domain_list2 (sm@104@00 s@$ l@15@00 i@16@00))))
      :qid |qp.psmDomDef63|))
    (forall ((s@107@00 $Snap)) (!
      (Set_in s@107@00 ($PSF.domain_list2 (sm@106@00 s@$ l@15@00 i@16@00)))
      :pattern ((Set_in s@107@00 ($PSF.domain_list2 (sm@106@00 s@$ l@15@00 i@16@00))))
      :qid |qp.psmDomDef65|))
    (forall ((s@107@00 $Snap)) (!
      true
      :pattern (($PSF.lookup_list2 (sm@106@00 s@$ l@15@00 i@16@00) s@107@00))
      :qid |qp.psmResTrgDef64|))
    (=>
      (foo%precondition s@$ l@15@00 i@16@00)
      (=
        (foo s@$ l@15@00 i@16@00)
        (forall ((j Int)) (!
          (=>
            (= i@16@00 j)
            (ite
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null)
              true
              (foo%limited (ite
                (and
                  (not
                    (=
                      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                        ($SortWrappers.$RefTo$Snap l@15@00)
                        ($SortWrappers.IntTo$Snap j))))))
                      $Ref.null))
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                      ($SortWrappers.$RefTo$Snap l@15@00)
                      ($SortWrappers.IntTo$Snap j))))))
                    $Ref.null)
                  (= i@16@00 j))
                ($PSF.lookup_list2 (sm@106@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))
                ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j)))))
                  ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))) j)))
          :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          :pattern ((foo%limited (ite
            (and
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null)
              (= i@16@00 j))
            ($PSF.lookup_list2 (sm@106@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))) j))
          )))))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-60|)))
; WARNING: (1372,11): 'not' cannot be used in patterns.
; WARNING: (1372,11): 'and' cannot be used in patterns.
; WARNING: (1372,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (l@15@00 $Ref) (i@16@00 Int)) (!
  (=>
    (foo%precondition s@$ l@15@00 i@16@00)
    (forall ((j Int)) (!
      (=>
        (= i@16@00 j)
        (ite
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null)
          true
          (foo%precondition (ite
            (and
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                    ($SortWrappers.$RefTo$Snap l@15@00)
                    ($SortWrappers.IntTo$Snap j))))))
                  $Ref.null))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                  ($SortWrappers.$RefTo$Snap l@15@00)
                  ($SortWrappers.IntTo$Snap j))))))
                $Ref.null)
              (= i@16@00 j))
            ($PSF.lookup_list2 (sm@106@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))
            ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j)))))
              ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))) j)))
      :pattern (($SortWrappers.$SnapToBool ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j)))))
      :pattern ((foo%limited (ite
        (and
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
                ($SortWrappers.$RefTo$Snap l@15@00)
                ($SortWrappers.IntTo$Snap j))))))
              $Ref.null))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
              ($SortWrappers.$RefTo$Snap l@15@00)
              ($SortWrappers.IntTo$Snap j))))))
            $Ref.null)
          (= i@16@00 j))
        ($PSF.lookup_list2 (sm@106@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))
        ($PSF.lookup_list2 (sm@104@00 s@$ l@15@00 i@16@00) ($Snap.combine
          ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
            ($SortWrappers.$RefTo$Snap l@15@00)
            ($SortWrappers.IntTo$Snap j)))))
          ($SortWrappers.IntTo$Snap j)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list2 (sm@99@00 s@$ l@15@00 i@16@00) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@15@00)
        ($SortWrappers.IntTo$Snap j)))))) j))
      )))
  :pattern ((foo s@$ l@15@00 i@16@00))
  :qid |quant-u-61|)))
; WARNING: (1443,7): 'not' cannot be used in patterns.
; WARNING: (1443,7): 'and' cannot be used in patterns.
; WARNING: (1443,7): 'if' cannot be used in patterns.
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_foo1 ----------
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
; var x1: Ref
(declare-const x1@0@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@1@01 $Ref)
(assert (not (= x1@1@01 $Ref.null)))
(declare-const elem@2@01 Int)
(declare-const next@3@01 $Ref)
(assert (not (= x1@1@01 x1@0@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
; [exec]
; assert foo(x1, 77)
; [eval] foo(x1, 77)
(push) ; 4
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(pop) ; 4
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(push) ; 4
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@2@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@1@01 77))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_foo2 ----------
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
; var x1: Ref
(declare-const x1@4@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@5@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@6@01 $Ref)
(assert (not (= x1@6@01 $Ref.null)))
(declare-const elem@7@01 Int)
(declare-const next@8@01 $Ref)
(assert (not (= x1@6@01 x1@4@01)))
(assert (not (= x1@6@01 x2@5@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 3
; [else-branch: 1 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@7@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@6@01 77))
; [exec]
; x2 := new(elem, next)
(declare-const x2@9@01 $Ref)
(assert (not (= x2@9@01 $Ref.null)))
(declare-const elem@10@01 Int)
(declare-const next@11@01 $Ref)
(assert (not (= x2@9@01 x1@6@01)))
(assert (not (= x2@9@01 x2@5@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list2(x2, 77), write)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | x1@6@01 != Null | live]
; [else-branch: 2 | x1@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | x1@6@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
; [exec]
; assert foo(x2, 77)
; [eval] foo(x2, 77)
(push) ; 5
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
(pop) ; 5
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77))
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x2, 77)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@10@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@6@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@7@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@9@01 77)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_foo4 ----------
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
; var x1: Ref
(declare-const x1@12@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@13@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@14@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@15@01 $Ref)
; [exec]
; x1 := new(elem, next)
(declare-const x1@16@01 $Ref)
(assert (not (= x1@16@01 $Ref.null)))
(declare-const elem@17@01 Int)
(declare-const next@18@01 $Ref)
(assert (not (= x1@16@01 x4@15@01)))
(assert (not (= x1@16@01 x2@13@01)))
(assert (not (= x1@16@01 x1@12@01)))
(assert (not (= x1@16@01 x3@14@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list2(x1, 77), write)
; [eval] this.next != null
; [then-branch: 3 | False | dead]
; [else-branch: 3 | True | live]
(push) ; 3
; [else-branch: 3 | True]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@17@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x1@16@01 77))
; [exec]
; x2 := new(elem, next)
(declare-const x2@19@01 $Ref)
(assert (not (= x2@19@01 $Ref.null)))
(declare-const elem@20@01 Int)
(declare-const next@21@01 $Ref)
(assert (not (= x2@19@01 x4@15@01)))
(assert (not (= x2@19@01 x2@13@01)))
(assert (not (= x2@19@01 x1@16@01)))
(assert (not (= x2@19@01 x3@14@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list2(x2, 77), write)
; [eval] this.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@16@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | x1@16@01 != Null | live]
; [else-branch: 4 | x1@16@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | x1@16@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@20@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@16@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@17@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x2@19@01 77))
; [exec]
; x3 := new(elem, next)
(declare-const x3@22@01 $Ref)
(assert (not (= x3@22@01 $Ref.null)))
(declare-const elem@23@01 Int)
(declare-const next@24@01 $Ref)
(assert (not (= x3@22@01 x4@15@01)))
(assert (not (= x3@22@01 x1@16@01)))
(assert (not (= x3@22@01 x3@14@01)))
(assert (not (= x3@22@01 x2@19@01)))
; [exec]
; x3.next := x2
; [exec]
; fold acc(list2(x3, 77), write)
; [eval] this.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@19@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | x2@19@01 != Null | live]
; [else-branch: 5 | x2@19@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | x2@19@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@23@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@20@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x1@16@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@17@01)
          ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))) x3@22@01 77))
; [exec]
; x4 := new(elem, next)
(declare-const x4@25@01 $Ref)
(assert (not (= x4@25@01 $Ref.null)))
(declare-const elem@26@01 Int)
(declare-const next@27@01 $Ref)
(assert (not (= x4@25@01 x3@22@01)))
(assert (not (= x4@25@01 x4@15@01)))
(assert (not (= x4@25@01 x1@16@01)))
(assert (not (= x4@25@01 x2@19@01)))
; [exec]
; x4.next := x3
; [exec]
; fold acc(list2(x4, 77), write)
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@22@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | x3@22@01 != Null | live]
; [else-branch: 6 | x3@22@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | x3@22@01 != Null]
(assert (list2%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
; [exec]
; assert foo(x4, 77)
; [eval] foo(x4, 77)
(push) ; 7
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
(pop) ; 7
; Joined path conditions
(assert (foo%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77))
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] foo(x4, 77)
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (foo ($Snap.combine
  ($SortWrappers.IntTo$Snap elem@26@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@22@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap elem@23@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x2@19@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap elem@20@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x1@16@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap elem@17@01)
              ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))))))) x4@25@01 77)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_length1 ----------
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
; var x1: Ref
(declare-const x1@28@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@29@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@30@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@31@01 $Ref)
(assert (not (= x1@31@01 $Ref.null)))
(declare-const next@32@01 $Ref)
(assert (not (= x1@31@01 x1@28@01)))
(assert (not (Set_in x1@31@01 xs@29@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 3
; [else-branch: 7 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@31@01))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@33@01 Set<$Ref>)
(assert (Set_equal xs@33@01 (Set_singleton x1@31@01)))
; [exec]
; inhale length_impl(xs, x1, 1, res)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] length_impl(xs, x1, 1, res)
(push) ; 4
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
(pop) ; 4
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap $Ref.null)
  $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
(assert (length_impl ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) xs@33@01 x1@31@01 1 res@30@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@30@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_length2 ----------
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
; var x1: Ref
(declare-const x1@35@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@36@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@37@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@38@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@39@01 $Ref)
(assert (not (= x1@39@01 $Ref.null)))
(declare-const next@40@01 $Ref)
(assert (not (= x1@39@01 x2@36@01)))
(assert (not (= x1@39@01 x1@35@01)))
(assert (not (Set_in x1@39@01 xs@37@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 8 | False | dead]
; [else-branch: 8 | True | live]
(push) ; 3
; [else-branch: 8 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@39@01))
; [exec]
; x2 := new(next)
(declare-const x2@41@01 $Ref)
(assert (not (= x2@41@01 $Ref.null)))
(declare-const next@42@01 $Ref)
(assert (not (= x2@41@01 x2@36@01)))
(assert (not (= x2@41@01 x1@39@01)))
(assert (not (Set_in x2@41@01 xs@37@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list(x2), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@39@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | x1@39@01 != Null | live]
; [else-branch: 9 | x1@39@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | x1@39@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x2@41@01))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@43@01 Set<$Ref>)
(assert (Set_equal xs@43@01 (Set_unionone (Set_singleton x1@39@01) x2@41@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(push) ; 5
(assert (not (Set_in x1@39@01 xs@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x1@39@01 xs@43@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@41@01 xs@43@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x2@41@01 xs@43@01))
; [exec]
; inhale length_impl(xs, x2, 1, res)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] length_impl(xs, x2, 1, res)
(push) ; 5
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
(pop) ; 5
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
(assert (length_impl ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@39@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) xs@43@01 x2@41@01 1 res@38@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@38@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_length4 ----------
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
; var x1: Ref
(declare-const x1@45@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@46@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@47@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@48@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@49@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@50@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@51@01 $Ref)
(assert (not (= x1@51@01 $Ref.null)))
(declare-const next@52@01 $Ref)
(assert (not (= x1@51@01 x3@47@01)))
(assert (not (= x1@51@01 x1@45@01)))
(assert (not (= x1@51@01 x4@48@01)))
(assert (not (= x1@51@01 x2@46@01)))
(assert (not (Set_in x1@51@01 xs@49@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(push) ; 3
; [else-branch: 10 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@51@01))
; [exec]
; x2 := new(next)
(declare-const x2@53@01 $Ref)
(assert (not (= x2@53@01 $Ref.null)))
(declare-const next@54@01 $Ref)
(assert (not (= x2@53@01 x1@51@01)))
(assert (not (= x2@53@01 x3@47@01)))
(assert (not (= x2@53@01 x4@48@01)))
(assert (not (= x2@53@01 x2@46@01)))
(assert (not (Set_in x2@53@01 xs@49@01)))
; [exec]
; x2.next := x1
; [exec]
; fold acc(list(x2), write)
; [eval] x.next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@51@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | x1@51@01 != Null | live]
; [else-branch: 11 | x1@51@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | x1@51@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@51@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) x2@53@01))
; [exec]
; x3 := new(next)
(declare-const x3@55@01 $Ref)
(assert (not (= x3@55@01 $Ref.null)))
(declare-const next@56@01 $Ref)
(assert (not (= x3@55@01 x1@51@01)))
(assert (not (= x3@55@01 x3@47@01)))
(assert (not (= x3@55@01 x4@48@01)))
(assert (not (= x3@55@01 x2@53@01)))
(assert (not (Set_in x3@55@01 xs@49@01)))
; [exec]
; x3.next := x2
; [exec]
; fold acc(list(x3), write)
; [eval] x.next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@53@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | x2@53@01 != Null | live]
; [else-branch: 12 | x2@53@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | x2@53@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@53@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@51@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) x3@55@01))
; [exec]
; x4 := new(next)
(declare-const x4@57@01 $Ref)
(assert (not (= x4@57@01 $Ref.null)))
(declare-const next@58@01 $Ref)
(assert (not (= x4@57@01 x1@51@01)))
(assert (not (= x4@57@01 x3@55@01)))
(assert (not (= x4@57@01 x4@48@01)))
(assert (not (= x4@57@01 x2@53@01)))
(assert (not (Set_in x4@57@01 xs@49@01)))
; [exec]
; x4.next := x3
; [exec]
; fold acc(list(x4), write)
; [eval] x.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@55@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | x3@55@01 != Null | live]
; [else-branch: 13 | x3@55@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | x3@55@01 != Null]
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) x4@57@01))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@59@01 Set<$Ref>)
(assert (Set_equal xs@59@01 (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@51@01) x2@53@01) x4@57@01) x3@55@01)))
; [exec]
; inhale length_impl(xs, x4, 1, res)
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 $Snap.unit))
; [eval] length_impl(xs, x4, 1, res)
(push) ; 7
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
(pop) ; 7
; Joined path conditions
(assert (length_impl%precondition ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
(assert (length_impl ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@55@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@53@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap x1@51@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))) xs@59@01 x4@57@01 1 res@50@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@50@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_length1 ----------
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
; var x1: Ref
(declare-const x1@61@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@62@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@63@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@64@01 $Ref)
(assert (not (= x1@64@01 $Ref.null)))
(declare-const next@65@01 $Ref)
(assert (not (= x1@64@01 x1@61@01)))
(assert (not (Set_in x1@64@01 xs@62@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 14 | False | dead]
; [else-branch: 14 | True | live]
(push) ; 3
; [else-branch: 14 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@64@01))
(declare-const sm@66@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@66@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@64@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@67@01 Set<$Ref>)
(assert (Set_equal xs@67@01 (Set_singleton x1@64@01)))
; [exec]
; inhale length2_impl(xs, x1, 1, res)
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 $Snap.unit))
; [eval] length2_impl(xs, x1, 1, res)
(push) ; 4
(declare-const x@69@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@69@01 xs@67@01))
(declare-const $k@70@01 $Perm)
(assert ($Perm.isReadVar $k@70@01))
(pop) ; 5
(declare-fun inv@71@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@70@01))
; Nested auxiliary terms: non-globals
(push) ; 5
(assert (not (forall ((x@69@01 $Ref)) (!
  (=> (Set_in x@69@01 xs@67@01) (or (= $k@70@01 $Perm.No) (< $Perm.No $k@70@01)))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@69@01 $Ref) (x2@69@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@69@01 xs@67@01) (< $Perm.No $k@70@01))
      (and (Set_in x2@69@01 xs@67@01) (< $Perm.No $k@70@01))
      (= x1@69@01 x2@69@01))
    (= x1@69@01 x2@69@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@69@01 $Ref)) (!
  (=>
    (and (Set_in x@69@01 xs@67@01) (< $Perm.No $k@70@01))
    (= (inv@71@01 x@69@01) x@69@01))
  :pattern ((Set_in x@69@01 xs@67@01))
  :pattern ((inv@71@01 x@69@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@71@01 x) xs@67@01) (< $Perm.No $k@70@01))
    (= (inv@71@01 x) x))
  :pattern ((inv@71@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@71@01 x) xs@67@01)
    ($Perm.min (ite (= x x1@64@01) $Perm.Write $Perm.No) $k@70@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@70@01
(assert (=>
  (not (= (ite (= x1@64@01 x1@64@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x1@64@01 x1@64@01)
    (<
      (ite (Set_in (inv@71@01 x1@64@01) xs@67@01) $k@70@01 $Perm.No)
      $Perm.Write)
    (< (ite (Set_in (inv@71@01 x1@64@01) xs@67@01) $k@70@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (Set_in (inv@71@01 x) xs@67@01) (= (- $k@70@01 (pTaken@72@01 x)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $PSF<list>)
(declare-const s@74@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@74@01 $Snap)) (!
  (and
    (=>
      (Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>)))
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01)))
    (=>
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01))
      (Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>)))))
  :pattern ((Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>))))
  :qid |qp.psmDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@74@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01))
      (= ($SortWrappers.$SnapTo$Ref s@74@01) x1@64@01))
    (and
      (not (= s@74@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@73@01  $PSF<list>) s@74@01)
        ($PSF.lookup_list (as sm@66@01  $PSF<list>) s@74@01))))
  :pattern (($PSF.lookup_list (as sm@73@01  $PSF<list>) s@74@01))
  :pattern (($PSF.lookup_list (as sm@66@01  $PSF<list>) s@74@01))
  :qid |qp.psmValDef1|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@73@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@70@01))
(assert (forall ((x@69@01 $Ref)) (!
  (=>
    (and (Set_in x@69@01 xs@67@01) (< $Perm.No $k@70@01))
    (= (inv@71@01 x@69@01) x@69@01))
  :pattern ((Set_in x@69@01 xs@67@01))
  :pattern ((inv@71@01 x@69@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@71@01 x) xs@67@01) (< $Perm.No $k@70@01))
    (= (inv@71@01 x) x))
  :pattern ((inv@71@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@74@01 $Snap)) (!
  (and
    (=>
      (Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>)))
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01)))
    (=>
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01))
      (Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>)))))
  :pattern ((Set_in s@74@01 ($PSF.domain_list (as sm@73@01  $PSF<list>))))
  :qid |qp.psmDomDef2|)))
(assert (forall ((s@74@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@71@01 ($SortWrappers.$SnapTo$Ref s@74@01)) xs@67@01)
        (< $Perm.No $k@70@01))
      (= ($SortWrappers.$SnapTo$Ref s@74@01) x1@64@01))
    (and
      (not (= s@74@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@73@01  $PSF<list>) s@74@01)
        ($PSF.lookup_list (as sm@66@01  $PSF<list>) s@74@01))))
  :pattern (($PSF.lookup_list (as sm@73@01  $PSF<list>) s@74@01))
  :pattern (($PSF.lookup_list (as sm@66@01  $PSF<list>) s@74@01))
  :qid |qp.psmValDef1|)))
(assert (and
  (=>
    (not (= (ite (= x1@64@01 x1@64@01) $Perm.Write $Perm.No) $Perm.No))
    (ite
      (= x1@64@01 x1@64@01)
      (<
        (ite (Set_in (inv@71@01 x1@64@01) xs@67@01) $k@70@01 $Perm.No)
        $Perm.Write)
      (< (ite (Set_in (inv@71@01 x1@64@01) xs@67@01) $k@70@01 $Perm.No) $Perm.No)))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@73@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@73@01  $PSF<list>)) xs@67@01 x1@64@01 1 res@63@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@63@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_length2 ----------
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
; var x1: Ref
(declare-const x1@75@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@76@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@77@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@78@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@79@01 $Ref)
(assert (not (= x1@79@01 $Ref.null)))
(declare-const next@80@01 $Ref)
(assert (not (= x1@79@01 x1@75@01)))
(assert (not (= x1@79@01 x2@76@01)))
(assert (not (Set_in x1@79@01 xs@77@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@81@01 $Perm)
(assert ($Perm.isReadVar $k@81@01))
(assert (< $k@81@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@81@01)))
(assert (<= (- $Perm.Write $k@81@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@81@01)) (not (= x1@79@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@81@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 15 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@79@01))
(declare-const sm@82@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; x2 := new(next)
(declare-const x2@83@01 $Ref)
(assert (not (= x2@83@01 $Ref.null)))
(declare-const next@84@01 $Ref)
(assert (not (= x2@83@01 x1@79@01)))
(assert (not (= x2@83@01 x2@76@01)))
(assert (not (Set_in x2@83@01 xs@77@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@79@01 x2@83@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
(assert (< $k@85@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@85@01)))
(assert (<= (- $Perm.Write $k@85@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@85@01)) (not (= x2@83@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@85@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@79@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | x1@79@01 != Null | live]
; [else-branch: 16 | x1@79@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | x1@79@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((x $Ref)) $Perm
  (ite
    (= x x1@79@01)
    ($Perm.min (ite (= x x1@79@01) $k@81@01 $Perm.No) $k@85@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@85@01
(assert (=>
  (not (= (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) $Perm.No))
  (ite
    (= x1@79@01 x1@79@01)
    (< (ite (= x1@79@01 x1@79@01) $k@85@01 $Perm.No) $k@81@01)
    (< (ite (= x1@79@01 x1@79@01) $k@85@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@79@01) (= (- $k@85@01 (pTaken@86@01 x)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@87@01 $PSF<list>)
(declare-const s@88@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x1@79@01) ($PSF.domain_list (as sm@87@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite (= x1@79@01 x1@79@01) (< $Perm.No $k@81@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@79@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@87@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@79@01)
  ($PSF.lookup_list (as sm@87@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))) x2@83@01))
(declare-const sm@89@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@79@01)
    ($PSF.lookup_list (as sm@87@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01)))))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@90@01 Set<$Ref>)
(assert (Set_equal xs@90@01 (Set_unionone (Set_singleton x1@79@01) x2@83@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(set-option :timeout 0)
(push) ; 5
(assert (not (Set_in x1@79@01 xs@90@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x1@79@01 xs@90@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@83@01 xs@90@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x2@83@01 xs@90@01))
; [exec]
; inhale length2_impl(xs, x2, 1, res)
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 $Snap.unit))
; [eval] length2_impl(xs, x2, 1, res)
(push) ; 5
(declare-const x@92@01 $Ref)
(push) ; 6
; [eval] (x in xs)
(assert (Set_in x@92@01 xs@90@01))
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(pop) ; 6
(declare-fun inv@94@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@93@01))
; Nested auxiliary terms: non-globals
(push) ; 6
(assert (not (forall ((x@92@01 $Ref)) (!
  (=> (Set_in x@92@01 xs@90@01) (or (= $k@93@01 $Perm.No) (< $Perm.No $k@93@01)))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@92@01 $Ref) (x2@92@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@92@01 xs@90@01) (< $Perm.No $k@93@01))
      (and (Set_in x2@92@01 xs@90@01) (< $Perm.No $k@93@01))
      (= x1@92@01 x2@92@01))
    (= x1@92@01 x2@92@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@92@01 $Ref)) (!
  (=>
    (and (Set_in x@92@01 xs@90@01) (< $Perm.No $k@93@01))
    (= (inv@94@01 x@92@01) x@92@01))
  :pattern ((Set_in x@92@01 xs@90@01))
  :pattern ((inv@94@01 x@92@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@94@01 x) xs@90@01) (< $Perm.No $k@93@01))
    (= (inv@94@01 x) x))
  :pattern ((inv@94@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@94@01 x) xs@90@01)
    ($Perm.min (ite (= x x2@83@01) $k@85@01 $Perm.No) $k@93@01)
    $Perm.No))
(define-fun pTaken@96@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@94@01 x) xs@90@01)
    ($Perm.min
      (- (ite (= x x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x))
      (- $k@93@01 (pTaken@95@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@93@01
(assert (=>
  (not (= (ite (= x2@83@01 x2@83@01) $k@85@01 $Perm.No) $Perm.No))
  (ite
    (= x2@83@01 x2@83@01)
    (< (ite (Set_in (inv@94@01 x2@83@01) xs@90@01) $k@93@01 $Perm.No) $k@85@01)
    (< (ite (Set_in (inv@94@01 x2@83@01) xs@90@01) $k@93@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (Set_in (inv@94@01 x) xs@90@01) (= (- $k@93@01 (pTaken@95@01 x)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@93@01
(assert (=>
  (not
    (=
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@94@01 x1@79@01) xs@90@01) $k@93@01 $Perm.No)
    (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@94@01 x) xs@90@01)
    (= (- (- $k@93@01 (pTaken@95@01 x)) (pTaken@96@01 x)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@97@01 $PSF<list>)
(declare-const s@98@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@98@01 $Snap)) (!
  (and
    (=>
      (Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>)))
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01)))
    (=>
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>)))))
  :pattern ((Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>))))
  :qid |qp.psmDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@98@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@98@01) x2@83@01)
        (< $Perm.No $k@85@01)
        false))
    (and
      (not (= s@98@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01)
        ($PSF.lookup_list (as sm@89@01  $PSF<list>) s@98@01))))
  :pattern (($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01))
  :pattern (($PSF.lookup_list (as sm@89@01  $PSF<list>) s@98@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@98@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@98@01) x1@79@01)
            $k@81@01
            $Perm.No)
          (pTaken@86@01 ($SortWrappers.$SnapTo$Ref s@98@01)))))
    (and
      (not (= s@98@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01)
        ($PSF.lookup_list (as sm@82@01  $PSF<list>) s@98@01))))
  :pattern (($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01))
  :pattern (($PSF.lookup_list (as sm@82@01  $PSF<list>) s@98@01))
  :qid |qp.psmValDef9|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@97@01  $PSF<list>)) xs@90@01 x2@83@01 1 res@78@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@93@01))
(assert (forall ((x@92@01 $Ref)) (!
  (=>
    (and (Set_in x@92@01 xs@90@01) (< $Perm.No $k@93@01))
    (= (inv@94@01 x@92@01) x@92@01))
  :pattern ((Set_in x@92@01 xs@90@01))
  :pattern ((inv@94@01 x@92@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@94@01 x) xs@90@01) (< $Perm.No $k@93@01))
    (= (inv@94@01 x) x))
  :pattern ((inv@94@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@98@01 $Snap)) (!
  (and
    (=>
      (Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>)))
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01)))
    (=>
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>)))))
  :pattern ((Set_in s@98@01 ($PSF.domain_list (as sm@97@01  $PSF<list>))))
  :qid |qp.psmDomDef10|)))
(assert (forall ((s@98@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@98@01) x2@83@01)
        (< $Perm.No $k@85@01)
        false))
    (and
      (not (= s@98@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01)
        ($PSF.lookup_list (as sm@89@01  $PSF<list>) s@98@01))))
  :pattern (($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01))
  :pattern (($PSF.lookup_list (as sm@89@01  $PSF<list>) s@98@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@98@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@94@01 ($SortWrappers.$SnapTo$Ref s@98@01)) xs@90@01)
        (< $Perm.No $k@93@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@98@01) x1@79@01)
            $k@81@01
            $Perm.No)
          (pTaken@86@01 ($SortWrappers.$SnapTo$Ref s@98@01)))))
    (and
      (not (= s@98@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01)
        ($PSF.lookup_list (as sm@82@01  $PSF<list>) s@98@01))))
  :pattern (($PSF.lookup_list (as sm@97@01  $PSF<list>) s@98@01))
  :pattern (($PSF.lookup_list (as sm@82@01  $PSF<list>) s@98@01))
  :qid |qp.psmValDef9|)))
(assert (and
  (=>
    (not (= (ite (= x2@83@01 x2@83@01) $k@85@01 $Perm.No) $Perm.No))
    (ite
      (= x2@83@01 x2@83@01)
      (< (ite (Set_in (inv@94@01 x2@83@01) xs@90@01) $k@93@01 $Perm.No) $k@85@01)
      (< (ite (Set_in (inv@94@01 x2@83@01) xs@90@01) $k@93@01 $Perm.No) $Perm.No)))
  (=>
    (not
      (=
        (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@94@01 x1@79@01) xs@90@01) $k@93@01 $Perm.No)
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@97@01  $PSF<list>)) xs@90@01 x2@83@01 1 res@78@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@97@01  $PSF<list>)) xs@90@01 x2@83@01 1 res@78@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@78@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@79@01 x2@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false)
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01))
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01)))
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@85@01) (- $Perm.Write $k@81@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@81@01) (- $Perm.Write $k@85@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@85@01))
    (< $Perm.No (- $Perm.Write $k@81@01)))
  (not (= x1@79@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@81@01))
    (< $Perm.No (- $Perm.Write $k@85@01)))
  (not (= $Ref.null x1@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@78@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@79@01 x2@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false)
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01))
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01)))
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@85@01) (- $Perm.Write $k@81@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@81@01) (- $Perm.Write $k@85@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@85@01))
    (< $Perm.No (- $Perm.Write $k@81@01)))
  (not (= x1@79@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@81@01))
    (< $Perm.No (- $Perm.Write $k@85@01)))
  (not (= $Ref.null x1@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@78@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@79@01 x2@83@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false)
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01))
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (- (ite (= x1@79@01 x1@79@01) $k@81@01 $Perm.No) (pTaken@86@01 x1@79@01)))
    (ite (= x2@83@01 x2@83@01) (< $Perm.No $k@85@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@82@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@79@01))
      ($PSF.lookup_list (as sm@89@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@83@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@85@01) (- $Perm.Write $k@81@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@81@01) (- $Perm.Write $k@85@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@85@01))
    (< $Perm.No (- $Perm.Write $k@81@01)))
  (not (= x1@79@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@81@01))
    (< $Perm.No (- $Perm.Write $k@85@01)))
  (not (= $Ref.null x1@79@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@83@01 x1@79@01)) (not (= x1@79@01 x2@83@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@78@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_length4 ----------
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
; var x1: Ref
(declare-const x1@99@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@100@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@101@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@102@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@103@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@104@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@105@01 $Ref)
(assert (not (= x1@105@01 $Ref.null)))
(declare-const next@106@01 $Ref)
(assert (not (= x1@105@01 x2@100@01)))
(assert (not (= x1@105@01 x1@99@01)))
(assert (not (= x1@105@01 x4@102@01)))
(assert (not (= x1@105@01 x3@101@01)))
(assert (not (Set_in x1@105@01 xs@103@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@107@01 $Perm)
(assert ($Perm.isReadVar $k@107@01))
(assert (< $k@107@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@107@01)))
(assert (<= (- $Perm.Write $k@107@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@107@01)) (not (= x1@105@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@107@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 17 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@105@01))
(declare-const sm@108@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
; [exec]
; x2 := new(next)
(declare-const x2@109@01 $Ref)
(assert (not (= x2@109@01 $Ref.null)))
(declare-const next@110@01 $Ref)
(assert (not (= x2@109@01 x1@105@01)))
(assert (not (= x2@109@01 x2@100@01)))
(assert (not (= x2@109@01 x4@102@01)))
(assert (not (= x2@109@01 x3@101@01)))
(assert (not (Set_in x2@109@01 xs@103@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@105@01 x2@109@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@111@01 $Perm)
(assert ($Perm.isReadVar $k@111@01))
(assert (< $k@111@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@111@01)))
(assert (<= (- $Perm.Write $k@111@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@111@01)) (not (= x2@109@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@111@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@105@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | x1@105@01 != Null | live]
; [else-branch: 18 | x1@105@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | x1@105@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((x $Ref)) $Perm
  (ite
    (= x x1@105@01)
    ($Perm.min (ite (= x x1@105@01) $k@107@01 $Perm.No) $k@111@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@111@01
(assert (=>
  (not (= (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No) $Perm.No))
  (ite
    (= x1@105@01 x1@105@01)
    (< (ite (= x1@105@01 x1@105@01) $k@111@01 $Perm.No) $k@107@01)
    (< (ite (= x1@105@01 x1@105@01) $k@111@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@105@01) (= (- $k@111@01 (pTaken@112@01 x)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@113@01 $PSF<list>)
(declare-const s@114@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x1@105@01) ($PSF.domain_list (as sm@113@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite (= x1@105@01 x1@105@01) (< $Perm.No $k@107@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@105@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@113@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@105@01)
  ($PSF.lookup_list (as sm@113@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))) x2@109@01))
(declare-const sm@115@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@105@01)
    ($PSF.lookup_list (as sm@113@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))
; [exec]
; x3 := new(next)
(declare-const x3@116@01 $Ref)
(assert (not (= x3@116@01 $Ref.null)))
(declare-const next@117@01 $Ref)
(assert (not (= x3@116@01 x1@105@01)))
(assert (not (= x3@116@01 x2@109@01)))
(assert (not (= x3@116@01 x4@102@01)))
(assert (not (= x3@116@01 x3@101@01)))
(assert (not (Set_in x3@116@01 xs@103@01)))
; [exec]
; x3.next := x2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@105@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@109@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x3), wildcard)
(declare-const $k@118@01 $Perm)
(assert ($Perm.isReadVar $k@118@01))
(assert (< $k@118@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@118@01)))
(assert (<= (- $Perm.Write $k@118@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@118@01)) (not (= x3@116@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@118@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@109@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | x2@109@01 != Null | live]
; [else-branch: 19 | x2@109@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | x2@109@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((x $Ref)) $Perm
  (ite
    (= x x2@109@01)
    ($Perm.min (ite (= x x2@109@01) $k@111@01 $Perm.No) $k@118@01)
    $Perm.No))
(define-fun pTaken@120@01 ((x $Ref)) $Perm
  (ite
    (= x x2@109@01)
    ($Perm.min
      (- (ite (= x x1@105@01) $k@107@01 $Perm.No) (pTaken@112@01 x))
      (- $k@118@01 (pTaken@119@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@118@01
(assert (=>
  (not (= (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No) $Perm.No))
  (ite
    (= x2@109@01 x2@109@01)
    (< (ite (= x2@109@01 x2@109@01) $k@118@01 $Perm.No) $k@111@01)
    (< (ite (= x2@109@01 x2@109@01) $k@118@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x2@109@01) (= (- $k@118@01 (pTaken@119@01 x)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $PSF<list>)
(declare-const s@122@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x2@109@01) ($PSF.domain_list (as sm@121@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x2@109@01 x1@105@01) $k@107@01 $Perm.No)
      (pTaken@112@01 x2@109@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@109@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@121@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))))))
(assert (=>
  (ite (= x2@109@01 x2@109@01) (< $Perm.No $k@111@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@109@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@121@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@109@01)
  ($PSF.lookup_list (as sm@121@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))) x3@116@01))
(declare-const sm@123@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@109@01)
    ($PSF.lookup_list (as sm@121@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))
; [exec]
; x4 := new(next)
(declare-const x4@124@01 $Ref)
(assert (not (= x4@124@01 $Ref.null)))
(declare-const next@125@01 $Ref)
(assert (not (= x4@124@01 x1@105@01)))
(assert (not (= x4@124@01 x2@109@01)))
(assert (not (= x4@124@01 x4@102@01)))
(assert (not (= x4@124@01 x3@116@01)))
(assert (not (Set_in x4@124@01 xs@103@01)))
; [exec]
; x4.next := x3
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x1@105@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x2@109@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@116@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x4), wildcard)
(declare-const $k@126@01 $Perm)
(assert ($Perm.isReadVar $k@126@01))
(assert (< $k@126@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@126@01)))
(assert (<= (- $Perm.Write $k@126@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@126@01)) (not (= x4@124@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@126@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@116@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | x3@116@01 != Null | live]
; [else-branch: 20 | x3@116@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | x3@116@01 != Null]
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((x $Ref)) $Perm
  (ite
    (= x x3@116@01)
    ($Perm.min (ite (= x x3@116@01) $k@118@01 $Perm.No) $k@126@01)
    $Perm.No))
(define-fun pTaken@128@01 ((x $Ref)) $Perm
  (ite
    (= x x3@116@01)
    ($Perm.min
      (- (ite (= x x2@109@01) $k@111@01 $Perm.No) (pTaken@119@01 x))
      (- $k@126@01 (pTaken@127@01 x)))
    $Perm.No))
(define-fun pTaken@129@01 ((x $Ref)) $Perm
  (ite
    (= x x3@116@01)
    ($Perm.min
      (- (ite (= x x1@105@01) $k@107@01 $Perm.No) (pTaken@112@01 x))
      (- (- $k@126@01 (pTaken@127@01 x)) (pTaken@128@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@126@01
(assert (=>
  (not (= (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No) $Perm.No))
  (ite
    (= x3@116@01 x3@116@01)
    (< (ite (= x3@116@01 x3@116@01) $k@126@01 $Perm.No) $k@118@01)
    (< (ite (= x3@116@01 x3@116@01) $k@126@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x3@116@01) (= (- $k@126@01 (pTaken@127@01 x)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@130@01 $PSF<list>)
(declare-const s@131@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x3@116@01) ($PSF.domain_list (as sm@130@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x3@116@01 x2@109@01) $k@111@01 $Perm.No)
      (pTaken@119@01 x3@116@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@116@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@130@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x3@116@01 x1@105@01) $k@107@01 $Perm.No)
      (pTaken@112@01 x3@116@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@116@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@130@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))))))
(assert (=>
  (ite (= x3@116@01 x3@116@01) (< $Perm.No $k@118@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@116@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@130@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@116@01)
  ($PSF.lookup_list (as sm@130@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))) x4@124@01))
(declare-const sm@132@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@116@01)
    ($PSF.lookup_list (as sm@130@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@133@01 Set<$Ref>)
(assert (Set_equal xs@133@01 (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@105@01) x2@109@01) x4@124@01) x3@116@01)))
; [exec]
; inhale length2_impl(xs, x4, 1, res)
(declare-const $t@134@01 $Snap)
(assert (= $t@134@01 $Snap.unit))
; [eval] length2_impl(xs, x4, 1, res)
(set-option :timeout 0)
(push) ; 7
(declare-const x@135@01 $Ref)
(push) ; 8
; [eval] (x in xs)
(assert (Set_in x@135@01 xs@133@01))
(declare-const $k@136@01 $Perm)
(assert ($Perm.isReadVar $k@136@01))
(pop) ; 8
(declare-fun inv@137@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@136@01))
; Nested auxiliary terms: non-globals
(push) ; 8
(assert (not (forall ((x@135@01 $Ref)) (!
  (=>
    (Set_in x@135@01 xs@133@01)
    (or (= $k@136@01 $Perm.No) (< $Perm.No $k@136@01)))
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((x1@135@01 $Ref) (x2@135@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@135@01 xs@133@01) (< $Perm.No $k@136@01))
      (and (Set_in x2@135@01 xs@133@01) (< $Perm.No $k@136@01))
      (= x1@135@01 x2@135@01))
    (= x1@135@01 x2@135@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (and (Set_in x@135@01 xs@133@01) (< $Perm.No $k@136@01))
    (= (inv@137@01 x@135@01) x@135@01))
  :pattern ((Set_in x@135@01 xs@133@01))
  :pattern ((inv@137@01 x@135@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@137@01 x) xs@133@01) (< $Perm.No $k@136@01))
    (= (inv@137@01 x) x))
  :pattern ((inv@137@01 x))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@138@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@137@01 x) xs@133@01)
    ($Perm.min (ite (= x x4@124@01) $k@126@01 $Perm.No) $k@136@01)
    $Perm.No))
(define-fun pTaken@139@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@137@01 x) xs@133@01)
    ($Perm.min
      (- (ite (= x x1@105@01) $k@107@01 $Perm.No) (pTaken@112@01 x))
      (- $k@136@01 (pTaken@138@01 x)))
    $Perm.No))
(define-fun pTaken@140@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@137@01 x) xs@133@01)
    ($Perm.min
      (- (ite (= x x2@109@01) $k@111@01 $Perm.No) (pTaken@119@01 x))
      (- (- $k@136@01 (pTaken@138@01 x)) (pTaken@139@01 x)))
    $Perm.No))
(define-fun pTaken@141@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@137@01 x) xs@133@01)
    ($Perm.min
      (- (ite (= x x3@116@01) $k@118@01 $Perm.No) (pTaken@127@01 x))
      (- (- (- $k@136@01 (pTaken@138@01 x)) (pTaken@139@01 x)) (pTaken@140@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@136@01
(assert (=>
  (not (= (ite (= x4@124@01 x4@124@01) $k@126@01 $Perm.No) $Perm.No))
  (ite
    (= x4@124@01 x4@124@01)
    (<
      (ite (Set_in (inv@137@01 x4@124@01) xs@133@01) $k@136@01 $Perm.No)
      $k@126@01)
    (<
      (ite (Set_in (inv@137@01 x4@124@01) xs@133@01) $k@136@01 $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@137@01 x) xs@133@01)
    (= (- $k@136@01 (pTaken@138@01 x)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@136@01
(assert (=>
  (not
    (=
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@137@01 x1@105@01) xs@133@01) $k@136@01 $Perm.No)
    (-
      (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
      (pTaken@112@01 x1@105@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@137@01 x) xs@133@01)
    (= (- (- $k@136@01 (pTaken@138@01 x)) (pTaken@139@01 x)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@136@01
(assert (=>
  (not
    (=
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@137@01 x2@109@01) xs@133@01) $k@136@01 $Perm.No)
    (-
      (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
      (pTaken@119@01 x2@109@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@137@01 x) xs@133@01)
    (=
      (- (- (- $k@136@01 (pTaken@138@01 x)) (pTaken@139@01 x)) (pTaken@140@01 x))
      $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@136@01
(assert (=>
  (not
    (=
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@137@01 x3@116@01) xs@133@01) $k@136@01 $Perm.No)
    (-
      (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
      (pTaken@127@01 x3@116@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@137@01 x) xs@133@01)
    (=
      (-
        (-
          (- (- $k@136@01 (pTaken@138@01 x)) (pTaken@139@01 x))
          (pTaken@140@01 x))
        (pTaken@141@01 x))
      $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@142@01 $PSF<list>)
(declare-const s@143@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@143@01 $Snap)) (!
  (and
    (=>
      (Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>)))
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01)))
    (=>
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>)))))
  :pattern ((Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>))))
  :qid |qp.psmDomDef31|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@143@01) x4@124@01)
        (< $Perm.No $k@126@01)
        false))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@132@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@132@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef27|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x1@105@01)
            $k@107@01
            $Perm.No)
          (pTaken@112@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@108@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@108@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x2@109@01)
            $k@111@01
            $Perm.No)
          (pTaken@119@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@115@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@115@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef29|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x3@116@01)
            $k@118@01
            $Perm.No)
          (pTaken@127@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@123@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@123@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef30|)))
(assert (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@142@01  $PSF<list>)) xs@133@01 x4@124@01 1 res@104@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@136@01))
(assert (forall ((x@135@01 $Ref)) (!
  (=>
    (and (Set_in x@135@01 xs@133@01) (< $Perm.No $k@136@01))
    (= (inv@137@01 x@135@01) x@135@01))
  :pattern ((Set_in x@135@01 xs@133@01))
  :pattern ((inv@137@01 x@135@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@137@01 x) xs@133@01) (< $Perm.No $k@136@01))
    (= (inv@137@01 x) x))
  :pattern ((inv@137@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@143@01 $Snap)) (!
  (and
    (=>
      (Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>)))
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01)))
    (=>
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>)))))
  :pattern ((Set_in s@143@01 ($PSF.domain_list (as sm@142@01  $PSF<list>))))
  :qid |qp.psmDomDef31|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@143@01) x4@124@01)
        (< $Perm.No $k@126@01)
        false))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@132@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@132@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef27|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x1@105@01)
            $k@107@01
            $Perm.No)
          (pTaken@112@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@108@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@108@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x2@109@01)
            $k@111@01
            $Perm.No)
          (pTaken@119@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@115@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@115@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef29|)))
(assert (forall ((s@143@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@137@01 ($SortWrappers.$SnapTo$Ref s@143@01)) xs@133@01)
        (< $Perm.No $k@136@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@143@01) x3@116@01)
            $k@118@01
            $Perm.No)
          (pTaken@127@01 ($SortWrappers.$SnapTo$Ref s@143@01)))))
    (and
      (not (= s@143@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01)
        ($PSF.lookup_list (as sm@123@01  $PSF<list>) s@143@01))))
  :pattern (($PSF.lookup_list (as sm@142@01  $PSF<list>) s@143@01))
  :pattern (($PSF.lookup_list (as sm@123@01  $PSF<list>) s@143@01))
  :qid |qp.psmValDef30|)))
(assert (and
  (=>
    (not (= (ite (= x4@124@01 x4@124@01) $k@126@01 $Perm.No) $Perm.No))
    (ite
      (= x4@124@01 x4@124@01)
      (<
        (ite (Set_in (inv@137@01 x4@124@01) xs@133@01) $k@136@01 $Perm.No)
        $k@126@01)
      (<
        (ite (Set_in (inv@137@01 x4@124@01) xs@133@01) $k@136@01 $Perm.No)
        $Perm.No)))
  (=>
    (not
      (=
        (-
          (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
          (pTaken@112@01 x1@105@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@137@01 x1@105@01) xs@133@01) $k@136@01 $Perm.No)
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (=>
    (not
      (=
        (-
          (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
          (pTaken@119@01 x2@109@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@137@01 x2@109@01) xs@133@01) $k@136@01 $Perm.No)
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (=>
    (not
      (=
        (-
          (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
          (pTaken@127@01 x3@116@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@137@01 x3@116@01) xs@133@01) $k@136@01 $Perm.No)
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (length2_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@142@01  $PSF<list>)) xs@133@01 x4@124@01 1 res@104@01)))
(assert (length2_impl ($SortWrappers.$PSF<list>To$Snap (as sm@142@01  $PSF<list>)) xs@133@01 x4@124@01 1 res@104@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@104@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x2@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@116@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x1@105@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x3@116@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x2@109@01))
    (not (= x1@105@01 x3@116@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x1@105@01))
    (not (= x2@109@01 x3@116@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x1@105@01))
    (not (= x3@116@01 x2@109@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x3@116@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x3@116@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x3@116@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x2@109@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x2@109@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x2@109@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x1@105@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x1@105@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x1@105@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= $Ref.null x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= $Ref.null x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= $Ref.null x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x3@116@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x1@105@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x2@109@01))
    (not (= x3@116@01 x1@105@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x3@116@01))
    (not (= x2@109@01 x1@105@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x3@116@01))
    (not (= x1@105@01 x2@109@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@104@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x2@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@116@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x1@105@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x3@116@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x2@109@01))
    (not (= x1@105@01 x3@116@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x1@105@01))
    (not (= x2@109@01 x3@116@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x1@105@01))
    (not (= x3@116@01 x2@109@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x3@116@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x3@116@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x3@116@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x2@109@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x2@109@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x2@109@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x1@105@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x1@105@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x1@105@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= $Ref.null x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= $Ref.null x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= $Ref.null x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x3@116@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x1@105@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x2@109@01))
    (not (= x3@116@01 x1@105@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x3@116@01))
    (not (= x2@109@01 x1@105@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x3@116@01))
    (not (= x1@105@01 x2@109@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@104@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x2@109@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x3@116@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@116@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@109@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@105@01 x4@124@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01))
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (ite (= x4@124@01 x4@124@01) (< $Perm.No $k@126@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@132@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@124@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@105@01 x1@105@01) $k@107@01 $Perm.No)
        (pTaken@112@01 x1@105@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@108@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@105@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@116@01 x3@116@01) $k@118@01 $Perm.No)
        (pTaken@127@01 x3@116@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@109@01 x2@109@01) $k@111@01 $Perm.No)
        (pTaken@119@01 x2@109@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@123@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@116@01))
      ($PSF.lookup_list (as sm@115@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@109@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x1@105@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x3@116@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x2@109@01))
    (not (= x1@105@01 x3@116@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x1@105@01))
    (not (= x2@109@01 x3@116@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x1@105@01))
    (not (= x3@116@01 x2@109@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@126@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@118@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@111@01) (- $Perm.Write $k@107@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@126@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@118@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@107@01) (- $Perm.Write $k@111@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x3@116@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x3@116@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@126@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x3@116@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x2@109@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= x2@109@01 x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@118@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x2@109@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= x1@105@01 x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= x1@105@01 x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@111@01))
    (< $Perm.No (- $Perm.Write $k@107@01)))
  (not (= x1@105@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@126@01)))
  (not (= $Ref.null x3@116@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@118@01)))
  (not (= $Ref.null x2@109@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@107@01))
    (< $Perm.No (- $Perm.Write $k@111@01)))
  (not (= $Ref.null x1@105@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@124@01 x3@116@01))
    (not (= x4@124@01 x2@109@01))
    (not (= x4@124@01 x1@105@01)))
  (and
    (not (= x3@116@01 x4@124@01))
    (not (= x3@116@01 x2@109@01))
    (not (= x3@116@01 x1@105@01)))
  (and
    (not (= x2@109@01 x4@124@01))
    (not (= x2@109@01 x3@116@01))
    (not (= x2@109@01 x1@105@01)))
  (and
    (not (= x1@105@01 x4@124@01))
    (not (= x1@105@01 x3@116@01))
    (not (= x1@105@01 x2@109@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@104@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3_length1 ----------
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
; var x1: Ref
(declare-const x1@144@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@145@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@146@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@147@01 $Ref)
(assert (not (= x1@147@01 $Ref.null)))
(declare-const next@148@01 $Ref)
(assert (not (= x1@147@01 x1@144@01)))
(assert (not (Set_in x1@147@01 xs@145@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), write)
; [eval] x.next != null
; [then-branch: 21 | False | dead]
; [else-branch: 21 | True | live]
(push) ; 3
; [else-branch: 21 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@147@01))
(declare-const sm@149@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@149@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@147@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@150@01 $PSF<list>)
(declare-const s@151@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@151@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@151@01) x1@147@01)
    (and
      (not (= s@151@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@150@01  $PSF<list>) s@151@01)
        ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@151@01))))
  :pattern (($PSF.lookup_list (as sm@150@01  $PSF<list>) s@151@01))
  :pattern (($PSF.lookup_list (as sm@149@01  $PSF<list>) s@151@01))
  :qid |qp.psmValDef32|)))
(assert (forall ((s@151@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@151@01) s@151@01)
  :pattern (($PSF.lookup_list (as sm@150@01  $PSF<list>) s@151@01))
  :qid |qp.psmResTrgDef33|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@150@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@147@01)) ($SortWrappers.$RefTo$Snap x1@147@01)))
; [exec]
; xs := Set(x1)
; [eval] Set(x1)
(declare-const xs@152@01 Set<$Ref>)
(assert (Set_equal xs@152@01 (Set_singleton x1@147@01)))
; [exec]
; inhale length3_impl(xs, x1, 1, res)
(declare-const $t@153@01 $Snap)
(assert (= $t@153@01 $Snap.unit))
; [eval] length3_impl(xs, x1, 1, res)
(push) ; 4
(declare-const x@154@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@154@01 xs@152@01))
(declare-const $k@155@01 $Perm)
(assert ($Perm.isReadVar $k@155@01))
(pop) ; 5
(declare-fun inv@156@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@155@01))
; Nested auxiliary terms: non-globals
(push) ; 5
(assert (not (forall ((x@154@01 $Ref)) (!
  (=>
    (Set_in x@154@01 xs@152@01)
    (or (= $k@155@01 $Perm.No) (< $Perm.No $k@155@01)))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@154@01 $Ref) (x2@154@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@154@01 xs@152@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@150@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@154@01)) ($SortWrappers.$RefTo$Snap x1@154@01)))
        (< $Perm.No $k@155@01))
      (and
        (and
          (Set_in x2@154@01 xs@152@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@150@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@154@01)) ($SortWrappers.$RefTo$Snap x2@154@01)))
        (< $Perm.No $k@155@01))
      (= x1@154@01 x2@154@01))
    (= x1@154@01 x2@154@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@154@01 $Ref)) (!
  (=>
    (and (Set_in x@154@01 xs@152@01) (< $Perm.No $k@155@01))
    (= (inv@156@01 x@154@01) x@154@01))
  :pattern ((Set_in x@154@01 xs@152@01))
  :pattern ((inv@156@01 x@154@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@156@01 x) xs@152@01) (< $Perm.No $k@155@01))
    (= (inv@156@01 x) x))
  :pattern ((inv@156@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@156@01 x) xs@152@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@150@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@156@01 x))
  :qid |quant-u-95|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@157@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@156@01 x) xs@152@01)
    ($Perm.min (ite (= x x1@147@01) $Perm.Write $Perm.No) $k@155@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@155@01
(assert (=>
  (not (= (ite (= x1@147@01 x1@147@01) $Perm.Write $Perm.No) $Perm.No))
  (ite
    (= x1@147@01 x1@147@01)
    (<
      (ite (Set_in (inv@156@01 x1@147@01) xs@152@01) $k@155@01 $Perm.No)
      $Perm.Write)
    (<
      (ite (Set_in (inv@156@01 x1@147@01) xs@152@01) $k@155@01 $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@156@01 x) xs@152@01)
    (= (- $k@155@01 (pTaken@157@01 x)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@158@01 $PSF<list>)
(declare-const s@159@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@159@01 $Snap)) (!
  (and
    (=>
      (Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>)))
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01)))
    (=>
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01))
      (Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>)))))
  :pattern ((Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>))))
  :qid |qp.psmDomDef37|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01))
      (= ($SortWrappers.$SnapTo$Ref s@159@01) x1@147@01))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01)
        ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01))))
  :pattern (($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01))
  :pattern (($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01))
  :qid |qp.psmValDef35|)))
(assert (forall ((s@159@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01) s@159@01)
  :pattern (($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01))
  :qid |qp.psmResTrgDef36|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@158@01  $PSF<list>)) xs@152@01 x1@147@01 1 res@146@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@155@01))
(assert (forall ((x@154@01 $Ref)) (!
  (=>
    (and (Set_in x@154@01 xs@152@01) (< $Perm.No $k@155@01))
    (= (inv@156@01 x@154@01) x@154@01))
  :pattern ((Set_in x@154@01 xs@152@01))
  :pattern ((inv@156@01 x@154@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@156@01 x) xs@152@01) (< $Perm.No $k@155@01))
    (= (inv@156@01 x) x))
  :pattern ((inv@156@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@159@01 $Snap)) (!
  (and
    (=>
      (Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>)))
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01)))
    (=>
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01))
      (Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>)))))
  :pattern ((Set_in s@159@01 ($PSF.domain_list (as sm@158@01  $PSF<list>))))
  :qid |qp.psmDomDef37|)))
(assert (forall ((s@159@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@156@01 ($SortWrappers.$SnapTo$Ref s@159@01)) xs@152@01)
        (< $Perm.No $k@155@01))
      (= ($SortWrappers.$SnapTo$Ref s@159@01) x1@147@01))
    (and
      (not (= s@159@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01)
        ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01))))
  :pattern (($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01))
  :pattern (($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01))
  :qid |qp.psmValDef35|)))
(assert (forall ((s@159@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@149@01  $PSF<list>) s@159@01) s@159@01)
  :pattern (($PSF.lookup_list (as sm@158@01  $PSF<list>) s@159@01))
  :qid |qp.psmResTrgDef36|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@156@01 x) xs@152@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@150@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@156@01 x))
    :qid |quant-u-95|))
  (=>
    (not (= (ite (= x1@147@01 x1@147@01) $Perm.Write $Perm.No) $Perm.No))
    (ite
      (= x1@147@01 x1@147@01)
      (<
        (ite (Set_in (inv@156@01 x1@147@01) xs@152@01) $k@155@01 $Perm.No)
        $Perm.Write)
      (<
        (ite (Set_in (inv@156@01 x1@147@01) xs@152@01) $k@155@01 $Perm.No)
        $Perm.No)))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@158@01  $PSF<list>)) xs@152@01 x1@147@01 1 res@146@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@158@01  $PSF<list>)) xs@152@01 x1@147@01 1 res@146@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 1
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@146@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@146@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@146@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] res == 1
(set-option :timeout 0)
(push) ; 4
(assert (not (= res@146@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3_length2 ----------
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
; var x1: Ref
(declare-const x1@160@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@161@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@162@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@163@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@164@01 $Ref)
(assert (not (= x1@164@01 $Ref.null)))
(declare-const next@165@01 $Ref)
(assert (not (= x1@164@01 x2@161@01)))
(assert (not (= x1@164@01 x1@160@01)))
(assert (not (Set_in x1@164@01 xs@162@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@166@01 $Perm)
(assert ($Perm.isReadVar $k@166@01))
(assert (< $k@166@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@166@01)))
(assert (<= (- $Perm.Write $k@166@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@166@01)) (not (= x1@164@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@166@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 22 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@164@01))
(declare-const sm@167@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@168@01 $PSF<list>)
(declare-const s@169@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@169@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@169@01) x1@164@01)
      (< $Perm.No $k@166@01)
      false)
    (and
      (not (= s@169@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@168@01  $PSF<list>) s@169@01)
        ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@169@01))))
  :pattern (($PSF.lookup_list (as sm@168@01  $PSF<list>) s@169@01))
  :pattern (($PSF.lookup_list (as sm@167@01  $PSF<list>) s@169@01))
  :qid |qp.psmValDef38|)))
(assert (forall ((s@169@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@169@01) s@169@01)
  :pattern (($PSF.lookup_list (as sm@168@01  $PSF<list>) s@169@01))
  :qid |qp.psmResTrgDef39|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@168@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)) ($SortWrappers.$RefTo$Snap x1@164@01)))
; [exec]
; x2 := new(next)
(declare-const x2@170@01 $Ref)
(assert (not (= x2@170@01 $Ref.null)))
(declare-const next@171@01 $Ref)
(assert (not (= x2@170@01 x2@161@01)))
(assert (not (= x2@170@01 x1@164@01)))
(assert (not (Set_in x2@170@01 xs@162@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@164@01 x2@170@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@172@01 $Perm)
(assert ($Perm.isReadVar $k@172@01))
(assert (< $k@172@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@172@01)))
(assert (<= (- $Perm.Write $k@172@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@172@01)) (not (= x2@170@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@172@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@164@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | x1@164@01 != Null | live]
; [else-branch: 23 | x1@164@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | x1@164@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@173@01 ((x $Ref)) $Perm
  (ite
    (= x x1@164@01)
    ($Perm.min (ite (= x x1@164@01) $k@166@01 $Perm.No) $k@172@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@172@01
(assert (=>
  (not (= (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No) $Perm.No))
  (ite
    (= x1@164@01 x1@164@01)
    (< (ite (= x1@164@01 x1@164@01) $k@172@01 $Perm.No) $k@166@01)
    (< (ite (= x1@164@01 x1@164@01) $k@172@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@164@01) (= (- $k@172@01 (pTaken@173@01 x)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@174@01 $PSF<list>)
(declare-const s@175@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x1@164@01) ($PSF.domain_list (as sm@174@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite (= x1@164@01 x1@164@01) (< $Perm.No $k@166@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@164@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))))))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)) ($SortWrappers.$RefTo$Snap x1@164@01)))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@164@01)
  ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))) x2@170@01))
(declare-const sm@176@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@164@01)
    ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)))))
(declare-const sm@177@01 $PSF<list>)
(declare-const s@178@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@178@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@178@01) x2@170@01)
      (< $Perm.No $k@172@01)
      false)
    (and
      (not (= s@178@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@177@01  $PSF<list>) s@178@01)
        ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@178@01))))
  :pattern (($PSF.lookup_list (as sm@177@01  $PSF<list>) s@178@01))
  :pattern (($PSF.lookup_list (as sm@176@01  $PSF<list>) s@178@01))
  :qid |qp.psmValDef44|)))
(assert (forall ((s@178@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@178@01) x1@164@01)
          $k@166@01
          $Perm.No)
        (pTaken@173@01 ($SortWrappers.$SnapTo$Ref s@178@01))))
    (and
      (not (= s@178@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@177@01  $PSF<list>) s@178@01)
        ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@178@01))))
  :pattern (($PSF.lookup_list (as sm@177@01  $PSF<list>) s@178@01))
  :pattern (($PSF.lookup_list (as sm@167@01  $PSF<list>) s@178@01))
  :qid |qp.psmValDef45|)))
(assert (forall ((s@178@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@178@01) s@178@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@178@01) s@178@01))
  :pattern (($PSF.lookup_list (as sm@177@01  $PSF<list>) s@178@01))
  :qid |qp.psmResTrgDef46|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@177@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01)) ($SortWrappers.$RefTo$Snap x2@170@01)))
; [exec]
; xs := Set(x1, x2)
; [eval] Set(x1, x2)
(declare-const xs@179@01 Set<$Ref>)
(assert (Set_equal xs@179@01 (Set_unionone (Set_singleton x1@164@01) x2@170@01)))
; [exec]
; assert (x1 in xs) && (x2 in xs)
; [eval] (x1 in xs)
(set-option :timeout 0)
(push) ; 5
(assert (not (Set_in x1@164@01 xs@179@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x1@164@01 xs@179@01))
; [eval] (x2 in xs)
(push) ; 5
(assert (not (Set_in x2@170@01 xs@179@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Set_in x2@170@01 xs@179@01))
; [exec]
; inhale length3_impl(xs, x2, 1, res)
(declare-const $t@180@01 $Snap)
(assert (= $t@180@01 $Snap.unit))
; [eval] length3_impl(xs, x2, 1, res)
(push) ; 5
(declare-const x@181@01 $Ref)
(push) ; 6
; [eval] (x in xs)
(assert (Set_in x@181@01 xs@179@01))
(declare-const $k@182@01 $Perm)
(assert ($Perm.isReadVar $k@182@01))
(pop) ; 6
(declare-fun inv@183@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@182@01))
; Nested auxiliary terms: non-globals
(push) ; 6
(assert (not (forall ((x@181@01 $Ref)) (!
  (=>
    (Set_in x@181@01 xs@179@01)
    (or (= $k@182@01 $Perm.No) (< $Perm.No $k@182@01)))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((x1@181@01 $Ref) (x2@181@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@181@01 xs@179@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@177@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@181@01)) ($SortWrappers.$RefTo$Snap x1@181@01)))
        (< $Perm.No $k@182@01))
      (and
        (and
          (Set_in x2@181@01 xs@179@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@177@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@181@01)) ($SortWrappers.$RefTo$Snap x2@181@01)))
        (< $Perm.No $k@182@01))
      (= x1@181@01 x2@181@01))
    (= x1@181@01 x2@181@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@181@01 $Ref)) (!
  (=>
    (and (Set_in x@181@01 xs@179@01) (< $Perm.No $k@182@01))
    (= (inv@183@01 x@181@01) x@181@01))
  :pattern ((Set_in x@181@01 xs@179@01))
  :pattern ((inv@183@01 x@181@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@183@01 x) xs@179@01) (< $Perm.No $k@182@01))
    (= (inv@183@01 x) x))
  :pattern ((inv@183@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@183@01 x) xs@179@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@177@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@183@01 x))
  :qid |quant-u-103|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@183@01 x) xs@179@01)
    ($Perm.min (ite (= x x2@170@01) $k@172@01 $Perm.No) $k@182@01)
    $Perm.No))
(define-fun pTaken@185@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@183@01 x) xs@179@01)
    ($Perm.min
      (- (ite (= x x1@164@01) $k@166@01 $Perm.No) (pTaken@173@01 x))
      (- $k@182@01 (pTaken@184@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@182@01
(assert (=>
  (not (= (ite (= x2@170@01 x2@170@01) $k@172@01 $Perm.No) $Perm.No))
  (ite
    (= x2@170@01 x2@170@01)
    (<
      (ite (Set_in (inv@183@01 x2@170@01) xs@179@01) $k@182@01 $Perm.No)
      $k@172@01)
    (<
      (ite (Set_in (inv@183@01 x2@170@01) xs@179@01) $k@182@01 $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@183@01 x) xs@179@01)
    (= (- $k@182@01 (pTaken@184@01 x)) $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@182@01
(assert (=>
  (not
    (=
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@183@01 x1@164@01) xs@179@01) $k@182@01 $Perm.No)
    (-
      (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
      (pTaken@173@01 x1@164@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@183@01 x) xs@179@01)
    (= (- (- $k@182@01 (pTaken@184@01 x)) (pTaken@185@01 x)) $Perm.No))
  
  :qid |quant-u-108|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@186@01 $PSF<list>)
(declare-const s@187@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@187@01 $Snap)) (!
  (and
    (=>
      (Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>)))
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01)))
    (=>
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>)))))
  :pattern ((Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>))))
  :qid |qp.psmDomDef52|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@187@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@187@01) x2@170@01)
        (< $Perm.No $k@172@01)
        false))
    (and
      (not (= s@187@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01)
        ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01))))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :pattern (($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01))
  :qid |qp.psmValDef49|)))
(assert (forall ((s@187@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@187@01) x1@164@01)
            $k@166@01
            $Perm.No)
          (pTaken@173@01 ($SortWrappers.$SnapTo$Ref s@187@01)))))
    (and
      (not (= s@187@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01)
        ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01))))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :pattern (($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01))
  :qid |qp.psmValDef50|)))
(assert (forall ((s@187@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01) s@187@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01) s@187@01))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :qid |qp.psmResTrgDef51|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@186@01  $PSF<list>)) xs@179@01 x2@170@01 1 res@163@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@182@01))
(assert (forall ((x@181@01 $Ref)) (!
  (=>
    (and (Set_in x@181@01 xs@179@01) (< $Perm.No $k@182@01))
    (= (inv@183@01 x@181@01) x@181@01))
  :pattern ((Set_in x@181@01 xs@179@01))
  :pattern ((inv@183@01 x@181@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@183@01 x) xs@179@01) (< $Perm.No $k@182@01))
    (= (inv@183@01 x) x))
  :pattern ((inv@183@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@187@01 $Snap)) (!
  (and
    (=>
      (Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>)))
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01)))
    (=>
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>)))))
  :pattern ((Set_in s@187@01 ($PSF.domain_list (as sm@186@01  $PSF<list>))))
  :qid |qp.psmDomDef52|)))
(assert (forall ((s@187@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@187@01) x2@170@01)
        (< $Perm.No $k@172@01)
        false))
    (and
      (not (= s@187@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01)
        ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01))))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :pattern (($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01))
  :qid |qp.psmValDef49|)))
(assert (forall ((s@187@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@183@01 ($SortWrappers.$SnapTo$Ref s@187@01)) xs@179@01)
        (< $Perm.No $k@182@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@187@01) x1@164@01)
            $k@166@01
            $Perm.No)
          (pTaken@173@01 ($SortWrappers.$SnapTo$Ref s@187@01)))))
    (and
      (not (= s@187@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01)
        ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01))))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :pattern (($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01))
  :qid |qp.psmValDef50|)))
(assert (forall ((s@187@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@176@01  $PSF<list>) s@187@01) s@187@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@167@01  $PSF<list>) s@187@01) s@187@01))
  :pattern (($PSF.lookup_list (as sm@186@01  $PSF<list>) s@187@01))
  :qid |qp.psmResTrgDef51|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@183@01 x) xs@179@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@177@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@183@01 x))
    :qid |quant-u-103|))
  (=>
    (not (= (ite (= x2@170@01 x2@170@01) $k@172@01 $Perm.No) $Perm.No))
    (ite
      (= x2@170@01 x2@170@01)
      (<
        (ite (Set_in (inv@183@01 x2@170@01) xs@179@01) $k@182@01 $Perm.No)
        $k@172@01)
      (<
        (ite (Set_in (inv@183@01 x2@170@01) xs@179@01) $k@182@01 $Perm.No)
        $Perm.No)))
  (=>
    (not
      (=
        (-
          (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
          (pTaken@173@01 x1@164@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@183@01 x1@164@01) xs@179@01) $k@182@01 $Perm.No)
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01))))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@186@01  $PSF<list>)) xs@179@01 x2@170@01 1 res@163@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@186@01  $PSF<list>)) xs@179@01 x2@170@01 1 res@163@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 2
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@163@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@164@01 x2@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01))
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01)))
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@172@01) (- $Perm.Write $k@166@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@166@01) (- $Perm.Write $k@172@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@172@01))
    (< $Perm.No (- $Perm.Write $k@166@01)))
  (not (= x1@164@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@166@01))
    (< $Perm.No (- $Perm.Write $k@172@01)))
  (not (= $Ref.null x1@164@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@163@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@164@01 x2@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01))
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01)))
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@172@01) (- $Perm.Write $k@166@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@166@01) (- $Perm.Write $k@172@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@172@01))
    (< $Perm.No (- $Perm.Write $k@166@01)))
  (not (= x1@164@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@166@01))
    (< $Perm.No (- $Perm.Write $k@172@01)))
  (not (= $Ref.null x1@164@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@163@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@164@01 x2@170@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01))
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@164@01 x1@164@01) $k@166@01 $Perm.No)
        (pTaken@173@01 x1@164@01)))
    (ite (= x2@170@01 x2@170@01) (< $Perm.No $k@172@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@167@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@164@01))
      ($PSF.lookup_list (as sm@176@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@170@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@172@01) (- $Perm.Write $k@166@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@166@01) (- $Perm.Write $k@172@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@172@01))
    (< $Perm.No (- $Perm.Write $k@166@01)))
  (not (= x1@164@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@166@01))
    (< $Perm.No (- $Perm.Write $k@172@01)))
  (not (= $Ref.null x1@164@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and (not (= x2@170@01 x1@164@01)) (not (= x1@164@01 x2@170@01))))
; [eval] res == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (= res@163@01 2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3_length4 ----------
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
; var x1: Ref
(declare-const x1@188@01 $Ref)
; [exec]
; var x2: Ref
(declare-const x2@189@01 $Ref)
; [exec]
; var x3: Ref
(declare-const x3@190@01 $Ref)
; [exec]
; var x4: Ref
(declare-const x4@191@01 $Ref)
; [exec]
; var xs: Set[Ref]
(declare-const xs@192@01 Set<$Ref>)
; [exec]
; var res: Int
(declare-const res@193@01 Int)
; [exec]
; x1 := new(next)
(declare-const x1@194@01 $Ref)
(assert (not (= x1@194@01 $Ref.null)))
(declare-const next@195@01 $Ref)
(assert (not (= x1@194@01 x2@189@01)))
(assert (not (= x1@194@01 x1@188@01)))
(assert (not (= x1@194@01 x4@191@01)))
(assert (not (= x1@194@01 x3@190@01)))
(assert (not (Set_in x1@194@01 xs@192@01)))
; [exec]
; x1.next := null
; [exec]
; fold acc(list(x1), wildcard)
(declare-const $k@196@01 $Perm)
(assert ($Perm.isReadVar $k@196@01))
(assert (< $k@196@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@196@01)))
(assert (<= (- $Perm.Write $k@196@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@196@01)) (not (= x1@194@01 $Ref.null))))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@196@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
; [then-branch: 24 | False | dead]
; [else-branch: 24 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 24 | True]
(assert (list%trigger ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit) x1@194@01))
(declare-const sm@197@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)))
(declare-const sm@198@01 $PSF<list>)
(declare-const s@199@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@199@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@199@01) x1@194@01)
      (< $Perm.No $k@196@01)
      false)
    (and
      (not (= s@199@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@198@01  $PSF<list>) s@199@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@199@01))))
  :pattern (($PSF.lookup_list (as sm@198@01  $PSF<list>) s@199@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@199@01))
  :qid |qp.psmValDef53|)))
(assert (forall ((s@199@01 $Snap)) (!
  ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@199@01) s@199@01)
  :pattern (($PSF.lookup_list (as sm@198@01  $PSF<list>) s@199@01))
  :qid |qp.psmResTrgDef54|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@198@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)) ($SortWrappers.$RefTo$Snap x1@194@01)))
; [exec]
; x2 := new(next)
(declare-const x2@200@01 $Ref)
(assert (not (= x2@200@01 $Ref.null)))
(declare-const next@201@01 $Ref)
(assert (not (= x2@200@01 x2@189@01)))
(assert (not (= x2@200@01 x1@194@01)))
(assert (not (= x2@200@01 x4@191@01)))
(assert (not (= x2@200@01 x3@190@01)))
(assert (not (Set_in x2@200@01 xs@192@01)))
; [exec]
; x2.next := x1
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@194@01 x2@200@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x2), wildcard)
(declare-const $k@202@01 $Perm)
(assert ($Perm.isReadVar $k@202@01))
(assert (< $k@202@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@202@01)))
(assert (<= (- $Perm.Write $k@202@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@202@01)) (not (= x2@200@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@202@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x1@194@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | x1@194@01 != Null | live]
; [else-branch: 25 | x1@194@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | x1@194@01 != Null]
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@203@01 ((x $Ref)) $Perm
  (ite
    (= x x1@194@01)
    ($Perm.min (ite (= x x1@194@01) $k@196@01 $Perm.No) $k@202@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@202@01
(assert (=>
  (not (= (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No) $Perm.No))
  (ite
    (= x1@194@01 x1@194@01)
    (< (ite (= x1@194@01 x1@194@01) $k@202@01 $Perm.No) $k@196@01)
    (< (ite (= x1@194@01 x1@194@01) $k@202@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x1@194@01) (= (- $k@202@01 (pTaken@203@01 x)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@204@01 $PSF<list>)
(declare-const s@205@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x1@194@01) ($PSF.domain_list (as sm@204@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite (= x1@194@01 x1@194@01) (< $Perm.No $k@196@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x1@194@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@204@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))))))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)) ($SortWrappers.$RefTo$Snap x1@194@01)))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x1@194@01)
  ($PSF.lookup_list (as sm@204@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))) x2@200@01))
(declare-const sm@206@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x1@194@01)
    ($PSF.lookup_list (as sm@204@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))
(declare-const sm@207@01 $PSF<list>)
(declare-const s@208@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@208@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@208@01) x2@200@01)
      (< $Perm.No $k@202@01)
      false)
    (and
      (not (= s@208@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@208@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@208@01))))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@208@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@208@01))
  :qid |qp.psmValDef59|)))
(assert (forall ((s@208@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@208@01) x1@194@01)
          $k@196@01
          $Perm.No)
        (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@208@01))))
    (and
      (not (= s@208@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@207@01  $PSF<list>) s@208@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@208@01))))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@208@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@208@01))
  :qid |qp.psmValDef60|)))
(assert (forall ((s@208@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@208@01) s@208@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@208@01) s@208@01))
  :pattern (($PSF.lookup_list (as sm@207@01  $PSF<list>) s@208@01))
  :qid |qp.psmResTrgDef61|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@207@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)) ($SortWrappers.$RefTo$Snap x2@200@01)))
; [exec]
; x3 := new(next)
(declare-const x3@209@01 $Ref)
(assert (not (= x3@209@01 $Ref.null)))
(declare-const next@210@01 $Ref)
(assert (not (= x3@209@01 x2@200@01)))
(assert (not (= x3@209@01 x1@194@01)))
(assert (not (= x3@209@01 x4@191@01)))
(assert (not (= x3@209@01 x3@190@01)))
(assert (not (Set_in x3@209@01 xs@192@01)))
; [exec]
; x3.next := x2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x1@194@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@200@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x3), wildcard)
(declare-const $k@211@01 $Perm)
(assert ($Perm.isReadVar $k@211@01))
(assert (< $k@211@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@211@01)))
(assert (<= (- $Perm.Write $k@211@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@211@01)) (not (= x3@209@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@211@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x2@200@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | x2@200@01 != Null | live]
; [else-branch: 26 | x2@200@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | x2@200@01 != Null]
(declare-const sm@212@01 $PSF<list>)
(declare-const s@213@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@213@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@213@01) x1@194@01)
          $k@196@01
          $Perm.No)
        (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@213@01))))
    (and
      (not (= s@213@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@212@01  $PSF<list>) s@213@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@213@01))))
  :pattern (($PSF.lookup_list (as sm@212@01  $PSF<list>) s@213@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@213@01))
  :qid |qp.psmValDef62|)))
(assert (forall ((s@213@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@213@01) x2@200@01)
      (< $Perm.No $k@202@01)
      false)
    (and
      (not (= s@213@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@212@01  $PSF<list>) s@213@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@213@01))))
  :pattern (($PSF.lookup_list (as sm@212@01  $PSF<list>) s@213@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@213@01))
  :qid |qp.psmValDef63|)))
(assert (forall ((s@213@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@213@01) s@213@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@213@01) s@213@01))
  :pattern (($PSF.lookup_list (as sm@212@01  $PSF<list>) s@213@01))
  :qid |qp.psmResTrgDef64|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@212@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)) ($SortWrappers.$RefTo$Snap x2@200@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@214@01 ((x $Ref)) $Perm
  (ite
    (= x x2@200@01)
    ($Perm.min (ite (= x x2@200@01) $k@202@01 $Perm.No) $k@211@01)
    $Perm.No))
(define-fun pTaken@215@01 ((x $Ref)) $Perm
  (ite
    (= x x2@200@01)
    ($Perm.min
      (- (ite (= x x1@194@01) $k@196@01 $Perm.No) (pTaken@203@01 x))
      (- $k@211@01 (pTaken@214@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@211@01
(assert (=>
  (not (= (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No) $Perm.No))
  (ite
    (= x2@200@01 x2@200@01)
    (< (ite (= x2@200@01 x2@200@01) $k@211@01 $Perm.No) $k@202@01)
    (< (ite (= x2@200@01 x2@200@01) $k@211@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x2@200@01) (= (- $k@211@01 (pTaken@214@01 x)) $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@216@01 $PSF<list>)
(declare-const s@217@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x2@200@01) ($PSF.domain_list (as sm@216@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x2@200@01 x1@194@01) $k@196@01 $Perm.No)
      (pTaken@203@01 x2@200@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@200@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))))))
(assert (=>
  (ite (= x2@200@01 x2@200@01) (< $Perm.No $k@202@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x2@200@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))))))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)) ($SortWrappers.$RefTo$Snap x2@200@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)) ($SortWrappers.$RefTo$Snap x2@200@01))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x2@200@01)
  ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))) x3@209@01))
(declare-const sm@218@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x2@200@01)
    ($PSF.lookup_list (as sm@216@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))
(declare-const sm@219@01 $PSF<list>)
(declare-const s@220@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@220@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@220@01) x3@209@01)
      (< $Perm.No $k@211@01)
      false)
    (and
      (not (= s@220@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01)
        ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@220@01))))
  :pattern (($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01))
  :pattern (($PSF.lookup_list (as sm@218@01  $PSF<list>) s@220@01))
  :qid |qp.psmValDef70|)))
(assert (forall ((s@220@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@220@01) x1@194@01)
          $k@196@01
          $Perm.No)
        (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@220@01))))
    (and
      (not (= s@220@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@220@01))))
  :pattern (($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@220@01))
  :qid |qp.psmValDef71|)))
(assert (forall ((s@220@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@220@01) x2@200@01)
          $k@202@01
          $Perm.No)
        (pTaken@214@01 ($SortWrappers.$SnapTo$Ref s@220@01))))
    (and
      (not (= s@220@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@220@01))))
  :pattern (($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@220@01))
  :qid |qp.psmValDef72|)))
(assert (forall ((s@220@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@220@01) s@220@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@220@01) s@220@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@220@01) s@220@01))
  :pattern (($PSF.lookup_list (as sm@219@01  $PSF<list>) s@220@01))
  :qid |qp.psmResTrgDef73|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@219@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)) ($SortWrappers.$RefTo$Snap x3@209@01)))
; [exec]
; x4 := new(next)
(declare-const x4@221@01 $Ref)
(assert (not (= x4@221@01 $Ref.null)))
(declare-const next@222@01 $Ref)
(assert (not (= x4@221@01 x2@200@01)))
(assert (not (= x4@221@01 x1@194@01)))
(assert (not (= x4@221@01 x4@191@01)))
(assert (not (= x4@221@01 x3@209@01)))
(assert (not (Set_in x4@221@01 xs@192@01)))
; [exec]
; x4.next := x3
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x1@194@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x2@200@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@209@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(list(x4), wildcard)
(declare-const $k@223@01 $Perm)
(assert ($Perm.isReadVar $k@223@01))
(assert (< $k@223@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@223@01)))
(assert (<= (- $Perm.Write $k@223@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@223@01)) (not (= x4@221@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@223@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] x.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= x3@209@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | x3@209@01 != Null | live]
; [else-branch: 27 | x3@209@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 27 | x3@209@01 != Null]
(declare-const sm@224@01 $PSF<list>)
(declare-const s@225@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@225@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@225@01) x2@200@01)
          $k@202@01
          $Perm.No)
        (pTaken@214@01 ($SortWrappers.$SnapTo$Ref s@225@01))))
    (and
      (not (= s@225@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@225@01))))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@225@01))
  :qid |qp.psmValDef74|)))
(assert (forall ((s@225@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@225@01) x1@194@01)
          $k@196@01
          $Perm.No)
        (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@225@01))))
    (and
      (not (= s@225@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@225@01))))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@225@01))
  :qid |qp.psmValDef75|)))
(assert (forall ((s@225@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@225@01) x3@209@01)
      (< $Perm.No $k@211@01)
      false)
    (and
      (not (= s@225@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01)
        ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@225@01))))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01))
  :pattern (($PSF.lookup_list (as sm@218@01  $PSF<list>) s@225@01))
  :qid |qp.psmValDef76|)))
(assert (forall ((s@225@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@225@01) s@225@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@225@01) s@225@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@225@01) s@225@01))
  :pattern (($PSF.lookup_list (as sm@224@01  $PSF<list>) s@225@01))
  :qid |qp.psmResTrgDef77|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@224@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)) ($SortWrappers.$RefTo$Snap x3@209@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@226@01 ((x $Ref)) $Perm
  (ite
    (= x x3@209@01)
    ($Perm.min (ite (= x x3@209@01) $k@211@01 $Perm.No) $k@223@01)
    $Perm.No))
(define-fun pTaken@227@01 ((x $Ref)) $Perm
  (ite
    (= x x3@209@01)
    ($Perm.min
      (- (ite (= x x2@200@01) $k@202@01 $Perm.No) (pTaken@214@01 x))
      (- $k@223@01 (pTaken@226@01 x)))
    $Perm.No))
(define-fun pTaken@228@01 ((x $Ref)) $Perm
  (ite
    (= x x3@209@01)
    ($Perm.min
      (- (ite (= x x1@194@01) $k@196@01 $Perm.No) (pTaken@203@01 x))
      (- (- $k@223@01 (pTaken@226@01 x)) (pTaken@227@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@223@01
(assert (=>
  (not (= (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No) $Perm.No))
  (ite
    (= x3@209@01 x3@209@01)
    (< (ite (= x3@209@01 x3@209@01) $k@223@01 $Perm.No) $k@211@01)
    (< (ite (= x3@209@01 x3@209@01) $k@223@01 $Perm.No) $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x3@209@01) (= (- $k@223@01 (pTaken@226@01 x)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@229@01 $PSF<list>)
(declare-const s@230@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($SortWrappers.$RefTo$Snap x3@209@01) ($PSF.domain_list (as sm@229@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x3@209@01 x2@200@01) $k@202@01 $Perm.No)
      (pTaken@214@01 x3@209@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@209@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@229@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite (= x3@209@01 x1@194@01) $k@196@01 $Perm.No)
      (pTaken@203@01 x3@209@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@209@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@229@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))))))
(assert (=>
  (ite (= x3@209@01 x3@209@01) (< $Perm.No $k@211@01) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x3@209@01) $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@229@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))))))
(assert (and
  ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)) ($SortWrappers.$RefTo$Snap x3@209@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)) ($SortWrappers.$RefTo$Snap x3@209@01))
  ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)) ($SortWrappers.$RefTo$Snap x3@209@01))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.$RefTo$Snap x3@209@01)
  ($PSF.lookup_list (as sm@229@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))) x4@221@01))
(declare-const sm@231@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap x3@209@01)
    ($PSF.lookup_list (as sm@229@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))
(declare-const sm@232@01 $PSF<list>)
(declare-const s@233@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@233@01 $Snap)) (!
  (=>
    (ite
      (= ($SortWrappers.$SnapTo$Ref s@233@01) x4@221@01)
      (< $Perm.No $k@223@01)
      false)
    (and
      (not (= s@233@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01)
        ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@233@01))))
  :pattern (($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01))
  :pattern (($PSF.lookup_list (as sm@231@01  $PSF<list>) s@233@01))
  :qid |qp.psmValDef84|)))
(assert (forall ((s@233@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@233@01) x1@194@01)
          $k@196@01
          $Perm.No)
        (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@233@01))))
    (and
      (not (= s@233@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@233@01))))
  :pattern (($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@233@01))
  :qid |qp.psmValDef85|)))
(assert (forall ((s@233@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@233@01) x2@200@01)
          $k@202@01
          $Perm.No)
        (pTaken@214@01 ($SortWrappers.$SnapTo$Ref s@233@01))))
    (and
      (not (= s@233@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@233@01))))
  :pattern (($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@233@01))
  :qid |qp.psmValDef86|)))
(assert (forall ((s@233@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@233@01) x3@209@01)
          $k@211@01
          $Perm.No)
        (pTaken@226@01 ($SortWrappers.$SnapTo$Ref s@233@01))))
    (and
      (not (= s@233@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01)
        ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@233@01))))
  :pattern (($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01))
  :pattern (($PSF.lookup_list (as sm@218@01  $PSF<list>) s@233@01))
  :qid |qp.psmValDef87|)))
(assert (forall ((s@233@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@233@01) s@233@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@233@01) s@233@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@233@01) s@233@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@233@01) s@233@01))
  :pattern (($PSF.lookup_list (as sm@232@01  $PSF<list>) s@233@01))
  :qid |qp.psmResTrgDef88|)))
(assert ($PSF.loc_list ($PSF.lookup_list (as sm@232@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)) ($SortWrappers.$RefTo$Snap x4@221@01)))
; [exec]
; xs := Set(x1, x2, x4, x3)
; [eval] Set(x1, x2, x4, x3)
(declare-const xs@234@01 Set<$Ref>)
(assert (Set_equal xs@234@01 (Set_unionone (Set_unionone (Set_unionone (Set_singleton x1@194@01) x2@200@01) x4@221@01) x3@209@01)))
; [exec]
; inhale length3_impl(xs, x4, 1, res)
(declare-const $t@235@01 $Snap)
(assert (= $t@235@01 $Snap.unit))
; [eval] length3_impl(xs, x4, 1, res)
(set-option :timeout 0)
(push) ; 7
(declare-const x@236@01 $Ref)
(push) ; 8
; [eval] (x in xs)
(assert (Set_in x@236@01 xs@234@01))
(declare-const $k@237@01 $Perm)
(assert ($Perm.isReadVar $k@237@01))
(pop) ; 8
(declare-fun inv@238@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@237@01))
; Nested auxiliary terms: non-globals
(push) ; 8
(assert (not (forall ((x@236@01 $Ref)) (!
  (=>
    (Set_in x@236@01 xs@234@01)
    (or (= $k@237@01 $Perm.No) (< $Perm.No $k@237@01)))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((x1@236@01 $Ref) (x2@236@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (Set_in x1@236@01 xs@234@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@232@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@236@01)) ($SortWrappers.$RefTo$Snap x1@236@01)))
        (< $Perm.No $k@237@01))
      (and
        (and
          (Set_in x2@236@01 xs@234@01)
          ($PSF.loc_list ($PSF.lookup_list (as sm@232@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@236@01)) ($SortWrappers.$RefTo$Snap x2@236@01)))
        (< $Perm.No $k@237@01))
      (= x1@236@01 x2@236@01))
    (= x1@236@01 x2@236@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@236@01 $Ref)) (!
  (=>
    (and (Set_in x@236@01 xs@234@01) (< $Perm.No $k@237@01))
    (= (inv@238@01 x@236@01) x@236@01))
  :pattern ((Set_in x@236@01 xs@234@01))
  :pattern ((inv@238@01 x@236@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@238@01 x) xs@234@01) (< $Perm.No $k@237@01))
    (= (inv@238@01 x) x))
  :pattern ((inv@238@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@238@01 x) xs@234@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@232@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@238@01 x))
  :qid |quant-u-119|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@238@01 x) xs@234@01)
    ($Perm.min (ite (= x x4@221@01) $k@223@01 $Perm.No) $k@237@01)
    $Perm.No))
(define-fun pTaken@240@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@238@01 x) xs@234@01)
    ($Perm.min
      (- (ite (= x x1@194@01) $k@196@01 $Perm.No) (pTaken@203@01 x))
      (- $k@237@01 (pTaken@239@01 x)))
    $Perm.No))
(define-fun pTaken@241@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@238@01 x) xs@234@01)
    ($Perm.min
      (- (ite (= x x2@200@01) $k@202@01 $Perm.No) (pTaken@214@01 x))
      (- (- $k@237@01 (pTaken@239@01 x)) (pTaken@240@01 x)))
    $Perm.No))
(define-fun pTaken@242@01 ((x $Ref)) $Perm
  (ite
    (Set_in (inv@238@01 x) xs@234@01)
    ($Perm.min
      (- (ite (= x x3@209@01) $k@211@01 $Perm.No) (pTaken@226@01 x))
      (- (- (- $k@237@01 (pTaken@239@01 x)) (pTaken@240@01 x)) (pTaken@241@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@237@01
(assert (=>
  (not (= (ite (= x4@221@01 x4@221@01) $k@223@01 $Perm.No) $Perm.No))
  (ite
    (= x4@221@01 x4@221@01)
    (<
      (ite (Set_in (inv@238@01 x4@221@01) xs@234@01) $k@237@01 $Perm.No)
      $k@223@01)
    (<
      (ite (Set_in (inv@238@01 x4@221@01) xs@234@01) $k@237@01 $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@238@01 x) xs@234@01)
    (= (- $k@237@01 (pTaken@239@01 x)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@237@01
(assert (=>
  (not
    (=
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@238@01 x1@194@01) xs@234@01) $k@237@01 $Perm.No)
    (-
      (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
      (pTaken@203@01 x1@194@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@238@01 x) xs@234@01)
    (= (- (- $k@237@01 (pTaken@239@01 x)) (pTaken@240@01 x)) $Perm.No))
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@237@01
(assert (=>
  (not
    (=
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@238@01 x2@200@01) xs@234@01) $k@237@01 $Perm.No)
    (-
      (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
      (pTaken@214@01 x2@200@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@238@01 x) xs@234@01)
    (=
      (- (- (- $k@237@01 (pTaken@239@01 x)) (pTaken@240@01 x)) (pTaken@241@01 x))
      $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Constrain original permissions $k@237@01
(assert (=>
  (not
    (=
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))
      $Perm.No))
  (<
    (ite (Set_in (inv@238@01 x3@209@01) xs@234@01) $k@237@01 $Perm.No)
    (-
      (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
      (pTaken@226@01 x3@209@01)))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@238@01 x) xs@234@01)
    (=
      (-
        (-
          (- (- $k@237@01 (pTaken@239@01 x)) (pTaken@240@01 x))
          (pTaken@241@01 x))
        (pTaken@242@01 x))
      $Perm.No))
  
  :qid |quant-u-128|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@243@01 $PSF<list>)
(declare-const s@244@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@244@01 $Snap)) (!
  (and
    (=>
      (Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>)))
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01)))
    (=>
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>)))))
  :pattern ((Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>))))
  :qid |qp.psmDomDef98|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@244@01) x4@221@01)
        (< $Perm.No $k@223@01)
        false))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef93|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x1@194@01)
            $k@196@01
            $Perm.No)
          (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef94|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x2@200@01)
            $k@202@01
            $Perm.No)
          (pTaken@214@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef95|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x3@209@01)
            $k@211@01
            $Perm.No)
          (pTaken@226@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef96|)))
(assert (forall ((s@244@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01) s@244@01))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :qid |qp.psmResTrgDef97|)))
(assert (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@243@01  $PSF<list>)) xs@234@01 x4@221@01 1 res@193@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@237@01))
(assert (forall ((x@236@01 $Ref)) (!
  (=>
    (and (Set_in x@236@01 xs@234@01) (< $Perm.No $k@237@01))
    (= (inv@238@01 x@236@01) x@236@01))
  :pattern ((Set_in x@236@01 xs@234@01))
  :pattern ((inv@238@01 x@236@01))
  :qid |list-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (Set_in (inv@238@01 x) xs@234@01) (< $Perm.No $k@237@01))
    (= (inv@238@01 x) x))
  :pattern ((inv@238@01 x))
  :qid |list-fctOfInv|)))
(assert (forall ((s@244@01 $Snap)) (!
  (and
    (=>
      (Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>)))
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01)))
    (=>
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>)))))
  :pattern ((Set_in s@244@01 ($PSF.domain_list (as sm@243@01  $PSF<list>))))
  :qid |qp.psmDomDef98|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (ite
        (= ($SortWrappers.$SnapTo$Ref s@244@01) x4@221@01)
        (< $Perm.No $k@223@01)
        false))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef93|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x1@194@01)
            $k@196@01
            $Perm.No)
          (pTaken@203@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef94|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x2@200@01)
            $k@202@01
            $Perm.No)
          (pTaken@214@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef95|)))
(assert (forall ((s@244@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@238@01 ($SortWrappers.$SnapTo$Ref s@244@01)) xs@234@01)
        (< $Perm.No $k@237@01))
      (<
        $Perm.No
        (-
          (ite
            (= ($SortWrappers.$SnapTo$Ref s@244@01) x3@209@01)
            $k@211@01
            $Perm.No)
          (pTaken@226@01 ($SortWrappers.$SnapTo$Ref s@244@01)))))
    (and
      (not (= s@244@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01)
        ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01))))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :pattern (($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01))
  :qid |qp.psmValDef96|)))
(assert (forall ((s@244@01 $Snap)) (!
  (and
    ($PSF.loc_list ($PSF.lookup_list (as sm@231@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@197@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@206@01  $PSF<list>) s@244@01) s@244@01)
    ($PSF.loc_list ($PSF.lookup_list (as sm@218@01  $PSF<list>) s@244@01) s@244@01))
  :pattern (($PSF.lookup_list (as sm@243@01  $PSF<list>) s@244@01))
  :qid |qp.psmResTrgDef97|)))
(assert (and
  (forall ((x $Ref)) (!
    (=>
      (Set_in (inv@238@01 x) xs@234@01)
      ($PSF.loc_list ($PSF.lookup_list (as sm@232@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
    :pattern ((inv@238@01 x))
    :qid |quant-u-119|))
  (=>
    (not (= (ite (= x4@221@01 x4@221@01) $k@223@01 $Perm.No) $Perm.No))
    (ite
      (= x4@221@01 x4@221@01)
      (<
        (ite (Set_in (inv@238@01 x4@221@01) xs@234@01) $k@237@01 $Perm.No)
        $k@223@01)
      (<
        (ite (Set_in (inv@238@01 x4@221@01) xs@234@01) $k@237@01 $Perm.No)
        $Perm.No)))
  (=>
    (not
      (=
        (-
          (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
          (pTaken@203@01 x1@194@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@238@01 x1@194@01) xs@234@01) $k@237@01 $Perm.No)
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (=>
    (not
      (=
        (-
          (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
          (pTaken@214@01 x2@200@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@238@01 x2@200@01) xs@234@01) $k@237@01 $Perm.No)
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (=>
    (not
      (=
        (-
          (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
          (pTaken@226@01 x3@209@01))
        $Perm.No))
    (<
      (ite (Set_in (inv@238@01 x3@209@01) xs@234@01) $k@237@01 $Perm.No)
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (length3_impl%precondition ($SortWrappers.$PSF<list>To$Snap (as sm@243@01  $PSF<list>)) xs@234@01 x4@221@01 1 res@193@01)))
(assert (length3_impl ($SortWrappers.$PSF<list>To$Snap (as sm@243@01  $PSF<list>)) xs@234@01 x4@221@01 1 res@193@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert res == 4
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@193@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x2@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@209@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x1@194@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x3@209@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x2@200@01))
    (not (= x1@194@01 x3@209@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x1@194@01))
    (not (= x2@200@01 x3@209@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x1@194@01))
    (not (= x3@209@01 x2@200@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x3@209@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x3@209@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x3@209@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x2@200@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x2@200@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x2@200@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x1@194@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x1@194@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x1@194@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= $Ref.null x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= $Ref.null x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= $Ref.null x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x3@209@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x1@194@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x2@200@01))
    (not (= x3@209@01 x1@194@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x3@209@01))
    (not (= x2@200@01 x1@194@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x3@209@01))
    (not (= x1@194@01 x2@200@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@193@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x2@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@209@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x1@194@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x3@209@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x2@200@01))
    (not (= x1@194@01 x3@209@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x1@194@01))
    (not (= x2@200@01 x3@209@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x1@194@01))
    (not (= x3@209@01 x2@200@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x3@209@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x3@209@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x3@209@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x2@200@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x2@200@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x2@200@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x1@194@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x1@194@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x1@194@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= $Ref.null x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= $Ref.null x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= $Ref.null x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x3@209@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x1@194@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x2@200@01))
    (not (= x3@209@01 x1@194@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x3@209@01))
    (not (= x2@200@01 x1@194@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x3@209@01))
    (not (= x1@194@01 x2@200@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@193@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x2@200@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x3@209@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x3@209@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x2@200@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x1@194@01 x4@221@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false)
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01)))
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01))
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (ite (= x4@221@01 x4@221@01) (< $Perm.No $k@223@01) false))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@231@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x4@221@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x1@194@01 x1@194@01) $k@196@01 $Perm.No)
        (pTaken@203@01 x1@194@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@197@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x1@194@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (ite (= x3@209@01 x3@209@01) $k@211@01 $Perm.No)
        (pTaken@226@01 x3@209@01)))
    (<
      $Perm.No
      (-
        (ite (= x2@200@01 x2@200@01) $k@202@01 $Perm.No)
        (pTaken@214@01 x2@200@01))))
  (not
    (=
      ($PSF.lookup_list (as sm@218@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x3@209@01))
      ($PSF.lookup_list (as sm@206@01  $PSF<list>) ($SortWrappers.$RefTo$Snap x2@200@01)))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x1@194@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x3@209@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x2@200@01))
    (not (= x1@194@01 x3@209@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x1@194@01))
    (not (= x2@200@01 x3@209@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x1@194@01))
    (not (= x3@209@01 x2@200@01)))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@223@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@211@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@202@01) (- $Perm.Write $k@196@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@223@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@211@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.Write (+ (- $Perm.Write $k@196@01) (- $Perm.Write $k@202@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x3@209@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x3@209@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@223@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x3@209@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x2@200@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= x2@200@01 x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@211@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x2@200@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= x1@194@01 x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= x1@194@01 x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@202@01))
    (< $Perm.No (- $Perm.Write $k@196@01)))
  (not (= x1@194@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@223@01)))
  (not (= $Ref.null x3@209@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@211@01)))
  (not (= $Ref.null x2@200@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write $k@196@01))
    (< $Perm.No (- $Perm.Write $k@202@01)))
  (not (= $Ref.null x1@194@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= x4@221@01 x3@209@01))
    (not (= x4@221@01 x2@200@01))
    (not (= x4@221@01 x1@194@01)))
  (and
    (not (= x3@209@01 x4@221@01))
    (not (= x3@209@01 x2@200@01))
    (not (= x3@209@01 x1@194@01)))
  (and
    (not (= x2@200@01 x4@221@01))
    (not (= x2@200@01 x3@209@01))
    (not (= x2@200@01 x1@194@01)))
  (and
    (not (= x1@194@01 x4@221@01))
    (not (= x1@194@01 x3@209@01))
    (not (= x1@194@01 x2@200@01)))))
; [eval] res == 4
(set-option :timeout 0)
(push) ; 7
(assert (not (= res@193@01 4)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
