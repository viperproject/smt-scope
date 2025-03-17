(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:06:17
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._quantifiedpredicates_._examples_._list.vpr
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
(declare-sort $FVF<val> 0)
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
; Declaring additional sort wrappers
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
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /predicate_snap_functions_declarations.smt2 [list: Snap]
(declare-fun $PSF.domain_list ($PSF<list>) Set<$Snap>)
(declare-fun $PSF.lookup_list ($PSF<list> $Snap) $Snap)
(declare-fun $PSF.after_list ($PSF<list> $PSF<list>) Bool)
(declare-fun $PSF.loc_list ($Snap $Snap) Bool)
(declare-fun $PSF.perm_list ($PPM $Snap) $Perm)
(declare-const $psfTOP_list $PSF<list>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun allSet ($Snap $Ref Int Int) Bool)
(declare-fun allSet%limited ($Snap $Ref Int Int) Bool)
(declare-fun allSet%stateless ($Ref Int Int) Bool)
(declare-fun allSet%precondition ($Snap $Ref Int Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref Int) Bool)
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
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (= (allSet%limited s@$ r@0@00 i@1@00 v@2@00) (allSet s@$ r@0@00 i@1@00 v@2@00))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (allSet%stateless r@0@00 i@1@00 v@2@00)
  :pattern ((allSet%limited s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (=>
    (allSet%precondition s@$ r@0@00 i@1@00 v@2@00)
    (=
      (allSet s@$ r@0@00 i@1@00 v@2@00)
      (ite
        (<= i@1@00 0)
        true
        (and
          (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) v@2@00)
          (allSet%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) (-
            i@1@00
            1) v@2@00)))))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :pattern ((allSet%stateless r@0@00 i@1@00 v@2@00) (list%trigger s@$ r@0@00 i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref) (i@1@00 Int) (v@2@00 Int)) (!
  (=>
    (allSet%precondition s@$ r@0@00 i@1@00 v@2@00)
    (ite
      (<= i@1@00 0)
      true
      (=>
        (= ($SortWrappers.$SnapToInt ($Snap.first s@$)) v@2@00)
        (allSet%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) (-
          i@1@00
          1) v@2@00))))
  :pattern ((allSet s@$ r@0@00 i@1@00 v@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m1 ----------
(declare-const lists@0@01 Set<$Ref>)
(declare-const length@1@01 Int)
(declare-const v@2@01 Int)
(declare-const lists@3@01 Set<$Ref>)
(declare-const length@4@01 Int)
(declare-const v@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] length > 0
(assert (> length@4@01 0))
(declare-const r@7@01 $Ref)
(push) ; 2
; [eval] (r in lists)
(assert (Set_in r@7@01 lists@3@01))
(pop) ; 2
(declare-fun inv@8@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@7@01 $Ref)) (!
  (=> (Set_in r@7@01 lists@3@01) (= (inv@8@01 r@7@01 length@4@01) r@7@01))
  :pattern ((Set_in r@7@01 lists@3@01))
  :pattern ((inv@8@01 r@7@01 length@4@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@8@01 r i) lists@3@01)
    (and (= (inv@8@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@8@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(declare-const r@10@01 $Ref)
(push) ; 3
; [eval] (r in lists)
(assert (Set_in r@10@01 lists@3@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@10@01 $Ref)) (!
  (=> (Set_in r@10@01 lists@3@01) (= (inv@11@01 r@10@01 length@4@01) r@10@01))
  :pattern ((Set_in r@10@01 lists@3@01))
  :pattern ((inv@11@01 r@10@01 length@4@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@11@01 r i) lists@3@01)
    (and (= (inv@11@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@11@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@12@01 $Ref)
(push) ; 3
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 4
; [then-branch: 0 | r@12@01 in lists@3@01 | live]
; [else-branch: 0 | !(r@12@01 in lists@3@01) | live]
(push) ; 5
; [then-branch: 0 | r@12@01 in lists@3@01]
(assert (Set_in r@12@01 lists@3@01))
; [eval] allSet(r, length, v)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref) (i Int) (r@12@01 $Ref)) $Perm
  (ite
    (and (= r r@12@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@11@01 r i) lists@3@01) $Perm.Write $Perm.No)
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@11@01 r i) lists@3@01) $Perm.Write $Perm.No)
      (pTaken@13@01 r i r@12@01))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@12@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@13@01 r i r@12@01)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@14@01 $PSF<list>)
(declare-const s@15@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@12@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@14@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@11@01 r@12@01 length@4@01) lists@3@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@12@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@9@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@12@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@12@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@12@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@14@01  $PSF<list>)))
  (=>
    (Set_in (inv@11@01 r@12@01 length@4@01) lists@3@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@12@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@9@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@12@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(r@12@01 in lists@3@01)]
(assert (not (Set_in r@12@01 lists@3@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@12@01 lists@3@01)
  (and
    (Set_in r@12@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@12@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@14@01  $PSF<list>)))
    (=>
      (Set_in (inv@11@01 r@12@01 length@4@01) lists@3@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@12@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@12@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@9@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@12@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@12@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@12@01 lists@3@01)) (Set_in r@12@01 lists@3@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@12@01 $Ref)) (!
  (and
    (=>
      (Set_in r@12@01 lists@3@01)
      (and
        (Set_in r@12@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@14@01  $PSF<list>)))
        (=>
          (Set_in (inv@11@01 r@12@01 length@4@01) lists@3@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@12@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@12@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@9@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@12@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01)))
    (or (not (Set_in r@12@01 lists@3@01)) (Set_in r@12@01 lists@3@01)))
  :pattern ((Set_in r@12@01 lists@3@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@12@01 $Ref)) (!
  (and
    (=>
      (Set_in r@12@01 lists@3@01)
      (and
        (Set_in r@12@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@14@01  $PSF<list>)))
        (=>
          (Set_in (inv@11@01 r@12@01 length@4@01) lists@3@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@12@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@12@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@9@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@12@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@12@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01)))
    (or (not (Set_in r@12@01 lists@3@01)) (Set_in r@12@01 lists@3@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@12@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@12@01 $Ref)) (!
  (=>
    (Set_in r@12@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@12@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01))
  :pattern ((Set_in r@12@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@14@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@12@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@12@01 length@4@01 v@5@01))
  :qid |prog.l26|)))
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Ref]
(declare-const s@16@01 Set<$Ref>)
; [exec]
; var sNext: Set[Ref]
(declare-const sNext@17@01 Set<$Ref>)
; [exec]
; s := lists
; [exec]
; sNext := Set[Ref]()
; [eval] Set[Ref]()
(declare-const s@18@01 Set<$Ref>)
(declare-const sNext@19@01 Set<$Ref>)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(declare-const r@21@01 $Ref)
(push) ; 4
; [eval] (r in s)
(assert (Set_in r@21@01 s@18@01))
(pop) ; 4
(declare-fun inv@22@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@21@01 $Ref)) (!
  (=> (Set_in r@21@01 s@18@01) (= (inv@22@01 r@21@01 length@4@01) r@21@01))
  :pattern ((Set_in r@21@01 s@18@01))
  :pattern ((inv@22@01 r@21@01 length@4@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@22@01 r i) s@18@01)
    (and (= (inv@22@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@22@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(declare-const r@23@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 1 | r@23@01 in lists@3@01 | live]
; [else-branch: 1 | !(r@23@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 1 | r@23@01 in lists@3@01]
(assert (Set_in r@23@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(r@23@01 in lists@3@01)]
(assert (not (Set_in r@23@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@23@01 lists@3@01)) (Set_in r@23@01 lists@3@01)))
(assert (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01)))
(pop) ; 4
(declare-fun inv@24@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (or (not (Set_in r@23@01 lists@3@01)) (Set_in r@23@01 lists@3@01)))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |next-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (= (inv@24@01 r@23@01) r@23@01))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (= (inv@24@01 r) r))
  :pattern ((inv@24@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (not (= r@23@01 $Ref.null)))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(declare-const r@25@01 $Ref)
(push) ; 4
; [eval] (r in sNext)
(assert (Set_in r@25@01 sNext@19@01))
; [eval] length - 1
(pop) ; 4
(declare-fun inv@26@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@25@01 $Ref)) (!
  (=>
    (Set_in r@25@01 sNext@19@01)
    (= (inv@26@01 r@25@01 (- length@4@01 1)) r@25@01))
  :pattern ((Set_in r@25@01 sNext@19@01))
  :pattern ((inv@26@01 r@25@01 (- length@4@01 1)))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@26@01 r i) sNext@19@01)
    (and (= (inv@26@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@26@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(declare-const r@27@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 2 | r@27@01 in lists@3@01 | live]
; [else-branch: 2 | !(r@27@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 2 | r@27@01 in lists@3@01]
(assert (Set_in r@27@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(r@27@01 in lists@3@01)]
(assert (not (Set_in r@27@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@27@01 lists@3@01)) (Set_in r@27@01 lists@3@01)))
(assert (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01)))
(pop) ; 4
(declare-fun inv@28@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (or (not (Set_in r@27@01 lists@3@01)) (Set_in r@27@01 lists@3@01)))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (= (inv@28@01 r@27@01) r@27@01))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (not (= r@27@01 $Ref.null)))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@29@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 3 | r@29@01 in lists@3@01 | live]
; [else-branch: 3 | !(r@29@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 3 | r@29@01 in lists@3@01]
(assert (Set_in r@29@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(r@29@01 in lists@3@01)]
(assert (not (Set_in r@29@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@29@01 lists@3@01)) (Set_in r@29@01 lists@3@01)))
(push) ; 5
; [then-branch: 4 | !(r@29@01 in s@18@01) && r@29@01 in lists@3@01 | live]
; [else-branch: 4 | !(!(r@29@01 in s@18@01) && r@29@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 4 | !(r@29@01 in s@18@01) && r@29@01 in lists@3@01]
(assert (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
; [eval] r.val == v
(declare-const sm@30@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@28@01 r) s@18@01))
        (Set_in (inv@28@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_val (as pm@31@01  $FPM) r@29@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 4 | !(!(r@29@01 in s@18@01) && r@29@01 in lists@3@01)]
(assert (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@28@01 r) s@18@01))
        (Set_in (inv@28@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
  (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@28@01 r) s@18@01))
        (Set_in (inv@28@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@29@01 $Ref)) (!
  (and
    (or (not (Set_in r@29@01 lists@3@01)) (Set_in r@29@01 lists@3@01))
    (or
      (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
      (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
  :pattern ((Set_in r@29@01 lists@3@01))
  :qid |prog.l34-aux|)))
(assert (forall ((r@29@01 $Ref)) (!
  (and
    (or (not (Set_in r@29@01 lists@3@01)) (Set_in r@29@01 lists@3@01))
    (or
      (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
      (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
  :pattern ((Set_in r@29@01 s@18@01))
  :qid |prog.l34-aux|)))
(assert (forall ((r@29@01 $Ref)) (!
  (=>
    (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@30@01  $FVF<val>) r@29@01) v@5@01))
  :pattern ((Set_in r@29@01 lists@3@01))
  :pattern ((Set_in r@29@01 s@18@01))
  :qid |prog.l34|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@32@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 5 | r@32@01 in lists@3@01 | live]
; [else-branch: 5 | !(r@32@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 5 | r@32@01 in lists@3@01]
(assert (Set_in r@32@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 5 | !(r@32@01 in lists@3@01)]
(assert (not (Set_in r@32@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01)))
(push) ; 5
; [then-branch: 6 | !(r@32@01 in s@18@01) && r@32@01 in lists@3@01 | live]
; [else-branch: 6 | !(!(r@32@01 in s@18@01) && r@32@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 6 | !(r@32@01 in s@18@01) && r@32@01 in lists@3@01]
(assert (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
; [eval] (r.next in sNext)
(declare-const sm@33@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@34@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@34@01  $FPM) r@32@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(!(r@32@01 in s@18@01) && r@32@01 in lists@3@01)]
(assert (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@34@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
  (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@34@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 lists@3@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 s@18@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@18@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :qid |prog.l35|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
  $Snap.unit))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@35@01 $Ref)
(declare-const r2@36@01 $Ref)
(push) ; 4
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 5
; [then-branch: 7 | r1@35@01 in lists@3@01 | live]
; [else-branch: 7 | !(r1@35@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 7 | r1@35@01 in lists@3@01]
(assert (Set_in r1@35@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 7
; [then-branch: 8 | !(r1@35@01 in s@18@01) | live]
; [else-branch: 8 | r1@35@01 in s@18@01 | live]
(push) ; 8
; [then-branch: 8 | !(r1@35@01 in s@18@01)]
(assert (not (Set_in r1@35@01 s@18@01)))
; [eval] (r2 in lists)
(push) ; 9
; [then-branch: 9 | r2@36@01 in lists@3@01 | live]
; [else-branch: 9 | !(r2@36@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 9 | r2@36@01 in lists@3@01]
(assert (Set_in r2@36@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 10 | !(r2@36@01 in s@18@01) | live]
; [else-branch: 10 | r2@36@01 in s@18@01 | live]
(push) ; 12
; [then-branch: 10 | !(r2@36@01 in s@18@01)]
(assert (not (Set_in r2@36@01 s@18@01)))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 10 | r2@36@01 in s@18@01]
(assert (Set_in r2@36@01 s@18@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 9 | !(r2@36@01 in lists@3@01)]
(assert (not (Set_in r2@36@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r2@36@01 lists@3@01)
  (and
    (Set_in r2@36@01 lists@3@01)
    (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01))))))
; Joined path conditions
(assert (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 8 | r1@35@01 in s@18@01]
(assert (Set_in r1@35@01 s@18@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (Set_in r1@35@01 s@18@01))
  (and
    (not (Set_in r1@35@01 s@18@01))
    (=>
      (Set_in r2@36@01 lists@3@01)
      (and
        (Set_in r2@36@01 lists@3@01)
        (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
    (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01)))))
; Joined path conditions
(assert (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(r1@35@01 in lists@3@01)]
(assert (not (Set_in r1@35@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Set_in r1@35@01 lists@3@01)
  (and
    (Set_in r1@35@01 lists@3@01)
    (=>
      (not (Set_in r1@35@01 s@18@01))
      (and
        (not (Set_in r1@35@01 s@18@01))
        (=>
          (Set_in r2@36@01 lists@3@01)
          (and
            (Set_in r2@36@01 lists@3@01)
            (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
        (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
    (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01))))))
; Joined path conditions
(assert (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01)))
(push) ; 5
; [then-branch: 11 | r1@35@01 != r2@36@01 && !(r2@36@01 in s@18@01) && r2@36@01 in lists@3@01 && !(r1@35@01 in s@18@01) && r1@35@01 in lists@3@01 | live]
; [else-branch: 11 | !(r1@35@01 != r2@36@01 && !(r2@36@01 in s@18@01) && r2@36@01 in lists@3@01 && !(r1@35@01 in s@18@01) && r1@35@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 11 | r1@35@01 != r2@36@01 && !(r2@36@01 in s@18@01) && r2@36@01 in lists@3@01 && !(r1@35@01 in s@18@01) && r1@35@01 in lists@3@01]
(assert (and
  (and
    (and
      (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
      (Set_in r2@36@01 lists@3@01))
    (not (Set_in r1@35@01 s@18@01)))
  (Set_in r1@35@01 lists@3@01)))
; [eval] r1.next != r2.next
(declare-const sm@37@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@38@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@38@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@38@01  $FPM) r1@35@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const sm@39@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@39@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@39@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@40@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@40@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@40@01  $FPM) r2@36@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(r1@35@01 != r2@36@01 && !(r2@36@01 in s@18@01) && r2@36@01 in lists@3@01 && !(r1@35@01 in s@18@01) && r1@35@01 in lists@3@01)]
(assert (not
  (and
    (and
      (and
        (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
        (Set_in r2@36@01 lists@3@01))
      (not (Set_in r1@35@01 s@18@01)))
    (Set_in r1@35@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@38@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@39@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@39@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@40@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (=>
  (and
    (and
      (and
        (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
        (Set_in r2@36@01 lists@3@01))
      (not (Set_in r1@35@01 s@18@01)))
    (Set_in r1@35@01 lists@3@01))
  (and
    (not (= r1@35@01 r2@36@01))
    (not (Set_in r2@36@01 s@18@01))
    (Set_in r2@36@01 lists@3@01)
    (not (Set_in r1@35@01 s@18@01))
    (Set_in r1@35@01 lists@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
          (Set_in r2@36@01 lists@3@01))
        (not (Set_in r1@35@01 s@18@01)))
      (Set_in r1@35@01 lists@3@01)))
  (and
    (and
      (and
        (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
        (Set_in r2@36@01 lists@3@01))
      (not (Set_in r1@35@01 s@18@01)))
    (Set_in r1@35@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@38@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@39@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@39@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@40@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
          (Set_in r2@36@01 lists@3@01))
        (not (Set_in r1@35@01 s@18@01)))
      (Set_in r1@35@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@37@01  $FVF<next>) r1@35@01)
        ($FVF.lookup_next (as sm@39@01  $FVF<next>) r2@36@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 lists@3@01))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 s@18@01))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 lists@3@01))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 4
; [eval] |s| > 0
; [eval] |s|
(pop) ; 4
(push) ; 4
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const r@41@01 $Ref)
(push) ; 4
; [eval] (r in s)
(assert (Set_in r@41@01 lists@3@01))
(pop) ; 4
(declare-fun inv@42@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@41@01 $Ref) (r2@41@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@41@01 lists@3@01)
      (Set_in r2@41@01 lists@3@01)
      (= r1@41@01 r2@41@01))
    (= r1@41@01 r2@41@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@41@01 $Ref)) (!
  (=> (Set_in r@41@01 lists@3@01) (= (inv@42@01 r@41@01 length@4@01) r@41@01))
  :pattern ((Set_in r@41@01 lists@3@01))
  :pattern ((inv@42@01 r@41@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@42@01 r i) lists@3@01)
    (and (= (inv@42@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@42@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@42@01 r i) lists@3@01)
    ($Perm.min
      (ite (Set_in (inv@8@01 r i) lists@3@01) $Perm.Write $Perm.No)
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@8@01 r i) lists@3@01) $Perm.Write $Perm.No)
      (pTaken@43@01 r i))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@42@01 r i) lists@3@01)
    (= (- $Perm.Write (pTaken@43@01 r i)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $PSF<list>)
(declare-const s@45@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@45@01 $Snap)) (!
  (=>
    (Set_in (inv@8@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@45@01)) ($SortWrappers.$SnapToInt ($Snap.second s@45@01))) lists@3@01)
    (and
      (not (= s@45@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@44@01  $PSF<list>) s@45@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second $t@6@01)) s@45@01))))
  :pattern (($PSF.lookup_list (as sm@44@01  $PSF<list>) s@45@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.second $t@6@01)) s@45@01))
  :qid |qp.psmValDef10|)))
(declare-const r@46@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 12 | r@46@01 in lists@3@01 | live]
; [else-branch: 12 | !(r@46@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 12 | r@46@01 in lists@3@01]
(assert (Set_in r@46@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(r@46@01 in lists@3@01)]
(assert (not (Set_in r@46@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@46@01 lists@3@01)) (Set_in r@46@01 lists@3@01)))
(assert (and (not (Set_in r@46@01 lists@3@01)) (Set_in r@46@01 lists@3@01)))
(pop) ; 4
(declare-fun inv@47@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@46@01 $Ref)) (!
  (=>
    (and (not (Set_in r@46@01 lists@3@01)) (Set_in r@46@01 lists@3@01))
    (or (not (Set_in r@46@01 lists@3@01)) (Set_in r@46@01 lists@3@01)))
  :pattern ((Set_in r@46@01 lists@3@01))
  :pattern ((inv@47@01 r@46@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@46@01 $Ref) (r2@46@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@46@01 lists@3@01)) (Set_in r1@46@01 lists@3@01))
      (and (not (Set_in r2@46@01 lists@3@01)) (Set_in r2@46@01 lists@3@01))
      (= r1@46@01 r2@46@01))
    (= r1@46@01 r2@46@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@46@01 $Ref)) (!
  (=>
    (and (not (Set_in r@46@01 lists@3@01)) (Set_in r@46@01 lists@3@01))
    (= (inv@47@01 r@46@01) r@46@01))
  :pattern ((Set_in r@46@01 lists@3@01))
  :pattern ((inv@47@01 r@46@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@47@01 r) lists@3@01))
      (Set_in (inv@47@01 r) lists@3@01))
    (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@47@01 r) lists@3@01))
      (Set_in (inv@47@01 r) lists@3@01))
    false)
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@48@01 $FVF<next>)
; Definitional axioms for snapshot map values
(declare-const r@49@01 $Ref)
(push) ; 4
; [eval] (r in sNext)
(assert (Set_in r@49@01 (as Set_empty  Set<$Ref>)))
; [eval] length - 1
(pop) ; 4
(declare-fun inv@50@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@49@01 $Ref) (r2@49@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@49@01 (as Set_empty  Set<$Ref>))
      (Set_in r2@49@01 (as Set_empty  Set<$Ref>))
      (= r1@49@01 r2@49@01))
    (= r1@49@01 r2@49@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@49@01 $Ref)) (!
  (=>
    (Set_in r@49@01 (as Set_empty  Set<$Ref>))
    (= (inv@50@01 r@49@01 (- length@4@01 1)) r@49@01))
  :pattern ((Set_in r@49@01 (as Set_empty  Set<$Ref>)))
  :pattern ((inv@50@01 r@49@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@50@01 r i) (as Set_empty  Set<$Ref>))
    (and (= (inv@50@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@50@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref) (i Int)) (!
  (=> (Set_in (inv@50@01 r i) (as Set_empty  Set<$Ref>)) false)
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@51@01 $PSF<list>)
(declare-const s@52@01 $Snap)
; Definitional axioms for snapshot map values
(declare-const r@53@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 13 | r@53@01 in lists@3@01 | live]
; [else-branch: 13 | !(r@53@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 13 | r@53@01 in lists@3@01]
(assert (Set_in r@53@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 13 | !(r@53@01 in lists@3@01)]
(assert (not (Set_in r@53@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@53@01 lists@3@01)) (Set_in r@53@01 lists@3@01)))
(assert (and (not (Set_in r@53@01 lists@3@01)) (Set_in r@53@01 lists@3@01)))
(pop) ; 4
(declare-fun inv@54@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@53@01 $Ref)) (!
  (=>
    (and (not (Set_in r@53@01 lists@3@01)) (Set_in r@53@01 lists@3@01))
    (or (not (Set_in r@53@01 lists@3@01)) (Set_in r@53@01 lists@3@01)))
  :pattern ((Set_in r@53@01 lists@3@01))
  :pattern ((inv@54@01 r@53@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((r1@53@01 $Ref) (r2@53@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@53@01 lists@3@01)) (Set_in r1@53@01 lists@3@01))
      (and (not (Set_in r2@53@01 lists@3@01)) (Set_in r2@53@01 lists@3@01))
      (= r1@53@01 r2@53@01))
    (= r1@53@01 r2@53@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@53@01 $Ref)) (!
  (=>
    (and (not (Set_in r@53@01 lists@3@01)) (Set_in r@53@01 lists@3@01))
    (= (inv@54@01 r@53@01) r@53@01))
  :pattern ((Set_in r@53@01 lists@3@01))
  :pattern ((inv@54@01 r@53@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@54@01 r) lists@3@01))
      (Set_in (inv@54@01 r) lists@3@01))
    (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@54@01 r) lists@3@01))
      (Set_in (inv@54@01 r) lists@3@01))
    false)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@55@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@56@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 14 | r@56@01 in lists@3@01 | live]
; [else-branch: 14 | !(r@56@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 14 | r@56@01 in lists@3@01]
(assert (Set_in r@56@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 14 | !(r@56@01 in lists@3@01)]
(assert (not (Set_in r@56@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01)))
(push) ; 5
; [then-branch: 15 | !(r@56@01 in lists@3@01) && r@56@01 in lists@3@01 | live]
; [else-branch: 15 | !(!(r@56@01 in lists@3@01) && r@56@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 15 | !(r@56@01 in lists@3@01) && r@56@01 in lists@3@01]
(assert (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01)))
; [eval] r.val == v
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(!(r@56@01 in lists@3@01) && r@56@01 in lists@3@01)]
(assert (not (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01)))
  (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@56@01 $Ref)) (!
  (and
    (or (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))
    (or
      (not (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01)))
      (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))))
  :pattern ((Set_in r@56@01 lists@3@01))
  :qid |prog.l34-aux|)))
(push) ; 4
(assert (not (forall ((r@56@01 $Ref)) (!
  (=>
    (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@55@01  $FVF<val>) r@56@01) v@5@01))
  :pattern ((Set_in r@56@01 lists@3@01))
  :pattern ((Set_in r@56@01 lists@3@01))
  :qid |prog.l34|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@56@01 $Ref)) (!
  (=>
    (and (not (Set_in r@56@01 lists@3@01)) (Set_in r@56@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@55@01  $FVF<val>) r@56@01) v@5@01))
  :pattern ((Set_in r@56@01 lists@3@01))
  :pattern ((Set_in r@56@01 lists@3@01))
  :qid |prog.l34|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@57@01 $Ref)
(push) ; 4
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 5
; [then-branch: 16 | r@57@01 in lists@3@01 | live]
; [else-branch: 16 | !(r@57@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 16 | r@57@01 in lists@3@01]
(assert (Set_in r@57@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(r@57@01 in lists@3@01)]
(assert (not (Set_in r@57@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01)))
(push) ; 5
; [then-branch: 17 | !(r@57@01 in lists@3@01) && r@57@01 in lists@3@01 | live]
; [else-branch: 17 | !(!(r@57@01 in lists@3@01) && r@57@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 17 | !(r@57@01 in lists@3@01) && r@57@01 in lists@3@01]
(assert (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01)))
; [eval] (r.next in sNext)
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(!(r@57@01 in lists@3@01) && r@57@01 in lists@3@01)]
(assert (not (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01)))
  (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@57@01 $Ref)) (!
  (and
    (or (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))
    (or
      (not (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01)))
      (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))))
  :pattern ((Set_in r@57@01 lists@3@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@57@01 $Ref)) (!
  (and
    (or (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))
    (or
      (not (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01)))
      (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@57@01) (as Set_empty  Set<$Ref>)))
  :qid |prog.l35-aux|)))
(push) ; 4
(assert (not (forall ((r@57@01 $Ref)) (!
  (=>
    (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@57@01) (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in r@57@01 lists@3@01))
  :pattern ((Set_in r@57@01 lists@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@57@01) (as Set_empty  Set<$Ref>)))
  :qid |prog.l35|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@57@01 $Ref)) (!
  (=>
    (and (not (Set_in r@57@01 lists@3@01)) (Set_in r@57@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@57@01) (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in r@57@01 lists@3@01))
  :pattern ((Set_in r@57@01 lists@3@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@48@01  $FVF<next>) r@57@01) (as Set_empty  Set<$Ref>)))
  :qid |prog.l35|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@58@01 $Ref)
(declare-const r2@59@01 $Ref)
(push) ; 4
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 5
; [then-branch: 18 | r1@58@01 in lists@3@01 | live]
; [else-branch: 18 | !(r1@58@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 18 | r1@58@01 in lists@3@01]
(assert (Set_in r1@58@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 7
; [then-branch: 19 | !(r1@58@01 in lists@3@01) | live]
; [else-branch: 19 | r1@58@01 in lists@3@01 | live]
(push) ; 8
; [then-branch: 19 | !(r1@58@01 in lists@3@01)]
(assert (not (Set_in r1@58@01 lists@3@01)))
; [eval] (r2 in lists)
(push) ; 9
; [then-branch: 20 | r2@59@01 in lists@3@01 | live]
; [else-branch: 20 | !(r2@59@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 20 | r2@59@01 in lists@3@01]
(assert (Set_in r2@59@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 21 | !(r2@59@01 in lists@3@01) | live]
; [else-branch: 21 | r2@59@01 in lists@3@01 | live]
(push) ; 12
; [then-branch: 21 | !(r2@59@01 in lists@3@01)]
(assert (not (Set_in r2@59@01 lists@3@01)))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 21 | r2@59@01 in lists@3@01]
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@59@01 lists@3@01) (not (Set_in r2@59@01 lists@3@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 20 | !(r2@59@01 in lists@3@01)]
(assert (not (Set_in r2@59@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r2@59@01 lists@3@01)
  (and
    (Set_in r2@59@01 lists@3@01)
    (or (Set_in r2@59@01 lists@3@01) (not (Set_in r2@59@01 lists@3@01))))))
; Joined path conditions
(assert (or (not (Set_in r2@59@01 lists@3@01)) (Set_in r2@59@01 lists@3@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | r1@58@01 in lists@3@01]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (Set_in r1@58@01 lists@3@01))
  (and
    (not (Set_in r1@58@01 lists@3@01))
    (=>
      (Set_in r2@59@01 lists@3@01)
      (and
        (Set_in r2@59@01 lists@3@01)
        (or (Set_in r2@59@01 lists@3@01) (not (Set_in r2@59@01 lists@3@01)))))
    (or (not (Set_in r2@59@01 lists@3@01)) (Set_in r2@59@01 lists@3@01)))))
; Joined path conditions
(assert (or (Set_in r1@58@01 lists@3@01) (not (Set_in r1@58@01 lists@3@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(r1@58@01 in lists@3@01)]
(assert (not (Set_in r1@58@01 lists@3@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Set_in r1@58@01 lists@3@01)
  (and
    (Set_in r1@58@01 lists@3@01)
    (=>
      (not (Set_in r1@58@01 lists@3@01))
      (and
        (not (Set_in r1@58@01 lists@3@01))
        (=>
          (Set_in r2@59@01 lists@3@01)
          (and
            (Set_in r2@59@01 lists@3@01)
            (or (Set_in r2@59@01 lists@3@01) (not (Set_in r2@59@01 lists@3@01)))))
        (or (not (Set_in r2@59@01 lists@3@01)) (Set_in r2@59@01 lists@3@01))))
    (or (Set_in r1@58@01 lists@3@01) (not (Set_in r1@58@01 lists@3@01))))))
; Joined path conditions
(assert (or (not (Set_in r1@58@01 lists@3@01)) (Set_in r1@58@01 lists@3@01)))
(push) ; 5
; [then-branch: 22 | r1@58@01 != r2@59@01 && !(r2@59@01 in lists@3@01) && r2@59@01 in lists@3@01 && !(r1@58@01 in lists@3@01) && r1@58@01 in lists@3@01 | live]
; [else-branch: 22 | !(r1@58@01 != r2@59@01 && !(r2@59@01 in lists@3@01) && r2@59@01 in lists@3@01 && !(r1@58@01 in lists@3@01) && r1@58@01 in lists@3@01) | live]
(push) ; 6
; [then-branch: 22 | r1@58@01 != r2@59@01 && !(r2@59@01 in lists@3@01) && r2@59@01 in lists@3@01 && !(r1@58@01 in lists@3@01) && r1@58@01 in lists@3@01]
(assert (and
  (and
    (and
      (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
      (Set_in r2@59@01 lists@3@01))
    (not (Set_in r1@58@01 lists@3@01)))
  (Set_in r1@58@01 lists@3@01)))
; [eval] r1.next != r2.next
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(assert (not false))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(r1@58@01 != r2@59@01 && !(r2@59@01 in lists@3@01) && r2@59@01 in lists@3@01 && !(r1@58@01 in lists@3@01) && r1@58@01 in lists@3@01)]
(assert (not
  (and
    (and
      (and
        (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
        (Set_in r2@59@01 lists@3@01))
      (not (Set_in r1@58@01 lists@3@01)))
    (Set_in r1@58@01 lists@3@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
        (Set_in r2@59@01 lists@3@01))
      (not (Set_in r1@58@01 lists@3@01)))
    (Set_in r1@58@01 lists@3@01))
  (and
    (not (= r1@58@01 r2@59@01))
    (not (Set_in r2@59@01 lists@3@01))
    (Set_in r2@59@01 lists@3@01)
    (not (Set_in r1@58@01 lists@3@01))
    (Set_in r1@58@01 lists@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
          (Set_in r2@59@01 lists@3@01))
        (not (Set_in r1@58@01 lists@3@01)))
      (Set_in r1@58@01 lists@3@01)))
  (and
    (and
      (and
        (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
        (Set_in r2@59@01 lists@3@01))
      (not (Set_in r1@58@01 lists@3@01)))
    (Set_in r1@58@01 lists@3@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@58@01 $Ref) (r2@59@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@58@01 lists@3@01)
      (and
        (Set_in r1@58@01 lists@3@01)
        (=>
          (not (Set_in r1@58@01 lists@3@01))
          (and
            (not (Set_in r1@58@01 lists@3@01))
            (=>
              (Set_in r2@59@01 lists@3@01)
              (and
                (Set_in r2@59@01 lists@3@01)
                (or
                  (Set_in r2@59@01 lists@3@01)
                  (not (Set_in r2@59@01 lists@3@01)))))
            (or (not (Set_in r2@59@01 lists@3@01)) (Set_in r2@59@01 lists@3@01))))
        (or (Set_in r1@58@01 lists@3@01) (not (Set_in r1@58@01 lists@3@01)))))
    (or (not (Set_in r1@58@01 lists@3@01)) (Set_in r1@58@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
            (Set_in r2@59@01 lists@3@01))
          (not (Set_in r1@58@01 lists@3@01)))
        (Set_in r1@58@01 lists@3@01))
      (and
        (not (= r1@58@01 r2@59@01))
        (not (Set_in r2@59@01 lists@3@01))
        (Set_in r2@59@01 lists@3@01)
        (not (Set_in r1@58@01 lists@3@01))
        (Set_in r1@58@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= r1@58@01 r2@59@01))
                (not (Set_in r2@59@01 lists@3@01)))
              (Set_in r2@59@01 lists@3@01))
            (not (Set_in r1@58@01 lists@3@01)))
          (Set_in r1@58@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
            (Set_in r2@59@01 lists@3@01))
          (not (Set_in r1@58@01 lists@3@01)))
        (Set_in r1@58@01 lists@3@01))))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :qid |prog.l36-aux|)))
