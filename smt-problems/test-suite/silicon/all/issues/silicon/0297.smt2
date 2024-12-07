(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0297.vpr
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
(declare-sort Loc<d> 0)
(declare-sort d2 0)
(declare-sort d 0)
(declare-sort Loc<d2> 0)
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
(declare-fun $SortWrappers.Loc<d>To$Snap (Loc<d>) $Snap)
(declare-fun $SortWrappers.$SnapToLoc<d> ($Snap) Loc<d>)
(assert (forall ((x Loc<d>)) (!
    (= x ($SortWrappers.$SnapToLoc<d>($SortWrappers.Loc<d>To$Snap x)))
    :pattern (($SortWrappers.Loc<d>To$Snap x))
    :qid |$Snap.$SnapToLoc<d>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Loc<d>To$Snap($SortWrappers.$SnapToLoc<d> x)))
    :pattern (($SortWrappers.$SnapToLoc<d> x))
    :qid |$Snap.Loc<d>To$SnapToLoc<d>|
    )))
(declare-fun $SortWrappers.d2To$Snap (d2) $Snap)
(declare-fun $SortWrappers.$SnapTod2 ($Snap) d2)
(assert (forall ((x d2)) (!
    (= x ($SortWrappers.$SnapTod2($SortWrappers.d2To$Snap x)))
    :pattern (($SortWrappers.d2To$Snap x))
    :qid |$Snap.$SnapTod2To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.d2To$Snap($SortWrappers.$SnapTod2 x)))
    :pattern (($SortWrappers.$SnapTod2 x))
    :qid |$Snap.d2To$SnapTod2|
    )))
(declare-fun $SortWrappers.dTo$Snap (d) $Snap)
(declare-fun $SortWrappers.$SnapTod ($Snap) d)
(assert (forall ((x d)) (!
    (= x ($SortWrappers.$SnapTod($SortWrappers.dTo$Snap x)))
    :pattern (($SortWrappers.dTo$Snap x))
    :qid |$Snap.$SnapTodTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.dTo$Snap($SortWrappers.$SnapTod x)))
    :pattern (($SortWrappers.$SnapTod x))
    :qid |$Snap.dTo$SnapTod|
    )))
(declare-fun $SortWrappers.Loc<d2>To$Snap (Loc<d2>) $Snap)
(declare-fun $SortWrappers.$SnapToLoc<d2> ($Snap) Loc<d2>)
(assert (forall ((x Loc<d2>)) (!
    (= x ($SortWrappers.$SnapToLoc<d2>($SortWrappers.Loc<d2>To$Snap x)))
    :pattern (($SortWrappers.Loc<d2>To$Snap x))
    :qid |$Snap.$SnapToLoc<d2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Loc<d2>To$Snap($SortWrappers.$SnapToLoc<d2> x)))
    :pattern (($SortWrappers.$SnapToLoc<d2> x))
    :qid |$Snap.Loc<d2>To$SnapToLoc<d2>|
    )))
; ////////// Symbols
(declare-fun loc_Ref<Loc<d2>> ($Ref) Loc<d2>)
(declare-fun loc_Ref<Loc<d>> ($Ref) Loc<d>)
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
; ---------- meth ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
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
; var y: Loc[d]
(declare-const y@2@01 Loc<d>)
; [exec]
; y := (loc_Ref(r): Loc[d])
; [eval] (loc_Ref(r): Loc[d])
(declare-const y@3@01 Loc<d>)
(assert (= y@3@01 (loc_Ref<Loc<d>> r@1@01)))
(pop) ; 2
(pop) ; 1
; ---------- meth2 ----------
(declare-const r@4@01 $Ref)
(declare-const r@5@01 $Ref)
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
; var z: Loc[d2]
(declare-const z@6@01 Loc<d2>)
; [exec]
; z := (loc_Ref(r): Loc[d2])
; [eval] (loc_Ref(r): Loc[d2])
(declare-const z@7@01 Loc<d2>)
(assert (= z@7@01 (loc_Ref<Loc<d2>> r@5@01)))
(pop) ; 2
(pop) ; 1
