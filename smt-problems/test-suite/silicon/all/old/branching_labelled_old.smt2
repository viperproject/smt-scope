(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/old/branching_labelled_old.vpr
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
; ////////// Symbols
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
; ---------- main ----------
(declare-const i@0@01 Int)
(declare-const i@1@01 Int)
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
; var m: Ref
(declare-const m@2@01 $Ref)
; [exec]
; m := new(f)
(declare-const m@3@01 $Ref)
(assert (not (= m@3@01 $Ref.null)))
(declare-const f@4@01 Int)
(assert (not (= m@3@01 m@2@01)))
; [exec]
; m.f := i
; [eval] m.f != 15
(push) ; 3
(set-option :timeout 10)
(assert (not (= i@1@01 15)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= i@1@01 15))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@1@01 != 15 | live]
; [else-branch: 0 | i@1@01 == 15 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | i@1@01 != 15]
(assert (not (= i@1@01 15)))
; [exec]
; m.f := 15
; [exec]
; label initial
; [exec]
; m.f := 3
; [exec]
; assert m.f == 3 && old[initial](m.f) == 15
; [eval] m.f == 3
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | i@1@01 == 15]
(assert (= i@1@01 15))
(pop) ; 3
; [eval] !(m.f != 15)
; [eval] m.f != 15
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= i@1@01 15))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= i@1@01 15)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | i@1@01 == 15 | live]
; [else-branch: 1 | i@1@01 != 15 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | i@1@01 == 15]
(assert (= i@1@01 15))
; [exec]
; m.f := 3
; [exec]
; assert m.f == 3 && old[initial](m.f) == 15
; [eval] m.f == 3
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- main3 ----------
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
; var m: Ref
(declare-const m@5@01 $Ref)
; [exec]
; m := new(f)
(declare-const m@6@01 $Ref)
(assert (not (= m@6@01 $Ref.null)))
(declare-const f@7@01 Int)
(assert (not (= m@6@01 m@5@01)))
; [exec]
; m.f := 15
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@8@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] m.f != 3
(pop) ; 5
(push) ; 5
; [eval] !(m.f != 3)
; [eval] m.f != 3
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] m.f != 3
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@8@01 3)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@8@01 3))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | $t@8@01 != 3 | live]
; [else-branch: 2 | $t@8@01 == 3 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | $t@8@01 != 3]
(assert (not (= $t@8@01 3)))
; [exec]
; label initial
; [exec]
; m.f := m.f - 1
; [eval] m.f - 1
(declare-const f@9@01 Int)
(assert (= f@9@01 (- $t@8@01 1)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 2 | $t@8@01 == 3]
(assert (= $t@8@01 3))
(pop) ; 5
; [eval] !(m.f != 3)
; [eval] m.f != 3
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@8@01 3))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@8@01 3)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | $t@8@01 == 3 | live]
; [else-branch: 3 | $t@8@01 != 3 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | $t@8@01 == 3]
(assert (= $t@8@01 3))
; [exec]
; assert m.f == 3 && old[initial](m.f) == 15
; [eval] m.f == 3
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] old[initial](m.f) == 15
; [eval] old[initial](m.f)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