(push) ; 4
(assert (not (forall ((r1@58@01 $Ref) (r2@59@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
          (Set_in r2@59@01 lists@3@01))
        (not (Set_in r1@58@01 lists@3@01)))
      (Set_in r1@58@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r1@58@01)
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r2@59@01))))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :qid |prog.l36|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r1@58@01 $Ref) (r2@59@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@58@01 r2@59@01)) (not (Set_in r2@59@01 lists@3@01)))
          (Set_in r2@59@01 lists@3@01))
        (not (Set_in r1@58@01 lists@3@01)))
      (Set_in r1@58@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r1@58@01)
        ($FVF.lookup_next (as sm@48@01  $FVF<next>) r2@59@01))))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :pattern ((Set_in r1@58@01 lists@3@01) (Set_in r2@59@01 lists@3@01))
  :qid |prog.l36|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@28@01 r) s@18@01))
        (Set_in (inv@28@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@33@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@33@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@34@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@38@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@39@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@39@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@40@01  $FPM) r)
    (ite
      (and
        (not (Set_in (inv@24@01 r) s@18@01))
        (Set_in (inv@24@01 r) lists@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_next (as pm@40@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (= (inv@28@01 r@27@01) r@27@01))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |quant-u-18|)))
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (not (= r@27@01 $Ref.null)))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
  $Snap.unit))
(assert (forall ((r@29@01 $Ref)) (!
  (and
    (or (not (Set_in r@29@01 lists@3@01)) (Set_in r@29@01 lists@3@01))
    (or
      (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
      (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
  :pattern ((Set_in r@29@01 lists@3@01))
  :qid |prog.l34-aux|)))
(assert (forall ((r@29@01 $Ref)) (!
  (and
    (or (not (Set_in r@29@01 lists@3@01)) (Set_in r@29@01 lists@3@01))
    (or
      (not (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01)))
      (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))))
  :pattern ((Set_in r@29@01 s@18@01))
  :qid |prog.l34-aux|)))
(assert (forall ((r@29@01 $Ref)) (!
  (=>
    (and (not (Set_in r@29@01 s@18@01)) (Set_in r@29@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@30@01  $FVF<val>) r@29@01) v@5@01))
  :pattern ((Set_in r@29@01 lists@3@01))
  :pattern ((Set_in r@29@01 s@18@01))
  :qid |prog.l34|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
  $Snap.unit))
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 lists@3@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in r@32@01 s@18@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (or (not (Set_in r@32@01 lists@3@01)) (Set_in r@32@01 lists@3@01))
    (or
      (not (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01)))
      (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (and (not (Set_in r@32@01 s@18@01)) (Set_in r@32@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :pattern ((Set_in r@32@01 lists@3@01))
  :pattern ((Set_in r@32@01 s@18@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@33@01  $FVF<next>) r@32@01) sNext@19@01))
  :qid |prog.l35|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
  $Snap.unit))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@35@01 lists@3@01)
      (and
        (Set_in r1@35@01 lists@3@01)
        (=>
          (not (Set_in r1@35@01 s@18@01))
          (and
            (not (Set_in r1@35@01 s@18@01))
            (=>
              (Set_in r2@36@01 lists@3@01)
              (and
                (Set_in r2@36@01 lists@3@01)
                (or (Set_in r2@36@01 s@18@01) (not (Set_in r2@36@01 s@18@01)))))
            (or (not (Set_in r2@36@01 lists@3@01)) (Set_in r2@36@01 lists@3@01))))
        (or (Set_in r1@35@01 s@18@01) (not (Set_in r1@35@01 s@18@01)))))
    (or (not (Set_in r1@35@01 lists@3@01)) (Set_in r1@35@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))
      (and
        (not (= r1@35@01 r2@36@01))
        (not (Set_in r2@36@01 s@18@01))
        (Set_in r2@36@01 lists@3@01)
        (not (Set_in r1@35@01 s@18@01))
        (Set_in r1@35@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
              (Set_in r2@36@01 lists@3@01))
            (not (Set_in r1@35@01 s@18@01)))
          (Set_in r1@35@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
            (Set_in r2@36@01 lists@3@01))
          (not (Set_in r1@35@01 s@18@01)))
        (Set_in r1@35@01 lists@3@01))))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@35@01 $Ref) (r2@36@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@35@01 r2@36@01)) (not (Set_in r2@36@01 s@18@01)))
          (Set_in r2@36@01 lists@3@01))
        (not (Set_in r1@35@01 s@18@01)))
      (Set_in r1@35@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@37@01  $FVF<next>) r1@35@01)
        ($FVF.lookup_next (as sm@39@01  $FVF<next>) r2@36@01))))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 lists@3@01))
  :pattern ((Set_in r1@35@01 lists@3@01) (Set_in r2@36@01 s@18@01))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 lists@3@01))
  :pattern ((Set_in r1@35@01 s@18@01) (Set_in r2@36@01 s@18@01))
  :qid |prog.l36|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@26@01 r i) sNext@19@01)
    (and (= (inv@26@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@26@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@25@01 $Ref)) (!
  (=>
    (Set_in r@25@01 sNext@19@01)
    (= (inv@26@01 r@25@01 (- length@4@01 1)) r@25@01))
  :pattern ((Set_in r@25@01 sNext@19@01))
  :pattern ((inv@26@01 r@25@01 (- length@4@01 1)))
  :qid |quant-u-16|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (and (not (Set_in r@27@01 s@18@01)) (Set_in r@27@01 lists@3@01))
    (or (not (Set_in r@27@01 lists@3@01)) (Set_in r@27@01 lists@3@01)))
  :pattern ((Set_in r@27@01 s@18@01))
  :pattern ((Set_in r@27@01 lists@3@01))
  :pattern ((inv@28@01 r@27@01))
  :qid |val-aux|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (= (inv@24@01 r) r))
  :pattern ((inv@24@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (= (inv@24@01 r@23@01) r@23@01))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |quant-u-14|)))
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (not (= r@23@01 $Ref.null)))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@22@01 r i) s@18@01)
    (and (= (inv@22@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@22@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@21@01 $Ref)) (!
  (=> (Set_in r@21@01 s@18@01) (= (inv@22@01 r@21@01 length@4@01) r@21@01))
  :pattern ((Set_in r@21@01 s@18@01))
  :pattern ((inv@22@01 r@21@01 length@4@01))
  :qid |quant-u-12|)))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (forall ((r@23@01 $Ref)) (!
  (=>
    (and (not (Set_in r@23@01 s@18@01)) (Set_in r@23@01 lists@3@01))
    (or (not (Set_in r@23@01 lists@3@01)) (Set_in r@23@01 lists@3@01)))
  :pattern ((Set_in r@23@01 s@18@01))
  :pattern ((Set_in r@23@01 lists@3@01))
  :pattern ((inv@24@01 r@23@01))
  :qid |next-aux|)))
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@18@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@18@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | |s@18@01| > 0 | live]
; [else-branch: 23 | !(|s@18@01| > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | |s@18@01| > 0]
(assert (> (Set_card s@18@01) 0))
; [exec]
; var l: Ref
(declare-const l@60@01 $Ref)
; [exec]
; inhale (l in s)
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 $Snap.unit))
; [eval] (l in s)
(assert (Set_in l@60@01 s@18@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(list(l, length), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l@60@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and (= r l@60@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@62@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@62@01 r i))
    $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l@60@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@62@01 r i)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (pTaken@63@01 r i))
    $Perm.No)
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r l@60@01) (= i length@4@01))
    (= (- (- $Perm.Write (pTaken@62@01 r i)) (pTaken@63@01 r i)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@64@01 $PSF<list>)
(declare-const s@65@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@26@01 l@60@01 length@4@01) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@60@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@60@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@60@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (Set_in (inv@22@01 l@60@01 length@4@01) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap l@60@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@60@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@60@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
; [eval] i > 0
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | length@4@01 > 0 | live]
; [else-branch: 24 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | length@4@01 > 0]
(assert (=
  ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@60@01)
    ($SortWrappers.IntTo$Snap length@4@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@60@01)
      ($SortWrappers.IntTo$Snap length@4@01))))
    ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@60@01)
      ($SortWrappers.IntTo$Snap length@4@01)))))))
(declare-const sm@66@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@66@01  $FVF<val>) l@60@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@60@01)
    ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (<= $Perm.No (ite (= l@60@01 l@60@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= l@60@01 l@60@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= l@60@01 l@60@01) (not (= l@60@01 $Ref.null))))
(assert (=
  ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@60@01)
    ($SortWrappers.IntTo$Snap length@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@60@01)
      ($SortWrappers.IntTo$Snap length@4@01)))))
    ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@60@01)
      ($SortWrappers.IntTo$Snap length@4@01))))))))
(declare-const sm@67@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@67@01  $FVF<next>) l@60@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@60@01)
    ($SortWrappers.IntTo$Snap length@4@01))))))))
(declare-const sm@68@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@68@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@68@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@69@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@69@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@69@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@69@01  $FPM) l@60@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] i - 1
(declare-const sm@70@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@70@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))))
  ($Snap.second ($Snap.second ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@60@01)
    ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (<=
  $Perm.No
  (ite
    (and
      (=
        ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01)
        ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
      (= (- length@4@01 1) (- length@4@01 1)))
    $Perm.Write
    $Perm.No)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (list%trigger ($PSF.lookup_list (as sm@64@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap l@60@01)
  ($SortWrappers.IntTo$Snap length@4@01))) l@60@01 length@4@01))
; [exec]
; inhale (forall r: Ref ::
;     { (r in lists) }
;     { (r in s) }
;     (r in lists) && !((r in s)) ==> r.next != l.next)
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.next != l.next)
(declare-const r@72@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> r.next != l.next
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 25 | r@72@01 in lists@3@01 | live]
; [else-branch: 25 | !(r@72@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 25 | r@72@01 in lists@3@01]
(assert (Set_in r@72@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(push) ; 9
; [else-branch: 25 | !(r@72@01 in lists@3@01)]
(assert (not (Set_in r@72@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@72@01 lists@3@01)) (Set_in r@72@01 lists@3@01)))
(push) ; 8
; [then-branch: 26 | !(r@72@01 in s@18@01) && r@72@01 in lists@3@01 | live]
; [else-branch: 26 | !(!(r@72@01 in s@18@01) && r@72@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 26 | !(r@72@01 in s@18@01) && r@72@01 in lists@3@01]
(assert (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01)))
; [eval] r.next != l.next
(declare-const sm@73@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@74@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@74@01  $FPM) r@72@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const sm@75@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef20|)))
(declare-const pm@76@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@76@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@76@01  $FPM) l@60@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 26 | !(!(r@72@01 in s@18@01) && r@72@01 in lists@3@01)]
(assert (not (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@74@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@76@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01)))
  (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@74@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@75@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@75@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@76@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@72@01 $Ref)) (!
  (and
    (or (not (Set_in r@72@01 lists@3@01)) (Set_in r@72@01 lists@3@01))
    (or
      (not (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01)))
      (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01))))
  :pattern ((Set_in r@72@01 lists@3@01))
  :qid |prog.l41-aux|)))
(assert (forall ((r@72@01 $Ref)) (!
  (and
    (or (not (Set_in r@72@01 lists@3@01)) (Set_in r@72@01 lists@3@01))
    (or
      (not (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01)))
      (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01))))
  :pattern ((Set_in r@72@01 s@18@01))
  :qid |prog.l41-aux|)))
(assert (forall ((r@72@01 $Ref)) (!
  (=>
    (and (not (Set_in r@72@01 s@18@01)) (Set_in r@72@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@73@01  $FVF<next>) r@72@01)
        ($FVF.lookup_next (as sm@75@01  $FVF<next>) l@60@01))))
  :pattern ((Set_in r@72@01 lists@3@01))
  :pattern ((Set_in r@72@01 s@18@01))
  :qid |prog.l41|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; s := (s setminus Set(l))
; [eval] (s setminus Set(l))
; [eval] Set(l)
(declare-const s@77@01 Set<$Ref>)
(assert (Set_equal s@77@01 (Set_difference s@18@01 (Set_singleton l@60@01))))
; [exec]
; sNext := (sNext union Set(l.next))
; [eval] (sNext union Set(l.next))
; [eval] Set(l.next)
(declare-const sm@78@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@78@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@78@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@78@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@78@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef23|)))
(declare-const pm@79@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@79@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(set-option :timeout 0)
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_next (as pm@79@01  $FPM) l@60@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const sNext@80@01 Set<$Ref>)
(assert (Set_equal sNext@80@01 (Set_union sNext@19@01 (Set_singleton ($FVF.lookup_next (as sm@78@01  $FVF<next>) l@60@01)))))
; [exec]
; l.val := v
; Precomputing data for removing quantified permissions
(define-fun pTaken@81@01 ((r $Ref)) $Perm
  (ite
    (= r l@60@01)
    ($Perm.min (ite (= r l@60@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (= r l@60@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@81@01 r)))
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
(assert (not (=
  (- (ite (= l@60@01 l@60@01) $Perm.Write $Perm.No) (pTaken@81@01 l@60@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l@60@01) (= (- $Perm.Write (pTaken@81@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@83@01  $FVF<val>) l@60@01) v@5@01))
; Loop head block: Re-establish invariant
(declare-const r@84@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in s)
(assert (Set_in r@84@01 s@77@01))
(pop) ; 7
(declare-fun inv@85@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@84@01 $Ref) (r2@84@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@84@01 s@77@01)
      (Set_in r2@84@01 s@77@01)
      (= r1@84@01 r2@84@01))
    (= r1@84@01 r2@84@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@84@01 $Ref)) (!
  (=> (Set_in r@84@01 s@77@01) (= (inv@85@01 r@84@01 length@4@01) r@84@01))
  :pattern ((Set_in r@84@01 s@77@01))
  :pattern ((inv@85@01 r@84@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@85@01 r i) s@77@01)
    (and (= (inv@85@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@85@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@85@01 r i) s@77@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@62@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@87@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@85@01 r i) s@77@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
        (pTaken@63@01 r i))
      (- $Perm.Write (pTaken@86@01 r i)))
    $Perm.No))
(define-fun pTaken@88@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@85@01 r i) s@77@01)
    ($Perm.min
      (ite
        (and
          (= r ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
          (= i (- length@4@01 1)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@86@01 r i)) (pTaken@87@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@62@01 r i))
      (pTaken@86@01 r i))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@85@01 r i) s@77@01)
    (= (- $Perm.Write (pTaken@86@01 r i)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
        (pTaken@63@01 r i))
      (pTaken@87@01 r i))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@85@01 r i) s@77@01)
    (= (- (- $Perm.Write (pTaken@86@01 r i)) (pTaken@87@01 r i)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $PSF<list>)
(declare-const s@90@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@90@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToInt ($Snap.second s@90@01))) sNext@19@01)
          $Perm.Write
          $Perm.No)
        (pTaken@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToInt ($Snap.second s@90@01)))))
    (and
      (not (= s@90@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@90@01))))
  :pattern (($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@90@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@90@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToInt ($Snap.second s@90@01))) s@18@01)
          $Perm.Write
          $Perm.No)
        (pTaken@63@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01)) ($SortWrappers.$SnapToInt ($Snap.second s@90@01)))))
    (and
      (not (= s@90@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@90@01))))
  :pattern (($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@90@01))
  :qid |qp.psmValDef26|)))
(assert (forall ((s@90@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@90@01))
        ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@90@01)) (- length@4@01 1)))
    (and
      (not (= s@90@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01)
        ($PSF.lookup_list (as sm@70@01  $PSF<list>) s@90@01))))
  :pattern (($PSF.lookup_list (as sm@89@01  $PSF<list>) s@90@01))
  :pattern (($PSF.lookup_list (as sm@70@01  $PSF<list>) s@90@01))
  :qid |qp.psmValDef27|)))
(declare-const r@91@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 27 | r@91@01 in lists@3@01 | live]
; [else-branch: 27 | !(r@91@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 27 | r@91@01 in lists@3@01]
(assert (Set_in r@91@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(push) ; 9
; [else-branch: 27 | !(r@91@01 in lists@3@01)]
(assert (not (Set_in r@91@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@91@01 lists@3@01)) (Set_in r@91@01 lists@3@01)))
(assert (and (not (Set_in r@91@01 s@77@01)) (Set_in r@91@01 lists@3@01)))
(pop) ; 7
(declare-fun inv@92@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@91@01 $Ref)) (!
  (=>
    (and (not (Set_in r@91@01 s@77@01)) (Set_in r@91@01 lists@3@01))
    (or (not (Set_in r@91@01 lists@3@01)) (Set_in r@91@01 lists@3@01)))
  :pattern ((Set_in r@91@01 s@77@01))
  :pattern ((Set_in r@91@01 lists@3@01))
  :pattern ((inv@92@01 r@91@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@91@01 $Ref) (r2@91@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@91@01 s@77@01)) (Set_in r1@91@01 lists@3@01))
      (and (not (Set_in r2@91@01 s@77@01)) (Set_in r2@91@01 lists@3@01))
      (= r1@91@01 r2@91@01))
    (= r1@91@01 r2@91@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@91@01 $Ref)) (!
  (=>
    (and (not (Set_in r@91@01 s@77@01)) (Set_in r@91@01 lists@3@01))
    (= (inv@92@01 r@91@01) r@91@01))
  :pattern ((Set_in r@91@01 s@77@01))
  :pattern ((Set_in r@91@01 lists@3@01))
  :pattern ((inv@92@01 r@91@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@92@01 r) s@77@01)) (Set_in (inv@92@01 r) lists@3@01))
    (= (inv@92@01 r) r))
  :pattern ((inv@92@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and (not (Set_in (inv@92@01 r) s@77@01)) (Set_in (inv@92@01 r) lists@3@01))
    ($Perm.min (ite (= r l@60@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and (not (Set_in (inv@92@01 r) s@77@01)) (Set_in (inv@92@01 r) lists@3@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@93@01 r)))
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
(assert (not (=
  (- (ite (= l@60@01 l@60@01) $Perm.Write $Perm.No) (pTaken@93@01 l@60@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@92@01 r) s@77@01)) (Set_in (inv@92@01 r) lists@3@01))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@92@01 r) s@77@01)) (Set_in (inv@92@01 r) lists@3@01))
    (= (- (- $Perm.Write (pTaken@93@01 r)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@95@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@95@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef29|)))
(declare-const r@96@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in sNext)
(assert (Set_in r@96@01 sNext@80@01))
; [eval] length - 1
(pop) ; 7
(declare-fun inv@97@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@96@01 $Ref) (r2@96@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@96@01 sNext@80@01)
      (Set_in r2@96@01 sNext@80@01)
      (= r1@96@01 r2@96@01))
    (= r1@96@01 r2@96@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@96@01 $Ref)) (!
  (=>
    (Set_in r@96@01 sNext@80@01)
    (= (inv@97@01 r@96@01 (- length@4@01 1)) r@96@01))
  :pattern ((Set_in r@96@01 sNext@80@01))
  :pattern ((inv@97@01 r@96@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@97@01 r i) sNext@80@01)
    (and (= (inv@97@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@97@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@97@01 r i) sNext@80@01)
    ($Perm.min
      (-
        (-
          (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@62@01 r i))
        (pTaken@86@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@99@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@97@01 r i) sNext@80@01)
    ($Perm.min
      (ite
        (and
          (= r ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
          (= i (- length@4@01 1)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@98@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (-
          (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@62@01 r i))
        (pTaken@86@01 r i))
      (pTaken@98@01 r i))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@97@01 r i) sNext@80@01)
    (= (- $Perm.Write (pTaken@98@01 r i)) $Perm.No))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and
        (=
          ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01)
          ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
        (= (- length@4@01 1) (- length@4@01 1)))
      $Perm.Write
      $Perm.No)
    (pTaken@99@01 ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01) (-
      length@4@01
      1)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@97@01 r i) sNext@80@01)
    (= (- (- $Perm.Write (pTaken@98@01 r i)) (pTaken@99@01 r i)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@100@01 $PSF<list>)
(declare-const s@101@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@101@01)) ($SortWrappers.$SnapToInt ($Snap.second s@101@01))) sNext@19@01)
            $Perm.Write
            $Perm.No)
          (pTaken@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@101@01)) ($SortWrappers.$SnapToInt ($Snap.second s@101@01))))
        (pTaken@86@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@101@01)) ($SortWrappers.$SnapToInt ($Snap.second s@101@01)))))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@100@01  $PSF<list>) s@101@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@101@01))))
  :pattern (($PSF.lookup_list (as sm@100@01  $PSF<list>) s@101@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@101@01))
  :qid |qp.psmValDef30|)))
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (and
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@101@01))
        ($FVF.lookup_next (as sm@68@01  $FVF<next>) l@60@01))
      (= ($SortWrappers.$SnapToInt ($Snap.second s@101@01)) (- length@4@01 1)))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@100@01  $PSF<list>) s@101@01)
        ($PSF.lookup_list (as sm@70@01  $PSF<list>) s@101@01))))
  :pattern (($PSF.lookup_list (as sm@100@01  $PSF<list>) s@101@01))
  :pattern (($PSF.lookup_list (as sm@70@01  $PSF<list>) s@101@01))
  :qid |qp.psmValDef31|)))
(declare-const r@102@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 28 | r@102@01 in lists@3@01 | live]
; [else-branch: 28 | !(r@102@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 28 | r@102@01 in lists@3@01]
(assert (Set_in r@102@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(push) ; 9
; [else-branch: 28 | !(r@102@01 in lists@3@01)]
(assert (not (Set_in r@102@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@102@01 lists@3@01)) (Set_in r@102@01 lists@3@01)))
(assert (and (not (Set_in r@102@01 s@77@01)) (Set_in r@102@01 lists@3@01)))
(pop) ; 7
(declare-fun inv@103@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@102@01 $Ref)) (!
  (=>
    (and (not (Set_in r@102@01 s@77@01)) (Set_in r@102@01 lists@3@01))
    (or (not (Set_in r@102@01 lists@3@01)) (Set_in r@102@01 lists@3@01)))
  :pattern ((Set_in r@102@01 s@77@01))
  :pattern ((Set_in r@102@01 lists@3@01))
  :pattern ((inv@103@01 r@102@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@102@01 $Ref) (r2@102@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@102@01 s@77@01)) (Set_in r1@102@01 lists@3@01))
      (and (not (Set_in r2@102@01 s@77@01)) (Set_in r2@102@01 lists@3@01))
      (= r1@102@01 r2@102@01))
    (= r1@102@01 r2@102@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@102@01 $Ref)) (!
  (=>
    (and (not (Set_in r@102@01 s@77@01)) (Set_in r@102@01 lists@3@01))
    (= (inv@103@01 r@102@01) r@102@01))
  :pattern ((Set_in r@102@01 s@77@01))
  :pattern ((Set_in r@102@01 lists@3@01))
  :pattern ((inv@103@01 r@102@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@103@01 r) s@77@01))
      (Set_in (inv@103@01 r) lists@3@01))
    (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (not (Set_in (inv@103@01 r) s@77@01))
      (Set_in (inv@103@01 r) lists@3@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (not (Set_in (inv@103@01 r) s@77@01))
      (Set_in (inv@103@01 r) lists@3@01))
    ($Perm.min
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@104@01 r)))
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
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@104@01 r))
    $Perm.No)
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@103@01 r) s@77@01))
      (Set_in (inv@103@01 r) lists@3@01))
    (= (- $Perm.Write (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (=
  (- (ite (= l@60@01 l@60@01) $Perm.Write $Perm.No) (pTaken@105@01 l@60@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (not (Set_in (inv@103@01 r) s@77@01))
      (Set_in (inv@103@01 r) lists@3@01))
    (= (- (- $Perm.Write (pTaken@104@01 r)) (pTaken@105@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@106@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@106@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@106@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_val (as sm@106@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@106@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfValDef33|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } (r in lists) && !((r in s)) ==> r.val == v)
(declare-const r@107@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> r.val == v
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 29 | r@107@01 in lists@3@01 | live]
; [else-branch: 29 | !(r@107@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 29 | r@107@01 in lists@3@01]
(assert (Set_in r@107@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(push) ; 9
; [else-branch: 29 | !(r@107@01 in lists@3@01)]
(assert (not (Set_in r@107@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@107@01 lists@3@01)) (Set_in r@107@01 lists@3@01)))
(push) ; 8
; [then-branch: 30 | !(r@107@01 in s@77@01) && r@107@01 in lists@3@01 | live]
; [else-branch: 30 | !(!(r@107@01 in s@77@01) && r@107@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 30 | !(r@107@01 in s@77@01) && r@107@01 in lists@3@01]
(assert (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01)))
; [eval] r.val == v
(declare-const sm@108@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef35|)))
(declare-const pm@109@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@109@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_val (as pm@109@01  $FPM) r@107@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 30 | !(!(r@107@01 in s@77@01) && r@107@01 in lists@3@01)]
(assert (not (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@109@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01)))
  (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@108@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@108@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@109@01  $FPM) r)
    (+
      (ite (= r l@60@01) $Perm.Write $Perm.No)
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@107@01 $Ref)) (!
  (and
    (or (not (Set_in r@107@01 lists@3@01)) (Set_in r@107@01 lists@3@01))
    (or
      (not (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01)))
      (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))))
  :pattern ((Set_in r@107@01 lists@3@01))
  :qid |prog.l34-aux|)))
(assert (forall ((r@107@01 $Ref)) (!
  (and
    (or (not (Set_in r@107@01 lists@3@01)) (Set_in r@107@01 lists@3@01))
    (or
      (not (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01)))
      (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))))
  :pattern ((Set_in r@107@01 s@77@01))
  :qid |prog.l34-aux|)))
(push) ; 7
(assert (not (forall ((r@107@01 $Ref)) (!
  (=>
    (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@108@01  $FVF<val>) r@107@01) v@5@01))
  :pattern ((Set_in r@107@01 lists@3@01))
  :pattern ((Set_in r@107@01 s@77@01))
  :qid |prog.l34|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@107@01 $Ref)) (!
  (=>
    (and (not (Set_in r@107@01 s@77@01)) (Set_in r@107@01 lists@3@01))
    (= ($FVF.lookup_val (as sm@108@01  $FVF<val>) r@107@01) v@5@01))
  :pattern ((Set_in r@107@01 lists@3@01))
  :pattern ((Set_in r@107@01 s@77@01))
  :qid |prog.l34|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { (r.next in sNext) } (r in lists) && !((r in s)) ==> (r.next in sNext))
(declare-const r@110@01 $Ref)
(push) ; 7
; [eval] (r in lists) && !((r in s)) ==> (r.next in sNext)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 8
; [then-branch: 31 | r@110@01 in lists@3@01 | live]
; [else-branch: 31 | !(r@110@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 31 | r@110@01 in lists@3@01]
(assert (Set_in r@110@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 9
(push) ; 9
; [else-branch: 31 | !(r@110@01 in lists@3@01)]
(assert (not (Set_in r@110@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@110@01 lists@3@01)) (Set_in r@110@01 lists@3@01)))
(push) ; 8
; [then-branch: 32 | !(r@110@01 in s@77@01) && r@110@01 in lists@3@01 | live]
; [else-branch: 32 | !(!(r@110@01 in s@77@01) && r@110@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 32 | !(r@110@01 in s@77@01) && r@110@01 in lists@3@01]
(assert (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01)))
; [eval] (r.next in sNext)
(declare-const sm@111@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef38|)))
(declare-const pm@112@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@112@01  $FPM) r@110@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 32 | !(!(r@110@01 in s@77@01) && r@110@01 in lists@3@01)]
(assert (not (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01)))
  (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@110@01 $Ref)) (!
  (and
    (or (not (Set_in r@110@01 lists@3@01)) (Set_in r@110@01 lists@3@01))
    (or
      (not (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01)))
      (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))))
  :pattern ((Set_in r@110@01 lists@3@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@110@01 $Ref)) (!
  (and
    (or (not (Set_in r@110@01 lists@3@01)) (Set_in r@110@01 lists@3@01))
    (or
      (not (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01)))
      (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))))
  :pattern ((Set_in r@110@01 s@77@01))
  :qid |prog.l35-aux|)))
(assert (forall ((r@110@01 $Ref)) (!
  (and
    (or (not (Set_in r@110@01 lists@3@01)) (Set_in r@110@01 lists@3@01))
    (or
      (not (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01)))
      (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@111@01  $FVF<next>) r@110@01) sNext@80@01))
  :qid |prog.l35-aux|)))
