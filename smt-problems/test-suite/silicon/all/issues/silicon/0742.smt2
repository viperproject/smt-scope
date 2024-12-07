(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0742.vpr
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
(declare-sort BoolWellFoundedOrder 0)
(declare-sort WellFoundedOrder<PredicateInstance> 0)
(declare-sort WellFoundedOrder<Bool> 0)
(declare-sort WellFoundedOrder<Perm> 0)
(declare-sort PredicateInstance 0)
(declare-sort WellFoundedOrder<Ref> 0)
(declare-sort RefWellFoundedOrder 0)
(declare-sort WellFoundedOrder<Int> 0)
(declare-sort PermWellFoundedOrder 0)
(declare-sort IntWellFoundedOrder 0)
(declare-sort PredicateInstancesNestedRelation 0)
(declare-sort PredicateInstancesWellFoundedOrder 0)
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
(declare-fun $SortWrappers.BoolWellFoundedOrderTo$Snap (BoolWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToBoolWellFoundedOrder ($Snap) BoolWellFoundedOrder)
(assert (forall ((x BoolWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToBoolWellFoundedOrder($SortWrappers.BoolWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.BoolWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToBoolWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoolWellFoundedOrderTo$Snap($SortWrappers.$SnapToBoolWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToBoolWellFoundedOrder x))
    :qid |$Snap.BoolWellFoundedOrderTo$SnapToBoolWellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap (WellFoundedOrder<PredicateInstance>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> ($Snap) WellFoundedOrder<PredicateInstance>)
(assert (forall ((x WellFoundedOrder<PredicateInstance>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance>($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<PredicateInstance>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<PredicateInstance>To$Snap($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<PredicateInstance> x))
    :qid |$Snap.WellFoundedOrder<PredicateInstance>To$SnapToWellFoundedOrder<PredicateInstance>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Bool>To$Snap (WellFoundedOrder<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Bool> ($Snap) WellFoundedOrder<Bool>)
(assert (forall ((x WellFoundedOrder<Bool>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Bool>($SortWrappers.WellFoundedOrder<Bool>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Bool>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Bool>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Bool> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Bool> x))
    :qid |$Snap.WellFoundedOrder<Bool>To$SnapToWellFoundedOrder<Bool>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Perm>To$Snap (WellFoundedOrder<Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Perm> ($Snap) WellFoundedOrder<Perm>)
(assert (forall ((x WellFoundedOrder<Perm>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Perm>($SortWrappers.WellFoundedOrder<Perm>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Perm>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Perm>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Perm> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Perm> x))
    :qid |$Snap.WellFoundedOrder<Perm>To$SnapToWellFoundedOrder<Perm>|
    )))
(declare-fun $SortWrappers.PredicateInstanceTo$Snap (PredicateInstance) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstance ($Snap) PredicateInstance)
(assert (forall ((x PredicateInstance)) (!
    (= x ($SortWrappers.$SnapToPredicateInstance($SortWrappers.PredicateInstanceTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstanceTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstanceTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstanceTo$Snap($SortWrappers.$SnapToPredicateInstance x)))
    :pattern (($SortWrappers.$SnapToPredicateInstance x))
    :qid |$Snap.PredicateInstanceTo$SnapToPredicateInstance|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Ref>To$Snap (WellFoundedOrder<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Ref> ($Snap) WellFoundedOrder<Ref>)
(assert (forall ((x WellFoundedOrder<Ref>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Ref>($SortWrappers.WellFoundedOrder<Ref>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Ref>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Ref>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Ref> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Ref> x))
    :qid |$Snap.WellFoundedOrder<Ref>To$SnapToWellFoundedOrder<Ref>|
    )))
(declare-fun $SortWrappers.RefWellFoundedOrderTo$Snap (RefWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToRefWellFoundedOrder ($Snap) RefWellFoundedOrder)
(assert (forall ((x RefWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToRefWellFoundedOrder($SortWrappers.RefWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.RefWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToRefWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.RefWellFoundedOrderTo$Snap($SortWrappers.$SnapToRefWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToRefWellFoundedOrder x))
    :qid |$Snap.RefWellFoundedOrderTo$SnapToRefWellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Int>To$Snap (WellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Int> ($Snap) WellFoundedOrder<Int>)
(assert (forall ((x WellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Int>($SortWrappers.WellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Int> x))
    :qid |$Snap.WellFoundedOrder<Int>To$SnapToWellFoundedOrder<Int>|
    )))
(declare-fun $SortWrappers.PermWellFoundedOrderTo$Snap (PermWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToPermWellFoundedOrder ($Snap) PermWellFoundedOrder)
(assert (forall ((x PermWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToPermWellFoundedOrder($SortWrappers.PermWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.PermWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToPermWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PermWellFoundedOrderTo$Snap($SortWrappers.$SnapToPermWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToPermWellFoundedOrder x))
    :qid |$Snap.PermWellFoundedOrderTo$SnapToPermWellFoundedOrder|
    )))
(declare-fun $SortWrappers.IntWellFoundedOrderTo$Snap (IntWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntWellFoundedOrder ($Snap) IntWellFoundedOrder)
(assert (forall ((x IntWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntWellFoundedOrder($SortWrappers.IntWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntWellFoundedOrder x))
    :qid |$Snap.IntWellFoundedOrderTo$SnapToIntWellFoundedOrder|
    )))
(declare-fun $SortWrappers.PredicateInstancesNestedRelationTo$Snap (PredicateInstancesNestedRelation) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstancesNestedRelation ($Snap) PredicateInstancesNestedRelation)
(assert (forall ((x PredicateInstancesNestedRelation)) (!
    (= x ($SortWrappers.$SnapToPredicateInstancesNestedRelation($SortWrappers.PredicateInstancesNestedRelationTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstancesNestedRelationTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstancesNestedRelationTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstancesNestedRelationTo$Snap($SortWrappers.$SnapToPredicateInstancesNestedRelation x)))
    :pattern (($SortWrappers.$SnapToPredicateInstancesNestedRelation x))
    :qid |$Snap.PredicateInstancesNestedRelationTo$SnapToPredicateInstancesNestedRelation|
    )))
(declare-fun $SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap (PredicateInstancesWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToPredicateInstancesWellFoundedOrder ($Snap) PredicateInstancesWellFoundedOrder)
(assert (forall ((x PredicateInstancesWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToPredicateInstancesWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PredicateInstancesWellFoundedOrderTo$Snap($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToPredicateInstancesWellFoundedOrder x))
    :qid |$Snap.PredicateInstancesWellFoundedOrderTo$SnapToPredicateInstancesWellFoundedOrder|
    )))
; ////////// Symbols
(declare-fun decreasing<Bool> ($Perm $Perm) Bool)
(declare-fun bounded<Bool> ($Perm) Bool)
(declare-fun nestedPredicates<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun decreasing<Bool> (Bool Bool) Bool)
(declare-fun bounded<Bool> (Bool) Bool)
(declare-fun decreasing<Bool> ($Ref $Ref) Bool)
(declare-fun bounded<Bool> ($Ref) Bool)
(declare-fun decreasing<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun bounded<Bool> (PredicateInstance) Bool)
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((l1 PredicateInstance) (l2 PredicateInstance) (l3 PredicateInstance)) (!
  (=>
    (and (nestedPredicates<Bool> l1 l2) (nestedPredicates<Bool> l2 l3))
    (nestedPredicates<Bool> l1 l3))
  :pattern ((nestedPredicates<Bool> l1 l2) (nestedPredicates<Bool> l2 l3))
  :qid |prog.nestedTrans|)))
(assert (forall ((l1 PredicateInstance)) (!
  (not (nestedPredicates<Bool> l1 l1))
  :pattern ((nestedPredicates<Bool> l1 l1))
  :qid |prog.nestedReflex|)))
(assert (decreasing<Bool> false true))
(assert (forall ((bool1 Bool)) (!
  (bounded<Bool> bool1)
  :pattern ((bounded<Bool> bool1))
  :qid |prog.bool_ax_bound|)))
(assert (forall ((int1 Int) (int2 Int)) (!
  (=> (< int1 int2) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.integer_ax_dec|)))
(assert (forall ((int1 Int)) (!
  (=> (>= int1 0) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.integer_ax_bound|)))
(assert (forall ((ref1 $Ref)) (!
  (=> (not (= ref1 $Ref.null)) (decreasing<Bool> $Ref.null ref1))
  :pattern ((decreasing<Bool> $Ref.null ref1))
  :qid |prog.ref_ax_dec|)))
(assert (forall ((ref1 $Ref)) (!
  (bounded<Bool> ref1)
  :pattern ((bounded<Bool> ref1))
  :qid |prog.ref_ax_bound|)))
(assert (forall ((int1 $Perm) (int2 $Perm)) (!
  (=> (<= int1 (- int2 $Perm.Write)) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.rational_ax_dec|)))
(assert (forall ((int1 $Perm)) (!
  (=> (>= int1 $Perm.No) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.rational_ax_bound|)))
(assert (forall ((l1 PredicateInstance) (l2 PredicateInstance)) (!
  (= (decreasing<Bool> l1 l2) (nestedPredicates<Bool> l1 l2))
  :pattern ((nestedPredicates<Bool> l1 l2))
  :qid |prog.predicate_instances_ax_dec|)))
(assert (forall ((l1 PredicateInstance)) (!
  (bounded<Bool> l1)
  :pattern ((bounded<Bool> l1))
  :qid |prog.predicate_instances_ax_bound|)))
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
