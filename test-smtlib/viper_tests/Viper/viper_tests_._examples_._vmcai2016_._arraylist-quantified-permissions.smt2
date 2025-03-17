(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:14:03
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._examples_._vmcai2016_._arraylist-quantified-permissions.vpr
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
(declare-sort Set<Array_> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array_ 0)
(declare-sort Pair<Array~_Int> 0)
(declare-sort $FVF<val> 0)
(declare-sort $FVF<elems> 0)
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
(declare-fun $SortWrappers.Set<Array_>To$Snap (Set<Array_>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Array_> ($Snap) Set<Array_>)
(assert (forall ((x Set<Array_>)) (!
    (= x ($SortWrappers.$SnapToSet<Array_>($SortWrappers.Set<Array_>To$Snap x)))
    :pattern (($SortWrappers.Set<Array_>To$Snap x))
    :qid |$Snap.$SnapToSet<Array_>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Array_>To$Snap($SortWrappers.$SnapToSet<Array_> x)))
    :pattern (($SortWrappers.$SnapToSet<Array_> x))
    :qid |$Snap.Set<Array_>To$SnapToSet<Array_>|
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
(declare-fun $SortWrappers.Pair<Array~_Int>To$Snap (Pair<Array~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToPair<Array~_Int> ($Snap) Pair<Array~_Int>)
(assert (forall ((x Pair<Array~_Int>)) (!
    (= x ($SortWrappers.$SnapToPair<Array~_Int>($SortWrappers.Pair<Array~_Int>To$Snap x)))
    :pattern (($SortWrappers.Pair<Array~_Int>To$Snap x))
    :qid |$Snap.$SnapToPair<Array~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Pair<Array~_Int>To$Snap($SortWrappers.$SnapToPair<Array~_Int> x)))
    :pattern (($SortWrappers.$SnapToPair<Array~_Int> x))
    :qid |$Snap.Pair<Array~_Int>To$SnapToPair<Array~_Int>|
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
(declare-fun $SortWrappers.$FVF<elems>To$Snap ($FVF<elems>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<elems> ($Snap) $FVF<elems>)
(assert (forall ((x $FVF<elems>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<elems>($SortWrappers.$FVF<elems>To$Snap x)))
    :pattern (($SortWrappers.$FVF<elems>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<elems>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<elems>To$Snap($SortWrappers.$SnapTo$FVF<elems> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<elems> x))
    :qid |$Snap.$FVF<elems>To$SnapTo$FVF<elems>|
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
(declare-fun Set_in (Array_ Set<Array_>) Bool)
(declare-fun Set_card (Set<Array_>) Int)
(declare-const Set_empty Set<Array_>)
(declare-fun Set_singleton (Array_) Set<Array_>)
(declare-fun Set_unionone (Set<Array_> Array_) Set<Array_>)
(declare-fun Set_union (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_disjoint (Set<Array_> Set<Array_>) Bool)
(declare-fun Set_difference (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_intersection (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_subset (Set<Array_> Set<Array_>) Bool)
(declare-fun Set_equal (Set<Array_> Set<Array_>) Bool)
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
(declare-fun first<Array> (Pair<Array~_Int>) Array_)
(declare-fun second<Int> (Pair<Array~_Int>) Int)
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun len<Int> (Array_) Int)
(declare-fun inv_loc<Pair<Array~_Int>> ($Ref) Pair<Array~_Int>)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /field_value_functions_declarations.smt2 [elems: Array]
(declare-fun $FVF.domain_elems ($FVF<elems>) Set<$Ref>)
(declare-fun $FVF.lookup_elems ($FVF<elems> $Ref) Array_)
(declare-fun $FVF.after_elems ($FVF<elems> $FVF<elems>) Bool)
(declare-fun $FVF.loc_elems (Array_ $Ref) Bool)
(declare-fun $FVF.perm_elems ($FPM $Ref) $Perm)
(declare-const $fvfTOP_elems $FVF<elems>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun itemAt ($Snap $Ref Int) Int)
(declare-fun itemAt%limited ($Snap $Ref Int) Int)
(declare-fun itemAt%stateless ($Ref Int) Bool)
(declare-fun itemAt%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun AList%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<Array_>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Array]_prog.card_non_negative|)))
(assert (forall ((e Array_)) (!
  (not (Set_in e (as Set_empty  Set<Array_>)))
  :pattern ((Set_in e (as Set_empty  Set<Array_>)))
  :qid |$Set[Array]_prog.in_empty_set|)))
(assert (forall ((s Set<Array_>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Array_>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Array_)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Array]_prog.empty_set_cardinality|)))
(assert (forall ((e Array_)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Array]_prog.in_singleton_set|)))
(assert (forall ((e1 Array_) (e2 Array_)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Array]_prog.in_singleton_set_equality|)))
(assert (forall ((e Array_)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Array]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Array_>) (e Array_)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Array]_prog.in_unionone_same|)))
(assert (forall ((s Set<Array_>) (e1 Array_) (e2 Array_)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Array]_prog.in_unionone_other|)))
(assert (forall ((s Set<Array_>) (e1 Array_) (e2 Array_)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Array]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Array_>) (e Array_)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Array]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Array_>) (e Array_)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Array]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Array]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Array]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Array]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Array]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Array]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Array]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Array]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Array]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Array]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Array]_prog.in_difference|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>) (e Array_)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Array]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Array_)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Array]_prog.subset_definition|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Array_)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Array]_prog.equality_definition|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Array]_prog.native_equality|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Array_)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Array]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Array_>) (s2 Set<Array_>)) (!
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
  :qid |$Set[Array]_prog.cardinality_difference|)))
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
(assert (forall ((a Array_) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (len<Int> a)))
    (and
      (= (first<Array> (inv_loc<Pair<Array~_Int>> (loc<Ref> a i))) a)
      (= (second<Int> (inv_loc<Pair<Array~_Int>> (loc<Ref> a i))) i)))
  :pattern ((loc<Ref> a i))
  :qid |prog.loc_injective|)))
(assert (forall ((a Array_)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_nonneg|)))
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
; /field_value_functions_axioms.smt2 [elems: Array]
(assert (forall ((vs $FVF<elems>) (ws $FVF<elems>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_elems vs) ($FVF.domain_elems ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_elems vs))
            (= ($FVF.lookup_elems vs x) ($FVF.lookup_elems ws x)))
          :pattern (($FVF.lookup_elems vs x) ($FVF.lookup_elems ws x))
          :qid |qp.$FVF<elems>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<elems>To$Snap vs)
              ($SortWrappers.$FVF<elems>To$Snap ws)
              )
    :qid |qp.$FVF<elems>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_elems pm r))
    :pattern (($FVF.perm_elems pm r)))))
(assert (forall ((r $Ref) (f Array_)) (!
    (= ($FVF.loc_elems f r) true)
    :pattern (($FVF.loc_elems f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@7@00 ($Snap $Ref $Ref) Int)
(declare-fun inv@9@00 ($Snap $Ref Int $Ref) Int)
(declare-fun sm@10@00 ($Snap $Ref Int) $FVF<val>)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) (=>
    (length%precondition s@$ this@0@00)
    (>= result@1@00 0)))
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) true)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    (forall ((i@6@00 Int)) (!
      (=>
        (and
          (< i@6@00 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first s@$))))
          (<= 0 i@6@00))
        (=
          (inv@7@00 s@$ this@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first s@$)) i@6@00))
          i@6@00))
      :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first s@$)) i@6@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@7@00 s@$ this@0@00 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first s@$))))
          (<= 0 (inv@7@00 s@$ this@0@00 r)))
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first s@$)) (inv@7@00 s@$ this@0@00 r))
          r))
      :pattern ((inv@7@00 s@$ this@0@00 r))
      :qid |val-fctOfInv|))
    (=>
      (length%precondition s@$ this@0@00)
      (=
        (length s@$ this@0@00)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (= (itemAt%limited s@$ this@2@00 index@3@00) (itemAt s@$ this@2@00 index@3@00))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (itemAt%stateless this@2@00 index@3@00)
  :pattern ((itemAt%limited s@$ this@2@00 index@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (and
    (forall ((i@8@00 Int)) (!
      (=>
        (and
          (<
            i@8@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$)))))
          (<= 0 i@8@00))
        (=
          (inv@9@00 s@$ this@2@00 index@3@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$))) i@8@00))
          i@8@00))
      :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$))) i@8@00))
      :qid |quant-u-11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@9@00 s@$ this@2@00 index@3@00 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@9@00 s@$ this@2@00 index@3@00 r)))
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$))) (inv@9@00 s@$ this@2@00 index@3@00 r))
          r))
      :pattern ((inv@9@00 s@$ this@2@00 index@3@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@9@00 s@$ this@2@00 index@3@00 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@9@00 s@$ this@2@00 index@3@00 r)))
        (=
          ($FVF.lookup_val (sm@10@00 s@$ this@2@00 index@3@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r)))
      :pattern (($FVF.lookup_val (sm@10@00 s@$ this@2@00 index@3@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r))
      :qid |qp.fvfValDef0|))
    (=>
      (itemAt%precondition s@$ this@2@00 index@3@00)
      (=
        (itemAt s@$ this@2@00 index@3@00)
        ($FVF.lookup_val (sm@10@00 s@$ this@2@00 index@3@00) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@$))) index@3@00)))))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  true
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-13|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- create ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] length(this) == 0
; [eval] length(this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@2@01) this@1@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@2@01) this@1@01))
(assert (= (length ($Snap.first $t@2@01) this@1@01) 0))
(pop) ; 2
(push) ; 2
; [exec]
; var a: Array
(declare-const a@3@01 Array_)
; [exec]
; this := new(elems, size)
(declare-const this@4@01 $Ref)
(assert (not (= this@4@01 $Ref.null)))
(declare-const elems@5@01 Array_)
(declare-const size@6@01 Int)
(assert (not (= this@4@01 this@1@01)))
; [exec]
; inhale len(a) == 10
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] len(a) == 10
; [eval] len(a)
(assert (= (len<Int> a@3@01) 10))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < len(a) ==> acc(loc(a, i).val, write))
(declare-const i@8@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | 0 <= i@8@01 | live]
; [else-branch: 0 | !(0 <= i@8@01) | live]
(push) ; 5
; [then-branch: 0 | 0 <= i@8@01]
(assert (<= 0 i@8@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 <= i@8@01)]
(assert (not (<= 0 i@8@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@8@01)) (<= 0 i@8@01)))
(assert (and (< i@8@01 (len<Int> a@3@01)) (<= 0 i@8@01)))
; [eval] loc(a, i)
(pop) ; 3
(declare-const $t@9@01 $FVF<val>)
(declare-fun inv@10@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (< i@8@01 (len<Int> a@3@01)) (<= 0 i@8@01))
    (or (not (<= 0 i@8@01)) (<= 0 i@8@01)))
  :pattern ((loc<Ref> a@3@01 i@8@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (< i@8@01 (len<Int> a@3@01)) (<= 0 i@8@01))
    (= (inv@10@01 (loc<Ref> a@3@01 i@8@01)) i@8@01))
  :pattern ((loc<Ref> a@3@01 i@8@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@10@01 r) (len<Int> a@3@01)) (<= 0 (inv@10@01 r)))
    (= (loc<Ref> a@3@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (< i@8@01 (len<Int> a@3@01)) (<= 0 i@8@01))
    (not (= (loc<Ref> a@3@01 i@8@01) $Ref.null)))
  :pattern ((loc<Ref> a@3@01 i@8@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; this.size := 0
; [exec]
; this.elems := a
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(set-option :timeout 0)
(push) ; 3
(assert (not (<= 0 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (len<Int> a@3@01)))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(push) ; 3
(assert (not (< 0 (len<Int> a@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (< 0 (len<Int> a@3@01)))
(declare-const i@11@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 1 | 0 <= i@11@01 | live]
; [else-branch: 1 | !(0 <= i@11@01) | live]
(push) ; 5
; [then-branch: 1 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@11@01)) (<= 0 i@11@01)))
(assert (and (< i@11@01 (len<Int> a@3@01)) (<= 0 i@11@01)))
; [eval] loc(this.elems, i)
(pop) ; 3
(declare-fun inv@12@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (< i@11@01 (len<Int> a@3@01)) (<= 0 i@11@01))
    (or (not (<= 0 i@11@01)) (<= 0 i@11@01)))
  :pattern ((loc<Ref> a@3@01 i@11@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (< i1@11@01 (len<Int> a@3@01)) (<= 0 i1@11@01))
      (and (< i2@11@01 (len<Int> a@3@01)) (<= 0 i2@11@01))
      (= (loc<Ref> a@3@01 i1@11@01) (loc<Ref> a@3@01 i2@11@01)))
    (= i1@11@01 i2@11@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (< i@11@01 (len<Int> a@3@01)) (<= 0 i@11@01))
    (= (inv@12@01 (loc<Ref> a@3@01 i@11@01)) i@11@01))
  :pattern ((loc<Ref> a@3@01 i@11@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r)))
    (= (loc<Ref> a@3@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@10@01 r) (len<Int> a@3@01)) (<= 0 (inv@10@01 r)))
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
        (and (< (inv@10@01 r) (len<Int> a@3@01)) (<= 0 (inv@10@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@13@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
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
    (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r)))
    (= (- $Perm.Write (pTaken@13@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@14@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@14@01  $FVF<val>)))
      (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r))))
    (=>
      (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r)))
      (Set_in r ($FVF.domain_val (as sm@14@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@14@01  $FVF<val>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@12@01 r) (len<Int> a@3@01)) (<= 0 (inv@12@01 r)))
      (and (< (inv@10@01 r) (len<Int> a@3@01)) (<= 0 (inv@10@01 r))))
    (= ($FVF.lookup_val (as sm@14@01  $FVF<val>) r) ($FVF.lookup_val $t@9@01 r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@9@01 r))
  :qid |qp.fvfValDef0|)))
(assert (AList%trigger ($Snap.combine
  ($SortWrappers.Array_To$Snap a@3@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@14@01  $FVF<val>))))))) this@4@01))
; [eval] length(this) == 0
; [eval] length(this)
(set-option :timeout 0)
(push) ; 3
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Array_To$Snap a@3@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@14@01  $FVF<val>))))))) this@4@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Array_To$Snap a@3@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 0)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@14@01  $FVF<val>))))))) this@4@01))
(push) ; 3
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@14@01  $FVF<val>))))))) this@4@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@3@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 0)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@14@01  $FVF<val>))))))) this@4@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- addAtEnd ----------
(declare-const this@15@01 $Ref)
(declare-const elem@16@01 Int)
(declare-const this@17@01 $Ref)
(declare-const elem@18@01 Int)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.second $t@19@01) $Snap.unit))
; [eval] 0 < length(this) ==> itemAt(this, length(this) - 1) <= elem
; [eval] 0 < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first $t@19@01) this@17@01))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first $t@19@01) this@17@01))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 (length ($Snap.first $t@19@01) this@17@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 (length ($Snap.first $t@19@01) this@17@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | 0 < length(First:($t@19@01), this@17@01) | live]
; [else-branch: 2 | !(0 < length(First:($t@19@01), this@17@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | 0 < length(First:($t@19@01), this@17@01)]
(assert (< 0 (length ($Snap.first $t@19@01) this@17@01)))
; [eval] itemAt(this, length(this) - 1) <= elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<= 0 (- (length ($Snap.first $t@19@01) this@17@01) 1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@19@01) this@17@01) 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (- (length ($Snap.first $t@19@01) this@17@01) 1)
  (length ($Snap.first $t@19@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@19@01) this@17@01) 1)
  (length ($Snap.first $t@19@01) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
  (length ($Snap.first $t@19@01) this@17@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@19@01) this@17@01) 1))
  (<
    (- (length ($Snap.first $t@19@01) this@17@01) 1)
    (length ($Snap.first $t@19@01) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.first $t@19@01) this@17@01)
    1))))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(0 < length(First:($t@19@01), this@17@01))]
(assert (not (< 0 (length ($Snap.first $t@19@01) this@17@01))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 0 (length ($Snap.first $t@19@01) this@17@01))
  (and
    (< 0 (length ($Snap.first $t@19@01) this@17@01))
    (<= 0 (- (length ($Snap.first $t@19@01) this@17@01) 1))
    (<
      (- (length ($Snap.first $t@19@01) this@17@01) 1)
      (length ($Snap.first $t@19@01) this@17@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
      (length ($Snap.first $t@19@01) this@17@01)
      1)))))
; Joined path conditions
(assert (or
  (not (< 0 (length ($Snap.first $t@19@01) this@17@01)))
  (< 0 (length ($Snap.first $t@19@01) this@17@01))))
(assert (=>
  (< 0 (length ($Snap.first $t@19@01) this@17@01))
  (<=
    (itemAt ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
      (length ($Snap.first $t@19@01) this@17@01)
      1))
    elem@18@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (= ($Snap.first ($Snap.second $t@20@01)) $Snap.unit))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@20@01) this@17@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@20@01) this@17@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  (length ($Snap.first $t@20@01) this@17@01)
  (+ (length ($Snap.first $t@19@01) this@17@01) 1)))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@20@01))) $Snap.unit))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= index
(push) ; 4
(assert (not (<= 0 (- (length ($Snap.first $t@20@01) this@17@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@20@01) this@17@01) 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (- (length ($Snap.first $t@20@01) this@17@01) 1)
  (length ($Snap.first $t@20@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@20@01) this@17@01) 1)
  (length ($Snap.first $t@20@01) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@20@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
  (length ($Snap.first $t@20@01) this@17@01)
  1)))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@20@01) this@17@01) 1))
  (<
    (- (length ($Snap.first $t@20@01) this@17@01) 1)
    (length ($Snap.first $t@20@01) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@20@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.first $t@20@01) this@17@01)
    1))))
(assert (=
  (itemAt ($Snap.combine
    ($Snap.first $t@20@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.first $t@20@01) this@17@01)
    1))
  elem@18@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  $Snap.unit))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@21@01 Int)
(push) ; 3
; [eval] 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < old(length(this))
; [eval] 0 <= i
(push) ; 4
; [then-branch: 3 | 0 <= i@21@01 | live]
; [else-branch: 3 | !(0 <= i@21@01) | live]
(push) ; 5
; [then-branch: 3 | 0 <= i@21@01]
(assert (<= 0 i@21@01))
; [eval] i < old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(0 <= i@21@01)]
(assert (not (<= 0 i@21@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@21@01)) (<= 0 i@21@01)))
(push) ; 4
; [then-branch: 4 | i@21@01 < length(First:($t@19@01), this@17@01) && 0 <= i@21@01 | live]
; [else-branch: 4 | !(i@21@01 < length(First:($t@19@01), this@17@01) && 0 <= i@21@01) | live]
(push) ; 5
; [then-branch: 4 | i@21@01 < length(First:($t@19@01), this@17@01) && 0 <= i@21@01]
(assert (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@21@01 (length ($Snap.first $t@20@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@21@01 (length ($Snap.first $t@20@01) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@20@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@21@01 (length ($Snap.first $t@20@01) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@20@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))
(pop) ; 6
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@21@01 < length(First:($t@19@01), this@17@01) && 0 <= i@21@01)]
(assert (not (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))
  (and
    (< i@21@01 (length ($Snap.first $t@19@01) this@17@01))
    (<= 0 i@21@01)
    (< i@21@01 (length ($Snap.first $t@20@01) this@17@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@20@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))))
; Joined path conditions
(assert (or
  (not
    (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01)))
  (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (or (not (<= 0 i@21@01)) (<= 0 i@21@01))
    (=>
      (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))
      (and
        (< i@21@01 (length ($Snap.first $t@19@01) this@17@01))
        (<= 0 i@21@01)
        (< i@21@01 (length ($Snap.first $t@20@01) this@17@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@20@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)))
    (or
      (not
        (and
          (< i@21@01 (length ($Snap.first $t@19@01) this@17@01))
          (<= 0 i@21@01)))
      (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))
  :qid |prog.l75-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and (< i@21@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@21@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@20@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@21@01))
  :qid |prog.l75|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  $Snap.unit))
; [eval] itemAt(this, old(length(this))) == elem
; [eval] itemAt(this, old(length(this)))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= index
(push) ; 4
(assert (not (<= 0 (length ($Snap.first $t@19@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (length ($Snap.first $t@19@01) this@17@01)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.first $t@20@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.first $t@20@01) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@20@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01)))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (length ($Snap.first $t@19@01) this@17@01))
  (<
    (length ($Snap.first $t@19@01) this@17@01)
    (length ($Snap.first $t@20@01) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@20@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))))
(assert (=
  (itemAt ($Snap.combine
    ($Snap.first $t@20@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))
  elem@18@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(AList(this), write)
(assert (=
  ($Snap.first $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.second ($Snap.first $t@19@01)))))
(assert (not (= this@17@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@19@01)))) $Snap.unit))
; [eval] 0 <= this.size
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  $Snap.unit))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
  $Snap.unit))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(assert (<
  0
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))
(declare-const i@22@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | 0 <= i@22@01 | live]
; [else-branch: 5 | !(0 <= i@22@01) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@22@01]
(assert (<= 0 i@22@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@22@01)]
(assert (not (<= 0 i@22@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@22@01)) (<= 0 i@22@01)))
(assert (and
  (<
    i@22@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
  (<= 0 i@22@01)))
; [eval] loc(this.elems, i)
(pop) ; 3
(declare-fun inv@23@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and
      (<
        i@22@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@22@01))
    (or (not (<= 0 i@22@01)) (<= 0 i@22@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@22@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and
      (<
        i@22@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@22@01))
    (=
      (inv@23@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@22@01))
      i@22@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@22@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) (inv@23@01 r))
      r))
  :pattern ((inv@23@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and
      (<
        i@22@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@22@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@22@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@22@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (AList%trigger ($Snap.first $t@19@01) this@17@01))
; [eval] this.size == len(this.elems)
; [eval] len(this.elems)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:($t@19@01))) == len[Int](First:(First:($t@19@01))) | live]
; [else-branch: 6 | First:(Second:(First:($t@19@01))) != len[Int](First:(First:($t@19@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | First:(Second:(First:($t@19@01))) == len[Int](First:(First:($t@19@01)))]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))
; [exec]
; var a: Array
(declare-const a@24@01 Array_)
; [exec]
; inhale len(a) == len(this.elems) * 2 &&
;   (forall i: Int ::0 <= i && i < len(a) ==> acc(loc(a, i).val, write))
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] len(a) == len(this.elems) * 2
; [eval] len(a)
; [eval] len(this.elems) * 2
; [eval] len(this.elems)
(assert (=
  (len<Int> a@24@01)
  (*
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))
    2)))