(push) ; 7
(assert (not (forall ((r@110@01 $Ref)) (!
  (=>
    (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@111@01  $FVF<next>) r@110@01) sNext@80@01))
  :pattern ((Set_in r@110@01 lists@3@01))
  :pattern ((Set_in r@110@01 s@77@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@111@01  $FVF<next>) r@110@01) sNext@80@01))
  :qid |prog.l35|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@110@01 $Ref)) (!
  (=>
    (and (not (Set_in r@110@01 s@77@01)) (Set_in r@110@01 lists@3@01))
    (Set_in ($FVF.lookup_next (as sm@111@01  $FVF<next>) r@110@01) sNext@80@01))
  :pattern ((Set_in r@110@01 lists@3@01))
  :pattern ((Set_in r@110@01 s@77@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@111@01  $FVF<next>) r@110@01) sNext@80@01))
  :qid |prog.l35|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in lists), (r2 in lists) } { (r1 in lists), (r2 in s) } { (r1 in s), (r2 in lists) } { (r1 in s), (r2 in s) } (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next)
(declare-const r1@113@01 $Ref)
(declare-const r2@114@01 $Ref)
(push) ; 7
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2))) ==> r1.next != r2.next
; [eval] (r1 in lists) && (!((r1 in s)) && ((r2 in lists) && (!((r2 in s)) && r1 != r2)))
; [eval] (r1 in lists)
(push) ; 8
; [then-branch: 33 | r1@113@01 in lists@3@01 | live]
; [else-branch: 33 | !(r1@113@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 33 | r1@113@01 in lists@3@01]
(assert (Set_in r1@113@01 lists@3@01))
; [eval] !((r1 in s))
; [eval] (r1 in s)
(push) ; 10
; [then-branch: 34 | !(r1@113@01 in s@77@01) | live]
; [else-branch: 34 | r1@113@01 in s@77@01 | live]
(push) ; 11
; [then-branch: 34 | !(r1@113@01 in s@77@01)]
(assert (not (Set_in r1@113@01 s@77@01)))
; [eval] (r2 in lists)
(push) ; 12
; [then-branch: 35 | r2@114@01 in lists@3@01 | live]
; [else-branch: 35 | !(r2@114@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 35 | r2@114@01 in lists@3@01]
(assert (Set_in r2@114@01 lists@3@01))
; [eval] !((r2 in s))
; [eval] (r2 in s)
(push) ; 14
; [then-branch: 36 | !(r2@114@01 in s@77@01) | live]
; [else-branch: 36 | r2@114@01 in s@77@01 | live]
(push) ; 15
; [then-branch: 36 | !(r2@114@01 in s@77@01)]
(assert (not (Set_in r2@114@01 s@77@01)))
; [eval] r1 != r2
(pop) ; 15
(push) ; 15
; [else-branch: 36 | r2@114@01 in s@77@01]
(assert (Set_in r2@114@01 s@77@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 35 | !(r2@114@01 in lists@3@01)]
(assert (not (Set_in r2@114@01 lists@3@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (Set_in r2@114@01 lists@3@01)
  (and
    (Set_in r2@114@01 lists@3@01)
    (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01))))))
; Joined path conditions
(assert (or (not (Set_in r2@114@01 lists@3@01)) (Set_in r2@114@01 lists@3@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 34 | r1@113@01 in s@77@01]
(assert (Set_in r1@113@01 s@77@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (Set_in r1@113@01 s@77@01))
  (and
    (not (Set_in r1@113@01 s@77@01))
    (=>
      (Set_in r2@114@01 lists@3@01)
      (and
        (Set_in r2@114@01 lists@3@01)
        (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
    (or (not (Set_in r2@114@01 lists@3@01)) (Set_in r2@114@01 lists@3@01)))))
; Joined path conditions
(assert (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 33 | !(r1@113@01 in lists@3@01)]
(assert (not (Set_in r1@113@01 lists@3@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (Set_in r1@113@01 lists@3@01)
  (and
    (Set_in r1@113@01 lists@3@01)
    (=>
      (not (Set_in r1@113@01 s@77@01))
      (and
        (not (Set_in r1@113@01 s@77@01))
        (=>
          (Set_in r2@114@01 lists@3@01)
          (and
            (Set_in r2@114@01 lists@3@01)
            (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
        (or (not (Set_in r2@114@01 lists@3@01)) (Set_in r2@114@01 lists@3@01))))
    (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01))))))
; Joined path conditions
(assert (or (not (Set_in r1@113@01 lists@3@01)) (Set_in r1@113@01 lists@3@01)))
(push) ; 8
; [then-branch: 37 | r1@113@01 != r2@114@01 && !(r2@114@01 in s@77@01) && r2@114@01 in lists@3@01 && !(r1@113@01 in s@77@01) && r1@113@01 in lists@3@01 | live]
; [else-branch: 37 | !(r1@113@01 != r2@114@01 && !(r2@114@01 in s@77@01) && r2@114@01 in lists@3@01 && !(r1@113@01 in s@77@01) && r1@113@01 in lists@3@01) | live]
(push) ; 9
; [then-branch: 37 | r1@113@01 != r2@114@01 && !(r2@114@01 in s@77@01) && r2@114@01 in lists@3@01 && !(r1@113@01 in s@77@01) && r1@113@01 in lists@3@01]
(assert (and
  (and
    (and
      (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
      (Set_in r2@114@01 lists@3@01))
    (not (Set_in r1@113@01 s@77@01)))
  (Set_in r1@113@01 lists@3@01)))
; [eval] r1.next != r2.next
(declare-const sm@115@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(declare-const pm@116@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@116@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@116@01  $FPM) r1@113@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const sm@117@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@118@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(push) ; 10
(assert (not (< $Perm.No ($FVF.perm_next (as pm@118@01  $FPM) r2@114@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 37 | !(r1@113@01 != r2@114@01 && !(r2@114@01 in s@77@01) && r2@114@01 in lists@3@01 && !(r1@113@01 in s@77@01) && r1@113@01 in lists@3@01)]
(assert (not
  (and
    (and
      (and
        (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
        (Set_in r2@114@01 lists@3@01))
      (not (Set_in r1@113@01 s@77@01)))
    (Set_in r1@113@01 lists@3@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@116@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (=>
  (and
    (and
      (and
        (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
        (Set_in r2@114@01 lists@3@01))
      (not (Set_in r1@113@01 s@77@01)))
    (Set_in r1@113@01 lists@3@01))
  (and
    (not (= r1@113@01 r2@114@01))
    (not (Set_in r2@114@01 s@77@01))
    (Set_in r2@114@01 lists@3@01)
    (not (Set_in r1@113@01 s@77@01))
    (Set_in r1@113@01 lists@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
          (Set_in r2@114@01 lists@3@01))
        (not (Set_in r1@113@01 s@77@01)))
      (Set_in r1@113@01 lists@3@01)))
  (and
    (and
      (and
        (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
        (Set_in r2@114@01 lists@3@01))
      (not (Set_in r1@113@01 s@77@01)))
    (Set_in r1@113@01 lists@3@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@115@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@115@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@116@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@60@01)
    (=
      ($FVF.lookup_next (as sm@117@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@117@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (ite (= r l@60@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_next (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@113@01 lists@3@01)
      (and
        (Set_in r1@113@01 lists@3@01)
        (=>
          (not (Set_in r1@113@01 s@77@01))
          (and
            (not (Set_in r1@113@01 s@77@01))
            (=>
              (Set_in r2@114@01 lists@3@01)
              (and
                (Set_in r2@114@01 lists@3@01)
                (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
            (or
              (not (Set_in r2@114@01 lists@3@01))
              (Set_in r2@114@01 lists@3@01))))
        (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01)))))
    (or (not (Set_in r1@113@01 lists@3@01)) (Set_in r1@113@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))
      (and
        (not (= r1@113@01 r2@114@01))
        (not (Set_in r2@114@01 s@77@01))
        (Set_in r2@114@01 lists@3@01)
        (not (Set_in r1@113@01 s@77@01))
        (Set_in r1@113@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= r1@113@01 r2@114@01))
                (not (Set_in r2@114@01 s@77@01)))
              (Set_in r2@114@01 lists@3@01))
            (not (Set_in r1@113@01 s@77@01)))
          (Set_in r1@113@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@113@01 lists@3@01)
      (and
        (Set_in r1@113@01 lists@3@01)
        (=>
          (not (Set_in r1@113@01 s@77@01))
          (and
            (not (Set_in r1@113@01 s@77@01))
            (=>
              (Set_in r2@114@01 lists@3@01)
              (and
                (Set_in r2@114@01 lists@3@01)
                (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
            (or
              (not (Set_in r2@114@01 lists@3@01))
              (Set_in r2@114@01 lists@3@01))))
        (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01)))))
    (or (not (Set_in r1@113@01 lists@3@01)) (Set_in r1@113@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))
      (and
        (not (= r1@113@01 r2@114@01))
        (not (Set_in r2@114@01 s@77@01))
        (Set_in r2@114@01 lists@3@01)
        (not (Set_in r1@113@01 s@77@01))
        (Set_in r1@113@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= r1@113@01 r2@114@01))
                (not (Set_in r2@114@01 s@77@01)))
              (Set_in r2@114@01 lists@3@01))
            (not (Set_in r1@113@01 s@77@01)))
          (Set_in r1@113@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 s@77@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@113@01 lists@3@01)
      (and
        (Set_in r1@113@01 lists@3@01)
        (=>
          (not (Set_in r1@113@01 s@77@01))
          (and
            (not (Set_in r1@113@01 s@77@01))
            (=>
              (Set_in r2@114@01 lists@3@01)
              (and
                (Set_in r2@114@01 lists@3@01)
                (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
            (or
              (not (Set_in r2@114@01 lists@3@01))
              (Set_in r2@114@01 lists@3@01))))
        (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01)))))
    (or (not (Set_in r1@113@01 lists@3@01)) (Set_in r1@113@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))
      (and
        (not (= r1@113@01 r2@114@01))
        (not (Set_in r2@114@01 s@77@01))
        (Set_in r2@114@01 lists@3@01)
        (not (Set_in r1@113@01 s@77@01))
        (Set_in r1@113@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= r1@113@01 r2@114@01))
                (not (Set_in r2@114@01 s@77@01)))
              (Set_in r2@114@01 lists@3@01))
            (not (Set_in r1@113@01 s@77@01)))
          (Set_in r1@113@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 lists@3@01))
  :qid |prog.l36-aux|)))
(assert (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@113@01 lists@3@01)
      (and
        (Set_in r1@113@01 lists@3@01)
        (=>
          (not (Set_in r1@113@01 s@77@01))
          (and
            (not (Set_in r1@113@01 s@77@01))
            (=>
              (Set_in r2@114@01 lists@3@01)
              (and
                (Set_in r2@114@01 lists@3@01)
                (or (Set_in r2@114@01 s@77@01) (not (Set_in r2@114@01 s@77@01)))))
            (or
              (not (Set_in r2@114@01 lists@3@01))
              (Set_in r2@114@01 lists@3@01))))
        (or (Set_in r1@113@01 s@77@01) (not (Set_in r1@113@01 s@77@01)))))
    (or (not (Set_in r1@113@01 lists@3@01)) (Set_in r1@113@01 lists@3@01))
    (=>
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))
      (and
        (not (= r1@113@01 r2@114@01))
        (not (Set_in r2@114@01 s@77@01))
        (Set_in r2@114@01 lists@3@01)
        (not (Set_in r1@113@01 s@77@01))
        (Set_in r1@113@01 lists@3@01)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= r1@113@01 r2@114@01))
                (not (Set_in r2@114@01 s@77@01)))
              (Set_in r2@114@01 lists@3@01))
            (not (Set_in r1@113@01 s@77@01)))
          (Set_in r1@113@01 lists@3@01)))
      (and
        (and
          (and
            (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
            (Set_in r2@114@01 lists@3@01))
          (not (Set_in r1@113@01 s@77@01)))
        (Set_in r1@113@01 lists@3@01))))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 s@77@01))
  :qid |prog.l36-aux|)))
(push) ; 7
(assert (not (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
          (Set_in r2@114@01 lists@3@01))
        (not (Set_in r1@113@01 s@77@01)))
      (Set_in r1@113@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@115@01  $FVF<next>) r1@113@01)
        ($FVF.lookup_next (as sm@117@01  $FVF<next>) r2@114@01))))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 lists@3@01))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 s@77@01))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 lists@3@01))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 s@77@01))
  :qid |prog.l36|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r1@113@01 $Ref) (r2@114@01 $Ref)) (!
  (=>
    (and
      (and
        (and
          (and (not (= r1@113@01 r2@114@01)) (not (Set_in r2@114@01 s@77@01)))
          (Set_in r2@114@01 lists@3@01))
        (not (Set_in r1@113@01 s@77@01)))
      (Set_in r1@113@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@115@01  $FVF<next>) r1@113@01)
        ($FVF.lookup_next (as sm@117@01  $FVF<next>) r2@114@01))))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 lists@3@01))
  :pattern ((Set_in r1@113@01 lists@3@01) (Set_in r2@114@01 s@77@01))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 lists@3@01))
  :pattern ((Set_in r1@113@01 s@77@01) (Set_in r2@114@01 s@77@01))
  :qid |prog.l36|)))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(|s@18@01| > 0)]
(assert (not (> (Set_card s@18@01) 0)))
(pop) ; 5
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@18@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@18@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 38 | !(|s@18@01| > 0) | live]
; [else-branch: 38 | |s@18@01| > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | !(|s@18@01| > 0)]
(assert (not (> (Set_card s@18@01) 0)))
; [eval] length - 1 > 0
; [eval] length - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (> (- length@4@01 1) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 39 | length@4@01 - 1 > 0 | live]
; [else-branch: 39 | !(length@4@01 - 1 > 0) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | length@4@01 - 1 > 0]
(assert (> (- length@4@01 1) 0))
; [exec]
; m1(sNext, length - 1, v)
; [eval] length - 1
; [eval] length > 0
(declare-const r@119@01 $Ref)
(push) ; 7
; [eval] (r in lists)
(assert (Set_in r@119@01 sNext@19@01))
(pop) ; 7
(declare-fun inv@120@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((r1@119@01 $Ref) (r2@119@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@119@01 sNext@19@01)
      (Set_in r2@119@01 sNext@19@01)
      (= r1@119@01 r2@119@01))
    (= r1@119@01 r2@119@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@119@01 $Ref)) (!
  (=>
    (Set_in r@119@01 sNext@19@01)
    (= (inv@120@01 r@119@01 (- length@4@01 1)) r@119@01))
  :pattern ((Set_in r@119@01 sNext@19@01))
  :pattern ((inv@120@01 r@119@01 (- length@4@01 1)))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@120@01 r i) sNext@19@01)
    (and (= (inv@120@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@120@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@120@01 r i) sNext@19@01)
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@122@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@120@01 r i) sNext@19@01)
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@121@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@121@01 r i))
    $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@120@01 r i) sNext@19@01)
    (= (- $Perm.Write (pTaken@121@01 r i)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $PSF<list>)
(declare-const s@124@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@124@01)) ($SortWrappers.$SnapToInt ($Snap.second s@124@01))) s@18@01)
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@123@01  $PSF<list>) s@124@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@124@01))))
  :pattern (($PSF.lookup_list (as sm@123@01  $PSF<list>) s@124@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@124@01))
  :qid |qp.psmValDef46|)))
(assert (forall ((s@124@01 $Snap)) (!
  (=>
    (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@124@01)) ($SortWrappers.$SnapToInt ($Snap.second s@124@01))) sNext@19@01)
    (and
      (not (= s@124@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@123@01  $PSF<list>) s@124@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@124@01))))
  :pattern (($PSF.lookup_list (as sm@123@01  $PSF<list>) s@124@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@124@01))
  :qid |qp.psmValDef47|)))
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 ($Snap.combine ($Snap.first $t@125@01) ($Snap.second $t@125@01))))
(declare-const r@126@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (r in lists)
(assert (Set_in r@126@01 sNext@19@01))
(pop) ; 7
(declare-fun inv@127@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@126@01 $Ref)) (!
  (=>
    (Set_in r@126@01 sNext@19@01)
    (= (inv@127@01 r@126@01 (- length@4@01 1)) r@126@01))
  :pattern ((Set_in r@126@01 sNext@19@01))
  :pattern ((inv@127@01 r@126@01 (- length@4@01 1)))
  :qid |quant-u-66|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@127@01 r i) sNext@19@01)
    (and (= (inv@127@01 r i) r) (= (- length@4@01 1) i)))
  :pattern ((inv@127@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@125@01) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@128@01 $Ref)
(push) ; 7
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 8
; [then-branch: 40 | r@128@01 in sNext@19@01 | live]
; [else-branch: 40 | !(r@128@01 in sNext@19@01) | live]
(push) ; 9
; [then-branch: 40 | r@128@01 in sNext@19@01]
(assert (Set_in r@128@01 sNext@19@01))
; [eval] allSet(r, length, v)
(push) ; 10
; Precomputing data for removing quantified permissions
(define-fun pTaken@129@01 ((r $Ref) (i Int) (r@128@01 $Ref)) $Perm
  (ite
    (and (= r r@128@01) (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@130@01 ((r $Ref) (i Int) (r@128@01 $Ref)) $Perm
  (ite
    (and (= r r@128@01) (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@129@01 r i r@128@01)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@129@01 r i r@128@01))
    $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@128@01) (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@129@01 r i r@128@01)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@131@01 $PSF<list>)
(declare-const s@132@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@128@01)
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@131@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@127@01 r@128@01 (- length@4@01 1)) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@128@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@128@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (Set_in (inv@22@01 r@128@01 (- length@4@01 1)) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@128@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@128@01)
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@128@01)
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@128@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@131@01  $PSF<list>)))
  (=>
    (Set_in (inv@127@01 r@128@01 (- length@4@01 1)) sNext@19@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (Set_in (inv@22@01 r@128@01 (- length@4@01 1)) s@18@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@128@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 40 | !(r@128@01 in sNext@19@01)]
(assert (not (Set_in r@128@01 sNext@19@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (Set_in r@128@01 sNext@19@01)
  (and
    (Set_in r@128@01 sNext@19@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@128@01)
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@131@01  $PSF<list>)))
    (=>
      (Set_in (inv@127@01 r@128@01 (- length@4@01 1)) sNext@19@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@128@01)
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (Set_in (inv@22@01 r@128@01 (- length@4@01 1)) s@18@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@128@01)
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@128@01)
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@128@01)
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@128@01 sNext@19@01)) (Set_in r@128@01 sNext@19@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@128@01 $Ref)) (!
  (and
    (=>
      (Set_in r@128@01 sNext@19@01)
      (and
        (Set_in r@128@01 sNext@19@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@131@01  $PSF<list>)))
        (=>
          (Set_in (inv@127@01 r@128@01 (- length@4@01 1)) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@128@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (Set_in (inv@22@01 r@128@01 (- length@4@01 1)) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@128@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@128@01 sNext@19@01)) (Set_in r@128@01 sNext@19@01)))
  :pattern ((Set_in r@128@01 sNext@19@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@128@01 $Ref)) (!
  (and
    (=>
      (Set_in r@128@01 sNext@19@01)
      (and
        (Set_in r@128@01 sNext@19@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@131@01  $PSF<list>)))
        (=>
          (Set_in (inv@127@01 r@128@01 (- length@4@01 1)) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@128@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (Set_in (inv@22@01 r@128@01 (- length@4@01 1)) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@128@01)
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@128@01)
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@128@01)
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@128@01 sNext@19@01)) (Set_in r@128@01 sNext@19@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@128@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@128@01 $Ref)) (!
  (=>
    (Set_in r@128@01 sNext@19@01)
    (allSet ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@128@01)
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01))
  :pattern ((Set_in r@128@01 sNext@19@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@131@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@128@01)
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) r@128@01 (- length@4@01 1) v@5@01))
  :qid |prog.l26|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; s := lists
(declare-const s@133@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@134@01 $Snap)
(assert (= $t@134@01 ($Snap.combine ($Snap.first $t@134@01) ($Snap.second $t@134@01))))
(declare-const r@135@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 41 | r@135@01 in lists@3@01 | live]
; [else-branch: 41 | !(r@135@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 41 | r@135@01 in lists@3@01]
(assert (Set_in r@135@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 41 | !(r@135@01 in lists@3@01)]
(assert (not (Set_in r@135@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@135@01 lists@3@01)) (Set_in r@135@01 lists@3@01)))
(assert (and (not (Set_in r@135@01 s@133@01)) (Set_in r@135@01 lists@3@01)))
(pop) ; 8
(declare-fun inv@136@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (not (Set_in r@135@01 s@133@01)) (Set_in r@135@01 lists@3@01))
    (or (not (Set_in r@135@01 lists@3@01)) (Set_in r@135@01 lists@3@01)))
  :pattern ((Set_in r@135@01 s@133@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((inv@136@01 r@135@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (not (Set_in r@135@01 s@133@01)) (Set_in r@135@01 lists@3@01))
    (= (inv@136@01 r@135@01 length@4@01) r@135@01))
  :pattern ((Set_in r@135@01 s@133@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((inv@136@01 r@135@01 length@4@01))
  :qid |quant-u-71|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@136@01 r i) s@133@01))
      (Set_in (inv@136@01 r i) lists@3@01))
    (and (= (inv@136@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@136@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@134@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@134@01))
    ($Snap.second ($Snap.second $t@134@01)))))
(assert (= ($Snap.first ($Snap.second $t@134@01)) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@137@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 42 | r@137@01 in lists@3@01 | live]
; [else-branch: 42 | !(r@137@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 42 | r@137@01 in lists@3@01]
(assert (Set_in r@137@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 42 | !(r@137@01 in lists@3@01)]
(assert (not (Set_in r@137@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01)))
(push) ; 9
; [then-branch: 43 | !(r@137@01 in s@133@01) && r@137@01 in lists@3@01 | live]
; [else-branch: 43 | !(!(r@137@01 in s@133@01) && r@137@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 43 | !(r@137@01 in s@133@01) && r@137@01 in lists@3@01]
(assert (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@138@01 ((r $Ref) (i Int) (r@137@01 $Ref)) $Perm
  (ite
    (and (= r r@137@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
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
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@138@01 r i r@137@01))
    $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@137@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@138@01 r i r@137@01)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@139@01 $PSF<list>)
(declare-const s@140@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@137@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
    (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@137@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@137@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@137@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
  (=>
    (and
      (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
      (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@137@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 43 | !(!(r@137@01 in s@133@01) && r@137@01 in lists@3@01)]
(assert (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
  (and
    (not (Set_in r@137@01 s@133@01))
    (Set_in r@137@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@137@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
    (=>
      (and
        (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
        (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@137@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@137@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@137@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@137@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
  (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((Set_in r@137@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((Set_in r@137@01 s@133@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (=>
    (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@137@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :pattern ((Set_in r@137@01 lists@3@01))
  :pattern ((Set_in r@137@01 s@133@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(assert (=
  ($Snap.second ($Snap.second $t@134@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@134@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
(declare-const r@141@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@141@01 s@133@01))
(pop) ; 8
(declare-fun inv@142@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@141@01 $Ref)) (!
  (=> (Set_in r@141@01 s@133@01) (= (inv@142@01 r@141@01) r@141@01))
  :pattern ((Set_in r@141@01 s@133@01))
  :pattern ((inv@142@01 r@141@01))
  :qid |quant-u-76|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@142@01 r) s@133@01) (= (inv@142@01 r) r))
  :pattern ((inv@142@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@141@01 $Ref)) (!
  (=> (Set_in r@141@01 s@133@01) (not (= r@141@01 $Ref.null)))
  :pattern ((Set_in r@141@01 s@133@01))
  :pattern ((inv@142@01 r@141@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@134@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@143@01 $Ref)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 44 | r@143@01 in s@133@01 | live]
; [else-branch: 44 | !(r@143@01 in s@133@01) | live]
(push) ; 10
; [then-branch: 44 | r@143@01 in s@133@01]
(assert (Set_in r@143@01 s@133@01))
; [eval] r.val == v
(declare-const sm@144@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@142@01 r) s@133@01)
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef53|)))
(declare-const pm@145@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@145@01  $FPM) r)
    (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@145@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_val (as pm@145@01  $FPM) r@143@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 44 | !(r@143@01 in s@133@01)]
(assert (not (Set_in r@143@01 s@133@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@142@01 r) s@133@01)
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@145@01  $FPM) r)
    (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@145@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
; Joined path conditions
(assert (or (not (Set_in r@143@01 s@133@01)) (Set_in r@143@01 s@133@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@142@01 r) s@133@01)
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@145@01  $FPM) r)
    (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@145@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@143@01 $Ref)) (!
  (or (not (Set_in r@143@01 s@133@01)) (Set_in r@143@01 s@133@01))
  :pattern ((Set_in r@143@01 s@133@01))
  :qid |prog.l54-aux|)))
(assert (forall ((r@143@01 $Ref)) (!
  (=>
    (Set_in r@143@01 s@133@01)
    (= ($FVF.lookup_val (as sm@144@01  $FVF<val>) r@143@01) v@5@01))
  :pattern ((Set_in r@143@01 s@133@01))
  :qid |prog.l54|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
(declare-const r@146@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@146@01 s@133@01))
(pop) ; 8
(declare-fun inv@147@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@146@01 $Ref)) (!
  (=> (Set_in r@146@01 s@133@01) (= (inv@147@01 r@146@01) r@146@01))
  :pattern ((Set_in r@146@01 s@133@01))
  :pattern ((inv@147@01 r@146@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@147@01 r) s@133@01) (= (inv@147@01 r) r))
  :pattern ((inv@147@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@146@01 $Ref)) (!
  (=> (Set_in r@146@01 s@133@01) (not (= r@146@01 $Ref.null)))
  :pattern ((Set_in r@146@01 s@133@01))
  :pattern ((inv@147@01 r@146@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
  $Snap.unit))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@148@01 $Ref)
(declare-const r2@149@01 $Ref)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 45 | r1@148@01 in s@133@01 | live]
; [else-branch: 45 | !(r1@148@01 in s@133@01) | live]
(push) ; 10
; [then-branch: 45 | r1@148@01 in s@133@01]
(assert (Set_in r1@148@01 s@133@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 46 | r2@149@01 in s@133@01 | live]
; [else-branch: 46 | !(r2@149@01 in s@133@01) | live]
(push) ; 12
; [then-branch: 46 | r2@149@01 in s@133@01]
(assert (Set_in r2@149@01 s@133@01))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 46 | !(r2@149@01 in s@133@01)]
(assert (not (Set_in r2@149@01 s@133@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@149@01 s@133@01)) (Set_in r2@149@01 s@133@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 45 | !(r1@148@01 in s@133@01)]
(assert (not (Set_in r1@148@01 s@133@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r1@148@01 s@133@01)
  (and
    (Set_in r1@148@01 s@133@01)
    (or (not (Set_in r2@149@01 s@133@01)) (Set_in r2@149@01 s@133@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@148@01 s@133@01)) (Set_in r1@148@01 s@133@01)))
(push) ; 9
; [then-branch: 47 | r1@148@01 != r2@149@01 && r2@149@01 in s@133@01 && r1@148@01 in s@133@01 | live]
; [else-branch: 47 | !(r1@148@01 != r2@149@01 && r2@149@01 in s@133@01 && r1@148@01 in s@133@01) | live]
(push) ; 10
; [then-branch: 47 | r1@148@01 != r2@149@01 && r2@149@01 in s@133@01 && r1@148@01 in s@133@01]
(assert (and
  (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
  (Set_in r1@148@01 s@133@01)))
; [eval] r1.next != r2.next
(declare-const sm@150@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef55|)))
(declare-const pm@151@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@151@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@151@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@151@01  $FPM) r1@148@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@152@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef57|)))
(declare-const pm@153@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@153@01  $FPM) r2@149@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 47 | !(r1@148@01 != r2@149@01 && r2@149@01 in s@133@01 && r1@148@01 in s@133@01)]
(assert (not
  (and
    (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
    (Set_in r1@148@01 s@133@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@151@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@151@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (=>
  (and
    (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
    (Set_in r1@148@01 s@133@01))
  (and
    (not (= r1@148@01 r2@149@01))
    (Set_in r2@149@01 s@133@01)
    (Set_in r1@148@01 s@133@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
      (Set_in r1@148@01 s@133@01)))
  (and
    (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
    (Set_in r1@148@01 s@133@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@151@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@151@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@148@01 $Ref) (r2@149@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@148@01 s@133@01)
      (and
        (Set_in r1@148@01 s@133@01)
        (or (not (Set_in r2@149@01 s@133@01)) (Set_in r2@149@01 s@133@01))))
    (or (not (Set_in r1@148@01 s@133@01)) (Set_in r1@148@01 s@133@01))
    (=>
      (and
        (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
        (Set_in r1@148@01 s@133@01))
      (and
        (not (= r1@148@01 r2@149@01))
        (Set_in r2@149@01 s@133@01)
        (Set_in r1@148@01 s@133@01)))
    (or
      (not
        (and
          (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
          (Set_in r1@148@01 s@133@01)))
      (and
        (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
        (Set_in r1@148@01 s@133@01))))
  :pattern ((Set_in r1@148@01 s@133@01) (Set_in r2@149@01 s@133@01))
  :qid |prog.l55-aux|)))
(assert (forall ((r1@148@01 $Ref) (r2@149@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
      (Set_in r1@148@01 s@133@01))
    (not
      (=
        ($FVF.lookup_next (as sm@150@01  $FVF<next>) r1@148@01)
        ($FVF.lookup_next (as sm@152@01  $FVF<next>) r2@149@01))))
  :pattern ((Set_in r1@148@01 s@133@01) (Set_in r2@149@01 s@133@01))
  :qid |prog.l55|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
(declare-const r@154@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@154@01 s@133@01))
(declare-const sm@155@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef59|)))
(declare-const pm@156@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@156@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef60|)))
(push) ; 9
(assert (not (< $Perm.No ($FVF.perm_next (as pm@156@01  $FPM) r@154@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@157@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@156@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef60|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@154@01 $Ref)) (!
  (=>
    (Set_in r@154@01 s@133@01)
    (=
      (inv@157@01 ($FVF.lookup_next (as sm@155@01  $FVF<next>) r@154@01) (-
        length@4@01
        1))
      r@154@01))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r@154@01))
  :qid |quant-u-80|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@157@01 r i) s@133@01)
    (and
      (= ($FVF.lookup_next (as sm@155@01  $FVF<next>) (inv@157@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@157@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@158@01 $Ref)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 48 | r@158@01 in s@133@01 | live]
; [else-branch: 48 | !(r@158@01 in s@133@01) | live]
(push) ; 10
; [then-branch: 48 | r@158@01 in s@133@01]
(assert (Set_in r@158@01 s@133@01))
; [eval] allSet(r.next, length - 1, v)
(declare-const sm@159@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@159@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef61|)))
(declare-const pm@160@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@160@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@160@01  $FPM) r@158@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((r $Ref) (i Int) (r@158@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@162@01 ((r $Ref) (i Int) (r@158@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@161@01 r i r@158@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      (pTaken@161@01 r i r@158@01))
    $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@161@01 r i r@158@01)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@163@01 $PSF<list>)
(declare-const s@164@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@157@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
    length@4@01
    1)) s@133@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
        length@4@01
        1)) s@133@01))
    (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>)))
  (=>
    (Set_in (inv@157@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
      length@4@01
      1)) s@133@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (not
        (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
          length@4@01
          1)) s@133@01))
      (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
        length@4@01
        1)) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 48 | !(r@158@01 in s@133@01)]
(assert (not (Set_in r@158@01 s@133@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@159@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@160@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (=>
  (Set_in r@158@01 s@133@01)
  (and
    (Set_in r@158@01 s@133@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>)))
    (=>
      (Set_in (inv@157@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
        length@4@01
        1)) s@133@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (not
          (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
            length@4@01
            1)) s@133@01))
        (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
          length@4@01
          1)) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@158@01 s@133@01)) (Set_in r@158@01 s@133@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@159@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@160@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@158@01 $Ref)) (!
  (and
    (=>
      (Set_in r@158@01 s@133@01)
      (and
        (Set_in r@158@01 s@133@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>)))
        (=>
          (Set_in (inv@157@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
            length@4@01
            1)) s@133@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
                length@4@01
                1)) s@133@01))
            (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@158@01 s@133@01)) (Set_in r@158@01 s@133@01)))
  :pattern ((Set_in r@158@01 s@133@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@158@01 $Ref)) (!
  (=>
    (Set_in r@158@01 s@133@01)
    (allSet ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@158@01 s@133@01))
  :qid |prog.l57|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 8
; [eval] |s| > 0
; [eval] |s|
(pop) ; 8
(push) ; 8
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 8
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
(declare-const r@165@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 49 | r@165@01 in lists@3@01 | live]
; [else-branch: 49 | !(r@165@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 49 | r@165@01 in lists@3@01]
(assert (Set_in r@165@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 49 | !(r@165@01 in lists@3@01)]
(assert (not (Set_in r@165@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@165@01 lists@3@01)) (Set_in r@165@01 lists@3@01)))
(assert (and (not (Set_in r@165@01 lists@3@01)) (Set_in r@165@01 lists@3@01)))
(pop) ; 8
(declare-fun inv@166@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@165@01 $Ref)) (!
  (=>
    (and (not (Set_in r@165@01 lists@3@01)) (Set_in r@165@01 lists@3@01))
    (or (not (Set_in r@165@01 lists@3@01)) (Set_in r@165@01 lists@3@01)))
  :pattern ((Set_in r@165@01 lists@3@01))
  :pattern ((inv@166@01 r@165@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@165@01 $Ref) (r2@165@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@165@01 lists@3@01)) (Set_in r1@165@01 lists@3@01))
      (and (not (Set_in r2@165@01 lists@3@01)) (Set_in r2@165@01 lists@3@01))
      (= r1@165@01 r2@165@01))
    (= r1@165@01 r2@165@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@165@01 $Ref)) (!
  (=>
    (and (not (Set_in r@165@01 lists@3@01)) (Set_in r@165@01 lists@3@01))
    (= (inv@166@01 r@165@01 length@4@01) r@165@01))
  :pattern ((Set_in r@165@01 lists@3@01))
  :pattern ((inv@166@01 r@165@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@166@01 r i) lists@3@01))
      (Set_in (inv@166@01 r i) lists@3@01))
    (and (= (inv@166@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@166@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@166@01 r i) lists@3@01))
      (Set_in (inv@166@01 r i) lists@3@01))
    ($Perm.min
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@168@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@166@01 r i) lists@3@01))
      (Set_in (inv@166@01 r i) lists@3@01))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@167@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@167@01 r i))
    $Perm.No)
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@166@01 r i) lists@3@01))
      (Set_in (inv@166@01 r i) lists@3@01))
    (= (- $Perm.Write (pTaken@167@01 r i)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@169@01 $PSF<list>)
(declare-const s@170@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@170@01 $Snap)) (!
  (=>
    (Set_in (inv@127@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@170@01)) ($SortWrappers.$SnapToInt ($Snap.second s@170@01))) sNext@19@01)
    (and
      (not (= s@170@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@169@01  $PSF<list>) s@170@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@170@01))))
  :pattern (($PSF.lookup_list (as sm@169@01  $PSF<list>) s@170@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@170@01))
  :qid |qp.psmValDef66|)))
