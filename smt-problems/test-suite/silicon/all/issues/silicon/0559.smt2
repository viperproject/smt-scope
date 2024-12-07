(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0559.vpr
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
(declare-sort $T1$_ 0)
(declare-sort $S$_ 0)
(declare-sort $T0$_ 0)
(declare-sort $T$_ 0)
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
(declare-fun $SortWrappers.$T1$_To$Snap ($T1$_) $Snap)
(declare-fun $SortWrappers.$SnapTo$T1$_ ($Snap) $T1$_)
(assert (forall ((x $T1$_)) (!
    (= x ($SortWrappers.$SnapTo$T1$_($SortWrappers.$T1$_To$Snap x)))
    :pattern (($SortWrappers.$T1$_To$Snap x))
    :qid |$Snap.$SnapTo$T1$_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$T1$_To$Snap($SortWrappers.$SnapTo$T1$_ x)))
    :pattern (($SortWrappers.$SnapTo$T1$_ x))
    :qid |$Snap.$T1$_To$SnapTo$T1$_|
    )))
(declare-fun $SortWrappers.$S$_To$Snap ($S$_) $Snap)
(declare-fun $SortWrappers.$SnapTo$S$_ ($Snap) $S$_)
(assert (forall ((x $S$_)) (!
    (= x ($SortWrappers.$SnapTo$S$_($SortWrappers.$S$_To$Snap x)))
    :pattern (($SortWrappers.$S$_To$Snap x))
    :qid |$Snap.$SnapTo$S$_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$S$_To$Snap($SortWrappers.$SnapTo$S$_ x)))
    :pattern (($SortWrappers.$SnapTo$S$_ x))
    :qid |$Snap.$S$_To$SnapTo$S$_|
    )))
(declare-fun $SortWrappers.$T0$_To$Snap ($T0$_) $Snap)
(declare-fun $SortWrappers.$SnapTo$T0$_ ($Snap) $T0$_)
(assert (forall ((x $T0$_)) (!
    (= x ($SortWrappers.$SnapTo$T0$_($SortWrappers.$T0$_To$Snap x)))
    :pattern (($SortWrappers.$T0$_To$Snap x))
    :qid |$Snap.$SnapTo$T0$_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$T0$_To$Snap($SortWrappers.$SnapTo$T0$_ x)))
    :pattern (($SortWrappers.$SnapTo$T0$_ x))
    :qid |$Snap.$T0$_To$SnapTo$T0$_|
    )))
(declare-fun $SortWrappers.$T$_To$Snap ($T$_) $Snap)
(declare-fun $SortWrappers.$SnapTo$T$_ ($Snap) $T$_)
(assert (forall ((x $T$_)) (!
    (= x ($SortWrappers.$SnapTo$T$_($SortWrappers.$T$_To$Snap x)))
    :pattern (($SortWrappers.$T$_To$Snap x))
    :qid |$Snap.$SnapTo$T$_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$T$_To$Snap($SortWrappers.$SnapTo$T$_ x)))
    :pattern (($SortWrappers.$SnapTo$T$_ x))
    :qid |$Snap.$T$_To$SnapTo$T$_|
    )))
; ////////// Symbols
(declare-fun testf0<Int> ($T0$_) Int)
(declare-fun testf1<Int> ($T1$_) Int)
(declare-fun testfs<Int> ($S$_) Int)
(declare-fun testf<Int> ($T$_) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
