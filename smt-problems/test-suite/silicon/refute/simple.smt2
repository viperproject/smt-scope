(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:27:53
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/refute/simple.vpr
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
; ---------- foo ----------
(declare-const x@0@01 Int)
(declare-const r@1@01 Int)
(declare-const x@2@01 Int)
(declare-const r@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] x > 10
(assert (> x@2@01 10))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@5@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@5@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | __plugin_refute_nondet1@5@01 | live]
; [else-branch: 0 | !(__plugin_refute_nondet1@5@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | __plugin_refute_nondet1@5@01]
(assert __plugin_refute_nondet1@5@01)
; [exec]
; assert !(x > 0)
; [eval] !(x > 0)
; [eval] x > 0
(push) ; 4
(assert (not (not (> x@2@01 0))))
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
; [eval] !(x > 0)
; [eval] x > 0
(set-option :timeout 0)
(push) ; 4
(assert (not (not (> x@2@01 0))))
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
; [eval] !(x > 0)
; [eval] x > 0
(set-option :timeout 0)
(push) ; 4
(assert (not (not (> x@2@01 0))))
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
; [eval] !(x > 0)
; [eval] x > 0
(set-option :timeout 0)
(push) ; 4
(assert (not (not (> x@2@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (> x@2@01 0)))
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(__plugin_refute_nondet1@5@01)]
(assert (not __plugin_refute_nondet1@5@01))
(pop) ; 3
; [eval] !__plugin_refute_nondet1
(push) ; 3
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@5@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(__plugin_refute_nondet1@5@01) | live]
; [else-branch: 1 | __plugin_refute_nondet1@5@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(__plugin_refute_nondet1@5@01)]
(assert (not __plugin_refute_nondet1@5@01))
; [exec]
; var __plugin_refute_nondet2: Bool
(declare-const __plugin_refute_nondet2@6@01 Bool)
(push) ; 4
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet2@6@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not __plugin_refute_nondet2@6@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | __plugin_refute_nondet2@6@01 | live]
; [else-branch: 2 | !(__plugin_refute_nondet2@6@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | __plugin_refute_nondet2@6@01]
(assert __plugin_refute_nondet2@6@01)
; [exec]
; assert x > 0
; [eval] x > 0
(push) ; 5
(assert (not (> x@2@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (> x@2@01 0))
; [exec]
; inhale false
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(__plugin_refute_nondet2@6@01)]
(assert (not __plugin_refute_nondet2@6@01))
(pop) ; 4
; [eval] !__plugin_refute_nondet2
(push) ; 4
(set-option :timeout 10)
(assert (not __plugin_refute_nondet2@6@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet2@6@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(__plugin_refute_nondet2@6@01) | live]
; [else-branch: 3 | __plugin_refute_nondet2@6@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | !(__plugin_refute_nondet2@6@01)]
(assert (not __plugin_refute_nondet2@6@01))
; [exec]
; var __plugin_refute_nondet3: Bool
(declare-const __plugin_refute_nondet3@7@01 Bool)
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet3@7@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet3@7@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | __plugin_refute_nondet3@7@01 | live]
; [else-branch: 4 | !(__plugin_refute_nondet3@7@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | __plugin_refute_nondet3@7@01]
(assert __plugin_refute_nondet3@7@01)
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(__plugin_refute_nondet3@7@01)]
(assert (not __plugin_refute_nondet3@7@01))
(pop) ; 5
; [eval] !__plugin_refute_nondet3
(push) ; 5
(set-option :timeout 10)
(assert (not __plugin_refute_nondet3@7@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet3@7@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(__plugin_refute_nondet3@7@01) | live]
; [else-branch: 5 | __plugin_refute_nondet3@7@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(__plugin_refute_nondet3@7@01)]
(assert (not __plugin_refute_nondet3@7@01))
; [exec]
; var __plugin_refute_nondet4: Bool
(declare-const __plugin_refute_nondet4@8@01 Bool)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@8@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | __plugin_refute_nondet4@8@01 | live]
; [else-branch: 6 | !(__plugin_refute_nondet4@8@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | __plugin_refute_nondet4@8@01]
(assert __plugin_refute_nondet4@8@01)
; [exec]
; assert true
; [exec]
; inhale false
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(__plugin_refute_nondet4@8@01)]
(assert (not __plugin_refute_nondet4@8@01))
(pop) ; 6
; [eval] !__plugin_refute_nondet4
(push) ; 6
(set-option :timeout 10)
(assert (not __plugin_refute_nondet4@8@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet4@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(__plugin_refute_nondet4@8@01) | live]
; [else-branch: 7 | __plugin_refute_nondet4@8@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | !(__plugin_refute_nondet4@8@01)]
(assert (not __plugin_refute_nondet4@8@01))
; [exec]
; var __plugin_refute_nondet5: Bool
(declare-const __plugin_refute_nondet5@9@01 Bool)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@9@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | __plugin_refute_nondet5@9@01 | live]
; [else-branch: 8 | !(__plugin_refute_nondet5@9@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | __plugin_refute_nondet5@9@01]
(assert __plugin_refute_nondet5@9@01)
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 7
(push) ; 7
; [else-branch: 8 | !(__plugin_refute_nondet5@9@01)]
(assert (not __plugin_refute_nondet5@9@01))
(pop) ; 7
; [eval] !__plugin_refute_nondet5
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet5@9@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet5@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(__plugin_refute_nondet5@9@01) | live]
; [else-branch: 9 | __plugin_refute_nondet5@9@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | !(__plugin_refute_nondet5@9@01)]
(assert (not __plugin_refute_nondet5@9@01))
; [eval] x > 0
(push) ; 8
(set-option :timeout 10)
(assert (not (not (> x@2@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (> x@2@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | x@2@01 > 0 | live]
; [else-branch: 10 | !(x@2@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | x@2@01 > 0]
(assert (> x@2@01 0))
; [exec]
; r := x
(pop) ; 8
; [eval] !(x > 0)
; [eval] x > 0
(push) ; 8
(set-option :timeout 10)
(assert (not (> x@2@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !(x@2@01 > 0) | dead]
; [else-branch: 11 | x@2@01 > 0 | live]
(set-option :timeout 0)
(push) ; 8
; [else-branch: 11 | x@2@01 > 0]
(assert (> x@2@01 0))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 9 | __plugin_refute_nondet5@9@01]
(assert __plugin_refute_nondet5@9@01)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 7 | __plugin_refute_nondet4@8@01]
(assert __plugin_refute_nondet4@8@01)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 5 | __plugin_refute_nondet3@7@01]
(assert __plugin_refute_nondet3@7@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 3 | __plugin_refute_nondet2@6@01]
(assert __plugin_refute_nondet2@6@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 1 | __plugin_refute_nondet1@5@01]
(assert __plugin_refute_nondet1@5@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