(assert (forall ((s@170@01 $Snap)) (!
  (=>
    (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@170@01)) ($SortWrappers.$SnapToInt ($Snap.second s@170@01))) s@18@01)
    (and
      (not (= s@170@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@169@01  $PSF<list>) s@170@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@170@01))))
  :pattern (($PSF.lookup_list (as sm@169@01  $PSF<list>) s@170@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@170@01))
  :qid |qp.psmValDef67|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@171@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 50 | r@171@01 in lists@3@01 | live]
; [else-branch: 50 | !(r@171@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 50 | r@171@01 in lists@3@01]
(assert (Set_in r@171@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 50 | !(r@171@01 in lists@3@01)]
(assert (not (Set_in r@171@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
(push) ; 9
; [then-branch: 51 | !(r@171@01 in lists@3@01) && r@171@01 in lists@3@01 | live]
; [else-branch: 51 | !(!(r@171@01 in lists@3@01) && r@171@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 51 | !(r@171@01 in lists@3@01) && r@171@01 in lists@3@01]
(assert (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@172@01 ((r $Ref) (i Int) (r@171@01 $Ref)) $Perm
  (ite
    (and (= r r@171@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@173@01 ((r $Ref) (i Int) (r@171@01 $Ref)) $Perm
  (ite
    (and (= r r@171@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@172@01 r i r@171@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@172@01 r i r@171@01))
    $Perm.No)
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@171@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@172@01 r i r@171@01)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@174@01 $PSF<list>)
(declare-const s@175@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@171@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@174@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@127@01 r@171@01 length@4@01) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@171@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@171@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (Set_in (inv@22@01 r@171@01 length@4@01) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@171@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@171@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@171@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@174@01  $PSF<list>)))
  (=>
    (Set_in (inv@127@01 r@171@01 length@4@01) sNext@19@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (Set_in (inv@22@01 r@171@01 length@4@01) s@18@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 51 | !(!(r@171@01 in lists@3@01) && r@171@01 in lists@3@01)]
(assert (not (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
  (and
    (not (Set_in r@171@01 lists@3@01))
    (Set_in r@171@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@171@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@174@01  $PSF<list>)))
    (=>
      (Set_in (inv@127@01 r@171@01 length@4@01) sNext@19@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@171@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (Set_in (inv@22@01 r@171@01 length@4@01) s@18@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@171@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@171@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@171@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
  (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@171@01 $Ref)) (!
  (and
    (or (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
    (=>
      (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
      (and
        (not (Set_in r@171@01 lists@3@01))
        (Set_in r@171@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@174@01  $PSF<list>)))
        (=>
          (Set_in (inv@127@01 r@171@01 length@4@01) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@171@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@22@01 r@171@01 length@4@01) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@171@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
      (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))))
  :pattern ((Set_in r@171@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@171@01 $Ref)) (!
  (and
    (or (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
    (=>
      (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
      (and
        (not (Set_in r@171@01 lists@3@01))
        (Set_in r@171@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@174@01  $PSF<list>)))
        (=>
          (Set_in (inv@127@01 r@171@01 length@4@01) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@171@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@22@01 r@171@01 length@4@01) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@171@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@171@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
      (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@171@01 $Ref)) (!
  (=>
    (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
    (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@171@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :qid |prog.l53_precondition|)))
(push) ; 8
(assert (not (forall ((r@171@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
        (allSet%precondition ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@171@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
      (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01)))
    (allSet ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@171@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :qid |prog.l53|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@171@01 $Ref)) (!
  (=>
    (and (not (Set_in r@171@01 lists@3@01)) (Set_in r@171@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@171@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((Set_in r@171@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@174@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@171@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@171@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(declare-const r@176@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@176@01 lists@3@01))
(pop) ; 8
(declare-fun inv@177@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@176@01 $Ref) (r2@176@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@176@01 lists@3@01)
      (Set_in r2@176@01 lists@3@01)
      (= r1@176@01 r2@176@01))
    (= r1@176@01 r2@176@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@176@01 $Ref)) (!
  (=> (Set_in r@176@01 lists@3@01) (= (inv@177@01 r@176@01) r@176@01))
  :pattern ((Set_in r@176@01 lists@3@01))
  :pattern ((inv@177@01 r@176@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@177@01 r) lists@3@01) (= (inv@177@01 r) r))
  :pattern ((inv@177@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@177@01 r) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@178@01 r))
    $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@177@01 r) lists@3@01)
    (= (- $Perm.Write (pTaken@178@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@179@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@179@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@179@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef71|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@180@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 52 | r@180@01 in lists@3@01 | live]
; [else-branch: 52 | !(r@180@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 52 | r@180@01 in lists@3@01]
(assert (Set_in r@180@01 lists@3@01))
; [eval] r.val == v
(push) ; 11
(assert (not (and
  (not (Set_in (inv@28@01 r@180@01) s@18@01))
  (Set_in (inv@28@01 r@180@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 52 | !(r@180@01 in lists@3@01)]
(assert (not (Set_in r@180@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@180@01 lists@3@01)) (Set_in r@180@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@180@01 $Ref)) (!
  (or (not (Set_in r@180@01 lists@3@01)) (Set_in r@180@01 lists@3@01))
  :pattern ((Set_in r@180@01 lists@3@01))
  :qid |prog.l54-aux|)))
(push) ; 8
(assert (not (forall ((r@180@01 $Ref)) (!
  (=>
    (Set_in r@180@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@179@01  $FVF<val>) r@180@01) v@5@01))
  :pattern ((Set_in r@180@01 lists@3@01))
  :qid |prog.l54|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@180@01 $Ref)) (!
  (=>
    (Set_in r@180@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@179@01  $FVF<val>) r@180@01) v@5@01))
  :pattern ((Set_in r@180@01 lists@3@01))
  :qid |prog.l54|)))
(declare-const r@181@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@181@01 lists@3@01))
(pop) ; 8
(declare-fun inv@182@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@181@01 $Ref) (r2@181@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@181@01 lists@3@01)
      (Set_in r2@181@01 lists@3@01)
      (= r1@181@01 r2@181@01))
    (= r1@181@01 r2@181@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@181@01 $Ref)) (!
  (=> (Set_in r@181@01 lists@3@01) (= (inv@182@01 r@181@01) r@181@01))
  :pattern ((Set_in r@181@01 lists@3@01))
  :pattern ((inv@182@01 r@181@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@182@01 r) lists@3@01) (= (inv@182@01 r) r))
  :pattern ((inv@182@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@183@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@182@01 r) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@183@01 r))
    $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@182@01 r) lists@3@01)
    (= (- $Perm.Write (pTaken@183@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@184@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@184@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@184@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef72|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@185@01 $Ref)
(declare-const r2@186@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 53 | r1@185@01 in lists@3@01 | live]
; [else-branch: 53 | !(r1@185@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 53 | r1@185@01 in lists@3@01]
(assert (Set_in r1@185@01 lists@3@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 54 | r2@186@01 in lists@3@01 | live]
; [else-branch: 54 | !(r2@186@01 in lists@3@01) | live]
(push) ; 12
; [then-branch: 54 | r2@186@01 in lists@3@01]
(assert (Set_in r2@186@01 lists@3@01))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 54 | !(r2@186@01 in lists@3@01)]
(assert (not (Set_in r2@186@01 lists@3@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@186@01 lists@3@01)) (Set_in r2@186@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 53 | !(r1@185@01 in lists@3@01)]
(assert (not (Set_in r1@185@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r1@185@01 lists@3@01)
  (and
    (Set_in r1@185@01 lists@3@01)
    (or (not (Set_in r2@186@01 lists@3@01)) (Set_in r2@186@01 lists@3@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@185@01 lists@3@01)) (Set_in r1@185@01 lists@3@01)))
(push) ; 9
; [then-branch: 55 | r1@185@01 != r2@186@01 && r2@186@01 in lists@3@01 && r1@185@01 in lists@3@01 | live]
; [else-branch: 55 | !(r1@185@01 != r2@186@01 && r2@186@01 in lists@3@01 && r1@185@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 55 | r1@185@01 != r2@186@01 && r2@186@01 in lists@3@01 && r1@185@01 in lists@3@01]
(assert (and
  (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
  (Set_in r1@185@01 lists@3@01)))
; [eval] r1.next != r2.next
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r1@185@01) s@18@01))
  (Set_in (inv@24@01 r1@185@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r2@186@01) s@18@01))
  (Set_in (inv@24@01 r2@186@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 55 | !(r1@185@01 != r2@186@01 && r2@186@01 in lists@3@01 && r1@185@01 in lists@3@01)]
(assert (not
  (and
    (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
    (Set_in r1@185@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
    (Set_in r1@185@01 lists@3@01))
  (and
    (not (= r1@185@01 r2@186@01))
    (Set_in r2@186@01 lists@3@01)
    (Set_in r1@185@01 lists@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
      (Set_in r1@185@01 lists@3@01)))
  (and
    (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
    (Set_in r1@185@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@185@01 $Ref) (r2@186@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@185@01 lists@3@01)
      (and
        (Set_in r1@185@01 lists@3@01)
        (or (not (Set_in r2@186@01 lists@3@01)) (Set_in r2@186@01 lists@3@01))))
    (or (not (Set_in r1@185@01 lists@3@01)) (Set_in r1@185@01 lists@3@01))
    (=>
      (and
        (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
        (Set_in r1@185@01 lists@3@01))
      (and
        (not (= r1@185@01 r2@186@01))
        (Set_in r2@186@01 lists@3@01)
        (Set_in r1@185@01 lists@3@01)))
    (or
      (not
        (and
          (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
          (Set_in r1@185@01 lists@3@01)))
      (and
        (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
        (Set_in r1@185@01 lists@3@01))))
  :pattern ((Set_in r1@185@01 lists@3@01) (Set_in r2@186@01 lists@3@01))
  :qid |prog.l55-aux|)))
(push) ; 8
(assert (not (forall ((r1@185@01 $Ref) (r2@186@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
      (Set_in r1@185@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r1@185@01)
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r2@186@01))))
  :pattern ((Set_in r1@185@01 lists@3@01) (Set_in r2@186@01 lists@3@01))
  :qid |prog.l55|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r1@185@01 $Ref) (r2@186@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@185@01 r2@186@01)) (Set_in r2@186@01 lists@3@01))
      (Set_in r1@185@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r1@185@01)
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r2@186@01))))
  :pattern ((Set_in r1@185@01 lists@3@01) (Set_in r2@186@01 lists@3@01))
  :qid |prog.l55|)))
(declare-const r@187@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@187@01 lists@3@01))
(push) ; 9
(assert (not (and
  (not (Set_in (inv@24@01 r@187@01) s@18@01))
  (Set_in (inv@24@01 r@187@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@188@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@187@01 $Ref) (r2@187@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@187@01 lists@3@01)
      (Set_in r2@187@01 lists@3@01)
      (=
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r1@187@01)
        ($FVF.lookup_next (as sm@184@01  $FVF<next>) r2@187@01)))
    (= r1@187@01 r2@187@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@187@01 $Ref)) (!
  (=>
    (Set_in r@187@01 lists@3@01)
    (=
      (inv@188@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@187@01) (-
        length@4@01
        1))
      r@187@01))
  :pattern (($FVF.lookup_next (as sm@184@01  $FVF<next>) r@187@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@188@01 r i) lists@3@01)
    (and
      (= ($FVF.lookup_next (as sm@184@01  $FVF<next>) (inv@188@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@188@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@189@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@188@01 r i) lists@3@01)
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@190@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@188@01 r i) lists@3@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@167@01 r i))
      (- $Perm.Write (pTaken@189@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (pTaken@189@01 r i))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@188@01 r i) lists@3@01)
    (= (- $Perm.Write (pTaken@189@01 r i)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@167@01 r i))
      (pTaken@190@01 r i))
    $Perm.No)
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@188@01 r i) lists@3@01)
    (= (- (- $Perm.Write (pTaken@189@01 r i)) (pTaken@190@01 r i)) $Perm.No))
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@191@01 $PSF<list>)
(declare-const s@192@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@192@01 $Snap)) (!
  (=>
    (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) s@18@01)
    (and
      (not (= s@192@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@191@01  $PSF<list>) s@192@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@192@01))))
  :pattern (($PSF.lookup_list (as sm@191@01  $PSF<list>) s@192@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@192@01))
  :qid |qp.psmValDef73|)))
(assert (forall ((s@192@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@127@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01))) sNext@19@01)
          $Perm.Write
          $Perm.No)
        (pTaken@167@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@192@01)) ($SortWrappers.$SnapToInt ($Snap.second s@192@01)))))
    (and
      (not (= s@192@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@191@01  $PSF<list>) s@192@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@192@01))))
  :pattern (($PSF.lookup_list (as sm@191@01  $PSF<list>) s@192@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@192@01))
  :qid |qp.psmValDef74|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@193@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 56 | r@193@01 in lists@3@01 | live]
; [else-branch: 56 | !(r@193@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 56 | r@193@01 in lists@3@01]
(assert (Set_in r@193@01 lists@3@01))
; [eval] allSet(r.next, length - 1, v)
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r@193@01) s@18@01))
  (Set_in (inv@24@01 r@193@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@194@01 ((r $Ref) (i Int) (r@193@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@195@01 ((r $Ref) (i Int) (r@193@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@194@01 r i r@193@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@194@01 r i r@193@01))
    $Perm.No)
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@194@01 r i r@193@01)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@196@01 $PSF<list>)
(declare-const s@197@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@196@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@127@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
    length@4@01
    1)) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (Set_in (inv@22@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
    length@4@01
    1)) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@196@01  $PSF<list>)))
  (=>
    (Set_in (inv@127@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1)) sNext@19@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (Set_in (inv@22@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1)) s@18@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 56 | !(r@193@01 in lists@3@01)]
(assert (not (Set_in r@193@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r@193@01 lists@3@01)
  (and
    (Set_in r@193@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@196@01  $PSF<list>)))
    (=>
      (Set_in (inv@127@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
        length@4@01
        1)) sNext@19@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (Set_in (inv@22@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
        length@4@01
        1)) s@18@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@193@01 lists@3@01)) (Set_in r@193@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@193@01 $Ref)) (!
  (and
    (=>
      (Set_in r@193@01 lists@3@01)
      (and
        (Set_in r@193@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@196@01  $PSF<list>)))
        (=>
          (Set_in (inv@127@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
            length@4@01
            1)) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (Set_in (inv@22@01 ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
            length@4@01
            1)) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@193@01 lists@3@01)) (Set_in r@193@01 lists@3@01)))
  :pattern ((Set_in r@193@01 lists@3@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@193@01 $Ref)) (!
  (=>
    (Set_in r@193@01 lists@3@01)
    (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@193@01 lists@3@01))
  :qid |prog.l57_precondition|)))
(push) ; 8
(assert (not (forall ((r@193@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@193@01 lists@3@01)
        (allSet%precondition ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@193@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@193@01 lists@3@01))
  :qid |prog.l57|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@193@01 $Ref)) (!
  (=>
    (Set_in r@193@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@196@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@184@01  $FVF<next>) r@193@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@193@01 lists@3@01))
  :qid |prog.l57|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@157@01 r i) s@133@01)
    (and
      (= ($FVF.lookup_next (as sm@155@01  $FVF<next>) (inv@157@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@157@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@159@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@160@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r@154@01 $Ref)) (!
  (=>
    (Set_in r@154@01 s@133@01)
    (=
      (inv@157@01 ($FVF.lookup_next (as sm@155@01  $FVF<next>) r@154@01) (-
        length@4@01
        1))
      r@154@01))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r@154@01))
  :qid |quant-u-80|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
  $Snap.unit))
(assert (forall ((r@158@01 $Ref)) (!
  (and
    (=>
      (Set_in r@158@01 s@133@01)
      (and
        (Set_in r@158@01 s@133@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>)))
        (=>
          (Set_in (inv@157@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
            length@4@01
            1)) s@133@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
                length@4@01
                1)) s@133@01))
            (Set_in (inv@136@01 ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@158@01 s@133@01)) (Set_in r@158@01 s@133@01)))
  :pattern ((Set_in r@158@01 s@133@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@158@01 $Ref)) (!
  (=>
    (Set_in r@158@01 s@133@01)
    (allSet ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@159@01  $FVF<next>) r@158@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@158@01 s@133@01))
  :qid |prog.l57|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@147@01 r) s@133@01) (= (inv@147@01 r) r))
  :pattern ((inv@147@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@151@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@151@01  $FPM) r))
  :qid |qp.resPrmSumDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@152@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@152@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@153@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@153@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@156@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef60|)))
(assert (forall ((r@146@01 $Ref)) (!
  (=> (Set_in r@146@01 s@133@01) (= (inv@147@01 r@146@01) r@146@01))
  :pattern ((Set_in r@146@01 s@133@01))
  :pattern ((inv@147@01 r@146@01))
  :qid |quant-u-78|)))
(assert (forall ((r@146@01 $Ref)) (!
  (=> (Set_in r@146@01 s@133@01) (not (= r@146@01 $Ref.null)))
  :pattern ((Set_in r@146@01 s@133@01))
  :pattern ((inv@147@01 r@146@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
  $Snap.unit))
(assert (forall ((r1@148@01 $Ref) (r2@149@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@148@01 s@133@01)
      (and
        (Set_in r1@148@01 s@133@01)
        (or (not (Set_in r2@149@01 s@133@01)) (Set_in r2@149@01 s@133@01))))
    (or (not (Set_in r1@148@01 s@133@01)) (Set_in r1@148@01 s@133@01))
    (=>
      (and
        (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
        (Set_in r1@148@01 s@133@01))
      (and
        (not (= r1@148@01 r2@149@01))
        (Set_in r2@149@01 s@133@01)
        (Set_in r1@148@01 s@133@01)))
    (or
      (not
        (and
          (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
          (Set_in r1@148@01 s@133@01)))
      (and
        (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
        (Set_in r1@148@01 s@133@01))))
  :pattern ((Set_in r1@148@01 s@133@01) (Set_in r2@149@01 s@133@01))
  :qid |prog.l55-aux|)))
(assert (forall ((r1@148@01 $Ref) (r2@149@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@148@01 r2@149@01)) (Set_in r2@149@01 s@133@01))
      (Set_in r1@148@01 s@133@01))
    (not
      (=
        ($FVF.lookup_next (as sm@150@01  $FVF<next>) r1@148@01)
        ($FVF.lookup_next (as sm@152@01  $FVF<next>) r2@149@01))))
  :pattern ((Set_in r1@148@01 s@133@01) (Set_in r2@149@01 s@133@01))
  :qid |prog.l55|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@142@01 r) s@133@01) (= (inv@142@01 r) r))
  :pattern ((inv@142@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@142@01 r) s@133@01)
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@145@01  $FPM) r)
    (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@145@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r@141@01 $Ref)) (!
  (=> (Set_in r@141@01 s@133@01) (= (inv@142@01 r@141@01) r@141@01))
  :pattern ((Set_in r@141@01 s@133@01))
  :pattern ((inv@142@01 r@141@01))
  :qid |quant-u-76|)))
(assert (forall ((r@141@01 $Ref)) (!
  (=> (Set_in r@141@01 s@133@01) (not (= r@141@01 $Ref.null)))
  :pattern ((Set_in r@141@01 s@133@01))
  :pattern ((inv@142@01 r@141@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@134@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  $Snap.unit))
(assert (forall ((r@143@01 $Ref)) (!
  (or (not (Set_in r@143@01 s@133@01)) (Set_in r@143@01 s@133@01))
  :pattern ((Set_in r@143@01 s@133@01))
  :qid |prog.l54-aux|)))
(assert (forall ((r@143@01 $Ref)) (!
  (=>
    (Set_in r@143@01 s@133@01)
    (= ($FVF.lookup_val (as sm@144@01  $FVF<val>) r@143@01) v@5@01))
  :pattern ((Set_in r@143@01 s@133@01))
  :qid |prog.l54|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@136@01 r i) s@133@01))
      (Set_in (inv@136@01 r i) lists@3@01))
    (and (= (inv@136@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@136@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (not (Set_in r@135@01 s@133@01)) (Set_in r@135@01 lists@3@01))
    (= (inv@136@01 r@135@01 length@4@01) r@135@01))
  :pattern ((Set_in r@135@01 s@133@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((inv@136@01 r@135@01 length@4@01))
  :qid |quant-u-71|)))
(assert (=
  ($Snap.second $t@134@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@134@01))
    ($Snap.second ($Snap.second $t@134@01)))))
(assert (= ($Snap.first ($Snap.second $t@134@01)) $Snap.unit))
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((Set_in r@137@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((Set_in r@137@01 s@133@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (and
    (or (not (Set_in r@137@01 lists@3@01)) (Set_in r@137@01 lists@3@01))
    (=>
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
      (and
        (not (Set_in r@137@01 s@133@01))
        (Set_in r@137@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@139@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@136@01 r@137@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@137@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@137@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@137@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@137@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01)))
      (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@137@01 $Ref)) (!
  (=>
    (and (not (Set_in r@137@01 s@133@01)) (Set_in r@137@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@137@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :pattern ((Set_in r@137@01 lists@3@01))
  :pattern ((Set_in r@137@01 s@133@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@139@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@137@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@137@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(assert (=
  ($Snap.second ($Snap.second $t@134@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@134@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@134@01))))))
(assert (= $t@134@01 ($Snap.combine ($Snap.first $t@134@01) ($Snap.second $t@134@01))))
(assert (forall ((r@135@01 $Ref)) (!
  (=>
    (and (not (Set_in r@135@01 s@133@01)) (Set_in r@135@01 lists@3@01))
    (or (not (Set_in r@135@01 lists@3@01)) (Set_in r@135@01 lists@3@01)))
  :pattern ((Set_in r@135@01 s@133@01))
  :pattern ((Set_in r@135@01 lists@3@01))
  :pattern ((inv@136@01 r@135@01 length@4@01))
  :qid |list-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@133@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@133@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 57 | |s@133@01| > 0 | live]
; [else-branch: 57 | !(|s@133@01| > 0) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 57 | |s@133@01| > 0]
(assert (> (Set_card s@133@01) 0))
; [exec]
; var l2: Ref
(declare-const l2@198@01 $Ref)
; [exec]
; inhale (l2 in s)
(declare-const $t@199@01 $Snap)
(assert (= $t@199@01 $Snap.unit))
; [eval] (l2 in s)
(assert (Set_in l2@198@01 s@133@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(list(l2, length), write)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 58 | length@4@01 > 0 | live]
; [else-branch: 58 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 58 | length@4@01 > 0]
; Precomputing data for removing quantified permissions
(define-fun pTaken@200@01 ((r $Ref)) $Perm
  (ite
    (= r l2@198@01)
    ($Perm.min
      (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@200@01 r))
    $Perm.No)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@198@01) (= (- $Perm.Write (pTaken@200@01 r)) $Perm.No))
  
  :qid |quant-u-110|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@201@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in l2@198@01 ($FVF.domain_val (as sm@201@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@142@01 l2@198@01) s@133@01)
  (=
    ($FVF.lookup_val (as sm@201@01  $FVF<val>) l2@198@01)
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) l2@198@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@202@01 ((r $Ref)) $Perm
  (ite
    (= r l2@198@01)
    ($Perm.min
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r))
    $Perm.No)
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@198@01) (= (- $Perm.Write (pTaken@202@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@203@01 $FVF<next>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in l2@198@01 ($FVF.domain_next (as sm@203@01  $FVF<next>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@147@01 l2@198@01) s@133@01)
  (=
    ($FVF.lookup_next (as sm@203@01  $FVF<next>) l2@198@01)
    ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) l2@198@01))))
(declare-const sm@204@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@147@01 r) s@133@01)
    (=
      ($FVF.lookup_next (as sm@204@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@204@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef82|)))
(declare-const pm@205@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@205@01  $FPM) r)
    (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@205@01  $FPM) r))
  :qid |qp.resPrmSumDef83|)))
(set-option :timeout 0)
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@205@01  $FPM) l2@198@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] i - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@206@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@207@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@206@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      (pTaken@206@01 r i))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@206@01 r i)) $Perm.No))
  
  :qid |quant-u-116|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@163@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@157@01 ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01) (-
    length@4@01
    1)) s@133@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@136@01 ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01) (-
        length@4@01
        1)) s@133@01))
    (Set_in (inv@136@01 ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@201@01  $FVF<val>) l2@198@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@203@01  $FVF<next>) l2@198@01))
    ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))))) l2@198@01 length@4@01))
(declare-const sm@208@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l2@198@01)
    ($SortWrappers.IntTo$Snap length@4@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@201@01  $FVF<val>) l2@198@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@203@01  $FVF<next>) l2@198@01))
      ($PSF.lookup_list (as sm@163@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@204@01  $FVF<next>) l2@198@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
; [exec]
; s := (s setminus Set(l2))
; [eval] (s setminus Set(l2))
; [eval] Set(l2)
(declare-const s@209@01 Set<$Ref>)
(assert (Set_equal s@209@01 (Set_difference s@133@01 (Set_singleton l2@198@01))))
; Loop head block: Re-establish invariant
(declare-const r@210@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 59 | r@210@01 in lists@3@01 | live]
; [else-branch: 59 | !(r@210@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 59 | r@210@01 in lists@3@01]
(assert (Set_in r@210@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(push) ; 13
; [else-branch: 59 | !(r@210@01 in lists@3@01)]
(assert (not (Set_in r@210@01 lists@3@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@210@01 lists@3@01)) (Set_in r@210@01 lists@3@01)))
(assert (and (not (Set_in r@210@01 s@209@01)) (Set_in r@210@01 lists@3@01)))
(pop) ; 11
(declare-fun inv@211@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@210@01 $Ref)) (!
  (=>
    (and (not (Set_in r@210@01 s@209@01)) (Set_in r@210@01 lists@3@01))
    (or (not (Set_in r@210@01 lists@3@01)) (Set_in r@210@01 lists@3@01)))
  :pattern ((Set_in r@210@01 s@209@01))
  :pattern ((Set_in r@210@01 lists@3@01))
  :pattern ((inv@211@01 r@210@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@210@01 $Ref) (r2@210@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@210@01 s@209@01)) (Set_in r1@210@01 lists@3@01))
      (and (not (Set_in r2@210@01 s@209@01)) (Set_in r2@210@01 lists@3@01))
      (= r1@210@01 r2@210@01))
    (= r1@210@01 r2@210@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@210@01 $Ref)) (!
  (=>
    (and (not (Set_in r@210@01 s@209@01)) (Set_in r@210@01 lists@3@01))
    (= (inv@211@01 r@210@01 length@4@01) r@210@01))
  :pattern ((Set_in r@210@01 s@209@01))
  :pattern ((Set_in r@210@01 lists@3@01))
  :pattern ((inv@211@01 r@210@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    (and (= (inv@211@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@211@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@212@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    ($Perm.min
      (ite (and (= r l2@198@01) (= i length@4@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@213@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@212@01 r i)))
    $Perm.No))
(define-fun pTaken@214@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    ($Perm.min
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (- (- $Perm.Write (pTaken@212@01 r i)) (pTaken@213@01 r i)))
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
(assert (not (=
  (-
    (ite
      (and (= l2@198@01 l2@198@01) (= length@4@01 length@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@212@01 l2@198@01 length@4@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    (= (- $Perm.Write (pTaken@212@01 r i)) $Perm.No))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@213@01 r i))
    $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@211@01 r i) s@209@01))
      (Set_in (inv@211@01 r i) lists@3@01))
    (= (- (- $Perm.Write (pTaken@212@01 r i)) (pTaken@213@01 r i)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@215@01 $PSF<list>)
(declare-const s@216@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@216@01 $Snap)) (!
  (and
    (=>
      (Set_in s@216@01 ($PSF.domain_list (as sm@215@01  $PSF<list>)))
      (and
        (not
          (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@209@01))
        (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01)))
    (=>
      (and
        (not
          (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@209@01))
        (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01))
      (Set_in s@216@01 ($PSF.domain_list (as sm@215@01  $PSF<list>)))))
  :pattern ((Set_in s@216@01 ($PSF.domain_list (as sm@215@01  $PSF<list>))))
  :qid |qp.psmDomDef87|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@216@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@209@01))
        (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) l2@198@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@216@01)) length@4@01)))
    (and
      (not (= s@216@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01)
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) s@216@01))))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01))
  :pattern (($PSF.lookup_list (as sm@208@01  $PSF<list>) s@216@01))
  :qid |qp.psmValDef84|)))