(declare-const i@26@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 7 | 0 <= i@26@01 | live]
; [else-branch: 7 | !(0 <= i@26@01) | live]
(push) ; 6
; [then-branch: 7 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@26@01)) (<= 0 i@26@01)))
(assert (and (< i@26@01 (len<Int> a@24@01)) (<= 0 i@26@01)))
; [eval] loc(a, i)
(pop) ; 4
(declare-fun inv@27@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (< i@26@01 (len<Int> a@24@01)) (<= 0 i@26@01))
    (or (not (<= 0 i@26@01)) (<= 0 i@26@01)))
  :pattern ((loc<Ref> a@24@01 i@26@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (< i@26@01 (len<Int> a@24@01)) (<= 0 i@26@01))
    (= (inv@27@01 (loc<Ref> a@24@01 i@26@01)) i@26@01))
  :pattern ((loc<Ref> a@24@01 i@26@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (= (loc<Ref> a@24@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (< i@26@01 (len<Int> a@24@01)) (<= 0 i@26@01))
    (not (= (loc<Ref> a@24@01 i@26@01) $Ref.null)))
  :pattern ((loc<Ref> a@24@01 i@26@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { loc(a, i) }
;     { loc(this.elems, i) }
;     0 <= i && i < len(this.elems) ==>
;     loc(a, i).val == loc(this.elems, i).val)
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i) } { loc(this.elems, i) } 0 <= i && i < len(this.elems) ==> loc(a, i).val == loc(this.elems, i).val)
(declare-const i@29@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < len(this.elems) ==> loc(a, i).val == loc(this.elems, i).val
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 8 | 0 <= i@29@01 | live]
; [else-branch: 8 | !(0 <= i@29@01) | live]
(push) ; 6
; [then-branch: 8 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@29@01)) (<= 0 i@29@01)))
(push) ; 5
; [then-branch: 9 | i@29@01 < len[Int](First:(First:($t@19@01))) && 0 <= i@29@01 | live]
; [else-branch: 9 | !(i@29@01 < len[Int](First:(First:($t@19@01))) && 0 <= i@29@01) | live]
(push) ; 6
; [then-branch: 9 | i@29@01 < len[Int](First:(First:($t@19@01))) && 0 <= i@29@01]
(assert (and
  (<
    i@29@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
  (<= 0 i@29@01)))
; [eval] loc(a, i).val == loc(this.elems, i).val
; [eval] loc(a, i)
(declare-const sm@30@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_val (as pm@31@01  $FPM) (loc<Ref> a@24@01 i@29@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] loc(this.elems, i)
(declare-const sm@32@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_val (as pm@33@01  $FPM) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@29@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(i@29@01 < len[Int](First:(First:($t@19@01))) && 0 <= i@29@01)]
(assert (not
  (and
    (<
      i@29@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
    (<= 0 i@29@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@29@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@29@01)))
  (and
    (<
      i@29@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
    (<= 0 i@29@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@30@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@31@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@23@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@23@01 r)))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (+
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int)) (!
  (and
    (or (not (<= 0 i@29@01)) (<= 0 i@29@01))
    (or
      (not
        (and
          (<
            i@29@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 i@29@01)))
      (and
        (<
          i@29@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 i@29@01))))
  :pattern ((loc<Ref> a@24@01 i@29@01))
  :qid |prog.l84-aux|)))
(assert (forall ((i@29@01 Int)) (!
  (and
    (or (not (<= 0 i@29@01)) (<= 0 i@29@01))
    (or
      (not
        (and
          (<
            i@29@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 i@29@01)))
      (and
        (<
          i@29@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 i@29@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@29@01))
  :qid |prog.l84-aux|)))
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and
      (<
        i@29@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@29@01))
    (=
      ($FVF.lookup_val (as sm@30@01  $FVF<val>) (loc<Ref> a@24@01 i@29@01))
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@29@01))))
  :pattern ((loc<Ref> a@24@01 i@29@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@29@01))
  :qid |prog.l84|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; this.elems := a
; [exec]
; loc(this.elems, this.size).val := elem
; [eval] loc(this.elems, this.size)
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    ($Perm.min
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    ($Perm.min
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@34@01 r)))
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
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@34@01 r))
    $Perm.No)
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    (= (- $Perm.Write (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@35@01 r))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    (= (- (- $Perm.Write (pTaken@34@01 r)) (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@36@01  $FVF<val>) (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
  elem@18@01))
; [exec]
; this.size := this.size + 1
; [eval] this.size + 1
(declare-const size@37@01 Int)
(assert (=
  size@37@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    1)))
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 0 size@37@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 size@37@01))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(push) ; 4
(assert (not (<= size@37@01 (len<Int> a@24@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= size@37@01 (len<Int> a@24@01)))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(push) ; 4
(assert (not (< 0 (len<Int> a@24@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 0 (len<Int> a@24@01)))
(declare-const i@38@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 10 | 0 <= i@38@01 | live]
; [else-branch: 10 | !(0 <= i@38@01) | live]
(push) ; 6
; [then-branch: 10 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@38@01)) (<= 0 i@38@01)))
(assert (and (< i@38@01 (len<Int> a@24@01)) (<= 0 i@38@01)))
; [eval] loc(this.elems, i)
(pop) ; 4
(declare-fun inv@39@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (< i@38@01 (len<Int> a@24@01)) (<= 0 i@38@01))
    (or (not (<= 0 i@38@01)) (<= 0 i@38@01)))
  :pattern ((loc<Ref> a@24@01 i@38@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (< i1@38@01 (len<Int> a@24@01)) (<= 0 i1@38@01))
      (and (< i2@38@01 (len<Int> a@24@01)) (<= 0 i2@38@01))
      (= (loc<Ref> a@24@01 i1@38@01) (loc<Ref> a@24@01 i2@38@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (< i@38@01 (len<Int> a@24@01)) (<= 0 i@38@01))
    (= (inv@39@01 (loc<Ref> a@24@01 i@38@01)) i@38@01))
  :pattern ((loc<Ref> a@24@01 i@38@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    (= (loc<Ref> a@24@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@23@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
            (<= 0 (inv@23@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@34@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@35@01 r))
      (- $Perm.Write (pTaken@40@01 r)))
    $Perm.No))
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)))
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
      (-
        (ite
          (and
            (<
              (inv@23@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
            (<= 0 (inv@23@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@34@01 r))
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@35@01 r))
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    (= (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))
        (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
      $Perm.Write
      $Perm.No)
    (pTaken@42@01 (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)) (pTaken@42@01 r))
      $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@43@01  $FVF<val>)))
      (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r))))
    (=>
      (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
      (Set_in r ($FVF.domain_val (as sm@43@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@43@01  $FVF<val>))))
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and
              (<
                (inv@23@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
              (<= 0 (inv@23@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@34@01 r))))
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@27@01 r) (len<Int> a@24@01)) (<= 0 (inv@27@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@35@01 r))))
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@25@01)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (len<Int> a@24@01)) (<= 0 (inv@39@01 r)))
      (=
        r
        (loc<Ref> a@24@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))))
    (=
      ($FVF.lookup_val (as sm@43@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@43@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (AList%trigger ($Snap.combine
  ($SortWrappers.Array_To$Snap a@24@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@37@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(set-option :timeout 0)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Array_To$Snap a@24@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@37@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Array_To$Snap a@24@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@37@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
  (+ (length ($Snap.first $t@19@01) this@17@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
  (+ (length ($Snap.first $t@19@01) this@17@01) 1)))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($SortWrappers.Array_To$Snap a@24@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@37@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($SortWrappers.Array_To$Snap a@24@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@37@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
      1)
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1))
  elem@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)
    1))
  elem@18@01))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@44@01 Int)
(push) ; 4
; [eval] 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < old(length(this))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | 0 <= i@44@01 | live]
; [else-branch: 11 | !(0 <= i@44@01) | live]
(push) ; 6
; [then-branch: 11 | 0 <= i@44@01]
(assert (<= 0 i@44@01))
; [eval] i < old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= i@44@01)]
(assert (not (<= 0 i@44@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@44@01)) (<= 0 i@44@01)))
(push) ; 5
; [then-branch: 12 | i@44@01 < length(First:($t@19@01), this@17@01) && 0 <= i@44@01 | live]
; [else-branch: 12 | !(i@44@01 < length(First:($t@19@01), this@17@01) && 0 <= i@44@01) | live]
(push) ; 6
; [then-branch: 12 | i@44@01 < length(First:($t@19@01), this@17@01) && 0 <= i@44@01]
(assert (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  i@44@01
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  i@44@01
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<
    i@44@01
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(i@44@01 < length(First:($t@19@01), this@17@01) && 0 <= i@44@01)]
(assert (not (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))
  (and
    (< i@44@01 (length ($Snap.first $t@19@01) this@17@01))
    (<= 0 i@44@01)
    (<
      i@44@01
      (length ($Snap.combine
        ($SortWrappers.Array_To$Snap a@24@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@37@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap a@24@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@37@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))))
; Joined path conditions
(assert (or
  (not
    (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01)))
  (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@44@01 Int)) (!
  (and
    (or (not (<= 0 i@44@01)) (<= 0 i@44@01))
    (=>
      (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))
      (and
        (< i@44@01 (length ($Snap.first $t@19@01) this@17@01))
        (<= 0 i@44@01)
        (<
          i@44@01
          (length ($Snap.combine
            ($SortWrappers.Array_To$Snap a@24@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@37@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap a@24@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@37@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)))
    (or
      (not
        (and
          (< i@44@01 (length ($Snap.first $t@19@01) this@17@01))
          (<= 0 i@44@01)))
      (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
  :qid |prog.l75-aux|)))
(assert (forall ((i@44@01 Int)) (!
  (and
    (length%precondition ($Snap.first $t@19@01) this@17@01)
    (=>
      (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap a@24@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@37@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
  :qid |prog.l75_precondition|)))
(push) ; 4
(assert (not (forall ((i@44@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.first $t@19@01) this@17@01)
        (=>
          (and
            (< i@44@01 (length ($Snap.first $t@19@01) this@17@01))
            (<= 0 i@44@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($SortWrappers.Array_To$Snap a@24@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@37@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
            (itemAt%precondition ($Snap.combine
              ($Snap.first $t@19@01)
              ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))))
      (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap a@24@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@37@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
  :qid |prog.l75|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (forall ((i@44@01 Int)) (!
  (=>
    (and (< i@44@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@44@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap a@24@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@37@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@44@01))
  :qid |prog.l75|)))
; [eval] itemAt(this, old(length(this))) == elem
; [eval] itemAt(this, old(length(this)))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<= 0 (length ($Snap.first $t@19@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (length ($Snap.first $t@19@01) this@17@01)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap a@24@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@37@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (length ($Snap.first $t@19@01) this@17@01))
  (<
    (length ($Snap.first $t@19@01) this@17@01)
    (length ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))
  elem@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap a@24@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@37@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@43@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))
  elem@18@01))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | First:(Second:(First:($t@19@01))) != len[Int](First:(First:($t@19@01)))]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))))
(pop) ; 3
; [eval] !(this.size == len(this.elems))
; [eval] this.size == len(this.elems)
; [eval] len(this.elems)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(First:($t@19@01))) != len[Int](First:(First:($t@19@01))) | live]
; [else-branch: 13 | First:(Second:(First:($t@19@01))) == len[Int](First:(First:($t@19@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | First:(Second:(First:($t@19@01))) != len[Int](First:(First:($t@19@01)))]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))))
; [exec]
; loc(this.elems, this.size).val := elem
; [eval] loc(this.elems, this.size)
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    ($Perm.min
      (ite
        (and
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
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
          (<
            (inv@23@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
          (<= 0 (inv@23@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@45@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@46@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@46@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
  elem@18@01))
; [exec]
; this.size := this.size + 1
; [eval] this.size + 1
(declare-const size@47@01 Int)
(assert (=
  size@47@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
    1)))
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 0 size@47@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 size@47@01))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(push) ; 4
(assert (not (<=
  size@47@01
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  size@47@01
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(declare-const i@48@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 14 | 0 <= i@48@01 | live]
; [else-branch: 14 | !(0 <= i@48@01) | live]
(push) ; 6
; [then-branch: 14 | 0 <= i@48@01]
(assert (<= 0 i@48@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 6
(push) ; 6
; [else-branch: 14 | !(0 <= i@48@01)]
(assert (not (<= 0 i@48@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@48@01)) (<= 0 i@48@01)))
(assert (and
  (<
    i@48@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
  (<= 0 i@48@01)))
; [eval] loc(this.elems, i)
(pop) ; 4
(declare-fun inv@49@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and
      (<
        i@48@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@48@01))
    (or (not (<= 0 i@48@01)) (<= 0 i@48@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@48@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@48@01 Int) (i2@48@01 Int)) (!
  (=>
    (and
      (and
        (<
          i1@48@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 i1@48@01))
      (and
        (<
          i2@48@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 i2@48@01))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i1@48@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i2@48@01)))
    (= i1@48@01 i2@48@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and
      (<
        i@48@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 i@48@01))
    (=
      (inv@49@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@48@01))
      i@48@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) i@48@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@49@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@49@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) (inv@49@01 r))
      r))
  :pattern ((inv@49@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@49@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@49@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@23@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
            (<= 0 (inv@23@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@45@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@49@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@49@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@50@01 r)))
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
      (-
        (ite
          (and
            (<
              (inv@23@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
            (<= 0 (inv@23@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@45@01 r))
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@49@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@49@01 r)))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))))
      $Perm.Write
      $Perm.No)
    (pTaken@51@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@49@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
      (<= 0 (inv@49@01 r)))
    (= (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@52@01  $FVF<val>)))
      (and
        (<
          (inv@49@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 (inv@49@01 r))))
    (=>
      (and
        (<
          (inv@49@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 (inv@49@01 r)))
      (Set_in r ($FVF.domain_val (as sm@52@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@52@01  $FVF<val>))))
  :qid |qp.fvfDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@49@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 (inv@49@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and
              (<
                (inv@23@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
              (<= 0 (inv@23@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@45@01 r))))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@49@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01)))))
        (<= 0 (inv@49@01 r)))
      (=
        r
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))) ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01)))))))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@46@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@46@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (AList%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@19@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@47@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(set-option :timeout 0)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@19@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@47@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@19@01))
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@47@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
  (+ (length ($Snap.first $t@19@01) this@17@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
  (+ (length ($Snap.first $t@19@01) this@17@01) 1)))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@19@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@47@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@19@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@47@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
      1)
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1))
  elem@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (-
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)
    1))
  elem@18@01))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@53@01 Int)
(push) ; 4
; [eval] 0 <= i && i < old(length(this)) ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < old(length(this))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 15 | 0 <= i@53@01 | live]
; [else-branch: 15 | !(0 <= i@53@01) | live]
(push) ; 6
; [then-branch: 15 | 0 <= i@53@01]
(assert (<= 0 i@53@01))
; [eval] i < old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(0 <= i@53@01)]
(assert (not (<= 0 i@53@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@53@01)) (<= 0 i@53@01)))
(push) ; 5
; [then-branch: 16 | i@53@01 < length(First:($t@19@01), this@17@01) && 0 <= i@53@01 | live]
; [else-branch: 16 | !(i@53@01 < length(First:($t@19@01), this@17@01) && 0 <= i@53@01) | live]
(push) ; 6
; [then-branch: 16 | i@53@01 < length(First:($t@19@01), this@17@01) && 0 <= i@53@01]
(assert (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  i@53@01
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  i@53@01
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<
    i@53@01
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(i@53@01 < length(First:($t@19@01), this@17@01) && 0 <= i@53@01)]
(assert (not (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))
  (and
    (< i@53@01 (length ($Snap.first $t@19@01) this@17@01))
    (<= 0 i@53@01)
    (<
      i@53@01
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@19@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@47@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@19@01))
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@47@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))))
; Joined path conditions
(assert (or
  (not
    (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01)))
  (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@53@01 Int)) (!
  (and
    (or (not (<= 0 i@53@01)) (<= 0 i@53@01))
    (=>
      (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))
      (and
        (< i@53@01 (length ($Snap.first $t@19@01) this@17@01))
        (<= 0 i@53@01)
        (<
          i@53@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@19@01))
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@47@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first $t@19@01))
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@47@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)))
    (or
      (not
        (and
          (< i@53@01 (length ($Snap.first $t@19@01) this@17@01))
          (<= 0 i@53@01)))
      (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
  :qid |prog.l75-aux|)))
(assert (forall ((i@53@01 Int)) (!
  (and
    (length%precondition ($Snap.first $t@19@01) this@17@01)
    (=>
      (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first $t@19@01))
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@47@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
  :qid |prog.l75_precondition|)))
(push) ; 4
(assert (not (forall ((i@53@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.first $t@19@01) this@17@01)
        (=>
          (and
            (< i@53@01 (length ($Snap.first $t@19@01) this@17@01))
            (<= 0 i@53@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first ($Snap.first $t@19@01))
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@47@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
            (itemAt%precondition ($Snap.combine
              ($Snap.first $t@19@01)
              ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))))
      (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first $t@19@01))
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@47@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
  :qid |prog.l75|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (forall ((i@53@01 Int)) (!
  (=>
    (and (< i@53@01 (length ($Snap.first $t@19@01) this@17@01)) (<= 0 i@53@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first $t@19@01))
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@47@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 i@53@01))
  :qid |prog.l75|)))
; [eval] itemAt(this, old(length(this))) == elem
; [eval] itemAt(this, old(length(this)))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<= 0 (length ($Snap.first $t@19@01) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (length ($Snap.first $t@19@01) this@17@01)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (length ($Snap.first $t@19@01) this@17@01)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@19@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@47@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (length ($Snap.first $t@19@01) this@17@01))
  (<
    (length ($Snap.first $t@19@01) this@17@01)
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>))))))) this@17@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))
  elem@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@19@01))
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@47@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@52@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@17@01 (length ($Snap.first $t@19@01) this@17@01))
  elem@18@01))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | First:(Second:(First:($t@19@01))) == len[Int](First:(First:($t@19@01)))]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@19@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@19@01))))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- insert ----------
(declare-const this@54@01 $Ref)
(declare-const elem@55@01 Int)
(declare-const j@56@01 Int)
(declare-const this@57@01 $Ref)
(declare-const elem@58@01 Int)
(declare-const j@59@01 Int)
(push) ; 1
(declare-const $t@60@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
(assert (=
  ($Snap.second $t@61@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@61@01))
    ($Snap.second ($Snap.second $t@61@01)))))
(assert (= ($Snap.first ($Snap.second $t@61@01)) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@59@01))
(assert (=
  ($Snap.second ($Snap.second $t@61@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@61@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@61@01))) $Snap.unit))
; [eval] j < length(this)
; [eval] length(this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@61@01) this@57@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@61@01) this@57@01))
(assert (< j@59@01 (length ($Snap.first $t@61@01) this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@61@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@61@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@61@01))))
  $Snap.unit))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 3
