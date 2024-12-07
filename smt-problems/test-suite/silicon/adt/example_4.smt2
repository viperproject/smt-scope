(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/example_4.vpr
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
(declare-sort Seq<Seq<Seq<Int>>> 0)
(declare-sort Seq<Set<Seq<Int>>> 0)
(declare-sort Seq<Set<$Perm>> 0)
(declare-sort Seq<Set<Option<Seq<Int>>>> 0)
(declare-sort Seq<Option<Option<Int>>> 0)
(declare-sort Seq<Seq<Int>> 0)
(declare-sort Seq<Seq<Option<Int>>> 0)
(declare-sort Seq<Int> 0)
(declare-sort Seq<Seq<$Perm>> 0)
(declare-sort Seq<Option<Option<Seq<Int>>>> 0)
(declare-sort Seq<Option<Int>> 0)
(declare-sort Seq<Option<Seq<Int>>> 0)
(declare-sort Seq<Option<Perm>> 0)
(declare-sort Seq<Seq<Option<Seq<Int>>>> 0)
(declare-sort Seq<Set<Int>> 0)
(declare-sort Seq<$Perm> 0)
(declare-sort Seq<Set<Option<Int>>> 0)
(declare-sort Set<Set<Int>> 0)
(declare-sort Set<Option<Option<Int>>> 0)
(declare-sort Set<Seq<$Perm>> 0)
(declare-sort Set<Option<Int>> 0)
(declare-sort Set<Set<Option<Seq<Int>>>> 0)
(declare-sort Set<Seq<Int>> 0)
(declare-sort Set<Set<$Perm>> 0)
(declare-sort Set<Seq<Option<Int>>> 0)
(declare-sort Set<Option<Option<Seq<Int>>>> 0)
(declare-sort Set<$Perm> 0)
(declare-sort Set<Set<Option<Int>>> 0)
(declare-sort Set<Seq<Option<Seq<Int>>>> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Option<Seq<Int>>> 0)
(declare-sort Set<Seq<Seq<Int>>> 0)
(declare-sort Set<Set<Seq<Int>>> 0)
(declare-sort Set<Option<Perm>> 0)
(declare-sort AddDomain<Int> 0)
(declare-sort Option<Set<Option<Seq<Int>>>> 0)
(declare-sort Option<Seq<Option<Int>>> 0)
(declare-sort AddDomain<Option<Option<Int>>> 0)
(declare-sort Option<Option<Option<Seq<Int>>>> 0)
(declare-sort AddDomain<Set<Option<Int>>> 0)
(declare-sort AddDomain<Option<Int>> 0)
(declare-sort Option<Set<Seq<Int>>> 0)
(declare-sort AddDomain<Set<Int>> 0)
(declare-sort Option<Set<Perm>> 0)
(declare-sort Option<Seq<Seq<Int>>> 0)
(declare-sort Option<Int> 0)
(declare-sort AddDomain<Seq<Option<Int>>> 0)
(declare-sort Option<Option<Option<Int>>> 0)
(declare-sort AddDomain<Seq<Seq<Int>>> 0)
(declare-sort AddDomain<Option<Perm>> 0)
(declare-sort AddDomain<Set<Perm>> 0)
(declare-sort Option<Seq<Option<Seq<Int>>>> 0)
(declare-sort Option<Set<Option<Int>>> 0)
(declare-sort AddDomain<Option<Seq<Int>>> 0)
(declare-sort Option<Option<Seq<Int>>> 0)
(declare-sort AddDomain<Seq<Perm>> 0)
(declare-sort AddDomain<Set<Option<Seq<Int>>>> 0)
(declare-sort AddDomain<Perm> 0)
(declare-sort Option<Option<Int>> 0)
(declare-sort Option<Set<Int>> 0)
(declare-sort Option<Seq<Perm>> 0)
(declare-sort AddDomain<Seq<Option<Seq<Int>>>> 0)
(declare-sort AddDomain<Set<Seq<Int>>> 0)
(declare-sort AddDomain<Seq<Int>> 0)
(declare-sort AddDomain<Option<Option<Seq<Int>>>> 0)
(declare-sort Option<Option<Perm>> 0)
(declare-sort Option<Seq<Int>> 0)
(declare-sort Option<Perm> 0)
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
(declare-fun $SortWrappers.Seq<Seq<Seq<Int>>>To$Snap (Seq<Seq<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<Seq<Int>>> ($Snap) Seq<Seq<Seq<Int>>>)
(assert (forall ((x Seq<Seq<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<Seq<Int>>>($SortWrappers.Seq<Seq<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<Seq<Int>>>To$Snap($SortWrappers.$SnapToSeq<Seq<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<Seq<Int>>> x))
    :qid |$Snap.Seq<Seq<Seq<Int>>>To$SnapToSeq<Seq<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Seq<Set<Seq<Int>>>To$Snap (Seq<Set<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<Seq<Int>>> ($Snap) Seq<Set<Seq<Int>>>)
(assert (forall ((x Seq<Set<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<Seq<Int>>>($SortWrappers.Seq<Set<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<Seq<Int>>>To$Snap($SortWrappers.$SnapToSeq<Set<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<Seq<Int>>> x))
    :qid |$Snap.Seq<Set<Seq<Int>>>To$SnapToSeq<Set<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Seq<Set<$Perm>>To$Snap (Seq<Set<$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<$Perm>> ($Snap) Seq<Set<$Perm>>)
(assert (forall ((x Seq<Set<$Perm>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<$Perm>>($SortWrappers.Seq<Set<$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<$Perm>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<$Perm>>To$Snap($SortWrappers.$SnapToSeq<Set<$Perm>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<$Perm>> x))
    :qid |$Snap.Seq<Set<$Perm>>To$SnapToSeq<Set<$Perm>>|
    )))
(declare-fun $SortWrappers.Seq<Set<Option<Seq<Int>>>>To$Snap (Seq<Set<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<Option<Seq<Int>>>> ($Snap) Seq<Set<Option<Seq<Int>>>>)
(assert (forall ((x Seq<Set<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<Option<Seq<Int>>>>($SortWrappers.Seq<Set<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSeq<Set<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<Option<Seq<Int>>>> x))
    :qid |$Snap.Seq<Set<Option<Seq<Int>>>>To$SnapToSeq<Set<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Seq<Option<Option<Int>>>To$Snap (Seq<Option<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Option<Option<Int>>> ($Snap) Seq<Option<Option<Int>>>)
(assert (forall ((x Seq<Option<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Option<Option<Int>>>($SortWrappers.Seq<Option<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Option<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Option<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Option<Option<Int>>>To$Snap($SortWrappers.$SnapToSeq<Option<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Option<Option<Int>>> x))
    :qid |$Snap.Seq<Option<Option<Int>>>To$SnapToSeq<Option<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Seq<Seq<Int>>To$Snap (Seq<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<Int>> ($Snap) Seq<Seq<Int>>)
(assert (forall ((x Seq<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<Int>>($SortWrappers.Seq<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<Int>>To$Snap($SortWrappers.$SnapToSeq<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<Int>> x))
    :qid |$Snap.Seq<Seq<Int>>To$SnapToSeq<Seq<Int>>|
    )))
(declare-fun $SortWrappers.Seq<Seq<Option<Int>>>To$Snap (Seq<Seq<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<Option<Int>>> ($Snap) Seq<Seq<Option<Int>>>)
(assert (forall ((x Seq<Seq<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<Option<Int>>>($SortWrappers.Seq<Seq<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<Option<Int>>>To$Snap($SortWrappers.$SnapToSeq<Seq<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<Option<Int>>> x))
    :qid |$Snap.Seq<Seq<Option<Int>>>To$SnapToSeq<Seq<Option<Int>>>|
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
(declare-fun $SortWrappers.Seq<Seq<$Perm>>To$Snap (Seq<Seq<$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<$Perm>> ($Snap) Seq<Seq<$Perm>>)
(assert (forall ((x Seq<Seq<$Perm>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<$Perm>>($SortWrappers.Seq<Seq<$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<$Perm>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<$Perm>>To$Snap($SortWrappers.$SnapToSeq<Seq<$Perm>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<$Perm>> x))
    :qid |$Snap.Seq<Seq<$Perm>>To$SnapToSeq<Seq<$Perm>>|
    )))
(declare-fun $SortWrappers.Seq<Option<Option<Seq<Int>>>>To$Snap (Seq<Option<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Option<Option<Seq<Int>>>> ($Snap) Seq<Option<Option<Seq<Int>>>>)
(assert (forall ((x Seq<Option<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Option<Option<Seq<Int>>>>($SortWrappers.Seq<Option<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Option<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Option<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Option<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSeq<Option<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Option<Option<Seq<Int>>>> x))
    :qid |$Snap.Seq<Option<Option<Seq<Int>>>>To$SnapToSeq<Option<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Seq<Option<Int>>To$Snap (Seq<Option<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Option<Int>> ($Snap) Seq<Option<Int>>)
(assert (forall ((x Seq<Option<Int>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Option<Int>>($SortWrappers.Seq<Option<Int>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Option<Int>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Option<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Option<Int>>To$Snap($SortWrappers.$SnapToSeq<Option<Int>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Option<Int>> x))
    :qid |$Snap.Seq<Option<Int>>To$SnapToSeq<Option<Int>>|
    )))
(declare-fun $SortWrappers.Seq<Option<Seq<Int>>>To$Snap (Seq<Option<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Option<Seq<Int>>> ($Snap) Seq<Option<Seq<Int>>>)
(assert (forall ((x Seq<Option<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Option<Seq<Int>>>($SortWrappers.Seq<Option<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Option<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Option<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Option<Seq<Int>>>To$Snap($SortWrappers.$SnapToSeq<Option<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Option<Seq<Int>>> x))
    :qid |$Snap.Seq<Option<Seq<Int>>>To$SnapToSeq<Option<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Seq<Option<Perm>>To$Snap (Seq<Option<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Option<Perm>> ($Snap) Seq<Option<Perm>>)
(assert (forall ((x Seq<Option<Perm>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Option<Perm>>($SortWrappers.Seq<Option<Perm>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Option<Perm>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Option<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Option<Perm>>To$Snap($SortWrappers.$SnapToSeq<Option<Perm>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Option<Perm>> x))
    :qid |$Snap.Seq<Option<Perm>>To$SnapToSeq<Option<Perm>>|
    )))
(declare-fun $SortWrappers.Seq<Seq<Option<Seq<Int>>>>To$Snap (Seq<Seq<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<Option<Seq<Int>>>> ($Snap) Seq<Seq<Option<Seq<Int>>>>)
(assert (forall ((x Seq<Seq<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<Option<Seq<Int>>>>($SortWrappers.Seq<Seq<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSeq<Seq<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<Option<Seq<Int>>>> x))
    :qid |$Snap.Seq<Seq<Option<Seq<Int>>>>To$SnapToSeq<Seq<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Seq<Set<Int>>To$Snap (Seq<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<Int>> ($Snap) Seq<Set<Int>>)
(assert (forall ((x Seq<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<Int>>($SortWrappers.Seq<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<Int>>To$Snap($SortWrappers.$SnapToSeq<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<Int>> x))
    :qid |$Snap.Seq<Set<Int>>To$SnapToSeq<Set<Int>>|
    )))
(declare-fun $SortWrappers.Seq<$Perm>To$Snap (Seq<$Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Perm> ($Snap) Seq<$Perm>)
(assert (forall ((x Seq<$Perm>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Perm>($SortWrappers.Seq<$Perm>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Perm>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Perm>To$Snap($SortWrappers.$SnapToSeq<$Perm> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Perm> x))
    :qid |$Snap.Seq<$Perm>To$SnapToSeq<$Perm>|
    )))
(declare-fun $SortWrappers.Seq<Set<Option<Int>>>To$Snap (Seq<Set<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Set<Option<Int>>> ($Snap) Seq<Set<Option<Int>>>)
(assert (forall ((x Seq<Set<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Set<Option<Int>>>($SortWrappers.Seq<Set<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Set<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Set<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Set<Option<Int>>>To$Snap($SortWrappers.$SnapToSeq<Set<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Set<Option<Int>>> x))
    :qid |$Snap.Seq<Set<Option<Int>>>To$SnapToSeq<Set<Option<Int>>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Set<Int>>To$Snap (Set<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<Int>> ($Snap) Set<Set<Int>>)
(assert (forall ((x Set<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<Int>>($SortWrappers.Set<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<Int>>To$Snap($SortWrappers.$SnapToSet<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<Int>> x))
    :qid |$Snap.Set<Set<Int>>To$SnapToSet<Set<Int>>|
    )))
(declare-fun $SortWrappers.Set<Option<Option<Int>>>To$Snap (Set<Option<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Option<Int>>> ($Snap) Set<Option<Option<Int>>>)
(assert (forall ((x Set<Option<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Option<Int>>>($SortWrappers.Set<Option<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Option<Int>>>To$Snap($SortWrappers.$SnapToSet<Option<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Option<Int>>> x))
    :qid |$Snap.Set<Option<Option<Int>>>To$SnapToSet<Option<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Seq<$Perm>>To$Snap (Set<Seq<$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<$Perm>> ($Snap) Set<Seq<$Perm>>)
(assert (forall ((x Set<Seq<$Perm>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<$Perm>>($SortWrappers.Set<Seq<$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<$Perm>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<$Perm>>To$Snap($SortWrappers.$SnapToSet<Seq<$Perm>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<$Perm>> x))
    :qid |$Snap.Set<Seq<$Perm>>To$SnapToSet<Seq<$Perm>>|
    )))
(declare-fun $SortWrappers.Set<Option<Int>>To$Snap (Set<Option<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Int>> ($Snap) Set<Option<Int>>)
(assert (forall ((x Set<Option<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Int>>($SortWrappers.Set<Option<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Int>>To$Snap($SortWrappers.$SnapToSet<Option<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Int>> x))
    :qid |$Snap.Set<Option<Int>>To$SnapToSet<Option<Int>>|
    )))
(declare-fun $SortWrappers.Set<Set<Option<Seq<Int>>>>To$Snap (Set<Set<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<Option<Seq<Int>>>> ($Snap) Set<Set<Option<Seq<Int>>>>)
(assert (forall ((x Set<Set<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<Option<Seq<Int>>>>($SortWrappers.Set<Set<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSet<Set<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<Option<Seq<Int>>>> x))
    :qid |$Snap.Set<Set<Option<Seq<Int>>>>To$SnapToSet<Set<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Set<Seq<Int>>To$Snap (Set<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Int>> ($Snap) Set<Seq<Int>>)
(assert (forall ((x Set<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Int>>($SortWrappers.Set<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Int>>To$Snap($SortWrappers.$SnapToSet<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Int>> x))
    :qid |$Snap.Set<Seq<Int>>To$SnapToSet<Seq<Int>>|
    )))
(declare-fun $SortWrappers.Set<Set<$Perm>>To$Snap (Set<Set<$Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<$Perm>> ($Snap) Set<Set<$Perm>>)
(assert (forall ((x Set<Set<$Perm>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<$Perm>>($SortWrappers.Set<Set<$Perm>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<$Perm>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<$Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<$Perm>>To$Snap($SortWrappers.$SnapToSet<Set<$Perm>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<$Perm>> x))
    :qid |$Snap.Set<Set<$Perm>>To$SnapToSet<Set<$Perm>>|
    )))
(declare-fun $SortWrappers.Set<Seq<Option<Int>>>To$Snap (Set<Seq<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Option<Int>>> ($Snap) Set<Seq<Option<Int>>>)
(assert (forall ((x Set<Seq<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Option<Int>>>($SortWrappers.Set<Seq<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Option<Int>>>To$Snap($SortWrappers.$SnapToSet<Seq<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Option<Int>>> x))
    :qid |$Snap.Set<Seq<Option<Int>>>To$SnapToSet<Seq<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Option<Option<Seq<Int>>>>To$Snap (Set<Option<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Option<Seq<Int>>>> ($Snap) Set<Option<Option<Seq<Int>>>>)
(assert (forall ((x Set<Option<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Option<Seq<Int>>>>($SortWrappers.Set<Option<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSet<Option<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Option<Seq<Int>>>> x))
    :qid |$Snap.Set<Option<Option<Seq<Int>>>>To$SnapToSet<Option<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Set<$Perm>To$Snap (Set<$Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Perm> ($Snap) Set<$Perm>)
(assert (forall ((x Set<$Perm>)) (!
    (= x ($SortWrappers.$SnapToSet<$Perm>($SortWrappers.Set<$Perm>To$Snap x)))
    :pattern (($SortWrappers.Set<$Perm>To$Snap x))
    :qid |$Snap.$SnapToSet<$Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Perm>To$Snap($SortWrappers.$SnapToSet<$Perm> x)))
    :pattern (($SortWrappers.$SnapToSet<$Perm> x))
    :qid |$Snap.Set<$Perm>To$SnapToSet<$Perm>|
    )))
(declare-fun $SortWrappers.Set<Set<Option<Int>>>To$Snap (Set<Set<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<Option<Int>>> ($Snap) Set<Set<Option<Int>>>)
(assert (forall ((x Set<Set<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<Option<Int>>>($SortWrappers.Set<Set<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<Option<Int>>>To$Snap($SortWrappers.$SnapToSet<Set<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<Option<Int>>> x))
    :qid |$Snap.Set<Set<Option<Int>>>To$SnapToSet<Set<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Seq<Option<Seq<Int>>>>To$Snap (Set<Seq<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Option<Seq<Int>>>> ($Snap) Set<Seq<Option<Seq<Int>>>>)
(assert (forall ((x Set<Seq<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Option<Seq<Int>>>>($SortWrappers.Set<Seq<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToSet<Seq<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Option<Seq<Int>>>> x))
    :qid |$Snap.Set<Seq<Option<Seq<Int>>>>To$SnapToSet<Seq<Option<Seq<Int>>>>|
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
(declare-fun $SortWrappers.Set<Option<Seq<Int>>>To$Snap (Set<Option<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Seq<Int>>> ($Snap) Set<Option<Seq<Int>>>)
(assert (forall ((x Set<Option<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Seq<Int>>>($SortWrappers.Set<Option<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Seq<Int>>>To$Snap($SortWrappers.$SnapToSet<Option<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Seq<Int>>> x))
    :qid |$Snap.Set<Option<Seq<Int>>>To$SnapToSet<Option<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Seq<Seq<Int>>>To$Snap (Set<Seq<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Seq<Int>>> ($Snap) Set<Seq<Seq<Int>>>)
(assert (forall ((x Set<Seq<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Seq<Int>>>($SortWrappers.Set<Seq<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Seq<Int>>>To$Snap($SortWrappers.$SnapToSet<Seq<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Seq<Int>>> x))
    :qid |$Snap.Set<Seq<Seq<Int>>>To$SnapToSet<Seq<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Set<Seq<Int>>>To$Snap (Set<Set<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<Seq<Int>>> ($Snap) Set<Set<Seq<Int>>>)
(assert (forall ((x Set<Set<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<Seq<Int>>>($SortWrappers.Set<Set<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<Seq<Int>>>To$Snap($SortWrappers.$SnapToSet<Set<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<Seq<Int>>> x))
    :qid |$Snap.Set<Set<Seq<Int>>>To$SnapToSet<Set<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Set<Option<Perm>>To$Snap (Set<Option<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Option<Perm>> ($Snap) Set<Option<Perm>>)
(assert (forall ((x Set<Option<Perm>>)) (!
    (= x ($SortWrappers.$SnapToSet<Option<Perm>>($SortWrappers.Set<Option<Perm>>To$Snap x)))
    :pattern (($SortWrappers.Set<Option<Perm>>To$Snap x))
    :qid |$Snap.$SnapToSet<Option<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Option<Perm>>To$Snap($SortWrappers.$SnapToSet<Option<Perm>> x)))
    :pattern (($SortWrappers.$SnapToSet<Option<Perm>> x))
    :qid |$Snap.Set<Option<Perm>>To$SnapToSet<Option<Perm>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.AddDomain<Int>To$Snap (AddDomain<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Int> ($Snap) AddDomain<Int>)
(assert (forall ((x AddDomain<Int>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Int>($SortWrappers.AddDomain<Int>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Int>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Int>To$Snap($SortWrappers.$SnapToAddDomain<Int> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Int> x))
    :qid |$Snap.AddDomain<Int>To$SnapToAddDomain<Int>|
    )))
(declare-fun $SortWrappers.Option<Set<Option<Seq<Int>>>>To$Snap (Option<Set<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Set<Option<Seq<Int>>>> ($Snap) Option<Set<Option<Seq<Int>>>>)
(assert (forall ((x Option<Set<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Set<Option<Seq<Int>>>>($SortWrappers.Option<Set<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Set<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Set<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Set<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToOption<Set<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Set<Option<Seq<Int>>>> x))
    :qid |$Snap.Option<Set<Option<Seq<Int>>>>To$SnapToOption<Set<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Option<Seq<Option<Int>>>To$Snap (Option<Seq<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Seq<Option<Int>>> ($Snap) Option<Seq<Option<Int>>>)
(assert (forall ((x Option<Seq<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Seq<Option<Int>>>($SortWrappers.Option<Seq<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Seq<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Seq<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Seq<Option<Int>>>To$Snap($SortWrappers.$SnapToOption<Seq<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Seq<Option<Int>>> x))
    :qid |$Snap.Option<Seq<Option<Int>>>To$SnapToOption<Seq<Option<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Option<Option<Int>>>To$Snap (AddDomain<Option<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Option<Option<Int>>> ($Snap) AddDomain<Option<Option<Int>>>)
(assert (forall ((x AddDomain<Option<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Option<Option<Int>>>($SortWrappers.AddDomain<Option<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Option<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Option<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Option<Option<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Option<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Option<Option<Int>>> x))
    :qid |$Snap.AddDomain<Option<Option<Int>>>To$SnapToAddDomain<Option<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Option<Option<Option<Seq<Int>>>>To$Snap (Option<Option<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Option<Option<Seq<Int>>>> ($Snap) Option<Option<Option<Seq<Int>>>>)
(assert (forall ((x Option<Option<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Option<Option<Seq<Int>>>>($SortWrappers.Option<Option<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Option<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Option<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Option<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToOption<Option<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Option<Option<Seq<Int>>>> x))
    :qid |$Snap.Option<Option<Option<Seq<Int>>>>To$SnapToOption<Option<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Set<Option<Int>>>To$Snap (AddDomain<Set<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Set<Option<Int>>> ($Snap) AddDomain<Set<Option<Int>>>)
(assert (forall ((x AddDomain<Set<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Set<Option<Int>>>($SortWrappers.AddDomain<Set<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Set<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Set<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Set<Option<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Set<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Set<Option<Int>>> x))
    :qid |$Snap.AddDomain<Set<Option<Int>>>To$SnapToAddDomain<Set<Option<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Option<Int>>To$Snap (AddDomain<Option<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Option<Int>> ($Snap) AddDomain<Option<Int>>)
(assert (forall ((x AddDomain<Option<Int>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Option<Int>>($SortWrappers.AddDomain<Option<Int>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Option<Int>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Option<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Option<Int>>To$Snap($SortWrappers.$SnapToAddDomain<Option<Int>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Option<Int>> x))
    :qid |$Snap.AddDomain<Option<Int>>To$SnapToAddDomain<Option<Int>>|
    )))
(declare-fun $SortWrappers.Option<Set<Seq<Int>>>To$Snap (Option<Set<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Set<Seq<Int>>> ($Snap) Option<Set<Seq<Int>>>)
(assert (forall ((x Option<Set<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Set<Seq<Int>>>($SortWrappers.Option<Set<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Set<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Set<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Set<Seq<Int>>>To$Snap($SortWrappers.$SnapToOption<Set<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Set<Seq<Int>>> x))
    :qid |$Snap.Option<Set<Seq<Int>>>To$SnapToOption<Set<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Set<Int>>To$Snap (AddDomain<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Set<Int>> ($Snap) AddDomain<Set<Int>>)
(assert (forall ((x AddDomain<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Set<Int>>($SortWrappers.AddDomain<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Set<Int>>To$Snap($SortWrappers.$SnapToAddDomain<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Set<Int>> x))
    :qid |$Snap.AddDomain<Set<Int>>To$SnapToAddDomain<Set<Int>>|
    )))
(declare-fun $SortWrappers.Option<Set<Perm>>To$Snap (Option<Set<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Set<Perm>> ($Snap) Option<Set<Perm>>)
(assert (forall ((x Option<Set<Perm>>)) (!
    (= x ($SortWrappers.$SnapToOption<Set<Perm>>($SortWrappers.Option<Set<Perm>>To$Snap x)))
    :pattern (($SortWrappers.Option<Set<Perm>>To$Snap x))
    :qid |$Snap.$SnapToOption<Set<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Set<Perm>>To$Snap($SortWrappers.$SnapToOption<Set<Perm>> x)))
    :pattern (($SortWrappers.$SnapToOption<Set<Perm>> x))
    :qid |$Snap.Option<Set<Perm>>To$SnapToOption<Set<Perm>>|
    )))
(declare-fun $SortWrappers.Option<Seq<Seq<Int>>>To$Snap (Option<Seq<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Seq<Seq<Int>>> ($Snap) Option<Seq<Seq<Int>>>)
(assert (forall ((x Option<Seq<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Seq<Seq<Int>>>($SortWrappers.Option<Seq<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Seq<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Seq<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Seq<Seq<Int>>>To$Snap($SortWrappers.$SnapToOption<Seq<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Seq<Seq<Int>>> x))
    :qid |$Snap.Option<Seq<Seq<Int>>>To$SnapToOption<Seq<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Option<Int>To$Snap (Option<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Int> ($Snap) Option<Int>)
(assert (forall ((x Option<Int>)) (!
    (= x ($SortWrappers.$SnapToOption<Int>($SortWrappers.Option<Int>To$Snap x)))
    :pattern (($SortWrappers.Option<Int>To$Snap x))
    :qid |$Snap.$SnapToOption<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Int>To$Snap($SortWrappers.$SnapToOption<Int> x)))
    :pattern (($SortWrappers.$SnapToOption<Int> x))
    :qid |$Snap.Option<Int>To$SnapToOption<Int>|
    )))
(declare-fun $SortWrappers.AddDomain<Seq<Option<Int>>>To$Snap (AddDomain<Seq<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Seq<Option<Int>>> ($Snap) AddDomain<Seq<Option<Int>>>)
(assert (forall ((x AddDomain<Seq<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Seq<Option<Int>>>($SortWrappers.AddDomain<Seq<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Seq<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Seq<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Seq<Option<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Seq<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Seq<Option<Int>>> x))
    :qid |$Snap.AddDomain<Seq<Option<Int>>>To$SnapToAddDomain<Seq<Option<Int>>>|
    )))
(declare-fun $SortWrappers.Option<Option<Option<Int>>>To$Snap (Option<Option<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Option<Option<Int>>> ($Snap) Option<Option<Option<Int>>>)
(assert (forall ((x Option<Option<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Option<Option<Int>>>($SortWrappers.Option<Option<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Option<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Option<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Option<Option<Int>>>To$Snap($SortWrappers.$SnapToOption<Option<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Option<Option<Int>>> x))
    :qid |$Snap.Option<Option<Option<Int>>>To$SnapToOption<Option<Option<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Seq<Seq<Int>>>To$Snap (AddDomain<Seq<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Seq<Seq<Int>>> ($Snap) AddDomain<Seq<Seq<Int>>>)
(assert (forall ((x AddDomain<Seq<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Seq<Seq<Int>>>($SortWrappers.AddDomain<Seq<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Seq<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Seq<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Seq<Seq<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Seq<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Seq<Seq<Int>>> x))
    :qid |$Snap.AddDomain<Seq<Seq<Int>>>To$SnapToAddDomain<Seq<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Option<Perm>>To$Snap (AddDomain<Option<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Option<Perm>> ($Snap) AddDomain<Option<Perm>>)
(assert (forall ((x AddDomain<Option<Perm>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Option<Perm>>($SortWrappers.AddDomain<Option<Perm>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Option<Perm>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Option<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Option<Perm>>To$Snap($SortWrappers.$SnapToAddDomain<Option<Perm>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Option<Perm>> x))
    :qid |$Snap.AddDomain<Option<Perm>>To$SnapToAddDomain<Option<Perm>>|
    )))
(declare-fun $SortWrappers.AddDomain<Set<Perm>>To$Snap (AddDomain<Set<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Set<Perm>> ($Snap) AddDomain<Set<Perm>>)
(assert (forall ((x AddDomain<Set<Perm>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Set<Perm>>($SortWrappers.AddDomain<Set<Perm>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Set<Perm>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Set<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Set<Perm>>To$Snap($SortWrappers.$SnapToAddDomain<Set<Perm>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Set<Perm>> x))
    :qid |$Snap.AddDomain<Set<Perm>>To$SnapToAddDomain<Set<Perm>>|
    )))
(declare-fun $SortWrappers.Option<Seq<Option<Seq<Int>>>>To$Snap (Option<Seq<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Seq<Option<Seq<Int>>>> ($Snap) Option<Seq<Option<Seq<Int>>>>)
(assert (forall ((x Option<Seq<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Seq<Option<Seq<Int>>>>($SortWrappers.Option<Seq<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Seq<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Seq<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Seq<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToOption<Seq<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Seq<Option<Seq<Int>>>> x))
    :qid |$Snap.Option<Seq<Option<Seq<Int>>>>To$SnapToOption<Seq<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Option<Set<Option<Int>>>To$Snap (Option<Set<Option<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Set<Option<Int>>> ($Snap) Option<Set<Option<Int>>>)
(assert (forall ((x Option<Set<Option<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Set<Option<Int>>>($SortWrappers.Option<Set<Option<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Set<Option<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Set<Option<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Set<Option<Int>>>To$Snap($SortWrappers.$SnapToOption<Set<Option<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Set<Option<Int>>> x))
    :qid |$Snap.Option<Set<Option<Int>>>To$SnapToOption<Set<Option<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Option<Seq<Int>>>To$Snap (AddDomain<Option<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Option<Seq<Int>>> ($Snap) AddDomain<Option<Seq<Int>>>)
(assert (forall ((x AddDomain<Option<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Option<Seq<Int>>>($SortWrappers.AddDomain<Option<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Option<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Option<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Option<Seq<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Option<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Option<Seq<Int>>> x))
    :qid |$Snap.AddDomain<Option<Seq<Int>>>To$SnapToAddDomain<Option<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.Option<Option<Seq<Int>>>To$Snap (Option<Option<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Option<Seq<Int>>> ($Snap) Option<Option<Seq<Int>>>)
(assert (forall ((x Option<Option<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToOption<Option<Seq<Int>>>($SortWrappers.Option<Option<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Option<Option<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToOption<Option<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Option<Seq<Int>>>To$Snap($SortWrappers.$SnapToOption<Option<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToOption<Option<Seq<Int>>> x))
    :qid |$Snap.Option<Option<Seq<Int>>>To$SnapToOption<Option<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Seq<Perm>>To$Snap (AddDomain<Seq<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Seq<Perm>> ($Snap) AddDomain<Seq<Perm>>)
(assert (forall ((x AddDomain<Seq<Perm>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Seq<Perm>>($SortWrappers.AddDomain<Seq<Perm>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Seq<Perm>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Seq<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Seq<Perm>>To$Snap($SortWrappers.$SnapToAddDomain<Seq<Perm>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Seq<Perm>> x))
    :qid |$Snap.AddDomain<Seq<Perm>>To$SnapToAddDomain<Seq<Perm>>|
    )))
(declare-fun $SortWrappers.AddDomain<Set<Option<Seq<Int>>>>To$Snap (AddDomain<Set<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Set<Option<Seq<Int>>>> ($Snap) AddDomain<Set<Option<Seq<Int>>>>)
(assert (forall ((x AddDomain<Set<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Set<Option<Seq<Int>>>>($SortWrappers.AddDomain<Set<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Set<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Set<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Set<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToAddDomain<Set<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Set<Option<Seq<Int>>>> x))
    :qid |$Snap.AddDomain<Set<Option<Seq<Int>>>>To$SnapToAddDomain<Set<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Perm>To$Snap (AddDomain<Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Perm> ($Snap) AddDomain<Perm>)
(assert (forall ((x AddDomain<Perm>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Perm>($SortWrappers.AddDomain<Perm>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Perm>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Perm>To$Snap($SortWrappers.$SnapToAddDomain<Perm> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Perm> x))
    :qid |$Snap.AddDomain<Perm>To$SnapToAddDomain<Perm>|
    )))
(declare-fun $SortWrappers.Option<Option<Int>>To$Snap (Option<Option<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Option<Int>> ($Snap) Option<Option<Int>>)
(assert (forall ((x Option<Option<Int>>)) (!
    (= x ($SortWrappers.$SnapToOption<Option<Int>>($SortWrappers.Option<Option<Int>>To$Snap x)))
    :pattern (($SortWrappers.Option<Option<Int>>To$Snap x))
    :qid |$Snap.$SnapToOption<Option<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Option<Int>>To$Snap($SortWrappers.$SnapToOption<Option<Int>> x)))
    :pattern (($SortWrappers.$SnapToOption<Option<Int>> x))
    :qid |$Snap.Option<Option<Int>>To$SnapToOption<Option<Int>>|
    )))
(declare-fun $SortWrappers.Option<Set<Int>>To$Snap (Option<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Set<Int>> ($Snap) Option<Set<Int>>)
(assert (forall ((x Option<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToOption<Set<Int>>($SortWrappers.Option<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.Option<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToOption<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Set<Int>>To$Snap($SortWrappers.$SnapToOption<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToOption<Set<Int>> x))
    :qid |$Snap.Option<Set<Int>>To$SnapToOption<Set<Int>>|
    )))
(declare-fun $SortWrappers.Option<Seq<Perm>>To$Snap (Option<Seq<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Seq<Perm>> ($Snap) Option<Seq<Perm>>)
(assert (forall ((x Option<Seq<Perm>>)) (!
    (= x ($SortWrappers.$SnapToOption<Seq<Perm>>($SortWrappers.Option<Seq<Perm>>To$Snap x)))
    :pattern (($SortWrappers.Option<Seq<Perm>>To$Snap x))
    :qid |$Snap.$SnapToOption<Seq<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Seq<Perm>>To$Snap($SortWrappers.$SnapToOption<Seq<Perm>> x)))
    :pattern (($SortWrappers.$SnapToOption<Seq<Perm>> x))
    :qid |$Snap.Option<Seq<Perm>>To$SnapToOption<Seq<Perm>>|
    )))
(declare-fun $SortWrappers.AddDomain<Seq<Option<Seq<Int>>>>To$Snap (AddDomain<Seq<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Seq<Option<Seq<Int>>>> ($Snap) AddDomain<Seq<Option<Seq<Int>>>>)
(assert (forall ((x AddDomain<Seq<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Seq<Option<Seq<Int>>>>($SortWrappers.AddDomain<Seq<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Seq<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Seq<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Seq<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToAddDomain<Seq<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Seq<Option<Seq<Int>>>> x))
    :qid |$Snap.AddDomain<Seq<Option<Seq<Int>>>>To$SnapToAddDomain<Seq<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Set<Seq<Int>>>To$Snap (AddDomain<Set<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Set<Seq<Int>>> ($Snap) AddDomain<Set<Seq<Int>>>)
(assert (forall ((x AddDomain<Set<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Set<Seq<Int>>>($SortWrappers.AddDomain<Set<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Set<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Set<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Set<Seq<Int>>>To$Snap($SortWrappers.$SnapToAddDomain<Set<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Set<Seq<Int>>> x))
    :qid |$Snap.AddDomain<Set<Seq<Int>>>To$SnapToAddDomain<Set<Seq<Int>>>|
    )))
(declare-fun $SortWrappers.AddDomain<Seq<Int>>To$Snap (AddDomain<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Seq<Int>> ($Snap) AddDomain<Seq<Int>>)
(assert (forall ((x AddDomain<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Seq<Int>>($SortWrappers.AddDomain<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Seq<Int>>To$Snap($SortWrappers.$SnapToAddDomain<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Seq<Int>> x))
    :qid |$Snap.AddDomain<Seq<Int>>To$SnapToAddDomain<Seq<Int>>|
    )))
(declare-fun $SortWrappers.AddDomain<Option<Option<Seq<Int>>>>To$Snap (AddDomain<Option<Option<Seq<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToAddDomain<Option<Option<Seq<Int>>>> ($Snap) AddDomain<Option<Option<Seq<Int>>>>)
(assert (forall ((x AddDomain<Option<Option<Seq<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToAddDomain<Option<Option<Seq<Int>>>>($SortWrappers.AddDomain<Option<Option<Seq<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.AddDomain<Option<Option<Seq<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToAddDomain<Option<Option<Seq<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AddDomain<Option<Option<Seq<Int>>>>To$Snap($SortWrappers.$SnapToAddDomain<Option<Option<Seq<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToAddDomain<Option<Option<Seq<Int>>>> x))
    :qid |$Snap.AddDomain<Option<Option<Seq<Int>>>>To$SnapToAddDomain<Option<Option<Seq<Int>>>>|
    )))
(declare-fun $SortWrappers.Option<Option<Perm>>To$Snap (Option<Option<Perm>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Option<Perm>> ($Snap) Option<Option<Perm>>)
(assert (forall ((x Option<Option<Perm>>)) (!
    (= x ($SortWrappers.$SnapToOption<Option<Perm>>($SortWrappers.Option<Option<Perm>>To$Snap x)))
    :pattern (($SortWrappers.Option<Option<Perm>>To$Snap x))
    :qid |$Snap.$SnapToOption<Option<Perm>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Option<Perm>>To$Snap($SortWrappers.$SnapToOption<Option<Perm>> x)))
    :pattern (($SortWrappers.$SnapToOption<Option<Perm>> x))
    :qid |$Snap.Option<Option<Perm>>To$SnapToOption<Option<Perm>>|
    )))
(declare-fun $SortWrappers.Option<Seq<Int>>To$Snap (Option<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Seq<Int>> ($Snap) Option<Seq<Int>>)
(assert (forall ((x Option<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToOption<Seq<Int>>($SortWrappers.Option<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Option<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToOption<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Seq<Int>>To$Snap($SortWrappers.$SnapToOption<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToOption<Seq<Int>> x))
    :qid |$Snap.Option<Seq<Int>>To$SnapToOption<Seq<Int>>|
    )))
(declare-fun $SortWrappers.Option<Perm>To$Snap (Option<Perm>) $Snap)
(declare-fun $SortWrappers.$SnapToOption<Perm> ($Snap) Option<Perm>)
(assert (forall ((x Option<Perm>)) (!
    (= x ($SortWrappers.$SnapToOption<Perm>($SortWrappers.Option<Perm>To$Snap x)))
    :pattern (($SortWrappers.Option<Perm>To$Snap x))
    :qid |$Snap.$SnapToOption<Perm>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Option<Perm>To$Snap($SortWrappers.$SnapToOption<Perm> x)))
    :pattern (($SortWrappers.$SnapToOption<Perm> x))
    :qid |$Snap.Option<Perm>To$SnapToOption<Perm>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Set<Int>>) Int)
(declare-const Set_empty Set<Set<Int>>)
(declare-fun Set_in (Set<Int> Set<Set<Int>>) Bool)
(declare-fun Set_singleton (Set<Int>) Set<Set<Int>>)
(declare-fun Set_unionone (Set<Set<Int>> Set<Int>) Set<Set<Int>>)
(declare-fun Set_union (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_intersection (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_difference (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_subset (Set<Set<Int>> Set<Set<Int>>) Bool)
(declare-fun Set_equal (Set<Set<Int>> Set<Set<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<Int>> Set<Set<Int>>) Set<Int>)
(declare-fun Set_card (Set<Option<Option<Int>>>) Int)
(declare-const Set_empty Set<Option<Option<Int>>>)
(declare-fun Set_in (Option<Option<Int>> Set<Option<Option<Int>>>) Bool)
(declare-fun Set_singleton (Option<Option<Int>>) Set<Option<Option<Int>>>)
(declare-fun Set_unionone (Set<Option<Option<Int>>> Option<Option<Int>>) Set<Option<Option<Int>>>)
(declare-fun Set_union (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Set<Option<Option<Int>>>)
(declare-fun Set_intersection (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Set<Option<Option<Int>>>)
(declare-fun Set_difference (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Set<Option<Option<Int>>>)
(declare-fun Set_subset (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Bool)
(declare-fun Set_equal (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Option<Int>>> Set<Option<Option<Int>>>) Option<Option<Int>>)
(declare-fun Set_card (Set<Seq<$Perm>>) Int)
(declare-const Set_empty Set<Seq<$Perm>>)
(declare-fun Set_in (Seq<$Perm> Set<Seq<$Perm>>) Bool)
(declare-fun Set_singleton (Seq<$Perm>) Set<Seq<$Perm>>)
(declare-fun Set_unionone (Set<Seq<$Perm>> Seq<$Perm>) Set<Seq<$Perm>>)
(declare-fun Set_union (Set<Seq<$Perm>> Set<Seq<$Perm>>) Set<Seq<$Perm>>)
(declare-fun Set_intersection (Set<Seq<$Perm>> Set<Seq<$Perm>>) Set<Seq<$Perm>>)
(declare-fun Set_difference (Set<Seq<$Perm>> Set<Seq<$Perm>>) Set<Seq<$Perm>>)
(declare-fun Set_subset (Set<Seq<$Perm>> Set<Seq<$Perm>>) Bool)
(declare-fun Set_equal (Set<Seq<$Perm>> Set<Seq<$Perm>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<$Perm>> Set<Seq<$Perm>>) Seq<$Perm>)
(declare-fun Set_card (Set<Option<Int>>) Int)
(declare-const Set_empty Set<Option<Int>>)
(declare-fun Set_in (Option<Int> Set<Option<Int>>) Bool)
(declare-fun Set_singleton (Option<Int>) Set<Option<Int>>)
(declare-fun Set_unionone (Set<Option<Int>> Option<Int>) Set<Option<Int>>)
(declare-fun Set_union (Set<Option<Int>> Set<Option<Int>>) Set<Option<Int>>)
(declare-fun Set_intersection (Set<Option<Int>> Set<Option<Int>>) Set<Option<Int>>)
(declare-fun Set_difference (Set<Option<Int>> Set<Option<Int>>) Set<Option<Int>>)
(declare-fun Set_subset (Set<Option<Int>> Set<Option<Int>>) Bool)
(declare-fun Set_equal (Set<Option<Int>> Set<Option<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Int>> Set<Option<Int>>) Option<Int>)
(declare-fun Set_card (Set<Set<Option<Seq<Int>>>>) Int)
(declare-const Set_empty Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_in (Set<Option<Seq<Int>>> Set<Set<Option<Seq<Int>>>>) Bool)
(declare-fun Set_singleton (Set<Option<Seq<Int>>>) Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_unionone (Set<Set<Option<Seq<Int>>>> Set<Option<Seq<Int>>>) Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_union (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_intersection (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_difference (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Set<Set<Option<Seq<Int>>>>)
(declare-fun Set_subset (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Bool)
(declare-fun Set_equal (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<Option<Seq<Int>>>> Set<Set<Option<Seq<Int>>>>) Set<Option<Seq<Int>>>)
(declare-fun Set_card (Set<Seq<Int>>) Int)
(declare-const Set_empty Set<Seq<Int>>)
(declare-fun Set_in (Seq<Int> Set<Seq<Int>>) Bool)
(declare-fun Set_singleton (Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_unionone (Set<Seq<Int>> Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_union (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_intersection (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_difference (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_subset (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_equal (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Int>> Set<Seq<Int>>) Seq<Int>)
(declare-fun Set_card (Set<Set<$Perm>>) Int)
(declare-const Set_empty Set<Set<$Perm>>)
(declare-fun Set_in (Set<$Perm> Set<Set<$Perm>>) Bool)
(declare-fun Set_singleton (Set<$Perm>) Set<Set<$Perm>>)
(declare-fun Set_unionone (Set<Set<$Perm>> Set<$Perm>) Set<Set<$Perm>>)
(declare-fun Set_union (Set<Set<$Perm>> Set<Set<$Perm>>) Set<Set<$Perm>>)
(declare-fun Set_intersection (Set<Set<$Perm>> Set<Set<$Perm>>) Set<Set<$Perm>>)
(declare-fun Set_difference (Set<Set<$Perm>> Set<Set<$Perm>>) Set<Set<$Perm>>)
(declare-fun Set_subset (Set<Set<$Perm>> Set<Set<$Perm>>) Bool)
(declare-fun Set_equal (Set<Set<$Perm>> Set<Set<$Perm>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<$Perm>> Set<Set<$Perm>>) Set<$Perm>)
(declare-fun Set_card (Set<Seq<Option<Int>>>) Int)
(declare-const Set_empty Set<Seq<Option<Int>>>)
(declare-fun Set_in (Seq<Option<Int>> Set<Seq<Option<Int>>>) Bool)
(declare-fun Set_singleton (Seq<Option<Int>>) Set<Seq<Option<Int>>>)
(declare-fun Set_unionone (Set<Seq<Option<Int>>> Seq<Option<Int>>) Set<Seq<Option<Int>>>)
(declare-fun Set_union (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Set<Seq<Option<Int>>>)
(declare-fun Set_intersection (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Set<Seq<Option<Int>>>)
(declare-fun Set_difference (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Set<Seq<Option<Int>>>)
(declare-fun Set_subset (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Bool)
(declare-fun Set_equal (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Option<Int>>> Set<Seq<Option<Int>>>) Seq<Option<Int>>)
(declare-fun Set_card (Set<Option<Option<Seq<Int>>>>) Int)
(declare-const Set_empty Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_in (Option<Option<Seq<Int>>> Set<Option<Option<Seq<Int>>>>) Bool)
(declare-fun Set_singleton (Option<Option<Seq<Int>>>) Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_unionone (Set<Option<Option<Seq<Int>>>> Option<Option<Seq<Int>>>) Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_union (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_intersection (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_difference (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Set<Option<Option<Seq<Int>>>>)
(declare-fun Set_subset (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Bool)
(declare-fun Set_equal (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Option<Seq<Int>>>> Set<Option<Option<Seq<Int>>>>) Option<Option<Seq<Int>>>)
(declare-fun Set_card (Set<$Perm>) Int)
(declare-const Set_empty Set<$Perm>)
(declare-fun Set_in ($Perm Set<$Perm>) Bool)
(declare-fun Set_singleton ($Perm) Set<$Perm>)
(declare-fun Set_unionone (Set<$Perm> $Perm) Set<$Perm>)
(declare-fun Set_union (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_intersection (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_difference (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun Set_subset (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_equal (Set<$Perm> Set<$Perm>) Bool)
(declare-fun Set_skolem_diff (Set<$Perm> Set<$Perm>) $Perm)
(declare-fun Set_card (Set<Set<Option<Int>>>) Int)
(declare-const Set_empty Set<Set<Option<Int>>>)
(declare-fun Set_in (Set<Option<Int>> Set<Set<Option<Int>>>) Bool)
(declare-fun Set_singleton (Set<Option<Int>>) Set<Set<Option<Int>>>)
(declare-fun Set_unionone (Set<Set<Option<Int>>> Set<Option<Int>>) Set<Set<Option<Int>>>)
(declare-fun Set_union (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Set<Set<Option<Int>>>)
(declare-fun Set_intersection (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Set<Set<Option<Int>>>)
(declare-fun Set_difference (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Set<Set<Option<Int>>>)
(declare-fun Set_subset (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Bool)
(declare-fun Set_equal (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<Option<Int>>> Set<Set<Option<Int>>>) Set<Option<Int>>)
(declare-fun Set_card (Set<Seq<Option<Seq<Int>>>>) Int)
(declare-const Set_empty Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_in (Seq<Option<Seq<Int>>> Set<Seq<Option<Seq<Int>>>>) Bool)
(declare-fun Set_singleton (Seq<Option<Seq<Int>>>) Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_unionone (Set<Seq<Option<Seq<Int>>>> Seq<Option<Seq<Int>>>) Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_union (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_intersection (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_difference (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Set<Seq<Option<Seq<Int>>>>)
(declare-fun Set_subset (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Bool)
(declare-fun Set_equal (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Option<Seq<Int>>>> Set<Seq<Option<Seq<Int>>>>) Seq<Option<Seq<Int>>>)
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
(declare-fun Set_card (Set<Option<Seq<Int>>>) Int)
(declare-const Set_empty Set<Option<Seq<Int>>>)
(declare-fun Set_in (Option<Seq<Int>> Set<Option<Seq<Int>>>) Bool)
(declare-fun Set_singleton (Option<Seq<Int>>) Set<Option<Seq<Int>>>)
(declare-fun Set_unionone (Set<Option<Seq<Int>>> Option<Seq<Int>>) Set<Option<Seq<Int>>>)
(declare-fun Set_union (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Set<Option<Seq<Int>>>)
(declare-fun Set_intersection (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Set<Option<Seq<Int>>>)
(declare-fun Set_difference (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Set<Option<Seq<Int>>>)
(declare-fun Set_subset (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Bool)
(declare-fun Set_equal (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Option<Seq<Int>>)
(declare-fun Set_card (Set<Seq<Seq<Int>>>) Int)
(declare-const Set_empty Set<Seq<Seq<Int>>>)
(declare-fun Set_in (Seq<Seq<Int>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_singleton (Seq<Seq<Int>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_unionone (Set<Seq<Seq<Int>>> Seq<Seq<Int>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_union (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_intersection (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_difference (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_subset (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_equal (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Seq<Seq<Int>>)
(declare-fun Set_card (Set<Set<Seq<Int>>>) Int)
(declare-const Set_empty Set<Set<Seq<Int>>>)
(declare-fun Set_in (Set<Seq<Int>> Set<Set<Seq<Int>>>) Bool)
(declare-fun Set_singleton (Set<Seq<Int>>) Set<Set<Seq<Int>>>)
(declare-fun Set_unionone (Set<Set<Seq<Int>>> Set<Seq<Int>>) Set<Set<Seq<Int>>>)
(declare-fun Set_union (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Set<Set<Seq<Int>>>)
(declare-fun Set_intersection (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Set<Set<Seq<Int>>>)
(declare-fun Set_difference (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Set<Set<Seq<Int>>>)
(declare-fun Set_subset (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Bool)
(declare-fun Set_equal (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<Seq<Int>>> Set<Set<Seq<Int>>>) Set<Seq<Int>>)
(declare-fun Set_card (Set<Option<Perm>>) Int)
(declare-const Set_empty Set<Option<Perm>>)
(declare-fun Set_in (Option<Perm> Set<Option<Perm>>) Bool)
(declare-fun Set_singleton (Option<Perm>) Set<Option<Perm>>)
(declare-fun Set_unionone (Set<Option<Perm>> Option<Perm>) Set<Option<Perm>>)
(declare-fun Set_union (Set<Option<Perm>> Set<Option<Perm>>) Set<Option<Perm>>)
(declare-fun Set_intersection (Set<Option<Perm>> Set<Option<Perm>>) Set<Option<Perm>>)
(declare-fun Set_difference (Set<Option<Perm>> Set<Option<Perm>>) Set<Option<Perm>>)
(declare-fun Set_subset (Set<Option<Perm>> Set<Option<Perm>>) Bool)
(declare-fun Set_equal (Set<Option<Perm>> Set<Option<Perm>>) Bool)
(declare-fun Set_skolem_diff (Set<Option<Perm>> Set<Option<Perm>>) Option<Perm>)
(declare-fun Seq_length (Seq<Seq<Seq<Int>>>) Int)
(declare-const Seq_empty Seq<Seq<Seq<Int>>>)
(declare-fun Seq_singleton (Seq<Seq<Int>>) Seq<Seq<Seq<Int>>>)
(declare-fun Seq_append (Seq<Seq<Seq<Int>>> Seq<Seq<Seq<Int>>>) Seq<Seq<Seq<Int>>>)
(declare-fun Seq_index (Seq<Seq<Seq<Int>>> Int) Seq<Seq<Int>>)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Seq<Seq<Int>>> Int Seq<Seq<Int>>) Seq<Seq<Seq<Int>>>)
(declare-fun Seq_take (Seq<Seq<Seq<Int>>> Int) Seq<Seq<Seq<Int>>>)
(declare-fun Seq_drop (Seq<Seq<Seq<Int>>> Int) Seq<Seq<Seq<Int>>>)
(declare-fun Seq_contains (Seq<Seq<Seq<Int>>> Seq<Seq<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<Seq<Int>>> Seq<Seq<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Seq<Seq<Int>>> Seq<Seq<Int>>) Int)
(declare-fun Seq_equal (Seq<Seq<Seq<Int>>> Seq<Seq<Seq<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<Seq<Int>>> Seq<Seq<Seq<Int>>>) Int)
(declare-fun Seq_length (Seq<Set<Seq<Int>>>) Int)
(declare-const Seq_empty Seq<Set<Seq<Int>>>)
(declare-fun Seq_singleton (Set<Seq<Int>>) Seq<Set<Seq<Int>>>)
(declare-fun Seq_append (Seq<Set<Seq<Int>>> Seq<Set<Seq<Int>>>) Seq<Set<Seq<Int>>>)
(declare-fun Seq_index (Seq<Set<Seq<Int>>> Int) Set<Seq<Int>>)
(declare-fun Seq_update (Seq<Set<Seq<Int>>> Int Set<Seq<Int>>) Seq<Set<Seq<Int>>>)
(declare-fun Seq_take (Seq<Set<Seq<Int>>> Int) Seq<Set<Seq<Int>>>)
(declare-fun Seq_drop (Seq<Set<Seq<Int>>> Int) Seq<Set<Seq<Int>>>)
(declare-fun Seq_contains (Seq<Set<Seq<Int>>> Set<Seq<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<Seq<Int>>> Set<Seq<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Set<Seq<Int>>> Set<Seq<Int>>) Int)
(declare-fun Seq_equal (Seq<Set<Seq<Int>>> Seq<Set<Seq<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<Seq<Int>>> Seq<Set<Seq<Int>>>) Int)
(declare-fun Seq_length (Seq<Set<$Perm>>) Int)
(declare-const Seq_empty Seq<Set<$Perm>>)
(declare-fun Seq_singleton (Set<$Perm>) Seq<Set<$Perm>>)
(declare-fun Seq_append (Seq<Set<$Perm>> Seq<Set<$Perm>>) Seq<Set<$Perm>>)
(declare-fun Seq_index (Seq<Set<$Perm>> Int) Set<$Perm>)
(declare-fun Seq_update (Seq<Set<$Perm>> Int Set<$Perm>) Seq<Set<$Perm>>)
(declare-fun Seq_take (Seq<Set<$Perm>> Int) Seq<Set<$Perm>>)
(declare-fun Seq_drop (Seq<Set<$Perm>> Int) Seq<Set<$Perm>>)
(declare-fun Seq_contains (Seq<Set<$Perm>> Set<$Perm>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<$Perm>> Set<$Perm>) Bool)
(declare-fun Seq_skolem (Seq<Set<$Perm>> Set<$Perm>) Int)
(declare-fun Seq_equal (Seq<Set<$Perm>> Seq<Set<$Perm>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<$Perm>> Seq<Set<$Perm>>) Int)
(declare-fun Seq_length (Seq<Set<Option<Seq<Int>>>>) Int)
(declare-const Seq_empty Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_singleton (Set<Option<Seq<Int>>>) Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_append (Seq<Set<Option<Seq<Int>>>> Seq<Set<Option<Seq<Int>>>>) Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_index (Seq<Set<Option<Seq<Int>>>> Int) Set<Option<Seq<Int>>>)
(declare-fun Seq_update (Seq<Set<Option<Seq<Int>>>> Int Set<Option<Seq<Int>>>) Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_take (Seq<Set<Option<Seq<Int>>>> Int) Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_drop (Seq<Set<Option<Seq<Int>>>> Int) Seq<Set<Option<Seq<Int>>>>)
(declare-fun Seq_contains (Seq<Set<Option<Seq<Int>>>> Set<Option<Seq<Int>>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<Option<Seq<Int>>>> Set<Option<Seq<Int>>>) Bool)
(declare-fun Seq_skolem (Seq<Set<Option<Seq<Int>>>> Set<Option<Seq<Int>>>) Int)
(declare-fun Seq_equal (Seq<Set<Option<Seq<Int>>>> Seq<Set<Option<Seq<Int>>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<Option<Seq<Int>>>> Seq<Set<Option<Seq<Int>>>>) Int)
(declare-fun Seq_length (Seq<Option<Option<Int>>>) Int)
(declare-const Seq_empty Seq<Option<Option<Int>>>)
(declare-fun Seq_singleton (Option<Option<Int>>) Seq<Option<Option<Int>>>)
(declare-fun Seq_append (Seq<Option<Option<Int>>> Seq<Option<Option<Int>>>) Seq<Option<Option<Int>>>)
(declare-fun Seq_index (Seq<Option<Option<Int>>> Int) Option<Option<Int>>)
(declare-fun Seq_update (Seq<Option<Option<Int>>> Int Option<Option<Int>>) Seq<Option<Option<Int>>>)
(declare-fun Seq_take (Seq<Option<Option<Int>>> Int) Seq<Option<Option<Int>>>)
(declare-fun Seq_drop (Seq<Option<Option<Int>>> Int) Seq<Option<Option<Int>>>)
(declare-fun Seq_contains (Seq<Option<Option<Int>>> Option<Option<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Option<Option<Int>>> Option<Option<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Option<Option<Int>>> Option<Option<Int>>) Int)
(declare-fun Seq_equal (Seq<Option<Option<Int>>> Seq<Option<Option<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Option<Option<Int>>> Seq<Option<Option<Int>>>) Int)
(declare-fun Seq_length (Seq<Seq<Int>>) Int)
(declare-const Seq_empty Seq<Seq<Int>>)
(declare-fun Seq_singleton (Seq<Int>) Seq<Seq<Int>>)
(declare-fun Seq_append (Seq<Seq<Int>> Seq<Seq<Int>>) Seq<Seq<Int>>)
(declare-fun Seq_index (Seq<Seq<Int>> Int) Seq<Int>)
(declare-fun Seq_update (Seq<Seq<Int>> Int Seq<Int>) Seq<Seq<Int>>)
(declare-fun Seq_take (Seq<Seq<Int>> Int) Seq<Seq<Int>>)
(declare-fun Seq_drop (Seq<Seq<Int>> Int) Seq<Seq<Int>>)
(declare-fun Seq_contains (Seq<Seq<Int>> Seq<Int>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<Int>> Seq<Int>) Bool)
(declare-fun Seq_skolem (Seq<Seq<Int>> Seq<Int>) Int)
(declare-fun Seq_equal (Seq<Seq<Int>> Seq<Seq<Int>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<Int>> Seq<Seq<Int>>) Int)
(declare-fun Seq_length (Seq<Seq<Option<Int>>>) Int)
(declare-const Seq_empty Seq<Seq<Option<Int>>>)
(declare-fun Seq_singleton (Seq<Option<Int>>) Seq<Seq<Option<Int>>>)
(declare-fun Seq_append (Seq<Seq<Option<Int>>> Seq<Seq<Option<Int>>>) Seq<Seq<Option<Int>>>)
(declare-fun Seq_index (Seq<Seq<Option<Int>>> Int) Seq<Option<Int>>)
(declare-fun Seq_update (Seq<Seq<Option<Int>>> Int Seq<Option<Int>>) Seq<Seq<Option<Int>>>)
(declare-fun Seq_take (Seq<Seq<Option<Int>>> Int) Seq<Seq<Option<Int>>>)
(declare-fun Seq_drop (Seq<Seq<Option<Int>>> Int) Seq<Seq<Option<Int>>>)
(declare-fun Seq_contains (Seq<Seq<Option<Int>>> Seq<Option<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<Option<Int>>> Seq<Option<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Seq<Option<Int>>> Seq<Option<Int>>) Int)
(declare-fun Seq_equal (Seq<Seq<Option<Int>>> Seq<Seq<Option<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<Option<Int>>> Seq<Seq<Option<Int>>>) Int)
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
(declare-fun Seq_length (Seq<Seq<$Perm>>) Int)
(declare-const Seq_empty Seq<Seq<$Perm>>)
(declare-fun Seq_singleton (Seq<$Perm>) Seq<Seq<$Perm>>)
(declare-fun Seq_append (Seq<Seq<$Perm>> Seq<Seq<$Perm>>) Seq<Seq<$Perm>>)
(declare-fun Seq_index (Seq<Seq<$Perm>> Int) Seq<$Perm>)
(declare-fun Seq_update (Seq<Seq<$Perm>> Int Seq<$Perm>) Seq<Seq<$Perm>>)
(declare-fun Seq_take (Seq<Seq<$Perm>> Int) Seq<Seq<$Perm>>)
(declare-fun Seq_drop (Seq<Seq<$Perm>> Int) Seq<Seq<$Perm>>)
(declare-fun Seq_contains (Seq<Seq<$Perm>> Seq<$Perm>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<$Perm>> Seq<$Perm>) Bool)
(declare-fun Seq_skolem (Seq<Seq<$Perm>> Seq<$Perm>) Int)
(declare-fun Seq_equal (Seq<Seq<$Perm>> Seq<Seq<$Perm>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<$Perm>> Seq<Seq<$Perm>>) Int)
(declare-fun Seq_length (Seq<Option<Option<Seq<Int>>>>) Int)
(declare-const Seq_empty Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_singleton (Option<Option<Seq<Int>>>) Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_append (Seq<Option<Option<Seq<Int>>>> Seq<Option<Option<Seq<Int>>>>) Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_index (Seq<Option<Option<Seq<Int>>>> Int) Option<Option<Seq<Int>>>)
(declare-fun Seq_update (Seq<Option<Option<Seq<Int>>>> Int Option<Option<Seq<Int>>>) Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_take (Seq<Option<Option<Seq<Int>>>> Int) Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_drop (Seq<Option<Option<Seq<Int>>>> Int) Seq<Option<Option<Seq<Int>>>>)
(declare-fun Seq_contains (Seq<Option<Option<Seq<Int>>>> Option<Option<Seq<Int>>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Option<Option<Seq<Int>>>> Option<Option<Seq<Int>>>) Bool)
(declare-fun Seq_skolem (Seq<Option<Option<Seq<Int>>>> Option<Option<Seq<Int>>>) Int)
(declare-fun Seq_equal (Seq<Option<Option<Seq<Int>>>> Seq<Option<Option<Seq<Int>>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Option<Option<Seq<Int>>>> Seq<Option<Option<Seq<Int>>>>) Int)
(declare-fun Seq_length (Seq<Option<Int>>) Int)
(declare-const Seq_empty Seq<Option<Int>>)
(declare-fun Seq_singleton (Option<Int>) Seq<Option<Int>>)
(declare-fun Seq_append (Seq<Option<Int>> Seq<Option<Int>>) Seq<Option<Int>>)
(declare-fun Seq_index (Seq<Option<Int>> Int) Option<Int>)
(declare-fun Seq_update (Seq<Option<Int>> Int Option<Int>) Seq<Option<Int>>)
(declare-fun Seq_take (Seq<Option<Int>> Int) Seq<Option<Int>>)
(declare-fun Seq_drop (Seq<Option<Int>> Int) Seq<Option<Int>>)
(declare-fun Seq_contains (Seq<Option<Int>> Option<Int>) Bool)
(declare-fun Seq_contains_trigger (Seq<Option<Int>> Option<Int>) Bool)
(declare-fun Seq_skolem (Seq<Option<Int>> Option<Int>) Int)
(declare-fun Seq_equal (Seq<Option<Int>> Seq<Option<Int>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Option<Int>> Seq<Option<Int>>) Int)
(declare-fun Seq_length (Seq<Option<Seq<Int>>>) Int)
(declare-const Seq_empty Seq<Option<Seq<Int>>>)
(declare-fun Seq_singleton (Option<Seq<Int>>) Seq<Option<Seq<Int>>>)
(declare-fun Seq_append (Seq<Option<Seq<Int>>> Seq<Option<Seq<Int>>>) Seq<Option<Seq<Int>>>)
(declare-fun Seq_index (Seq<Option<Seq<Int>>> Int) Option<Seq<Int>>)
(declare-fun Seq_update (Seq<Option<Seq<Int>>> Int Option<Seq<Int>>) Seq<Option<Seq<Int>>>)
(declare-fun Seq_take (Seq<Option<Seq<Int>>> Int) Seq<Option<Seq<Int>>>)
(declare-fun Seq_drop (Seq<Option<Seq<Int>>> Int) Seq<Option<Seq<Int>>>)
(declare-fun Seq_contains (Seq<Option<Seq<Int>>> Option<Seq<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Option<Seq<Int>>> Option<Seq<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Option<Seq<Int>>> Option<Seq<Int>>) Int)
(declare-fun Seq_equal (Seq<Option<Seq<Int>>> Seq<Option<Seq<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Option<Seq<Int>>> Seq<Option<Seq<Int>>>) Int)
(declare-fun Seq_length (Seq<Option<Perm>>) Int)
(declare-const Seq_empty Seq<Option<Perm>>)
(declare-fun Seq_singleton (Option<Perm>) Seq<Option<Perm>>)
(declare-fun Seq_append (Seq<Option<Perm>> Seq<Option<Perm>>) Seq<Option<Perm>>)
(declare-fun Seq_index (Seq<Option<Perm>> Int) Option<Perm>)
(declare-fun Seq_update (Seq<Option<Perm>> Int Option<Perm>) Seq<Option<Perm>>)
(declare-fun Seq_take (Seq<Option<Perm>> Int) Seq<Option<Perm>>)
(declare-fun Seq_drop (Seq<Option<Perm>> Int) Seq<Option<Perm>>)
(declare-fun Seq_contains (Seq<Option<Perm>> Option<Perm>) Bool)
(declare-fun Seq_contains_trigger (Seq<Option<Perm>> Option<Perm>) Bool)
(declare-fun Seq_skolem (Seq<Option<Perm>> Option<Perm>) Int)
(declare-fun Seq_equal (Seq<Option<Perm>> Seq<Option<Perm>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Option<Perm>> Seq<Option<Perm>>) Int)
(declare-fun Seq_length (Seq<Seq<Option<Seq<Int>>>>) Int)
(declare-const Seq_empty Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_singleton (Seq<Option<Seq<Int>>>) Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_append (Seq<Seq<Option<Seq<Int>>>> Seq<Seq<Option<Seq<Int>>>>) Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_index (Seq<Seq<Option<Seq<Int>>>> Int) Seq<Option<Seq<Int>>>)
(declare-fun Seq_update (Seq<Seq<Option<Seq<Int>>>> Int Seq<Option<Seq<Int>>>) Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_take (Seq<Seq<Option<Seq<Int>>>> Int) Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_drop (Seq<Seq<Option<Seq<Int>>>> Int) Seq<Seq<Option<Seq<Int>>>>)
(declare-fun Seq_contains (Seq<Seq<Option<Seq<Int>>>> Seq<Option<Seq<Int>>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<Option<Seq<Int>>>> Seq<Option<Seq<Int>>>) Bool)
(declare-fun Seq_skolem (Seq<Seq<Option<Seq<Int>>>> Seq<Option<Seq<Int>>>) Int)
(declare-fun Seq_equal (Seq<Seq<Option<Seq<Int>>>> Seq<Seq<Option<Seq<Int>>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<Option<Seq<Int>>>> Seq<Seq<Option<Seq<Int>>>>) Int)
(declare-fun Seq_length (Seq<Set<Int>>) Int)
(declare-const Seq_empty Seq<Set<Int>>)
(declare-fun Seq_singleton (Set<Int>) Seq<Set<Int>>)
(declare-fun Seq_append (Seq<Set<Int>> Seq<Set<Int>>) Seq<Set<Int>>)
(declare-fun Seq_index (Seq<Set<Int>> Int) Set<Int>)
(declare-fun Seq_update (Seq<Set<Int>> Int Set<Int>) Seq<Set<Int>>)
(declare-fun Seq_take (Seq<Set<Int>> Int) Seq<Set<Int>>)
(declare-fun Seq_drop (Seq<Set<Int>> Int) Seq<Set<Int>>)
(declare-fun Seq_contains (Seq<Set<Int>> Set<Int>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<Int>> Set<Int>) Bool)
(declare-fun Seq_skolem (Seq<Set<Int>> Set<Int>) Int)
(declare-fun Seq_equal (Seq<Set<Int>> Seq<Set<Int>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<Int>> Seq<Set<Int>>) Int)
(declare-fun Seq_length (Seq<$Perm>) Int)
(declare-const Seq_empty Seq<$Perm>)
(declare-fun Seq_singleton ($Perm) Seq<$Perm>)
(declare-fun Seq_append (Seq<$Perm> Seq<$Perm>) Seq<$Perm>)
(declare-fun Seq_index (Seq<$Perm> Int) $Perm)
(declare-fun Seq_update (Seq<$Perm> Int $Perm) Seq<$Perm>)
(declare-fun Seq_take (Seq<$Perm> Int) Seq<$Perm>)
(declare-fun Seq_drop (Seq<$Perm> Int) Seq<$Perm>)
(declare-fun Seq_contains (Seq<$Perm> $Perm) Bool)
(declare-fun Seq_contains_trigger (Seq<$Perm> $Perm) Bool)
(declare-fun Seq_skolem (Seq<$Perm> $Perm) Int)
(declare-fun Seq_equal (Seq<$Perm> Seq<$Perm>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Perm> Seq<$Perm>) Int)
(declare-fun Seq_length (Seq<Set<Option<Int>>>) Int)
(declare-const Seq_empty Seq<Set<Option<Int>>>)
(declare-fun Seq_singleton (Set<Option<Int>>) Seq<Set<Option<Int>>>)
(declare-fun Seq_append (Seq<Set<Option<Int>>> Seq<Set<Option<Int>>>) Seq<Set<Option<Int>>>)
(declare-fun Seq_index (Seq<Set<Option<Int>>> Int) Set<Option<Int>>)
(declare-fun Seq_update (Seq<Set<Option<Int>>> Int Set<Option<Int>>) Seq<Set<Option<Int>>>)
(declare-fun Seq_take (Seq<Set<Option<Int>>> Int) Seq<Set<Option<Int>>>)
(declare-fun Seq_drop (Seq<Set<Option<Int>>> Int) Seq<Set<Option<Int>>>)
(declare-fun Seq_contains (Seq<Set<Option<Int>>> Set<Option<Int>>) Bool)
(declare-fun Seq_contains_trigger (Seq<Set<Option<Int>>> Set<Option<Int>>) Bool)
(declare-fun Seq_skolem (Seq<Set<Option<Int>>> Set<Option<Int>>) Int)
(declare-fun Seq_equal (Seq<Set<Option<Int>>> Seq<Set<Option<Int>>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Set<Option<Int>>> Seq<Set<Option<Int>>>) Int)
(declare-fun Some<Option<Option<Perm>>> (Option<Perm>) Option<Option<Perm>>)
(declare-const None<Option<Option<Perm>>> Option<Option<Perm>>)
(declare-fun get_Option_value<Option<Perm>> (Option<Option<Perm>>) Option<Perm>)
(declare-fun Option_tag<Int> (Option<Option<Perm>>) Int)
(declare-fun add<Option<Option<Seq<Int>>>> (Option<Option<Seq<Int>>> Option<Option<Seq<Int>>>) Option<Option<Seq<Int>>>)
(declare-fun add<Set<Perm>> (Set<$Perm> Set<$Perm>) Set<$Perm>)
(declare-fun add<Seq<Option<Seq<Int>>>> (Seq<Option<Seq<Int>>> Seq<Option<Seq<Int>>>) Seq<Option<Seq<Int>>>)
(declare-fun add<Set<Int>> (Set<Int> Set<Int>) Set<Int>)
(declare-fun Some<Option<Set<Perm>>> (Set<$Perm>) Option<Set<Perm>>)
(declare-const None<Option<Set<Perm>>> Option<Set<Perm>>)
(declare-fun get_Option_value<Set<Perm>> (Option<Set<Perm>>) Set<$Perm>)
(declare-fun Option_tag<Int> (Option<Set<Perm>>) Int)
(declare-fun Some<Option<Int>> (Int) Option<Int>)
(declare-const None<Option<Int>> Option<Int>)
(declare-fun get_Option_value<Int> (Option<Int>) Int)
(declare-fun Option_tag<Int> (Option<Int>) Int)
(declare-fun add<Option<Int>> (Option<Int> Option<Int>) Option<Int>)
(declare-fun Some<Option<Set<Int>>> (Set<Int>) Option<Set<Int>>)
(declare-const None<Option<Set<Int>>> Option<Set<Int>>)
(declare-fun get_Option_value<Set<Int>> (Option<Set<Int>>) Set<Int>)
(declare-fun Option_tag<Int> (Option<Set<Int>>) Int)
(declare-fun Some<Option<Option<Option<Seq<Int>>>>> (Option<Option<Seq<Int>>>) Option<Option<Option<Seq<Int>>>>)
(declare-const None<Option<Option<Option<Seq<Int>>>>> Option<Option<Option<Seq<Int>>>>)
(declare-fun get_Option_value<Option<Option<Seq<Int>>>> (Option<Option<Option<Seq<Int>>>>) Option<Option<Seq<Int>>>)
(declare-fun Option_tag<Int> (Option<Option<Option<Seq<Int>>>>) Int)
(declare-fun add<Int> (Int Int) Int)
(declare-fun Some<Option<Seq<Option<Seq<Int>>>>> (Seq<Option<Seq<Int>>>) Option<Seq<Option<Seq<Int>>>>)
(declare-const None<Option<Seq<Option<Seq<Int>>>>> Option<Seq<Option<Seq<Int>>>>)
(declare-fun get_Option_value<Seq<Option<Seq<Int>>>> (Option<Seq<Option<Seq<Int>>>>) Seq<Option<Seq<Int>>>)
(declare-fun Option_tag<Int> (Option<Seq<Option<Seq<Int>>>>) Int)
(declare-fun Some<Option<Set<Option<Int>>>> (Set<Option<Int>>) Option<Set<Option<Int>>>)
(declare-const None<Option<Set<Option<Int>>>> Option<Set<Option<Int>>>)
(declare-fun get_Option_value<Set<Option<Int>>> (Option<Set<Option<Int>>>) Set<Option<Int>>)
(declare-fun Option_tag<Int> (Option<Set<Option<Int>>>) Int)
(declare-fun Some<Option<Set<Seq<Int>>>> (Set<Seq<Int>>) Option<Set<Seq<Int>>>)
(declare-const None<Option<Set<Seq<Int>>>> Option<Set<Seq<Int>>>)
(declare-fun get_Option_value<Set<Seq<Int>>> (Option<Set<Seq<Int>>>) Set<Seq<Int>>)
(declare-fun Option_tag<Int> (Option<Set<Seq<Int>>>) Int)
(declare-fun Some<Option<Option<Option<Int>>>> (Option<Option<Int>>) Option<Option<Option<Int>>>)
(declare-const None<Option<Option<Option<Int>>>> Option<Option<Option<Int>>>)
(declare-fun get_Option_value<Option<Option<Int>>> (Option<Option<Option<Int>>>) Option<Option<Int>>)
(declare-fun Option_tag<Int> (Option<Option<Option<Int>>>) Int)
(declare-fun add<Set<Option<Int>>> (Set<Option<Int>> Set<Option<Int>>) Set<Option<Int>>)
(declare-fun add<Option<Option<Int>>> (Option<Option<Int>> Option<Option<Int>>) Option<Option<Int>>)
(declare-fun Some<Option<Seq<Perm>>> (Seq<$Perm>) Option<Seq<Perm>>)
(declare-const None<Option<Seq<Perm>>> Option<Seq<Perm>>)
(declare-fun get_Option_value<Seq<Perm>> (Option<Seq<Perm>>) Seq<$Perm>)
(declare-fun Option_tag<Int> (Option<Seq<Perm>>) Int)
(declare-fun Some<Option<Seq<Int>>> (Seq<Int>) Option<Seq<Int>>)
(declare-const None<Option<Seq<Int>>> Option<Seq<Int>>)
(declare-fun get_Option_value<Seq<Int>> (Option<Seq<Int>>) Seq<Int>)
(declare-fun Option_tag<Int> (Option<Seq<Int>>) Int)
(declare-fun add<Seq<Perm>> (Seq<$Perm> Seq<$Perm>) Seq<$Perm>)
(declare-fun add<Set<Option<Seq<Int>>>> (Set<Option<Seq<Int>>> Set<Option<Seq<Int>>>) Set<Option<Seq<Int>>>)
(declare-fun add<Seq<Option<Int>>> (Seq<Option<Int>> Seq<Option<Int>>) Seq<Option<Int>>)
(declare-fun add<Perm> ($Perm $Perm) $Perm)
(declare-fun add<Option<Perm>> (Option<Perm> Option<Perm>) Option<Perm>)
(declare-fun Some<Option<Seq<Option<Int>>>> (Seq<Option<Int>>) Option<Seq<Option<Int>>>)
(declare-const None<Option<Seq<Option<Int>>>> Option<Seq<Option<Int>>>)
(declare-fun get_Option_value<Seq<Option<Int>>> (Option<Seq<Option<Int>>>) Seq<Option<Int>>)
(declare-fun Option_tag<Int> (Option<Seq<Option<Int>>>) Int)
(declare-fun add<Set<Seq<Int>>> (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Some<Option<Option<Seq<Int>>>> (Option<Seq<Int>>) Option<Option<Seq<Int>>>)
(declare-const None<Option<Option<Seq<Int>>>> Option<Option<Seq<Int>>>)
(declare-fun get_Option_value<Option<Seq<Int>>> (Option<Option<Seq<Int>>>) Option<Seq<Int>>)
(declare-fun Option_tag<Int> (Option<Option<Seq<Int>>>) Int)
(declare-fun Some<Option<Set<Option<Seq<Int>>>>> (Set<Option<Seq<Int>>>) Option<Set<Option<Seq<Int>>>>)
(declare-const None<Option<Set<Option<Seq<Int>>>>> Option<Set<Option<Seq<Int>>>>)
(declare-fun get_Option_value<Set<Option<Seq<Int>>>> (Option<Set<Option<Seq<Int>>>>) Set<Option<Seq<Int>>>)
(declare-fun Option_tag<Int> (Option<Set<Option<Seq<Int>>>>) Int)
(declare-fun Some<Option<Perm>> ($Perm) Option<Perm>)
(declare-const None<Option<Perm>> Option<Perm>)
(declare-fun get_Option_value<Perm> (Option<Perm>) $Perm)
(declare-fun Option_tag<Int> (Option<Perm>) Int)
(declare-fun Some<Option<Seq<Seq<Int>>>> (Seq<Seq<Int>>) Option<Seq<Seq<Int>>>)
(declare-const None<Option<Seq<Seq<Int>>>> Option<Seq<Seq<Int>>>)
(declare-fun get_Option_value<Seq<Seq<Int>>> (Option<Seq<Seq<Int>>>) Seq<Seq<Int>>)
(declare-fun Option_tag<Int> (Option<Seq<Seq<Int>>>) Int)
(declare-fun Some<Option<Option<Int>>> (Option<Int>) Option<Option<Int>>)
(declare-const None<Option<Option<Int>>> Option<Option<Int>>)
(declare-fun get_Option_value<Option<Int>> (Option<Option<Int>>) Option<Int>)
(declare-fun Option_tag<Int> (Option<Option<Int>>) Int)
(declare-fun add<Option<Seq<Int>>> (Option<Seq<Int>> Option<Seq<Int>>) Option<Seq<Int>>)
(declare-fun add<Seq<Seq<Int>>> (Seq<Seq<Int>> Seq<Seq<Int>>) Seq<Seq<Int>>)
(declare-fun add<Seq<Int>> (Seq<Int> Seq<Int>) Seq<Int>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Seq<Seq<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<Seq<Int>>>)) 0))
(assert (forall ((s Seq<Seq<Seq<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<Seq<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<Seq<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<Seq<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<Seq<Int>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<Seq<Int>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<Seq<Int>>)) (!
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
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Seq<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (i Int) (v Seq<Seq<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (i Int) (v Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (t Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (t Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (t Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (t Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<Seq<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Seq<Seq<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (x Seq<Seq<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<Seq<Int>>>) (s1 Seq<Seq<Seq<Int>>>)) (!
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
(assert (forall ((a Seq<Seq<Seq<Int>>>) (b Seq<Seq<Seq<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<Seq<Int>>) (y Seq<Seq<Int>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<Seq<Int>>>)) 0))
(assert (forall ((s Seq<Set<Seq<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<Seq<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<Seq<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Seq<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Set<Seq<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<Seq<Int>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<Seq<Int>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<Seq<Int>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Seq<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Seq<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Seq<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (i Int) (v Set<Seq<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (i Int) (v Set<Seq<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (t Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (t Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (t Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (t Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<Seq<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Set<Seq<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (x Set<Seq<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (x Set<Seq<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<Seq<Int>>>) (s1 Seq<Set<Seq<Int>>>)) (!
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
(assert (forall ((a Seq<Set<Seq<Int>>>) (b Seq<Set<Seq<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<Seq<Int>>) (y Set<Seq<Int>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<$Perm>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<$Perm>>)) 0))
(assert (forall ((s Seq<Set<$Perm>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<$Perm>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<$Perm>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<$Perm>>)))
      (not (= s1 (as Seq_empty  Seq<Set<$Perm>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<$Perm>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<$Perm>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<$Perm>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<$Perm>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<$Perm>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<$Perm>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (i Int) (v Set<$Perm>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (i Int) (v Set<$Perm>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<$Perm>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<$Perm>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (t Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (t Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (t Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (t Seq<Set<$Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<$Perm>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Set<$Perm>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (x Set<$Perm>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (x Set<$Perm>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<$Perm>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<$Perm>>) (s1 Seq<Set<$Perm>>)) (!
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
(assert (forall ((a Seq<Set<$Perm>>) (b Seq<Set<$Perm>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<$Perm>) (y Set<$Perm>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)) 0))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<Option<Seq<Int>>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
      (not (= s1 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>)) (!
  (and
    (=>
      (= s0 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s1))
    (=>
      (= s1 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<Option<Seq<Int>>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (i Int) (v Set<Option<Seq<Int>>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (i Int) (v Set<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (t Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (t Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (t Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (t Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Set<Option<Seq<Int>>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Option<Seq<Int>>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<Option<Seq<Int>>>>) (s1 Seq<Set<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Seq<Set<Option<Seq<Int>>>>) (b Seq<Set<Option<Seq<Int>>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<Option<Seq<Int>>>) (y Set<Option<Seq<Int>>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Option<Option<Int>>>)) 0))
(assert (forall ((s Seq<Option<Option<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Option<Option<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Option<Option<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Option<Option<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>)) (!
  (and
    (=>
      (= s0 (as Seq_empty  Seq<Option<Option<Int>>>))
      (= (Seq_append s0 s1) s1))
    (=>
      (= s1 (as Seq_empty  Seq<Option<Option<Int>>>))
      (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Option<Option<Int>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (i Int) (v Option<Option<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (i Int) (v Option<Option<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (t Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (t Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (t Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (t Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Option<Option<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Option<Option<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (x Option<Option<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (x Option<Option<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Option<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Option<Option<Int>>>) (s1 Seq<Option<Option<Int>>>)) (!
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
(assert (forall ((a Seq<Option<Option<Int>>>) (b Seq<Option<Option<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Option<Option<Int>>) (y Option<Option<Int>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Seq<Int>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<Int>>)) 0))
(assert (forall ((s Seq<Seq<Int>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<Int>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<Int>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<Int>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<Int>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<Int>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int) (v Seq<Int>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int) (v Seq<Int>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Int>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Int>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (x Seq<Int>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<Int>>) (x Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
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
(assert (forall ((a Seq<Seq<Int>>) (b Seq<Seq<Int>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<Int>) (y Seq<Int>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<Option<Int>>>)) 0))
(assert (forall ((s Seq<Seq<Option<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<Option<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<Option<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<Option<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<Option<Int>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<Option<Int>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<Option<Int>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (i Int) (v Seq<Option<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (i Int) (v Seq<Option<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (t Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (t Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (t Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (t Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<Option<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Seq<Option<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (x Seq<Option<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (x Seq<Option<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Option<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<Option<Int>>>) (s1 Seq<Seq<Option<Int>>>)) (!
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
(assert (forall ((a Seq<Seq<Option<Int>>>) (b Seq<Seq<Option<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<Option<Int>>) (y Seq<Option<Int>>)) (!
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
(assert (forall ((s Seq<Seq<$Perm>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<$Perm>>)) 0))
(assert (forall ((s Seq<Seq<$Perm>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<$Perm>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<$Perm>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<$Perm>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<$Perm>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<$Perm>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<$Perm>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<$Perm>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<$Perm>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<$Perm>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<$Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<$Perm>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (i Int) (v Seq<$Perm>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (i Int) (v Seq<$Perm>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<$Perm>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<$Perm>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (t Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (t Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (t Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (t Seq<Seq<$Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<$Perm>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Seq<$Perm>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (x Seq<$Perm>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (x Seq<$Perm>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<$Perm>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<$Perm>>) (s1 Seq<Seq<$Perm>>)) (!
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
(assert (forall ((a Seq<Seq<$Perm>>) (b Seq<Seq<$Perm>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<$Perm>) (y Seq<$Perm>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)) 0))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Option<Option<Seq<Int>>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
      (not (= s1 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>)) (!
  (and
    (=>
      (= s0 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s1))
    (=>
      (= s1 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Option<Option<Seq<Int>>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (i Int) (v Option<Option<Seq<Int>>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (i Int) (v Option<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (t Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (t Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (t Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (t Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Option<Option<Seq<Int>>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Option<Seq<Int>>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Option<Option<Seq<Int>>>>) (s1 Seq<Option<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Seq<Option<Option<Seq<Int>>>>) (b Seq<Option<Option<Seq<Int>>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Option<Option<Seq<Int>>>) (y Option<Option<Seq<Int>>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Option<Int>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Option<Int>>)) 0))
(assert (forall ((s Seq<Option<Int>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Option<Int>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Option<Int>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Int>>)))
      (not (= s1 (as Seq_empty  Seq<Option<Int>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Option<Int>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Option<Int>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Option<Int>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Int>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Int>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Int>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Option<Int>>) (i Int) (v Option<Int>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Int>>) (i Int) (v Option<Int>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Int>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Int>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Int>>) (t Seq<Option<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Int>>) (t Seq<Option<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Int>>) (t Seq<Option<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Int>>) (t Seq<Option<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Option<Int>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Option<Int>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Int>>) (x Option<Int>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Option<Int>>) (x Option<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Option<Int>>) (s1 Seq<Option<Int>>)) (!
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
(assert (forall ((a Seq<Option<Int>>) (b Seq<Option<Int>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Option<Int>) (y Option<Int>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Option<Seq<Int>>>)) 0))
(assert (forall ((s Seq<Option<Seq<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Option<Seq<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Option<Seq<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Seq<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Option<Seq<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Option<Seq<Int>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Option<Seq<Int>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Option<Seq<Int>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Seq<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Seq<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Seq<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Seq<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (i Int) (v Option<Seq<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (i Int) (v Option<Seq<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (t Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (t Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (t Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (t Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Option<Seq<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Option<Seq<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (x Option<Seq<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (x Option<Seq<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Option<Seq<Int>>>) (s1 Seq<Option<Seq<Int>>>)) (!
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
(assert (forall ((a Seq<Option<Seq<Int>>>) (b Seq<Option<Seq<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Option<Seq<Int>>) (y Option<Seq<Int>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Option<Perm>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Option<Perm>>)) 0))
(assert (forall ((s Seq<Option<Perm>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Option<Perm>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Option<Perm>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Perm>>)))
      (not (= s1 (as Seq_empty  Seq<Option<Perm>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Option<Perm>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Option<Perm>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Option<Perm>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Perm>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Perm>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Option<Perm>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Option<Perm>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Option<Perm>>) (i Int) (v Option<Perm>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Perm>>) (i Int) (v Option<Perm>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Perm>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
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
(assert (forall ((s Seq<Option<Perm>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Perm>>) (t Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (t Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (t Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (t Seq<Option<Perm>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Option<Perm>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Option<Perm>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Option<Perm>>) (x Option<Perm>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Option<Perm>>) (x Option<Perm>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Option<Perm>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Option<Perm>>) (s1 Seq<Option<Perm>>)) (!
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
(assert (forall ((a Seq<Option<Perm>>) (b Seq<Option<Perm>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Option<Perm>) (y Option<Perm>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)) 0))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<Option<Seq<Int>>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>)) (!
  (and
    (=>
      (= s0 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s1))
    (=>
      (= s1 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>))
      (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<Option<Seq<Int>>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (i Int) (v Seq<Option<Seq<Int>>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (i Int) (v Seq<Option<Seq<Int>>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (t Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (t Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (t Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (t Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Seq<Option<Seq<Int>>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Option<Seq<Int>>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<Option<Seq<Int>>>>) (s1 Seq<Seq<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Seq<Seq<Option<Seq<Int>>>>) (b Seq<Seq<Option<Seq<Int>>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<Option<Seq<Int>>>) (y Seq<Option<Seq<Int>>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<Int>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<Int>>)) 0))
(assert (forall ((s Seq<Set<Int>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<Int>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<Int>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Int>>)))
      (not (= s1 (as Seq_empty  Seq<Set<Int>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<Int>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<Int>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<Int>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Int>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Int>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Int>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<Int>>) (i Int) (v Set<Int>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Int>>) (i Int) (v Set<Int>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Int>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Int>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Int>>) (t Seq<Set<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Int>>) (t Seq<Set<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Int>>) (t Seq<Set<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Int>>) (t Seq<Set<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<Int>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Set<Int>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Int>>) (x Set<Int>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<Int>>) (x Set<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<Int>>) (s1 Seq<Set<Int>>)) (!
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
(assert (forall ((a Seq<Set<Int>>) (b Seq<Set<Int>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<Int>) (y Set<Int>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<$Perm>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Perm>)) 0))
(assert (forall ((s Seq<$Perm>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Perm>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Perm)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Perm>)))
      (not (= s1 (as Seq_empty  Seq<$Perm>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Perm>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Perm>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Perm)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Perm>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Perm>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Perm>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Perm>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Perm>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Perm>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Perm>) (i Int) (v $Perm)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Perm>) (i Int) (v $Perm) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
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
(assert (forall ((s Seq<$Perm>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
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
(assert (forall ((s Seq<$Perm>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Perm>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Perm>) (t Seq<$Perm>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Perm>) (t Seq<$Perm>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Perm>) (t Seq<$Perm>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Perm>) (t Seq<$Perm>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Perm>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Perm>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Perm>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Perm>) (x $Perm)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Perm>) (x $Perm) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Perm>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Perm>) (s1 Seq<$Perm>)) (!
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
(assert (forall ((a Seq<$Perm>) (b Seq<$Perm>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Perm) (y $Perm)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Set<Option<Int>>>)) 0))
(assert (forall ((s Seq<Set<Option<Int>>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Set<Option<Int>>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Set<Option<Int>>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Int>>>)))
      (not (= s1 (as Seq_empty  Seq<Set<Option<Int>>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Set<Option<Int>>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Set<Option<Int>>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Set<Option<Int>>)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Int>>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Int>>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Set<Option<Int>>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Set<Option<Int>>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (i Int) (v Set<Option<Int>>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (i Int) (v Set<Option<Int>>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
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
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (t Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (t Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (t Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (t Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Set<Option<Int>>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (n Int)) (!
  (=>
    (>= n (Seq_length s))
    (= (Seq_drop s n) (as Seq_empty  Seq<Set<Option<Int>>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (x Set<Option<Int>>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (x Set<Option<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Set<Option<Int>>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Set<Option<Int>>>) (s1 Seq<Set<Option<Int>>>)) (!
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
(assert (forall ((a Seq<Set<Option<Int>>>) (b Seq<Set<Option<Int>>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Set<Option<Int>>) (y Set<Option<Int>>)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Set<Set<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<Int>)) (!
  (not (Set_in o (as Set_empty  Set<Set<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<Int>>)))
  )))
(assert (forall ((s Set<Set<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<Int>) (o Set<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>) (o Set<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>) (y Set<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
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
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
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
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Option<Option<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Option<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Option<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Option<Int>>>)))
  )))
(assert (forall ((s Set<Option<Option<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Option<Int>>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((x Option<Option<Int>>)) 
        (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Option<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Option<Int>>) (o Option<Option<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Option<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (x Option<Option<Int>>) (o Option<Option<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (x Option<Option<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (x Option<Option<Int>>) (y Option<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (x Option<Option<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (x Option<Option<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (o Option<Option<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (y Option<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (y Option<Option<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (o Option<Option<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (o Option<Option<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>) (y Option<Option<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
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
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Option<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
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
(assert (forall ((a Set<Option<Option<Int>>>) (b Set<Option<Option<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<$Perm>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<$Perm>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<$Perm>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<$Perm>>)))
  )))
(assert (forall ((s Set<Seq<$Perm>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Perm>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<$Perm>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<$Perm>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<$Perm>) (o Seq<$Perm>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<$Perm>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (x Seq<$Perm>) (o Seq<$Perm>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (x Seq<$Perm>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (x Seq<$Perm>) (y Seq<$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (x Seq<$Perm>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (x Seq<$Perm>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (o Seq<$Perm>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (y Seq<$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (y Seq<$Perm>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (o Seq<$Perm>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (o Seq<$Perm>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>) (y Seq<$Perm>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
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
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<$Perm>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
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
(assert (forall ((a Set<Seq<$Perm>>) (b Set<Seq<$Perm>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Option<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Int>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Int>>)))
  )))
(assert (forall ((s Set<Option<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Option<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Int>) (o Option<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Int>>) (x Option<Int>) (o Option<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Int>>) (x Option<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Int>>) (x Option<Int>) (y Option<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Int>>) (x Option<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Int>>) (x Option<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (o Option<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (y Option<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (y Option<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (o Option<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (o Option<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>) (y Option<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
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
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
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
(assert (forall ((a Set<Option<Int>>) (b Set<Option<Int>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Set<Option<Seq<Int>>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<Option<Seq<Int>>>)) (!
  (not (Set_in o (as Set_empty  Set<Set<Option<Seq<Int>>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<Option<Seq<Int>>>>)))
  )))
(assert (forall ((s Set<Set<Option<Seq<Int>>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<Option<Seq<Int>>>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((x Set<Option<Seq<Int>>>)) 
        (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<Option<Seq<Int>>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<Option<Seq<Int>>>) (o Set<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<Option<Seq<Int>>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>) (o Set<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>) (y Set<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (x Set<Option<Seq<Int>>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (o Set<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (y Set<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (y Set<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (o Set<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (o Set<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>) (y Set<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<Option<Seq<Int>>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Set<Option<Seq<Int>>>>) (b Set<Set<Option<Seq<Int>>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Int>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Int>>)))
  )))
(assert (forall ((s Set<Seq<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Int>) (o Seq<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>) (o Seq<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>) (y Seq<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (x Seq<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (o Seq<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>) (y Seq<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
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
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
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
(assert (forall ((a Set<Seq<Int>>) (b Set<Seq<Int>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Set<$Perm>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<$Perm>)) (!
  (not (Set_in o (as Set_empty  Set<Set<$Perm>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<$Perm>>)))
  )))
(assert (forall ((s Set<Set<$Perm>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<$Perm>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<$Perm>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<$Perm>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<$Perm>) (o Set<$Perm>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<$Perm>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (x Set<$Perm>) (o Set<$Perm>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (x Set<$Perm>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<$Perm>>) (x Set<$Perm>) (y Set<$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Perm>>) (x Set<$Perm>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (x Set<$Perm>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (o Set<$Perm>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (y Set<$Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (y Set<$Perm>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (o Set<$Perm>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (o Set<$Perm>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>) (y Set<$Perm>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
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
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<$Perm>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
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
(assert (forall ((a Set<Set<$Perm>>) (b Set<Set<$Perm>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<Option<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Option<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Option<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Option<Int>>>)))
  )))
(assert (forall ((s Set<Seq<Option<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Option<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<Option<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Option<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Option<Int>>) (o Seq<Option<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Option<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (x Seq<Option<Int>>) (o Seq<Option<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (x Seq<Option<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (x Seq<Option<Int>>) (y Seq<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (x Seq<Option<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (x Seq<Option<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (o Seq<Option<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (y Seq<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (y Seq<Option<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (o Seq<Option<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (o Seq<Option<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>) (y Seq<Option<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Option<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Option<Int>>>) (b Set<Seq<Option<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Option<Option<Seq<Int>>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Option<Seq<Int>>>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Option<Seq<Int>>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Option<Seq<Int>>>>)))
  )))
(assert (forall ((s Set<Option<Option<Seq<Int>>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Option<Seq<Int>>>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((x Option<Option<Seq<Int>>>)) 
        (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Option<Seq<Int>>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Option<Seq<Int>>>) (o Option<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Option<Seq<Int>>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>) (o Option<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>) (y Option<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (x Option<Option<Seq<Int>>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (o Option<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (y Option<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (y Option<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (o Option<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (o Option<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>) (y Option<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Option<Seq<Int>>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Option<Option<Seq<Int>>>>) (b Set<Option<Option<Seq<Int>>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Perm>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Perm)) (!
  (not (Set_in o (as Set_empty  Set<$Perm>)))
  :pattern ((Set_in o (as Set_empty  Set<$Perm>)))
  )))
(assert (forall ((s Set<$Perm>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Perm>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Perm))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Perm)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Perm) (o $Perm)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Perm)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (o $Perm)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (x $Perm)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (o $Perm)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>) (y $Perm)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Perm)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
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
(assert (forall ((a Set<$Perm>) (b Set<$Perm>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Set<Option<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<Option<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Set<Option<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<Option<Int>>>)))
  )))
(assert (forall ((s Set<Set<Option<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<Option<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<Option<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<Option<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<Option<Int>>) (o Set<Option<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<Option<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (x Set<Option<Int>>) (o Set<Option<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (x Set<Option<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (x Set<Option<Int>>) (y Set<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (x Set<Option<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (x Set<Option<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (o Set<Option<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (y Set<Option<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (y Set<Option<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (o Set<Option<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (o Set<Option<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>) (y Set<Option<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
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
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<Option<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
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
(assert (forall ((a Set<Set<Option<Int>>>) (b Set<Set<Option<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<Option<Seq<Int>>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Option<Seq<Int>>>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Option<Seq<Int>>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Option<Seq<Int>>>>)))
  )))
(assert (forall ((s Set<Seq<Option<Seq<Int>>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Option<Seq<Int>>>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((x Seq<Option<Seq<Int>>>)) 
        (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Option<Seq<Int>>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Option<Seq<Int>>>) (o Seq<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Option<Seq<Int>>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>) (o Seq<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>) (y Seq<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (x Seq<Option<Seq<Int>>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (o Seq<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (y Seq<Option<Seq<Int>>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (y Seq<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (o Seq<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (o Seq<Option<Seq<Int>>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>) (y Seq<Option<Seq<Int>>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Option<Seq<Int>>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
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
(assert (forall ((a Set<Seq<Option<Seq<Int>>>>) (b Set<Seq<Option<Seq<Int>>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
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
(assert (forall ((s Set<Option<Seq<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Seq<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Seq<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Seq<Int>>>)))
  )))
(assert (forall ((s Set<Option<Seq<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Seq<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Option<Seq<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Seq<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Seq<Int>>) (o Option<Seq<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Seq<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (x Option<Seq<Int>>) (o Option<Seq<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (x Option<Seq<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (x Option<Seq<Int>>) (y Option<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (x Option<Seq<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (x Option<Seq<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (o Option<Seq<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (y Option<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (y Option<Seq<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (o Option<Seq<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (o Option<Seq<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>) (y Option<Seq<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Seq<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Option<Seq<Int>>>) (b Set<Option<Seq<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<Seq<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Seq<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Seq<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Seq<Int>>>)))
  )))
(assert (forall ((s Set<Seq<Seq<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Seq<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<Seq<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Seq<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Seq<Int>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Seq<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Seq<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Set<Seq<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<Seq<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Set<Seq<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<Seq<Int>>>)))
  )))
(assert (forall ((s Set<Set<Seq<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<Seq<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<Seq<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<Seq<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<Seq<Int>>) (o Set<Seq<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<Seq<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (x Set<Seq<Int>>) (o Set<Seq<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (x Set<Seq<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (x Set<Seq<Int>>) (y Set<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (x Set<Seq<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (x Set<Seq<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (o Set<Seq<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (y Set<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (y Set<Seq<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (o Set<Seq<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (o Set<Seq<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>) (y Set<Seq<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<Seq<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Set<Seq<Int>>>) (b Set<Set<Seq<Int>>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Option<Perm>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Option<Perm>)) (!
  (not (Set_in o (as Set_empty  Set<Option<Perm>>)))
  :pattern ((Set_in o (as Set_empty  Set<Option<Perm>>)))
  )))
(assert (forall ((s Set<Option<Perm>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Option<Perm>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Option<Perm>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Option<Perm>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Option<Perm>) (o Option<Perm>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Option<Perm>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Option<Perm>>) (x Option<Perm>) (o Option<Perm>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Perm>>) (x Option<Perm>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Option<Perm>>) (x Option<Perm>) (y Option<Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Perm>>) (x Option<Perm>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Perm>>) (x Option<Perm>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (o Option<Perm>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (y Option<Perm>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (y Option<Perm>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (o Option<Perm>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (o Option<Perm>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>) (y Option<Perm>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
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
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Option<Perm>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
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
(assert (forall ((a Set<Option<Perm>>) (b Set<Option<Perm>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((value Option<Perm>)) (!
  (= value (get_Option_value<Option<Perm>> (Some<Option<Option<Perm>>> value)))
  :pattern ((Some<Option<Option<Perm>>> value))
  )))
(assert (forall ((value Option<Perm>)) (!
  (= (Option_tag<Int> (Some<Option<Option<Perm>>> value)) 1)
  :pattern ((Some<Option<Option<Perm>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Option<Perm>>>  Option<Option<Perm>>)) 0))
(assert (forall ((t Option<Option<Perm>>)) (!
  (or
    (= t (Some<Option<Option<Perm>>> (get_Option_value<Option<Perm>> t)))
    (= t (as None<Option<Option<Perm>>>  Option<Option<Perm>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((o1 $Perm) (o2 $Perm)) (!
  (= (add<Perm> o1 o2) (+ o1 o2))
  :pattern ((add<Perm> o1 o2))
  )))
(assert (forall ((o1 Int) (o2 Int)) (!
  (= (add<Int> o1 o2) (+ o1 o2))
  :pattern ((add<Int> o1 o2))
  )))
(assert (forall ((value Set<$Perm>)) (!
  (Set_equal value (get_Option_value<Set<Perm>> (Some<Option<Set<Perm>>> value)))
  :pattern ((Some<Option<Set<Perm>>> value))
  )))
(assert (forall ((value Set<$Perm>)) (!
  (= (Option_tag<Int> (Some<Option<Set<Perm>>> value)) 1)
  :pattern ((Some<Option<Set<Perm>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Set<Perm>>>  Option<Set<Perm>>)) 0))
(assert (forall ((t Option<Set<Perm>>)) (!
  (or
    (= t (Some<Option<Set<Perm>>> (get_Option_value<Set<Perm>> t)))
    (= t (as None<Option<Set<Perm>>>  Option<Set<Perm>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Int)) (!
  (= value (get_Option_value<Int> (Some<Option<Int>> value)))
  :pattern ((Some<Option<Int>> value))
  )))
(assert (forall ((value Int)) (!
  (= (Option_tag<Int> (Some<Option<Int>> value)) 1)
  :pattern ((Some<Option<Int>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Int>>  Option<Int>)) 0))
(assert (forall ((t Option<Int>)) (!
  (or
    (= t (Some<Option<Int>> (get_Option_value<Int> t)))
    (= t (as None<Option<Int>>  Option<Int>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((o1 Seq<Option<Int>>) (o2 Seq<Option<Int>>)) (!
  (Seq_equal (add<Seq<Option<Int>>> o1 o2) (Seq_append o1 o2))
  :pattern ((add<Seq<Option<Int>>> o1 o2))
  )))
(assert (forall ((o1 Set<Option<Int>>) (o2 Set<Option<Int>>)) (!
  (Set_equal (add<Set<Option<Int>>> o1 o2) (Set_union o1 o2))
  :pattern ((add<Set<Option<Int>>> o1 o2))
  )))
(assert (forall ((o1 Option<Option<Int>>) (o2 Option<Option<Int>>)) (!
  (=
    (add<Option<Option<Int>>> o1 o2)
    (ite
      (and (= (Option_tag<Int> o1) 1) (= (Option_tag<Int> o2) 1))
      (Some<Option<Option<Int>>> (add<Option<Int>> (get_Option_value<Option<Int>> o1) (get_Option_value<Option<Int>> o2)))
      (as None<Option<Option<Int>>>  Option<Option<Int>>)))
  :pattern ((add<Option<Option<Int>>> o1 o2))
  )))
(assert (forall ((value Set<Int>)) (!
  (Set_equal value (get_Option_value<Set<Int>> (Some<Option<Set<Int>>> value)))
  :pattern ((Some<Option<Set<Int>>> value))
  )))
(assert (forall ((value Set<Int>)) (!
  (= (Option_tag<Int> (Some<Option<Set<Int>>> value)) 1)
  :pattern ((Some<Option<Set<Int>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Set<Int>>>  Option<Set<Int>>)) 0))
(assert (forall ((t Option<Set<Int>>)) (!
  (or
    (= t (Some<Option<Set<Int>>> (get_Option_value<Set<Int>> t)))
    (= t (as None<Option<Set<Int>>>  Option<Set<Int>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Option<Option<Seq<Int>>>)) (!
  (=
    value
    (get_Option_value<Option<Option<Seq<Int>>>> (Some<Option<Option<Option<Seq<Int>>>>> value)))
  :pattern ((Some<Option<Option<Option<Seq<Int>>>>> value))
  )))
(assert (forall ((value Option<Option<Seq<Int>>>)) (!
  (= (Option_tag<Int> (Some<Option<Option<Option<Seq<Int>>>>> value)) 1)
  :pattern ((Some<Option<Option<Option<Seq<Int>>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Option<Option<Seq<Int>>>>>  Option<Option<Option<Seq<Int>>>>))
  0))
(assert (forall ((t Option<Option<Option<Seq<Int>>>>)) (!
  (or
    (=
      t
      (Some<Option<Option<Option<Seq<Int>>>>> (get_Option_value<Option<Option<Seq<Int>>>> t)))
    (=
      t
      (as None<Option<Option<Option<Seq<Int>>>>>  Option<Option<Option<Seq<Int>>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((o1 Seq<Int>) (o2 Seq<Int>)) (!
  (Seq_equal (add<Seq<Int>> o1 o2) (Seq_append o1 o2))
  :pattern ((add<Seq<Int>> o1 o2))
  )))
(assert (forall ((o1 Set<Int>) (o2 Set<Int>)) (!
  (Set_equal (add<Set<Int>> o1 o2) (Set_union o1 o2))
  :pattern ((add<Set<Int>> o1 o2))
  )))
(assert (forall ((o1 Option<Int>) (o2 Option<Int>)) (!
  (=
    (add<Option<Int>> o1 o2)
    (ite
      (and (= (Option_tag<Int> o1) 1) (= (Option_tag<Int> o2) 1))
      (Some<Option<Int>> (add<Int> (get_Option_value<Int> o1) (get_Option_value<Int> o2)))
      (as None<Option<Int>>  Option<Int>)))
  :pattern ((add<Option<Int>> o1 o2))
  )))
(assert (forall ((value Seq<Option<Seq<Int>>>)) (!
  (Seq_equal
    value
    (get_Option_value<Seq<Option<Seq<Int>>>> (Some<Option<Seq<Option<Seq<Int>>>>> value)))
  :pattern ((Some<Option<Seq<Option<Seq<Int>>>>> value))
  )))
(assert (forall ((value Seq<Option<Seq<Int>>>)) (!
  (= (Option_tag<Int> (Some<Option<Seq<Option<Seq<Int>>>>> value)) 1)
  :pattern ((Some<Option<Seq<Option<Seq<Int>>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Seq<Option<Seq<Int>>>>>  Option<Seq<Option<Seq<Int>>>>))
  0))
(assert (forall ((t Option<Seq<Option<Seq<Int>>>>)) (!
  (or
    (=
      t
      (Some<Option<Seq<Option<Seq<Int>>>>> (get_Option_value<Seq<Option<Seq<Int>>>> t)))
    (= t (as None<Option<Seq<Option<Seq<Int>>>>>  Option<Seq<Option<Seq<Int>>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Set<Option<Int>>)) (!
  (Set_equal value (get_Option_value<Set<Option<Int>>> (Some<Option<Set<Option<Int>>>> value)))
  :pattern ((Some<Option<Set<Option<Int>>>> value))
  )))
(assert (forall ((value Set<Option<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Set<Option<Int>>>> value)) 1)
  :pattern ((Some<Option<Set<Option<Int>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Set<Option<Int>>>>  Option<Set<Option<Int>>>))
  0))
(assert (forall ((t Option<Set<Option<Int>>>)) (!
  (or
    (= t (Some<Option<Set<Option<Int>>>> (get_Option_value<Set<Option<Int>>> t)))
    (= t (as None<Option<Set<Option<Int>>>>  Option<Set<Option<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Set<Seq<Int>>)) (!
  (Set_equal value (get_Option_value<Set<Seq<Int>>> (Some<Option<Set<Seq<Int>>>> value)))
  :pattern ((Some<Option<Set<Seq<Int>>>> value))
  )))
(assert (forall ((value Set<Seq<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Set<Seq<Int>>>> value)) 1)
  :pattern ((Some<Option<Set<Seq<Int>>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Set<Seq<Int>>>>  Option<Set<Seq<Int>>>)) 0))
(assert (forall ((t Option<Set<Seq<Int>>>)) (!
  (or
    (= t (Some<Option<Set<Seq<Int>>>> (get_Option_value<Set<Seq<Int>>> t)))
    (= t (as None<Option<Set<Seq<Int>>>>  Option<Set<Seq<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Option<Option<Int>>)) (!
  (=
    value
    (get_Option_value<Option<Option<Int>>> (Some<Option<Option<Option<Int>>>> value)))
  :pattern ((Some<Option<Option<Option<Int>>>> value))
  )))
(assert (forall ((value Option<Option<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Option<Option<Int>>>> value)) 1)
  :pattern ((Some<Option<Option<Option<Int>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Option<Option<Int>>>>  Option<Option<Option<Int>>>))
  0))
(assert (forall ((t Option<Option<Option<Int>>>)) (!
  (or
    (=
      t
      (Some<Option<Option<Option<Int>>>> (get_Option_value<Option<Option<Int>>> t)))
    (= t (as None<Option<Option<Option<Int>>>>  Option<Option<Option<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Seq<$Perm>)) (!
  (Seq_equal value (get_Option_value<Seq<Perm>> (Some<Option<Seq<Perm>>> value)))
  :pattern ((Some<Option<Seq<Perm>>> value))
  )))
(assert (forall ((value Seq<$Perm>)) (!
  (= (Option_tag<Int> (Some<Option<Seq<Perm>>> value)) 1)
  :pattern ((Some<Option<Seq<Perm>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Seq<Perm>>>  Option<Seq<Perm>>)) 0))
(assert (forall ((t Option<Seq<Perm>>)) (!
  (or
    (= t (Some<Option<Seq<Perm>>> (get_Option_value<Seq<Perm>> t)))
    (= t (as None<Option<Seq<Perm>>>  Option<Seq<Perm>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Seq<Int>)) (!
  (Seq_equal value (get_Option_value<Seq<Int>> (Some<Option<Seq<Int>>> value)))
  :pattern ((Some<Option<Seq<Int>>> value))
  )))
(assert (forall ((value Seq<Int>)) (!
  (= (Option_tag<Int> (Some<Option<Seq<Int>>> value)) 1)
  :pattern ((Some<Option<Seq<Int>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Seq<Int>>>  Option<Seq<Int>>)) 0))
(assert (forall ((t Option<Seq<Int>>)) (!
  (or
    (= t (Some<Option<Seq<Int>>> (get_Option_value<Seq<Int>> t)))
    (= t (as None<Option<Seq<Int>>>  Option<Seq<Int>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((o1 Seq<$Perm>) (o2 Seq<$Perm>)) (!
  (Seq_equal (add<Seq<Perm>> o1 o2) (Seq_append o1 o2))
  :pattern ((add<Seq<Perm>> o1 o2))
  )))
(assert (forall ((o1 Set<$Perm>) (o2 Set<$Perm>)) (!
  (Set_equal (add<Set<Perm>> o1 o2) (Set_union o1 o2))
  :pattern ((add<Set<Perm>> o1 o2))
  )))
(assert (forall ((o1 Option<Perm>) (o2 Option<Perm>)) (!
  (=
    (add<Option<Perm>> o1 o2)
    (ite
      (and (= (Option_tag<Int> o1) 1) (= (Option_tag<Int> o2) 1))
      (Some<Option<Perm>> (add<Perm> (get_Option_value<Perm> o1) (get_Option_value<Perm> o2)))
      (as None<Option<Perm>>  Option<Perm>)))
  :pattern ((add<Option<Perm>> o1 o2))
  )))
(assert (forall ((value Seq<Option<Int>>)) (!
  (Seq_equal
    value
    (get_Option_value<Seq<Option<Int>>> (Some<Option<Seq<Option<Int>>>> value)))
  :pattern ((Some<Option<Seq<Option<Int>>>> value))
  )))
(assert (forall ((value Seq<Option<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Seq<Option<Int>>>> value)) 1)
  :pattern ((Some<Option<Seq<Option<Int>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Seq<Option<Int>>>>  Option<Seq<Option<Int>>>))
  0))
(assert (forall ((t Option<Seq<Option<Int>>>)) (!
  (or
    (= t (Some<Option<Seq<Option<Int>>>> (get_Option_value<Seq<Option<Int>>> t)))
    (= t (as None<Option<Seq<Option<Int>>>>  Option<Seq<Option<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Option<Seq<Int>>)) (!
  (=
    value
    (get_Option_value<Option<Seq<Int>>> (Some<Option<Option<Seq<Int>>>> value)))
  :pattern ((Some<Option<Option<Seq<Int>>>> value))
  )))
(assert (forall ((value Option<Seq<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Option<Seq<Int>>>> value)) 1)
  :pattern ((Some<Option<Option<Seq<Int>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Option<Seq<Int>>>>  Option<Option<Seq<Int>>>))
  0))
(assert (forall ((t Option<Option<Seq<Int>>>)) (!
  (or
    (= t (Some<Option<Option<Seq<Int>>>> (get_Option_value<Option<Seq<Int>>> t)))
    (= t (as None<Option<Option<Seq<Int>>>>  Option<Option<Seq<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Set<Option<Seq<Int>>>)) (!
  (Set_equal value (get_Option_value<Set<Option<Seq<Int>>>> (Some<Option<Set<Option<Seq<Int>>>>> value)))
  :pattern ((Some<Option<Set<Option<Seq<Int>>>>> value))
  )))
(assert (forall ((value Set<Option<Seq<Int>>>)) (!
  (= (Option_tag<Int> (Some<Option<Set<Option<Seq<Int>>>>> value)) 1)
  :pattern ((Some<Option<Set<Option<Seq<Int>>>>> value))
  )))
(assert (=
  (Option_tag<Int> (as None<Option<Set<Option<Seq<Int>>>>>  Option<Set<Option<Seq<Int>>>>))
  0))
(assert (forall ((t Option<Set<Option<Seq<Int>>>>)) (!
  (or
    (=
      t
      (Some<Option<Set<Option<Seq<Int>>>>> (get_Option_value<Set<Option<Seq<Int>>>> t)))
    (= t (as None<Option<Set<Option<Seq<Int>>>>>  Option<Set<Option<Seq<Int>>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value $Perm)) (!
  (= value (get_Option_value<Perm> (Some<Option<Perm>> value)))
  :pattern ((Some<Option<Perm>> value))
  )))
(assert (forall ((value $Perm)) (!
  (= (Option_tag<Int> (Some<Option<Perm>> value)) 1)
  :pattern ((Some<Option<Perm>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Perm>>  Option<Perm>)) 0))
(assert (forall ((t Option<Perm>)) (!
  (or
    (= t (Some<Option<Perm>> (get_Option_value<Perm> t)))
    (= t (as None<Option<Perm>>  Option<Perm>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Seq<Seq<Int>>)) (!
  (Seq_equal
    value
    (get_Option_value<Seq<Seq<Int>>> (Some<Option<Seq<Seq<Int>>>> value)))
  :pattern ((Some<Option<Seq<Seq<Int>>>> value))
  )))
(assert (forall ((value Seq<Seq<Int>>)) (!
  (= (Option_tag<Int> (Some<Option<Seq<Seq<Int>>>> value)) 1)
  :pattern ((Some<Option<Seq<Seq<Int>>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Seq<Seq<Int>>>>  Option<Seq<Seq<Int>>>)) 0))
(assert (forall ((t Option<Seq<Seq<Int>>>)) (!
  (or
    (= t (Some<Option<Seq<Seq<Int>>>> (get_Option_value<Seq<Seq<Int>>> t)))
    (= t (as None<Option<Seq<Seq<Int>>>>  Option<Seq<Seq<Int>>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((value Option<Int>)) (!
  (= value (get_Option_value<Option<Int>> (Some<Option<Option<Int>>> value)))
  :pattern ((Some<Option<Option<Int>>> value))
  )))
(assert (forall ((value Option<Int>)) (!
  (= (Option_tag<Int> (Some<Option<Option<Int>>> value)) 1)
  :pattern ((Some<Option<Option<Int>>> value))
  )))
(assert (= (Option_tag<Int> (as None<Option<Option<Int>>>  Option<Option<Int>>)) 0))
(assert (forall ((t Option<Option<Int>>)) (!
  (or
    (= t (Some<Option<Option<Int>>> (get_Option_value<Option<Int>> t)))
    (= t (as None<Option<Option<Int>>>  Option<Option<Int>>)))
  :pattern ((Option_tag<Int> t))
  )))
(assert (forall ((o1 Seq<Option<Seq<Int>>>) (o2 Seq<Option<Seq<Int>>>)) (!
  (Seq_equal (add<Seq<Option<Seq<Int>>>> o1 o2) (Seq_append o1 o2))
  :pattern ((add<Seq<Option<Seq<Int>>>> o1 o2))
  )))
(assert (forall ((o1 Set<Option<Seq<Int>>>) (o2 Set<Option<Seq<Int>>>)) (!
  (Set_equal (add<Set<Option<Seq<Int>>>> o1 o2) (Set_union o1 o2))
  :pattern ((add<Set<Option<Seq<Int>>>> o1 o2))
  )))
(assert (forall ((o1 Option<Option<Seq<Int>>>) (o2 Option<Option<Seq<Int>>>)) (!
  (=
    (add<Option<Option<Seq<Int>>>> o1 o2)
    (ite
      (and (= (Option_tag<Int> o1) 1) (= (Option_tag<Int> o2) 1))
      (Some<Option<Option<Seq<Int>>>> (add<Option<Seq<Int>>> (get_Option_value<Option<Seq<Int>>> o1) (get_Option_value<Option<Seq<Int>>> o2)))
      (as None<Option<Option<Seq<Int>>>>  Option<Option<Seq<Int>>>)))
  :pattern ((add<Option<Option<Seq<Int>>>> o1 o2))
  )))
(assert (forall ((o1 Seq<Seq<Int>>) (o2 Seq<Seq<Int>>)) (!
  (Seq_equal (add<Seq<Seq<Int>>> o1 o2) (Seq_append o1 o2))
  :pattern ((add<Seq<Seq<Int>>> o1 o2))
  )))
(assert (forall ((o1 Set<Seq<Int>>) (o2 Set<Seq<Int>>)) (!
  (Set_equal (add<Set<Seq<Int>>> o1 o2) (Set_union o1 o2))
  :pattern ((add<Set<Seq<Int>>> o1 o2))
  )))
(assert (forall ((o1 Option<Seq<Int>>) (o2 Option<Seq<Int>>)) (!
  (=
    (add<Option<Seq<Int>>> o1 o2)
    (ite
      (and (= (Option_tag<Int> o1) 1) (= (Option_tag<Int> o2) 1))
      (Some<Option<Seq<Int>>> (add<Seq<Int>> (get_Option_value<Seq<Int>> o1) (get_Option_value<Seq<Int>> o2)))
      (as None<Option<Seq<Int>>>  Option<Seq<Int>>)))
  :pattern ((add<Option<Seq<Int>>> o1 o2))
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
; ---------- request ----------
(declare-const arg@0@01 Int)
(declare-const res@1@01 Option<Int>)
(declare-const arg@2@01 Int)
(declare-const res@3@01 Option<Int>)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] arg > 0 ==> (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] arg > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> arg@2@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | arg@2@01 > 0 | live]
; [else-branch: 0 | !(arg@2@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | arg@2@01 > 0]
(assert (> arg@2@01 0))
; [eval] (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] (Option_tag(res): Int) == 1
; [eval] (Option_tag(res): Int)
(push) ; 5
; [then-branch: 1 | Option_tag[Int](res@3@01) != 1 | live]
; [else-branch: 1 | Option_tag[Int](res@3@01) == 1 | live]
(push) ; 6
; [then-branch: 1 | Option_tag[Int](res@3@01) != 1]
(assert (not (= (Option_tag<Int> res@3@01) 1)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | Option_tag[Int](res@3@01) == 1]
(assert (= (Option_tag<Int> res@3@01) 1))
; [eval] res == (Some(2 * arg): Option[Int])
; [eval] (Some(2 * arg): Option[Int])
; [eval] 2 * arg
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (= (Option_tag<Int> res@3@01) 1) (not (= (Option_tag<Int> res@3@01) 1))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(arg@2@01 > 0)]
(assert (not (> arg@2@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> arg@2@01 0)
  (and
    (> arg@2@01 0)
    (or (= (Option_tag<Int> res@3@01) 1) (not (= (Option_tag<Int> res@3@01) 1))))))
; Joined path conditions
(assert (or (not (> arg@2@01 0)) (> arg@2@01 0)))
(assert (=>
  (> arg@2@01 0)
  (and
    (= (Option_tag<Int> res@3@01) 1)
    (= res@3@01 (Some<Option<Int>> (* 2 arg@2@01))))))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] arg < 0 ==> (Option_tag(res): Int) == 0
; [eval] arg < 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< arg@2@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | arg@2@01 < 0 | live]
; [else-branch: 2 | !(arg@2@01 < 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | arg@2@01 < 0]
(assert (< arg@2@01 0))
; [eval] (Option_tag(res): Int) == 0
; [eval] (Option_tag(res): Int)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(arg@2@01 < 0)]
(assert (not (< arg@2@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< arg@2@01 0)) (< arg@2@01 0)))
(assert (=> (< arg@2@01 0) (= (Option_tag<Int> res@3@01) 0)))
(pop) ; 2
(push) ; 2
; [eval] arg > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> arg@2@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | arg@2@01 > 0 | live]
; [else-branch: 3 | !(arg@2@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | arg@2@01 > 0]
(assert (> arg@2@01 0))
; [exec]
; res := (add((Some(arg): Option[Int]), (Some(arg): Option[Int])): Option[Int])
; [eval] (add((Some(arg): Option[Int]), (Some(arg): Option[Int])): Option[Int])
; [eval] (Some(arg): Option[Int])
; [eval] (Some(arg): Option[Int])
(declare-const res@5@01 Option<Int>)
(assert (=
  res@5@01
  (add<Option<Int>> (Some<Option<Int>> arg@2@01) (Some<Option<Int>> arg@2@01))))
; [eval] arg > 0 ==> (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] arg > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | arg@2@01 > 0 | live]
; [else-branch: 4 | !(arg@2@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | arg@2@01 > 0]
; [eval] (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] (Option_tag(res): Int) == 1
; [eval] (Option_tag(res): Int)
(push) ; 6
; [then-branch: 5 | Option_tag[Int](res@5@01) != 1 | live]
; [else-branch: 5 | Option_tag[Int](res@5@01) == 1 | live]
(push) ; 7
; [then-branch: 5 | Option_tag[Int](res@5@01) != 1]
(assert (not (= (Option_tag<Int> res@5@01) 1)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | Option_tag[Int](res@5@01) == 1]
(assert (= (Option_tag<Int> res@5@01) 1))
; [eval] res == (Some(2 * arg): Option[Int])
; [eval] (Some(2 * arg): Option[Int])
; [eval] 2 * arg
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= (Option_tag<Int> res@5@01) 1) (not (= (Option_tag<Int> res@5@01) 1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (> arg@2@01 0)
  (or (= (Option_tag<Int> res@5@01) 1) (not (= (Option_tag<Int> res@5@01) 1)))))
(push) ; 4
(assert (not (=>
  (> arg@2@01 0)
  (and
    (= (Option_tag<Int> res@5@01) 1)
    (= res@5@01 (Some<Option<Int>> (* 2 arg@2@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (> arg@2@01 0)
  (and
    (= (Option_tag<Int> res@5@01) 1)
    (= res@5@01 (Some<Option<Int>> (* 2 arg@2@01))))))
; [eval] arg < 0 ==> (Option_tag(res): Int) == 0
; [eval] arg < 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< arg@2@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | arg@2@01 < 0 | dead]
; [else-branch: 6 | !(arg@2@01 < 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 6 | !(arg@2@01 < 0)]
(assert (not (< arg@2@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (< arg@2@01 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(arg@2@01 > 0)]
(assert (not (> arg@2@01 0)))
(pop) ; 3
; [eval] !(arg > 0)
; [eval] arg > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> arg@2@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(arg@2@01 > 0) | live]
; [else-branch: 7 | arg@2@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(arg@2@01 > 0)]
(assert (not (> arg@2@01 0)))
; [exec]
; res := (None(): Option[Int])
; [eval] (None(): Option[Int])
(declare-const res@6@01 Option<Int>)
(assert (= res@6@01 (as None<Option<Int>>  Option<Int>)))
; [eval] arg > 0 ==> (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] arg > 0
(push) ; 4
; [then-branch: 8 | arg@2@01 > 0 | dead]
; [else-branch: 8 | !(arg@2@01 > 0) | live]
(push) ; 5
; [else-branch: 8 | !(arg@2@01 > 0)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] arg < 0 ==> (Option_tag(res): Int) == 0
; [eval] arg < 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< arg@2@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< arg@2@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | arg@2@01 < 0 | live]
; [else-branch: 9 | !(arg@2@01 < 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | arg@2@01 < 0]
(assert (< arg@2@01 0))
; [eval] (Option_tag(res): Int) == 0
; [eval] (Option_tag(res): Int)
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(arg@2@01 < 0)]
(assert (not (< arg@2@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< arg@2@01 0)) (< arg@2@01 0)))
(push) ; 4
(assert (not (=> (< arg@2@01 0) (= (Option_tag<Int> res@6@01) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (< arg@2@01 0) (= (Option_tag<Int> res@6@01) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | arg@2@01 > 0]
(assert (> arg@2@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- client ----------
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
; var response: Option[Int]
(declare-const response@7@01 Option<Int>)
; [exec]
; response := request(1)
(declare-const res@8@01 Option<Int>)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] arg > 0 ==> (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] arg > 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | True]
; [eval] (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] (Option_tag(res): Int) == 1
; [eval] (Option_tag(res): Int)
(push) ; 5
; [then-branch: 11 | Option_tag[Int](res@8@01) != 1 | live]
; [else-branch: 11 | Option_tag[Int](res@8@01) == 1 | live]
(push) ; 6
; [then-branch: 11 | Option_tag[Int](res@8@01) != 1]
(assert (not (= (Option_tag<Int> res@8@01) 1)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | Option_tag[Int](res@8@01) == 1]
(assert (= (Option_tag<Int> res@8@01) 1))
; [eval] res == (Some(2 * arg): Option[Int])
; [eval] (Some(2 * arg): Option[Int])
; [eval] 2 * arg
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (= (Option_tag<Int> res@8@01) 1) (not (= (Option_tag<Int> res@8@01) 1))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (or (= (Option_tag<Int> res@8@01) 1) (not (= (Option_tag<Int> res@8@01) 1))))
(assert (and (= (Option_tag<Int> res@8@01) 1) (= res@8@01 (Some<Option<Int>> 2))))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] arg < 0 ==> (Option_tag(res): Int) == 0
; [eval] arg < 0
(push) ; 3
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 4
; [else-branch: 12 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (Option_tag(response): Int) == 1
; [eval] (Option_tag(response): Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Option_tag<Int> res@8@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | Option_tag[Int](res@8@01) == 1 | live]
; [else-branch: 13 | Option_tag[Int](res@8@01) != 1 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | Option_tag[Int](res@8@01) == 1]
; [exec]
; var o: Option[Int]
(declare-const o@10@01 Option<Int>)
; [exec]
; assert (get_Option_value(response): Int) == 2
; [eval] (get_Option_value(response): Int) == 2
; [eval] (get_Option_value(response): Int)
(push) ; 4
(assert (not (= (get_Option_value<Int> res@8@01) 2)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (get_Option_value<Int> res@8@01) 2))
; [exec]
; o := (Some(3): Option[Int])
; [eval] (Some(3): Option[Int])
(declare-const o@11@01 Option<Int>)
(assert (= o@11@01 (Some<Option<Int>> 3)))
; [exec]
; assert (add(response, (None(): Option[Int])): Option[Int]) ==
;   (None(): Option[Int])
; [eval] (add(response, (None(): Option[Int])): Option[Int]) == (None(): Option[Int])
; [eval] (add(response, (None(): Option[Int])): Option[Int])
; [eval] (None(): Option[Int])
; [eval] (None(): Option[Int])
(push) ; 4
(assert (not (=
  (add<Option<Int>> res@8@01 (as None<Option<Int>>  Option<Int>))
  (as None<Option<Int>>  Option<Int>))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add<Option<Int>> res@8@01 (as None<Option<Int>>  Option<Int>))
  (as None<Option<Int>>  Option<Int>)))
; [exec]
; assert (get_Option_value((add(o, response): Option[Int])): Int) == 5
; [eval] (get_Option_value((add(o, response): Option[Int])): Int) == 5
; [eval] (get_Option_value((add(o, response): Option[Int])): Int)
; [eval] (add(o, response): Option[Int])
(push) ; 4
(assert (not (= (get_Option_value<Int> (add<Option<Int>> o@11@01 res@8@01)) 5)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (get_Option_value<Int> (add<Option<Int>> o@11@01 res@8@01)) 5))
; [exec]
; assert (get_Option_value((add((Some(Seq(1, 2, 3)): Option[Seq[Int]]), (Some(Seq(1,
;   2, 3)): Option[Seq[Int]])): Option[Seq[Int]])): Seq[Int]) ==
;   Seq(1, 2, 3, 1, 2, 3)
; [eval] (get_Option_value((add((Some(Seq(1, 2, 3)): Option[Seq[Int]]), (Some(Seq(1, 2, 3)): Option[Seq[Int]])): Option[Seq[Int]])): Seq[Int]) == Seq(1, 2, 3, 1, 2, 3)
; [eval] (get_Option_value((add((Some(Seq(1, 2, 3)): Option[Seq[Int]]), (Some(Seq(1, 2, 3)): Option[Seq[Int]])): Option[Seq[Int]])): Seq[Int])
; [eval] (add((Some(Seq(1, 2, 3)): Option[Seq[Int]]), (Some(Seq(1, 2, 3)): Option[Seq[Int]])): Option[Seq[Int]])
; [eval] (Some(Seq(1, 2, 3)): Option[Seq[Int]])
; [eval] Seq(1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton 2))
      (Seq_singleton 3)))
  3))
; [eval] (Some(Seq(1, 2, 3)): Option[Seq[Int]])
; [eval] Seq(1, 2, 3)
; [eval] Seq(1, 2, 3, 1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append
            (Seq_append (Seq_singleton 1) (Seq_singleton 2))
            (Seq_singleton 3))
          (Seq_singleton 1))
        (Seq_singleton 2))
      (Seq_singleton 3)))
  6))
(push) ; 4
(assert (not (Seq_equal
  (get_Option_value<Seq<Int>> (add<Option<Seq<Int>>> (Some<Option<Seq<Int>>> (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton 2))
    (Seq_singleton 3))) (Some<Option<Seq<Int>>> (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton 2))
    (Seq_singleton 3)))))
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 2))
          (Seq_singleton 3))
        (Seq_singleton 1))
      (Seq_singleton 2))
    (Seq_singleton 3)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (get_Option_value<Seq<Int>> (add<Option<Seq<Int>>> (Some<Option<Seq<Int>>> (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton 2))
    (Seq_singleton 3))) (Some<Option<Seq<Int>>> (Seq_append
    (Seq_append (Seq_singleton 1) (Seq_singleton 2))
    (Seq_singleton 3)))))
  (Seq_append
    (Seq_append
      (Seq_append
        (Seq_append
          (Seq_append (Seq_singleton 1) (Seq_singleton 2))
          (Seq_singleton 3))
        (Seq_singleton 1))
      (Seq_singleton 2))
    (Seq_singleton 3))))
; [exec]
; response := request(-1)
; [eval] -1
(declare-const res@12@01 Option<Int>)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
; [eval] arg > 0 ==> (Option_tag(res): Int) == 1 && res == (Some(2 * arg): Option[Int])
; [eval] arg > 0
(push) ; 4
; [then-branch: 14 | False | dead]
; [else-branch: 14 | True | live]
(push) ; 5
; [else-branch: 14 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= ($Snap.second $t@13@01) $Snap.unit))
; [eval] arg < 0 ==> (Option_tag(res): Int) == 0
; [eval] arg < 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | True]
; [eval] (Option_tag(res): Int) == 0
; [eval] (Option_tag(res): Int)
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= (Option_tag<Int> res@12@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert (Option_tag(response): Int) == 0
; [eval] (Option_tag(response): Int) == 0
; [eval] (Option_tag(response): Int)
; [eval] (Option_tag(response): Int) == 1
; [eval] (Option_tag(response): Int)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Option_tag<Int> res@12@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | Option_tag[Int](res@12@01) == 1 | dead]
; [else-branch: 16 | Option_tag[Int](res@12@01) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | Option_tag[Int](res@12@01) != 1]
(assert (not (= (Option_tag<Int> res@12@01) 1)))
(pop) ; 4
; [eval] !((Option_tag(response): Int) == 1)
; [eval] (Option_tag(response): Int) == 1
; [eval] (Option_tag(response): Int)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Option_tag<Int> res@12@01) 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Option_tag<Int> res@12@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | Option_tag[Int](res@12@01) != 1 | live]
; [else-branch: 17 | Option_tag[Int](res@12@01) == 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | Option_tag[Int](res@12@01) != 1]
(assert (not (= (Option_tag<Int> res@12@01) 1)))
; [exec]
; assert true
(pop) ; 4
(pop) ; 3
; [eval] !((Option_tag(response): Int) == 1)
; [eval] (Option_tag(response): Int) == 1
; [eval] (Option_tag(response): Int)
; [then-branch: 18 | Option_tag[Int](res@8@01) != 1 | dead]
; [else-branch: 18 | Option_tag[Int](res@8@01) == 1 | live]
(push) ; 3
; [else-branch: 18 | Option_tag[Int](res@8@01) == 1]
(pop) ; 3
(pop) ; 2
(pop) ; 1