(assert (forall ((s@216@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@209@01))
        (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01))
      (and
        (not
          (Set_in (inv@136@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@133@01))
        (Set_in (inv@136@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01)))
    (and
      (not (= s@216@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) s@216@01))))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) s@216@01))
  :qid |qp.psmValDef85|)))
(assert (forall ((s@216@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@209@01))
        (Set_in (inv@211@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) lists@3@01))
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))) s@133@01)
            $Perm.Write
            $Perm.No)
          (pTaken@206@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@216@01)) ($SortWrappers.$SnapToInt ($Snap.second s@216@01))))))
    (and
      (not (= s@216@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@216@01))))
  :pattern (($PSF.lookup_list (as sm@215@01  $PSF<list>) s@216@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@216@01))
  :qid |qp.psmValDef86|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@217@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 60 | r@217@01 in lists@3@01 | live]
; [else-branch: 60 | !(r@217@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 60 | r@217@01 in lists@3@01]
(assert (Set_in r@217@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(push) ; 13
; [else-branch: 60 | !(r@217@01 in lists@3@01)]
(assert (not (Set_in r@217@01 lists@3@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@217@01 lists@3@01)) (Set_in r@217@01 lists@3@01)))
(push) ; 12
; [then-branch: 61 | !(r@217@01 in s@209@01) && r@217@01 in lists@3@01 | live]
; [else-branch: 61 | !(!(r@217@01 in s@209@01) && r@217@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 61 | !(r@217@01 in s@209@01) && r@217@01 in lists@3@01]
(assert (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= l2@198@01 r@217@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@218@01 ((r $Ref) (i Int) (r@217@01 $Ref)) $Perm
  (ite
    (and (= r r@217@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref) (i Int) (r@217@01 $Ref)) $Perm
  (ite
    (and (= r r@217@01) (= i length@4@01))
    ($Perm.min
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (- $Perm.Write (pTaken@218@01 r i r@217@01)))
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref) (i Int) (r@217@01 $Ref)) $Perm
  (ite
    (and (= r r@217@01) (= i length@4@01))
    ($Perm.min
      (ite (and (= r l2@198@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@218@01 r i r@217@01))
        (pTaken@219@01 r i r@217@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@218@01 r i r@217@01))
    $Perm.No)
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 15
; 0.02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@217@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@218@01 r i r@217@01)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (pTaken@219@01 r i r@217@01))
    $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@217@01) (= i length@4@01))
    (=
      (-
        (- $Perm.Write (pTaken@218@01 r i r@217@01))
        (pTaken@219@01 r i r@217@01))
      $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 15
; 0.02s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and (= l2@198@01 l2@198@01) (= length@4@01 length@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@220@01 l2@198@01 length@4@01 r@217@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@217@01) (= i length@4@01))
    (=
      (-
        (-
          (- $Perm.Write (pTaken@218@01 r i r@217@01))
          (pTaken@219@01 r i r@217@01))
        (pTaken@220@01 r i r@217@01))
      $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@221@01 $PSF<list>)
(declare-const s@222@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@217@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
    (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
        $Perm.Write
        $Perm.No)
      (pTaken@206@01 r@217@01 length@4@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@217@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@217@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>)))
  (=>
    (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
      (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
          $Perm.Write
          $Perm.No)
        (pTaken@206@01 r@217@01 length@4@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 61 | !(!(r@217@01 in s@209@01) && r@217@01 in lists@3@01)]
(assert (not (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
  (and
    (not (Set_in r@217@01 s@209@01))
    (Set_in r@217@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@217@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>)))
    (=>
      (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@217@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
        (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@217@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
            $Perm.Write
            $Perm.No)
          (pTaken@206@01 r@217@01 length@4@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@217@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@217@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@217@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
  (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@217@01 $Ref)) (!
  (and
    (or (not (Set_in r@217@01 lists@3@01)) (Set_in r@217@01 lists@3@01))
    (=>
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
      (and
        (not (Set_in r@217@01 s@209@01))
        (Set_in r@217@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>)))
        (=>
          (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
                $Perm.Write
                $Perm.No)
              (pTaken@206@01 r@217@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))))
  :pattern ((Set_in r@217@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@217@01 $Ref)) (!
  (and
    (or (not (Set_in r@217@01 lists@3@01)) (Set_in r@217@01 lists@3@01))
    (=>
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
      (and
        (not (Set_in r@217@01 s@209@01))
        (Set_in r@217@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>)))
        (=>
          (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
                $Perm.Write
                $Perm.No)
              (pTaken@206@01 r@217@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))))
  :pattern ((Set_in r@217@01 s@209@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@217@01 $Ref)) (!
  (and
    (or (not (Set_in r@217@01 lists@3@01)) (Set_in r@217@01 lists@3@01))
    (=>
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
      (and
        (not (Set_in r@217@01 s@209@01))
        (Set_in r@217@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@221@01  $PSF<list>)))
        (=>
          (and (= r@217@01 l2@198@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@136@01 r@217@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@217@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@157@01 r@217@01 length@4@01) s@133@01)
                $Perm.Write
                $Perm.No)
              (pTaken@206@01 r@217@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@217@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@217@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@217@01 $Ref)) (!
  (=>
    (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
    (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@217@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :pattern ((Set_in r@217@01 lists@3@01))
  :pattern ((Set_in r@217@01 s@209@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :qid |prog.l53_precondition|)))
(push) ; 11
(assert (not (forall ((r@217@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
        (allSet%precondition ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@217@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
      (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01)))
    (allSet ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@217@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :pattern ((Set_in r@217@01 lists@3@01))
  :pattern ((Set_in r@217@01 s@209@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :qid |prog.l53|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@217@01 $Ref)) (!
  (=>
    (and (not (Set_in r@217@01 s@209@01)) (Set_in r@217@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@217@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :pattern ((Set_in r@217@01 lists@3@01))
  :pattern ((Set_in r@217@01 s@209@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@221@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@217@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@217@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(declare-const r@223@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@223@01 s@209@01))
(pop) ; 11
(declare-fun inv@224@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@223@01 $Ref) (r2@223@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@223@01 s@209@01)
      (Set_in r2@223@01 s@209@01)
      (= r1@223@01 r2@223@01))
    (= r1@223@01 r2@223@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@223@01 $Ref)) (!
  (=> (Set_in r@223@01 s@209@01) (= (inv@224@01 r@223@01) r@223@01))
  :pattern ((Set_in r@223@01 s@209@01))
  :pattern ((inv@224@01 r@223@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@224@01 r) s@209@01) (= (inv@224@01 r) r))
  :pattern ((inv@224@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@225@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@224@01 r) s@209@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@200@01 r))
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@200@01 r))
      (pTaken@225@01 r))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@224@01 r) s@209@01)
    (= (- $Perm.Write (pTaken@225@01 r)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@226@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@226@01  $FVF<val>)))
      (Set_in (inv@224@01 r) s@209@01))
    (=>
      (Set_in (inv@224@01 r) s@209@01)
      (Set_in r ($FVF.domain_val (as sm@226@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@226@01  $FVF<val>))))
  :qid |qp.fvfDomDef93|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@224@01 r) s@209@01)
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
          (pTaken@200@01 r))))
    (=
      ($FVF.lookup_val (as sm@226@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@226@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef92|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@227@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 12
; [then-branch: 62 | r@227@01 in s@209@01 | live]
; [else-branch: 62 | !(r@227@01 in s@209@01) | live]
(push) ; 13
; [then-branch: 62 | r@227@01 in s@209@01]
(assert (Set_in r@227@01 s@209@01))
; [eval] r.val == v
(declare-const sm@228@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@200@01 r)))
    (=
      ($FVF.lookup_val (as sm@228@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@228@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef94|)))
(declare-const pm@229@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@229@01  $FPM) r)
    (-
      (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@200@01 r)))
  :pattern (($FVF.perm_val (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef95|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_val (as pm@229@01  $FPM) r@227@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 62 | !(r@227@01 in s@209@01)]
(assert (not (Set_in r@227@01 s@209@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@200@01 r)))
    (=
      ($FVF.lookup_val (as sm@228@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@228@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@229@01  $FPM) r)
    (-
      (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@200@01 r)))
  :pattern (($FVF.perm_val (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef95|)))
; Joined path conditions
(assert (or (not (Set_in r@227@01 s@209@01)) (Set_in r@227@01 s@209@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@200@01 r)))
    (=
      ($FVF.lookup_val (as sm@228@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@228@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@134@01)))) r))
  :qid |qp.fvfValDef94|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@229@01  $FPM) r)
    (-
      (ite (Set_in (inv@142@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@200@01 r)))
  :pattern (($FVF.perm_val (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef95|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@227@01 $Ref)) (!
  (or (not (Set_in r@227@01 s@209@01)) (Set_in r@227@01 s@209@01))
  :pattern ((Set_in r@227@01 s@209@01))
  :qid |prog.l54-aux|)))
(push) ; 11
(assert (not (forall ((r@227@01 $Ref)) (!
  (=>
    (Set_in r@227@01 s@209@01)
    (= ($FVF.lookup_val (as sm@228@01  $FVF<val>) r@227@01) v@5@01))
  :pattern ((Set_in r@227@01 s@209@01))
  :qid |prog.l54|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@227@01 $Ref)) (!
  (=>
    (Set_in r@227@01 s@209@01)
    (= ($FVF.lookup_val (as sm@228@01  $FVF<val>) r@227@01) v@5@01))
  :pattern ((Set_in r@227@01 s@209@01))
  :qid |prog.l54|)))
(declare-const r@230@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@230@01 s@209@01))
(pop) ; 11
(declare-fun inv@231@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@230@01 $Ref) (r2@230@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@230@01 s@209@01)
      (Set_in r2@230@01 s@209@01)
      (= r1@230@01 r2@230@01))
    (= r1@230@01 r2@230@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@230@01 $Ref)) (!
  (=> (Set_in r@230@01 s@209@01) (= (inv@231@01 r@230@01) r@230@01))
  :pattern ((Set_in r@230@01 s@209@01))
  :pattern ((inv@231@01 r@230@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@231@01 r) s@209@01) (= (inv@231@01 r) r))
  :pattern ((inv@231@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@232@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@231@01 r) s@209@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r))
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r))
      (pTaken@232@01 r))
    $Perm.No)
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@231@01 r) s@209@01)
    (= (- $Perm.Write (pTaken@232@01 r)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@233@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@233@01  $FVF<next>)))
      (Set_in (inv@231@01 r) s@209@01))
    (=>
      (Set_in (inv@231@01 r) s@209@01)
      (Set_in r ($FVF.domain_next (as sm@233@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@233@01  $FVF<next>))))
  :qid |qp.fvfDomDef97|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@231@01 r) s@209@01)
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
          (pTaken@202@01 r))))
    (=
      ($FVF.lookup_next (as sm@233@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@233@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef96|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@234@01 $Ref)
(declare-const r2@235@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 12
; [then-branch: 63 | r1@234@01 in s@209@01 | live]
; [else-branch: 63 | !(r1@234@01 in s@209@01) | live]
(push) ; 13
; [then-branch: 63 | r1@234@01 in s@209@01]
(assert (Set_in r1@234@01 s@209@01))
; [eval] (r2 in s)
(push) ; 14
; [then-branch: 64 | r2@235@01 in s@209@01 | live]
; [else-branch: 64 | !(r2@235@01 in s@209@01) | live]
(push) ; 15
; [then-branch: 64 | r2@235@01 in s@209@01]
(assert (Set_in r2@235@01 s@209@01))
; [eval] r1 != r2
(pop) ; 15
(push) ; 15
; [else-branch: 64 | !(r2@235@01 in s@209@01)]
(assert (not (Set_in r2@235@01 s@209@01)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@235@01 s@209@01)) (Set_in r2@235@01 s@209@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 63 | !(r1@234@01 in s@209@01)]
(assert (not (Set_in r1@234@01 s@209@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (Set_in r1@234@01 s@209@01)
  (and
    (Set_in r1@234@01 s@209@01)
    (or (not (Set_in r2@235@01 s@209@01)) (Set_in r2@235@01 s@209@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@234@01 s@209@01)) (Set_in r1@234@01 s@209@01)))
(push) ; 12
; [then-branch: 65 | r1@234@01 != r2@235@01 && r2@235@01 in s@209@01 && r1@234@01 in s@209@01 | live]
; [else-branch: 65 | !(r1@234@01 != r2@235@01 && r2@235@01 in s@209@01 && r1@234@01 in s@209@01) | live]
(push) ; 13
; [then-branch: 65 | r1@234@01 != r2@235@01 && r2@235@01 in s@209@01 && r1@234@01 in s@209@01]
(assert (and
  (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
  (Set_in r1@234@01 s@209@01)))
; [eval] r1.next != r2.next
(declare-const sm@236@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@236@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@236@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef98|)))
(declare-const pm@237@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@237@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@237@01  $FPM) r))
  :qid |qp.resPrmSumDef99|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@237@01  $FPM) r1@234@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(declare-const sm@238@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@238@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@238@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef100|)))
(declare-const pm@239@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@239@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@239@01  $FPM) r))
  :qid |qp.resPrmSumDef101|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@239@01  $FPM) r2@235@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 65 | !(r1@234@01 != r2@235@01 && r2@235@01 in s@209@01 && r1@234@01 in s@209@01)]
(assert (not
  (and
    (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
    (Set_in r1@234@01 s@209@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@236@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@236@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@237@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@237@01  $FPM) r))
  :qid |qp.resPrmSumDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@238@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@238@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@239@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@239@01  $FPM) r))
  :qid |qp.resPrmSumDef101|)))
(assert (=>
  (and
    (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
    (Set_in r1@234@01 s@209@01))
  (and
    (not (= r1@234@01 r2@235@01))
    (Set_in r2@235@01 s@209@01)
    (Set_in r1@234@01 s@209@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
      (Set_in r1@234@01 s@209@01)))
  (and
    (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
    (Set_in r1@234@01 s@209@01))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@236@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@236@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@237@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@237@01  $FPM) r))
  :qid |qp.resPrmSumDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@238@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@238@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef100|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@239@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@239@01  $FPM) r))
  :qid |qp.resPrmSumDef101|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@234@01 $Ref) (r2@235@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@234@01 s@209@01)
      (and
        (Set_in r1@234@01 s@209@01)
        (or (not (Set_in r2@235@01 s@209@01)) (Set_in r2@235@01 s@209@01))))
    (or (not (Set_in r1@234@01 s@209@01)) (Set_in r1@234@01 s@209@01))
    (=>
      (and
        (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
        (Set_in r1@234@01 s@209@01))
      (and
        (not (= r1@234@01 r2@235@01))
        (Set_in r2@235@01 s@209@01)
        (Set_in r1@234@01 s@209@01)))
    (or
      (not
        (and
          (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
          (Set_in r1@234@01 s@209@01)))
      (and
        (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
        (Set_in r1@234@01 s@209@01))))
  :pattern ((Set_in r1@234@01 s@209@01) (Set_in r2@235@01 s@209@01))
  :qid |prog.l55-aux|)))
(push) ; 11
(assert (not (forall ((r1@234@01 $Ref) (r2@235@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
      (Set_in r1@234@01 s@209@01))
    (not
      (=
        ($FVF.lookup_next (as sm@236@01  $FVF<next>) r1@234@01)
        ($FVF.lookup_next (as sm@238@01  $FVF<next>) r2@235@01))))
  :pattern ((Set_in r1@234@01 s@209@01) (Set_in r2@235@01 s@209@01))
  :qid |prog.l55|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (forall ((r1@234@01 $Ref) (r2@235@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@234@01 r2@235@01)) (Set_in r2@235@01 s@209@01))
      (Set_in r1@234@01 s@209@01))
    (not
      (=
        ($FVF.lookup_next (as sm@236@01  $FVF<next>) r1@234@01)
        ($FVF.lookup_next (as sm@238@01  $FVF<next>) r2@235@01))))
  :pattern ((Set_in r1@234@01 s@209@01) (Set_in r2@235@01 s@209@01))
  :qid |prog.l55|)))
(declare-const r@240@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@240@01 s@209@01))
(declare-const sm@241@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef102|)))
(declare-const pm@242@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@242@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@242@01  $FPM) r))
  :qid |qp.resPrmSumDef103|)))
(push) ; 12
(assert (not (< $Perm.No ($FVF.perm_next (as pm@242@01  $FPM) r@240@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 11
(declare-fun inv@243@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@241@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@242@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@242@01  $FPM) r))
  :qid |qp.resPrmSumDef103|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@240@01 $Ref) (r2@240@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@240@01 s@209@01)
      (Set_in r2@240@01 s@209@01)
      (=
        ($FVF.lookup_next (as sm@241@01  $FVF<next>) r1@240@01)
        ($FVF.lookup_next (as sm@241@01  $FVF<next>) r2@240@01)))
    (= r1@240@01 r2@240@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@240@01 $Ref)) (!
  (=>
    (Set_in r@240@01 s@209@01)
    (=
      (inv@243@01 ($FVF.lookup_next (as sm@241@01  $FVF<next>) r@240@01) (-
        length@4@01
        1))
      r@240@01))
  :pattern (($FVF.lookup_next (as sm@241@01  $FVF<next>) r@240@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@243@01 r i) s@209@01)
    (and
      (= ($FVF.lookup_next (as sm@241@01  $FVF<next>) (inv@243@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@243@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@244@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@243@01 r i) s@209@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@245@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@243@01 r i) s@209@01)
    ($Perm.min
      (-
        (ite (and (= r l2@198@01) (= i length@4@01)) $Perm.Write $Perm.No)
        (pTaken@212@01 r i))
      (- $Perm.Write (pTaken@244@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (pTaken@244@01 r i))
    $Perm.No)
  
  :qid |quant-u-140|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@243@01 r i) s@209@01)
    (= (- $Perm.Write (pTaken@244@01 r i)) $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@246@01 $PSF<list>)
(declare-const s@247@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@247@01 $Snap)) (!
  (and
    (=>
      (Set_in s@247@01 ($PSF.domain_list (as sm@246@01  $PSF<list>)))
      (Set_in (inv@243@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))) s@209@01))
    (=>
      (Set_in (inv@243@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))) s@209@01)
      (Set_in s@247@01 ($PSF.domain_list (as sm@246@01  $PSF<list>)))))
  :pattern ((Set_in s@247@01 ($PSF.domain_list (as sm@246@01  $PSF<list>))))
  :qid |qp.psmDomDef106|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@247@01 $Snap)) (!
  (=>
    (and
      (Set_in (inv@243@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))) s@209@01)
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))) s@133@01)
            $Perm.Write
            $Perm.No)
          (pTaken@206@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))))))
    (and
      (not (= s@247@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@246@01  $PSF<list>) s@247@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@247@01))))
  :pattern (($PSF.lookup_list (as sm@246@01  $PSF<list>) s@247@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@247@01))
  :qid |qp.psmValDef104|)))
(assert (forall ((s@247@01 $Snap)) (!
  (=>
    (and
      (Set_in (inv@243@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))) s@209@01)
      (<
        $Perm.No
        (-
          (ite
            (and
              (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) l2@198@01)
              (= ($SortWrappers.$SnapToInt ($Snap.second s@247@01)) length@4@01))
            $Perm.Write
            $Perm.No)
          (pTaken@212@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@247@01)) ($SortWrappers.$SnapToInt ($Snap.second s@247@01))))))
    (and
      (not (= s@247@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@246@01  $PSF<list>) s@247@01)
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) s@247@01))))
  :pattern (($PSF.lookup_list (as sm@246@01  $PSF<list>) s@247@01))
  :pattern (($PSF.lookup_list (as sm@208@01  $PSF<list>) s@247@01))
  :qid |qp.psmValDef105|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@248@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 12
; [then-branch: 66 | r@248@01 in s@209@01 | live]
; [else-branch: 66 | !(r@248@01 in s@209@01) | live]
(push) ; 13
; [then-branch: 66 | r@248@01 in s@209@01]
(assert (Set_in r@248@01 s@209@01))
; [eval] allSet(r.next, length - 1, v)
(declare-const sm@249@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef107|)))
(declare-const pm@250@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@250@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@250@01  $FPM) r))
  :qid |qp.resPrmSumDef108|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@250@01  $FPM) r@248@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= l2@198@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@251@01 ((r $Ref) (i Int) (r@248@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@252@01 ((r $Ref) (i Int) (r@248@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (- $Perm.Write (pTaken@251@01 r i r@248@01)))
    $Perm.No))
(define-fun pTaken@253@01 ((r $Ref) (i Int) (r@248@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (and (= r l2@198@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@251@01 r i r@248@01))
        (pTaken@252@01 r i r@248@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@251@01 r i r@248@01))
    $Perm.No)
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 15
; 0.13s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@251@01 r i r@248@01)) $Perm.No))
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 15
; 0.02s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
        (pTaken@206@01 r i))
      (pTaken@252@01 r i r@248@01))
    $Perm.No)
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 15
; 0.05s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@251@01 r i r@248@01))
        (pTaken@252@01 r i r@248@01))
      $Perm.No))
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@254@01 $PSF<list>)
(declare-const s@255@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@254@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (= ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) l2@198@01)
    (= (- length@4@01 1) length@4@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
        length@4@01
        1)) s@133@01))
    (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (Set_in (inv@157@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1)) s@133@01)
        $Perm.Write
        $Perm.No)
      (pTaken@206@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
        length@4@01
        1))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@254@01  $PSF<list>)))
  (=>
    (and
      (= ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) l2@198@01)
      (= (- length@4@01 1) length@4@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (not
        (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1)) s@133@01))
      (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
        length@4@01
        1)) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@157@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
            length@4@01
            1)) s@133@01)
          $Perm.Write
          $Perm.No)
        (pTaken@206@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 66 | !(r@248@01 in s@209@01)]
(assert (not (Set_in r@248@01 s@209@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@250@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@250@01  $FPM) r))
  :qid |qp.resPrmSumDef108|)))
(assert (=>
  (Set_in r@248@01 s@209@01)
  (and
    (Set_in r@248@01 s@209@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@254@01  $PSF<list>)))
    (=>
      (and
        (= ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) l2@198@01)
        (= (- length@4@01 1) length@4@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (not
          (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
            length@4@01
            1)) s@133@01))
        (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1)) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@157@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
              length@4@01
              1)) s@133@01)
            $Perm.Write
            $Perm.No)
          (pTaken@206@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
            length@4@01
            1))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@248@01 s@209@01)) (Set_in r@248@01 s@209@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
        (pTaken@202@01 r)))
    (=
      ($FVF.lookup_next (as sm@249@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@249@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@250@01  $FPM) r)
    (-
      (ite (Set_in (inv@147@01 r) s@133@01) $Perm.Write $Perm.No)
      (pTaken@202@01 r)))
  :pattern (($FVF.perm_next (as pm@250@01  $FPM) r))
  :qid |qp.resPrmSumDef108|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@248@01 $Ref)) (!
  (and
    (=>
      (Set_in r@248@01 s@209@01)
      (and
        (Set_in r@248@01 s@209@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@254@01  $PSF<list>)))
        (=>
          (and
            (= ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) l2@198@01)
            (= (- length@4@01 1) length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list (as sm@208@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
                length@4@01
                1)) s@133@01))
            (Set_in (inv@136@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@157@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
                  length@4@01
                  1)) s@133@01)
                $Perm.Write
                $Perm.No)
              (pTaken@206@01 ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
                length@4@01
                1))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@248@01 s@209@01)) (Set_in r@248@01 s@209@01)))
  :pattern ((Set_in r@248@01 s@209@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@248@01 $Ref)) (!
  (=>
    (Set_in r@248@01 s@209@01)
    (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@248@01 s@209@01))
  :qid |prog.l57_precondition|)))
(push) ; 11
(assert (not (forall ((r@248@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@248@01 s@209@01)
        (allSet%precondition ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@248@01 s@209@01))
    (allSet ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@248@01 s@209@01))
  :qid |prog.l57|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (forall ((r@248@01 $Ref)) (!
  (=>
    (Set_in r@248@01 s@209@01)
    (allSet ($PSF.lookup_list (as sm@254@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@249@01  $FVF<next>) r@248@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@248@01 s@209@01))
  :qid |prog.l57|)))
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 57 | !(|s@133@01| > 0)]
(assert (not (> (Set_card s@133@01) 0)))
(pop) ; 9
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@133@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@133@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 67 | !(|s@133@01| > 0) | live]
; [else-branch: 67 | |s@133@01| > 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 67 | !(|s@133@01| > 0)]
(assert (not (> (Set_card s@133@01) 0)))
(declare-const r@256@01 $Ref)
(push) ; 10
; [eval] (r in lists)
(assert (Set_in r@256@01 lists@3@01))
(pop) ; 10
(declare-fun inv@257@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((r1@256@01 $Ref) (r2@256@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@256@01 lists@3@01)
      (Set_in r2@256@01 lists@3@01)
      (= r1@256@01 r2@256@01))
    (= r1@256@01 r2@256@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@256@01 $Ref)) (!
  (=>
    (Set_in r@256@01 lists@3@01)
    (= (inv@257@01 r@256@01 length@4@01) r@256@01))
  :pattern ((Set_in r@256@01 lists@3@01))
  :pattern ((inv@257@01 r@256@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@257@01 r i) lists@3@01)
    (and (= (inv@257@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@257@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@258@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@257@01 r i) lists@3@01)
    ($Perm.min
      (-
        (-
          (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@167@01 r i))
        (pTaken@190@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@259@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@257@01 r i) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@258@01 r i)))
    $Perm.No))
(define-fun pTaken@260@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@257@01 r i) lists@3@01)
    ($Perm.min
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@258@01 r i)) (pTaken@259@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (-
          (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@167@01 r i))
        (pTaken@190@01 r i))
      (pTaken@258@01 r i))
    $Perm.No)
  
  :qid |quant-u-149|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@257@01 r i) lists@3@01)
    (= (- $Perm.Write (pTaken@258@01 r i)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unknown
(pop) ; 10
; 0.02s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@259@01 r i))
    $Perm.No)
  
  :qid |quant-u-151|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@257@01 r i) lists@3@01)
    (= (- (- $Perm.Write (pTaken@258@01 r i)) (pTaken@259@01 r i)) $Perm.No))
  
  :qid |quant-u-152|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@261@01 $PSF<list>)
(declare-const s@262@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@262@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (Set_in (inv@127@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01))) sNext@19@01)
            $Perm.Write
            $Perm.No)
          (pTaken@167@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01))))
        (pTaken@190@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01)))))
    (and
      (not (= s@262@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@262@01))))
  :pattern (($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) s@262@01))
  :qid |qp.psmValDef113|)))
(assert (forall ((s@262@01 $Snap)) (!
  (=>
    (and
      (not
        (Set_in (inv@136@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01))) s@133@01))
      (Set_in (inv@136@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01))) lists@3@01))
    (and
      (not (= s@262@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) s@262@01))))
  :pattern (($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) s@262@01))
  :qid |qp.psmValDef114|)))
(assert (forall ((s@262@01 $Snap)) (!
  (=>
    (Set_in (inv@157@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@262@01)) ($SortWrappers.$SnapToInt ($Snap.second s@262@01))) s@133@01)
    (and
      (not (= s@262@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@262@01))))
  :pattern (($PSF.lookup_list (as sm@261@01  $PSF<list>) s@262@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) s@262@01))
  :qid |qp.psmValDef115|)))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@263@01 $Ref)
(set-option :timeout 0)
(push) ; 10
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 11
; [then-branch: 68 | r@263@01 in lists@3@01 | live]
; [else-branch: 68 | !(r@263@01 in lists@3@01) | live]
(push) ; 12
; [then-branch: 68 | r@263@01 in lists@3@01]
(assert (Set_in r@263@01 lists@3@01))
; [eval] allSet(r, length, v)
(push) ; 13
; Precomputing data for removing quantified permissions
(define-fun pTaken@264@01 ((r $Ref) (i Int) (r@263@01 $Ref)) $Perm
  (ite
    (and (= r r@263@01) (= i length@4@01))
    ($Perm.min
      (-
        (-
          (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@167@01 r i))
        (pTaken@190@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@265@01 ((r $Ref) (i Int) (r@263@01 $Ref)) $Perm
  (ite
    (and (= r r@263@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@264@01 r i r@263@01)))
    $Perm.No))
(define-fun pTaken@266@01 ((r $Ref) (i Int) (r@263@01 $Ref)) $Perm
  (ite
    (and (= r r@263@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@157@01 r i) s@133@01) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@264@01 r i r@263@01))
        (pTaken@265@01 r i r@263@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (-
          (ite (Set_in (inv@127@01 r i) sNext@19@01) $Perm.Write $Perm.No)
          (pTaken@167@01 r i))
        (pTaken@190@01 r i))
      (pTaken@264@01 r i r@263@01))
    $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 14
; 0.23s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@263@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@264@01 r i r@263@01)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 14
; 0.19s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@136@01 r i) s@133@01))
          (Set_in (inv@136@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@265@01 r i r@263@01))
    $Perm.No)
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 14
; 0.33s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@263@01) (= i length@4@01))
    (=
      (-
        (- $Perm.Write (pTaken@264@01 r i r@263@01))
        (pTaken@265@01 r i r@263@01))
      $Perm.No))
  
  :qid |quant-u-157|))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@267@01 $PSF<list>)