(assert (length%precondition $t@60@01 this@57@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition $t@60@01 this@57@01))
(assert (= (length ($Snap.first $t@61@01) this@57@01) (+ (length $t@60@01 this@57@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))
  $Snap.unit))
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@62@01 Int)
(push) ; 3
; [eval] 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < j
; [eval] 0 <= k
(push) ; 4
; [then-branch: 17 | 0 <= k@62@01 | live]
; [else-branch: 17 | !(0 <= k@62@01) | live]
(push) ; 5
; [then-branch: 17 | 0 <= k@62@01]
(assert (<= 0 k@62@01))
; [eval] k < j
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(0 <= k@62@01)]
(assert (not (<= 0 k@62@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@62@01)) (<= 0 k@62@01)))
(push) ; 4
; [then-branch: 18 | k@62@01 < j@59@01 && 0 <= k@62@01 | live]
; [else-branch: 18 | !(k@62@01 < j@59@01 && 0 <= k@62@01) | live]
(push) ; 5
; [then-branch: 18 | k@62@01 < j@59@01 && 0 <= k@62@01]
(assert (and (< k@62@01 j@59@01) (<= 0 k@62@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< k@62@01 (length ($Snap.first $t@61@01) this@57@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< k@62@01 (length ($Snap.first $t@61@01) this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@61@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< k@62@01 (length ($Snap.first $t@61@01) this@57@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@61@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< k@62@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< k@62@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< k@62@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(k@62@01 < j@59@01 && 0 <= k@62@01)]
(assert (not (and (< k@62@01 j@59@01) (<= 0 k@62@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< k@62@01 j@59@01) (<= 0 k@62@01))
  (and
    (< k@62@01 j@59@01)
    (<= 0 k@62@01)
    (< k@62@01 (length ($Snap.first $t@61@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@61@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)
    (< k@62@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01))))
; Joined path conditions
(assert (or
  (not (and (< k@62@01 j@59@01) (<= 0 k@62@01)))
  (and (< k@62@01 j@59@01) (<= 0 k@62@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@62@01 Int)) (!
  (and
    (or (not (<= 0 k@62@01)) (<= 0 k@62@01))
    (=>
      (and (< k@62@01 j@59@01) (<= 0 k@62@01))
      (and
        (< k@62@01 j@59@01)
        (<= 0 k@62@01)
        (< k@62@01 (length ($Snap.first $t@61@01) this@57@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@61@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)
        (< k@62@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)))
    (or
      (not (and (< k@62@01 j@59@01) (<= 0 k@62@01)))
      (and (< k@62@01 j@59@01) (<= 0 k@62@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01))
  :qid |prog.l101-aux|)))
(assert (forall ((k@62@01 Int)) (!
  (=>
    (and (< k@62@01 j@59@01) (<= 0 k@62@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@61@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@62@01))
  :qid |prog.l101|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))
  $Snap.unit))
; [eval] itemAt(this, j) == elem
; [eval] itemAt(this, j)
(push) ; 3
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@61@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@59@01))
(pop) ; 3
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@61@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@59@01))
(assert (=
  (itemAt ($Snap.combine
    ($Snap.first $t@61@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@59@01)
  elem@58@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@61@01))))))
  $Snap.unit))
; [eval] (forall k: Int :: { itemAt(this, k) } j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1)))
(declare-const k@63@01 Int)
(push) ; 3
; [eval] j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] j < k && k < length(this)
; [eval] j < k
(push) ; 4
; [then-branch: 19 | j@59@01 < k@63@01 | live]
; [else-branch: 19 | !(j@59@01 < k@63@01) | live]
(push) ; 5
; [then-branch: 19 | j@59@01 < k@63@01]
(assert (< j@59@01 k@63@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(j@59@01 < k@63@01)]
(assert (not (< j@59@01 k@63@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@59@01 k@63@01)) (< j@59@01 k@63@01)))
(push) ; 4
; [then-branch: 20 | k@63@01 < length(First:($t@61@01), this@57@01) && j@59@01 < k@63@01 | live]
; [else-branch: 20 | !(k@63@01 < length(First:($t@61@01), this@57@01) && j@59@01 < k@63@01) | live]
(push) ; 5
; [then-branch: 20 | k@63@01 < length(First:($t@61@01), this@57@01) && j@59@01 < k@63@01]
(assert (and (< k@63@01 (length ($Snap.first $t@61@01) this@57@01)) (< j@59@01 k@63@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] itemAt(this, k)
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 k@63@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 k@63@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@61@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 k@63@01)
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@61@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01)))
; [eval] old(itemAt(this, k - 1))
; [eval] itemAt(this, k - 1)
; [eval] k - 1
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 (- k@63@01 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- k@63@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< (- k@63@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< (- k@63@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@63@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- k@63@01 1))
  (< (- k@63@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@63@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(k@63@01 < length(First:($t@61@01), this@57@01) && j@59@01 < k@63@01)]
(assert (not
  (and
    (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
    (< j@59@01 k@63@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
    (< j@59@01 k@63@01))
  (and
    (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
    (< j@59@01 k@63@01)
    (<= 0 k@63@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@61@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01)
    (<= 0 (- k@63@01 1))
    (< (- k@63@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@63@01 1)))))
; Joined path conditions
(assert (or
  (not
    (and
      (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
      (< j@59@01 k@63@01)))
  (and
    (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
    (< j@59@01 k@63@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@63@01 Int)) (!
  (and
    (or (not (< j@59@01 k@63@01)) (< j@59@01 k@63@01))
    (=>
      (and
        (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
        (< j@59@01 k@63@01))
      (and
        (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
        (< j@59@01 k@63@01)
        (<= 0 k@63@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@61@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01)
        (<= 0 (- k@63@01 1))
        (< (- k@63@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@63@01 1))))
    (or
      (not
        (and
          (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
          (< j@59@01 k@63@01)))
      (and
        (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
        (< j@59@01 k@63@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@61@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01))
  :qid |prog.l103-aux|)))
(assert (forall ((k@63@01 Int)) (!
  (=>
    (and
      (< k@63@01 (length ($Snap.first $t@61@01) this@57@01))
      (< j@59@01 k@63@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@61@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        k@63@01
        1))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@61@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@63@01))
  :qid |prog.l103|)))
(pop) ; 2
(push) ; 2
; [exec]
; var t: Int
(declare-const t@64@01 Int)
; [exec]
; j := 0
(declare-const j@65@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(assert (=
  ($Snap.second $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@01))
    ($Snap.second ($Snap.second $t@66@01)))))
(assert (= ($Snap.first ($Snap.second $t@66@01)) $Snap.unit))
; [eval] 0 <= j
(assert (<= 0 j@65@01))
(assert (=
  ($Snap.second ($Snap.second $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@66@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@66@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@66@01))) $Snap.unit))
; [eval] j <= length(this)
; [eval] length(this)
(push) ; 4
(assert (length%precondition ($Snap.first $t@66@01) this@57@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.first $t@66@01) this@57@01))
(assert (<= j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@66@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
  $Snap.unit))
; [eval] j > 0 ==> itemAt(this, j - 1) <= elem
; [eval] j > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> j@65@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> j@65@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | j@65@01 > 0 | live]
; [else-branch: 21 | !(j@65@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | j@65@01 > 0]
(assert (> j@65@01 0))
; [eval] itemAt(this, j - 1) <= elem
; [eval] itemAt(this, j - 1)
; [eval] j - 1
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 (- j@65@01 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- j@65@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< (- j@65@01 1) (length ($Snap.first $t@66@01) this@57@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< (- j@65@01 1) (length ($Snap.first $t@66@01) this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- j@65@01 1))
  (< (- j@65@01 1) (length ($Snap.first $t@66@01) this@57@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@66@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(j@65@01 > 0)]
(assert (not (> j@65@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> j@65@01 0)
  (and
    (> j@65@01 0)
    (<= 0 (- j@65@01 1))
    (< (- j@65@01 1) (length ($Snap.first $t@66@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1)))))
; Joined path conditions
(assert (or (not (> j@65@01 0)) (> j@65@01 0)))
(assert (=>
  (> j@65@01 0)
  (<=
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1))
    elem@58@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
  $Snap.unit))
; [eval] length(this) == old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(assert (length%precondition $t@60@01 this@57@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition $t@60@01 this@57@01))
(assert (= (length ($Snap.first $t@66@01) this@57@01) (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
  $Snap.unit))
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@67@01 Int)
(push) ; 4
; [eval] 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < length(this)
; [eval] 0 <= k
(push) ; 5
; [then-branch: 22 | 0 <= k@67@01 | live]
; [else-branch: 22 | !(0 <= k@67@01) | live]
(push) ; 6
; [then-branch: 22 | 0 <= k@67@01]
(assert (<= 0 k@67@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(0 <= k@67@01)]
(assert (not (<= 0 k@67@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@67@01)) (<= 0 k@67@01)))
(push) ; 5
; [then-branch: 23 | k@67@01 < length(First:($t@66@01), this@57@01) && 0 <= k@67@01 | live]
; [else-branch: 23 | !(k@67@01 < length(First:($t@66@01), this@57@01) && 0 <= k@67@01) | live]
(push) ; 6
; [then-branch: 23 | k@67@01 < length(First:($t@66@01), this@57@01) && 0 <= k@67@01]
(assert (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< k@67@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< k@67@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< k@67@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | !(k@67@01 < length(First:($t@66@01), this@57@01) && 0 <= k@67@01)]
(assert (not (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))
  (and
    (< k@67@01 (length ($Snap.first $t@66@01) this@57@01))
    (<= 0 k@67@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)
    (< k@67@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))))
; Joined path conditions
(assert (or
  (not
    (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01)))
  (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@67@01 Int)) (!
  (and
    (or (not (<= 0 k@67@01)) (<= 0 k@67@01))
    (=>
      (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))
      (and
        (< k@67@01 (length ($Snap.first $t@66@01) this@57@01))
        (<= 0 k@67@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@66@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)
        (< k@67@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)))
    (or
      (not
        (and
          (< k@67@01 (length ($Snap.first $t@66@01) this@57@01))
          (<= 0 k@67@01)))
      (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
  :qid |prog.l111-aux|)))
(assert (forall ((k@67@01 Int)) (!
  (=>
    (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
  :qid |prog.l111|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 4
; [eval] j < length(this) && itemAt(this, j) < elem
; [eval] j < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 24 | j@65@01 < length(First:($t@66@01), this@57@01) | live]
; [else-branch: 24 | !(j@65@01 < length(First:($t@66@01), this@57@01)) | live]
(push) ; 6
; [then-branch: 24 | j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
; [eval] itemAt(this, j) < elem
; [eval] itemAt(this, j)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | !(j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
  (and
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))))
; Joined path conditions
(assert (or
  (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 4
(push) ; 4
; [eval] !(j < length(this) && itemAt(this, j) < elem)
; [eval] j < length(this) && itemAt(this, j) < elem
; [eval] j < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 25 | j@65@01 < length(First:($t@66@01), this@57@01) | live]
; [else-branch: 25 | !(j@65@01 < length(First:($t@66@01), this@57@01)) | live]
(push) ; 6
; [then-branch: 25 | j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
; [eval] itemAt(this, j) < elem
; [eval] itemAt(this, j)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | !(j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
  (and
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))))
; Joined path conditions
(assert (or
  (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= j
; [eval] j <= length(this)
; [eval] length(this)
(push) ; 4
(assert (length%precondition $t@60@01 this@57@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition $t@60@01 this@57@01))
(push) ; 4
(assert (not (<= 0 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (length $t@60@01 this@57@01)))
; [eval] j > 0 ==> itemAt(this, j - 1) <= elem
; [eval] j > 0
(push) ; 4
; [then-branch: 26 | False | dead]
; [else-branch: 26 | True | live]
(push) ; 5
; [else-branch: 26 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] length(this) == old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@68@01 Int)
(push) ; 4
; [eval] 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < length(this)
; [eval] 0 <= k
(push) ; 5
; [then-branch: 27 | 0 <= k@68@01 | live]
; [else-branch: 27 | !(0 <= k@68@01) | live]
(push) ; 6
; [then-branch: 27 | 0 <= k@68@01]
(assert (<= 0 k@68@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 27 | !(0 <= k@68@01)]
(assert (not (<= 0 k@68@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@68@01)) (<= 0 k@68@01)))
(push) ; 5
; [then-branch: 28 | k@68@01 < length($t@60@01, this@57@01) && 0 <= k@68@01 | live]
; [else-branch: 28 | !(k@68@01 < length($t@60@01, this@57@01) && 0 <= k@68@01) | live]
(push) ; 6
; [then-branch: 28 | k@68@01 < length($t@60@01, this@57@01) && 0 <= k@68@01]
(assert (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@68@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@68@01))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(k@68@01 < length($t@60@01, this@57@01) && 0 <= k@68@01)]
(assert (not (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01))
  (and
    (< k@68@01 (length $t@60@01 this@57@01))
    (<= 0 k@68@01)
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@68@01))))
; Joined path conditions
(assert (or
  (not (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01)))
  (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01))))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 5
; [eval] 0 <= index
(push) ; 6
(assert (not (<= 0 k@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 k@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 k@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 k@68@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@68@01 Int)) (!
  (and
    (or (not (<= 0 k@68@01)) (<= 0 k@68@01))
    (=>
      (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01))
      (and
        (< k@68@01 (length $t@60@01 this@57@01))
        (<= 0 k@68@01)
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@68@01)))
    (or
      (not (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01)))
      (and (< k@68@01 (length $t@60@01 this@57@01)) (<= 0 k@68@01))))
  
  :qid |prog.l111-aux|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(assert (=
  ($Snap.second $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@01))
    ($Snap.second ($Snap.second $t@66@01)))))
(assert (= ($Snap.first ($Snap.second $t@66@01)) $Snap.unit))
(assert (<= 0 j@65@01))
(assert (=
  ($Snap.second ($Snap.second $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@66@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@66@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@66@01))) $Snap.unit))
(assert (length%precondition ($Snap.first $t@66@01) this@57@01))
(assert (<= j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@66@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
  $Snap.unit))
(assert (=>
  (> j@65@01 0)
  (and
    (> j@65@01 0)
    (<= 0 (- j@65@01 1))
    (< (- j@65@01 1) (length ($Snap.first $t@66@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1)))))
(assert (or (not (> j@65@01 0)) (> j@65@01 0)))
(assert (=>
  (> j@65@01 0)
  (<=
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@65@01 1))
    elem@58@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
  $Snap.unit))
(assert (= (length ($Snap.first $t@66@01) this@57@01) (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@66@01)))))
  $Snap.unit))
(assert (forall ((k@67@01 Int)) (!
  (and
    (or (not (<= 0 k@67@01)) (<= 0 k@67@01))
    (=>
      (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))
      (and
        (< k@67@01 (length ($Snap.first $t@66@01) this@57@01))
        (<= 0 k@67@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@66@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)
        (< k@67@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)))
    (or
      (not
        (and
          (< k@67@01 (length ($Snap.first $t@66@01) this@57@01))
          (<= 0 k@67@01)))
      (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
  :qid |prog.l111-aux|)))
(assert (forall ((k@67@01 Int)) (!
  (=>
    (and (< k@67@01 (length ($Snap.first $t@66@01) this@57@01)) (<= 0 k@67@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@67@01))
  :qid |prog.l111|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] j < length(this) && itemAt(this, j) < elem
; [eval] j < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 29 | j@65@01 < length(First:($t@66@01), this@57@01) | live]
; [else-branch: 29 | !(j@65@01 < length(First:($t@66@01), this@57@01)) | live]
(push) ; 6
; [then-branch: 29 | j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
; [eval] itemAt(this, j) < elem
; [eval] itemAt(this, j)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | !(j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
  (and
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))))
; Joined path conditions
(assert (or
  (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
      elem@58@01)
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
    elem@58@01)
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01) | live]
; [else-branch: 30 | !(itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (and
  (<
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
    elem@58@01)
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
; [exec]
; unfold acc(AList(this), write)
(assert (=
  ($Snap.first $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.second ($Snap.first $t@66@01)))))
(assert (not (= this@57@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@66@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@66@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@66@01)))) $Snap.unit))
; [eval] 0 <= this.size
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
  $Snap.unit))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
  $Snap.unit))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(assert (<
  0
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(declare-const i@69@01 Int)
(push) ; 6
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 31 | 0 <= i@69@01 | live]
; [else-branch: 31 | !(0 <= i@69@01) | live]
(push) ; 8
; [then-branch: 31 | 0 <= i@69@01]
(assert (<= 0 i@69@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 8
(push) ; 8
; [else-branch: 31 | !(0 <= i@69@01)]
(assert (not (<= 0 i@69@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@69@01)) (<= 0 i@69@01)))
(assert (and
  (<
    i@69@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<= 0 i@69@01)))
; [eval] loc(this.elems, i)
(pop) ; 6
(declare-fun inv@70@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@69@01 Int)) (!
  (=>
    (and
      (<
        i@69@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@69@01))
    (or (not (<= 0 i@69@01)) (<= 0 i@69@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@69@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@69@01 Int)) (!
  (=>
    (and
      (<
        i@69@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@69@01))
    (=
      (inv@70@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@69@01))
      i@69@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@69@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@70@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@70@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) (inv@70@01 r))
      r))
  :pattern ((inv@70@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@69@01 Int)) (!
  (=>
    (and
      (<
        i@69@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@69@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@69@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@69@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@71@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@70@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@70@01 r)))
    (=
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@70@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@70@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) r) r))
  :pattern ((inv@70@01 r))
  :qid |quant-u-50|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (AList%trigger ($Snap.first $t@66@01) this@57@01))
