(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:53
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/invariants/loops2.vpr
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
; var i: Int
(declare-const i@0@01 Int)
; [exec]
; var j: Bool
(declare-const j@1@01 Bool)
; [exec]
; i := 1
; [exec]
; j := true
; [exec]
; assert i <= 5
; [eval] i <= 5
; [eval] !(i < 5)
; [eval] i < 5
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 3
; [else-branch: 0 | True]
(pop) ; 3
; [eval] !!(i < 5)
; [eval] !(i < 5)
; [eval] i < 5
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | True]
(declare-const i@2@01 Int)
(declare-const j@3@01 Bool)
(push) ; 4
; Loop head block: Check well-definedness of invariant
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] i < 5
(assert (< i@2@01 5))
(pop) ; 4
(push) ; 4
; Loop head block: Establish invariant
; [eval] i < 5
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (= $t@4@01 $Snap.unit))
(assert (< i@2@01 5))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label loop1
; [exec]
; assert i <= 5
; [eval] i <= 5
(set-option :timeout 0)
(push) ; 6
(assert (not (<= i@2@01 5)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@2@01 5))
; Loop head block: Check well-definedness of edge conditions
(push) ; 6
; [eval] !j
(pop) ; 6
(push) ; 6
; [eval] !!j
; [eval] !j
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] !j
(push) ; 6
(set-option :timeout 10)
(assert (not j@3@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not j@3@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | !(j@3@01) | live]
; [else-branch: 2 | j@3@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | !(j@3@01)]
(assert (not j@3@01))
; [exec]
; label skiploop2
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@5@01 Int)
(assert (= i@5@01 (+ i@2@01 1)))
; [exec]
; assert i <= 5
; [eval] i <= 5
(push) ; 7
(assert (not (<= i@5@01 5)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= i@5@01 5))
; [eval] i < 5
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< i@5@01 5))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< i@5@01 5)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | i@5@01 < 5 | live]
; [else-branch: 3 | !(i@5@01 < 5) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | i@5@01 < 5]
(assert (< i@5@01 5))
; Loop head block: Re-establish invariant
; [eval] i < 5
(pop) ; 7
(push) ; 7
; [else-branch: 3 | !(i@5@01 < 5)]
(assert (not (< i@5@01 5)))
(pop) ; 7
; [eval] !(i < 5)
; [eval] i < 5
(push) ; 7
(set-option :timeout 10)
(assert (not (< i@5@01 5)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< i@5@01 5))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(i@5@01 < 5) | live]
; [else-branch: 4 | i@5@01 < 5 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | !(i@5@01 < 5)]
(assert (not (< i@5@01 5)))
; [exec]
; label skiploop1
; [exec]
; assert i == 5
; [eval] i == 5
(push) ; 8
(assert (not (= i@5@01 5)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (= i@5@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | i@5@01 < 5]
(assert (< i@5@01 5))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 2 | j@3@01]
(assert j@3@01)
(pop) ; 6
; [eval] !!j
; [eval] !j
(push) ; 6
(set-option :timeout 10)
(assert (not (not j@3@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not j@3@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | j@3@01 | live]
; [else-branch: 5 | !(j@3@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | j@3@01]
(assert j@3@01)
(declare-const j@6@01 Bool)
(push) ; 7
; Loop head block: Check well-definedness of invariant
(pop) ; 7
(push) ; 7
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 8
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label loop2
; [exec]
; j := false
; [exec]
; assert i <= 5
; [eval] i <= 5
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 9
; [eval] i < 5
(pop) ; 9
(push) ; 9
; [eval] !(i < 5)
; [eval] i < 5
(pop) ; 9
; Loop head block: Follow loop-internal edges
; [eval] i < 5
(push) ; 9
(set-option :timeout 10)
(assert (not (not (< i@2@01 5))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | i@2@01 < 5 | live]
; [else-branch: 6 | !(i@2@01 < 5) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 6 | i@2@01 < 5]
; Loop head block: Re-establish invariant
(pop) ; 9
; [eval] !(i < 5)
; [eval] i < 5
; [then-branch: 7 | !(i@2@01 < 5) | dead]
; [else-branch: 7 | i@2@01 < 5 | live]
(push) ; 9
; [else-branch: 7 | i@2@01 < 5]
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 5 | !(j@3@01)]
(assert (not j@3@01))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