(declare-const s@268@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@263@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@267@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (-
        (ite
          (Set_in (inv@127@01 r@263@01 length@4@01) sNext@19@01)
          $Perm.Write
          $Perm.No)
        (pTaken@167@01 r@263@01 length@4@01))
      (pTaken@190@01 r@263@01 length@4@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (not (Set_in (inv@136@01 r@263@01 length@4@01) s@133@01))
    (Set_in (inv@136@01 r@263@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (Set_in (inv@157@01 r@263@01 length@4@01) s@133@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@263@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@263@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@267@01  $PSF<list>)))
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (Set_in (inv@127@01 r@263@01 length@4@01) sNext@19@01)
            $Perm.Write
            $Perm.No)
          (pTaken@167@01 r@263@01 length@4@01))
        (pTaken@190@01 r@263@01 length@4@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (not (Set_in (inv@136@01 r@263@01 length@4@01) s@133@01))
      (Set_in (inv@136@01 r@263@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (Set_in (inv@157@01 r@263@01 length@4@01) s@133@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01)))
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 68 | !(r@263@01 in lists@3@01)]
(assert (not (Set_in r@263@01 lists@3@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (Set_in r@263@01 lists@3@01)
  (and
    (Set_in r@263@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@263@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@267@01  $PSF<list>)))
    (=>
      (<
        $Perm.No
        (-
          (-
            (ite
              (Set_in (inv@127@01 r@263@01 length@4@01) sNext@19@01)
              $Perm.Write
              $Perm.No)
            (pTaken@167@01 r@263@01 length@4@01))
          (pTaken@190@01 r@263@01 length@4@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@263@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (not (Set_in (inv@136@01 r@263@01 length@4@01) s@133@01))
        (Set_in (inv@136@01 r@263@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@263@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (Set_in (inv@157@01 r@263@01 length@4@01) s@133@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@263@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@263@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@263@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@263@01 lists@3@01)) (Set_in r@263@01 lists@3@01)))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@263@01 $Ref)) (!
  (and
    (=>
      (Set_in r@263@01 lists@3@01)
      (and
        (Set_in r@263@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@267@01  $PSF<list>)))
        (=>
          (<
            $Perm.No
            (-
              (-
                (ite
                  (Set_in (inv@127@01 r@263@01 length@4@01) sNext@19@01)
                  $Perm.Write
                  $Perm.No)
                (pTaken@167@01 r@263@01 length@4@01))
              (pTaken@190@01 r@263@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@136@01 r@263@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@263@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@157@01 r@263@01 length@4@01) s@133@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01)))
    (or (not (Set_in r@263@01 lists@3@01)) (Set_in r@263@01 lists@3@01)))
  :pattern ((Set_in r@263@01 lists@3@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@263@01 $Ref)) (!
  (and
    (=>
      (Set_in r@263@01 lists@3@01)
      (and
        (Set_in r@263@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@267@01  $PSF<list>)))
        (=>
          (<
            $Perm.No
            (-
              (-
                (ite
                  (Set_in (inv@127@01 r@263@01 length@4@01) sNext@19@01)
                  $Perm.Write
                  $Perm.No)
                (pTaken@167@01 r@263@01 length@4@01))
              (pTaken@190@01 r@263@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@125@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@136@01 r@263@01 length@4@01) s@133@01))
            (Set_in (inv@136@01 r@263@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@134@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@157@01 r@263@01 length@4@01) s@133@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@263@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@134@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@263@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01)))
    (or (not (Set_in r@263@01 lists@3@01)) (Set_in r@263@01 lists@3@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@263@01 $Ref)) (!
  (=>
    (Set_in r@263@01 lists@3@01)
    (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@263@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :pattern ((Set_in r@263@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :qid |prog.l26_precondition|)))
(push) ; 10
(assert (not (forall ((r@263@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@263@01 lists@3@01)
        (allSet%precondition ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@263@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
      (Set_in r@263@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@263@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :pattern ((Set_in r@263@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :qid |prog.l26|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@263@01 $Ref)) (!
  (=>
    (Set_in r@263@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@263@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :pattern ((Set_in r@263@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@267@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@263@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@263@01 length@4@01 v@5@01))
  :qid |prog.l26|)))
(pop) ; 9
(push) ; 9
; [else-branch: 67 | |s@133@01| > 0]
(assert (> (Set_card s@133@01) 0))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 39 | !(length@4@01 - 1 > 0)]
(assert (not (> (- length@4@01 1) 0)))
(pop) ; 6
; [eval] !(length - 1 > 0)
; [eval] length - 1 > 0
; [eval] length - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (> (- length@4@01 1) 0)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (> (- length@4@01 1) 0))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 69 | !(length@4@01 - 1 > 0) | live]
; [else-branch: 69 | length@4@01 - 1 > 0 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 69 | !(length@4@01 - 1 > 0)]
(assert (not (> (- length@4@01 1) 0)))
; [exec]
; s := lists
(declare-const s@269@01 Set<$Ref>)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@270@01 $Snap)
(assert (= $t@270@01 ($Snap.combine ($Snap.first $t@270@01) ($Snap.second $t@270@01))))
(declare-const r@271@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 70 | r@271@01 in lists@3@01 | live]
; [else-branch: 70 | !(r@271@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 70 | r@271@01 in lists@3@01]
(assert (Set_in r@271@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 70 | !(r@271@01 in lists@3@01)]
(assert (not (Set_in r@271@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@271@01 lists@3@01)) (Set_in r@271@01 lists@3@01)))
(assert (and (not (Set_in r@271@01 s@269@01)) (Set_in r@271@01 lists@3@01)))
(pop) ; 8
(declare-fun inv@272@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@271@01 $Ref)) (!
  (=>
    (and (not (Set_in r@271@01 s@269@01)) (Set_in r@271@01 lists@3@01))
    (or (not (Set_in r@271@01 lists@3@01)) (Set_in r@271@01 lists@3@01)))
  :pattern ((Set_in r@271@01 s@269@01))
  :pattern ((Set_in r@271@01 lists@3@01))
  :pattern ((inv@272@01 r@271@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@271@01 $Ref)) (!
  (=>
    (and (not (Set_in r@271@01 s@269@01)) (Set_in r@271@01 lists@3@01))
    (= (inv@272@01 r@271@01 length@4@01) r@271@01))
  :pattern ((Set_in r@271@01 s@269@01))
  :pattern ((Set_in r@271@01 lists@3@01))
  :pattern ((inv@272@01 r@271@01 length@4@01))
  :qid |quant-u-159|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@272@01 r i) s@269@01))
      (Set_in (inv@272@01 r i) lists@3@01))
    (and (= (inv@272@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@272@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@270@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@270@01))
    ($Snap.second ($Snap.second $t@270@01)))))
(assert (= ($Snap.first ($Snap.second $t@270@01)) $Snap.unit))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@273@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 71 | r@273@01 in lists@3@01 | live]
; [else-branch: 71 | !(r@273@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 71 | r@273@01 in lists@3@01]
(assert (Set_in r@273@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 71 | !(r@273@01 in lists@3@01)]
(assert (not (Set_in r@273@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01)))
(push) ; 9
; [then-branch: 72 | !(r@273@01 in s@269@01) && r@273@01 in lists@3@01 | live]
; [else-branch: 72 | !(!(r@273@01 in s@269@01) && r@273@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 72 | !(r@273@01 in s@269@01) && r@273@01 in lists@3@01]
(assert (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@274@01 ((r $Ref) (i Int) (r@273@01 $Ref)) $Perm
  (ite
    (and (= r r@273@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
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
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@274@01 r i r@273@01))
    $Perm.No)
  
  :qid |quant-u-161|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@273@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@274@01 r i r@273@01)) $Perm.No))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@275@01 $PSF<list>)
(declare-const s@276@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@273@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
    (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@273@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@273@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@273@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
  (=>
    (and
      (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
      (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@273@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 72 | !(!(r@273@01 in s@269@01) && r@273@01 in lists@3@01)]
(assert (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
  (and
    (not (Set_in r@273@01 s@269@01))
    (Set_in r@273@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@273@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
    (=>
      (and
        (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
        (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@273@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@273@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@273@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@273@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
  (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((Set_in r@273@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((Set_in r@273@01 s@269@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (=>
    (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@273@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :pattern ((Set_in r@273@01 lists@3@01))
  :pattern ((Set_in r@273@01 s@269@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(assert (=
  ($Snap.second ($Snap.second $t@270@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@270@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
(declare-const r@277@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@277@01 s@269@01))
(pop) ; 8
(declare-fun inv@278@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@277@01 $Ref)) (!
  (=> (Set_in r@277@01 s@269@01) (= (inv@278@01 r@277@01) r@277@01))
  :pattern ((Set_in r@277@01 s@269@01))
  :pattern ((inv@278@01 r@277@01))
  :qid |quant-u-164|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@278@01 r) s@269@01) (= (inv@278@01 r) r))
  :pattern ((inv@278@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@277@01 $Ref)) (!
  (=> (Set_in r@277@01 s@269@01) (not (= r@277@01 $Ref.null)))
  :pattern ((Set_in r@277@01 s@269@01))
  :pattern ((inv@278@01 r@277@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@270@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@279@01 $Ref)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 73 | r@279@01 in s@269@01 | live]
; [else-branch: 73 | !(r@279@01 in s@269@01) | live]
(push) ; 10
; [then-branch: 73 | r@279@01 in s@269@01]
(assert (Set_in r@279@01 s@269@01))
; [eval] r.val == v
(declare-const sm@280@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@278@01 r) s@269@01)
    (=
      ($FVF.lookup_val (as sm@280@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@280@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef122|)))
(declare-const pm@281@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@281@01  $FPM) r)
    (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_val (as pm@281@01  $FPM) r@279@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 73 | !(r@279@01 in s@269@01)]
(assert (not (Set_in r@279@01 s@269@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@278@01 r) s@269@01)
    (=
      ($FVF.lookup_val (as sm@280@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@280@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@281@01  $FPM) r)
    (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
; Joined path conditions
(assert (or (not (Set_in r@279@01 s@269@01)) (Set_in r@279@01 s@269@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@278@01 r) s@269@01)
    (=
      ($FVF.lookup_val (as sm@280@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@280@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@281@01  $FPM) r)
    (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@279@01 $Ref)) (!
  (or (not (Set_in r@279@01 s@269@01)) (Set_in r@279@01 s@269@01))
  :pattern ((Set_in r@279@01 s@269@01))
  :qid |prog.l54-aux|)))
(assert (forall ((r@279@01 $Ref)) (!
  (=>
    (Set_in r@279@01 s@269@01)
    (= ($FVF.lookup_val (as sm@280@01  $FVF<val>) r@279@01) v@5@01))
  :pattern ((Set_in r@279@01 s@269@01))
  :qid |prog.l54|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))))
(declare-const r@282@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@282@01 s@269@01))
(pop) ; 8
(declare-fun inv@283@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@282@01 $Ref)) (!
  (=> (Set_in r@282@01 s@269@01) (= (inv@283@01 r@282@01) r@282@01))
  :pattern ((Set_in r@282@01 s@269@01))
  :pattern ((inv@283@01 r@282@01))
  :qid |quant-u-166|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@283@01 r) s@269@01) (= (inv@283@01 r) r))
  :pattern ((inv@283@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@282@01 $Ref)) (!
  (=> (Set_in r@282@01 s@269@01) (not (= r@282@01 $Ref.null)))
  :pattern ((Set_in r@282@01 s@269@01))
  :pattern ((inv@283@01 r@282@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
  $Snap.unit))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@284@01 $Ref)
(declare-const r2@285@01 $Ref)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 74 | r1@284@01 in s@269@01 | live]
; [else-branch: 74 | !(r1@284@01 in s@269@01) | live]
(push) ; 10
; [then-branch: 74 | r1@284@01 in s@269@01]
(assert (Set_in r1@284@01 s@269@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 75 | r2@285@01 in s@269@01 | live]
; [else-branch: 75 | !(r2@285@01 in s@269@01) | live]
(push) ; 12
; [then-branch: 75 | r2@285@01 in s@269@01]
(assert (Set_in r2@285@01 s@269@01))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 75 | !(r2@285@01 in s@269@01)]
(assert (not (Set_in r2@285@01 s@269@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@285@01 s@269@01)) (Set_in r2@285@01 s@269@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 74 | !(r1@284@01 in s@269@01)]
(assert (not (Set_in r1@284@01 s@269@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r1@284@01 s@269@01)
  (and
    (Set_in r1@284@01 s@269@01)
    (or (not (Set_in r2@285@01 s@269@01)) (Set_in r2@285@01 s@269@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@284@01 s@269@01)) (Set_in r1@284@01 s@269@01)))
(push) ; 9
; [then-branch: 76 | r1@284@01 != r2@285@01 && r2@285@01 in s@269@01 && r1@284@01 in s@269@01 | live]
; [else-branch: 76 | !(r1@284@01 != r2@285@01 && r2@285@01 in s@269@01 && r1@284@01 in s@269@01) | live]
(push) ; 10
; [then-branch: 76 | r1@284@01 != r2@285@01 && r2@285@01 in s@269@01 && r1@284@01 in s@269@01]
(assert (and
  (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
  (Set_in r1@284@01 s@269@01)))
; [eval] r1.next != r2.next
(declare-const sm@286@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef124|)))
(declare-const pm@287@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@287@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@287@01  $FPM) r))
  :qid |qp.resPrmSumDef125|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@287@01  $FPM) r1@284@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@288@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@288@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@288@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef126|)))
(declare-const pm@289@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@289@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@289@01  $FPM) r))
  :qid |qp.resPrmSumDef127|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@289@01  $FPM) r2@285@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 76 | !(r1@284@01 != r2@285@01 && r2@285@01 in s@269@01 && r1@284@01 in s@269@01)]
(assert (not
  (and
    (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
    (Set_in r1@284@01 s@269@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@287@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@287@01  $FPM) r))
  :qid |qp.resPrmSumDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@288@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@288@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@289@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@289@01  $FPM) r))
  :qid |qp.resPrmSumDef127|)))
(assert (=>
  (and
    (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
    (Set_in r1@284@01 s@269@01))
  (and
    (not (= r1@284@01 r2@285@01))
    (Set_in r2@285@01 s@269@01)
    (Set_in r1@284@01 s@269@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
      (Set_in r1@284@01 s@269@01)))
  (and
    (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
    (Set_in r1@284@01 s@269@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@287@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@287@01  $FPM) r))
  :qid |qp.resPrmSumDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@288@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@288@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@289@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@289@01  $FPM) r))
  :qid |qp.resPrmSumDef127|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@284@01 $Ref) (r2@285@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@284@01 s@269@01)
      (and
        (Set_in r1@284@01 s@269@01)
        (or (not (Set_in r2@285@01 s@269@01)) (Set_in r2@285@01 s@269@01))))
    (or (not (Set_in r1@284@01 s@269@01)) (Set_in r1@284@01 s@269@01))
    (=>
      (and
        (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
        (Set_in r1@284@01 s@269@01))
      (and
        (not (= r1@284@01 r2@285@01))
        (Set_in r2@285@01 s@269@01)
        (Set_in r1@284@01 s@269@01)))
    (or
      (not
        (and
          (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
          (Set_in r1@284@01 s@269@01)))
      (and
        (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
        (Set_in r1@284@01 s@269@01))))
  :pattern ((Set_in r1@284@01 s@269@01) (Set_in r2@285@01 s@269@01))
  :qid |prog.l55-aux|)))
(assert (forall ((r1@284@01 $Ref) (r2@285@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
      (Set_in r1@284@01 s@269@01))
    (not
      (=
        ($FVF.lookup_next (as sm@286@01  $FVF<next>) r1@284@01)
        ($FVF.lookup_next (as sm@288@01  $FVF<next>) r2@285@01))))
  :pattern ((Set_in r1@284@01 s@269@01) (Set_in r2@285@01 s@269@01))
  :qid |prog.l55|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))))))
(declare-const r@290@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@290@01 s@269@01))
(declare-const sm@291@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@291@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@291@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef128|)))
(declare-const pm@292@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@292@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@292@01  $FPM) r))
  :qid |qp.resPrmSumDef129|)))
(push) ; 9
(assert (not (< $Perm.No ($FVF.perm_next (as pm@292@01  $FPM) r@290@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@293@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@291@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@291@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@292@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@292@01  $FPM) r))
  :qid |qp.resPrmSumDef129|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((r@290@01 $Ref)) (!
  (=>
    (Set_in r@290@01 s@269@01)
    (=
      (inv@293@01 ($FVF.lookup_next (as sm@291@01  $FVF<next>) r@290@01) (-
        length@4@01
        1))
      r@290@01))
  :pattern (($FVF.lookup_next (as sm@291@01  $FVF<next>) r@290@01))
  :qid |quant-u-168|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@293@01 r i) s@269@01)
    (and
      (= ($FVF.lookup_next (as sm@291@01  $FVF<next>) (inv@293@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@293@01 r i))
  :qid |list-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
  $Snap.unit))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@294@01 $Ref)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 77 | r@294@01 in s@269@01 | live]
; [else-branch: 77 | !(r@294@01 in s@269@01) | live]
(push) ; 10
; [then-branch: 77 | r@294@01 in s@269@01]
(assert (Set_in r@294@01 s@269@01))
; [eval] allSet(r.next, length - 1, v)
(declare-const sm@295@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@295@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@295@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef130|)))
(declare-const pm@296@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@296@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@296@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@296@01  $FPM) r@294@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@297@01 ((r $Ref) (i Int) (r@294@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@298@01 ((r $Ref) (i Int) (r@294@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@297@01 r i r@294@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      (pTaken@297@01 r i r@294@01))
    $Perm.No)
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@297@01 r i r@294@01)) $Perm.No))
  
  :qid |quant-u-171|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@299@01 $PSF<list>)
(declare-const s@300@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@293@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
    length@4@01
    1)) s@269@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
        length@4@01
        1)) s@269@01))
    (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>)))
  (=>
    (Set_in (inv@293@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
      length@4@01
      1)) s@269@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (not
        (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
          length@4@01
          1)) s@269@01))
      (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
        length@4@01
        1)) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 77 | !(r@294@01 in s@269@01)]
(assert (not (Set_in r@294@01 s@269@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@295@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@295@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@296@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@296@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (=>
  (Set_in r@294@01 s@269@01)
  (and
    (Set_in r@294@01 s@269@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>)))
    (=>
      (Set_in (inv@293@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
        length@4@01
        1)) s@269@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (not
          (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
            length@4@01
            1)) s@269@01))
        (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
          length@4@01
          1)) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@294@01 s@269@01)) (Set_in r@294@01 s@269@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@295@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@295@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@296@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@296@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@294@01 $Ref)) (!
  (and
    (=>
      (Set_in r@294@01 s@269@01)
      (and
        (Set_in r@294@01 s@269@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>)))
        (=>
          (Set_in (inv@293@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
            length@4@01
            1)) s@269@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
                length@4@01
                1)) s@269@01))
            (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@294@01 s@269@01)) (Set_in r@294@01 s@269@01)))
  :pattern ((Set_in r@294@01 s@269@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@294@01 $Ref)) (!
  (=>
    (Set_in r@294@01 s@269@01)
    (allSet ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@294@01 s@269@01))
  :qid |prog.l57|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 8
; [eval] |s| > 0
; [eval] |s|
(pop) ; 8
(push) ; 8
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 8
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
(declare-const r@301@01 $Ref)
(push) ; 8
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 78 | r@301@01 in lists@3@01 | live]
; [else-branch: 78 | !(r@301@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 78 | r@301@01 in lists@3@01]
(assert (Set_in r@301@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 78 | !(r@301@01 in lists@3@01)]
(assert (not (Set_in r@301@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@301@01 lists@3@01)) (Set_in r@301@01 lists@3@01)))
(assert (and (not (Set_in r@301@01 lists@3@01)) (Set_in r@301@01 lists@3@01)))
(pop) ; 8
(declare-fun inv@302@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@301@01 $Ref)) (!
  (=>
    (and (not (Set_in r@301@01 lists@3@01)) (Set_in r@301@01 lists@3@01))
    (or (not (Set_in r@301@01 lists@3@01)) (Set_in r@301@01 lists@3@01)))
  :pattern ((Set_in r@301@01 lists@3@01))
  :pattern ((inv@302@01 r@301@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@301@01 $Ref) (r2@301@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@301@01 lists@3@01)) (Set_in r1@301@01 lists@3@01))
      (and (not (Set_in r2@301@01 lists@3@01)) (Set_in r2@301@01 lists@3@01))
      (= r1@301@01 r2@301@01))
    (= r1@301@01 r2@301@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@301@01 $Ref)) (!
  (=>
    (and (not (Set_in r@301@01 lists@3@01)) (Set_in r@301@01 lists@3@01))
    (= (inv@302@01 r@301@01 length@4@01) r@301@01))
  :pattern ((Set_in r@301@01 lists@3@01))
  :pattern ((inv@302@01 r@301@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@302@01 r i) lists@3@01))
      (Set_in (inv@302@01 r i) lists@3@01))
    (and (= (inv@302@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@302@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@303@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@302@01 r i) lists@3@01))
      (Set_in (inv@302@01 r i) lists@3@01))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@304@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@302@01 r i) lists@3@01))
      (Set_in (inv@302@01 r i) lists@3@01))
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@303@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (pTaken@303@01 r i))
    $Perm.No)
  
  :qid |quant-u-174|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@302@01 r i) lists@3@01))
      (Set_in (inv@302@01 r i) lists@3@01))
    (= (- $Perm.Write (pTaken@303@01 r i)) $Perm.No))
  
  :qid |quant-u-175|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@305@01 $PSF<list>)
(declare-const s@306@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@306@01 $Snap)) (!
  (=>
    (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@306@01)) ($SortWrappers.$SnapToInt ($Snap.second s@306@01))) s@18@01)
    (and
      (not (= s@306@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@305@01  $PSF<list>) s@306@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@306@01))))
  :pattern (($PSF.lookup_list (as sm@305@01  $PSF<list>) s@306@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) s@306@01))
  :qid |qp.psmValDef135|)))
(assert (forall ((s@306@01 $Snap)) (!
  (=>
    (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@306@01)) ($SortWrappers.$SnapToInt ($Snap.second s@306@01))) sNext@19@01)
    (and
      (not (= s@306@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@305@01  $PSF<list>) s@306@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@306@01))))
  :pattern (($PSF.lookup_list (as sm@305@01  $PSF<list>) s@306@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@306@01))
  :qid |qp.psmValDef136|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@307@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 9
; [then-branch: 79 | r@307@01 in lists@3@01 | live]
; [else-branch: 79 | !(r@307@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 79 | r@307@01 in lists@3@01]
(assert (Set_in r@307@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 10
(push) ; 10
; [else-branch: 79 | !(r@307@01 in lists@3@01)]
(assert (not (Set_in r@307@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
(push) ; 9
; [then-branch: 80 | !(r@307@01 in lists@3@01) && r@307@01 in lists@3@01 | live]
; [else-branch: 80 | !(!(r@307@01 in lists@3@01) && r@307@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 80 | !(r@307@01 in lists@3@01) && r@307@01 in lists@3@01]
(assert (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@308@01 ((r $Ref) (i Int) (r@307@01 $Ref)) $Perm
  (ite
    (and (= r r@307@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@309@01 ((r $Ref) (i Int) (r@307@01 $Ref)) $Perm
  (ite
    (and (= r r@307@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@308@01 r i r@307@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (pTaken@308@01 r i r@307@01))
    $Perm.No)
  
  :qid |quant-u-177|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@307@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@308@01 r i r@307@01)) $Perm.No))
  
  :qid |quant-u-178|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@310@01 $PSF<list>)
(declare-const s@311@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@307@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@310@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@22@01 r@307@01 length@4@01) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@307@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@307@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (Set_in (inv@26@01 r@307@01 length@4@01) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@307@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@307@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@307@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@310@01  $PSF<list>)))
  (=>
    (Set_in (inv@22@01 r@307@01 length@4@01) s@18@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (Set_in (inv@26@01 r@307@01 length@4@01) sNext@19@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 80 | !(!(r@307@01 in lists@3@01) && r@307@01 in lists@3@01)]
(assert (not (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
  (and
    (not (Set_in r@307@01 lists@3@01))
    (Set_in r@307@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@307@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@310@01  $PSF<list>)))
    (=>
      (Set_in (inv@22@01 r@307@01 length@4@01) s@18@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@307@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (Set_in (inv@26@01 r@307@01 length@4@01) sNext@19@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@307@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@307@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@307@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
  (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@307@01 $Ref)) (!
  (and
    (or (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
    (=>
      (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
      (and
        (not (Set_in r@307@01 lists@3@01))
        (Set_in r@307@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@310@01  $PSF<list>)))
        (=>
          (Set_in (inv@22@01 r@307@01 length@4@01) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@307@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@26@01 r@307@01 length@4@01) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@307@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
      (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))))
  :pattern ((Set_in r@307@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@307@01 $Ref)) (!
  (and
    (or (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
    (=>
      (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
      (and
        (not (Set_in r@307@01 lists@3@01))
        (Set_in r@307@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@310@01  $PSF<list>)))
        (=>
          (Set_in (inv@22@01 r@307@01 length@4@01) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@307@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@26@01 r@307@01 length@4@01) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@307@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@307@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
      (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@307@01 $Ref)) (!
  (=>
    (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
    (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@307@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :qid |prog.l53_precondition|)))
(push) ; 8
(assert (not (forall ((r@307@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
        (allSet%precondition ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@307@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
      (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01)))
    (allSet ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@307@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :qid |prog.l53|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@307@01 $Ref)) (!
  (=>
    (and (not (Set_in r@307@01 lists@3@01)) (Set_in r@307@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@307@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((Set_in r@307@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@310@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@307@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@307@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(declare-const r@312@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@312@01 lists@3@01))
(pop) ; 8
(declare-fun inv@313@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@312@01 $Ref) (r2@312@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@312@01 lists@3@01)
      (Set_in r2@312@01 lists@3@01)
      (= r1@312@01 r2@312@01))
    (= r1@312@01 r2@312@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@312@01 $Ref)) (!
  (=> (Set_in r@312@01 lists@3@01) (= (inv@313@01 r@312@01) r@312@01))
  :pattern ((Set_in r@312@01 lists@3@01))
  :pattern ((inv@313@01 r@312@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@313@01 r) lists@3@01) (= (inv@313@01 r) r))
  :pattern ((inv@313@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@314@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@313@01 r) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@28@01 r) s@18@01))
          (Set_in (inv@28@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@314@01 r))
    $Perm.No)
  
  :qid |quant-u-181|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@313@01 r) lists@3@01)
    (= (- $Perm.Write (pTaken@314@01 r)) $Perm.No))
  
  :qid |quant-u-182|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@315@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@28@01 r) s@18@01)) (Set_in (inv@28@01 r) lists@3@01))
    (=
      ($FVF.lookup_val (as sm@315@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@315@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))) r))
  :qid |qp.fvfValDef140|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@316@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 9
; [then-branch: 81 | r@316@01 in lists@3@01 | live]
; [else-branch: 81 | !(r@316@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 81 | r@316@01 in lists@3@01]
(assert (Set_in r@316@01 lists@3@01))
; [eval] r.val == v
(push) ; 11
(assert (not (and
  (not (Set_in (inv@28@01 r@316@01) s@18@01))
  (Set_in (inv@28@01 r@316@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 81 | !(r@316@01 in lists@3@01)]
(assert (not (Set_in r@316@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@316@01 lists@3@01)) (Set_in r@316@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@316@01 $Ref)) (!
  (or (not (Set_in r@316@01 lists@3@01)) (Set_in r@316@01 lists@3@01))
  :pattern ((Set_in r@316@01 lists@3@01))
  :qid |prog.l54-aux|)))
(push) ; 8
(assert (not (forall ((r@316@01 $Ref)) (!
  (=>
    (Set_in r@316@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@315@01  $FVF<val>) r@316@01) v@5@01))
  :pattern ((Set_in r@316@01 lists@3@01))
  :qid |prog.l54|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@316@01 $Ref)) (!
  (=>
    (Set_in r@316@01 lists@3@01)
    (= ($FVF.lookup_val (as sm@315@01  $FVF<val>) r@316@01) v@5@01))
  :pattern ((Set_in r@316@01 lists@3@01))
  :qid |prog.l54|)))
(declare-const r@317@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@317@01 lists@3@01))
(pop) ; 8
(declare-fun inv@318@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@317@01 $Ref) (r2@317@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@317@01 lists@3@01)
      (Set_in r2@317@01 lists@3@01)
      (= r1@317@01 r2@317@01))
    (= r1@317@01 r2@317@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@317@01 $Ref)) (!
  (=> (Set_in r@317@01 lists@3@01) (= (inv@318@01 r@317@01) r@317@01))
  :pattern ((Set_in r@317@01 lists@3@01))
  :pattern ((inv@318@01 r@317@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@318@01 r) lists@3@01) (= (inv@318@01 r) r))
  :pattern ((inv@318@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@319@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@318@01 r) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@24@01 r) s@18@01))
          (Set_in (inv@24@01 r) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@319@01 r))
    $Perm.No)
  
  :qid |quant-u-185|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@318@01 r) lists@3@01)
    (= (- $Perm.Write (pTaken@319@01 r)) $Perm.No))
  
  :qid |quant-u-186|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@320@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (not (Set_in (inv@24@01 r) s@18@01)) (Set_in (inv@24@01 r) lists@3@01))
    (=
      ($FVF.lookup_next (as sm@320@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_next (as sm@320@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef141|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@321@01 $Ref)
(declare-const r2@322@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 9
; [then-branch: 82 | r1@321@01 in lists@3@01 | live]
; [else-branch: 82 | !(r1@321@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 82 | r1@321@01 in lists@3@01]
(assert (Set_in r1@321@01 lists@3@01))
; [eval] (r2 in s)
(push) ; 11
; [then-branch: 83 | r2@322@01 in lists@3@01 | live]
; [else-branch: 83 | !(r2@322@01 in lists@3@01) | live]
(push) ; 12
; [then-branch: 83 | r2@322@01 in lists@3@01]
(assert (Set_in r2@322@01 lists@3@01))
; [eval] r1 != r2
(pop) ; 12
(push) ; 12
; [else-branch: 83 | !(r2@322@01 in lists@3@01)]
(assert (not (Set_in r2@322@01 lists@3@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@322@01 lists@3@01)) (Set_in r2@322@01 lists@3@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 82 | !(r1@321@01 in lists@3@01)]
(assert (not (Set_in r1@321@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r1@321@01 lists@3@01)
  (and
    (Set_in r1@321@01 lists@3@01)
    (or (not (Set_in r2@322@01 lists@3@01)) (Set_in r2@322@01 lists@3@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@321@01 lists@3@01)) (Set_in r1@321@01 lists@3@01)))
(push) ; 9
; [then-branch: 84 | r1@321@01 != r2@322@01 && r2@322@01 in lists@3@01 && r1@321@01 in lists@3@01 | live]
; [else-branch: 84 | !(r1@321@01 != r2@322@01 && r2@322@01 in lists@3@01 && r1@321@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 84 | r1@321@01 != r2@322@01 && r2@322@01 in lists@3@01 && r1@321@01 in lists@3@01]
(assert (and
  (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
  (Set_in r1@321@01 lists@3@01)))
; [eval] r1.next != r2.next
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r1@321@01) s@18@01))
  (Set_in (inv@24@01 r1@321@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r2@322@01) s@18@01))
  (Set_in (inv@24@01 r2@322@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 84 | !(r1@321@01 != r2@322@01 && r2@322@01 in lists@3@01 && r1@321@01 in lists@3@01)]
(assert (not
  (and
    (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
    (Set_in r1@321@01 lists@3@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
    (Set_in r1@321@01 lists@3@01))
  (and
    (not (= r1@321@01 r2@322@01))
    (Set_in r2@322@01 lists@3@01)
    (Set_in r1@321@01 lists@3@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
      (Set_in r1@321@01 lists@3@01)))
  (and
    (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
    (Set_in r1@321@01 lists@3@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@321@01 $Ref) (r2@322@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@321@01 lists@3@01)
      (and
        (Set_in r1@321@01 lists@3@01)
        (or (not (Set_in r2@322@01 lists@3@01)) (Set_in r2@322@01 lists@3@01))))
    (or (not (Set_in r1@321@01 lists@3@01)) (Set_in r1@321@01 lists@3@01))
    (=>
      (and
        (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
        (Set_in r1@321@01 lists@3@01))
      (and
        (not (= r1@321@01 r2@322@01))
        (Set_in r2@322@01 lists@3@01)
        (Set_in r1@321@01 lists@3@01)))
    (or
      (not
        (and
          (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
          (Set_in r1@321@01 lists@3@01)))
      (and
        (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
        (Set_in r1@321@01 lists@3@01))))
  :pattern ((Set_in r1@321@01 lists@3@01) (Set_in r2@322@01 lists@3@01))
  :qid |prog.l55-aux|)))
(push) ; 8
(assert (not (forall ((r1@321@01 $Ref) (r2@322@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
      (Set_in r1@321@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r1@321@01)
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r2@322@01))))
  :pattern ((Set_in r1@321@01 lists@3@01) (Set_in r2@322@01 lists@3@01))
  :qid |prog.l55|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r1@321@01 $Ref) (r2@322@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@321@01 r2@322@01)) (Set_in r2@322@01 lists@3@01))
      (Set_in r1@321@01 lists@3@01))
    (not
      (=
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r1@321@01)
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r2@322@01))))
  :pattern ((Set_in r1@321@01 lists@3@01) (Set_in r2@322@01 lists@3@01))
  :qid |prog.l55|)))
(declare-const r@323@01 $Ref)
(push) ; 8
; [eval] (r in s)
(assert (Set_in r@323@01 lists@3@01))
(push) ; 9
(assert (not (and
  (not (Set_in (inv@24@01 r@323@01) s@18@01))
  (Set_in (inv@24@01 r@323@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 8
(declare-fun inv@324@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((r1@323@01 $Ref) (r2@323@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@323@01 lists@3@01)
      (Set_in r2@323@01 lists@3@01)
      (=
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r1@323@01)
        ($FVF.lookup_next (as sm@320@01  $FVF<next>) r2@323@01)))
    (= r1@323@01 r2@323@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@323@01 $Ref)) (!
  (=>
    (Set_in r@323@01 lists@3@01)
    (=
      (inv@324@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@323@01) (-
        length@4@01
        1))
      r@323@01))
  :pattern (($FVF.lookup_next (as sm@320@01  $FVF<next>) r@323@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@324@01 r i) lists@3@01)
    (and
      (= ($FVF.lookup_next (as sm@320@01  $FVF<next>) (inv@324@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@324@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@325@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@324@01 r i) lists@3@01)
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@325@01 r i))
    $Perm.No)
  
  :qid |quant-u-189|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@324@01 r i) lists@3@01)
    (= (- $Perm.Write (pTaken@325@01 r i)) $Perm.No))
  
  :qid |quant-u-190|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@326@01 $PSF<list>)
(declare-const s@327@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@327@01 $Snap)) (!
  (=>
    (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@327@01)) ($SortWrappers.$SnapToInt ($Snap.second s@327@01))) sNext@19@01)
    (and
      (not (= s@327@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@326@01  $PSF<list>) s@327@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@327@01))))
  :pattern (($PSF.lookup_list (as sm@326@01  $PSF<list>) s@327@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@327@01))
  :qid |qp.psmValDef142|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@328@01 $Ref)
