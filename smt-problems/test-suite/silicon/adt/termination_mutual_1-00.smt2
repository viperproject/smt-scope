(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/termination_mutual_1.vpr
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
(declare-sort Triple2WellFoundedOrder 0)
(declare-sort Triple1WellFoundedOrder 0)
(declare-sort WellFoundedOrder<List2> 0)
(declare-sort MList1WellFoundedOrder 0)
(declare-sort WellFoundedOrder<Triple1> 0)
(declare-sort WellFoundedOrder<MList2> 0)
(declare-sort MList1 0)
(declare-sort List2WellFoundedOrder 0)
(declare-sort WellFoundedOrder<Triple3> 0)
(declare-sort Triple2 0)
(declare-sort Triple3WellFoundedOrder 0)
(declare-sort List1 0)
(declare-sort Triple3 0)
(declare-sort WellFoundedOrder<Triple2> 0)
(declare-sort WellFoundedOrder<MList1> 0)
(declare-sort MList2 0)
(declare-sort Triple1 0)
(declare-sort MList2WellFoundedOrder 0)
(declare-sort List1WellFoundedOrder 0)
(declare-sort WellFoundedOrder<List1> 0)
(declare-sort List2 0)
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
(declare-fun $SortWrappers.Triple2WellFoundedOrderTo$Snap (Triple2WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToTriple2WellFoundedOrder ($Snap) Triple2WellFoundedOrder)
(assert (forall ((x Triple2WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToTriple2WellFoundedOrder($SortWrappers.Triple2WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.Triple2WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToTriple2WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple2WellFoundedOrderTo$Snap($SortWrappers.$SnapToTriple2WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToTriple2WellFoundedOrder x))
    :qid |$Snap.Triple2WellFoundedOrderTo$SnapToTriple2WellFoundedOrder|
    )))
(declare-fun $SortWrappers.Triple1WellFoundedOrderTo$Snap (Triple1WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToTriple1WellFoundedOrder ($Snap) Triple1WellFoundedOrder)
(assert (forall ((x Triple1WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToTriple1WellFoundedOrder($SortWrappers.Triple1WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.Triple1WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToTriple1WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple1WellFoundedOrderTo$Snap($SortWrappers.$SnapToTriple1WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToTriple1WellFoundedOrder x))
    :qid |$Snap.Triple1WellFoundedOrderTo$SnapToTriple1WellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<List2>To$Snap (WellFoundedOrder<List2>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<List2> ($Snap) WellFoundedOrder<List2>)
(assert (forall ((x WellFoundedOrder<List2>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<List2>($SortWrappers.WellFoundedOrder<List2>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<List2>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<List2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<List2>To$Snap($SortWrappers.$SnapToWellFoundedOrder<List2> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<List2> x))
    :qid |$Snap.WellFoundedOrder<List2>To$SnapToWellFoundedOrder<List2>|
    )))
(declare-fun $SortWrappers.MList1WellFoundedOrderTo$Snap (MList1WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToMList1WellFoundedOrder ($Snap) MList1WellFoundedOrder)
(assert (forall ((x MList1WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToMList1WellFoundedOrder($SortWrappers.MList1WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.MList1WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToMList1WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MList1WellFoundedOrderTo$Snap($SortWrappers.$SnapToMList1WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToMList1WellFoundedOrder x))
    :qid |$Snap.MList1WellFoundedOrderTo$SnapToMList1WellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Triple1>To$Snap (WellFoundedOrder<Triple1>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Triple1> ($Snap) WellFoundedOrder<Triple1>)
(assert (forall ((x WellFoundedOrder<Triple1>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Triple1>($SortWrappers.WellFoundedOrder<Triple1>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Triple1>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Triple1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Triple1>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Triple1> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Triple1> x))
    :qid |$Snap.WellFoundedOrder<Triple1>To$SnapToWellFoundedOrder<Triple1>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<MList2>To$Snap (WellFoundedOrder<MList2>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<MList2> ($Snap) WellFoundedOrder<MList2>)
(assert (forall ((x WellFoundedOrder<MList2>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<MList2>($SortWrappers.WellFoundedOrder<MList2>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<MList2>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<MList2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<MList2>To$Snap($SortWrappers.$SnapToWellFoundedOrder<MList2> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<MList2> x))
    :qid |$Snap.WellFoundedOrder<MList2>To$SnapToWellFoundedOrder<MList2>|
    )))
(declare-fun $SortWrappers.MList1To$Snap (MList1) $Snap)
(declare-fun $SortWrappers.$SnapToMList1 ($Snap) MList1)
(assert (forall ((x MList1)) (!
    (= x ($SortWrappers.$SnapToMList1($SortWrappers.MList1To$Snap x)))
    :pattern (($SortWrappers.MList1To$Snap x))
    :qid |$Snap.$SnapToMList1To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MList1To$Snap($SortWrappers.$SnapToMList1 x)))
    :pattern (($SortWrappers.$SnapToMList1 x))
    :qid |$Snap.MList1To$SnapToMList1|
    )))
(declare-fun $SortWrappers.List2WellFoundedOrderTo$Snap (List2WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToList2WellFoundedOrder ($Snap) List2WellFoundedOrder)
(assert (forall ((x List2WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToList2WellFoundedOrder($SortWrappers.List2WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.List2WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToList2WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List2WellFoundedOrderTo$Snap($SortWrappers.$SnapToList2WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToList2WellFoundedOrder x))
    :qid |$Snap.List2WellFoundedOrderTo$SnapToList2WellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Triple3>To$Snap (WellFoundedOrder<Triple3>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Triple3> ($Snap) WellFoundedOrder<Triple3>)
(assert (forall ((x WellFoundedOrder<Triple3>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Triple3>($SortWrappers.WellFoundedOrder<Triple3>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Triple3>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Triple3>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Triple3>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Triple3> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Triple3> x))
    :qid |$Snap.WellFoundedOrder<Triple3>To$SnapToWellFoundedOrder<Triple3>|
    )))
(declare-fun $SortWrappers.Triple2To$Snap (Triple2) $Snap)
(declare-fun $SortWrappers.$SnapToTriple2 ($Snap) Triple2)
(assert (forall ((x Triple2)) (!
    (= x ($SortWrappers.$SnapToTriple2($SortWrappers.Triple2To$Snap x)))
    :pattern (($SortWrappers.Triple2To$Snap x))
    :qid |$Snap.$SnapToTriple2To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple2To$Snap($SortWrappers.$SnapToTriple2 x)))
    :pattern (($SortWrappers.$SnapToTriple2 x))
    :qid |$Snap.Triple2To$SnapToTriple2|
    )))
(declare-fun $SortWrappers.Triple3WellFoundedOrderTo$Snap (Triple3WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToTriple3WellFoundedOrder ($Snap) Triple3WellFoundedOrder)
(assert (forall ((x Triple3WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToTriple3WellFoundedOrder($SortWrappers.Triple3WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.Triple3WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToTriple3WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple3WellFoundedOrderTo$Snap($SortWrappers.$SnapToTriple3WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToTriple3WellFoundedOrder x))
    :qid |$Snap.Triple3WellFoundedOrderTo$SnapToTriple3WellFoundedOrder|
    )))
(declare-fun $SortWrappers.List1To$Snap (List1) $Snap)
(declare-fun $SortWrappers.$SnapToList1 ($Snap) List1)
(assert (forall ((x List1)) (!
    (= x ($SortWrappers.$SnapToList1($SortWrappers.List1To$Snap x)))
    :pattern (($SortWrappers.List1To$Snap x))
    :qid |$Snap.$SnapToList1To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List1To$Snap($SortWrappers.$SnapToList1 x)))
    :pattern (($SortWrappers.$SnapToList1 x))
    :qid |$Snap.List1To$SnapToList1|
    )))
(declare-fun $SortWrappers.Triple3To$Snap (Triple3) $Snap)
(declare-fun $SortWrappers.$SnapToTriple3 ($Snap) Triple3)
(assert (forall ((x Triple3)) (!
    (= x ($SortWrappers.$SnapToTriple3($SortWrappers.Triple3To$Snap x)))
    :pattern (($SortWrappers.Triple3To$Snap x))
    :qid |$Snap.$SnapToTriple3To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple3To$Snap($SortWrappers.$SnapToTriple3 x)))
    :pattern (($SortWrappers.$SnapToTriple3 x))
    :qid |$Snap.Triple3To$SnapToTriple3|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Triple2>To$Snap (WellFoundedOrder<Triple2>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Triple2> ($Snap) WellFoundedOrder<Triple2>)
(assert (forall ((x WellFoundedOrder<Triple2>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Triple2>($SortWrappers.WellFoundedOrder<Triple2>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Triple2>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Triple2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Triple2>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Triple2> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Triple2> x))
    :qid |$Snap.WellFoundedOrder<Triple2>To$SnapToWellFoundedOrder<Triple2>|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<MList1>To$Snap (WellFoundedOrder<MList1>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<MList1> ($Snap) WellFoundedOrder<MList1>)
(assert (forall ((x WellFoundedOrder<MList1>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<MList1>($SortWrappers.WellFoundedOrder<MList1>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<MList1>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<MList1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<MList1>To$Snap($SortWrappers.$SnapToWellFoundedOrder<MList1> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<MList1> x))
    :qid |$Snap.WellFoundedOrder<MList1>To$SnapToWellFoundedOrder<MList1>|
    )))
(declare-fun $SortWrappers.MList2To$Snap (MList2) $Snap)
(declare-fun $SortWrappers.$SnapToMList2 ($Snap) MList2)
(assert (forall ((x MList2)) (!
    (= x ($SortWrappers.$SnapToMList2($SortWrappers.MList2To$Snap x)))
    :pattern (($SortWrappers.MList2To$Snap x))
    :qid |$Snap.$SnapToMList2To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MList2To$Snap($SortWrappers.$SnapToMList2 x)))
    :pattern (($SortWrappers.$SnapToMList2 x))
    :qid |$Snap.MList2To$SnapToMList2|
    )))
(declare-fun $SortWrappers.Triple1To$Snap (Triple1) $Snap)
(declare-fun $SortWrappers.$SnapToTriple1 ($Snap) Triple1)
(assert (forall ((x Triple1)) (!
    (= x ($SortWrappers.$SnapToTriple1($SortWrappers.Triple1To$Snap x)))
    :pattern (($SortWrappers.Triple1To$Snap x))
    :qid |$Snap.$SnapToTriple1To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Triple1To$Snap($SortWrappers.$SnapToTriple1 x)))
    :pattern (($SortWrappers.$SnapToTriple1 x))
    :qid |$Snap.Triple1To$SnapToTriple1|
    )))
(declare-fun $SortWrappers.MList2WellFoundedOrderTo$Snap (MList2WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToMList2WellFoundedOrder ($Snap) MList2WellFoundedOrder)
(assert (forall ((x MList2WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToMList2WellFoundedOrder($SortWrappers.MList2WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.MList2WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToMList2WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MList2WellFoundedOrderTo$Snap($SortWrappers.$SnapToMList2WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToMList2WellFoundedOrder x))
    :qid |$Snap.MList2WellFoundedOrderTo$SnapToMList2WellFoundedOrder|
    )))
(declare-fun $SortWrappers.List1WellFoundedOrderTo$Snap (List1WellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToList1WellFoundedOrder ($Snap) List1WellFoundedOrder)
(assert (forall ((x List1WellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToList1WellFoundedOrder($SortWrappers.List1WellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.List1WellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToList1WellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List1WellFoundedOrderTo$Snap($SortWrappers.$SnapToList1WellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToList1WellFoundedOrder x))
    :qid |$Snap.List1WellFoundedOrderTo$SnapToList1WellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<List1>To$Snap (WellFoundedOrder<List1>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<List1> ($Snap) WellFoundedOrder<List1>)
(assert (forall ((x WellFoundedOrder<List1>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<List1>($SortWrappers.WellFoundedOrder<List1>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<List1>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<List1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<List1>To$Snap($SortWrappers.$SnapToWellFoundedOrder<List1> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<List1> x))
    :qid |$Snap.WellFoundedOrder<List1>To$SnapToWellFoundedOrder<List1>|
    )))
(declare-fun $SortWrappers.List2To$Snap (List2) $Snap)
(declare-fun $SortWrappers.$SnapToList2 ($Snap) List2)
(assert (forall ((x List2)) (!
    (= x ($SortWrappers.$SnapToList2($SortWrappers.List2To$Snap x)))
    :pattern (($SortWrappers.List2To$Snap x))
    :qid |$Snap.$SnapToList2To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List2To$Snap($SortWrappers.$SnapToList2 x)))
    :pattern (($SortWrappers.$SnapToList2 x))
    :qid |$Snap.List2To$SnapToList2|
    )))
; ////////// Symbols
(declare-const MEmpty<MList2> MList2)
(declare-fun MNonEmpty<MList2> (Int MList1) MList2)
(declare-fun get_MList2_y<Int> (MList2) Int)
(declare-fun get_MList2_l<MList1> (MList2) MList1)
(declare-fun MList2_tag<Int> (MList2) Int)
(declare-fun triple2<Triple2> (Triple3) Triple2)
(declare-fun get_Triple2_x<Triple3> (Triple2) Triple3)
(declare-fun Triple2_tag<Int> (Triple2) Int)
(declare-fun decreasing<Bool> (Triple3 Triple3) Bool)
(declare-fun bounded<Bool> (Triple3) Bool)
(declare-fun decreasing<Bool> (MList1 MList1) Bool)
(declare-fun bounded<Bool> (MList1) Bool)
(declare-fun MRList1<MList1> (Int MList2) MList1)
(declare-fun get_MList1_x<Int> (MList1) Int)
(declare-fun get_MList1_y<MList2> (MList1) MList2)
(declare-fun MList1_tag<Int> (MList1) Int)
(declare-fun triple3<Triple3> (Triple1) Triple3)
(declare-fun nil<Triple3> (Int) Triple3)
(declare-fun get_Triple3_x<Triple1> (Triple3) Triple1)
(declare-fun get_Triple3_i<Int> (Triple3) Int)
(declare-fun Triple3_tag<Int> (Triple3) Int)
(declare-fun RList1<List1> (Int List2) List1)
(declare-fun get_List1_x<Int> (List1) Int)
(declare-fun get_List1_l<List2> (List1) List2)
(declare-fun List1_tag<Int> (List1) Int)
(declare-fun decreasing<Bool> (List2 List2) Bool)
(declare-fun bounded<Bool> (List2) Bool)
(declare-fun decreasing<Bool> (Triple1 Triple1) Bool)
(declare-fun bounded<Bool> (Triple1) Bool)
(declare-fun decreasing<Bool> (MList2 MList2) Bool)
(declare-fun bounded<Bool> (MList2) Bool)
(declare-fun triple1<Triple1> (Triple2) Triple1)
(declare-fun get_Triple1_x<Triple2> (Triple1) Triple2)
(declare-fun Triple1_tag<Int> (Triple1) Int)
(declare-fun decreasing<Bool> (List1 List1) Bool)
(declare-fun bounded<Bool> (List1) Bool)
(declare-const Empty<List2> List2)
(declare-fun NonEmpty<List2> (Int List1) List2)
(declare-fun get_List2_x<Int> (List2) Int)
(declare-fun get_List2_l<List1> (List2) List1)
(declare-fun List2_tag<Int> (List2) Int)
(declare-fun decreasing<Bool> (Triple2 Triple2) Bool)
(declare-fun bounded<Bool> (Triple2) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun tripleLen3Bad ($Snap Triple3) Int)
(declare-fun tripleLen3Bad%limited ($Snap Triple3) Int)
(declare-fun tripleLen3Bad%stateless (Triple3) Bool)
(declare-fun tripleLen3Bad%precondition ($Snap Triple3) Bool)
(declare-fun len1 ($Snap List1) Int)
(declare-fun len1%limited ($Snap List1) Int)
(declare-fun len1%stateless (List1) Bool)
(declare-fun len1%precondition ($Snap List1) Bool)
(declare-fun tripleLen1 ($Snap Triple1) Int)
(declare-fun tripleLen1%limited ($Snap Triple1) Int)
(declare-fun tripleLen1%stateless (Triple1) Bool)
(declare-fun tripleLen1%precondition ($Snap Triple1) Bool)
(declare-fun mlen2 ($Snap MList2) Int)
(declare-fun mlen2%limited ($Snap MList2) Int)
(declare-fun mlen2%stateless (MList2) Bool)
(declare-fun mlen2%precondition ($Snap MList2) Bool)
(declare-fun tripleLen1Bad ($Snap Triple1) Int)
(declare-fun tripleLen1Bad%limited ($Snap Triple1) Int)
(declare-fun tripleLen1Bad%stateless (Triple1) Bool)
(declare-fun tripleLen1Bad%precondition ($Snap Triple1) Bool)
(declare-fun len2 ($Snap List2) Int)
(declare-fun len2%limited ($Snap List2) Int)
(declare-fun len2%stateless (List2) Bool)
(declare-fun len2%precondition ($Snap List2) Bool)
(declare-fun tripleLen3 ($Snap Triple3) Int)
(declare-fun tripleLen3%limited ($Snap Triple3) Int)
(declare-fun tripleLen3%stateless (Triple3) Bool)
(declare-fun tripleLen3%precondition ($Snap Triple3) Bool)
(declare-fun len1Bad ($Snap List1) Int)
(declare-fun len1Bad%limited ($Snap List1) Int)
(declare-fun len1Bad%stateless (List1) Bool)
(declare-fun len1Bad%precondition ($Snap List1) Bool)
(declare-fun tripleLen2Bad ($Snap Triple2) Int)
(declare-fun tripleLen2Bad%limited ($Snap Triple2) Int)
(declare-fun tripleLen2Bad%stateless (Triple2) Bool)
(declare-fun tripleLen2Bad%precondition ($Snap Triple2) Bool)
(declare-fun tripleLen2 ($Snap Triple2) Int)
(declare-fun tripleLen2%limited ($Snap Triple2) Int)
(declare-fun tripleLen2%stateless (Triple2) Bool)
(declare-fun tripleLen2%precondition ($Snap Triple2) Bool)
(declare-fun len2Bad ($Snap List2) Int)
(declare-fun len2Bad%limited ($Snap List2) Int)
(declare-fun len2Bad%stateless (List2) Bool)
(declare-fun len2Bad%precondition ($Snap List2) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((y Int) (l MList1)) (!
  (= y (get_MList2_y<Int> (MNonEmpty<MList2> y l)))
  :pattern ((MNonEmpty<MList2> y l))
  )))
(assert (forall ((y Int) (l MList1)) (!
  (= l (get_MList2_l<MList1> (MNonEmpty<MList2> y l)))
  :pattern ((MNonEmpty<MList2> y l))
  )))
(assert (= (MList2_tag<Int> (as MEmpty<MList2>  MList2)) 0))
(assert (forall ((y Int) (l MList1)) (!
  (= (MList2_tag<Int> (MNonEmpty<MList2> y l)) 1)
  :pattern ((MNonEmpty<MList2> y l))
  )))
(assert (forall ((t MList2)) (!
  (or
    (= t (as MEmpty<MList2>  MList2))
    (= t (MNonEmpty<MList2> (get_MList2_y<Int> t) (get_MList2_l<MList1> t))))
  :pattern ((MList2_tag<Int> t))
  :pattern ((get_MList2_y<Int> t))
  :pattern ((get_MList2_l<MList1> t))
  )))
(assert (forall ((x Triple3)) (!
  (= x (get_Triple2_x<Triple3> (triple2<Triple2> x)))
  :pattern ((triple2<Triple2> x))
  )))
(assert (forall ((x Triple3)) (!
  (= (Triple2_tag<Int> (triple2<Triple2> x)) 0)
  :pattern ((triple2<Triple2> x))
  )))
(assert (forall ((t Triple2)) (!
  (= t (triple2<Triple2> (get_Triple2_x<Triple3> t)))
  :pattern ((Triple2_tag<Int> t))
  :pattern ((get_Triple2_x<Triple3> t))
  )))
(assert (forall ((x Int) (y MList2)) (!
  (= x (get_MList1_x<Int> (MRList1<MList1> x y)))
  :pattern ((MRList1<MList1> x y))
  )))
(assert (forall ((x Int) (y MList2)) (!
  (= y (get_MList1_y<MList2> (MRList1<MList1> x y)))
  :pattern ((MRList1<MList1> x y))
  )))
(assert (forall ((x Int) (y MList2)) (!
  (= (MList1_tag<Int> (MRList1<MList1> x y)) 0)
  :pattern ((MRList1<MList1> x y))
  )))
(assert (forall ((t MList1)) (!
  (= t (MRList1<MList1> (get_MList1_x<Int> t) (get_MList1_y<MList2> t)))
  :pattern ((MList1_tag<Int> t))
  :pattern ((get_MList1_x<Int> t))
  :pattern ((get_MList1_y<MList2> t))
  )))
(assert (forall ((x_2 Triple2)) (!
  (decreasing<Bool> x_2 (triple2<Triple2> (triple3<Triple3> (triple1<Triple1> x_2))))
  :pattern ((triple2<Triple2> (triple3<Triple3> (triple1<Triple1> x_2))))
  )))
(assert (forall ((v1 Triple2) (v2 Triple2) (v3 Triple2)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x Triple2)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((x Triple1)) (!
  (= x (get_Triple3_x<Triple1> (triple3<Triple3> x)))
  :pattern ((triple3<Triple3> x))
  )))
(assert (forall ((i Int)) (!
  (= i (get_Triple3_i<Int> (nil<Triple3> i)))
  :pattern ((nil<Triple3> i))
  )))
(assert (forall ((x Triple1)) (!
  (= (Triple3_tag<Int> (triple3<Triple3> x)) 1)
  :pattern ((triple3<Triple3> x))
  )))
(assert (forall ((i Int)) (!
  (= (Triple3_tag<Int> (nil<Triple3> i)) 0)
  :pattern ((nil<Triple3> i))
  )))
(assert (forall ((t Triple3)) (!
  (or
    (= t (triple3<Triple3> (get_Triple3_x<Triple1> t)))
    (= t (nil<Triple3> (get_Triple3_i<Int> t))))
  :pattern ((Triple3_tag<Int> t))
  :pattern ((get_Triple3_i<Int> t))
  )))
(assert true)
(assert (forall ((l_1 List2) (x_0 Int) (x Int)) (!
  (decreasing<Bool> l_1 (NonEmpty<List2> x (RList1<List1> x_0 l_1)))
  :pattern ((NonEmpty<List2> x (RList1<List1> x_0 l_1)))
  )))
(assert (forall ((v1 List2) (v2 List2) (v3 List2)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x List2)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((x Int) (l List2)) (!
  (= x (get_List1_x<Int> (RList1<List1> x l)))
  :pattern ((RList1<List1> x l))
  )))
(assert (forall ((x Int) (l List2)) (!
  (= l (get_List1_l<List2> (RList1<List1> x l)))
  :pattern ((RList1<List1> x l))
  )))
(assert (forall ((x Int) (l List2)) (!
  (= (List1_tag<Int> (RList1<List1> x l)) 0)
  :pattern ((RList1<List1> x l))
  )))
(assert (forall ((t List1)) (!
  (= t (RList1<List1> (get_List1_x<Int> t) (get_List1_l<List2> t)))
  :pattern ((List1_tag<Int> t))
  :pattern ((get_List1_x<Int> t))
  :pattern ((get_List1_l<List2> t))
  )))
(assert (forall ((l_1 MList1) (y_0 Int) (x Int)) (!
  (decreasing<Bool> l_1 (MRList1<MList1> x (MNonEmpty<MList2> y_0 l_1)))
  :pattern ((MRList1<MList1> x (MNonEmpty<MList2> y_0 l_1)))
  )))
(assert (forall ((v1 MList1) (v2 MList1) (v3 MList1)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x MList1)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((x Triple2)) (!
  (= x (get_Triple1_x<Triple2> (triple1<Triple1> x)))
  :pattern ((triple1<Triple1> x))
  )))
(assert (forall ((x Triple2)) (!
  (= (Triple1_tag<Int> (triple1<Triple1> x)) 0)
  :pattern ((triple1<Triple1> x))
  )))
(assert (forall ((t Triple1)) (!
  (= t (triple1<Triple1> (get_Triple1_x<Triple2> t)))
  :pattern ((Triple1_tag<Int> t))
  :pattern ((get_Triple1_x<Triple2> t))
  )))
(assert (forall ((x_2 Triple3)) (!
  (decreasing<Bool> x_2 (triple3<Triple3> (triple1<Triple1> (triple2<Triple2> x_2))))
  :pattern ((triple3<Triple3> (triple1<Triple1> (triple2<Triple2> x_2))))
  )))
(assert (forall ((v1 Triple3) (v2 Triple3) (v3 Triple3)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x Triple3)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((x_2 Triple1)) (!
  (decreasing<Bool> x_2 (triple1<Triple1> (triple2<Triple2> (triple3<Triple3> x_2))))
  :pattern ((triple1<Triple1> (triple2<Triple2> (triple3<Triple3> x_2))))
  )))
(assert (forall ((v1 Triple1) (v2 Triple1) (v3 Triple1)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x Triple1)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((l_1 List1) (x_0 Int) (x Int)) (!
  (decreasing<Bool> l_1 (RList1<List1> x (NonEmpty<List2> x_0 l_1)))
  :pattern ((RList1<List1> x (NonEmpty<List2> x_0 l_1)))
  )))
(assert (forall ((v1 List1) (v2 List1) (v3 List1)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x List1)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((y_1 MList2) (x_0 Int) (y Int)) (!
  (decreasing<Bool> y_1 (MNonEmpty<MList2> y (MRList1<MList1> x_0 y_1)))
  :pattern ((MNonEmpty<MList2> y (MRList1<MList1> x_0 y_1)))
  )))
(assert (forall ((v1 MList2) (v2 MList2) (v3 MList2)) (!
  (=>
    (and (decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
    (decreasing<Bool> v1 v3))
  :pattern ((decreasing<Bool> v1 v2) (decreasing<Bool> v2 v3))
  )))
(assert (forall ((x MList2)) (!
  (bounded<Bool> x)
  :pattern ((bounded<Bool> x))
  )))
(assert (forall ((x Int) (l List1)) (!
  (= x (get_List2_x<Int> (NonEmpty<List2> x l)))
  :pattern ((NonEmpty<List2> x l))
  )))
(assert (forall ((x Int) (l List1)) (!
  (= l (get_List2_l<List1> (NonEmpty<List2> x l)))
  :pattern ((NonEmpty<List2> x l))
  )))
(assert (= (List2_tag<Int> (as Empty<List2>  List2)) 0))
(assert (forall ((x Int) (l List1)) (!
  (= (List2_tag<Int> (NonEmpty<List2> x l)) 1)
  :pattern ((NonEmpty<List2> x l))
  )))
(assert (forall ((t List2)) (!
  (or
    (= t (as Empty<List2>  List2))
    (= t (NonEmpty<List2> (get_List2_x<Int> t) (get_List2_l<List1> t))))
  :pattern ((List2_tag<Int> t))
  :pattern ((get_List2_x<Int> t))
  :pattern ((get_List2_l<List1> t))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (t@0@00 Triple3)) (!
  (= (tripleLen3Bad%limited s@$ t@0@00) (tripleLen3Bad s@$ t@0@00))
  :pattern ((tripleLen3Bad s@$ t@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 Triple3)) (!
  (tripleLen3Bad%stateless t@0@00)
  :pattern ((tripleLen3Bad%limited s@$ t@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (t@0@00 Triple3)) (!
  (=>
    (tripleLen3Bad%precondition s@$ t@0@00)
    (=
      (tripleLen3Bad s@$ t@0@00)
      (ite
        (= (Triple3_tag<Int> t@0@00) 0)
        0
        (+ 3 (tripleLen3Bad%limited $Snap.unit t@0@00)))))
  :pattern ((tripleLen3Bad s@$ t@0@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (t@0@00 Triple3)) (!
  (=>
    (tripleLen3Bad%precondition s@$ t@0@00)
    (ite
      (= (Triple3_tag<Int> t@0@00) 0)
      true
      (tripleLen3Bad%precondition $Snap.unit t@0@00)))
  :pattern ((tripleLen3Bad s@$ t@0@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (l@2@00 List1)) (!
  (= (len1%limited s@$ l@2@00) (len1 s@$ l@2@00))
  :pattern ((len1 s@$ l@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (l@2@00 List1)) (!
  (len1%stateless l@2@00)
  :pattern ((len1%limited s@$ l@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (l@2@00 List1)) (!
  (=>
    (len1%precondition s@$ l@2@00)
    (=
      (len1 s@$ l@2@00)
      (ite
        (= (get_List1_l<List2> l@2@00) (as Empty<List2>  List2))
        0
        (+
          1
          (len1%limited $Snap.unit (get_List2_l<List1> (get_List1_l<List2> l@2@00)))))))
  :pattern ((len1 s@$ l@2@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (l@2@00 List1)) (!
  (=>
    (len1%precondition s@$ l@2@00)
    (ite
      (= (get_List1_l<List2> l@2@00) (as Empty<List2>  List2))
      true
      (len1%precondition $Snap.unit (get_List2_l<List1> (get_List1_l<List2> l@2@00)))))
  :pattern ((len1 s@$ l@2@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (t@4@00 Triple1)) (!
  (= (tripleLen1%limited s@$ t@4@00) (tripleLen1 s@$ t@4@00))
  :pattern ((tripleLen1 s@$ t@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (t@4@00 Triple1)) (!
  (tripleLen1%stateless t@4@00)
  :pattern ((tripleLen1%limited s@$ t@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (t@4@00 Triple1)) (!
  (=>
    (tripleLen1%precondition s@$ t@4@00)
    (=
      (tripleLen1 s@$ t@4@00)
      (+
        2
        (ite
          (=
            (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@4@00)))
            0)
          0
          (tripleLen1%limited $Snap.unit (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@4@00))))))))
  :pattern ((tripleLen1 s@$ t@4@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (t@4@00 Triple1)) (!
  (=>
    (tripleLen1%precondition s@$ t@4@00)
    (ite
      (=
        (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@4@00)))
        0)
      true
      (tripleLen1%precondition $Snap.unit (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@4@00))))))
  :pattern ((tripleLen1 s@$ t@4@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (l@6@00 MList2)) (!
  (= (mlen2%limited s@$ l@6@00) (mlen2 s@$ l@6@00))
  :pattern ((mlen2 s@$ l@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (l@6@00 MList2)) (!
  (mlen2%stateless l@6@00)
  :pattern ((mlen2%limited s@$ l@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (l@6@00 MList2)) (!
  (=>
    (mlen2%precondition s@$ l@6@00)
    (=
      (mlen2 s@$ l@6@00)
      (ite
        (= l@6@00 (as MEmpty<MList2>  MList2))
        0
        (+
          1
          (mlen2%limited $Snap.unit (get_MList1_y<MList2> (get_MList2_l<MList1> l@6@00)))))))
  :pattern ((mlen2 s@$ l@6@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (l@6@00 MList2)) (!
  (=>
    (mlen2%precondition s@$ l@6@00)
    (ite
      (= l@6@00 (as MEmpty<MList2>  MList2))
      true
      (mlen2%precondition $Snap.unit (get_MList1_y<MList2> (get_MList2_l<MList1> l@6@00)))))
  :pattern ((mlen2 s@$ l@6@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (t@8@00 Triple1)) (!
  (= (tripleLen1Bad%limited s@$ t@8@00) (tripleLen1Bad s@$ t@8@00))
  :pattern ((tripleLen1Bad s@$ t@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (t@8@00 Triple1)) (!
  (tripleLen1Bad%stateless t@8@00)
  :pattern ((tripleLen1Bad%limited s@$ t@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (t@8@00 Triple1)) (!
  (=>
    (tripleLen1Bad%precondition s@$ t@8@00)
    (=
      (tripleLen1Bad s@$ t@8@00)
      (+
        2
        (ite
          (=
            (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@8@00)))
            0)
          0
          (tripleLen1Bad%limited $Snap.unit t@8@00)))))
  :pattern ((tripleLen1Bad s@$ t@8@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (t@8@00 Triple1)) (!
  (=>
    (tripleLen1Bad%precondition s@$ t@8@00)
    (ite
      (=
        (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@8@00)))
        0)
      true
      (tripleLen1Bad%precondition $Snap.unit t@8@00)))
  :pattern ((tripleLen1Bad s@$ t@8@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (l@10@00 List2)) (!
  (= (len2%limited s@$ l@10@00) (len2 s@$ l@10@00))
  :pattern ((len2 s@$ l@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (l@10@00 List2)) (!
  (len2%stateless l@10@00)
  :pattern ((len2%limited s@$ l@10@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (l@10@00 List2)) (!
  (=>
    (len2%precondition s@$ l@10@00)
    (=
      (len2 s@$ l@10@00)
      (ite
        (= l@10@00 (as Empty<List2>  List2))
        0
        (+
          1
          (len2%limited $Snap.unit (get_List1_l<List2> (get_List2_l<List1> l@10@00)))))))
  :pattern ((len2 s@$ l@10@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (l@10@00 List2)) (!
  (=>
    (len2%precondition s@$ l@10@00)
    (ite
      (= l@10@00 (as Empty<List2>  List2))
      true
      (len2%precondition $Snap.unit (get_List1_l<List2> (get_List2_l<List1> l@10@00)))))
  :pattern ((len2 s@$ l@10@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (t@12@00 Triple3)) (!
  (= (tripleLen3%limited s@$ t@12@00) (tripleLen3 s@$ t@12@00))
  :pattern ((tripleLen3 s@$ t@12@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (t@12@00 Triple3)) (!
  (tripleLen3%stateless t@12@00)
  :pattern ((tripleLen3%limited s@$ t@12@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (t@12@00 Triple3)) (!
  (=>
    (tripleLen3%precondition s@$ t@12@00)
    (=
      (tripleLen3 s@$ t@12@00)
      (ite
        (= (Triple3_tag<Int> t@12@00) 0)
        0
        (+
          3
          (tripleLen3%limited $Snap.unit (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> t@12@00))))))))
  :pattern ((tripleLen3 s@$ t@12@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (t@12@00 Triple3)) (!
  (=>
    (tripleLen3%precondition s@$ t@12@00)
    (ite
      (= (Triple3_tag<Int> t@12@00) 0)
      true
      (tripleLen3%precondition $Snap.unit (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> t@12@00))))))
  :pattern ((tripleLen3 s@$ t@12@00))
  :qid |quant-u-35|)))
(assert (forall ((s@$ $Snap) (l@14@00 List1)) (!
  (= (len1Bad%limited s@$ l@14@00) (len1Bad s@$ l@14@00))
  :pattern ((len1Bad s@$ l@14@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (l@14@00 List1)) (!
  (len1Bad%stateless l@14@00)
  :pattern ((len1Bad%limited s@$ l@14@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (l@14@00 List1)) (!
  (=>
    (len1Bad%precondition s@$ l@14@00)
    (=
      (len1Bad s@$ l@14@00)
      (ite
        (= (get_List1_l<List2> l@14@00) (as Empty<List2>  List2))
        0
        (+ 1 (len1Bad%limited $Snap.unit l@14@00)))))
  :pattern ((len1Bad s@$ l@14@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (l@14@00 List1)) (!
  (=>
    (len1Bad%precondition s@$ l@14@00)
    (ite
      (= (get_List1_l<List2> l@14@00) (as Empty<List2>  List2))
      true
      (len1Bad%precondition $Snap.unit l@14@00)))
  :pattern ((len1Bad s@$ l@14@00))
  :qid |quant-u-37|)))
(assert (forall ((s@$ $Snap) (t@16@00 Triple2)) (!
  (= (tripleLen2Bad%limited s@$ t@16@00) (tripleLen2Bad s@$ t@16@00))
  :pattern ((tripleLen2Bad s@$ t@16@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (t@16@00 Triple2)) (!
  (tripleLen2Bad%stateless t@16@00)
  :pattern ((tripleLen2Bad%limited s@$ t@16@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (t@16@00 Triple2)) (!
  (=>
    (tripleLen2Bad%precondition s@$ t@16@00)
    (=
      (tripleLen2Bad s@$ t@16@00)
      (+
        1
        (ite
          (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@16@00)) 0)
          0
          (+ 1 (tripleLen2Bad%limited $Snap.unit t@16@00))))))
  :pattern ((tripleLen2Bad s@$ t@16@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (t@16@00 Triple2)) (!
  (=>
    (tripleLen2Bad%precondition s@$ t@16@00)
    (ite
      (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@16@00)) 0)
      true
      (tripleLen2Bad%precondition $Snap.unit t@16@00)))
  :pattern ((tripleLen2Bad s@$ t@16@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (t@18@00 Triple2)) (!
  (= (tripleLen2%limited s@$ t@18@00) (tripleLen2 s@$ t@18@00))
  :pattern ((tripleLen2 s@$ t@18@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (t@18@00 Triple2)) (!
  (tripleLen2%stateless t@18@00)
  :pattern ((tripleLen2%limited s@$ t@18@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (t@18@00 Triple2)) (!
  (=>
    (tripleLen2%precondition s@$ t@18@00)
    (=
      (tripleLen2 s@$ t@18@00)
      (+
        1
        (ite
          (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@18@00)) 0)
          0
          (+
            1
            (tripleLen2%limited $Snap.unit (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> t@18@00)))))))))
  :pattern ((tripleLen2 s@$ t@18@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (t@18@00 Triple2)) (!
  (=>
    (tripleLen2%precondition s@$ t@18@00)
    (ite
      (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@18@00)) 0)
      true
      (tripleLen2%precondition $Snap.unit (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> t@18@00))))))
  :pattern ((tripleLen2 s@$ t@18@00))
  :qid |quant-u-41|)))
(assert (forall ((s@$ $Snap) (l@20@00 List2)) (!
  (= (len2Bad%limited s@$ l@20@00) (len2Bad s@$ l@20@00))
  :pattern ((len2Bad s@$ l@20@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (l@20@00 List2)) (!
  (len2Bad%stateless l@20@00)
  :pattern ((len2Bad%limited s@$ l@20@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (l@20@00 List2)) (!
  (=>
    (len2Bad%precondition s@$ l@20@00)
    (=
      (len2Bad s@$ l@20@00)
      (ite
        (= l@20@00 (as Empty<List2>  List2))
        0
        (+ 1 (len2Bad%limited $Snap.unit l@20@00)))))
  :pattern ((len2Bad s@$ l@20@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (l@20@00 List2)) (!
  (=>
    (len2Bad%precondition s@$ l@20@00)
    (ite
      (= l@20@00 (as Empty<List2>  List2))
      true
      (len2Bad%precondition $Snap.unit l@20@00)))
  :pattern ((len2Bad s@$ l@20@00))
  :qid |quant-u-43|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- len2_termination_proof ----------
(declare-const l@0@01 List2)
(declare-const l@1@01 List2)
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
; [eval] !(l == Empty())
; [eval] l == Empty()
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (= l@1@01 (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= l@1@01 (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | l@1@01 != Empty[List2] | live]
; [else-branch: 0 | l@1@01 == Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | l@1@01 != Empty[List2]]
(assert (not (= l@1@01 (as Empty<List2>  List2))))
; [exec]
; assert (decreasing(get_List1_l(get_List2_l(l)), old(l)): Bool) &&
;   (bounded(old(l)): Bool)
; [eval] (decreasing(get_List1_l(get_List2_l(l)), old(l)): Bool)
; [eval] get_List1_l(get_List2_l(l))
; [eval] get_List2_l(l)
; [eval] old(l)
(push) ; 4
(assert (not (decreasing<Bool> (get_List1_l<List2> (get_List2_l<List1> l@1@01)) l@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_List1_l<List2> (get_List2_l<List1> l@1@01)) l@1@01))
; [eval] (bounded(old(l)): Bool)
; [eval] old(l)
(push) ; 4
(assert (not (bounded<Bool> l@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> l@1@01))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | l@1@01 == Empty[List2]]
(assert (= l@1@01 (as Empty<List2>  List2)))
(pop) ; 3
; [eval] l == Empty()
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= l@1@01 (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= l@1@01 (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | l@1@01 == Empty[List2] | live]
; [else-branch: 1 | l@1@01 != Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | l@1@01 == Empty[List2]]
(assert (= l@1@01 (as Empty<List2>  List2)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | l@1@01 != Empty[List2]]
(assert (not (= l@1@01 (as Empty<List2>  List2))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- len2Bad_termination_proof ----------
(declare-const l@2@01 List2)
(declare-const l@3@01 List2)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(l == Empty())
; [eval] l == Empty()
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (= l@3@01 (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= l@3@01 (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | l@3@01 != Empty[List2] | live]
; [else-branch: 2 | l@3@01 == Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | l@3@01 != Empty[List2]]
(assert (not (= l@3@01 (as Empty<List2>  List2))))
; [exec]
; assert (decreasing(l, old(l)): Bool) && (bounded(old(l)): Bool)
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
(push) ; 4
(assert (not (decreasing<Bool> l@3@01 l@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@3@01 l@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@3@01 l@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@3@01 l@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- len1_termination_proof ----------
(declare-const l@4@01 List1)
(declare-const l@5@01 List1)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(get_List1_l(l) == Empty())
; [eval] get_List1_l(l) == Empty()
; [eval] get_List1_l(l)
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | get_List1_l[List2](l@5@01) != Empty[List2] | live]
; [else-branch: 3 | get_List1_l[List2](l@5@01) == Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | get_List1_l[List2](l@5@01) != Empty[List2]]
(assert (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2))))
; [exec]
; assert (decreasing(get_List2_l(get_List1_l(l)), old(l)): Bool) &&
;   (bounded(old(l)): Bool)
; [eval] (decreasing(get_List2_l(get_List1_l(l)), old(l)): Bool)
; [eval] get_List2_l(get_List1_l(l))
; [eval] get_List1_l(l)
; [eval] old(l)
(push) ; 4
(assert (not (decreasing<Bool> (get_List2_l<List1> (get_List1_l<List2> l@5@01)) l@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_List2_l<List1> (get_List1_l<List2> l@5@01)) l@5@01))
; [eval] (bounded(old(l)): Bool)
; [eval] old(l)
(push) ; 4
(assert (not (bounded<Bool> l@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> l@5@01))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | get_List1_l[List2](l@5@01) == Empty[List2]]
(assert (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2)))
(pop) ; 3
; [eval] get_List1_l(l) == Empty()
; [eval] get_List1_l(l)
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | get_List1_l[List2](l@5@01) == Empty[List2] | live]
; [else-branch: 4 | get_List1_l[List2](l@5@01) != Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | get_List1_l[List2](l@5@01) == Empty[List2]]
(assert (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2)))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | get_List1_l[List2](l@5@01) != Empty[List2]]
(assert (not (= (get_List1_l<List2> l@5@01) (as Empty<List2>  List2))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- len1Bad_termination_proof ----------
(declare-const l@6@01 List1)
(declare-const l@7@01 List1)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(get_List1_l(l) == Empty())
; [eval] get_List1_l(l) == Empty()
; [eval] get_List1_l(l)
; [eval] Empty()
(push) ; 3
(set-option :timeout 10)
(assert (not (= (get_List1_l<List2> l@7@01) (as Empty<List2>  List2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (get_List1_l<List2> l@7@01) (as Empty<List2>  List2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | get_List1_l[List2](l@7@01) != Empty[List2] | live]
; [else-branch: 5 | get_List1_l[List2](l@7@01) == Empty[List2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | get_List1_l[List2](l@7@01) != Empty[List2]]
(assert (not (= (get_List1_l<List2> l@7@01) (as Empty<List2>  List2))))
; [exec]
; assert (decreasing(l, old(l)): Bool) && (bounded(old(l)): Bool)
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
(push) ; 4
(assert (not (decreasing<Bool> l@7@01 l@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@7@01 l@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@7@01 l@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(l, old(l)): Bool)
; [eval] old(l)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> l@7@01 l@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- mlen2_termination_proof ----------
(declare-const l@8@01 MList2)
(declare-const l@9@01 MList2)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(l == MEmpty())
; [eval] l == MEmpty()
; [eval] MEmpty()
(push) ; 3
(set-option :timeout 10)
(assert (not (= l@9@01 (as MEmpty<MList2>  MList2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= l@9@01 (as MEmpty<MList2>  MList2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | l@9@01 != MEmpty[MList2] | live]
; [else-branch: 6 | l@9@01 == MEmpty[MList2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | l@9@01 != MEmpty[MList2]]
(assert (not (= l@9@01 (as MEmpty<MList2>  MList2))))
; [exec]
; assert (decreasing(get_MList1_y(get_MList2_l(l)), old(l)): Bool) &&
;   (bounded(old(l)): Bool)
; [eval] (decreasing(get_MList1_y(get_MList2_l(l)), old(l)): Bool)
; [eval] get_MList1_y(get_MList2_l(l))
; [eval] get_MList2_l(l)
; [eval] old(l)
(push) ; 4
(assert (not (decreasing<Bool> (get_MList1_y<MList2> (get_MList2_l<MList1> l@9@01)) l@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_MList1_y<MList2> (get_MList2_l<MList1> l@9@01)) l@9@01))
; [eval] (bounded(old(l)): Bool)
; [eval] old(l)
(push) ; 4
(assert (not (bounded<Bool> l@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> l@9@01))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | l@9@01 == MEmpty[MList2]]
(assert (= l@9@01 (as MEmpty<MList2>  MList2)))
(pop) ; 3
; [eval] l == MEmpty()
; [eval] MEmpty()
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= l@9@01 (as MEmpty<MList2>  MList2)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= l@9@01 (as MEmpty<MList2>  MList2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | l@9@01 == MEmpty[MList2] | live]
; [else-branch: 7 | l@9@01 != MEmpty[MList2] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | l@9@01 == MEmpty[MList2]]
(assert (= l@9@01 (as MEmpty<MList2>  MList2)))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | l@9@01 != MEmpty[MList2]]
(assert (not (= l@9@01 (as MEmpty<MList2>  MList2))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen1_termination_proof ----------
(declare-const t@10@01 Triple1)
(declare-const t@11@01 Triple1)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(get_Triple2_x(get_Triple1_x(t))) == 0)
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t))) == 0
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t)))
; [eval] get_Triple2_x(get_Triple1_x(t))
; [eval] get_Triple1_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) != 0 | live]
; [else-branch: 8 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) != 0]
(assert (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
    0)))
; [exec]
; assert (decreasing(get_Triple3_x(get_Triple2_x(get_Triple1_x(t))), old(t)): Bool) &&
;   (bounded(old(t)): Bool)
; [eval] (decreasing(get_Triple3_x(get_Triple2_x(get_Triple1_x(t))), old(t)): Bool)
; [eval] get_Triple3_x(get_Triple2_x(get_Triple1_x(t)))
; [eval] get_Triple2_x(get_Triple1_x(t))
; [eval] get_Triple1_x(t)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01))) t@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01))) t@11@01))
; [eval] (bounded(old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (bounded<Bool> t@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> t@11@01))
(pop) ; 3
(push) ; 3
; [else-branch: 8 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) == 0]
(assert (=
  (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
  0))
(pop) ; 3
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t))) == 0
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t)))
; [eval] get_Triple2_x(get_Triple1_x(t))
; [eval] get_Triple1_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) == 0 | live]
; [else-branch: 9 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) == 0]
(assert (=
  (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
  0))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@11@01))) != 0]
(assert (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@11@01)))
    0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen2_termination_proof ----------
(declare-const t@12@01 Triple2)
(declare-const t@13@01 Triple2)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(get_Triple2_x(t)) == 0)
; [eval] Triple3_tag(get_Triple2_x(t)) == 0
; [eval] Triple3_tag(get_Triple2_x(t))
; [eval] get_Triple2_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) != 0 | live]
; [else-branch: 10 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) != 0]
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0)))
; [exec]
; assert (decreasing(get_Triple1_x(get_Triple3_x(get_Triple2_x(t))), old(t)): Bool) &&
;   (bounded(old(t)): Bool)
; [eval] (decreasing(get_Triple1_x(get_Triple3_x(get_Triple2_x(t))), old(t)): Bool)
; [eval] get_Triple1_x(get_Triple3_x(get_Triple2_x(t)))
; [eval] get_Triple3_x(get_Triple2_x(t))
; [eval] get_Triple2_x(t)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> t@13@01))) t@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> (get_Triple2_x<Triple3> t@13@01))) t@13@01))
; [eval] (bounded(old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (bounded<Bool> t@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> t@13@01))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) == 0]
(assert (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0))
(pop) ; 3
; [eval] Triple3_tag(get_Triple2_x(t)) == 0
; [eval] Triple3_tag(get_Triple2_x(t))
; [eval] get_Triple2_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) == 0 | live]
; [else-branch: 11 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) == 0]
(assert (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | Triple3_tag[Int](get_Triple2_x[Triple3](t@13@01)) != 0]
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@13@01)) 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen3_termination_proof ----------
(declare-const t@14@01 Triple3)
(declare-const t@15@01 Triple3)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(t) == 0)
; [eval] Triple3_tag(t) == 0
; [eval] Triple3_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> t@15@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> t@15@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | Triple3_tag[Int](t@15@01) != 0 | live]
; [else-branch: 12 | Triple3_tag[Int](t@15@01) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | Triple3_tag[Int](t@15@01) != 0]
(assert (not (= (Triple3_tag<Int> t@15@01) 0)))
; [exec]
; assert (decreasing(get_Triple2_x(get_Triple1_x(get_Triple3_x(t))), old(t)): Bool) &&
;   (bounded(old(t)): Bool)
; [eval] (decreasing(get_Triple2_x(get_Triple1_x(get_Triple3_x(t))), old(t)): Bool)
; [eval] get_Triple2_x(get_Triple1_x(get_Triple3_x(t)))
; [eval] get_Triple1_x(get_Triple3_x(t))
; [eval] get_Triple3_x(t)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> t@15@01))) t@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> (get_Triple3_x<Triple1> t@15@01))) t@15@01))
; [eval] (bounded(old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (bounded<Bool> t@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> t@15@01))
(pop) ; 3
(push) ; 3
; [else-branch: 12 | Triple3_tag[Int](t@15@01) == 0]
(assert (= (Triple3_tag<Int> t@15@01) 0))
(pop) ; 3
; [eval] Triple3_tag(t) == 0
; [eval] Triple3_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> t@15@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> t@15@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | Triple3_tag[Int](t@15@01) == 0 | live]
; [else-branch: 13 | Triple3_tag[Int](t@15@01) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | Triple3_tag[Int](t@15@01) == 0]
(assert (= (Triple3_tag<Int> t@15@01) 0))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | Triple3_tag[Int](t@15@01) != 0]
(assert (not (= (Triple3_tag<Int> t@15@01) 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen1Bad_termination_proof ----------
(declare-const t@16@01 Triple1)
(declare-const t@17@01 Triple1)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(get_Triple2_x(get_Triple1_x(t))) == 0)
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t))) == 0
; [eval] Triple3_tag(get_Triple2_x(get_Triple1_x(t)))
; [eval] get_Triple2_x(get_Triple1_x(t))
; [eval] get_Triple1_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@17@01)))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@17@01)))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@17@01))) != 0 | live]
; [else-branch: 14 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@17@01))) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | Triple3_tag[Int](get_Triple2_x[Triple3](get_Triple1_x[Triple2](t@17@01))) != 0]
(assert (not
  (=
    (Triple3_tag<Int> (get_Triple2_x<Triple3> (get_Triple1_x<Triple2> t@17@01)))
    0)))
; [exec]
; assert (decreasing(t, old(t)): Bool) && (bounded(old(t)): Bool)
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> t@17@01 t@17@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@17@01 t@17@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@17@01 t@17@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@17@01 t@17@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen2Bad_termination_proof ----------
(declare-const t@18@01 Triple2)
(declare-const t@19@01 Triple2)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(get_Triple2_x(t)) == 0)
; [eval] Triple3_tag(get_Triple2_x(t)) == 0
; [eval] Triple3_tag(get_Triple2_x(t))
; [eval] get_Triple2_x(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@19@01)) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@19@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | Triple3_tag[Int](get_Triple2_x[Triple3](t@19@01)) != 0 | live]
; [else-branch: 15 | Triple3_tag[Int](get_Triple2_x[Triple3](t@19@01)) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | Triple3_tag[Int](get_Triple2_x[Triple3](t@19@01)) != 0]
(assert (not (= (Triple3_tag<Int> (get_Triple2_x<Triple3> t@19@01)) 0)))
; [exec]
; assert (decreasing(t, old(t)): Bool) && (bounded(old(t)): Bool)
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> t@19@01 t@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@19@01 t@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@19@01 t@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@19@01 t@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- tripleLen3Bad_termination_proof ----------
(declare-const t@20@01 Triple3)
(declare-const t@21@01 Triple3)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(Triple3_tag(t) == 0)
; [eval] Triple3_tag(t) == 0
; [eval] Triple3_tag(t)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Triple3_tag<Int> t@21@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Triple3_tag<Int> t@21@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | Triple3_tag[Int](t@21@01) != 0 | live]
; [else-branch: 16 | Triple3_tag[Int](t@21@01) == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | Triple3_tag[Int](t@21@01) != 0]
(assert (not (= (Triple3_tag<Int> t@21@01) 0)))
; [exec]
; assert (decreasing(t, old(t)): Bool) && (bounded(old(t)): Bool)
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
(push) ; 4
(assert (not (decreasing<Bool> t@21@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@21@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@21@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(t, old(t)): Bool)
; [eval] old(t)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> t@21@01 t@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