; [exec]
; j := j + 1
; [eval] j + 1
(declare-const j@72@01 Int)
(assert (= j@72@01 (+ j@65@01 1)))
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(declare-const i@73@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 32 | 0 <= i@73@01 | live]
; [else-branch: 32 | !(0 <= i@73@01) | live]
(push) ; 8
; [then-branch: 32 | 0 <= i@73@01]
(assert (<= 0 i@73@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 8
(push) ; 8
; [else-branch: 32 | !(0 <= i@73@01)]
(assert (not (<= 0 i@73@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@73@01)) (<= 0 i@73@01)))
(assert (and
  (<
    i@73@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<= 0 i@73@01)))
; [eval] loc(this.elems, i)
(pop) ; 6
(declare-fun inv@74@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and
      (<
        i@73@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@73@01))
    (or (not (<= 0 i@73@01)) (<= 0 i@73@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@73@01))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<
            i1@73@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 i1@73@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@73@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@73@01)))
      (and
        (and
          (<
            i2@73@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 i2@73@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@73@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@73@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@73@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and
      (<
        i@73@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@73@01))
    (=
      (inv@74@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@73@01))
      i@73@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@73@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@74@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@74@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) (inv@74@01 r))
      r))
  :pattern ((inv@74@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@74@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@74@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@71@01  $FVF<val>) r) r))
  :pattern ((inv@74@01 r))
  :qid |quant-u-52|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@75@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@74@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@74@01 r)))
    ($Perm.min
      (ite
        (and
          (<
            (inv@70@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@70@01 r)))
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
          (<
            (inv@70@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@75@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
  (=>
    (and
      (<
        (inv@74@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@74@01 r)))
    (= (- $Perm.Write (pTaken@75@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@76@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@76@01  $FVF<val>)))
      (and
        (<
          (inv@74@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@74@01 r))))
    (=>
      (and
        (<
          (inv@74@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@74@01 r)))
      (Set_in r ($FVF.domain_val (as sm@76@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@76@01  $FVF<val>))))
  :qid |qp.fvfDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@74@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@74@01 r)))
      (and
        (<
          (inv@70@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@70@01 r))))
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (AList%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
; Loop head block: Re-establish invariant
; [eval] 0 <= j
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 j@72@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 j@72@01))
; [eval] j <= length(this)
; [eval] length(this)
(push) ; 6
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
(push) ; 6
(assert (not (<=
  j@72@01
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<=
  j@72@01
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)))
; [eval] j > 0 ==> itemAt(this, j - 1) <= elem
; [eval] j > 0
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (> j@72@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (> j@72@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | j@72@01 > 0 | live]
; [else-branch: 33 | !(j@72@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 33 | j@72@01 > 0]
(assert (> j@72@01 0))
; [eval] itemAt(this, j - 1) <= elem
; [eval] itemAt(this, j - 1)
; [eval] j - 1
(push) ; 8
; [eval] 0 <= index
(push) ; 9
(assert (not (<= 0 (- j@72@01 1))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- j@72@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(assert (not (<
  (- j@72@01 1)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- j@72@01 1)
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@72@01 1)))
(pop) ; 8
; Joined path conditions
(assert (and
  (<= 0 (- j@72@01 1))
  (<
    (- j@72@01 1)
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@66@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@66@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@72@01 1))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (> j@72@01 0)
  (and
    (> j@72@01 0)
    (<= 0 (- j@72@01 1))
    (<
      (- j@72@01 1)
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@72@01 1)))))
(assert (> j@72@01 0))
(push) ; 6
(assert (not (=>
  (> j@72@01 0)
  (<=
    (itemAt ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@72@01 1))
    elem@58@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (> j@72@01 0)
  (<=
    (itemAt ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- j@72@01 1))
    elem@58@01)))
; [eval] length(this) == old(length(this))
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old(length(this))
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (=
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)
  (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)
  (length $t@60@01 this@57@01)))
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@77@01 Int)
(push) ; 6
; [eval] 0 <= k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < length(this)
; [eval] 0 <= k
(push) ; 7
; [then-branch: 34 | 0 <= k@77@01 | live]
; [else-branch: 34 | !(0 <= k@77@01) | live]
(push) ; 8
; [then-branch: 34 | 0 <= k@77@01]
(assert (<= 0 k@77@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 9
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 34 | !(0 <= k@77@01)]
(assert (not (<= 0 k@77@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@77@01)) (<= 0 k@77@01)))
(push) ; 7
; [then-branch: 35 | k@77@01 < length((First:(First:($t@66@01)), (First:(Second:(First:($t@66@01))), (_, (_, (_, sm@76@01))))), this@57@01) && 0 <= k@77@01 | live]
; [else-branch: 35 | !(k@77@01 < length((First:(First:($t@66@01)), (First:(Second:(First:($t@66@01))), (_, (_, (_, sm@76@01))))), this@57@01) && 0 <= k@77@01) | live]
(push) ; 8
; [then-branch: 35 | k@77@01 < length((First:(First:($t@66@01)), (First:(Second:(First:($t@66@01))), (_, (_, (_, sm@76@01))))), this@57@01) && 0 <= k@77@01]
(assert (and
  (<
    k@77@01
    (length ($Snap.combine
      ($Snap.first ($Snap.first $t@66@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
  (<= 0 k@77@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 9
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
(pop) ; 9
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 9
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (< k@77@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (< k@77@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
(pop) ; 9
; Joined path conditions
(assert (and
  (< k@77@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | !(k@77@01 < length((First:(First:($t@66@01)), (First:(Second:(First:($t@66@01))), (_, (_, (_, sm@76@01))))), this@57@01) && 0 <= k@77@01)]
(assert (not
  (and
    (<
      k@77@01
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
    (<= 0 k@77@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (<
      k@77@01
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
    (<= 0 k@77@01))
  (and
    (<
      k@77@01
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
    (<= 0 k@77@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
    (< k@77@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        k@77@01
        (length ($Snap.combine
          ($Snap.first ($Snap.first $t@66@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
      (<= 0 k@77@01)))
  (and
    (<
      k@77@01
      (length ($Snap.combine
        ($Snap.first ($Snap.first $t@66@01))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
    (<= 0 k@77@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@77@01 Int)) (!
  (and
    (or (not (<= 0 k@77@01)) (<= 0 k@77@01))
    (=>
      (and
        (<
          k@77@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
        (<= 0 k@77@01))
      (and
        (<
          k@77@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
        (<= 0 k@77@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
        (< k@77@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)))
    (or
      (not
        (and
          (<
            k@77@01
            (length ($Snap.combine
              ($Snap.first ($Snap.first $t@66@01))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
          (<= 0 k@77@01)))
      (and
        (<
          k@77@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
        (<= 0 k@77@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
  :qid |prog.l111-aux|)))
(assert (forall ((k@77@01 Int)) (!
  (and
    (length%precondition ($Snap.combine
      ($Snap.first ($Snap.first $t@66@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)
    (=>
      (and
        (<
          k@77@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
        (<= 0 k@77@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
  :qid |prog.l111_precondition|)))
(push) ; 6
(assert (not (forall ((k@77@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.combine
          ($Snap.first ($Snap.first $t@66@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01)
        (=>
          (and
            (<
              k@77@01
              (length ($Snap.combine
                ($Snap.first ($Snap.first $t@66@01))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
            (<= 0 k@77@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first ($Snap.first $t@66@01))
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))))
      (and
        (<
          k@77@01
          (length ($Snap.combine
            ($Snap.first ($Snap.first $t@66@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
        (<= 0 k@77@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first $t@66@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
  :qid |prog.l111|))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@77@01 Int)) (!
  (=>
    (and
      (<
        k@77@01
        (length ($Snap.combine
          ($Snap.first ($Snap.first $t@66@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>))))))) this@57@01))
      (<= 0 k@77@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first $t@66@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@76@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@77@01))
  :qid |prog.l111|)))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not
  (and
    (<
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
      elem@58@01)
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))))
(pop) ; 5
; [eval] !(j < length(this) && itemAt(this, j) < elem)
; [eval] j < length(this) && itemAt(this, j) < elem
; [eval] j < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 36 | j@65@01 < length(First:($t@66@01), this@57@01) | live]
; [else-branch: 36 | !(j@65@01 < length(First:($t@66@01), this@57@01)) | live]
(push) ; 6
; [then-branch: 36 | j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))
; [eval] itemAt(this, j) < elem
; [eval] itemAt(this, j)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 7
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@66@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | !(j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (<
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
    elem@58@01)
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (<
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
      elem@58@01)
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | !(itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01)) | live]
; [else-branch: 37 | itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 37 | !(itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01))]
(assert (not
  (and
    (<
      (itemAt ($Snap.combine
        ($Snap.first $t@66@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
      elem@58@01)
    (< j@65@01 (length ($Snap.first $t@66@01) this@57@01)))))
; [exec]
; unfold acc(AList(this), write)
(assert (=
  ($Snap.first $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@66@01))
    ($Snap.second ($Snap.first $t@66@01)))))
(assert (not (= this@57@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@66@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@66@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@66@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@66@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@66@01)))) $Snap.unit))
; [eval] 0 <= this.size
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
  $Snap.unit))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))
  $Snap.unit))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(assert (<
  0
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(declare-const i@78@01 Int)
(push) ; 6
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 38 | 0 <= i@78@01 | live]
; [else-branch: 38 | !(0 <= i@78@01) | live]
(push) ; 8
; [then-branch: 38 | 0 <= i@78@01]
(assert (<= 0 i@78@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 8
(push) ; 8
; [else-branch: 38 | !(0 <= i@78@01)]
(assert (not (<= 0 i@78@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@78@01)) (<= 0 i@78@01)))
(assert (and
  (<
    i@78@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<= 0 i@78@01)))
; [eval] loc(this.elems, i)
(pop) ; 6
(declare-fun inv@79@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and
      (<
        i@78@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@78@01))
    (or (not (<= 0 i@78@01)) (<= 0 i@78@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@78@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and
      (<
        i@78@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@78@01))
    (=
      (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@78@01))
      i@78@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@78@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@79@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@79@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) (inv@79@01 r))
      r))
  :pattern ((inv@79@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@78@01 Int)) (!
  (=>
    (and
      (<
        i@78@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@78@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@78@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@78@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@80@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@79@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@79@01 r)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@79@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@79@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) r) r))
  :pattern ((inv@79@01 r))
  :qid |quant-u-58|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (AList%trigger ($Snap.first $t@66@01) this@57@01))
; [eval] this.size == len(this.elems)
; [eval] len(this.elems)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(First:($t@66@01))) == len[Int](First:(First:($t@66@01))) | live]
; [else-branch: 39 | First:(Second:(First:($t@66@01))) != len[Int](First:(First:($t@66@01))) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | First:(Second:(First:($t@66@01))) == len[Int](First:(First:($t@66@01)))]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
; [exec]
; var a: Array
(declare-const a@81@01 Array_)
; [exec]
; inhale len(a) == len(this.elems) * 2 &&
;   (forall i: Int ::0 <= i && i < len(a) ==> acc(loc(a, i).val, write))
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(assert (= ($Snap.first $t@82@01) $Snap.unit))
; [eval] len(a) == len(this.elems) * 2
; [eval] len(a)
; [eval] len(this.elems) * 2
; [eval] len(this.elems)
(assert (=
  (len<Int> a@81@01)
  (*
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))
    2)))
(declare-const i@83@01 Int)
(push) ; 7
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 8
; [then-branch: 40 | 0 <= i@83@01 | live]
; [else-branch: 40 | !(0 <= i@83@01) | live]
(push) ; 9
; [then-branch: 40 | 0 <= i@83@01]
(assert (<= 0 i@83@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 9
(push) ; 9
; [else-branch: 40 | !(0 <= i@83@01)]
(assert (not (<= 0 i@83@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@83@01)) (<= 0 i@83@01)))
(assert (and (< i@83@01 (len<Int> a@81@01)) (<= 0 i@83@01)))
; [eval] loc(a, i)
(pop) ; 7
(declare-fun inv@84@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (< i@83@01 (len<Int> a@81@01)) (<= 0 i@83@01))
    (or (not (<= 0 i@83@01)) (<= 0 i@83@01)))
  :pattern ((loc<Ref> a@81@01 i@83@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (< i@83@01 (len<Int> a@81@01)) (<= 0 i@83@01))
    (= (inv@84@01 (loc<Ref> a@81@01 i@83@01)) i@83@01))
  :pattern ((loc<Ref> a@81@01 i@83@01))
  :qid |quant-u-60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
    (= (loc<Ref> a@81@01 (inv@84@01 r)) r))
  :pattern ((inv@84@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@83@01 Int)) (!
  (=>
    (and (< i@83@01 (len<Int> a@81@01)) (<= 0 i@83@01))
    (not (= (loc<Ref> a@81@01 i@83@01) $Ref.null)))
  :pattern ((loc<Ref> a@81@01 i@83@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@85@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@79@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@79@01 r)))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) r) r))
  :pattern ((inv@84@01 r))
  :qid |quant-u-61|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { loc(a, i).val }
;     0 <= i && i < len(this.elems) ==>
;     loc(a, i).val == loc(this.elems, i).val)
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 $Snap.unit))
; [eval] (forall i: Int :: { loc(a, i).val } 0 <= i && i < len(this.elems) ==> loc(a, i).val == loc(this.elems, i).val)
(declare-const i@87@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= i && i < len(this.elems) ==> loc(a, i).val == loc(this.elems, i).val
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 8
; [then-branch: 41 | 0 <= i@87@01 | live]
; [else-branch: 41 | !(0 <= i@87@01) | live]
(push) ; 9
; [then-branch: 41 | 0 <= i@87@01]
(assert (<= 0 i@87@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 9
(push) ; 9
; [else-branch: 41 | !(0 <= i@87@01)]
(assert (not (<= 0 i@87@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@87@01)) (<= 0 i@87@01)))
(push) ; 8
; [then-branch: 42 | i@87@01 < len[Int](First:(First:($t@66@01))) && 0 <= i@87@01 | live]
; [else-branch: 42 | !(i@87@01 < len[Int](First:(First:($t@66@01))) && 0 <= i@87@01) | live]
(push) ; 9
; [then-branch: 42 | i@87@01 < len[Int](First:(First:($t@66@01))) && 0 <= i@87@01]
(assert (and
  (<
    i@87@01
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<= 0 i@87@01)))
; [eval] loc(a, i).val == loc(this.elems, i).val
; [eval] loc(a, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01)) (loc<Ref> a@81@01 i@87@01)))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (< (inv@84@01 (loc<Ref> a@81@01 i@87@01)) (len<Int> a@81@01))
        (<= 0 (inv@84@01 (loc<Ref> a@81@01 i@87@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (<
          (inv@79@01 (loc<Ref> a@81@01 i@87@01))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@79@01 (loc<Ref> a@81@01 i@87@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01)))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<
          (inv@84@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))
          (len<Int> a@81@01))
        (<=
          0
          (inv@84@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (<
          (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<=
          0
          (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 42 | !(i@87@01 < len[Int](First:(First:($t@66@01))) && 0 <= i@87@01)]
(assert (not
  (and
    (<
      i@87@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<= 0 i@87@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<
      i@87@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<= 0 i@87@01))
  (and
    (<
      i@87@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<= 0 i@87@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01)) (loc<Ref> a@81@01 i@87@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@87@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@87@01)))
  (and
    (<
      i@87@01
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<= 0 i@87@01))))
; Definitional axioms for snapshot map values
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@87@01 Int)) (!
  (and
    (or (not (<= 0 i@87@01)) (<= 0 i@87@01))
    (=>
      (and
        (<
          i@87@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 i@87@01))
      (and
        (<
          i@87@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 i@87@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01)) (loc<Ref> a@81@01 i@87@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))))
    (or
      (not
        (and
          (<
            i@87@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 i@87@01)))
      (and
        (<
          i@87@01
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 i@87@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01)) (loc<Ref> a@81@01 i@87@01)))
  :qid |prog.l123-aux|)))
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and
      (<
        i@87@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 i@87@01))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01))
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@87@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@81@01 i@87@01)) (loc<Ref> a@81@01 i@87@01)))
  :qid |prog.l123|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; this.elems := a
; [exec]
; t := this.size
(declare-const t@88@01 Int)
(assert (=
  t@88@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(declare-const t@89@01 Int)
(set-option :timeout 0)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 ($Snap.combine ($Snap.first $t@90@01) ($Snap.second $t@90@01))))
(assert (=
  ($Snap.second $t@90@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@90@01))
    ($Snap.second ($Snap.second $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@90@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@90@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
; [eval] loc(this.elems, j)
(declare-const sm@91@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@90@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  (not
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      $Ref.null))))
(declare-const sm@92@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@92@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@92@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@92@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef26|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@92@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@90@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
  $Snap.unit))
; [eval] j <= t
(assert (<= j@65@01 t@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
  $Snap.unit))
; [eval] t <= this.size
(assert (<= t@89@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
  $Snap.unit))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))
  (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
  $Snap.unit))
; [eval] -1 <= j
; [eval] -1
(assert (<= (- 0 1) j@65@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
  $Snap.unit))
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))))
(declare-const i@93@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 43 | j@65@01 < i@93@01 | live]
; [else-branch: 43 | !(j@65@01 < i@93@01) | live]
(push) ; 10
; [then-branch: 43 | j@65@01 < i@93@01]
(assert (< j@65@01 i@93@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 43 | !(j@65@01 < i@93@01)]
(assert (not (< j@65@01 i@93@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@93@01)) (< j@65@01 i@93@01)))
(assert (and
  (<= i@93@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (< j@65@01 i@93@01)))
; [eval] loc(this.elems, i)
(pop) ; 8
(declare-fun inv@94@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (or (not (< j@65@01 i@93@01)) (< j@65@01 i@93@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (=
      (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
      i@93@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (inv@94@01 r))
      r))
  :pattern ((inv@94@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@95@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) r) r))
  :pattern ((inv@94@01 r))
  :qid |quant-u-64|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@96@01 Int)
(push) ; 8
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 9
; [then-branch: 44 | j@65@01 <= i@96@01 | live]
; [else-branch: 44 | !(j@65@01 <= i@96@01) | live]
(push) ; 10
; [then-branch: 44 | j@65@01 <= i@96@01]
(assert (<= j@65@01 i@96@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 44 | !(j@65@01 <= i@96@01)]
(assert (not (<= j@65@01 i@96@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@96@01)) (<= j@65@01 i@96@01)))
(push) ; 9
; [then-branch: 45 | i@96@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@96@01 | live]
; [else-branch: 45 | !(i@96@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@96@01) | live]
(push) ; 10
; [then-branch: 45 | i@96@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@96@01]
(assert (and
  (<= i@96@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (<= j@65@01 i@96@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 11
; [then-branch: 46 | i@96@01 < t@89@01 | live]
; [else-branch: 46 | !(i@96@01 < t@89@01) | live]
(push) ; 12
; [then-branch: 46 | i@96@01 < t@89@01]
(assert (< i@96@01 t@89@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<
          j@65@01
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 i@96@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@96@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< i@96@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< i@96@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 i@96@01)
  (< i@96@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 46 | !(i@96@01 < t@89@01)]
(assert (not (< i@96@01 t@89@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< i@96@01 t@89@01)
  (and
    (< i@96@01 t@89@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
    (<= 0 i@96@01)
    (< i@96@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01))))
; Joined path conditions
(assert (or (not (< i@96@01 t@89@01)) (< i@96@01 t@89@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 45 | !(i@96@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@96@01)]
(assert (not
  (and
    (<= i@96@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@96@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<= i@96@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@96@01))
  (and
    (<= i@96@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@96@01)
    (=>
      (< i@96@01 t@89@01)
      (and
        (< i@96@01 t@89@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
        (<= 0 i@96@01)
        (< i@96@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
    (or (not (< i@96@01 t@89@01)) (< i@96@01 t@89@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@96@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (<= j@65@01 i@96@01)))
  (and
    (<= i@96@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@96@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@96@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@96@01)) (<= j@65@01 i@96@01))
    (=>
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01)
        (=>
          (< i@96@01 t@89@01)
          (and
            (< i@96@01 t@89@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
            (<= 0 i@96@01)
            (< i@96@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
        (or (not (< i@96@01 t@89@01)) (< i@96@01 t@89@01))))
    (or
      (not
        (and
          (<=
            i@96@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<= j@65@01 i@96@01)))
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))
      (< i@96@01 t@89@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
  :qid |prog.l136|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@97@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 47 | j@65@01 < i@97@01 | live]
; [else-branch: 47 | !(j@65@01 < i@97@01) | live]
(push) ; 10
; [then-branch: 47 | j@65@01 < i@97@01]
(assert (< j@65@01 i@97@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 47 | !(j@65@01 < i@97@01)]
(assert (not (< j@65@01 i@97@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@97@01)) (< j@65@01 i@97@01)))
(push) ; 9
; [then-branch: 48 | i@97@01 <= First:(Second:($t@90@01)) && j@65@01 < i@97@01 | live]
; [else-branch: 48 | !(i@97@01 <= First:(Second:($t@90@01)) && j@65@01 < i@97@01) | live]
(push) ; 10
; [then-branch: 48 | i@97@01 <= First:(Second:($t@90@01)) && j@65@01 < i@97@01]
(assert (and
  (<= i@97@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (< j@65@01 i@97@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 11
; [then-branch: 49 | i@97@01 > t@89@01 | live]
; [else-branch: 49 | !(i@97@01 > t@89@01) | live]
(push) ; 12
; [then-branch: 49 | i@97@01 > t@89@01]
(assert (> i@97@01 t@89@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<
          j@65@01
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- i@97@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@97@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- i@97@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@97@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- i@97@01 1))
  (< (- i@97@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 49 | !(i@97@01 > t@89@01)]
(assert (not (> i@97@01 t@89@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (> i@97@01 t@89@01)
  (and
    (> i@97@01 t@89@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
    (<= 0 (- i@97@01 1))
    (< (- i@97@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1)))))
; Joined path conditions
(assert (or (not (> i@97@01 t@89@01)) (> i@97@01 t@89@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 48 | !(i@97@01 <= First:(Second:($t@90@01)) && j@65@01 < i@97@01)]
(assert (not
  (and
    (<= i@97@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@97@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<= i@97@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@97@01))
  (and
    (<= i@97@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@97@01)
    (=>
      (> i@97@01 t@89@01)
      (and
        (> i@97@01 t@89@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
        (<= 0 (- i@97@01 1))
        (< (- i@97@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1))))
    (or (not (> i@97@01 t@89@01)) (> i@97@01 t@89@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@97@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@97@01)))
  (and
    (<= i@97@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@97@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@97@01 Int)) (!
  (and
    (or (not (< j@65@01 i@97@01)) (< j@65@01 i@97@01))
    (=>
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01)
        (=>
          (> i@97@01 t@89@01)
          (and
            (> i@97@01 t@89@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
            (<= 0 (- i@97@01 1))
            (< (- i@97@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1))))
        (or (not (> i@97@01 t@89@01)) (> i@97@01 t@89@01))))
    (or
      (not
        (and
          (<=
            i@97@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i@97@01)))
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@97@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))
      (> i@97@01 t@89@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@97@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
  :qid |prog.l137|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 8
; [eval] t > j
(pop) ; 8
(push) ; 8
; [eval] !(t > j)
; [eval] t > j
(pop) ; 8
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] loc(this.elems, j)
(declare-const sm@98@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@79@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
      (<= 0 (inv@79@01 r)))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 j@65@01)) (loc<Ref> a@81@01 j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@81@01 j@65@01))
    ($Perm.min
      (ite
        (and
          (<
            (inv@79@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@81@01 j@65@01))
    ($Perm.min
      (ite
        (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (<
            (inv@79@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@99@01 r))
    $Perm.No)
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@81@01 j@65@01))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@100@01 r))
    $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@81@01 j@65@01))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@99@01 r)) (pTaken@100@01 r))
      $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (<
      (inv@79@01 (loc<Ref> a@81@01 j@65@01))
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<= 0 (inv@79@01 (loc<Ref> a@81@01 j@65@01))))
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 j@65@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) (loc<Ref> a@81@01 j@65@01)))))
(assert (=>
  (and
    (< (inv@84@01 (loc<Ref> a@81@01 j@65@01)) (len<Int> a@81@01))
    (<= 0 (inv@84@01 (loc<Ref> a@81@01 j@65@01))))
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 j@65@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) (loc<Ref> a@81@01 j@65@01)))))
(assert (and
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) (loc<Ref> a@81@01 j@65@01)) (loc<Ref> a@81@01 j@65@01))
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) (loc<Ref> a@81@01 j@65@01)) (loc<Ref> a@81@01 j@65@01))))
; [eval] j <= t
(set-option :timeout 0)
(push) ; 8
(assert (not (<= j@65@01 t@88@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= j@65@01 t@88@01))
; [eval] t <= this.size
(push) ; 8
(assert (not (<=
  t@88@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<=
  t@88@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (length $t@60@01 this@57@01)))
; [eval] -1 <= j
; [eval] -1
(push) ; 8
(assert (not (<= (- 0 1) j@65@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= (- 0 1) j@65@01))
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(push) ; 8
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> a@81@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> a@81@01)))
(declare-const i@101@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 50 | j@65@01 < i@101@01 | live]
; [else-branch: 50 | !(j@65@01 < i@101@01) | live]
(push) ; 10
; [then-branch: 50 | j@65@01 < i@101@01]
(assert (< j@65@01 i@101@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 50 | !(j@65@01 < i@101@01)]
(assert (not (< j@65@01 i@101@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@101@01)) (< j@65@01 i@101@01)))
(assert (and
  (<=
    i@101@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (< j@65@01 i@101@01)))
; [eval] loc(this.elems, i)
(pop) ; 8
(declare-fun inv@102@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and
      (<=
        i@101@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@101@01))
    (or (not (< j@65@01 i@101@01)) (< j@65@01 i@101@01)))
  :pattern ((loc<Ref> a@81@01 i@101@01))
  :qid |val-aux|)))
(declare-const sm@103@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@100@01 r)))
    (=
      ($FVF.lookup_val (as sm@103@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@103@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r)))
    (=
      ($FVF.lookup_val (as sm@103@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@103@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@103@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef35|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((i1@101@01 Int) (i2@101@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<=
            i1@101@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i1@101@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@103@01  $FVF<val>) (loc<Ref> a@81@01 i1@101@01)) (loc<Ref> a@81@01 i1@101@01)))
      (and
        (and
          (<=
            i2@101@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i2@101@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@103@01  $FVF<val>) (loc<Ref> a@81@01 i2@101@01)) (loc<Ref> a@81@01 i2@101@01)))
      (= (loc<Ref> a@81@01 i1@101@01) (loc<Ref> a@81@01 i2@101@01)))
    (= i1@101@01 i2@101@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and
      (<=
        i@101@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@101@01))
    (= (inv@102@01 (loc<Ref> a@81@01 i@101@01)) i@101@01))
  :pattern ((loc<Ref> a@81@01 i@101@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@102@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@102@01 r)))
    (= (loc<Ref> a@81@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@102@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@102@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@103@01  $FVF<val>) r) r))
  :pattern ((inv@102@01 r))
  :qid |quant-u-71|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@102@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@102@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@100@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@102@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@102@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r))
      (- $Perm.Write (pTaken@104@01 r)))
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
      (-
        (ite
          (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@100@01 r))
      (pTaken@104@01 r))
    $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@102@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@102@01 r)))
    (= (- $Perm.Write (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@106@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 9
; [then-branch: 51 | j@65@01 <= i@106@01 | live]
; [else-branch: 51 | !(j@65@01 <= i@106@01) | live]
(push) ; 10
; [then-branch: 51 | j@65@01 <= i@106@01]
(assert (<= j@65@01 i@106@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 51 | !(j@65@01 <= i@106@01)]
(assert (not (<= j@65@01 i@106@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@106@01)) (<= j@65@01 i@106@01)))
(push) ; 9
; [then-branch: 52 | i@106@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@106@01 | live]
; [else-branch: 52 | !(i@106@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@106@01) | live]
(push) ; 10
; [then-branch: 52 | i@106@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@106@01]
(assert (and
  (<=
    i@106@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (<= j@65@01 i@106@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 11
; [then-branch: 53 | i@106@01 < t@88@01 | live]
; [else-branch: 53 | !(i@106@01 < t@88@01) | live]
(push) ; 12
; [then-branch: 53 | i@106@01 < t@88@01]
(assert (< i@106@01 t@88@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01)) (loc<Ref> a@81@01 i@106@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<
          (inv@79@01 (loc<Ref> a@81@01 i@106@01))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@79@01 (loc<Ref> a@81@01 i@106@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (< (inv@84@01 (loc<Ref> a@81@01 i@106@01)) (len<Int> a@81@01))
        (<= 0 (inv@84@01 (loc<Ref> a@81@01 i@106@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 i@106@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@106@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< i@106@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< i@106@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 i@106@01)
  (< i@106@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 53 | !(i@106@01 < t@88@01)]
(assert (not (< i@106@01 t@88@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< i@106@01 t@88@01)
  (and
    (< i@106@01 t@88@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01)) (loc<Ref> a@81@01 i@106@01))
    (<= 0 i@106@01)
    (< i@106@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01))))
; Joined path conditions
(assert (or (not (< i@106@01 t@88@01)) (< i@106@01 t@88@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 52 | !(i@106@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@106@01)]
(assert (not
  (and
    (<=
      i@106@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@106@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@106@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@106@01))
  (and
    (<=
      i@106@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@106@01)
    (=>
      (< i@106@01 t@88@01)
      (and
        (< i@106@01 t@88@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01)) (loc<Ref> a@81@01 i@106@01))
        (<= 0 i@106@01)
        (< i@106@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01)))
    (or (not (< i@106@01 t@88@01)) (< i@106@01 t@88@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@106@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (<= j@65@01 i@106@01)))
  (and
    (<=
      i@106@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@106@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@106@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@106@01)) (<= j@65@01 i@106@01))
    (=>
      (and
        (<=
          i@106@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@106@01))
      (and
        (<=
          i@106@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@106@01)
        (=>
          (< i@106@01 t@88@01)
          (and
            (< i@106@01 t@88@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01)) (loc<Ref> a@81@01 i@106@01))
            (<= 0 i@106@01)
            (< i@106@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01)))
        (or (not (< i@106@01 t@88@01)) (< i@106@01 t@88@01))))
    (or
      (not
        (and
          (<=
            i@106@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (<= j@65@01 i@106@01)))
      (and
        (<=
          i@106@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@106@01))))
  :pattern ((loc<Ref> a@81@01 i@106@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@106@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@106@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@106@01))
      (< i@106@01 t@88@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01))
  :pattern ((loc<Ref> a@81@01 i@106@01))
  :qid |prog.l136_precondition|)))
(push) ; 8
(assert (not (forall ((i@106@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@106@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
            (<= j@65@01 i@106@01))
          (< i@106@01 t@88@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01))
      (and
        (and
          (<=
            i@106@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (<= j@65@01 i@106@01))
        (< i@106@01 t@88@01)))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01)))
  :pattern ((loc<Ref> a@81@01 i@106@01))
  :qid |prog.l136|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@106@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@106@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@106@01))
      (< i@106@01 t@88@01))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@106@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@106@01)))
  :pattern ((loc<Ref> a@81@01 i@106@01))
  :qid |prog.l136|)))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@107@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 54 | j@65@01 < i@107@01 | live]