(set-option :timeout 0)
(push) ; 8
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 9
; [then-branch: 85 | r@328@01 in lists@3@01 | live]
; [else-branch: 85 | !(r@328@01 in lists@3@01) | live]
(push) ; 10
; [then-branch: 85 | r@328@01 in lists@3@01]
(assert (Set_in r@328@01 lists@3@01))
; [eval] allSet(r.next, length - 1, v)
(push) ; 11
(assert (not (and
  (not (Set_in (inv@24@01 r@328@01) s@18@01))
  (Set_in (inv@24@01 r@328@01) lists@3@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 11
; Precomputing data for removing quantified permissions
(define-fun pTaken@329@01 ((r $Ref) (i Int) (r@328@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@330@01 ((r $Ref) (i Int) (r@328@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@329@01 r i r@328@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@22@01 r i) s@18@01) $Perm.Write $Perm.No)
      (pTaken@329@01 r i r@328@01))
    $Perm.No)
  
  :qid |quant-u-192|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@329@01 r i r@328@01)) $Perm.No))
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
      (pTaken@330@01 r i r@328@01))
    $Perm.No)
  
  :qid |quant-u-194|))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@329@01 r i r@328@01))
        (pTaken@330@01 r i r@328@01))
      $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@331@01 $PSF<list>)
(declare-const s@332@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@331@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@22@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
    length@4@01
    1)) s@18@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (Set_in (inv@26@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
    length@4@01
    1)) sNext@19@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@331@01  $PSF<list>)))
  (=>
    (Set_in (inv@22@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1)) s@18@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (Set_in (inv@26@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1)) sNext@19@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 85 | !(r@328@01 in lists@3@01)]
(assert (not (Set_in r@328@01 lists@3@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (Set_in r@328@01 lists@3@01)
  (and
    (Set_in r@328@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@331@01  $PSF<list>)))
    (=>
      (Set_in (inv@22@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
        length@4@01
        1)) s@18@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (Set_in (inv@26@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
        length@4@01
        1)) sNext@19@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@328@01 lists@3@01)) (Set_in r@328@01 lists@3@01)))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@328@01 $Ref)) (!
  (and
    (=>
      (Set_in r@328@01 lists@3@01)
      (and
        (Set_in r@328@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@331@01  $PSF<list>)))
        (=>
          (Set_in (inv@22@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
            length@4@01
            1)) s@18@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@20@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (Set_in (inv@26@01 ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
            length@4@01
            1)) sNext@19@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@328@01 lists@3@01)) (Set_in r@328@01 lists@3@01)))
  :pattern ((Set_in r@328@01 lists@3@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@328@01 $Ref)) (!
  (=>
    (Set_in r@328@01 lists@3@01)
    (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@328@01 lists@3@01))
  :qid |prog.l57_precondition|)))
(push) ; 8
(assert (not (forall ((r@328@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@328@01 lists@3@01)
        (allSet%precondition ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@328@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@328@01 lists@3@01))
  :qid |prog.l57|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@328@01 $Ref)) (!
  (=>
    (Set_in r@328@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@331@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@320@01  $FVF<next>) r@328@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@328@01 lists@3@01))
  :qid |prog.l57|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@293@01 r i) s@269@01)
    (and
      (= ($FVF.lookup_next (as sm@291@01  $FVF<next>) (inv@293@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@293@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@295@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@295@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef130|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@296@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@296@01  $FPM) r))
  :qid |qp.resPrmSumDef131|)))
(assert (forall ((r@290@01 $Ref)) (!
  (=>
    (Set_in r@290@01 s@269@01)
    (=
      (inv@293@01 ($FVF.lookup_next (as sm@291@01  $FVF<next>) r@290@01) (-
        length@4@01
        1))
      r@290@01))
  :pattern (($FVF.lookup_next (as sm@291@01  $FVF<next>) r@290@01))
  :qid |quant-u-168|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
  $Snap.unit))
(assert (forall ((r@294@01 $Ref)) (!
  (and
    (=>
      (Set_in r@294@01 s@269@01)
      (and
        (Set_in r@294@01 s@269@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>)))
        (=>
          (Set_in (inv@293@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
            length@4@01
            1)) s@269@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
                length@4@01
                1)) s@269@01))
            (Set_in (inv@272@01 ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@294@01 s@269@01)) (Set_in r@294@01 s@269@01)))
  :pattern ((Set_in r@294@01 s@269@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@294@01 $Ref)) (!
  (=>
    (Set_in r@294@01 s@269@01)
    (allSet ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@295@01  $FVF<next>) r@294@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@294@01 s@269@01))
  :qid |prog.l57|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@283@01 r) s@269@01) (= (inv@283@01 r) r))
  :pattern ((inv@283@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@286@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@286@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@287@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@287@01  $FPM) r))
  :qid |qp.resPrmSumDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@288@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@288@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@289@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@289@01  $FPM) r))
  :qid |qp.resPrmSumDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@291@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@291@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@292@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@292@01  $FPM) r))
  :qid |qp.resPrmSumDef129|)))
(assert (forall ((r@282@01 $Ref)) (!
  (=> (Set_in r@282@01 s@269@01) (= (inv@283@01 r@282@01) r@282@01))
  :pattern ((Set_in r@282@01 s@269@01))
  :pattern ((inv@283@01 r@282@01))
  :qid |quant-u-166|)))
(assert (forall ((r@282@01 $Ref)) (!
  (=> (Set_in r@282@01 s@269@01) (not (= r@282@01 $Ref.null)))
  :pattern ((Set_in r@282@01 s@269@01))
  :pattern ((inv@283@01 r@282@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
  $Snap.unit))
(assert (forall ((r1@284@01 $Ref) (r2@285@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@284@01 s@269@01)
      (and
        (Set_in r1@284@01 s@269@01)
        (or (not (Set_in r2@285@01 s@269@01)) (Set_in r2@285@01 s@269@01))))
    (or (not (Set_in r1@284@01 s@269@01)) (Set_in r1@284@01 s@269@01))
    (=>
      (and
        (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
        (Set_in r1@284@01 s@269@01))
      (and
        (not (= r1@284@01 r2@285@01))
        (Set_in r2@285@01 s@269@01)
        (Set_in r1@284@01 s@269@01)))
    (or
      (not
        (and
          (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
          (Set_in r1@284@01 s@269@01)))
      (and
        (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
        (Set_in r1@284@01 s@269@01))))
  :pattern ((Set_in r1@284@01 s@269@01) (Set_in r2@285@01 s@269@01))
  :qid |prog.l55-aux|)))
(assert (forall ((r1@284@01 $Ref) (r2@285@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@284@01 r2@285@01)) (Set_in r2@285@01 s@269@01))
      (Set_in r1@284@01 s@269@01))
    (not
      (=
        ($FVF.lookup_next (as sm@286@01  $FVF<next>) r1@284@01)
        ($FVF.lookup_next (as sm@288@01  $FVF<next>) r2@285@01))))
  :pattern ((Set_in r1@284@01 s@269@01) (Set_in r2@285@01 s@269@01))
  :qid |prog.l55|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))))))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@278@01 r) s@269@01) (= (inv@278@01 r) r))
  :pattern ((inv@278@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@278@01 r) s@269@01)
    (=
      ($FVF.lookup_val (as sm@280@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@280@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@281@01  $FPM) r)
    (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_val (as pm@281@01  $FPM) r))
  :qid |qp.resPrmSumDef123|)))
(assert (forall ((r@277@01 $Ref)) (!
  (=> (Set_in r@277@01 s@269@01) (= (inv@278@01 r@277@01) r@277@01))
  :pattern ((Set_in r@277@01 s@269@01))
  :pattern ((inv@278@01 r@277@01))
  :qid |quant-u-164|)))
(assert (forall ((r@277@01 $Ref)) (!
  (=> (Set_in r@277@01 s@269@01) (not (= r@277@01 $Ref.null)))
  :pattern ((Set_in r@277@01 s@269@01))
  :pattern ((inv@278@01 r@277@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@270@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  $Snap.unit))
(assert (forall ((r@279@01 $Ref)) (!
  (or (not (Set_in r@279@01 s@269@01)) (Set_in r@279@01 s@269@01))
  :pattern ((Set_in r@279@01 s@269@01))
  :qid |prog.l54-aux|)))
(assert (forall ((r@279@01 $Ref)) (!
  (=>
    (Set_in r@279@01 s@269@01)
    (= ($FVF.lookup_val (as sm@280@01  $FVF<val>) r@279@01) v@5@01))
  :pattern ((Set_in r@279@01 s@269@01))
  :qid |prog.l54|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@272@01 r i) s@269@01))
      (Set_in (inv@272@01 r i) lists@3@01))
    (and (= (inv@272@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@272@01 r i))
  :qid |list-fctOfInv|)))
(assert (forall ((r@271@01 $Ref)) (!
  (=>
    (and (not (Set_in r@271@01 s@269@01)) (Set_in r@271@01 lists@3@01))
    (= (inv@272@01 r@271@01 length@4@01) r@271@01))
  :pattern ((Set_in r@271@01 s@269@01))
  :pattern ((Set_in r@271@01 lists@3@01))
  :pattern ((inv@272@01 r@271@01 length@4@01))
  :qid |quant-u-159|)))
(assert (=
  ($Snap.second $t@270@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@270@01))
    ($Snap.second ($Snap.second $t@270@01)))))
(assert (= ($Snap.first ($Snap.second $t@270@01)) $Snap.unit))
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((Set_in r@273@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((Set_in r@273@01 s@269@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (and
    (or (not (Set_in r@273@01 lists@3@01)) (Set_in r@273@01 lists@3@01))
    (=>
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
      (and
        (not (Set_in r@273@01 s@269@01))
        (Set_in r@273@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@275@01  $PSF<list>)))
        (=>
          (and
            (not (Set_in (inv@272@01 r@273@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@273@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@273@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@273@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@273@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01)))
      (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@273@01 $Ref)) (!
  (=>
    (and (not (Set_in r@273@01 s@269@01)) (Set_in r@273@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@273@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :pattern ((Set_in r@273@01 lists@3@01))
  :pattern ((Set_in r@273@01 s@269@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@275@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@273@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@273@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(assert (=
  ($Snap.second ($Snap.second $t@270@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@270@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@270@01))))))
(assert (= $t@270@01 ($Snap.combine ($Snap.first $t@270@01) ($Snap.second $t@270@01))))
(assert (forall ((r@271@01 $Ref)) (!
  (=>
    (and (not (Set_in r@271@01 s@269@01)) (Set_in r@271@01 lists@3@01))
    (or (not (Set_in r@271@01 lists@3@01)) (Set_in r@271@01 lists@3@01)))
  :pattern ((Set_in r@271@01 s@269@01))
  :pattern ((Set_in r@271@01 lists@3@01))
  :pattern ((inv@272@01 r@271@01 length@4@01))
  :qid |list-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@269@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@269@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 86 | |s@269@01| > 0 | live]
; [else-branch: 86 | !(|s@269@01| > 0) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 86 | |s@269@01| > 0]
(assert (> (Set_card s@269@01) 0))
; [exec]
; var l2: Ref
(declare-const l2@333@01 $Ref)
; [exec]
; inhale (l2 in s)
(declare-const $t@334@01 $Snap)
(assert (= $t@334@01 $Snap.unit))
; [eval] (l2 in s)
(assert (Set_in l2@333@01 s@269@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; fold acc(list(l2, length), write)
; [eval] i > 0
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (> length@4@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 87 | length@4@01 > 0 | live]
; [else-branch: 87 | !(length@4@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 87 | length@4@01 > 0]
; Precomputing data for removing quantified permissions
(define-fun pTaken@335@01 ((r $Ref)) $Perm
  (ite
    (= r l2@333@01)
    ($Perm.min
      (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@335@01 r))
    $Perm.No)
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@333@01) (= (- $Perm.Write (pTaken@335@01 r)) $Perm.No))
  
  :qid |quant-u-198|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@336@01 $FVF<val>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in l2@333@01 ($FVF.domain_val (as sm@336@01  $FVF<val>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@278@01 l2@333@01) s@269@01)
  (=
    ($FVF.lookup_val (as sm@336@01  $FVF<val>) l2@333@01)
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) l2@333@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@337@01 ((r $Ref)) $Perm
  (ite
    (= r l2@333@01)
    ($Perm.min
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r))
    $Perm.No)
  
  :qid |quant-u-200|))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r l2@333@01) (= (- $Perm.Write (pTaken@337@01 r)) $Perm.No))
  
  :qid |quant-u-201|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@338@01 $FVF<next>)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in l2@333@01 ($FVF.domain_next (as sm@338@01  $FVF<next>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@283@01 l2@333@01) s@269@01)
  (=
    ($FVF.lookup_next (as sm@338@01  $FVF<next>) l2@333@01)
    ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) l2@333@01))))
(declare-const sm@339@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@283@01 r) s@269@01)
    (=
      ($FVF.lookup_next (as sm@339@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@339@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef150|)))
(declare-const pm@340@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@340@01  $FPM) r)
    (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@340@01  $FPM) r))
  :qid |qp.resPrmSumDef151|)))
(set-option :timeout 0)
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@340@01  $FPM) l2@333@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] i - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@341@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@342@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@341@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      (pTaken@341@01 r i))
    $Perm.No)
  
  :qid |quant-u-203|))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@341@01 r i)) $Perm.No))
  
  :qid |quant-u-204|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@299@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_in (inv@293@01 ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01) (-
    length@4@01
    1)) s@269@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@272@01 ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01) (-
        length@4@01
        1)) s@269@01))
    (Set_in (inv@272@01 ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (list%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@336@01  $FVF<val>) l2@333@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@338@01  $FVF<next>) l2@333@01))
    ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))))) l2@333@01 length@4@01))
(declare-const sm@343@01 $PSF<list>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap l2@333@01)
    ($SortWrappers.IntTo$Snap length@4@01)))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@336@01  $FVF<val>) l2@333@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@338@01  $FVF<next>) l2@333@01))
      ($PSF.lookup_list (as sm@299@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@339@01  $FVF<next>) l2@333@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
; [exec]
; s := (s setminus Set(l2))
; [eval] (s setminus Set(l2))
; [eval] Set(l2)
(declare-const s@344@01 Set<$Ref>)
(assert (Set_equal s@344@01 (Set_difference s@269@01 (Set_singleton l2@333@01))))
; Loop head block: Re-establish invariant
(declare-const r@345@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 88 | r@345@01 in lists@3@01 | live]
; [else-branch: 88 | !(r@345@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 88 | r@345@01 in lists@3@01]
(assert (Set_in r@345@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(push) ; 13
; [else-branch: 88 | !(r@345@01 in lists@3@01)]
(assert (not (Set_in r@345@01 lists@3@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@345@01 lists@3@01)) (Set_in r@345@01 lists@3@01)))
(assert (and (not (Set_in r@345@01 s@344@01)) (Set_in r@345@01 lists@3@01)))
(pop) ; 11
(declare-fun inv@346@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((r@345@01 $Ref)) (!
  (=>
    (and (not (Set_in r@345@01 s@344@01)) (Set_in r@345@01 lists@3@01))
    (or (not (Set_in r@345@01 lists@3@01)) (Set_in r@345@01 lists@3@01)))
  :pattern ((Set_in r@345@01 s@344@01))
  :pattern ((Set_in r@345@01 lists@3@01))
  :pattern ((inv@346@01 r@345@01 length@4@01))
  :qid |list-aux|)))
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@345@01 $Ref) (r2@345@01 $Ref)) (!
  (=>
    (and
      (and (not (Set_in r1@345@01 s@344@01)) (Set_in r1@345@01 lists@3@01))
      (and (not (Set_in r2@345@01 s@344@01)) (Set_in r2@345@01 lists@3@01))
      (= r1@345@01 r2@345@01))
    (= r1@345@01 r2@345@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@345@01 $Ref)) (!
  (=>
    (and (not (Set_in r@345@01 s@344@01)) (Set_in r@345@01 lists@3@01))
    (= (inv@346@01 r@345@01 length@4@01) r@345@01))
  :pattern ((Set_in r@345@01 s@344@01))
  :pattern ((Set_in r@345@01 lists@3@01))
  :pattern ((inv@346@01 r@345@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    (and (= (inv@346@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@346@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@347@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    ($Perm.min
      (ite (and (= r l2@333@01) (= i length@4@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@348@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@347@01 r i)))
    $Perm.No))
(define-fun pTaken@349@01 ((r $Ref) (i Int)) $Perm
  (ite
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    ($Perm.min
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (- (- $Perm.Write (pTaken@347@01 r i)) (pTaken@348@01 r i)))
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
(assert (not (=
  (-
    (ite
      (and (= l2@333@01 l2@333@01) (= length@4@01 length@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@347@01 l2@333@01 length@4@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    (= (- $Perm.Write (pTaken@347@01 r i)) $Perm.No))
  
  :qid |quant-u-208|))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@348@01 r i))
    $Perm.No)
  
  :qid |quant-u-209|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (not (Set_in (inv@346@01 r i) s@344@01))
      (Set_in (inv@346@01 r i) lists@3@01))
    (= (- (- $Perm.Write (pTaken@347@01 r i)) (pTaken@348@01 r i)) $Perm.No))
  
  :qid |quant-u-210|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@350@01 $PSF<list>)
(declare-const s@351@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@351@01 $Snap)) (!
  (and
    (=>
      (Set_in s@351@01 ($PSF.domain_list (as sm@350@01  $PSF<list>)))
      (and
        (not
          (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@344@01))
        (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01)))
    (=>
      (and
        (not
          (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@344@01))
        (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01))
      (Set_in s@351@01 ($PSF.domain_list (as sm@350@01  $PSF<list>)))))
  :pattern ((Set_in s@351@01 ($PSF.domain_list (as sm@350@01  $PSF<list>))))
  :qid |qp.psmDomDef155|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@351@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@344@01))
        (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) l2@333@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@351@01)) length@4@01)))
    (and
      (not (= s@351@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01)
        ($PSF.lookup_list (as sm@343@01  $PSF<list>) s@351@01))))
  :pattern (($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01))
  :pattern (($PSF.lookup_list (as sm@343@01  $PSF<list>) s@351@01))
  :qid |qp.psmValDef152|)))
(assert (forall ((s@351@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@344@01))
        (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01))
      (and
        (not
          (Set_in (inv@272@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@269@01))
        (Set_in (inv@272@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01)))
    (and
      (not (= s@351@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) s@351@01))))
  :pattern (($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) s@351@01))
  :qid |qp.psmValDef153|)))
(assert (forall ((s@351@01 $Snap)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@344@01))
        (Set_in (inv@346@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) lists@3@01))
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))) s@269@01)
            $Perm.Write
            $Perm.No)
          (pTaken@341@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@351@01)) ($SortWrappers.$SnapToInt ($Snap.second s@351@01))))))
    (and
      (not (= s@351@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@351@01))))
  :pattern (($PSF.lookup_list (as sm@350@01  $PSF<list>) s@351@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@351@01))
  :qid |qp.psmValDef154|)))
; [eval] (forall r: Ref :: { (r in lists) } { (r in s) } { allSet(r, length, v) } (r in lists) && !((r in s)) ==> allSet(r, length, v))
(declare-const r@352@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in lists) && !((r in s)) ==> allSet(r, length, v)
; [eval] (r in lists) && !((r in s))
; [eval] (r in lists)
(push) ; 12
; [then-branch: 89 | r@352@01 in lists@3@01 | live]
; [else-branch: 89 | !(r@352@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 89 | r@352@01 in lists@3@01]
(assert (Set_in r@352@01 lists@3@01))
; [eval] !((r in s))
; [eval] (r in s)
(pop) ; 13
(push) ; 13
; [else-branch: 89 | !(r@352@01 in lists@3@01)]
(assert (not (Set_in r@352@01 lists@3@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r@352@01 lists@3@01)) (Set_in r@352@01 lists@3@01)))
(push) ; 12
; [then-branch: 90 | !(r@352@01 in s@344@01) && r@352@01 in lists@3@01 | live]
; [else-branch: 90 | !(!(r@352@01 in s@344@01) && r@352@01 in lists@3@01) | live]
(push) ; 13
; [then-branch: 90 | !(r@352@01 in s@344@01) && r@352@01 in lists@3@01]
(assert (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
; [eval] allSet(r, length, v)
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= l2@333@01 r@352@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@353@01 ((r $Ref) (i Int) (r@352@01 $Ref)) $Perm
  (ite
    (and (= r r@352@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@354@01 ((r $Ref) (i Int) (r@352@01 $Ref)) $Perm
  (ite
    (and (= r r@352@01) (= i length@4@01))
    ($Perm.min
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (- $Perm.Write (pTaken@353@01 r i r@352@01)))
    $Perm.No))
(define-fun pTaken@355@01 ((r $Ref) (i Int) (r@352@01 $Ref)) $Perm
  (ite
    (and (= r r@352@01) (= i length@4@01))
    ($Perm.min
      (ite (and (= r l2@333@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@353@01 r i r@352@01))
        (pTaken@354@01 r i r@352@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@353@01 r i r@352@01))
    $Perm.No)
  
  :qid |quant-u-212|))))
(check-sat)
; unknown
(pop) ; 15
; 0.05s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@352@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@353@01 r i r@352@01)) $Perm.No))
  
  :qid |quant-u-213|))))
(check-sat)
; unknown
(pop) ; 15
; 0.06s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (pTaken@354@01 r i r@352@01))
    $Perm.No)
  
  :qid |quant-u-214|))))
(check-sat)
; unknown
(pop) ; 15
; 0.03s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@352@01) (= i length@4@01))
    (=
      (-
        (- $Perm.Write (pTaken@353@01 r i r@352@01))
        (pTaken@354@01 r i r@352@01))
      $Perm.No))
  
  :qid |quant-u-215|))))
(check-sat)
; unknown
(pop) ; 15
; 0.04s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (and (= l2@333@01 l2@333@01) (= length@4@01 length@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@355@01 l2@333@01 length@4@01 r@352@01))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 15
; 0.02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@352@01) (= i length@4@01))
    (=
      (-
        (-
          (- $Perm.Write (pTaken@353@01 r i r@352@01))
          (pTaken@354@01 r i r@352@01))
        (pTaken@355@01 r i r@352@01))
      $Perm.No))
  
  :qid |quant-u-217|))))
(check-sat)
; unsat
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@356@01 $PSF<list>)
(declare-const s@357@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@352@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
    (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
        $Perm.Write
        $Perm.No)
      (pTaken@341@01 r@352@01 length@4@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@352@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@352@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>)))
  (=>
    (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
      (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
          $Perm.Write
          $Perm.No)
        (pTaken@341@01 r@352@01 length@4@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 90 | !(!(r@352@01 in s@344@01) && r@352@01 in lists@3@01)]
(assert (not (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
  (and
    (not (Set_in r@352@01 s@344@01))
    (Set_in r@352@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@352@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>)))
    (=>
      (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@352@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
        (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@352@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
            $Perm.Write
            $Perm.No)
          (pTaken@341@01 r@352@01 length@4@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@352@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@352@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@352@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or
  (not (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
  (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@352@01 $Ref)) (!
  (and
    (or (not (Set_in r@352@01 lists@3@01)) (Set_in r@352@01 lists@3@01))
    (=>
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
      (and
        (not (Set_in r@352@01 s@344@01))
        (Set_in r@352@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>)))
        (=>
          (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
                $Perm.Write
                $Perm.No)
              (pTaken@341@01 r@352@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))))
  :pattern ((Set_in r@352@01 lists@3@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@352@01 $Ref)) (!
  (and
    (or (not (Set_in r@352@01 lists@3@01)) (Set_in r@352@01 lists@3@01))
    (=>
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
      (and
        (not (Set_in r@352@01 s@344@01))
        (Set_in r@352@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>)))
        (=>
          (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
                $Perm.Write
                $Perm.No)
              (pTaken@341@01 r@352@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))))
  :pattern ((Set_in r@352@01 s@344@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@352@01 $Ref)) (!
  (and
    (or (not (Set_in r@352@01 lists@3@01)) (Set_in r@352@01 lists@3@01))
    (=>
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
      (and
        (not (Set_in r@352@01 s@344@01))
        (Set_in r@352@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@356@01  $PSF<list>)))
        (=>
          (and (= r@352@01 l2@333@01) (= length@4@01 length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@272@01 r@352@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@352@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@293@01 r@352@01 length@4@01) s@269@01)
                $Perm.Write
                $Perm.No)
              (pTaken@341@01 r@352@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@352@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@352@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01)))
    (or
      (not (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :qid |prog.l53-aux|)))
(assert (forall ((r@352@01 $Ref)) (!
  (=>
    (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
    (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@352@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :pattern ((Set_in r@352@01 lists@3@01))
  :pattern ((Set_in r@352@01 s@344@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :qid |prog.l53_precondition|)))
(push) ; 11
(assert (not (forall ((r@352@01 $Ref)) (!
  (=>
    (and
      (=>
        (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
        (allSet%precondition ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@352@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
      (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01)))
    (allSet ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@352@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :pattern ((Set_in r@352@01 lists@3@01))
  :pattern ((Set_in r@352@01 s@344@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :qid |prog.l53|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (forall ((r@352@01 $Ref)) (!
  (=>
    (and (not (Set_in r@352@01 s@344@01)) (Set_in r@352@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@352@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :pattern ((Set_in r@352@01 lists@3@01))
  :pattern ((Set_in r@352@01 s@344@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@356@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@352@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@352@01 length@4@01 v@5@01))
  :qid |prog.l53|)))
(declare-const r@358@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@358@01 s@344@01))
(pop) ; 11
(declare-fun inv@359@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@358@01 $Ref) (r2@358@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@358@01 s@344@01)
      (Set_in r2@358@01 s@344@01)
      (= r1@358@01 r2@358@01))
    (= r1@358@01 r2@358@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@358@01 $Ref)) (!
  (=> (Set_in r@358@01 s@344@01) (= (inv@359@01 r@358@01) r@358@01))
  :pattern ((Set_in r@358@01 s@344@01))
  :pattern ((inv@359@01 r@358@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@359@01 r) s@344@01) (= (inv@359@01 r) r))
  :pattern ((inv@359@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@360@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@359@01 r) s@344@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@335@01 r))
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@335@01 r))
      (pTaken@360@01 r))
    $Perm.No)
  
  :qid |quant-u-220|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@359@01 r) s@344@01)
    (= (- $Perm.Write (pTaken@360@01 r)) $Perm.No))
  
  :qid |quant-u-221|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@361@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@361@01  $FVF<val>)))
      (Set_in (inv@359@01 r) s@344@01))
    (=>
      (Set_in (inv@359@01 r) s@344@01)
      (Set_in r ($FVF.domain_val (as sm@361@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@361@01  $FVF<val>))))
  :qid |qp.fvfDomDef161|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@359@01 r) s@344@01)
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
          (pTaken@335@01 r))))
    (=
      ($FVF.lookup_val (as sm@361@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@361@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef160|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> r.val == v)
(declare-const r@362@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> r.val == v
; [eval] (r in s)
(push) ; 12
; [then-branch: 91 | r@362@01 in s@344@01 | live]
; [else-branch: 91 | !(r@362@01 in s@344@01) | live]
(push) ; 13
; [then-branch: 91 | r@362@01 in s@344@01]
(assert (Set_in r@362@01 s@344@01))
; [eval] r.val == v
(declare-const sm@363@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@335@01 r)))
    (=
      ($FVF.lookup_val (as sm@363@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@363@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef162|)))
(declare-const pm@364@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@364@01  $FPM) r)
    (-
      (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@335@01 r)))
  :pattern (($FVF.perm_val (as pm@364@01  $FPM) r))
  :qid |qp.resPrmSumDef163|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_val (as pm@364@01  $FPM) r@362@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 91 | !(r@362@01 in s@344@01)]
(assert (not (Set_in r@362@01 s@344@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@335@01 r)))
    (=
      ($FVF.lookup_val (as sm@363@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@363@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef162|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@364@01  $FPM) r)
    (-
      (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@335@01 r)))
  :pattern (($FVF.perm_val (as pm@364@01  $FPM) r))
  :qid |qp.resPrmSumDef163|)))
; Joined path conditions
(assert (or (not (Set_in r@362@01 s@344@01)) (Set_in r@362@01 s@344@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@335@01 r)))
    (=
      ($FVF.lookup_val (as sm@363@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@363@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@270@01)))) r))
  :qid |qp.fvfValDef162|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@364@01  $FPM) r)
    (-
      (ite (Set_in (inv@278@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@335@01 r)))
  :pattern (($FVF.perm_val (as pm@364@01  $FPM) r))
  :qid |qp.resPrmSumDef163|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@362@01 $Ref)) (!
  (or (not (Set_in r@362@01 s@344@01)) (Set_in r@362@01 s@344@01))
  :pattern ((Set_in r@362@01 s@344@01))
  :qid |prog.l54-aux|)))
