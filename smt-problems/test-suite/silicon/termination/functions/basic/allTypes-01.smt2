(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/allTypes.vpr
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
(declare-sort Seq<Bool> 0)
(declare-sort Seq<Int> 0)
(declare-sort Set<Int> 0)
(declare-sort Multiset<Int> 0)
(declare-sort BoolWellFoundedOrder 0)
(declare-sort WellFoundedOrder<PredicateInstance> 0)
(declare-sort WellFoundedOrder<Bool> 0)
(declare-sort SeqWellFoundedOrder<Bool> 0)
(declare-sort WellFoundedOrder<Perm> 0)
(declare-sort SetWellFoundedOrder<Int> 0)
(declare-sort SeqWellFoundedOrder<Int> 0)
(declare-sort PredicateInstance 0)
(declare-sort WellFoundedOrder<Ref> 0)
(declare-sort PermWellFoundedOrder 0)
(declare-sort IntWellFoundedOrder 0)
(declare-sort PredicateInstancesWellFoundedOrder 0)
(declare-sort WellFoundedOrder<Set<Int>> 0)
(declare-sort WellFoundedOrder<Multiset<Int>> 0)
(declare-sort RefWellFoundedOrder 0)
(declare-sort MultiSetWellFoundedOrder<Int> 0)
(declare-sort WellFoundedOrder<Int> 0)
(declare-sort PredicateInstancesNestedRelation 0)
(declare-sort WellFoundedOrder<Seq<Int>> 0)
(declare-sort WellFoundedOrder<Seq<Bool>> 0)
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
(declare-fun $SortWrappers.Seq<Bool>To$Snap (Seq<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Bool> ($Snap) Seq<Bool>)
(assert (forall ((x Seq<Bool>)) (!
    (= x ($SortWrappers.$SnapToSeq<Bool>($SortWrappers.Seq<Bool>To$Snap x)))
    :pattern (($SortWrappers.Seq<Bool>To$Snap x))
    :qid |$Snap.$SnapToSeq<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Bool>To$Snap($SortWrappers.$SnapToSeq<Bool> x)))
    :pattern (($SortWrappers.$SnapToSeq<Bool> x))
    :qid |$Snap.Seq<Bool>To$SnapToSeq<Bool>|
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Multiset<Int>To$Snap (Multiset<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<Int> ($Snap) Multiset<Int>)
(assert (forall ((x Multiset<Int>)) (!
    (= x ($SortWrappers.$SnapToMultiset<Int>($SortWrappers.Multiset<Int>To$Snap x)))
    :pattern (($SortWrappers.Multiset<Int>To$Snap x))
    :qid |$Snap.$SnapToMultiset<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<Int>To$Snap($SortWrappers.$SnapToMultiset<Int> x)))
    :pattern (($SortWrappers.$SnapToMultiset<Int> x))
    :qid |$Snap.Multiset<Int>To$SnapToMultiset<Int>|
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
(declare-fun $SortWrappers.SeqWellFoundedOrder<Bool>To$Snap (SeqWellFoundedOrder<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSeqWellFoundedOrder<Bool> ($Snap) SeqWellFoundedOrder<Bool>)
(assert (forall ((x SeqWellFoundedOrder<Bool>)) (!
    (= x ($SortWrappers.$SnapToSeqWellFoundedOrder<Bool>($SortWrappers.SeqWellFoundedOrder<Bool>To$Snap x)))
    :pattern (($SortWrappers.SeqWellFoundedOrder<Bool>To$Snap x))
    :qid |$Snap.$SnapToSeqWellFoundedOrder<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.SeqWellFoundedOrder<Bool>To$Snap($SortWrappers.$SnapToSeqWellFoundedOrder<Bool> x)))
    :pattern (($SortWrappers.$SnapToSeqWellFoundedOrder<Bool> x))
    :qid |$Snap.SeqWellFoundedOrder<Bool>To$SnapToSeqWellFoundedOrder<Bool>|
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
(declare-fun $SortWrappers.SetWellFoundedOrder<Int>To$Snap (SetWellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSetWellFoundedOrder<Int> ($Snap) SetWellFoundedOrder<Int>)
(assert (forall ((x SetWellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToSetWellFoundedOrder<Int>($SortWrappers.SetWellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.SetWellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToSetWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.SetWellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToSetWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToSetWellFoundedOrder<Int> x))
    :qid |$Snap.SetWellFoundedOrder<Int>To$SnapToSetWellFoundedOrder<Int>|
    )))
(declare-fun $SortWrappers.SeqWellFoundedOrder<Int>To$Snap (SeqWellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeqWellFoundedOrder<Int> ($Snap) SeqWellFoundedOrder<Int>)
(assert (forall ((x SeqWellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToSeqWellFoundedOrder<Int>($SortWrappers.SeqWellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.SeqWellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToSeqWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.SeqWellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToSeqWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToSeqWellFoundedOrder<Int> x))
    :qid |$Snap.SeqWellFoundedOrder<Int>To$SnapToSeqWellFoundedOrder<Int>|
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
(declare-fun $SortWrappers.WellFoundedOrder<Set<Int>>To$Snap (WellFoundedOrder<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Set<Int>> ($Snap) WellFoundedOrder<Set<Int>>)
(assert (forall ((x WellFoundedOrder<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Set<Int>>($SortWrappers.WellFoundedOrder<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Set<Int>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Set<Int>> x))
    :qid |$Snap.WellFoundedOrder<Set<Int>>To$SnapToWellFoundedOrder<Set<Int>>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Multiset<Int>>To$Snap (WellFoundedOrder<Multiset<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Multiset<Int>> ($Snap) WellFoundedOrder<Multiset<Int>>)
(assert (forall ((x WellFoundedOrder<Multiset<Int>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Multiset<Int>>($SortWrappers.WellFoundedOrder<Multiset<Int>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Multiset<Int>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Multiset<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Multiset<Int>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Multiset<Int>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Multiset<Int>> x))
    :qid |$Snap.WellFoundedOrder<Multiset<Int>>To$SnapToWellFoundedOrder<Multiset<Int>>|
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
(declare-fun $SortWrappers.MultiSetWellFoundedOrder<Int>To$Snap (MultiSetWellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiSetWellFoundedOrder<Int> ($Snap) MultiSetWellFoundedOrder<Int>)
(assert (forall ((x MultiSetWellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToMultiSetWellFoundedOrder<Int>($SortWrappers.MultiSetWellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.MultiSetWellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToMultiSetWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MultiSetWellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToMultiSetWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToMultiSetWellFoundedOrder<Int> x))
    :qid |$Snap.MultiSetWellFoundedOrder<Int>To$SnapToMultiSetWellFoundedOrder<Int>|
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
(declare-fun $SortWrappers.WellFoundedOrder<Seq<Int>>To$Snap (WellFoundedOrder<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Seq<Int>> ($Snap) WellFoundedOrder<Seq<Int>>)
(assert (forall ((x WellFoundedOrder<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Seq<Int>>($SortWrappers.WellFoundedOrder<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Seq<Int>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Seq<Int>> x))
    :qid |$Snap.WellFoundedOrder<Seq<Int>>To$SnapToWellFoundedOrder<Seq<Int>>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Seq<Bool>>To$Snap (WellFoundedOrder<Seq<Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Seq<Bool>> ($Snap) WellFoundedOrder<Seq<Bool>>)
(assert (forall ((x WellFoundedOrder<Seq<Bool>>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Seq<Bool>>($SortWrappers.WellFoundedOrder<Seq<Bool>>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Seq<Bool>>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Seq<Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Seq<Bool>>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Seq<Bool>> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Seq<Bool>> x))
    :qid |$Snap.WellFoundedOrder<Seq<Bool>>To$SnapToWellFoundedOrder<Seq<Bool>>|
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
(declare-fun Multiset_count (Multiset<Int> Int) Int)
(declare-fun Multiset_card (Multiset<Int>) Int)
(declare-const Multiset_empty Multiset<Int>)
(declare-fun Multiset_singleton (Int) Multiset<Int>)
(declare-fun Multiset_unionone (Multiset<Int> Int) Multiset<Int>)
(declare-fun Multiset_union (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_intersection (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_difference (Multiset<Int> Multiset<Int>) Multiset<Int>)
(declare-fun Multiset_subset (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_equal (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<Int> Multiset<Int>) Int)
(declare-fun Multiset_disjoint (Multiset<Int> Multiset<Int>) Bool)
(declare-fun Seq_length (Seq<Bool>) Int)
(declare-const Seq_empty Seq<Bool>)
(declare-fun Seq_singleton (Bool) Seq<Bool>)
(declare-fun Seq_append (Seq<Bool> Seq<Bool>) Seq<Bool>)
(declare-fun Seq_index (Seq<Bool> Int) Bool)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Bool> Int Bool) Seq<Bool>)
(declare-fun Seq_take (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_drop (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_contains (Seq<Bool> Bool) Bool)
(declare-fun Seq_contains_trigger (Seq<Bool> Bool) Bool)
(declare-fun Seq_skolem (Seq<Bool> Bool) Int)
(declare-fun Seq_equal (Seq<Bool> Seq<Bool>) Bool)
(declare-fun Seq_skolem_diff (Seq<Bool> Seq<Bool>) Int)
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
(declare-fun decreasing<Bool> ($Perm $Perm) Bool)
(declare-fun bounded<Bool> ($Perm) Bool)
(declare-fun nestedPredicates<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun decreasing<Bool> (Bool Bool) Bool)
(declare-fun bounded<Bool> (Bool) Bool)
(declare-fun decreasing<Bool> ($Ref $Ref) Bool)
(declare-fun bounded<Bool> ($Ref) Bool)
(declare-fun decreasing<Bool> (PredicateInstance PredicateInstance) Bool)
(declare-fun bounded<Bool> (PredicateInstance) Bool)
(declare-fun decreasing<Bool> (Seq<Int> Seq<Int>) Bool)
(declare-fun bounded<Bool> (Seq<Int>) Bool)
(declare-fun decreasing<Bool> (Seq<Bool> Seq<Bool>) Bool)
(declare-fun bounded<Bool> (Seq<Bool>) Bool)
(declare-fun decreasing<Bool> (Set<Int> Set<Int>) Bool)
(declare-fun bounded<Bool> (Set<Int>) Bool)
(declare-fun decreasing<Bool> (Multiset<Int> Multiset<Int>) Bool)
(declare-fun bounded<Bool> (Multiset<Int>) Bool)
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun sequences ($Snap Seq<Int>) Int)
(declare-fun sequences%limited ($Snap Seq<Int>) Int)
(declare-fun sequences%stateless (Seq<Int>) Bool)
(declare-fun sequences%precondition ($Snap Seq<Int>) Bool)
(declare-fun fact ($Snap Int) Int)
(declare-fun fact%limited ($Snap Int) Int)
(declare-fun fact%stateless (Int) Bool)
(declare-fun fact%precondition ($Snap Int) Bool)
(declare-fun rationals_e ($Snap $Perm) $Perm)
(declare-fun rationals_e%limited ($Snap $Perm) $Perm)
(declare-fun rationals_e%stateless ($Perm) Bool)
(declare-fun rationals_e%precondition ($Snap $Perm) Bool)
(declare-fun sets_e ($Snap Set<Int>) Int)
(declare-fun sets_e%limited ($Snap Set<Int>) Int)
(declare-fun sets_e%stateless (Set<Int>) Bool)
(declare-fun sets_e%precondition ($Snap Set<Int>) Bool)
(declare-fun predicates ($Snap $Ref) Int)
(declare-fun predicates%limited ($Snap $Ref) Int)
(declare-fun predicates%stateless ($Ref) Bool)
(declare-fun predicates%precondition ($Snap $Ref) Bool)
(declare-fun fact_e ($Snap Int) Int)
(declare-fun fact_e%limited ($Snap Int) Int)
(declare-fun fact_e%stateless (Int) Bool)
(declare-fun fact_e%precondition ($Snap Int) Bool)
(declare-fun PI_list ($Snap $Ref) PredicateInstance)
(declare-fun PI_list%limited ($Snap $Ref) PredicateInstance)
(declare-fun PI_list%stateless ($Ref) Bool)
(declare-fun PI_list%precondition ($Snap $Ref) Bool)
(declare-fun multiSets ($Snap Multiset<Int>) Int)
(declare-fun multiSets%limited ($Snap Multiset<Int>) Int)
(declare-fun multiSets%stateless (Multiset<Int>) Bool)
(declare-fun multiSets%precondition ($Snap Multiset<Int>) Bool)
(declare-fun references ($Snap $Ref) Int)
(declare-fun references%limited ($Snap $Ref) Int)
(declare-fun references%stateless ($Ref) Bool)
(declare-fun references%precondition ($Snap $Ref) Bool)
(declare-fun booleans_e ($Snap Bool) Int)
(declare-fun booleans_e%limited ($Snap Bool) Int)
(declare-fun booleans_e%stateless (Bool) Bool)
(declare-fun booleans_e%precondition ($Snap Bool) Bool)
(declare-fun references_e ($Snap $Ref) Int)
(declare-fun references_e%limited ($Snap $Ref) Int)
(declare-fun references_e%stateless ($Ref) Bool)
(declare-fun references_e%precondition ($Snap $Ref) Bool)
(declare-fun predicates_e ($Snap $Ref) Int)
(declare-fun predicates_e%limited ($Snap $Ref) Int)
(declare-fun predicates_e%stateless ($Ref) Bool)
(declare-fun predicates_e%precondition ($Snap $Ref) Bool)
(declare-fun rationals ($Snap $Perm) $Perm)
(declare-fun rationals%limited ($Snap $Perm) $Perm)
(declare-fun rationals%stateless ($Perm) Bool)
(declare-fun rationals%precondition ($Snap $Perm) Bool)
(declare-fun multiSets_e ($Snap Multiset<Int>) Int)
(declare-fun multiSets_e%limited ($Snap Multiset<Int>) Int)
(declare-fun multiSets_e%stateless (Multiset<Int>) Bool)
(declare-fun multiSets_e%precondition ($Snap Multiset<Int>) Bool)
(declare-fun sets ($Snap Set<Int>) Int)
(declare-fun sets%limited ($Snap Set<Int>) Int)
(declare-fun sets%stateless (Set<Int>) Bool)
(declare-fun sets%precondition ($Snap Set<Int>) Bool)
(declare-fun booleans ($Snap Bool) Int)
(declare-fun booleans%limited ($Snap Bool) Int)
(declare-fun booleans%stateless (Bool) Bool)
(declare-fun booleans%precondition ($Snap Bool) Bool)
(declare-fun numberOfUsers ($Snap Seq<Bool>) Int)
(declare-fun numberOfUsers%limited ($Snap Seq<Bool>) Int)
(declare-fun numberOfUsers%stateless (Seq<Bool>) Bool)
(declare-fun numberOfUsers%precondition ($Snap Seq<Bool>) Bool)
(declare-fun sequences_e ($Snap Seq<Int>) Int)
(declare-fun sequences_e%limited ($Snap Seq<Int>) Int)
(declare-fun sequences_e%stateless (Seq<Int>) Bool)
(declare-fun sequences_e%precondition ($Snap Seq<Int>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Bool>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Bool>)) 0))
(assert (forall ((s Seq<Bool>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Bool)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (not (= s1 (as Seq_empty  Seq<Bool>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Bool)) (!
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
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
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
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
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
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Bool>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (x Bool)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Bool>) (x Bool) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
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
(assert (forall ((a Seq<Bool>) (b Seq<Bool>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Bool) (y Bool)) (!
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
(assert (forall ((ms Multiset<Int>) (x Int)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o Int)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<Int>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<Int>) o))
  )))
(assert (forall ((s Multiset<Int>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<Int>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x Int)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r Int) (o Int)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r Int)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r Int)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<Int>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<Int>) (x Int) (o Int)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<Int>) (x Int)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (o Int)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>) (y Int)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (and
    (=
      (+
        (+
          (Multiset_card (Multiset_difference a b))
          (Multiset_card (Multiset_difference b a)))
        (* 2 (Multiset_card (Multiset_intersection a b))))
      (Multiset_card (Multiset_union a b)))
    (=
      (Multiset_card (Multiset_difference a b))
      (- (Multiset_card a) (Multiset_card (Multiset_intersection a b)))))
  :pattern ((Multiset_card (Multiset_difference a b)))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o Int)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (or
    (and (Multiset_equal a b) (= a b))
    (and
      (not (Multiset_equal a b))
      (and
        (not (= a b))
        (and
          (= (Multiset_skolem_diff a b) (Multiset_skolem_diff b a))
          (not
            (=
              (Multiset_count a (Multiset_skolem_diff a b))
              (Multiset_count b (Multiset_skolem_diff a b))))))))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<Int>) (b Multiset<Int>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o Int)) (!
      (or (= (Multiset_count a o) 0) (= (Multiset_count b o) 0))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_disjoint a b))
  )))
(assert (forall ((seq1 Seq<Bool>) (seq2 Seq<Bool>)) (!
  (=> (< (Seq_length seq1) (Seq_length seq2)) (decreasing<Bool> seq1 seq2))
  :pattern ((decreasing<Bool> seq1 seq2))
  :qid |prog.seq_ax_dec|)))
(assert (forall ((seq1 Seq<Bool>)) (!
  (=> (>= (Seq_length seq1) 0) (bounded<Bool> seq1))
  :pattern ((bounded<Bool> seq1))
  :qid |prog.seq_ax_bound|)))
(assert (forall ((seq1 Seq<Int>) (seq2 Seq<Int>)) (!
  (=> (< (Seq_length seq1) (Seq_length seq2)) (decreasing<Bool> seq1 seq2))
  :pattern ((decreasing<Bool> seq1 seq2))
  :qid |prog.seq_ax_dec|)))
(assert (forall ((seq1 Seq<Int>)) (!
  (=> (>= (Seq_length seq1) 0) (bounded<Bool> seq1))
  :pattern ((bounded<Bool> seq1))
  :qid |prog.seq_ax_bound|)))
(assert (forall ((mSet1 Multiset<Int>) (mSet2 Multiset<Int>)) (!
  (=>
    (< (Multiset_card mSet1) (Multiset_card mSet2))
    (decreasing<Bool> mSet1 mSet2))
  :pattern ((decreasing<Bool> mSet1 mSet2))
  :qid |prog.multiset_ax_dec|)))
(assert (forall ((mSet1 Multiset<Int>)) (!
  (bounded<Bool> mSet1)
  :pattern ((bounded<Bool> mSet1))
  :qid |prog.multiset_ax_bound|)))
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
(assert (forall ((set1 Set<Int>) (set2 Set<Int>)) (!
  (=> (< (Set_card set1) (Set_card set2)) (decreasing<Bool> set1 set2))
  :pattern ((decreasing<Bool> set1 set2))
  :qid |prog.set_ax_dec|)))
(assert (forall ((set1 Set<Int>)) (!
  (bounded<Bool> set1)
  :pattern ((bounded<Bool> set1))
  :qid |prog.set_ax_bound|)))
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
; ---------- FUNCTION sequences----------
(declare-fun seq@0@00 () Seq<Int>)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@36@00 $Snap)
(assert (= $t@36@00 $Snap.unit))
; [eval] result == |seq|
; [eval] |seq|
(assert (= result@1@00 (Seq_length seq@0@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (= (sequences%limited s@$ seq@0@00) (sequences s@$ seq@0@00))
  :pattern ((sequences s@$ seq@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (sequences%stateless seq@0@00)
  :pattern ((sequences%limited s@$ seq@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (let ((result@1@00 (sequences%limited s@$ seq@0@00))) (=>
    (sequences%precondition s@$ seq@0@00)
    (= result@1@00 (Seq_length seq@0@00))))
  :pattern ((sequences%limited s@$ seq@0@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (let ((result@1@00 (sequences%limited s@$ seq@0@00))) true)
  :pattern ((sequences%limited s@$ seq@0@00))
  :qid |quant-u-37|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|seq| != 0 ? 1 + sequences(seq[1..]) : 0)
; [eval] |seq| != 0
; [eval] |seq|
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length seq@0@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length seq@0@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | |seq@0@00| != 0 | live]
; [else-branch: 0 | |seq@0@00| == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | |seq@0@00| != 0]
(assert (not (= (Seq_length seq@0@00) 0)))
; [eval] 1 + sequences(seq[1..])
; [eval] sequences(seq[1..])
; [eval] seq[1..]
(push) ; 4
(assert (sequences%precondition $Snap.unit (Seq_drop seq@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (sequences%precondition $Snap.unit (Seq_drop seq@0@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | |seq@0@00| == 0]
(assert (= (Seq_length seq@0@00) 0))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= (Seq_length seq@0@00) 0))
  (and
    (not (= (Seq_length seq@0@00) 0))
    (sequences%precondition $Snap.unit (Seq_drop seq@0@00 1)))))
; Joined path conditions
(assert (or (= (Seq_length seq@0@00) 0) (not (= (Seq_length seq@0@00) 0))))
(assert (=
  result@1@00
  (ite
    (not (= (Seq_length seq@0@00) 0))
    (+ 1 (sequences $Snap.unit (Seq_drop seq@0@00 1)))
    0)))
; [eval] result == |seq|
; [eval] |seq|
(push) ; 2
(assert (not (= result@1@00 (Seq_length seq@0@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 (Seq_length seq@0@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (=>
    (sequences%precondition s@$ seq@0@00)
    (=
      (sequences s@$ seq@0@00)
      (ite
        (not (= (Seq_length seq@0@00) 0))
        (+ 1 (sequences%limited $Snap.unit (Seq_drop seq@0@00 1)))
        0)))
  :pattern ((sequences s@$ seq@0@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (seq@0@00 Seq<Int>)) (!
  (=>
    (sequences%precondition s@$ seq@0@00)
    (ite
      (not (= (Seq_length seq@0@00) 0))
      (sequences%precondition $Snap.unit (Seq_drop seq@0@00 1))
      true))
  :pattern ((sequences s@$ seq@0@00))
  :qid |quant-u-39|)))
; ---------- FUNCTION fact----------
(declare-fun x@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x >= 0
(assert (>= x@2@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (fact%limited s@$ x@2@00) (fact s@$ x@2@00))
  :pattern ((fact s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (fact%stateless x@2@00)
  :pattern ((fact%limited s@$ x@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= x@2@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x == 0 ? 1 : x * fact(x - 1))
; [eval] x == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@2@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@2@00 == 0 | live]
; [else-branch: 1 | x@2@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@2@00 == 0]
(assert (= x@2@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@2@00 != 0]
(assert (not (= x@2@00 0)))
; [eval] x * fact(x - 1)
; [eval] fact(x - 1)
; [eval] x - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- x@2@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- x@2@00 1) 0))
(assert (fact%precondition $Snap.unit (- x@2@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- x@2@00 1) 0) (fact%precondition $Snap.unit (- x@2@00 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= x@2@00 0))
  (and
    (not (= x@2@00 0))
    (>= (- x@2@00 1) 0)
    (fact%precondition $Snap.unit (- x@2@00 1)))))
(assert (or (not (= x@2@00 0)) (= x@2@00 0)))
(assert (= result@3@00 (ite (= x@2@00 0) 1 (* x@2@00 (fact $Snap.unit (- x@2@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fact%precondition s@$ x@2@00)
    (=
      (fact s@$ x@2@00)
      (ite (= x@2@00 0) 1 (* x@2@00 (fact%limited $Snap.unit (- x@2@00 1))))))
  :pattern ((fact s@$ x@2@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fact%precondition s@$ x@2@00)
    (ite (= x@2@00 0) true (fact%precondition $Snap.unit (- x@2@00 1))))
  :pattern ((fact s@$ x@2@00))
  :qid |quant-u-41|)))
; ---------- FUNCTION rationals_e----------
(declare-fun r@4@00 () $Perm)
(declare-fun result@5@00 () $Perm)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@4@00 $Perm)) (!
  (= (rationals_e%limited s@$ r@4@00) (rationals_e s@$ r@4@00))
  :pattern ((rationals_e s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Perm)) (!
  (rationals_e%stateless r@4@00)
  :pattern ((rationals_e%limited s@$ r@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (r >= 0 / 1 ? rationals_e(r / 2) : r)
; [eval] r >= 0 / 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= r@4@00 $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= r@4@00 $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | r@4@00 >= Z | live]
; [else-branch: 2 | !(r@4@00 >= Z) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | r@4@00 >= Z]
(assert (>= r@4@00 $Perm.No))
; [eval] rationals_e(r / 2)
; [eval] r / 2
(push) ; 4
(assert (rationals_e%precondition $Snap.unit (/ r@4@00 (to_real 2))))
(pop) ; 4
; Joined path conditions
(assert (rationals_e%precondition $Snap.unit (/ r@4@00 (to_real 2))))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(r@4@00 >= Z)]
(assert (not (>= r@4@00 $Perm.No)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (>= r@4@00 $Perm.No)
  (and
    (>= r@4@00 $Perm.No)
    (rationals_e%precondition $Snap.unit (/ r@4@00 (to_real 2))))))
; Joined path conditions
(assert (or (not (>= r@4@00 $Perm.No)) (>= r@4@00 $Perm.No)))
(assert (=
  result@5@00
  (ite
    (>= r@4@00 $Perm.No)
    (rationals_e $Snap.unit (/ r@4@00 (to_real 2)))
    r@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@4@00 $Perm)) (!
  (=>
    (rationals_e%precondition s@$ r@4@00)
    (=
      (rationals_e s@$ r@4@00)
      (ite
        (>= r@4@00 $Perm.No)
        (rationals_e%limited $Snap.unit (/ r@4@00 (to_real 2)))
        r@4@00)))
  :pattern ((rationals_e s@$ r@4@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Perm)) (!
  (=>
    (rationals_e%precondition s@$ r@4@00)
    (ite
      (>= r@4@00 $Perm.No)
      (rationals_e%precondition $Snap.unit (/ r@4@00 (to_real 2)))
      true))
  :pattern ((rationals_e s@$ r@4@00))
  :qid |quant-u-43|)))
; ---------- FUNCTION sets_e----------
(declare-fun s@6@00 () Set<Int>)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@6@00 Set<Int>)) (!
  (= (sets_e%limited s@$ s@6@00) (sets_e s@$ s@6@00))
  :pattern ((sets_e s@$ s@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (s@6@00 Set<Int>)) (!
  (sets_e%stateless s@6@00)
  :pattern ((sets_e%limited s@$ s@6@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|s| > 0 && (|s| in s) ? 1 : sets_e((s setminus Set(|s|))))
; [eval] |s| > 0 && (|s| in s)
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | !(|s@6@00| > 0) | live]
; [else-branch: 3 | |s@6@00| > 0 | live]
(push) ; 3
; [then-branch: 3 | !(|s@6@00| > 0)]
(assert (not (> (Set_card s@6@00) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | |s@6@00| > 0]
(assert (> (Set_card s@6@00) 0))
; [eval] (|s| in s)
; [eval] |s|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (> (Set_card s@6@00) 0) (not (> (Set_card s@6@00) 0))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | |s@6@00| > 0 && |s@6@00| in s@6@00 | live]
; [else-branch: 4 | !(|s@6@00| > 0 && |s@6@00| in s@6@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | |s@6@00| > 0 && |s@6@00| in s@6@00]
(assert (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(|s@6@00| > 0 && |s@6@00| in s@6@00)]
(assert (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))))
; [eval] sets_e((s setminus Set(|s|)))
; [eval] (s setminus Set(|s|))
; [eval] Set(|s|)
; [eval] |s|
(push) ; 4
(assert (sets_e%precondition $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00)))))
(pop) ; 4
; Joined path conditions
(assert (sets_e%precondition $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00)))
  (and
    (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00)))
    (sets_e%precondition $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00)))))))
(assert (or
  (not (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00)))
  (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))))
(assert (=
  result@7@00
  (ite
    (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))
    1
    (sets_e $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@6@00 Set<Int>)) (!
  (=>
    (sets_e%precondition s@$ s@6@00)
    (=
      (sets_e s@$ s@6@00)
      (ite
        (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))
        1
        (sets_e%limited $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00)))))))
  :pattern ((sets_e s@$ s@6@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (s@6@00 Set<Int>)) (!
  (=>
    (sets_e%precondition s@$ s@6@00)
    (ite
      (and (> (Set_card s@6@00) 0) (Set_in (Set_card s@6@00) s@6@00))
      true
      (sets_e%precondition $Snap.unit (Set_difference s@6@00 (Set_singleton (Set_card s@6@00))))))
  :pattern ((sets_e s@$ s@6@00))
  :qid |quant-u-45|)))
; ---------- FUNCTION predicates----------
(declare-fun xs@8@00 () $Ref)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref)) (!
  (= (predicates%limited s@$ xs@8@00) (predicates s@$ xs@8@00))
  :pattern ((predicates s@$ xs@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref)) (!
  (predicates%stateless xs@8@00)
  :pattern ((predicates%limited s@$ xs@8@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(list(xs), write) in (xs.next != null ? predicates(xs.next) : 0))
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger s@$ xs@8@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= xs@8@00 $Ref.null)))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(s@$) != Null | live]
; [else-branch: 5 | First:(s@$) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:(s@$) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
; [eval] (xs.next != null ? predicates(xs.next) : 0)
; [eval] xs.next != null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(s@$) != Null | live]
; [else-branch: 6 | First:(s@$) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | First:(s@$) != Null]
; [eval] predicates(xs.next)
(push) ; 6
(assert (predicates%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 6
; Joined path conditions
(assert (predicates%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (predicates%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | First:(s@$) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] (xs.next != null ? predicates(xs.next) : 0)
; [eval] xs.next != null
(push) ; 4
; [then-branch: 7 | First:(s@$) != Null | dead]
; [else-branch: 7 | First:(s@$) == Null | live]
(push) ; 5
; [else-branch: 7 | First:(s@$) == Null]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@37@00 ($Snap $Ref) Int)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (=
    (joined_unfolding@37@00 s@$ xs@8@00)
    (predicates ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (= (joined_unfolding@37@00 s@$ xs@8@00) 0)))
; Joined path conditions
(assert (and
  (list%trigger s@$ xs@8@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@8@00 $Ref.null))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
    (=>
      (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
      (predicates%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))))
; Joined path conditions
(assert (and
  (list%trigger s@$ xs@8@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@8@00 $Ref.null))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
    (= ($Snap.second s@$) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(assert (= result@9@00 (joined_unfolding@37@00 s@$ xs@8@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref)) (!
  (=>
    (predicates%precondition s@$ xs@8@00)
    (=
      (predicates s@$ xs@8@00)
      (ite
        (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
        (predicates%limited ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        0)))
  :pattern ((predicates s@$ xs@8@00))
  :pattern ((predicates%stateless xs@8@00) (list%trigger s@$ xs@8@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref)) (!
  (=>
    (predicates%precondition s@$ xs@8@00)
    (ite
      (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
      (predicates%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      true))
  :pattern ((predicates s@$ xs@8@00))
  :qid |quant-u-47|)))
; ---------- FUNCTION fact_e----------
(declare-fun x@10@00 () Int)
(declare-fun result@11@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x >= 0
(assert (>= x@10@00 0))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (= (fact_e%limited s@$ x@10@00) (fact_e s@$ x@10@00))
  :pattern ((fact_e s@$ x@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (fact_e%stateless x@10@00)
  :pattern ((fact_e%limited s@$ x@10@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= x@10@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x == 0 ? 1 : x * fact_e(x))
; [eval] x == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@10@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@10@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | x@10@00 == 0 | live]
; [else-branch: 8 | x@10@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | x@10@00 == 0]
(assert (= x@10@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 8 | x@10@00 != 0]
(assert (not (= x@10@00 0)))
; [eval] x * fact_e(x)
; [eval] fact_e(x)
(push) ; 4
; [eval] x >= 0
(assert (fact_e%precondition $Snap.unit x@10@00))
(pop) ; 4
; Joined path conditions
(assert (fact_e%precondition $Snap.unit x@10@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= x@10@00 0))
  (and (not (= x@10@00 0)) (fact_e%precondition $Snap.unit x@10@00))))
(assert (or (not (= x@10@00 0)) (= x@10@00 0)))
(assert (= result@11@00 (ite (= x@10@00 0) 1 (* x@10@00 (fact_e $Snap.unit x@10@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (=>
    (fact_e%precondition s@$ x@10@00)
    (=
      (fact_e s@$ x@10@00)
      (ite (= x@10@00 0) 1 (* x@10@00 (fact_e%limited $Snap.unit x@10@00)))))
  :pattern ((fact_e s@$ x@10@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (=>
    (fact_e%precondition s@$ x@10@00)
    (ite (= x@10@00 0) true (fact_e%precondition $Snap.unit x@10@00)))
  :pattern ((fact_e s@$ x@10@00))
  :qid |quant-u-49|)))
; ---------- FUNCTION PI_list----------
(declare-fun xs@12@00 () $Ref)
(declare-fun result@13@00 () PredicateInstance)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@38@00 $Perm)
(assert ($Perm.isReadVar $k@38@00))
(assert (<= $Perm.No $k@38@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@12@00 $Ref)) (!
  (= (PI_list%limited s@$ xs@12@00) (PI_list s@$ xs@12@00))
  :pattern ((PI_list s@$ xs@12@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@12@00 $Ref)) (!
  (PI_list%stateless xs@12@00)
  :pattern ((PI_list%limited s@$ xs@12@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION multiSets----------
(declare-fun s@14@00 () Multiset<Int>)
(declare-fun result@15@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@14@00 Multiset<Int>)) (!
  (= (multiSets%limited s@$ s@14@00) (multiSets s@$ s@14@00))
  :pattern ((multiSets s@$ s@14@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (s@14@00 Multiset<Int>)) (!
  (multiSets%stateless s@14@00)
  :pattern ((multiSets%limited s@$ s@14@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|s| > 0 && ((|s| in s)) > 0 ? multiSets((s setminus Multiset(|s|))) : 1)
; [eval] |s| > 0 && ((|s| in s)) > 0
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 2
; [then-branch: 9 | !(|s@14@00| > 0) | live]
; [else-branch: 9 | |s@14@00| > 0 | live]
(push) ; 3
; [then-branch: 9 | !(|s@14@00| > 0)]
(assert (not (> (Multiset_card s@14@00) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | |s@14@00| > 0]
(assert (> (Multiset_card s@14@00) 0))
; [eval] ((|s| in s)) > 0
; [eval] (|s| in s)
; [eval] |s|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (> (Multiset_card s@14@00) 0) (not (> (Multiset_card s@14@00) 0))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (> (Multiset_card s@14@00) 0)
    (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (> (Multiset_card s@14@00) 0)
  (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | |s@14@00| > 0 && s@14@00(|s@14@00|) > 0 | live]
; [else-branch: 10 | !(|s@14@00| > 0 && s@14@00(|s@14@00|) > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | |s@14@00| > 0 && s@14@00(|s@14@00|) > 0]
(assert (and
  (> (Multiset_card s@14@00) 0)
  (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0)))
; [eval] multiSets((s setminus Multiset(|s|)))
; [eval] (s setminus Multiset(|s|))
; [eval] Multiset(|s|)
; [eval] |s|
(push) ; 4
(assert (multiSets%precondition $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00)))))
(pop) ; 4
; Joined path conditions
(assert (multiSets%precondition $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00)))))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | !(|s@14@00| > 0 && s@14@00(|s@14@00|) > 0)]
(assert (not
  (and
    (> (Multiset_card s@14@00) 0)
    (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (and
    (> (Multiset_card s@14@00) 0)
    (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))
  (and
    (> (Multiset_card s@14@00) 0)
    (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0)
    (multiSets%precondition $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (> (Multiset_card s@14@00) 0)
      (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0)))
  (and
    (> (Multiset_card s@14@00) 0)
    (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))))
(assert (=
  result@15@00
  (ite
    (and
      (> (Multiset_card s@14@00) 0)
      (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))
    (multiSets $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00))))
    1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@14@00 Multiset<Int>)) (!
  (=>
    (multiSets%precondition s@$ s@14@00)
    (=
      (multiSets s@$ s@14@00)
      (ite
        (and
          (> (Multiset_card s@14@00) 0)
          (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))
        (multiSets%limited $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00))))
        1)))
  :pattern ((multiSets s@$ s@14@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (s@14@00 Multiset<Int>)) (!
  (=>
    (multiSets%precondition s@$ s@14@00)
    (ite
      (and
        (> (Multiset_card s@14@00) 0)
        (> (Multiset_count s@14@00 (Multiset_card s@14@00)) 0))
      (multiSets%precondition $Snap.unit (Multiset_difference s@14@00 (Multiset_singleton (Multiset_card s@14@00))))
      true))
  :pattern ((multiSets s@$ s@14@00))
  :qid |quant-u-51|)))
; ---------- FUNCTION references----------
(declare-fun r@16@00 () $Ref)
(declare-fun result@17@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@16@00 $Ref)) (!
  (= (references%limited s@$ r@16@00) (references s@$ r@16@00))
  :pattern ((references s@$ r@16@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (r@16@00 $Ref)) (!
  (references%stateless r@16@00)
  :pattern ((references%limited s@$ r@16@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (r == null ? 1 : references(null))
; [eval] r == null
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= r@16@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@16@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | r@16@00 == Null | live]
; [else-branch: 11 | r@16@00 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | r@16@00 == Null]
(assert (= r@16@00 $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | r@16@00 != Null]
(assert (not (= r@16@00 $Ref.null)))
; [eval] references(null)
(push) ; 4
(assert (references%precondition $Snap.unit $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (references%precondition $Snap.unit $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= r@16@00 $Ref.null))
  (and
    (not (= r@16@00 $Ref.null))
    (references%precondition $Snap.unit $Ref.null))))
(assert (or (not (= r@16@00 $Ref.null)) (= r@16@00 $Ref.null)))
(assert (= result@17@00 (ite (= r@16@00 $Ref.null) 1 (references $Snap.unit $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@16@00 $Ref)) (!
  (=>
    (references%precondition s@$ r@16@00)
    (=
      (references s@$ r@16@00)
      (ite (= r@16@00 $Ref.null) 1 (references%limited $Snap.unit $Ref.null))))
  :pattern ((references s@$ r@16@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (r@16@00 $Ref)) (!
  (=>
    (references%precondition s@$ r@16@00)
    (ite
      (= r@16@00 $Ref.null)
      true
      (references%precondition $Snap.unit $Ref.null)))
  :pattern ((references s@$ r@16@00))
  :qid |quant-u-53|)))
; ---------- FUNCTION booleans_e----------
(declare-fun b@18@00 () Bool)
(declare-fun result@19@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@39@00 $Snap)
(assert (= $t@39@00 $Snap.unit))
; [eval] result == 1
(assert (= result@19@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (= (booleans_e%limited s@$ b@18@00) (booleans_e s@$ b@18@00))
  :pattern ((booleans_e s@$ b@18@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (booleans_e%stateless b@18@00)
  :pattern ((booleans_e%limited s@$ b@18@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (let ((result@19@00 (booleans_e%limited s@$ b@18@00))) (=>
    (booleans_e%precondition s@$ b@18@00)
    (= result@19@00 1)))
  :pattern ((booleans_e%limited s@$ b@18@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (let ((result@19@00 (booleans_e%limited s@$ b@18@00))) true)
  :pattern ((booleans_e%limited s@$ b@18@00))
  :qid |quant-u-55|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (!b ? booleans_e(!b) : 1)
; [eval] !b
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not b@18@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@18@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | !(b@18@00) | live]
; [else-branch: 12 | b@18@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | !(b@18@00)]
(assert (not b@18@00))
; [eval] booleans_e(!b)
; [eval] !b
(push) ; 4
(assert (booleans_e%precondition $Snap.unit (not b@18@00)))
(pop) ; 4
; Joined path conditions
(assert (booleans_e%precondition $Snap.unit (not b@18@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 12 | b@18@00]
(assert b@18@00)
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not b@18@00)
  (and (not b@18@00) (booleans_e%precondition $Snap.unit (not b@18@00)))))
; Joined path conditions
(assert (or b@18@00 (not b@18@00)))
(assert (= result@19@00 (ite (not b@18@00) (booleans_e $Snap.unit (not b@18@00)) 1)))
; [eval] result == 1
(push) ; 2
(assert (not (= result@19@00 1)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@19@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (=>
    (booleans_e%precondition s@$ b@18@00)
    (=
      (booleans_e s@$ b@18@00)
      (ite (not b@18@00) (booleans_e%limited $Snap.unit (not b@18@00)) 1)))
  :pattern ((booleans_e s@$ b@18@00))
  :qid |quant-u-56|)))
(assert (forall ((s@$ $Snap) (b@18@00 Bool)) (!
  (=>
    (booleans_e%precondition s@$ b@18@00)
    (ite (not b@18@00) (booleans_e%precondition $Snap.unit (not b@18@00)) true))
  :pattern ((booleans_e s@$ b@18@00))
  :qid |quant-u-57|)))
; ---------- FUNCTION references_e----------
(declare-fun r@20@00 () $Ref)
(declare-fun result@21@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (= (references_e%limited s@$ r@20@00) (references_e s@$ r@20@00))
  :pattern ((references_e s@$ r@20@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (references_e%stateless r@20@00)
  :pattern ((references_e%limited s@$ r@20@00))
  :qid |quant-u-21|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (r == null ? 1 : references_e(r))
; [eval] r == null
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= r@20@00 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r@20@00 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | r@20@00 == Null | live]
; [else-branch: 13 | r@20@00 != Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | r@20@00 == Null]
(assert (= r@20@00 $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | r@20@00 != Null]
(assert (not (= r@20@00 $Ref.null)))
; [eval] references_e(r)
(push) ; 4
(assert (references_e%precondition $Snap.unit r@20@00))
(pop) ; 4
; Joined path conditions
(assert (references_e%precondition $Snap.unit r@20@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= r@20@00 $Ref.null))
  (and
    (not (= r@20@00 $Ref.null))
    (references_e%precondition $Snap.unit r@20@00))))
(assert (or (not (= r@20@00 $Ref.null)) (= r@20@00 $Ref.null)))
(assert (= result@21@00 (ite (= r@20@00 $Ref.null) 1 (references_e $Snap.unit r@20@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (references_e%precondition s@$ r@20@00)
    (=
      (references_e s@$ r@20@00)
      (ite (= r@20@00 $Ref.null) 1 (references_e%limited $Snap.unit r@20@00))))
  :pattern ((references_e s@$ r@20@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (r@20@00 $Ref)) (!
  (=>
    (references_e%precondition s@$ r@20@00)
    (ite
      (= r@20@00 $Ref.null)
      true
      (references_e%precondition $Snap.unit r@20@00)))
  :pattern ((references_e s@$ r@20@00))
  :qid |quant-u-59|)))
; ---------- FUNCTION predicates_e----------
(declare-fun xs@22@00 () $Ref)
(declare-fun result@23@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@22@00 $Ref)) (!
  (= (predicates_e%limited s@$ xs@22@00) (predicates_e s@$ xs@22@00))
  :pattern ((predicates_e s@$ xs@22@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (xs@22@00 $Ref)) (!
  (predicates_e%stateless xs@22@00)
  :pattern ((predicates_e%limited s@$ xs@22@00))
  :qid |quant-u-23|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] ((unfolding acc(list(xs), write) in xs.next != null) ? predicates_e(xs) : 0)
; [eval] (unfolding acc(list(xs), write) in xs.next != null)
(set-option :timeout 0)
(push) ; 2
(assert (list%trigger s@$ xs@22@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= xs@22@00 $Ref.null)))
; [eval] xs.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(s@$) != Null | live]
; [else-branch: 14 | First:(s@$) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | First:(s@$) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
; [eval] xs.next != null
(pop) ; 3
(push) ; 3
; [else-branch: 14 | First:(s@$) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] xs.next != null
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@40@00 ($Snap $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  (=
    (joined_unfolding@40@00 s@$ xs@22@00)
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (=
    (joined_unfolding@40@00 s@$ xs@22@00)
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))))
; Joined path conditions
(assert (and
  (list%trigger s@$ xs@22@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@22@00 $Ref.null))))
; Joined path conditions
(assert (and
  (list%trigger s@$ xs@22@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= xs@22@00 $Ref.null))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
    (= ($Snap.second s@$) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (joined_unfolding@40@00 s@$ xs@22@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (joined_unfolding@40@00 s@$ xs@22@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | joined_unfolding@40@00(s@$, xs@22@00) | live]
; [else-branch: 15 | !(joined_unfolding@40@00(s@$, xs@22@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | joined_unfolding@40@00(s@$, xs@22@00)]
(assert (joined_unfolding@40@00 s@$ xs@22@00))
; [eval] predicates_e(xs)
(push) ; 4
(assert (predicates_e%precondition s@$ xs@22@00))
(pop) ; 4
; Joined path conditions
(assert (predicates_e%precondition s@$ xs@22@00))
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(joined_unfolding@40@00(s@$, xs@22@00))]
(assert (not (joined_unfolding@40@00 s@$ xs@22@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (joined_unfolding@40@00 s@$ xs@22@00)
  (and
    (joined_unfolding@40@00 s@$ xs@22@00)
    (predicates_e%precondition s@$ xs@22@00))))
; Joined path conditions
(assert (or
  (not (joined_unfolding@40@00 s@$ xs@22@00))
  (joined_unfolding@40@00 s@$ xs@22@00)))
(assert (=
  result@23@00
  (ite (joined_unfolding@40@00 s@$ xs@22@00) (predicates_e s@$ xs@22@00) 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@22@00 $Ref)) (!
  (=>
    (predicates_e%precondition s@$ xs@22@00)
    (=
      (predicates_e s@$ xs@22@00)
      (ite
        (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
        (predicates_e%limited s@$ xs@22@00)
        0)))
  :pattern ((predicates_e s@$ xs@22@00))
  :qid |quant-u-60|)))
(assert (forall ((s@$ $Snap) (xs@22@00 $Ref)) (!
  (=>
    (predicates_e%precondition s@$ xs@22@00)
    (ite
      (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
      (predicates_e%precondition s@$ xs@22@00)
      true))
  :pattern ((predicates_e s@$ xs@22@00))
  :qid |quant-u-61|)))
; ---------- FUNCTION rationals----------
(declare-fun r@24@00 () $Perm)
(declare-fun result@25@00 () $Perm)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@24@00 $Perm)) (!
  (= (rationals%limited s@$ r@24@00) (rationals s@$ r@24@00))
  :pattern ((rationals s@$ r@24@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (r@24@00 $Perm)) (!
  (rationals%stateless r@24@00)
  :pattern ((rationals%limited s@$ r@24@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (r >= 0 / 1 ? rationals(r - 1 / 1) : r)
; [eval] r >= 0 / 1
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= r@24@00 $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= r@24@00 $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | r@24@00 >= Z | live]
; [else-branch: 16 | !(r@24@00 >= Z) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | r@24@00 >= Z]
(assert (>= r@24@00 $Perm.No))
; [eval] rationals(r - 1 / 1)
; [eval] r - 1 / 1
(push) ; 4
(assert (rationals%precondition $Snap.unit (- r@24@00 $Perm.Write)))
(pop) ; 4
; Joined path conditions
(assert (rationals%precondition $Snap.unit (- r@24@00 $Perm.Write)))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | !(r@24@00 >= Z)]
(assert (not (>= r@24@00 $Perm.No)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (>= r@24@00 $Perm.No)
  (and
    (>= r@24@00 $Perm.No)
    (rationals%precondition $Snap.unit (- r@24@00 $Perm.Write)))))
; Joined path conditions
(assert (or (not (>= r@24@00 $Perm.No)) (>= r@24@00 $Perm.No)))
(assert (=
  result@25@00
  (ite
    (>= r@24@00 $Perm.No)
    (rationals $Snap.unit (- r@24@00 $Perm.Write))
    r@24@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@24@00 $Perm)) (!
  (=>
    (rationals%precondition s@$ r@24@00)
    (=
      (rationals s@$ r@24@00)
      (ite
        (>= r@24@00 $Perm.No)
        (rationals%limited $Snap.unit (- r@24@00 $Perm.Write))
        r@24@00)))
  :pattern ((rationals s@$ r@24@00))
  :qid |quant-u-62|)))
(assert (forall ((s@$ $Snap) (r@24@00 $Perm)) (!
  (=>
    (rationals%precondition s@$ r@24@00)
    (ite
      (>= r@24@00 $Perm.No)
      (rationals%precondition $Snap.unit (- r@24@00 $Perm.Write))
      true))
  :pattern ((rationals s@$ r@24@00))
  :qid |quant-u-63|)))
; ---------- FUNCTION multiSets_e----------
(declare-fun s@26@00 () Multiset<Int>)
(declare-fun result@27@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@26@00 Multiset<Int>)) (!
  (= (multiSets_e%limited s@$ s@26@00) (multiSets_e s@$ s@26@00))
  :pattern ((multiSets_e s@$ s@26@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (s@26@00 Multiset<Int>)) (!
  (multiSets_e%stateless s@26@00)
  :pattern ((multiSets_e%limited s@$ s@26@00))
  :qid |quant-u-27|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|s| > 0 && ((|s| in s)) > 0 ? 1 : multiSets_e((s setminus Multiset(|s|))))
; [eval] |s| > 0 && ((|s| in s)) > 0
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 2
; [then-branch: 17 | !(|s@26@00| > 0) | live]
; [else-branch: 17 | |s@26@00| > 0 | live]
(push) ; 3
; [then-branch: 17 | !(|s@26@00| > 0)]
(assert (not (> (Multiset_card s@26@00) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 17 | |s@26@00| > 0]
(assert (> (Multiset_card s@26@00) 0))
; [eval] ((|s| in s)) > 0
; [eval] (|s| in s)
; [eval] |s|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (> (Multiset_card s@26@00) 0) (not (> (Multiset_card s@26@00) 0))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (> (Multiset_card s@26@00) 0)
    (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (> (Multiset_card s@26@00) 0)
  (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | |s@26@00| > 0 && s@26@00(|s@26@00|) > 0 | live]
; [else-branch: 18 | !(|s@26@00| > 0 && s@26@00(|s@26@00|) > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | |s@26@00| > 0 && s@26@00(|s@26@00|) > 0]
(assert (and
  (> (Multiset_card s@26@00) 0)
  (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 18 | !(|s@26@00| > 0 && s@26@00(|s@26@00|) > 0)]
(assert (not
  (and
    (> (Multiset_card s@26@00) 0)
    (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))))
; [eval] multiSets_e((s setminus Multiset(|s|)))
; [eval] (s setminus Multiset(|s|))
; [eval] Multiset(|s|)
; [eval] |s|
(push) ; 4
(assert (multiSets_e%precondition $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00)))))
(pop) ; 4
; Joined path conditions
(assert (multiSets_e%precondition $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (> (Multiset_card s@26@00) 0)
      (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0)))
  (and
    (not
      (and
        (> (Multiset_card s@26@00) 0)
        (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0)))
    (multiSets_e%precondition $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00)))))))
(assert (or
  (not
    (and
      (> (Multiset_card s@26@00) 0)
      (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0)))
  (and
    (> (Multiset_card s@26@00) 0)
    (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))))
(assert (=
  result@27@00
  (ite
    (and
      (> (Multiset_card s@26@00) 0)
      (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))
    1
    (multiSets_e $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@26@00 Multiset<Int>)) (!
  (=>
    (multiSets_e%precondition s@$ s@26@00)
    (=
      (multiSets_e s@$ s@26@00)
      (ite
        (and
          (> (Multiset_card s@26@00) 0)
          (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))
        1
        (multiSets_e%limited $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00)))))))
  :pattern ((multiSets_e s@$ s@26@00))
  :qid |quant-u-64|)))
(assert (forall ((s@$ $Snap) (s@26@00 Multiset<Int>)) (!
  (=>
    (multiSets_e%precondition s@$ s@26@00)
    (ite
      (and
        (> (Multiset_card s@26@00) 0)
        (> (Multiset_count s@26@00 (Multiset_card s@26@00)) 0))
      true
      (multiSets_e%precondition $Snap.unit (Multiset_difference s@26@00 (Multiset_singleton (Multiset_card s@26@00))))))
  :pattern ((multiSets_e s@$ s@26@00))
  :qid |quant-u-65|)))
; ---------- FUNCTION sets----------
(declare-fun s@28@00 () Set<Int>)
(declare-fun result@29@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@28@00 Set<Int>)) (!
  (= (sets%limited s@$ s@28@00) (sets s@$ s@28@00))
  :pattern ((sets s@$ s@28@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (s@28@00 Set<Int>)) (!
  (sets%stateless s@28@00)
  :pattern ((sets%limited s@$ s@28@00))
  :qid |quant-u-29|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|s| > 0 && (|s| in s) ? sets((s setminus Set(|s|))) : 1)
; [eval] |s| > 0 && (|s| in s)
; [eval] |s| > 0
; [eval] |s|
(set-option :timeout 0)
(push) ; 2
; [then-branch: 19 | !(|s@28@00| > 0) | live]
; [else-branch: 19 | |s@28@00| > 0 | live]
(push) ; 3
; [then-branch: 19 | !(|s@28@00| > 0)]
(assert (not (> (Set_card s@28@00) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 19 | |s@28@00| > 0]
(assert (> (Set_card s@28@00) 0))
; [eval] (|s| in s)
; [eval] |s|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (> (Set_card s@28@00) 0) (not (> (Set_card s@28@00) 0))))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | |s@28@00| > 0 && |s@28@00| in s@28@00 | live]
; [else-branch: 20 | !(|s@28@00| > 0 && |s@28@00| in s@28@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | |s@28@00| > 0 && |s@28@00| in s@28@00]
(assert (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00)))
; [eval] sets((s setminus Set(|s|)))
; [eval] (s setminus Set(|s|))
; [eval] Set(|s|)
; [eval] |s|
(push) ; 4
(assert (sets%precondition $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00)))))
(pop) ; 4
; Joined path conditions
(assert (sets%precondition $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00)))))
(pop) ; 3
(push) ; 3
; [else-branch: 20 | !(|s@28@00| > 0 && |s@28@00| in s@28@00)]
(assert (not (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))
  (and
    (> (Set_card s@28@00) 0)
    (Set_in (Set_card s@28@00) s@28@00)
    (sets%precondition $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00)))))))
; Joined path conditions
(assert (or
  (not (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00)))
  (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))))
(assert (=
  result@29@00
  (ite
    (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))
    (sets $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00))))
    1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@28@00 Set<Int>)) (!
  (=>
    (sets%precondition s@$ s@28@00)
    (=
      (sets s@$ s@28@00)
      (ite
        (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))
        (sets%limited $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00))))
        1)))
  :pattern ((sets s@$ s@28@00))
  :qid |quant-u-66|)))
(assert (forall ((s@$ $Snap) (s@28@00 Set<Int>)) (!
  (=>
    (sets%precondition s@$ s@28@00)
    (ite
      (and (> (Set_card s@28@00) 0) (Set_in (Set_card s@28@00) s@28@00))
      (sets%precondition $Snap.unit (Set_difference s@28@00 (Set_singleton (Set_card s@28@00))))
      true))
  :pattern ((sets s@$ s@28@00))
  :qid |quant-u-67|)))
; ---------- FUNCTION booleans----------
(declare-fun b@30@00 () Bool)
(declare-fun result@31@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@41@00 $Snap)
(assert (= $t@41@00 $Snap.unit))
; [eval] result == 1
(assert (= result@31@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (= (booleans%limited s@$ b@30@00) (booleans s@$ b@30@00))
  :pattern ((booleans s@$ b@30@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (booleans%stateless b@30@00)
  :pattern ((booleans%limited s@$ b@30@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (let ((result@31@00 (booleans%limited s@$ b@30@00))) (=>
    (booleans%precondition s@$ b@30@00)
    (= result@31@00 1)))
  :pattern ((booleans%limited s@$ b@30@00))
  :qid |quant-u-68|)))
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (let ((result@31@00 (booleans%limited s@$ b@30@00))) true)
  :pattern ((booleans%limited s@$ b@30@00))
  :qid |quant-u-69|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (b ? booleans(!b) : 1)
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@30@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@30@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b@30@00 | live]
; [else-branch: 21 | !(b@30@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 21 | b@30@00]
(assert b@30@00)
; [eval] booleans(!b)
; [eval] !b
(push) ; 4
(assert (booleans%precondition $Snap.unit (not b@30@00)))
(pop) ; 4
; Joined path conditions
(assert (booleans%precondition $Snap.unit (not b@30@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 21 | !(b@30@00)]
(assert (not b@30@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=> b@30@00 (and b@30@00 (booleans%precondition $Snap.unit (not b@30@00)))))
; Joined path conditions
(assert (or (not b@30@00) b@30@00))
(assert (= result@31@00 (ite b@30@00 (booleans $Snap.unit (not b@30@00)) 1)))
; [eval] result == 1
(push) ; 2
(assert (not (= result@31@00 1)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@31@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (=>
    (booleans%precondition s@$ b@30@00)
    (=
      (booleans s@$ b@30@00)
      (ite b@30@00 (booleans%limited $Snap.unit (not b@30@00)) 1)))
  :pattern ((booleans s@$ b@30@00))
  :qid |quant-u-70|)))
(assert (forall ((s@$ $Snap) (b@30@00 Bool)) (!
  (=>
    (booleans%precondition s@$ b@30@00)
    (ite b@30@00 (booleans%precondition $Snap.unit (not b@30@00)) true))
  :pattern ((booleans s@$ b@30@00))
  :qid |quant-u-71|)))
; ---------- FUNCTION numberOfUsers----------
(declare-fun seq@32@00 () Seq<Bool>)
(declare-fun result@33@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@32@00 Seq<Bool>)) (!
  (= (numberOfUsers%limited s@$ seq@32@00) (numberOfUsers s@$ seq@32@00))
  :pattern ((numberOfUsers s@$ seq@32@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (seq@32@00 Seq<Bool>)) (!
  (numberOfUsers%stateless seq@32@00)
  :pattern ((numberOfUsers%limited s@$ seq@32@00))
  :qid |quant-u-33|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|seq| == 0 ? 0 : (seq[0] ? 1 + numberOfUsers(seq[1..]) : numberOfUsers(seq[1..])))
; [eval] |seq| == 0
; [eval] |seq|
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length seq@32@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length seq@32@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | |seq@32@00| == 0 | live]
; [else-branch: 22 | |seq@32@00| != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 22 | |seq@32@00| == 0]
(assert (= (Seq_length seq@32@00) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 22 | |seq@32@00| != 0]
(assert (not (= (Seq_length seq@32@00) 0)))
; [eval] (seq[0] ? 1 + numberOfUsers(seq[1..]) : numberOfUsers(seq[1..]))
; [eval] seq[0]
(push) ; 4
(assert (not (< 0 (Seq_length seq@32@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (Seq_index seq@32@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (Seq_index seq@32@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | seq@32@00[0] | live]
; [else-branch: 23 | !(seq@32@00[0]) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | seq@32@00[0]]
(assert (Seq_index seq@32@00 0))
; [eval] 1 + numberOfUsers(seq[1..])
; [eval] numberOfUsers(seq[1..])
; [eval] seq[1..]
(push) ; 6
(assert (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))
(pop) ; 6
; Joined path conditions
(assert (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(seq@32@00[0])]
(assert (not (Seq_index seq@32@00 0)))
; [eval] numberOfUsers(seq[1..])
; [eval] seq[1..]
(push) ; 6
(assert (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))
(pop) ; 6
; Joined path conditions
(assert (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Seq_index seq@32@00 0)
  (and
    (Seq_index seq@32@00 0)
    (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))))
; Joined path conditions
(assert (=>
  (not (Seq_index seq@32@00 0))
  (and
    (not (Seq_index seq@32@00 0))
    (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1)))))
(assert (or (not (Seq_index seq@32@00 0)) (Seq_index seq@32@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Seq_length seq@32@00) 0))
  (and
    (not (= (Seq_length seq@32@00) 0))
    (=>
      (Seq_index seq@32@00 0)
      (and
        (Seq_index seq@32@00 0)
        (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1))))
    (=>
      (not (Seq_index seq@32@00 0))
      (and
        (not (Seq_index seq@32@00 0))
        (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1))))
    (or (not (Seq_index seq@32@00 0)) (Seq_index seq@32@00 0)))))
(assert (or (not (= (Seq_length seq@32@00) 0)) (= (Seq_length seq@32@00) 0)))
(assert (=
  result@33@00
  (ite
    (= (Seq_length seq@32@00) 0)
    0
    (ite
      (Seq_index seq@32@00 0)
      (+ 1 (numberOfUsers $Snap.unit (Seq_drop seq@32@00 1)))
      (numberOfUsers $Snap.unit (Seq_drop seq@32@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@32@00 Seq<Bool>)) (!
  (=>
    (numberOfUsers%precondition s@$ seq@32@00)
    (=
      (numberOfUsers s@$ seq@32@00)
      (ite
        (= (Seq_length seq@32@00) 0)
        0
        (ite
          (Seq_index seq@32@00 0)
          (+ 1 (numberOfUsers%limited $Snap.unit (Seq_drop seq@32@00 1)))
          (numberOfUsers%limited $Snap.unit (Seq_drop seq@32@00 1))))))
  :pattern ((numberOfUsers s@$ seq@32@00))
  :qid |quant-u-72|)))
(assert (forall ((s@$ $Snap) (seq@32@00 Seq<Bool>)) (!
  (=>
    (numberOfUsers%precondition s@$ seq@32@00)
    (ite
      (= (Seq_length seq@32@00) 0)
      true
      (numberOfUsers%precondition $Snap.unit (Seq_drop seq@32@00 1))))
  :pattern ((numberOfUsers s@$ seq@32@00))
  :qid |quant-u-73|)))
; ---------- FUNCTION sequences_e----------
(declare-fun seq@34@00 () Seq<Int>)
(declare-fun result@35@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@42@00 $Snap)
(assert (= $t@42@00 $Snap.unit))
; [eval] result == |seq|
; [eval] |seq|
(assert (= result@35@00 (Seq_length seq@34@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (= (sequences_e%limited s@$ seq@34@00) (sequences_e s@$ seq@34@00))
  :pattern ((sequences_e s@$ seq@34@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (sequences_e%stateless seq@34@00)
  :pattern ((sequences_e%limited s@$ seq@34@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (let ((result@35@00 (sequences_e%limited s@$ seq@34@00))) (=>
    (sequences_e%precondition s@$ seq@34@00)
    (= result@35@00 (Seq_length seq@34@00))))
  :pattern ((sequences_e%limited s@$ seq@34@00))
  :qid |quant-u-74|)))
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (let ((result@35@00 (sequences_e%limited s@$ seq@34@00))) true)
  :pattern ((sequences_e%limited s@$ seq@34@00))
  :qid |quant-u-75|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (|seq| != 0 ? sequences_e(seq[1..] ++ Seq(1)) : 0)
; [eval] |seq| != 0
; [eval] |seq|
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length seq@34@00) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length seq@34@00) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | |seq@34@00| != 0 | live]
; [else-branch: 24 | |seq@34@00| == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 24 | |seq@34@00| != 0]
(assert (not (= (Seq_length seq@34@00) 0)))
; [eval] sequences_e(seq[1..] ++ Seq(1))
; [eval] seq[1..] ++ Seq(1)
; [eval] seq[1..]
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
(push) ; 4
(assert (sequences_e%precondition $Snap.unit (Seq_append
  (Seq_drop seq@34@00 1)
  (Seq_singleton 1))))
(pop) ; 4
; Joined path conditions
(assert (sequences_e%precondition $Snap.unit (Seq_append
  (Seq_drop seq@34@00 1)
  (Seq_singleton 1))))
(pop) ; 3
(push) ; 3
; [else-branch: 24 | |seq@34@00| == 0]
(assert (= (Seq_length seq@34@00) 0))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= (Seq_length seq@34@00) 0))
  (and
    (not (= (Seq_length seq@34@00) 0))
    (= (Seq_length (Seq_singleton 1)) 1)
    (sequences_e%precondition $Snap.unit (Seq_append
      (Seq_drop seq@34@00 1)
      (Seq_singleton 1))))))
; Joined path conditions
(assert (or (= (Seq_length seq@34@00) 0) (not (= (Seq_length seq@34@00) 0))))
(assert (=
  result@35@00
  (ite
    (not (= (Seq_length seq@34@00) 0))
    (sequences_e $Snap.unit (Seq_append (Seq_drop seq@34@00 1) (Seq_singleton 1)))
    0)))
; [eval] result == |seq|
; [eval] |seq|
(push) ; 2
(assert (not (= result@35@00 (Seq_length seq@34@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@35@00 (Seq_length seq@34@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (=>
    (sequences_e%precondition s@$ seq@34@00)
    (=
      (sequences_e s@$ seq@34@00)
      (ite
        (not (= (Seq_length seq@34@00) 0))
        (sequences_e%limited $Snap.unit (Seq_append
          (Seq_drop seq@34@00 1)
          (Seq_singleton 1)))
        0)))
  :pattern ((sequences_e s@$ seq@34@00))
  :qid |quant-u-76|)))
(assert (forall ((s@$ $Snap) (seq@34@00 Seq<Int>)) (!
  (=>
    (sequences_e%precondition s@$ seq@34@00)
    (ite
      (not (= (Seq_length seq@34@00) 0))
      (sequences_e%precondition $Snap.unit (Seq_append
        (Seq_drop seq@34@00 1)
        (Seq_singleton 1)))
      true))
  :pattern ((sequences_e s@$ seq@34@00))
  :qid |quant-u-77|)))
; ---------- list ----------
(declare-const xs@43@00 $Ref)
(push) ; 1
(declare-const $t@44@00 $Snap)
(assert (= $t@44@00 ($Snap.combine ($Snap.first $t@44@00) ($Snap.second $t@44@00))))
(assert (not (= xs@43@00 $Ref.null)))
; [eval] xs.next != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@44@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@44@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:($t@44@00) != Null | live]
; [else-branch: 25 | First:($t@44@00) == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 25 | First:($t@44@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@44@00)) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 25 | First:($t@44@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@44@00)) $Ref.null))
(assert (= ($Snap.second $t@44@00) $Snap.unit))
(pop) ; 2
(pop) ; 1