; [else-branch: 54 | !(j@65@01 < i@107@01) | live]
(push) ; 10
; [then-branch: 54 | j@65@01 < i@107@01]
(assert (< j@65@01 i@107@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 54 | !(j@65@01 < i@107@01)]
(assert (not (< j@65@01 i@107@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@107@01)) (< j@65@01 i@107@01)))
(push) ; 9
; [then-branch: 55 | i@107@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@107@01 | live]
; [else-branch: 55 | !(i@107@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@107@01) | live]
(push) ; 10
; [then-branch: 55 | i@107@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@107@01]
(assert (and
  (<=
    i@107@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (< j@65@01 i@107@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 11
; [then-branch: 56 | i@107@01 > t@88@01 | live]
; [else-branch: 56 | !(i@107@01 > t@88@01) | live]
(push) ; 12
; [then-branch: 56 | i@107@01 > t@88@01]
(assert (> i@107@01 t@88@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01)) (loc<Ref> a@81@01 i@107@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<
          (inv@79@01 (loc<Ref> a@81@01 i@107@01))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
        (<= 0 (inv@79@01 (loc<Ref> a@81@01 i@107@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (< (inv@84@01 (loc<Ref> a@81@01 i@107@01)) (len<Int> a@81@01))
        (<= 0 (inv@84@01 (loc<Ref> a@81@01 i@107@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- i@107@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@107@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- i@107@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@107@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- i@107@01 1))
  (< (- i@107@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 56 | !(i@107@01 > t@88@01)]
(assert (not (> i@107@01 t@88@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (> i@107@01 t@88@01)
  (and
    (> i@107@01 t@88@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01)) (loc<Ref> a@81@01 i@107@01))
    (<= 0 (- i@107@01 1))
    (< (- i@107@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1)))))
; Joined path conditions
(assert (or (not (> i@107@01 t@88@01)) (> i@107@01 t@88@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 55 | !(i@107@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@107@01)]
(assert (not
  (and
    (<=
      i@107@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@107@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@107@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@107@01))
  (and
    (<=
      i@107@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@107@01)
    (=>
      (> i@107@01 t@88@01)
      (and
        (> i@107@01 t@88@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01)) (loc<Ref> a@81@01 i@107@01))
        (<= 0 (- i@107@01 1))
        (< (- i@107@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1))))
    (or (not (> i@107@01 t@88@01)) (> i@107@01 t@88@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@107@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@107@01)))
  (and
    (<=
      i@107@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@107@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@107@01 Int)) (!
  (and
    (or (not (< j@65@01 i@107@01)) (< j@65@01 i@107@01))
    (=>
      (and
        (<=
          i@107@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@107@01))
      (and
        (<=
          i@107@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@107@01)
        (=>
          (> i@107@01 t@88@01)
          (and
            (> i@107@01 t@88@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01)) (loc<Ref> a@81@01 i@107@01))
            (<= 0 (- i@107@01 1))
            (< (- i@107@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1))))
        (or (not (> i@107@01 t@88@01)) (> i@107@01 t@88@01))))
    (or
      (not
        (and
          (<=
            i@107@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i@107@01)))
      (and
        (<=
          i@107@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@107@01))))
  :pattern ((loc<Ref> a@81@01 i@107@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@107@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@107@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@107@01))
      (> i@107@01 t@88@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1)))
  :pattern ((loc<Ref> a@81@01 i@107@01))
  :qid |prog.l137_precondition|)))
(push) ; 8
(assert (not (forall ((i@107@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@107@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
            (< j@65@01 i@107@01))
          (> i@107@01 t@88@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@107@01 1)))
      (and
        (and
          (<=
            i@107@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i@107@01))
        (> i@107@01 t@88@01)))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@107@01
        1))))
  :pattern ((loc<Ref> a@81@01 i@107@01))
  :qid |prog.l137|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@107@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@107@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@107@01))
      (> i@107@01 t@88@01))
    (=
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) (loc<Ref> a@81@01 i@107@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@107@01
        1))))
  :pattern ((loc<Ref> a@81@01 i@107@01))
  :qid |prog.l137|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (inv@94@01 r))
      r))
  :pattern ((inv@94@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@95@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (=
      (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
      i@93@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |quant-u-63|)))
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |val-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) r) r))
  :pattern ((inv@94@01 r))
  :qid |quant-u-64|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
  $Snap.unit))
(assert (forall ((i@96@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@96@01)) (<= j@65@01 i@96@01))
    (=>
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01)
        (=>
          (< i@96@01 t@89@01)
          (and
            (< i@96@01 t@89@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
            (<= 0 i@96@01)
            (< i@96@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
        (or (not (< i@96@01 t@89@01)) (< i@96@01 t@89@01))))
    (or
      (not
        (and
          (<=
            i@96@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<= j@65@01 i@96@01)))
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@96@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@96@01))
      (< i@96@01 t@89@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@96@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@96@01))
  :qid |prog.l136|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
  $Snap.unit))
(assert (forall ((i@97@01 Int)) (!
  (and
    (or (not (< j@65@01 i@97@01)) (< j@65@01 i@97@01))
    (=>
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01)
        (=>
          (> i@97@01 t@89@01)
          (and
            (> i@97@01 t@89@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
            (<= 0 (- i@97@01 1))
            (< (- i@97@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@97@01 1))))
        (or (not (> i@97@01 t@89@01)) (> i@97@01 t@89@01))))
    (or
      (not
        (and
          (<=
            i@97@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i@97@01)))
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@97@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@97@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@97@01))
      (> i@97@01 t@89@01))
    (=
      ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@97@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@97@01))
  :qid |prog.l137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@92@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@92@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@92@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef26|)))
(assert (=
  ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@90@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  (not
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
      $Ref.null))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@92@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@90@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
  $Snap.unit))
(assert (<= j@65@01 t@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
  $Snap.unit))
(assert (<= t@89@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))
  (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
  $Snap.unit))
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))))))))
(assert (forall ((i@93@01 Int)) (!
  (=>
    (and
      (<=
        i@93@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@93@01))
    (or (not (< j@65@01 i@93@01)) (< j@65@01 i@93@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@93@01))
  :qid |val-aux|)))
(assert (= $t@90@01 ($Snap.combine ($Snap.first $t@90@01) ($Snap.second $t@90@01))))
(assert (=
  ($Snap.second $t@90@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@90@01))
    ($Snap.second ($Snap.second $t@90@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@90@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@90@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@90@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] t > j
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> t@89@01 j@65@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> t@89@01 j@65@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 57 | t@89@01 > j@65@01 | live]
; [else-branch: 57 | !(t@89@01 > j@65@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 57 | t@89@01 > j@65@01]
(assert (> t@89@01 j@65@01))
; [exec]
; loc(this.elems, t).val := loc(this.elems, t - 1).val
; [eval] loc(this.elems, t)
; [eval] loc(this.elems, t - 1)
; [eval] t - 1
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
  t@89@01
  1))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
  t@89@01
  1))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
            t@89@01
            1)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<
          j@65@01
          (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
            t@89@01
            1)))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
          t@89@01
          1))
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@94@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 (inv@94@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@108@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (<=
            (inv@94@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 (inv@94@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 r))
    $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 10
; 0.02s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
    (= (- $Perm.Write (pTaken@108@01 r)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@110@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@110@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
  ($FVF.lookup_val (as sm@95@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (-
    t@89@01
    1)))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)))
; [exec]
; t := t - 1
; [eval] t - 1
(declare-const t@111@01 Int)
(assert (= t@111@01 (- t@89@01 1)))
; Loop head block: Re-establish invariant
; [eval] loc(this.elems, j)
(declare-const sm@112@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<=
              (inv@94@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 (inv@94@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@108@01 r)))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r)))
    $Perm.No))
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (-
        (ite
          (and
            (<=
              (inv@94@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 (inv@94@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@108@01 r))
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r)) (pTaken@114@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@113@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@113@01 r)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
  (=
    ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($FVF.lookup_val (as sm@110@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  (=
    ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (and
          (<=
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<
            j@65@01
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))))
  (=
    ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))))
(assert (and
  ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))))
; [eval] j <= t
(set-option :timeout 0)
(push) ; 10
(assert (not (<= j@65@01 t@111@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= j@65@01 t@111@01))
; [eval] t <= this.size
(push) ; 10
(assert (not (<= t@111@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= t@111@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] -1 <= j
; [eval] -1
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(declare-const i@116@01 Int)
(push) ; 10
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 11
; [then-branch: 58 | j@65@01 < i@116@01 | live]
; [else-branch: 58 | !(j@65@01 < i@116@01) | live]
(push) ; 12
; [then-branch: 58 | j@65@01 < i@116@01]
(assert (< j@65@01 i@116@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 58 | !(j@65@01 < i@116@01)]
(assert (not (< j@65@01 i@116@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@116@01)) (< j@65@01 i@116@01)))
(assert (and
  (<= i@116@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (< j@65@01 i@116@01)))
; [eval] loc(this.elems, i)
(pop) ; 10
(declare-fun inv@117@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@116@01 Int)) (!
  (=>
    (and
      (<=
        i@116@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@116@01))
    (or (not (< j@65@01 i@116@01)) (< j@65@01 i@116@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@116@01))
  :qid |val-aux|)))
(declare-const sm@118@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<=
              (inv@94@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 (inv@94@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@108@01 r)))
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@110@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@110@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@110@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef42|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((i1@116@01 Int) (i2@116@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<=
            i1@116@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i1@116@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@116@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@116@01)))
      (and
        (and
          (<=
            i2@116@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i2@116@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@116@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@116@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@116@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@116@01)))
    (= i1@116@01 i2@116@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@116@01 Int)) (!
  (=>
    (and
      (<=
        i@116@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@116@01))
    (=
      (inv@117@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@116@01))
      i@116@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@116@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (inv@117@01 r))
      r))
  :pattern ((inv@117@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern ((inv@117@01 r))
  :qid |quant-u-82|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<=
              (inv@94@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 (inv@94@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@108@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@119@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and
            (<=
              (inv@94@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 (inv@94@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@108@01 r))
      (pTaken@119@01 r))
    $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    (= (- $Perm.Write (pTaken@119@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
      $Perm.Write
      $Perm.No)
    (pTaken@120@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@117@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@117@01 r)))
    (= (- (- $Perm.Write (pTaken@119@01 r)) (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@121@01 Int)
(set-option :timeout 0)
(push) ; 10
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 11
; [then-branch: 59 | j@65@01 <= i@121@01 | live]
; [else-branch: 59 | !(j@65@01 <= i@121@01) | live]
(push) ; 12
; [then-branch: 59 | j@65@01 <= i@121@01]
(assert (<= j@65@01 i@121@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 59 | !(j@65@01 <= i@121@01)]
(assert (not (<= j@65@01 i@121@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@121@01)) (<= j@65@01 i@121@01)))
(push) ; 11
; [then-branch: 60 | i@121@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@121@01 | live]
; [else-branch: 60 | !(i@121@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@121@01) | live]
(push) ; 12
; [then-branch: 60 | i@121@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@121@01]
(assert (and
  (<= i@121@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (<= j@65@01 i@121@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 13
; [then-branch: 61 | i@121@01 < t@111@01 | live]
; [else-branch: 61 | !(i@121@01 < t@111@01) | live]
(push) ; 14
; [then-branch: 61 | i@121@01 < t@111@01]
(assert (< i@121@01 t@111@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (-
      (ite
        (and
          (<=
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<
            j@65@01
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)))))))
(check-sat)
; unsat
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 15
; [eval] 0 <= index
(push) ; 16
(assert (not (<= 0 i@121@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@121@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (< i@121@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< i@121@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01))
(pop) ; 15
; Joined path conditions
(assert (and
  (<= 0 i@121@01)
  (< i@121@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 61 | !(i@121@01 < t@111@01)]
(assert (not (< i@121@01 t@111@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (< i@121@01 t@111@01)
  (and
    (< i@121@01 t@111@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
    (<= 0 i@121@01)
    (< i@121@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01))))
; Joined path conditions
(assert (or (not (< i@121@01 t@111@01)) (< i@121@01 t@111@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 60 | !(i@121@01 <= First:(Second:($t@90@01)) && j@65@01 <= i@121@01)]
(assert (not
  (and
    (<=
      i@121@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@121@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<=
      i@121@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@121@01))
  (and
    (<=
      i@121@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@121@01)
    (=>
      (< i@121@01 t@111@01)
      (and
        (< i@121@01 t@111@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
        (<= 0 i@121@01)
        (< i@121@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01)))
    (or (not (< i@121@01 t@111@01)) (< i@121@01 t@111@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@121@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (<= j@65@01 i@121@01)))
  (and
    (<=
      i@121@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (<= j@65@01 i@121@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@121@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@121@01)) (<= j@65@01 i@121@01))
    (=>
      (and
        (<=
          i@121@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@121@01))
      (and
        (<=
          i@121@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@121@01)
        (=>
          (< i@121@01 t@111@01)
          (and
            (< i@121@01 t@111@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
            (<= 0 i@121@01)
            (< i@121@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01)))
        (or (not (< i@121@01 t@111@01)) (< i@121@01 t@111@01))))
    (or
      (not
        (and
          (<=
            i@121@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<= j@65@01 i@121@01)))
      (and
        (<=
          i@121@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@121@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@121@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@121@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@121@01))
      (< i@121@01 t@111@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
  :qid |prog.l136_precondition|)))
(push) ; 10
(assert (not (forall ((i@121@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@121@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (<= j@65@01 i@121@01))
          (< i@121@01 t@111@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01))
      (and
        (and
          (<=
            i@121@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<= j@65@01 i@121@01))
        (< i@121@01 t@111@01)))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
  :qid |prog.l136|))))
(check-sat)
; unsat
(pop) ; 10
; 0.02s
; (get-info :all-statistics)
(assert (forall ((i@121@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@121@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (<= j@65@01 i@121@01))
      (< i@121@01 t@111@01))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@121@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@121@01))
  :qid |prog.l136|)))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@122@01 Int)
(push) ; 10
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 11
; [then-branch: 62 | j@65@01 < i@122@01 | live]
; [else-branch: 62 | !(j@65@01 < i@122@01) | live]
(push) ; 12
; [then-branch: 62 | j@65@01 < i@122@01]
(assert (< j@65@01 i@122@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 62 | !(j@65@01 < i@122@01)]
(assert (not (< j@65@01 i@122@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@122@01)) (< j@65@01 i@122@01)))
(push) ; 11
; [then-branch: 63 | i@122@01 <= First:(Second:($t@90@01)) && j@65@01 < i@122@01 | live]
; [else-branch: 63 | !(i@122@01 <= First:(Second:($t@90@01)) && j@65@01 < i@122@01) | live]
(push) ; 12
; [then-branch: 63 | i@122@01 <= First:(Second:($t@90@01)) && j@65@01 < i@122@01]
(assert (and
  (<= i@122@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
  (< j@65@01 i@122@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 13
; [then-branch: 64 | i@122@01 > t@111@01 | live]
; [else-branch: 64 | !(i@122@01 > t@111@01) | live]
(push) ; 14
; [then-branch: 64 | i@122@01 > t@111@01]
(assert (> i@122@01 t@111@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) t@89@01))
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (-
      (ite
        (and
          (<=
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (<
            j@65@01
            (inv@94@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)))))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 15
; [eval] 0 <= index
(push) ; 16
(assert (not (<= 0 (- i@122@01 1))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@122@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (< (- i@122@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@122@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1)))
(pop) ; 15
; Joined path conditions
(assert (and
  (<= 0 (- i@122@01 1))
  (< (- i@122@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1))))
(pop) ; 14
(push) ; 14
; [else-branch: 64 | !(i@122@01 > t@111@01)]
(assert (not (> i@122@01 t@111@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (> i@122@01 t@111@01)
  (and
    (> i@122@01 t@111@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
    (<= 0 (- i@122@01 1))
    (< (- i@122@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1)))))
; Joined path conditions
(assert (or (not (> i@122@01 t@111@01)) (> i@122@01 t@111@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 63 | !(i@122@01 <= First:(Second:($t@90@01)) && j@65@01 < i@122@01)]
(assert (not
  (and
    (<=
      i@122@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@122@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<=
      i@122@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@122@01))
  (and
    (<=
      i@122@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@122@01)
    (=>
      (> i@122@01 t@111@01)
      (and
        (> i@122@01 t@111@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
        (<= 0 (- i@122@01 1))
        (< (- i@122@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1))))
    (or (not (> i@122@01 t@111@01)) (> i@122@01 t@111@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@122@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 i@122@01)))
  (and
    (<=
      i@122@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
    (< j@65@01 i@122@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@122@01 Int)) (!
  (and
    (or (not (< j@65@01 i@122@01)) (< j@65@01 i@122@01))
    (=>
      (and
        (<=
          i@122@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@122@01))
      (and
        (<=
          i@122@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@122@01)
        (=>
          (> i@122@01 t@111@01)
          (and
            (> i@122@01 t@111@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
            (<= 0 (- i@122@01 1))
            (< (- i@122@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1))))
        (or (not (> i@122@01 t@111@01)) (> i@122@01 t@111@01))))
    (or
      (not
        (and
          (<=
            i@122@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i@122@01)))
      (and
        (<=
          i@122@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@122@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@122@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@122@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@122@01))
      (> i@122@01 t@111@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
  :qid |prog.l137_precondition|)))
(push) ; 10
(assert (not (forall ((i@122@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@122@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
            (< j@65@01 i@122@01))
          (> i@122@01 t@111@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@122@01 1)))
      (and
        (and
          (<=
            i@122@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 i@122@01))
        (> i@122@01 t@111@01)))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@122@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
  :qid |prog.l137|))))
(check-sat)
; unsat
(pop) ; 10
; 0.04s
; (get-info :all-statistics)
(assert (forall ((i@122@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@122@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 i@122@01))
      (> i@122@01 t@111@01))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@122@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@122@01))
  :qid |prog.l137|)))
(pop) ; 9
(push) ; 9
; [else-branch: 57 | !(t@89@01 > j@65@01)]
(assert (not (> t@89@01 j@65@01)))
(pop) ; 9
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(assert (= ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) a@81@01))
; [eval] !(t > j)
; [eval] t > j
(push) ; 9
(set-option :timeout 10)
(assert (not (> t@89@01 j@65@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> t@89@01 j@65@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 65 | !(t@89@01 > j@65@01) | live]
; [else-branch: 65 | t@89@01 > j@65@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 65 | !(t@89@01 > j@65@01)]
(assert (not (> t@89@01 j@65@01)))
; [exec]
; loc(this.elems, j).val := elem
; [eval] loc(this.elems, j)
(declare-const sm@123@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@100@01 r))
        (pTaken@104@01 r)))
    (=
      ($FVF.lookup_val (as sm@123@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@123@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r)))
    (=
      ($FVF.lookup_val (as sm@123@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@123@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@123@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@123@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      ($FVF.lookup_val (as sm@123@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@123@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@123@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef47|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@123@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@100@01 r))
        (pTaken@104@01 r))
      (- $Perm.Write (pTaken@124@01 r)))
    $Perm.No))
(define-fun pTaken@126@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r))
      (- (- $Perm.Write (pTaken@124@01 r)) (pTaken@125@01 r)))
    $Perm.No))
(define-fun pTaken@127@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@94@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 (inv@94@01 r)))
        $Perm.Write
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@124@01 r)) (pTaken@125@01 r))
        (pTaken@126@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@124@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (= (- $Perm.Write (pTaken@124@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@100@01 r))
        (pTaken@104@01 r))
      (pTaken@125@01 r))
    $Perm.No)
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (= (- (- $Perm.Write (pTaken@124@01 r)) (pTaken@125@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@128@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
  elem@58@01))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@128@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
; [exec]
; this.size := this.size + 1
; [eval] this.size + 1
(declare-const size@129@01 Int)
(assert (=
  size@129@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))) 1)))
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 size@129@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 size@129@01))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(push) ; 10
(assert (not (<= size@129@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= size@129@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)))))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(push) ; 10
(assert (not (< 0 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (< 0 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)))))
(declare-const i@130@01 Int)
(push) ; 10
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 11
; [then-branch: 66 | 0 <= i@130@01 | live]
; [else-branch: 66 | !(0 <= i@130@01) | live]
(push) ; 12
; [then-branch: 66 | 0 <= i@130@01]
(assert (<= 0 i@130@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 12
(push) ; 12
; [else-branch: 66 | !(0 <= i@130@01)]
(assert (not (<= 0 i@130@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@130@01)) (<= 0 i@130@01)))
(assert (and
  (< i@130@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
  (<= 0 i@130@01)))
; [eval] loc(this.elems, i)
(pop) ; 10
(declare-fun inv@131@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@130@01 Int)) (!
  (=>
    (and
      (<
        i@130@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 i@130@01))
    (or (not (<= 0 i@130@01)) (<= 0 i@130@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@130@01))
  :qid |val-aux|)))
(declare-const sm@132@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (-
            (ite
              (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@100@01 r))
          (pTaken@104@01 r))
        (pTaken@125@01 r)))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r)))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@94@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
      (< j@65@01 (inv@94@01 r)))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@128@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@128@01  $FVF<val>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@128@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef52|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((i1@130@01 Int) (i2@130@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<
            i1@130@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
          (<= 0 i1@130@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@132@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@130@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@130@01)))
      (and
        (and
          (<
            i2@130@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
          (<= 0 i2@130@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@132@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@130@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@130@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i1@130@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i2@130@01)))
    (= i1@130@01 i2@130@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@130@01 Int)) (!
  (=>
    (and
      (<
        i@130@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 i@130@01))
    (=
      (inv@131@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@130@01))
      i@130@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) i@130@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) (inv@131@01 r))
      r))
  :pattern ((inv@131@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@132@01  $FVF<val>) r) r))
  :pattern ((inv@131@01 r))
  :qid |quant-u-94|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    ($Perm.min
      (-
        (-
          (-
            (ite
              (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@100@01 r))
          (pTaken@104@01 r))
        (pTaken@125@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r))
      (- $Perm.Write (pTaken@133@01 r)))
    $Perm.No))