(push) ; 11
(assert (not (forall ((r@362@01 $Ref)) (!
  (=>
    (Set_in r@362@01 s@344@01)
    (= ($FVF.lookup_val (as sm@363@01  $FVF<val>) r@362@01) v@5@01))
  :pattern ((Set_in r@362@01 s@344@01))
  :qid |prog.l54|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@362@01 $Ref)) (!
  (=>
    (Set_in r@362@01 s@344@01)
    (= ($FVF.lookup_val (as sm@363@01  $FVF<val>) r@362@01) v@5@01))
  :pattern ((Set_in r@362@01 s@344@01))
  :qid |prog.l54|)))
(declare-const r@365@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@365@01 s@344@01))
(pop) ; 11
(declare-fun inv@366@01 ($Ref) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@365@01 $Ref) (r2@365@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@365@01 s@344@01)
      (Set_in r2@365@01 s@344@01)
      (= r1@365@01 r2@365@01))
    (= r1@365@01 r2@365@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@365@01 $Ref)) (!
  (=> (Set_in r@365@01 s@344@01) (= (inv@366@01 r@365@01) r@365@01))
  :pattern ((Set_in r@365@01 s@344@01))
  :pattern ((inv@366@01 r@365@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (Set_in (inv@366@01 r) s@344@01) (= (inv@366@01 r) r))
  :pattern ((inv@366@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@367@01 ((r $Ref)) $Perm
  (ite
    (Set_in (inv@366@01 r) s@344@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r))
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r))
      (pTaken@367@01 r))
    $Perm.No)
  
  :qid |quant-u-224|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@366@01 r) s@344@01)
    (= (- $Perm.Write (pTaken@367@01 r)) $Perm.No))
  
  :qid |quant-u-225|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@368@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@368@01  $FVF<next>)))
      (Set_in (inv@366@01 r) s@344@01))
    (=>
      (Set_in (inv@366@01 r) s@344@01)
      (Set_in r ($FVF.domain_next (as sm@368@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@368@01  $FVF<next>))))
  :qid |qp.fvfDomDef165|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@366@01 r) s@344@01)
      (<
        $Perm.No
        (-
          (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
          (pTaken@337@01 r))))
    (=
      ($FVF.lookup_next (as sm@368@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@368@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef164|)))
; [eval] (forall r1: Ref, r2: Ref :: { (r1 in s), (r2 in s) } (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next)
(declare-const r1@369@01 $Ref)
(declare-const r2@370@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r1 in s) && ((r2 in s) && r1 != r2) ==> r1.next != r2.next
; [eval] (r1 in s) && ((r2 in s) && r1 != r2)
; [eval] (r1 in s)
(push) ; 12
; [then-branch: 92 | r1@369@01 in s@344@01 | live]
; [else-branch: 92 | !(r1@369@01 in s@344@01) | live]
(push) ; 13
; [then-branch: 92 | r1@369@01 in s@344@01]
(assert (Set_in r1@369@01 s@344@01))
; [eval] (r2 in s)
(push) ; 14
; [then-branch: 93 | r2@370@01 in s@344@01 | live]
; [else-branch: 93 | !(r2@370@01 in s@344@01) | live]
(push) ; 15
; [then-branch: 93 | r2@370@01 in s@344@01]
(assert (Set_in r2@370@01 s@344@01))
; [eval] r1 != r2
(pop) ; 15
(push) ; 15
; [else-branch: 93 | !(r2@370@01 in s@344@01)]
(assert (not (Set_in r2@370@01 s@344@01)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in r2@370@01 s@344@01)) (Set_in r2@370@01 s@344@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 92 | !(r1@369@01 in s@344@01)]
(assert (not (Set_in r1@369@01 s@344@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (Set_in r1@369@01 s@344@01)
  (and
    (Set_in r1@369@01 s@344@01)
    (or (not (Set_in r2@370@01 s@344@01)) (Set_in r2@370@01 s@344@01)))))
; Joined path conditions
(assert (or (not (Set_in r1@369@01 s@344@01)) (Set_in r1@369@01 s@344@01)))
(push) ; 12
; [then-branch: 94 | r1@369@01 != r2@370@01 && r2@370@01 in s@344@01 && r1@369@01 in s@344@01 | live]
; [else-branch: 94 | !(r1@369@01 != r2@370@01 && r2@370@01 in s@344@01 && r1@369@01 in s@344@01) | live]
(push) ; 13
; [then-branch: 94 | r1@369@01 != r2@370@01 && r2@370@01 in s@344@01 && r1@369@01 in s@344@01]
(assert (and
  (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
  (Set_in r1@369@01 s@344@01)))
; [eval] r1.next != r2.next
(declare-const sm@371@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@371@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@371@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef166|)))
(declare-const pm@372@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@372@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@372@01  $FPM) r))
  :qid |qp.resPrmSumDef167|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@372@01  $FPM) r1@369@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(declare-const sm@373@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@373@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@373@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef168|)))
(declare-const pm@374@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@374@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef169|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@374@01  $FPM) r2@370@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(push) ; 13
; [else-branch: 94 | !(r1@369@01 != r2@370@01 && r2@370@01 in s@344@01 && r1@369@01 in s@344@01)]
(assert (not
  (and
    (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
    (Set_in r1@369@01 s@344@01))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@371@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@371@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef166|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@372@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@372@01  $FPM) r))
  :qid |qp.resPrmSumDef167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@373@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@373@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef168|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@374@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef169|)))
(assert (=>
  (and
    (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
    (Set_in r1@369@01 s@344@01))
  (and
    (not (= r1@369@01 r2@370@01))
    (Set_in r2@370@01 s@344@01)
    (Set_in r1@369@01 s@344@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
      (Set_in r1@369@01 s@344@01)))
  (and
    (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
    (Set_in r1@369@01 s@344@01))))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@371@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@371@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef166|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@372@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@372@01  $FPM) r))
  :qid |qp.resPrmSumDef167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@373@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@373@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef168|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@374@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@374@01  $FPM) r))
  :qid |qp.resPrmSumDef169|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r1@369@01 $Ref) (r2@370@01 $Ref)) (!
  (and
    (=>
      (Set_in r1@369@01 s@344@01)
      (and
        (Set_in r1@369@01 s@344@01)
        (or (not (Set_in r2@370@01 s@344@01)) (Set_in r2@370@01 s@344@01))))
    (or (not (Set_in r1@369@01 s@344@01)) (Set_in r1@369@01 s@344@01))
    (=>
      (and
        (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
        (Set_in r1@369@01 s@344@01))
      (and
        (not (= r1@369@01 r2@370@01))
        (Set_in r2@370@01 s@344@01)
        (Set_in r1@369@01 s@344@01)))
    (or
      (not
        (and
          (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
          (Set_in r1@369@01 s@344@01)))
      (and
        (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
        (Set_in r1@369@01 s@344@01))))
  :pattern ((Set_in r1@369@01 s@344@01) (Set_in r2@370@01 s@344@01))
  :qid |prog.l55-aux|)))
(push) ; 11
(assert (not (forall ((r1@369@01 $Ref) (r2@370@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
      (Set_in r1@369@01 s@344@01))
    (not
      (=
        ($FVF.lookup_next (as sm@371@01  $FVF<next>) r1@369@01)
        ($FVF.lookup_next (as sm@373@01  $FVF<next>) r2@370@01))))
  :pattern ((Set_in r1@369@01 s@344@01) (Set_in r2@370@01 s@344@01))
  :qid |prog.l55|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r1@369@01 $Ref) (r2@370@01 $Ref)) (!
  (=>
    (and
      (and (not (= r1@369@01 r2@370@01)) (Set_in r2@370@01 s@344@01))
      (Set_in r1@369@01 s@344@01))
    (not
      (=
        ($FVF.lookup_next (as sm@371@01  $FVF<next>) r1@369@01)
        ($FVF.lookup_next (as sm@373@01  $FVF<next>) r2@370@01))))
  :pattern ((Set_in r1@369@01 s@344@01) (Set_in r2@370@01 s@344@01))
  :qid |prog.l55|)))
(declare-const r@375@01 $Ref)
(push) ; 11
; [eval] (r in s)
(assert (Set_in r@375@01 s@344@01))
(declare-const sm@376@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@376@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@376@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef170|)))
(declare-const pm@377@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@377@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@377@01  $FPM) r))
  :qid |qp.resPrmSumDef171|)))
(push) ; 12
(assert (not (< $Perm.No ($FVF.perm_next (as pm@377@01  $FPM) r@375@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(pop) ; 11
(declare-fun inv@378@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@376@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@376@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef170|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@377@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@377@01  $FPM) r))
  :qid |qp.resPrmSumDef171|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 11
(assert (not (forall ((r1@375@01 $Ref) (r2@375@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@375@01 s@344@01)
      (Set_in r2@375@01 s@344@01)
      (=
        ($FVF.lookup_next (as sm@376@01  $FVF<next>) r1@375@01)
        ($FVF.lookup_next (as sm@376@01  $FVF<next>) r2@375@01)))
    (= r1@375@01 r2@375@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@375@01 $Ref)) (!
  (=>
    (Set_in r@375@01 s@344@01)
    (=
      (inv@378@01 ($FVF.lookup_next (as sm@376@01  $FVF<next>) r@375@01) (-
        length@4@01
        1))
      r@375@01))
  :pattern (($FVF.lookup_next (as sm@376@01  $FVF<next>) r@375@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@378@01 r i) s@344@01)
    (and
      (= ($FVF.lookup_next (as sm@376@01  $FVF<next>) (inv@378@01 r i)) r)
      (= (- length@4@01 1) i)))
  :pattern ((inv@378@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@379@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@378@01 r i) s@344@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@380@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@378@01 r i) s@344@01)
    ($Perm.min
      (-
        (ite (and (= r l2@333@01) (= i length@4@01)) $Perm.Write $Perm.No)
        (pTaken@347@01 r i))
      (- $Perm.Write (pTaken@379@01 r i)))
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
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (pTaken@379@01 r i))
    $Perm.No)
  
  :qid |quant-u-228|))))
(check-sat)
; unsat
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@378@01 r i) s@344@01)
    (= (- $Perm.Write (pTaken@379@01 r i)) $Perm.No))
  
  :qid |quant-u-229|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@381@01 $PSF<list>)
(declare-const s@382@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@382@01 $Snap)) (!
  (and
    (=>
      (Set_in s@382@01 ($PSF.domain_list (as sm@381@01  $PSF<list>)))
      (Set_in (inv@378@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))) s@344@01))
    (=>
      (Set_in (inv@378@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))) s@344@01)
      (Set_in s@382@01 ($PSF.domain_list (as sm@381@01  $PSF<list>)))))
  :pattern ((Set_in s@382@01 ($PSF.domain_list (as sm@381@01  $PSF<list>))))
  :qid |qp.psmDomDef174|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@382@01 $Snap)) (!
  (=>
    (and
      (Set_in (inv@378@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))) s@344@01)
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))) s@269@01)
            $Perm.Write
            $Perm.No)
          (pTaken@341@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))))))
    (and
      (not (= s@382@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@381@01  $PSF<list>) s@382@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@382@01))))
  :pattern (($PSF.lookup_list (as sm@381@01  $PSF<list>) s@382@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@382@01))
  :qid |qp.psmValDef172|)))
(assert (forall ((s@382@01 $Snap)) (!
  (=>
    (and
      (Set_in (inv@378@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))) s@344@01)
      (<
        $Perm.No
        (-
          (ite
            (and
              (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) l2@333@01)
              (= ($SortWrappers.$SnapToInt ($Snap.second s@382@01)) length@4@01))
            $Perm.Write
            $Perm.No)
          (pTaken@347@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@382@01)) ($SortWrappers.$SnapToInt ($Snap.second s@382@01))))))
    (and
      (not (= s@382@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@381@01  $PSF<list>) s@382@01)
        ($PSF.lookup_list (as sm@343@01  $PSF<list>) s@382@01))))
  :pattern (($PSF.lookup_list (as sm@381@01  $PSF<list>) s@382@01))
  :pattern (($PSF.lookup_list (as sm@343@01  $PSF<list>) s@382@01))
  :qid |qp.psmValDef173|)))
; [eval] (forall r: Ref :: { (r in s) } (r in s) ==> allSet(r.next, length - 1, v))
(declare-const r@383@01 $Ref)
(set-option :timeout 0)
(push) ; 11
; [eval] (r in s) ==> allSet(r.next, length - 1, v)
; [eval] (r in s)
(push) ; 12
; [then-branch: 95 | r@383@01 in s@344@01 | live]
; [else-branch: 95 | !(r@383@01 in s@344@01) | live]
(push) ; 13
; [then-branch: 95 | r@383@01 in s@344@01]
(assert (Set_in r@383@01 s@344@01))
; [eval] allSet(r.next, length - 1, v)
(declare-const sm@384@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@384@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@384@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef175|)))
(declare-const pm@385@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@385@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@385@01  $FPM) r))
  :qid |qp.resPrmSumDef176|)))
(push) ; 14
(assert (not (< $Perm.No ($FVF.perm_next (as pm@385@01  $FPM) r@383@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] length - 1
(push) ; 14
(push) ; 15
(set-option :timeout 10)
(assert (not (= l2@333@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@386@01 ((r $Ref) (i Int) (r@383@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@387@01 ((r $Ref) (i Int) (r@383@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (- $Perm.Write (pTaken@386@01 r i r@383@01)))
    $Perm.No))
(define-fun pTaken@388@01 ((r $Ref) (i Int) (r@383@01 $Ref)) $Perm
  (ite
    (and
      (= r ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      (= i (- length@4@01 1)))
    ($Perm.min
      (ite (and (= r l2@333@01) (= i length@4@01)) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@386@01 r i r@383@01))
        (pTaken@387@01 r i r@383@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@386@01 r i r@383@01))
    $Perm.No)
  
  :qid |quant-u-231|))))
(check-sat)
; unknown
(pop) ; 15
; 0.06s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      (= i (- length@4@01 1)))
    (= (- $Perm.Write (pTaken@386@01 r i r@383@01)) $Perm.No))
  
  :qid |quant-u-232|))))
(check-sat)
; unknown
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
        (pTaken@341@01 r i))
      (pTaken@387@01 r i r@383@01))
    $Perm.No)
  
  :qid |quant-u-233|))))
(check-sat)
; unknown
(pop) ; 15
; 0.05s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and
      (= r ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      (= i (- length@4@01 1)))
    (=
      (-
        (- $Perm.Write (pTaken@386@01 r i r@383@01))
        (pTaken@387@01 r i r@383@01))
      $Perm.No))
  
  :qid |quant-u-234|))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@389@01 $PSF<list>)
(declare-const s@390@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@389@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (= ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) l2@333@01)
    (= (- length@4@01 1) length@4@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (and
    (not
      (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
        length@4@01
        1)) s@269@01))
    (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
      length@4@01
      1)) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (Set_in (inv@293@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1)) s@269@01)
        $Perm.Write
        $Perm.No)
      (pTaken@341@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
        length@4@01
        1))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
        ($SortWrappers.IntTo$Snap (- length@4@01 1))))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
  ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
  length@4@01
  1) v@5@01))
(pop) ; 14
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@389@01  $PSF<list>)))
  (=>
    (and
      (= ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) l2@333@01)
      (= (- length@4@01 1) length@4@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (and
      (not
        (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1)) s@269@01))
      (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
        length@4@01
        1)) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@293@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
            length@4@01
            1)) s@269@01)
          $Perm.Write
          $Perm.No)
        (pTaken@341@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
  (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
    ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
    length@4@01
    1) v@5@01)))
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 95 | !(r@383@01 in s@344@01)]
(assert (not (Set_in r@383@01 s@344@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@384@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@384@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef175|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@385@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@385@01  $FPM) r))
  :qid |qp.resPrmSumDef176|)))
(assert (=>
  (Set_in r@383@01 s@344@01)
  (and
    (Set_in r@383@01 s@344@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@389@01  $PSF<list>)))
    (=>
      (and
        (= ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) l2@333@01)
        (= (- length@4@01 1) length@4@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (and
        (not
          (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
            length@4@01
            1)) s@269@01))
        (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1)) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (=>
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@293@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
              length@4@01
              1)) s@269@01)
            $Perm.Write
            $Perm.No)
          (pTaken@341@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
            length@4@01
            1))))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
              ($SortWrappers.IntTo$Snap (- length@4@01 1)))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1))))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
            ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
    (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
      length@4@01
      1) v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@383@01 s@344@01)) (Set_in r@383@01 s@344@01)))
(pop) ; 11
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
        (pTaken@337@01 r)))
    (=
      ($FVF.lookup_next (as sm@384@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@384@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))) r))
  :qid |qp.fvfValDef175|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@385@01  $FPM) r)
    (-
      (ite (Set_in (inv@283@01 r) s@269@01) $Perm.Write $Perm.No)
      (pTaken@337@01 r)))
  :pattern (($FVF.perm_next (as pm@385@01  $FPM) r))
  :qid |qp.resPrmSumDef176|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@383@01 $Ref)) (!
  (and
    (=>
      (Set_in r@383@01 s@344@01)
      (and
        (Set_in r@383@01 s@344@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1))) ($PSF.domain_list (as sm@389@01  $PSF<list>)))
        (=>
          (and
            (= ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) l2@333@01)
            (= (- length@4@01 1) length@4@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list (as sm@343@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (and
            (not
              (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
                length@4@01
                1)) s@269@01))
            (Set_in (inv@272@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
              length@4@01
              1)) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@293@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
                  length@4@01
                  1)) s@269@01)
                $Perm.Write
                $Perm.No)
              (pTaken@341@01 ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
                length@4@01
                1))))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                  ($SortWrappers.IntTo$Snap (- length@4@01 1)))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1))))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
                ($SortWrappers.IntTo$Snap (- length@4@01 1)))))))
        (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1) v@5@01)))
    (or (not (Set_in r@383@01 s@344@01)) (Set_in r@383@01 s@344@01)))
  :pattern ((Set_in r@383@01 s@344@01))
  :qid |prog.l57-aux|)))
(assert (forall ((r@383@01 $Ref)) (!
  (=>
    (Set_in r@383@01 s@344@01)
    (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@383@01 s@344@01))
  :qid |prog.l57_precondition|)))
(push) ; 11
(assert (not (forall ((r@383@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@383@01 s@344@01)
        (allSet%precondition ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
          ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
          length@4@01
          1) v@5@01))
      (Set_in r@383@01 s@344@01))
    (allSet ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@383@01 s@344@01))
  :qid |prog.l57|))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@383@01 $Ref)) (!
  (=>
    (Set_in r@383@01 s@344@01)
    (allSet ($PSF.lookup_list (as sm@389@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01))
      ($SortWrappers.IntTo$Snap (- length@4@01 1)))) ($FVF.lookup_next (as sm@384@01  $FVF<next>) r@383@01) (-
      length@4@01
      1) v@5@01))
  :pattern ((Set_in r@383@01 s@344@01))
  :qid |prog.l57|)))
(pop) ; 10
(pop) ; 9
(push) ; 9
; [else-branch: 86 | !(|s@269@01| > 0)]
(assert (not (> (Set_card s@269@01) 0)))
(pop) ; 9
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(push) ; 9
(set-option :timeout 10)
(assert (not (> (Set_card s@269@01) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> (Set_card s@269@01) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 96 | !(|s@269@01| > 0) | live]
; [else-branch: 96 | |s@269@01| > 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 96 | !(|s@269@01| > 0)]
(assert (not (> (Set_card s@269@01) 0)))
(declare-const r@391@01 $Ref)
(push) ; 10
; [eval] (r in lists)
(assert (Set_in r@391@01 lists@3@01))
(pop) ; 10
(declare-fun inv@392@01 ($Ref Int) $Ref)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((r1@391@01 $Ref) (r2@391@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@391@01 lists@3@01)
      (Set_in r2@391@01 lists@3@01)
      (= r1@391@01 r2@391@01))
    (= r1@391@01 r2@391@01))
  
  :qid |list-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@391@01 $Ref)) (!
  (=>
    (Set_in r@391@01 lists@3@01)
    (= (inv@392@01 r@391@01 length@4@01) r@391@01))
  :pattern ((Set_in r@391@01 lists@3@01))
  :pattern ((inv@392@01 r@391@01 length@4@01))
  :qid |list-invOfFct|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@392@01 r i) lists@3@01)
    (and (= (inv@392@01 r i) r) (= length@4@01 i)))
  :pattern ((inv@392@01 r i))
  :qid |list-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@393@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@392@01 r i) lists@3@01)
    ($Perm.min
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@325@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@394@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@392@01 r i) lists@3@01)
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@393@01 r i)))
    $Perm.No))
(define-fun pTaken@395@01 ((r $Ref) (i Int)) $Perm
  (ite
    (Set_in (inv@392@01 r i) lists@3@01)
    ($Perm.min
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@393@01 r i)) (pTaken@394@01 r i)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@325@01 r i))
      (pTaken@393@01 r i))
    $Perm.No)
  
  :qid |quant-u-237|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@392@01 r i) lists@3@01)
    (= (- $Perm.Write (pTaken@393@01 r i)) $Perm.No))
  
  :qid |quant-u-238|))))
(check-sat)
; unknown
(pop) ; 10
; 0.03s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@394@01 r i))
    $Perm.No)
  
  :qid |quant-u-239|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (Set_in (inv@392@01 r i) lists@3@01)
    (= (- (- $Perm.Write (pTaken@393@01 r i)) (pTaken@394@01 r i)) $Perm.No))
  
  :qid |quant-u-240|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@396@01 $PSF<list>)
(declare-const s@397@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@397@01 $Snap)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@397@01)) ($SortWrappers.$SnapToInt ($Snap.second s@397@01))) sNext@19@01)
          $Perm.Write
          $Perm.No)
        (pTaken@325@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@397@01)) ($SortWrappers.$SnapToInt ($Snap.second s@397@01)))))
    (and
      (not (= s@397@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@397@01))))
  :pattern (($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) s@397@01))
  :qid |qp.psmValDef181|)))
(assert (forall ((s@397@01 $Snap)) (!
  (=>
    (and
      (not
        (Set_in (inv@272@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@397@01)) ($SortWrappers.$SnapToInt ($Snap.second s@397@01))) s@269@01))
      (Set_in (inv@272@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@397@01)) ($SortWrappers.$SnapToInt ($Snap.second s@397@01))) lists@3@01))
    (and
      (not (= s@397@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) s@397@01))))
  :pattern (($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) s@397@01))
  :qid |qp.psmValDef182|)))
(assert (forall ((s@397@01 $Snap)) (!
  (=>
    (Set_in (inv@293@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@397@01)) ($SortWrappers.$SnapToInt ($Snap.second s@397@01))) s@269@01)
    (and
      (not (= s@397@01 $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01)
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@397@01))))
  :pattern (($PSF.lookup_list (as sm@396@01  $PSF<list>) s@397@01))
  :pattern (($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) s@397@01))
  :qid |qp.psmValDef183|)))
; [eval] (forall r: Ref :: { (r in lists) } { allSet(r, length, v) } (r in lists) ==> allSet(r, length, v))
(declare-const r@398@01 $Ref)
(set-option :timeout 0)
(push) ; 10
; [eval] (r in lists) ==> allSet(r, length, v)
; [eval] (r in lists)
(push) ; 11
; [then-branch: 97 | r@398@01 in lists@3@01 | live]
; [else-branch: 97 | !(r@398@01 in lists@3@01) | live]
(push) ; 12
; [then-branch: 97 | r@398@01 in lists@3@01]
(assert (Set_in r@398@01 lists@3@01))
; [eval] allSet(r, length, v)
(push) ; 13
; Precomputing data for removing quantified permissions
(define-fun pTaken@399@01 ((r $Ref) (i Int) (r@398@01 $Ref)) $Perm
  (ite
    (and (= r r@398@01) (= i length@4@01))
    ($Perm.min
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@325@01 r i))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@400@01 ((r $Ref) (i Int) (r@398@01 $Ref)) $Perm
  (ite
    (and (= r r@398@01) (= i length@4@01))
    ($Perm.min
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@399@01 r i r@398@01)))
    $Perm.No))
(define-fun pTaken@401@01 ((r $Ref) (i Int) (r@398@01 $Ref)) $Perm
  (ite
    (and (= r r@398@01) (= i length@4@01))
    ($Perm.min
      (ite (Set_in (inv@293@01 r i) s@269@01) $Perm.Write $Perm.No)
      (-
        (- $Perm.Write (pTaken@399@01 r i r@398@01))
        (pTaken@400@01 r i r@398@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (-
        (ite (Set_in (inv@26@01 r i) sNext@19@01) $Perm.Write $Perm.No)
        (pTaken@325@01 r i))
      (pTaken@399@01 r i r@398@01))
    $Perm.No)
  
  :qid |quant-u-242|))))
(check-sat)
; unknown
(pop) ; 14
; 0.50s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@398@01) (= i length@4@01))
    (= (- $Perm.Write (pTaken@399@01 r i r@398@01)) $Perm.No))
  
  :qid |quant-u-243|))))
(check-sat)
; unknown
(pop) ; 14
; 0.19s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and
          (not (Set_in (inv@272@01 r i) s@269@01))
          (Set_in (inv@272@01 r i) lists@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@400@01 r i r@398@01))
    $Perm.No)
  
  :qid |quant-u-244|))))
(check-sat)
; unknown
(pop) ; 14
; 0.45s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@398@01) (= i length@4@01))
    (=
      (-
        (- $Perm.Write (pTaken@399@01 r i r@398@01))
        (pTaken@400@01 r i r@398@01))
      $Perm.No))
  
  :qid |quant-u-245|))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@402@01 $PSF<list>)
(declare-const s@403@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
(assert (Set_in ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@398@01)
  ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@402@01  $PSF<list>))))
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (Set_in (inv@26@01 r@398@01 length@4@01) sNext@19@01)
        $Perm.Write
        $Perm.No)
      (pTaken@325@01 r@398@01 length@4@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (and
    (not (Set_in (inv@272@01 r@398@01 length@4@01) s@269@01))
    (Set_in (inv@272@01 r@398@01 length@4@01) lists@3@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (=>
  (Set_in (inv@293@01 r@398@01 length@4@01) s@269@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))
        $Snap.unit))
    (=
      ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))
      ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@398@01)
        ($SortWrappers.IntTo$Snap length@4@01)))))))
(assert (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@398@01)
  ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (Set_in ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@402@01  $PSF<list>)))
  (=>
    (<
      $Perm.No
      (-
        (ite
          (Set_in (inv@26@01 r@398@01 length@4@01) sNext@19@01)
          $Perm.Write
          $Perm.No)
        (pTaken@325@01 r@398@01 length@4@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (and
      (not (Set_in (inv@272@01 r@398@01 length@4@01) s@269@01))
      (Set_in (inv@272@01 r@398@01 length@4@01) lists@3@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (=>
    (Set_in (inv@293@01 r@398@01 length@4@01) s@269@01)
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))
          $Snap.unit))
      (=
        ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01)))
        ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))))))
  (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01)))
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 97 | !(r@398@01 in lists@3@01)]
(assert (not (Set_in r@398@01 lists@3@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (Set_in r@398@01 lists@3@01)
  (and
    (Set_in r@398@01 lists@3@01)
    (Set_in ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@398@01)
      ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@402@01  $PSF<list>)))
    (=>
      (<
        $Perm.No
        (-
          (ite
            (Set_in (inv@26@01 r@398@01 length@4@01) sNext@19@01)
            $Perm.Write
            $Perm.No)
          (pTaken@325@01 r@398@01 length@4@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@398@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (and
        (not (Set_in (inv@272@01 r@398@01 length@4@01) s@269@01))
        (Set_in (inv@272@01 r@398@01 length@4@01) lists@3@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@398@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (=>
      (Set_in (inv@293@01 r@398@01 length@4@01) s@269@01)
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@398@01)
              ($SortWrappers.IntTo$Snap length@4@01))
            $Snap.unit))
        (=
          ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01)))
          ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@398@01)
            ($SortWrappers.IntTo$Snap length@4@01))))))
    (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@398@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))))
; Joined path conditions
(assert (or (not (Set_in r@398@01 lists@3@01)) (Set_in r@398@01 lists@3@01)))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@398@01 $Ref)) (!
  (and
    (=>
      (Set_in r@398@01 lists@3@01)
      (and
        (Set_in r@398@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@402@01  $PSF<list>)))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@26@01 r@398@01 length@4@01) sNext@19@01)
                $Perm.Write
                $Perm.No)
              (pTaken@325@01 r@398@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@272@01 r@398@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@398@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@293@01 r@398@01 length@4@01) s@269@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01)))
    (or (not (Set_in r@398@01 lists@3@01)) (Set_in r@398@01 lists@3@01)))
  :pattern ((Set_in r@398@01 lists@3@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@398@01 $Ref)) (!
  (and
    (=>
      (Set_in r@398@01 lists@3@01)
      (and
        (Set_in r@398@01 lists@3@01)
        (Set_in ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01)) ($PSF.domain_list (as sm@402@01  $PSF<list>)))
        (=>
          (<
            $Perm.No
            (-
              (ite
                (Set_in (inv@26@01 r@398@01 length@4@01) sNext@19@01)
                $Perm.Write
                $Perm.No)
              (pTaken@325@01 r@398@01 length@4@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second $t@20@01)))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (and
            (not (Set_in (inv@272@01 r@398@01 length@4@01) s@269@01))
            (Set_in (inv@272@01 r@398@01 length@4@01) lists@3@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first $t@270@01)) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (=>
          (Set_in (inv@293@01 r@398@01 length@4@01) s@269@01)
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@398@01)
                  ($SortWrappers.IntTo$Snap length@4@01))
                $Snap.unit))
            (=
              ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01)))
              ($PSF.lookup_list ($SortWrappers.$SnapTo$PSF<list> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@270@01)))))))) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@398@01)
                ($SortWrappers.IntTo$Snap length@4@01))))))
        (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01)))
    (or (not (Set_in r@398@01 lists@3@01)) (Set_in r@398@01 lists@3@01)))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :qid |prog.l26-aux|)))
(assert (forall ((r@398@01 $Ref)) (!
  (=>
    (Set_in r@398@01 lists@3@01)
    (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@398@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :pattern ((Set_in r@398@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :qid |prog.l26_precondition|)))
(push) ; 10
(assert (not (forall ((r@398@01 $Ref)) (!
  (=>
    (and
      (=>
        (Set_in r@398@01 lists@3@01)
        (allSet%precondition ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@398@01)
          ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
      (Set_in r@398@01 lists@3@01))
    (allSet ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@398@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :pattern ((Set_in r@398@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :qid |prog.l26|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (forall ((r@398@01 $Ref)) (!
  (=>
    (Set_in r@398@01 lists@3@01)
    (allSet ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@398@01)
      ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :pattern ((Set_in r@398@01 lists@3@01))
  :pattern ((allSet%limited ($PSF.lookup_list (as sm@402@01  $PSF<list>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@398@01)
    ($SortWrappers.IntTo$Snap length@4@01))) r@398@01 length@4@01 v@5@01))
  :qid |prog.l26|)))
(pop) ; 9
(push) ; 9
; [else-branch: 96 | |s@269@01| > 0]
(assert (> (Set_card s@269@01) 0))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 69 | length@4@01 - 1 > 0]
(assert (> (- length@4@01 1) 0))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 38 | |s@18@01| > 0]
(assert (> (Set_card s@18@01) 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
