(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:39:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/declarations_6.vpr
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
(declare-sort ContainsDomain<Int~_SimpleList> 0)
(declare-sort SimpleList 0)
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
(declare-fun $SortWrappers.ContainsDomain<Int~_SimpleList>To$Snap (ContainsDomain<Int~_SimpleList>) $Snap)
(declare-fun $SortWrappers.$SnapToContainsDomain<Int~_SimpleList> ($Snap) ContainsDomain<Int~_SimpleList>)
(assert (forall ((x ContainsDomain<Int~_SimpleList>)) (!
    (= x ($SortWrappers.$SnapToContainsDomain<Int~_SimpleList>($SortWrappers.ContainsDomain<Int~_SimpleList>To$Snap x)))
    :pattern (($SortWrappers.ContainsDomain<Int~_SimpleList>To$Snap x))
    :qid |$Snap.$SnapToContainsDomain<Int~_SimpleList>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ContainsDomain<Int~_SimpleList>To$Snap($SortWrappers.$SnapToContainsDomain<Int~_SimpleList> x)))
    :pattern (($SortWrappers.$SnapToContainsDomain<Int~_SimpleList> x))
    :qid |$Snap.ContainsDomain<Int~_SimpleList>To$SnapToContainsDomain<Int~_SimpleList>|
    )))
(declare-fun $SortWrappers.SimpleListTo$Snap (SimpleList) $Snap)
(declare-fun $SortWrappers.$SnapToSimpleList ($Snap) SimpleList)
(assert (forall ((x SimpleList)) (!
    (= x ($SortWrappers.$SnapToSimpleList($SortWrappers.SimpleListTo$Snap x)))
    :pattern (($SortWrappers.SimpleListTo$Snap x))
    :qid |$Snap.$SnapToSimpleListTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.SimpleListTo$Snap($SortWrappers.$SnapToSimpleList x)))
    :pattern (($SortWrappers.$SnapToSimpleList x))
    :qid |$Snap.SimpleListTo$SnapToSimpleList|
    )))
; ////////// Symbols
(declare-fun contains<Bool> (Int SimpleList) Bool)
(declare-const SimpleNil<SimpleList> SimpleList)
(declare-fun SimpleCons<SimpleList> (Int SimpleList) SimpleList)
(declare-fun get_SimpleList_value<Int> (SimpleList) Int)
(declare-fun get_SimpleList_tail<SimpleList> (SimpleList) SimpleList)
(declare-fun SimpleList_tag<Int> (SimpleList) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((value Int) (tail SimpleList)) (!
  (= value (get_SimpleList_value<Int> (SimpleCons<SimpleList> value tail)))
  :pattern ((SimpleCons<SimpleList> value tail))
  )))
(assert (forall ((value Int) (tail SimpleList)) (!
  (= tail (get_SimpleList_tail<SimpleList> (SimpleCons<SimpleList> value tail)))
  :pattern ((SimpleCons<SimpleList> value tail))
  )))
(assert (= (SimpleList_tag<Int> (as SimpleNil<SimpleList>  SimpleList)) 1))
(assert (forall ((value Int) (tail SimpleList)) (!
  (= (SimpleList_tag<Int> (SimpleCons<SimpleList> value tail)) 0)
  :pattern ((SimpleCons<SimpleList> value tail))
  )))
(assert (forall ((t SimpleList)) (!
  (or
    (= t (as SimpleNil<SimpleList>  SimpleList))
    (=
      t
      (SimpleCons<SimpleList> (get_SimpleList_value<Int> t) (get_SimpleList_tail<SimpleList> t))))
  :pattern ((SimpleList_tag<Int> t))
  :pattern ((get_SimpleList_value<Int> t))
  :pattern ((get_SimpleList_tail<SimpleList> t))
  )))
(assert (forall ((value Int) (tail SimpleList)) (!
  (contains<Bool> value (SimpleCons<SimpleList> value tail))
  :pattern ((SimpleCons<SimpleList> value tail))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