(define-fun pTaken@135@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@94@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 (inv@94@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r)))
    $Perm.No))
(define-fun pTaken@136@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
        $Perm.Write
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r))
        (pTaken@135@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (-
            (ite
              (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@100@01 r))
          (pTaken@104@01 r))
        (pTaken@125@01 r))
      (pTaken@133@01 r))
    $Perm.No)
  
  :qid |quant-u-96|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@99@01 r))
      (pTaken@134@01 r))
    $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    (= (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 10
; 0.04s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (<=
            (inv@94@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
          (< j@65@01 (inv@94@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@135@01 r))
    $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 10
; 0.03s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r))
        (pTaken@135@01 r))
      $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01))
      $Perm.Write
      $Perm.No)
    (pTaken@136@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@131@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
      (<= 0 (inv@131@01 r)))
    (=
      (-
        (-
          (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r))
          (pTaken@135@01 r))
        (pTaken@136@01 r))
      $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 10
; 0.02s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@137@01  $FVF<val>)))
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r))))
    (=>
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r)))
      (Set_in r ($FVF.domain_val (as sm@137@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@137@01  $FVF<val>))))
  :qid |qp.fvfDomDef58|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r)))
      (<
        $Perm.No
        (-
          (-
            (-
              (ite
                (and (< (inv@84@01 r) (len<Int> a@81@01)) (<= 0 (inv@84@01 r)))
                $Perm.Write
                $Perm.No)
              (pTaken@100@01 r))
            (pTaken@104@01 r))
          (pTaken@125@01 r))))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and
              (<
                (inv@79@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
              (<= 0 (inv@79@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@99@01 r))))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r)))
      (and
        (<=
          (inv@94@01 r)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@90@01))))
        (< j@65@01 (inv@94@01 r))))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@131@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01))))
        (<= 0 (inv@131@01 r)))
      (=
        r
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@90@01)) j@65@01)))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@128@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@128@01  $FVF<val>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@82@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@90@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@128@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (AList%trigger ($Snap.combine
  ($Snap.first $t@90@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@129@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
; [eval] 0 <= j
; [eval] j < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 10
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@90@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@129@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
(pop) ; 10
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@90@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@129@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
(push) ; 10
(assert (not (<
  j@65@01
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  j@65@01
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (=
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)
  (+ (length $t@60@01 this@57@01) 1))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)
  (+ (length $t@60@01 this@57@01) 1)))
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@138@01 Int)
(push) ; 10
; [eval] 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < j
; [eval] 0 <= k
(push) ; 11
; [then-branch: 67 | 0 <= k@138@01 | live]
; [else-branch: 67 | !(0 <= k@138@01) | live]
(push) ; 12
; [then-branch: 67 | 0 <= k@138@01]
(assert (<= 0 k@138@01))
; [eval] k < j
(pop) ; 12
(push) ; 12
; [else-branch: 67 | !(0 <= k@138@01)]
(assert (not (<= 0 k@138@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@138@01)) (<= 0 k@138@01)))
(push) ; 11
; [then-branch: 68 | k@138@01 < j@65@01 && 0 <= k@138@01 | live]
; [else-branch: 68 | !(k@138@01 < j@65@01 && 0 <= k@138@01) | live]
(push) ; 12
; [then-branch: 68 | k@138@01 < j@65@01 && 0 <= k@138@01]
(assert (and (< k@138@01 j@65@01) (<= 0 k@138@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (<
  k@138@01
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<
  k@138@01
  (length ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<
    k@138@01
    (length ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< k@138@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< k@138@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (< k@138@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 68 | !(k@138@01 < j@65@01 && 0 <= k@138@01)]
(assert (not (and (< k@138@01 j@65@01) (<= 0 k@138@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and (< k@138@01 j@65@01) (<= 0 k@138@01))
  (and
    (< k@138@01 j@65@01)
    (<= 0 k@138@01)
    (<
      k@138@01
      (length ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
    (< k@138@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))))
; Joined path conditions
(assert (or
  (not (and (< k@138@01 j@65@01) (<= 0 k@138@01)))
  (and (< k@138@01 j@65@01) (<= 0 k@138@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@138@01 Int)) (!
  (and
    (or (not (<= 0 k@138@01)) (<= 0 k@138@01))
    (=>
      (and (< k@138@01 j@65@01) (<= 0 k@138@01))
      (and
        (< k@138@01 j@65@01)
        (<= 0 k@138@01)
        (<
          k@138@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
        (< k@138@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
    (or
      (not (and (< k@138@01 j@65@01) (<= 0 k@138@01)))
      (and (< k@138@01 j@65@01) (<= 0 k@138@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
  :qid |prog.l101-aux|)))
(assert (forall ((k@138@01 Int)) (!
  (=>
    (and (< k@138@01 j@65@01) (<= 0 k@138@01))
    (and
      (itemAt%precondition ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
      (itemAt%precondition ($Snap.combine
        $t@60@01
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
  :qid |prog.l101_precondition|)))
(push) ; 10
(assert (not (forall ((k@138@01 Int)) (!
  (=>
    (and
      (=>
        (and (< k@138@01 j@65@01) (<= 0 k@138@01))
        (and
          (itemAt%precondition ($Snap.combine
            ($Snap.combine
              ($Snap.first $t@90@01)
              ($Snap.combine
                ($SortWrappers.IntTo$Snap size@129@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
            ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
          (itemAt%precondition ($Snap.combine
            $t@60@01
            ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
      (and (< k@138@01 j@65@01) (<= 0 k@138@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
  :qid |prog.l101|))))
(check-sat)
; unsat
(pop) ; 10
; 0.06s
; (get-info :all-statistics)
(assert (forall ((k@138@01 Int)) (!
  (=>
    (and (< k@138@01 j@65@01) (<= 0 k@138@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@138@01))
  :qid |prog.l101|)))
; [eval] itemAt(this, j) == elem
; [eval] itemAt(this, j)
(push) ; 10
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 10
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(push) ; 10
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
  elem@58@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
  elem@58@01))
; [eval] (forall k: Int :: { itemAt(this, k) } j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1)))
(declare-const k@139@01 Int)
(push) ; 10
; [eval] j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] j < k && k < length(this)
; [eval] j < k
(push) ; 11
; [then-branch: 69 | j@65@01 < k@139@01 | live]
; [else-branch: 69 | !(j@65@01 < k@139@01) | live]
(push) ; 12
; [then-branch: 69 | j@65@01 < k@139@01]
(assert (< j@65@01 k@139@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 69 | !(j@65@01 < k@139@01)]
(assert (not (< j@65@01 k@139@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 k@139@01)) (< j@65@01 k@139@01)))
(push) ; 11
; [then-branch: 70 | k@139@01 < length((First:($t@90@01), (size@129@01, (_, (_, (_, sm@137@01))))), this@57@01) && j@65@01 < k@139@01 | live]
; [else-branch: 70 | !(k@139@01 < length((First:($t@90@01), (size@129@01, (_, (_, (_, sm@137@01))))), this@57@01) && j@65@01 < k@139@01) | live]
(push) ; 12
; [then-branch: 70 | k@139@01 < length((First:($t@90@01), (size@129@01, (_, (_, (_, sm@137@01))))), this@57@01) && j@65@01 < k@139@01]
(assert (and
  (<
    k@139@01
    (length ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
  (< j@65@01 k@139@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 k@139@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 k@139@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@90@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@129@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 k@139@01)
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)))
; [eval] old(itemAt(this, k - 1))
; [eval] itemAt(this, k - 1)
; [eval] k - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- k@139@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- k@139@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- k@139@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- k@139@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- k@139@01 1))
  (< (- k@139@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 70 | !(k@139@01 < length((First:($t@90@01), (size@129@01, (_, (_, (_, sm@137@01))))), this@57@01) && j@65@01 < k@139@01)]
(assert (not
  (and
    (<
      k@139@01
      (length ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@139@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<
      k@139@01
      (length ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@139@01))
  (and
    (<
      k@139@01
      (length ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@139@01)
    (<= 0 k@139@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
    (<= 0 (- k@139@01 1))
    (< (- k@139@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        k@139@01
        (length ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
      (< j@65@01 k@139@01)))
  (and
    (<
      k@139@01
      (length ($Snap.combine
        ($Snap.first $t@90@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@129@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@139@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@139@01 Int)) (!
  (and
    (or (not (< j@65@01 k@139@01)) (< j@65@01 k@139@01))
    (=>
      (and
        (<
          k@139@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@139@01))
      (and
        (<
          k@139@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@139@01)
        (<= 0 k@139@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
        (<= 0 (- k@139@01 1))
        (< (- k@139@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1))))
    (or
      (not
        (and
          (<
            k@139@01
            (length ($Snap.combine
              ($Snap.first $t@90@01)
              ($Snap.combine
                ($SortWrappers.IntTo$Snap size@129@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
          (< j@65@01 k@139@01)))
      (and
        (<
          k@139@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@139@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01))
  :qid |prog.l103-aux|)))
(assert (forall ((k@139@01 Int)) (!
  (and
    (length%precondition ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)
    (=>
      (and
        (<
          k@139@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@139@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1)))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01))
  :qid |prog.l103_precondition|)))
(push) ; 10
(assert (not (forall ((k@139@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01)
        (=>
          (and
            (<
              k@139@01
              (length ($Snap.combine
                ($Snap.first $t@90@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@129@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
            (< j@65@01 k@139@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first $t@90@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@129@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@139@01 1)))))
      (and
        (<
          k@139@01
          (length ($Snap.combine
            ($Snap.first $t@90@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@129@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@139@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        k@139@01
        1))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01))
  :qid |prog.l103|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(assert (forall ((k@139@01 Int)) (!
  (=>
    (and
      (<
        k@139@01
        (length ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>))))))) this@57@01))
      (< j@65@01 k@139@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@90@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@129@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        k@139@01
        1))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@90@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@129@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@137@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@139@01))
  :qid |prog.l103|)))
(pop) ; 9
(push) ; 9
; [else-branch: 65 | t@89@01 > j@65@01]
(assert (> t@89@01 j@65@01))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 39 | First:(Second:(First:($t@66@01))) != len[Int](First:(First:($t@66@01)))]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))))
(pop) ; 6
; [eval] !(this.size == len(this.elems))
; [eval] this.size == len(this.elems)
; [eval] len(this.elems)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 71 | First:(Second:(First:($t@66@01))) != len[Int](First:(First:($t@66@01))) | live]
; [else-branch: 71 | First:(Second:(First:($t@66@01))) == len[Int](First:(First:($t@66@01))) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 71 | First:(Second:(First:($t@66@01))) != len[Int](First:(First:($t@66@01)))]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))))
; [exec]
; t := this.size
(declare-const t@140@01 Int)
(assert (=
  t@140@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(declare-const t@141@01 Int)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(declare-const $t@142@01 $Snap)
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(assert (=
  ($Snap.second $t@142@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@142@01))
    ($Snap.second ($Snap.second $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@142@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@142@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
; [eval] loc(this.elems, j)
(declare-const sm@143@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@143@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@142@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  (not
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      $Ref.null))))
(declare-const sm@144@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@144@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@142@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  $Snap.unit))
; [eval] j <= t
(assert (<= j@65@01 t@141@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
  $Snap.unit))
; [eval] t <= this.size
(assert (<= t@141@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
  $Snap.unit))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))
  (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
  $Snap.unit))
; [eval] -1 <= j
; [eval] -1
(assert (<= (- 0 1) j@65@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
  $Snap.unit))
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))))
(declare-const i@145@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 72 | j@65@01 < i@145@01 | live]
; [else-branch: 72 | !(j@65@01 < i@145@01) | live]
(push) ; 10
; [then-branch: 72 | j@65@01 < i@145@01]
(assert (< j@65@01 i@145@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 72 | !(j@65@01 < i@145@01)]
(assert (not (< j@65@01 i@145@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@145@01)) (< j@65@01 i@145@01)))
(assert (and
  (<= i@145@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (< j@65@01 i@145@01)))
; [eval] loc(this.elems, i)
(pop) ; 8
(declare-fun inv@146@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (or (not (< j@65@01 i@145@01)) (< j@65@01 i@145@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (=
      (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
      i@145@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (inv@146@01 r))
      r))
  :pattern ((inv@146@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@147@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) r) r))
  :pattern ((inv@146@01 r))
  :qid |quant-u-106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@148@01 Int)
(push) ; 8
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 9
; [then-branch: 73 | j@65@01 <= i@148@01 | live]
; [else-branch: 73 | !(j@65@01 <= i@148@01) | live]
(push) ; 10
; [then-branch: 73 | j@65@01 <= i@148@01]
(assert (<= j@65@01 i@148@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 73 | !(j@65@01 <= i@148@01)]
(assert (not (<= j@65@01 i@148@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@148@01)) (<= j@65@01 i@148@01)))
(push) ; 9
; [then-branch: 74 | i@148@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@148@01 | live]
; [else-branch: 74 | !(i@148@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@148@01) | live]
(push) ; 10
; [then-branch: 74 | i@148@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@148@01]
(assert (and
  (<= i@148@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (<= j@65@01 i@148@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 11
; [then-branch: 75 | i@148@01 < t@141@01 | live]
; [else-branch: 75 | !(i@148@01 < t@141@01) | live]
(push) ; 12
; [then-branch: 75 | i@148@01 < t@141@01]
(assert (< i@148@01 t@141@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<
          j@65@01
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 i@148@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@148@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< i@148@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< i@148@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 i@148@01)
  (< i@148@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 75 | !(i@148@01 < t@141@01)]
(assert (not (< i@148@01 t@141@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< i@148@01 t@141@01)
  (and
    (< i@148@01 t@141@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
    (<= 0 i@148@01)
    (< i@148@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01))))
; Joined path conditions
(assert (or (not (< i@148@01 t@141@01)) (< i@148@01 t@141@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 74 | !(i@148@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@148@01)]
(assert (not
  (and
    (<=
      i@148@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@148@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@148@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@148@01))
  (and
    (<=
      i@148@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@148@01)
    (=>
      (< i@148@01 t@141@01)
      (and
        (< i@148@01 t@141@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
        (<= 0 i@148@01)
        (< i@148@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
    (or (not (< i@148@01 t@141@01)) (< i@148@01 t@141@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@148@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (<= j@65@01 i@148@01)))
  (and
    (<=
      i@148@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@148@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@148@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@148@01)) (<= j@65@01 i@148@01))
    (=>
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01)
        (=>
          (< i@148@01 t@141@01)
          (and
            (< i@148@01 t@141@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
            (<= 0 i@148@01)
            (< i@148@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
        (or (not (< i@148@01 t@141@01)) (< i@148@01 t@141@01))))
    (or
      (not
        (and
          (<=
            i@148@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<= j@65@01 i@148@01)))
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@148@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))
      (< i@148@01 t@141@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
  :qid |prog.l136|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@149@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 76 | j@65@01 < i@149@01 | live]
; [else-branch: 76 | !(j@65@01 < i@149@01) | live]
(push) ; 10
; [then-branch: 76 | j@65@01 < i@149@01]
(assert (< j@65@01 i@149@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 76 | !(j@65@01 < i@149@01)]
(assert (not (< j@65@01 i@149@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@149@01)) (< j@65@01 i@149@01)))
(push) ; 9
; [then-branch: 77 | i@149@01 <= First:(Second:($t@142@01)) && j@65@01 < i@149@01 | live]
; [else-branch: 77 | !(i@149@01 <= First:(Second:($t@142@01)) && j@65@01 < i@149@01) | live]
(push) ; 10
; [then-branch: 77 | i@149@01 <= First:(Second:($t@142@01)) && j@65@01 < i@149@01]
(assert (and
  (<= i@149@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (< j@65@01 i@149@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 11
; [then-branch: 78 | i@149@01 > t@141@01 | live]
; [else-branch: 78 | !(i@149@01 > t@141@01) | live]
(push) ; 12
; [then-branch: 78 | i@149@01 > t@141@01]
(assert (> i@149@01 t@141@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)))
(push) ; 13
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<
          j@65@01
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- i@149@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@149@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- i@149@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@149@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- i@149@01 1))
  (< (- i@149@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 78 | !(i@149@01 > t@141@01)]
(assert (not (> i@149@01 t@141@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (> i@149@01 t@141@01)
  (and
    (> i@149@01 t@141@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
    (<= 0 (- i@149@01 1))
    (< (- i@149@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1)))))
; Joined path conditions
(assert (or (not (> i@149@01 t@141@01)) (> i@149@01 t@141@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 77 | !(i@149@01 <= First:(Second:($t@142@01)) && j@65@01 < i@149@01)]
(assert (not
  (and
    (<=
      i@149@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@149@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@149@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@149@01))
  (and
    (<=
      i@149@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@149@01)
    (=>
      (> i@149@01 t@141@01)
      (and
        (> i@149@01 t@141@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
        (<= 0 (- i@149@01 1))
        (< (- i@149@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1))))
    (or (not (> i@149@01 t@141@01)) (> i@149@01 t@141@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@149@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@149@01)))
  (and
    (<=
      i@149@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@149@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@149@01 Int)) (!
  (and
    (or (not (< j@65@01 i@149@01)) (< j@65@01 i@149@01))
    (=>
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01)
        (=>
          (> i@149@01 t@141@01)
          (and
            (> i@149@01 t@141@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
            (<= 0 (- i@149@01 1))
            (< (- i@149@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1))))
        (or (not (> i@149@01 t@141@01)) (> i@149@01 t@141@01))))
    (or
      (not
        (and
          (<=
            i@149@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i@149@01)))
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@149@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))
      (> i@149@01 t@141@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@149@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
  :qid |prog.l137|)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 8
; [eval] t > j
(pop) ; 8
(push) ; 8
; [eval] !(t > j)
; [eval] t > j
(pop) ; 8
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] loc(this.elems, j)
; Definitional axioms for snapshot map values
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@150@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01))
    ($Perm.min
      (ite
        (and
          (<
            (inv@79@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (<
            (inv@79@01 r)
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
          (<= 0 (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@150@01 r))
    $Perm.No)
  
  :qid |quant-u-108|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@150@01 r)) $Perm.No))
  
  :qid |quant-u-109|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (<
      (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01))
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
    (<=
      0
      (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01))))
  (=
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01)))))
(assert ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) j@65@01)))
; [eval] j <= t
(set-option :timeout 0)
(push) ; 8
(assert (not (<= j@65@01 t@140@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= j@65@01 t@140@01))
; [eval] t <= this.size
(push) ; 8
(assert (not (<=
  t@140@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<=
  t@140@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (length $t@60@01 this@57@01)))
; [eval] -1 <= j
; [eval] -1
(push) ; 8
(assert (not (<= (- 0 1) j@65@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= (- 0 1) j@65@01))
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(push) ; 8
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(declare-const i@151@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 79 | j@65@01 < i@151@01 | live]
; [else-branch: 79 | !(j@65@01 < i@151@01) | live]
(push) ; 10
; [then-branch: 79 | j@65@01 < i@151@01]
(assert (< j@65@01 i@151@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 79 | !(j@65@01 < i@151@01)]
(assert (not (< j@65@01 i@151@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@151@01)) (< j@65@01 i@151@01)))
(assert (and
  (<=
    i@151@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (< j@65@01 i@151@01)))
; [eval] loc(this.elems, i)
(pop) ; 8
(declare-fun inv@152@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and
      (<=
        i@151@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@151@01))
    (or (not (< j@65@01 i@151@01)) (< j@65@01 i@151@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@151@01))
  :qid |val-aux|)))
(declare-const sm@153@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@150@01 r)))
    (=
      ($FVF.lookup_val (as sm@153@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@153@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
  :pattern (($FVF.lookup_val (as sm@153@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef65|)))
; Check receiver injectivity
(push) ; 8
(assert (not (forall ((i1@151@01 Int) (i2@151@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<=
            i1@151@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i1@151@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@153@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@151@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@151@01)))
      (and
        (and
          (<=
            i2@151@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i2@151@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@153@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@151@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@151@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i1@151@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i2@151@01)))
    (= i1@151@01 i2@151@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and
      (<=
        i@151@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@151@01))
    (=
      (inv@152@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@151@01))
      i@151@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@151@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@152@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@152@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) (inv@152@01 r))
      r))
  :pattern ((inv@152@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@152@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@152@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@153@01  $FVF<val>) r) r))
  :pattern ((inv@152@01 r))
  :qid |quant-u-111|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@152@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@152@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@150@01 r))
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
      (-
        (ite
          (and
            (<
              (inv@79@01 r)
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
            (<= 0 (inv@79@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@150@01 r))
      (pTaken@154@01 r))
    $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@152@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 (inv@152@01 r)))
    (= (- $Perm.Write (pTaken@154@01 r)) $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@155@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 9
; [then-branch: 80 | j@65@01 <= i@155@01 | live]
; [else-branch: 80 | !(j@65@01 <= i@155@01) | live]
(push) ; 10
; [then-branch: 80 | j@65@01 <= i@155@01]
(assert (<= j@65@01 i@155@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 80 | !(j@65@01 <= i@155@01)]
(assert (not (<= j@65@01 i@155@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@155@01)) (<= j@65@01 i@155@01)))
(push) ; 9
; [then-branch: 81 | i@155@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@155@01 | live]
; [else-branch: 81 | !(i@155@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@155@01) | live]
(push) ; 10
; [then-branch: 81 | i@155@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@155@01]
(assert (and
  (<=
    i@155@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (<= j@65@01 i@155@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 11
; [then-branch: 82 | i@155@01 < t@140@01 | live]
; [else-branch: 82 | !(i@155@01 < t@140@01) | live]
(push) ; 12
; [then-branch: 82 | i@155@01 < t@140@01]
(assert (< i@155@01 t@140@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01)))
(push) ; 13
(assert (not (and
  (<
    (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<=
    0
    (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 i@155@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@155@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< i@155@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< i@155@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 i@155@01)
  (< i@155@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 82 | !(i@155@01 < t@140@01)]
(assert (not (< i@155@01 t@140@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< i@155@01 t@140@01)
  (and
    (< i@155@01 t@140@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
    (<= 0 i@155@01)
    (< i@155@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01))))
; Joined path conditions
(assert (or (not (< i@155@01 t@140@01)) (< i@155@01 t@140@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 81 | !(i@155@01 <= First:(Second:(First:($t@66@01))) && j@65@01 <= i@155@01)]
(assert (not
  (and
    (<=
      i@155@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@155@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@155@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@155@01))
  (and
    (<=
      i@155@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@155@01)
    (=>
      (< i@155@01 t@140@01)
      (and
        (< i@155@01 t@140@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
        (<= 0 i@155@01)
        (< i@155@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01)))
    (or (not (< i@155@01 t@140@01)) (< i@155@01 t@140@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@155@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (<= j@65@01 i@155@01)))
  (and
    (<=
      i@155@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (<= j@65@01 i@155@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@155@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@155@01)) (<= j@65@01 i@155@01))
    (=>
      (and
        (<=
          i@155@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@155@01))
      (and
        (<=
          i@155@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@155@01)
        (=>
          (< i@155@01 t@140@01)
          (and
            (< i@155@01 t@140@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
            (<= 0 i@155@01)
            (< i@155@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01)))
        (or (not (< i@155@01 t@140@01)) (< i@155@01 t@140@01))))
    (or
      (not
        (and
          (<=
            i@155@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (<= j@65@01 i@155@01)))
      (and
        (<=
          i@155@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@155@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@155@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@155@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@155@01))
      (< i@155@01 t@140@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
  :qid |prog.l136_precondition|)))
(push) ; 8
(assert (not (forall ((i@155@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@155@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
            (<= j@65@01 i@155@01))
          (< i@155@01 t@140@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01))
      (and
        (and
          (<=
            i@155@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (<= j@65@01 i@155@01))
        (< i@155@01 t@140@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
  :qid |prog.l136|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@155@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@155@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (<= j@65@01 i@155@01))
      (< i@155@01 t@140@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@155@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@155@01))
  :qid |prog.l136|)))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@156@01 Int)
(push) ; 8
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 9
; [then-branch: 83 | j@65@01 < i@156@01 | live]
; [else-branch: 83 | !(j@65@01 < i@156@01) | live]
(push) ; 10
; [then-branch: 83 | j@65@01 < i@156@01]
(assert (< j@65@01 i@156@01))
; [eval] i <= this.size
(pop) ; 10
(push) ; 10
; [else-branch: 83 | !(j@65@01 < i@156@01)]
(assert (not (< j@65@01 i@156@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@156@01)) (< j@65@01 i@156@01)))
(push) ; 9
; [then-branch: 84 | i@156@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@156@01 | live]
; [else-branch: 84 | !(i@156@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@156@01) | live]
(push) ; 10
; [then-branch: 84 | i@156@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@156@01]
(assert (and
  (<=
    i@156@01
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
  (< j@65@01 i@156@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 11
; [then-branch: 85 | i@156@01 > t@140@01 | live]
; [else-branch: 85 | !(i@156@01 > t@140@01) | live]
(push) ; 12
; [then-branch: 85 | i@156@01 > t@140@01]
(assert (> i@156@01 t@140@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01)))
(push) ; 13
(assert (not (and
  (<
    (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
  (<=
    0
    (inv@79@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- i@156@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@156@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- i@156@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@156@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- i@156@01 1))
  (< (- i@156@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 85 | !(i@156@01 > t@140@01)]
(assert (not (> i@156@01 t@140@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (> i@156@01 t@140@01)
  (and
    (> i@156@01 t@140@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
    (<= 0 (- i@156@01 1))
    (< (- i@156@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1)))))
; Joined path conditions
(assert (or (not (> i@156@01 t@140@01)) (> i@156@01 t@140@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 84 | !(i@156@01 <= First:(Second:(First:($t@66@01))) && j@65@01 < i@156@01)]
(assert (not
  (and
    (<=
      i@156@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@156@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (<=
      i@156@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@156@01))
  (and
    (<=
      i@156@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@156@01)
    (=>
      (> i@156@01 t@140@01)
      (and
        (> i@156@01 t@140@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
        (<= 0 (- i@156@01 1))
        (< (- i@156@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1))))
    (or (not (> i@156@01 t@140@01)) (> i@156@01 t@140@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@156@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
      (< j@65@01 i@156@01)))
  (and
    (<=
      i@156@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
    (< j@65@01 i@156@01))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@156@01 Int)) (!
  (and
    (or (not (< j@65@01 i@156@01)) (< j@65@01 i@156@01))
    (=>
      (and
        (<=
          i@156@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@156@01))
      (and
        (<=
          i@156@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@156@01)
        (=>
          (> i@156@01 t@140@01)
          (and
            (> i@156@01 t@140@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
            (<= 0 (- i@156@01 1))
            (< (- i@156@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1))))
        (or (not (> i@156@01 t@140@01)) (> i@156@01 t@140@01))))
    (or
      (not
        (and
          (<=
            i@156@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i@156@01)))
      (and
        (<=
          i@156@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@156@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@156@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@156@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@156@01))
      (> i@156@01 t@140@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
  :qid |prog.l137_precondition|)))
(push) ; 8
(assert (not (forall ((i@156@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@156@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
            (< j@65@01 i@156@01))
          (> i@156@01 t@140@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@156@01 1)))
      (and
        (and
          (<=
            i@156@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
          (< j@65@01 i@156@01))
        (> i@156@01 t@140@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@156@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
  :qid |prog.l137|))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@156@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@156@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01)))))
        (< j@65@01 i@156@01))
      (> i@156@01 t@140@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@156@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))) i@156@01))
  :qid |prog.l137|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (inv@146@01 r))
      r))
  :pattern ((inv@146@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (=
      (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
      i@145@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |quant-u-105|)))
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |val-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) r) r))
  :pattern ((inv@146@01 r))
  :qid |quant-u-106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
  $Snap.unit))
(assert (forall ((i@148@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@148@01)) (<= j@65@01 i@148@01))
    (=>
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01)
        (=>
          (< i@148@01 t@141@01)
          (and
            (< i@148@01 t@141@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
            (<= 0 i@148@01)
            (< i@148@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
        (or (not (< i@148@01 t@141@01)) (< i@148@01 t@141@01))))
    (or
      (not
        (and
          (<=
            i@148@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<= j@65@01 i@148@01)))
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@148@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@148@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@148@01))
      (< i@148@01 t@141@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@148@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@148@01))
  :qid |prog.l136|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
  $Snap.unit))
(assert (forall ((i@149@01 Int)) (!
  (and
    (or (not (< j@65@01 i@149@01)) (< j@65@01 i@149@01))
    (=>
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01)
        (=>
          (> i@149@01 t@141@01)
          (and
            (> i@149@01 t@141@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
            (<= 0 (- i@149@01 1))
            (< (- i@149@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@149@01 1))))
        (or (not (> i@149@01 t@141@01)) (> i@149@01 t@141@01))))
    (or
      (not
        (and
          (<=
            i@149@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i@149@01)))
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@149@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@149@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@149@01))
      (> i@149@01 t@141@01))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@149@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@149@01))
  :qid |prog.l137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@144@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@144@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (=
  ($FVF.lookup_val (as sm@143@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@142@01))))))
(assert (<=
  $Perm.No
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  (not
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
      $Ref.null))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@144@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@142@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  $Snap.unit))
(assert (<= j@65@01 t@141@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
  $Snap.unit))
(assert (<= t@141@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
  $Snap.unit))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))
  (length $t@60@01 this@57@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
  $Snap.unit))
(assert (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))))))
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and
      (<=
        i@145@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@145@01))
    (or (not (< j@65@01 i@145@01)) (< j@65@01 i@145@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@145@01))
  :qid |val-aux|)))
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(assert (=
  ($Snap.second $t@142@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@142@01))
    ($Snap.second ($Snap.second $t@142@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@142@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@142@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] t > j
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> t@141@01 j@65@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (> t@141@01 j@65@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 86 | t@141@01 > j@65@01 | live]
; [else-branch: 86 | !(t@141@01 > j@65@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 86 | t@141@01 > j@65@01]
(assert (> t@141@01 j@65@01))
; [exec]
; loc(this.elems, t).val := loc(this.elems, t - 1).val
; [eval] loc(this.elems, t)
; [eval] loc(this.elems, t - 1)
; [eval] t - 1
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
  t@141@01
  1))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
  t@141@01
  1))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (<=
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
            t@141@01
            1)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<
          j@65@01
          (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
            t@141@01
            1)))))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
          t@141@01
          1))
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@157@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@146@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 (inv@146@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@158@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@157@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (<=
            (inv@146@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 (inv@146@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@157@01 r))
    $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 10
; 0.03s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
    (= (- $Perm.Write (pTaken@157@01 r)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@159@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@159@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
  ($FVF.lookup_val (as sm@147@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (-
    t@141@01
    1)))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@159@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)))
; [exec]
; t := t - 1
; [eval] t - 1
(declare-const t@160@01 Int)
(assert (= t@160@01 (- t@141@01 1)))
; Loop head block: Re-establish invariant
; [eval] loc(this.elems, j)
(declare-const sm@161@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@159@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@161@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@159@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@161@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<=
              (inv@146@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 (inv@146@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@157@01 r)))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@161@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@159@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@161@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef69|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@162@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@163@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@162@01 r)))
    $Perm.No))
(define-fun pTaken@164@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (-
        (ite
          (and
            (<=
              (inv@146@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 (inv@146@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@157@01 r))
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@162@01 r)) (pTaken@163@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@162@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@162@01 r)) $Perm.No))
  
  :qid |quant-u-120|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
  (=
    ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($FVF.lookup_val (as sm@159@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))))
(assert (=>
  (=
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  (=
    ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($FVF.lookup_val (as sm@143@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))))
(assert (=>
  (<
    $Perm.No
    (-
      (ite
        (and
          (<=
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<
            j@65@01
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@157@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))))
  (=
    ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))))
(assert (and
  ($FVF.loc_val ($FVF.lookup_val (as sm@159@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))))
; [eval] j <= t
(set-option :timeout 0)
(push) ; 10
(assert (not (<= j@65@01 t@160@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= j@65@01 t@160@01))
; [eval] t <= this.size
(push) ; 10
(assert (not (<= t@160@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= t@160@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))))
; [eval] this.size == old(length(this))
; [eval] old(length(this))
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] -1 <= j
; [eval] -1
; [eval] this.size < len(this.elems)
; [eval] len(this.elems)
(declare-const i@165@01 Int)
(push) ; 10
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 11
; [then-branch: 87 | j@65@01 < i@165@01 | live]
; [else-branch: 87 | !(j@65@01 < i@165@01) | live]
(push) ; 12
; [then-branch: 87 | j@65@01 < i@165@01]
(assert (< j@65@01 i@165@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 87 | !(j@65@01 < i@165@01)]
(assert (not (< j@65@01 i@165@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@165@01)) (< j@65@01 i@165@01)))
(assert (and
  (<= i@165@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (< j@65@01 i@165@01)))
; [eval] loc(this.elems, i)
(pop) ; 10
(declare-fun inv@166@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@165@01 Int)) (!
  (=>
    (and
      (<=
        i@165@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@165@01))
    (or (not (< j@65@01 i@165@01)) (< j@65@01 i@165@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@165@01))
  :qid |val-aux|)))
(declare-const sm@167@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<=
              (inv@146@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 (inv@146@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@157@01 r)))
    (=
      ($FVF.lookup_val (as sm@167@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@167@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
    (=
      ($FVF.lookup_val (as sm@167@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@159@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@167@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@159@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@159@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@167@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef72|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((i1@165@01 Int) (i2@165@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<=
            i1@165@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i1@165@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@167@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@165@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@165@01)))
      (and
        (and
          (<=
            i2@165@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i2@165@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@167@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@165@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@165@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@165@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@165@01)))
    (= i1@165@01 i2@165@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@165@01 Int)) (!
  (=>
    (and
      (<=
        i@165@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@165@01))
    (=
      (inv@166@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@165@01))
      i@165@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@165@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (inv@166@01 r))
      r))
  :pattern ((inv@166@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@167@01  $FVF<val>) r) r))
  :pattern ((inv@166@01 r))
  :qid |quant-u-122|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<=
              (inv@146@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 (inv@146@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@157@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@169@01 ((r $Ref)) $Perm
  (ite
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@168@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and
            (<=
              (inv@146@01 r)
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 (inv@146@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@157@01 r))
      (pTaken@168@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    (= (- $Perm.Write (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
      $Perm.Write
      $Perm.No)
    (pTaken@169@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@166@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@166@01 r)))
    (= (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i: Int :: { loc(this.elems, i) } j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i)))
(declare-const i@170@01 Int)
(set-option :timeout 0)
(push) ; 10
; [eval] j <= i && i <= this.size ==> i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] j <= i && i <= this.size
; [eval] j <= i
(push) ; 11
; [then-branch: 88 | j@65@01 <= i@170@01 | live]
; [else-branch: 88 | !(j@65@01 <= i@170@01) | live]
(push) ; 12
; [then-branch: 88 | j@65@01 <= i@170@01]
(assert (<= j@65@01 i@170@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 88 | !(j@65@01 <= i@170@01)]
(assert (not (<= j@65@01 i@170@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= j@65@01 i@170@01)) (<= j@65@01 i@170@01)))
(push) ; 11
; [then-branch: 89 | i@170@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@170@01 | live]
; [else-branch: 89 | !(i@170@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@170@01) | live]
(push) ; 12
; [then-branch: 89 | i@170@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@170@01]
(assert (and
  (<= i@170@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (<= j@65@01 i@170@01)))
; [eval] i < t ==> loc(this.elems, i).val == old(itemAt(this, i))
; [eval] i < t
(push) ; 13
; [then-branch: 90 | i@170@01 < t@160@01 | live]
; [else-branch: 90 | !(i@170@01 < t@160@01) | live]
(push) ; 14
; [then-branch: 90 | i@170@01 < t@160@01]
(assert (< i@170@01 t@160@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (-
      (ite
        (and
          (<=
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<
            j@65@01
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@157@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)))))))
(check-sat)
; unsat
(pop) ; 15
; 0.01s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 15
; [eval] 0 <= index
(push) ; 16
(assert (not (<= 0 i@170@01)))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 i@170@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (< i@170@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< i@170@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01))
(pop) ; 15
; Joined path conditions
(assert (and
  (<= 0 i@170@01)
  (< i@170@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 90 | !(i@170@01 < t@160@01)]
(assert (not (< i@170@01 t@160@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (< i@170@01 t@160@01)
  (and
    (< i@170@01 t@160@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
    (<= 0 i@170@01)
    (< i@170@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01))))
; Joined path conditions
(assert (or (not (< i@170@01 t@160@01)) (< i@170@01 t@160@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 89 | !(i@170@01 <= First:(Second:($t@142@01)) && j@65@01 <= i@170@01)]
(assert (not
  (and
    (<=
      i@170@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@170@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<=
      i@170@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@170@01))
  (and
    (<=
      i@170@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@170@01)
    (=>
      (< i@170@01 t@160@01)
      (and
        (< i@170@01 t@160@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
        (<= 0 i@170@01)
        (< i@170@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01)))
    (or (not (< i@170@01 t@160@01)) (< i@170@01 t@160@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@170@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (<= j@65@01 i@170@01)))
  (and
    (<=
      i@170@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (<= j@65@01 i@170@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@170@01 Int)) (!
  (and
    (or (not (<= j@65@01 i@170@01)) (<= j@65@01 i@170@01))
    (=>
      (and
        (<=
          i@170@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@170@01))
      (and
        (<=
          i@170@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@170@01)
        (=>
          (< i@170@01 t@160@01)
          (and
            (< i@170@01 t@160@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
            (<= 0 i@170@01)
            (< i@170@01 (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01)))
        (or (not (< i@170@01 t@160@01)) (< i@170@01 t@160@01))))
    (or
      (not
        (and
          (<=
            i@170@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<= j@65@01 i@170@01)))
      (and
        (<=
          i@170@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@170@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
  :qid |prog.l136-aux|)))
(assert (forall ((i@170@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@170@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@170@01))
      (< i@170@01 t@160@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
  :qid |prog.l136_precondition|)))
(push) ; 10
(assert (not (forall ((i@170@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@170@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (<= j@65@01 i@170@01))
          (< i@170@01 t@160@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01))
      (and
        (and
          (<=
            i@170@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<= j@65@01 i@170@01))
        (< i@170@01 t@160@01)))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
  :qid |prog.l136|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(assert (forall ((i@170@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@170@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (<= j@65@01 i@170@01))
      (< i@170@01 t@160@01))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 i@170@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@170@01))
  :qid |prog.l136|)))
; [eval] (forall i: Int :: { loc(this.elems, i) } j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1)))
(declare-const i@171@01 Int)
(push) ; 10
; [eval] j < i && i <= this.size ==> i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] j < i && i <= this.size
; [eval] j < i
(push) ; 11
; [then-branch: 91 | j@65@01 < i@171@01 | live]
; [else-branch: 91 | !(j@65@01 < i@171@01) | live]
(push) ; 12
; [then-branch: 91 | j@65@01 < i@171@01]
(assert (< j@65@01 i@171@01))
; [eval] i <= this.size
(pop) ; 12
(push) ; 12
; [else-branch: 91 | !(j@65@01 < i@171@01)]
(assert (not (< j@65@01 i@171@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 i@171@01)) (< j@65@01 i@171@01)))
(push) ; 11
; [then-branch: 92 | i@171@01 <= First:(Second:($t@142@01)) && j@65@01 < i@171@01 | live]
; [else-branch: 92 | !(i@171@01 <= First:(Second:($t@142@01)) && j@65@01 < i@171@01) | live]
(push) ; 12
; [then-branch: 92 | i@171@01 <= First:(Second:($t@142@01)) && j@65@01 < i@171@01]
(assert (and
  (<= i@171@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
  (< j@65@01 i@171@01)))
; [eval] i > t ==> loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] i > t
(push) ; 13
; [then-branch: 93 | i@171@01 > t@160@01 | live]
; [else-branch: 93 | !(i@171@01 > t@160@01) | live]
(push) ; 14
; [then-branch: 93 | i@171@01 > t@160@01]
(assert (> i@171@01 t@160@01))
; [eval] loc(this.elems, i).val == old(itemAt(this, i - 1))
; [eval] loc(this.elems, i)
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)))
(push) ; 15
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) t@141@01))
        $Perm.Write
        $Perm.No)
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (-
      (ite
        (and
          (<=
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (<
            j@65@01
            (inv@146@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@157@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)))))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [eval] old(itemAt(this, i - 1))
; [eval] itemAt(this, i - 1)
; [eval] i - 1
(push) ; 15
; [eval] 0 <= index
(push) ; 16
(assert (not (<= 0 (- i@171@01 1))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- i@171@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (< (- i@171@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
(assert (< (- i@171@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1)))
(pop) ; 15
; Joined path conditions
(assert (and
  (<= 0 (- i@171@01 1))
  (< (- i@171@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1))))
(pop) ; 14
(push) ; 14
; [else-branch: 93 | !(i@171@01 > t@160@01)]
(assert (not (> i@171@01 t@160@01)))
(pop) ; 14
(pop) ; 13
; Joined path conditions
(assert (=>
  (> i@171@01 t@160@01)
  (and
    (> i@171@01 t@160@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
    (<= 0 (- i@171@01 1))
    (< (- i@171@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1)))))
; Joined path conditions
(assert (or (not (> i@171@01 t@160@01)) (> i@171@01 t@160@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 92 | !(i@171@01 <= First:(Second:($t@142@01)) && j@65@01 < i@171@01)]
(assert (not
  (and
    (<=
      i@171@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@171@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<=
      i@171@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@171@01))
  (and
    (<=
      i@171@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@171@01)
    (=>
      (> i@171@01 t@160@01)
      (and
        (> i@171@01 t@160@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
        (<= 0 (- i@171@01 1))
        (< (- i@171@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1))))
    (or (not (> i@171@01 t@160@01)) (> i@171@01 t@160@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        i@171@01
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 i@171@01)))
  (and
    (<=
      i@171@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
    (< j@65@01 i@171@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@171@01 Int)) (!
  (and
    (or (not (< j@65@01 i@171@01)) (< j@65@01 i@171@01))
    (=>
      (and
        (<=
          i@171@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@171@01))
      (and
        (<=
          i@171@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@171@01)
        (=>
          (> i@171@01 t@160@01)
          (and
            (> i@171@01 t@160@01)
            ($FVF.loc_val ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
            (<= 0 (- i@171@01 1))
            (< (- i@171@01 1) (length $t@60@01 this@57@01))
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1))))
        (or (not (> i@171@01 t@160@01)) (> i@171@01 t@160@01))))
    (or
      (not
        (and
          (<=
            i@171@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i@171@01)))
      (and
        (<=
          i@171@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@171@01))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
  :qid |prog.l137-aux|)))
(assert (forall ((i@171@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@171@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@171@01))
      (> i@171@01 t@160@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
  :qid |prog.l137_precondition|)))
(push) ; 10
(assert (not (forall ((i@171@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<=
              i@171@01
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
            (< j@65@01 i@171@01))
          (> i@171@01 t@160@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- i@171@01 1)))
      (and
        (and
          (<=
            i@171@01
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 i@171@01))
        (> i@171@01 t@160@01)))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@171@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
  :qid |prog.l137|))))
(check-sat)
; unsat
(pop) ; 10
; 0.04s
; (get-info :all-statistics)
(assert (forall ((i@171@01 Int)) (!
  (=>
    (and
      (and
        (<=
          i@171@01
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 i@171@01))
      (> i@171@01 t@160@01))
    (=
      ($FVF.lookup_val (as sm@161@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        i@171@01
        1))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@171@01))
  :qid |prog.l137|)))
(pop) ; 9
(push) ; 9
; [else-branch: 86 | !(t@141@01 > j@65@01)]
(assert (not (> t@141@01 j@65@01)))
(pop) ; 9
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01)))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))))
(assert (=
  ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))
  ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
; [eval] !(t > j)
; [eval] t > j
(push) ; 9
(set-option :timeout 10)
(assert (not (> t@141@01 j@65@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (> t@141@01 j@65@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 94 | !(t@141@01 > j@65@01) | live]
; [else-branch: 94 | t@141@01 > j@65@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 94 | !(t@141@01 > j@65@01)]
(assert (not (> t@141@01 j@65@01)))
; [exec]
; loc(this.elems, j).val := elem
; [eval] loc(this.elems, j)
(declare-const sm@172@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and
              (<
                (inv@79@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
              (<= 0 (inv@79@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@150@01 r))
        (pTaken@154@01 r)))
    (=
      ($FVF.lookup_val (as sm@172@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@172@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@172@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@143@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@172@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@143@01  $FVF<val>) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      ($FVF.lookup_val (as sm@172@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@172@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@143@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r))
  :pattern (($FVF.lookup_val (as sm@172@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef76|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@172@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@173@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@174@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (-
        (-
          (ite
            (and
              (<
                (inv@79@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
              (<= 0 (inv@79@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@150@01 r))
        (pTaken@154@01 r))
      (- $Perm.Write (pTaken@173@01 r)))
    $Perm.No))
(define-fun pTaken@175@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@146@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 (inv@146@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@173@01 r)) (pTaken@174@01 r)))
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
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@173@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (= (- $Perm.Write (pTaken@173@01 r)) $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and
              (<
                (inv@79@01 r)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
              (<= 0 (inv@79@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@150@01 r))
        (pTaken@154@01 r))
      (pTaken@174@01 r))
    $Perm.No)
  
  :qid |quant-u-131|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (= (- (- $Perm.Write (pTaken@173@01 r)) (pTaken@174@01 r)) $Perm.No))
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@176@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@176@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
  elem@58@01))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@176@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
; [exec]
; this.size := this.size + 1
; [eval] this.size + 1
(declare-const size@177@01 Int)
(assert (=
  size@177@01
  (+ ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))) 1)))
; [exec]
; fold acc(AList(this), write)
; [eval] 0 <= this.size
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 size@177@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 size@177@01))
; [eval] this.size <= len(this.elems)
; [eval] len(this.elems)
(push) ; 10
(assert (not (<= size@177@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= size@177@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)))))
; [eval] 0 < len(this.elems)
; [eval] len(this.elems)
(push) ; 10
(assert (not (< 0 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (< 0 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)))))
(declare-const i@178@01 Int)
(push) ; 10
; [eval] 0 <= i && i < len(this.elems)
; [eval] 0 <= i
(push) ; 11
; [then-branch: 95 | 0 <= i@178@01 | live]
; [else-branch: 95 | !(0 <= i@178@01) | live]
(push) ; 12
; [then-branch: 95 | 0 <= i@178@01]
(assert (<= 0 i@178@01))
; [eval] i < len(this.elems)
; [eval] len(this.elems)
(pop) ; 12
(push) ; 12
; [else-branch: 95 | !(0 <= i@178@01)]
(assert (not (<= 0 i@178@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@178@01)) (<= 0 i@178@01)))
(assert (and
  (< i@178@01 (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
  (<= 0 i@178@01)))
; [eval] loc(this.elems, i)
(pop) ; 10
(declare-fun inv@179@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@178@01 Int)) (!
  (=>
    (and
      (<
        i@178@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 i@178@01))
    (or (not (<= 0 i@178@01)) (<= 0 i@178@01)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@178@01))
  :qid |val-aux|)))
(declare-const sm@180@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (-
            (ite
              (and
                (<
                  (inv@79@01 r)
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
                (<= 0 (inv@79@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@150@01 r))
          (pTaken@154@01 r))
        (pTaken@174@01 r)))
    (=
      ($FVF.lookup_val (as sm@180@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@180@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<=
        (inv@146@01 r)
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
      (< j@65@01 (inv@146@01 r)))
    (=
      ($FVF.lookup_val (as sm@180@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@180@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
    (=
      ($FVF.lookup_val (as sm@180@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@176@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@180@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@176@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@180@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef80|)))
; Check receiver injectivity
(push) ; 10
(assert (not (forall ((i1@178@01 Int) (i2@178@01 Int)) (!
  (=>
    (and
      (and
        (and
          (<
            i1@178@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
          (<= 0 i1@178@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@180@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@178@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@178@01)))
      (and
        (and
          (<
            i2@178@01
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
          (<= 0 i2@178@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@180@01  $FVF<val>) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@178@01)) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@178@01)))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i1@178@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i2@178@01)))
    (= i1@178@01 i2@178@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@178@01 Int)) (!
  (=>
    (and
      (<
        i@178@01
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 i@178@01))
    (=
      (inv@179@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@178@01))
      i@178@01))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) i@178@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) (inv@179@01 r))
      r))
  :pattern ((inv@179@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@180@01  $FVF<val>) r) r))
  :pattern ((inv@179@01 r))
  :qid |quant-u-134|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@181@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    ($Perm.min
      (-
        (-
          (-
            (ite
              (and
                (<
                  (inv@79@01 r)
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
                (<= 0 (inv@79@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@150@01 r))
          (pTaken@154@01 r))
        (pTaken@174@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@182@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    ($Perm.min
      (ite
        (and
          (<=
            (inv@146@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 (inv@146@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@181@01 r)))
    $Perm.No))
(define-fun pTaken@183@01 ((r $Ref)) $Perm
  (ite
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@181@01 r)) (pTaken@182@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (-
            (ite
              (and
                (<
                  (inv@79@01 r)
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
                (<= 0 (inv@79@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@150@01 r))
          (pTaken@154@01 r))
        (pTaken@174@01 r))
      (pTaken@181@01 r))
    $Perm.No)
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    (= (- $Perm.Write (pTaken@181@01 r)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (<=
            (inv@146@01 r)
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
          (< j@65@01 (inv@146@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@182@01 r))
    $Perm.No)
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    (= (- (- $Perm.Write (pTaken@181@01 r)) (pTaken@182@01 r)) $Perm.No))
  
  :qid |quant-u-139|))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01))
      $Perm.Write
      $Perm.No)
    (pTaken@183@01 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@179@01 r)
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
      (<= 0 (inv@179@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@181@01 r)) (pTaken@182@01 r))
        (pTaken@183@01 r))
      $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@184@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@184@01  $FVF<val>)))
      (and
        (<
          (inv@179@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
        (<= 0 (inv@179@01 r))))
    (=>
      (and
        (<
          (inv@179@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
        (<= 0 (inv@179@01 r)))
      (Set_in r ($FVF.domain_val (as sm@184@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@184@01  $FVF<val>))))
  :qid |qp.fvfDomDef85|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@179@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
        (<= 0 (inv@179@01 r)))
      (<
        $Perm.No
        (-
          (-
            (-
              (ite
                (and
                  (<
                    (inv@79@01 r)
                    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01)))))
                  (<= 0 (inv@79@01 r)))
                $Perm.Write
                $Perm.No)
              (pTaken@150@01 r))
            (pTaken@154@01 r))
          (pTaken@174@01 r))))
    (=
      ($FVF.lookup_val (as sm@184@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r)))
  :pattern (($FVF.lookup_val (as sm@184@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@179@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
        (<= 0 (inv@179@01 r)))
      (and
        (<=
          (inv@146@01 r)
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@142@01))))
        (< j@65@01 (inv@146@01 r))))
    (=
      ($FVF.lookup_val (as sm@184@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r)))
  :pattern (($FVF.lookup_val (as sm@184@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<
          (inv@179@01 r)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01))))
        (<= 0 (inv@179@01 r)))
      (=
        r
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first $t@142@01)) j@65@01)))
    (=
      ($FVF.lookup_val (as sm@184@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@176@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@184@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@66@01))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))))) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@176@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@184@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef84|)))
(assert (AList%trigger ($Snap.combine
  ($Snap.first $t@142@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@177@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
; [eval] 0 <= j
; [eval] j < length(this)
; [eval] length(this)
(set-option :timeout 0)
(push) ; 10
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@142@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@177@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
(pop) ; 10
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($Snap.first $t@142@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap size@177@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
(push) ; 10
(assert (not (<
  j@65@01
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  j@65@01
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (=
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)
  (+ (length $t@60@01 this@57@01) 1))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)
  (+ (length $t@60@01 this@57@01) 1)))
; [eval] (forall k: Int :: { old(itemAt(this, k)) } 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k)))
(declare-const k@185@01 Int)
(push) ; 10
; [eval] 0 <= k && k < j ==> itemAt(this, k) == old(itemAt(this, k))
; [eval] 0 <= k && k < j
; [eval] 0 <= k
(push) ; 11
; [then-branch: 96 | 0 <= k@185@01 | live]
; [else-branch: 96 | !(0 <= k@185@01) | live]
(push) ; 12
; [then-branch: 96 | 0 <= k@185@01]
(assert (<= 0 k@185@01))
; [eval] k < j
(pop) ; 12
(push) ; 12
; [else-branch: 96 | !(0 <= k@185@01)]
(assert (not (<= 0 k@185@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 k@185@01)) (<= 0 k@185@01)))
(push) ; 11
; [then-branch: 97 | k@185@01 < j@65@01 && 0 <= k@185@01 | live]
; [else-branch: 97 | !(k@185@01 < j@65@01 && 0 <= k@185@01) | live]
(push) ; 12
; [then-branch: 97 | k@185@01 < j@65@01 && 0 <= k@185@01]
(assert (and (< k@185@01 j@65@01) (<= 0 k@185@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (<
  k@185@01
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<
  k@185@01
  (length ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<
    k@185@01
    (length ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
; [eval] old(itemAt(this, k))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< k@185@01 (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< k@185@01 (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (< k@185@01 (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 97 | !(k@185@01 < j@65@01 && 0 <= k@185@01)]
(assert (not (and (< k@185@01 j@65@01) (<= 0 k@185@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and (< k@185@01 j@65@01) (<= 0 k@185@01))
  (and
    (< k@185@01 j@65@01)
    (<= 0 k@185@01)
    (<
      k@185@01
      (length ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
    (< k@185@01 (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))))
; Joined path conditions
(assert (or
  (not (and (< k@185@01 j@65@01) (<= 0 k@185@01)))
  (and (< k@185@01 j@65@01) (<= 0 k@185@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@185@01 Int)) (!
  (and
    (or (not (<= 0 k@185@01)) (<= 0 k@185@01))
    (=>
      (and (< k@185@01 j@65@01) (<= 0 k@185@01))
      (and
        (< k@185@01 j@65@01)
        (<= 0 k@185@01)
        (<
          k@185@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
        (< k@185@01 (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
    (or
      (not (and (< k@185@01 j@65@01) (<= 0 k@185@01)))
      (and (< k@185@01 j@65@01) (<= 0 k@185@01))))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
  :qid |prog.l101-aux|)))
(assert (forall ((k@185@01 Int)) (!
  (=>
    (and (< k@185@01 j@65@01) (<= 0 k@185@01))
    (and
      (itemAt%precondition ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
      (itemAt%precondition ($Snap.combine
        $t@60@01
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
  :qid |prog.l101_precondition|)))
(push) ; 10
(assert (not (forall ((k@185@01 Int)) (!
  (=>
    (and
      (=>
        (and (< k@185@01 j@65@01) (<= 0 k@185@01))
        (and
          (itemAt%precondition ($Snap.combine
            ($Snap.combine
              ($Snap.first $t@142@01)
              ($Snap.combine
                ($SortWrappers.IntTo$Snap size@177@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
            ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
          (itemAt%precondition ($Snap.combine
            $t@60@01
            ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
      (and (< k@185@01 j@65@01) (<= 0 k@185@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
  :qid |prog.l101|))))
(check-sat)
; unsat
(pop) ; 10
; 0.03s
; (get-info :all-statistics)
(assert (forall ((k@185@01 Int)) (!
  (=>
    (and (< k@185@01 j@65@01) (<= 0 k@185@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01)))
  :pattern ((itemAt%limited ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@185@01))
  :qid |prog.l101|)))
; [eval] itemAt(this, j) == elem
; [eval] itemAt(this, j)
(push) ; 10
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(pop) ; 10
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01))
(push) ; 10
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
  elem@58@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
  elem@58@01))
; [eval] (forall k: Int :: { itemAt(this, k) } j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1)))
(declare-const k@186@01 Int)
(push) ; 10
; [eval] j < k && k < length(this) ==> itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] j < k && k < length(this)
; [eval] j < k
(push) ; 11
; [then-branch: 98 | j@65@01 < k@186@01 | live]
; [else-branch: 98 | !(j@65@01 < k@186@01) | live]
(push) ; 12
; [then-branch: 98 | j@65@01 < k@186@01]
(assert (< j@65@01 k@186@01))
; [eval] k < length(this)
; [eval] length(this)
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 98 | !(j@65@01 < k@186@01)]
(assert (not (< j@65@01 k@186@01)))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 k@186@01)) (< j@65@01 k@186@01)))
(push) ; 11
; [then-branch: 99 | k@186@01 < length((First:($t@142@01), (size@177@01, (_, (_, (_, sm@184@01))))), this@57@01) && j@65@01 < k@186@01 | live]
; [else-branch: 99 | !(k@186@01 < length((First:($t@142@01), (size@177@01, (_, (_, (_, sm@184@01))))), this@57@01) && j@65@01 < k@186@01) | live]
(push) ; 12
; [then-branch: 99 | k@186@01 < length((First:($t@142@01), (size@177@01, (_, (_, (_, sm@184@01))))), this@57@01) && j@65@01 < k@186@01]
(assert (and
  (<
    k@186@01
    (length ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
  (< j@65@01 k@186@01)))
; [eval] itemAt(this, k) == old(itemAt(this, k - 1))
; [eval] itemAt(this, k)
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 k@186@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 k@186@01))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@142@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap size@177@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 k@186@01)
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)))
; [eval] old(itemAt(this, k - 1))
; [eval] itemAt(this, k - 1)
; [eval] k - 1
(push) ; 13
; [eval] 0 <= index
(push) ; 14
(assert (not (<= 0 (- k@186@01 1))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- k@186@01 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (< (- k@186@01 1) (length $t@60@01 this@57@01))))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(assert (< (- k@186@01 1) (length $t@60@01 this@57@01)))
(assert (itemAt%precondition ($Snap.combine
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1)))
(pop) ; 13
; Joined path conditions
(assert (and
  (<= 0 (- k@186@01 1))
  (< (- k@186@01 1) (length $t@60@01 this@57@01))
  (itemAt%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 99 | !(k@186@01 < length((First:($t@142@01), (size@177@01, (_, (_, (_, sm@184@01))))), this@57@01) && j@65@01 < k@186@01)]
(assert (not
  (and
    (<
      k@186@01
      (length ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@186@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (and
    (<
      k@186@01
      (length ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@186@01))
  (and
    (<
      k@186@01
      (length ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@186@01)
    (<= 0 k@186@01)
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
    (<= 0 (- k@186@01 1))
    (< (- k@186@01 1) (length $t@60@01 this@57@01))
    (itemAt%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        k@186@01
        (length ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
      (< j@65@01 k@186@01)))
  (and
    (<
      k@186@01
      (length ($Snap.combine
        ($Snap.first $t@142@01)
        ($Snap.combine
          ($SortWrappers.IntTo$Snap size@177@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
    (< j@65@01 k@186@01))))
(pop) ; 10
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@186@01 Int)) (!
  (and
    (or (not (< j@65@01 k@186@01)) (< j@65@01 k@186@01))
    (=>
      (and
        (<
          k@186@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@186@01))
      (and
        (<
          k@186@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@186@01)
        (<= 0 k@186@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
        (<= 0 (- k@186@01 1))
        (< (- k@186@01 1) (length $t@60@01 this@57@01))
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1))))
    (or
      (not
        (and
          (<
            k@186@01
            (length ($Snap.combine
              ($Snap.first $t@142@01)
              ($Snap.combine
                ($SortWrappers.IntTo$Snap size@177@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
          (< j@65@01 k@186@01)))
      (and
        (<
          k@186@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@186@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01))
  :qid |prog.l103-aux|)))
(assert (forall ((k@186@01 Int)) (!
  (and
    (length%precondition ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)
    (=>
      (and
        (<
          k@186@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@186@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
        (itemAt%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1)))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01))
  :qid |prog.l103_precondition|)))
(push) ; 10
(assert (not (forall ((k@186@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01)
        (=>
          (and
            (<
              k@186@01
              (length ($Snap.combine
                ($Snap.first $t@142@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@177@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
            (< j@65@01 k@186@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($Snap.first $t@142@01)
                ($Snap.combine
                  ($SortWrappers.IntTo$Snap size@177@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
            (itemAt%precondition ($Snap.combine
              $t@60@01
              ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (- k@186@01 1)))))
      (and
        (<
          k@186@01
          (length ($Snap.combine
            ($Snap.first $t@142@01)
            ($Snap.combine
              ($SortWrappers.IntTo$Snap size@177@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
        (< j@65@01 k@186@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        k@186@01
        1))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01))
  :qid |prog.l103|))))
(check-sat)
; unsat
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
(assert (forall ((k@186@01 Int)) (!
  (=>
    (and
      (<
        k@186@01
        (length ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>))))))) this@57@01))
      (< j@65@01 k@186@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($Snap.first $t@142@01)
          ($Snap.combine
            ($SortWrappers.IntTo$Snap size@177@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01)
      (itemAt ($Snap.combine $t@60@01 ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 (-
        k@186@01
        1))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@142@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap size@177@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<val>To$Snap (as sm@184@01  $FVF<val>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 k@186@01))
  :qid |prog.l103|)))
(pop) ; 9
(push) ; 9
; [else-branch: 94 | t@141@01 > j@65@01]
(assert (> t@141@01 j@65@01))
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 71 | First:(Second:(First:($t@66@01))) == len[Int](First:(First:($t@66@01)))]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@66@01))))
  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first $t@66@01))))))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 37 | itemAt((First:($t@66@01), (_, _)), this@57@01, j@65@01) < elem@58@01 && j@65@01 < length(First:($t@66@01), this@57@01)]
(assert (and
  (<
    (itemAt ($Snap.combine
      ($Snap.first $t@66@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@57@01 j@65@01)
    elem@58@01)
  (< j@65@01 (length ($Snap.first $t@66@01) this@57@01))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
