(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0740.vpr
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
; ---------- fails ----------
(declare-const a@0@01 Bool)
(declare-const a@1@01 Bool)
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
; var curr: Ref
(declare-const curr@2@01 $Ref)
; [exec]
; curr := null
(declare-const curr@3@01 $Ref)
(push) ; 3
; Loop head block: Check well-definedness of invariant
; [eval] curr != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= curr@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= curr@3@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | curr@3@01 != Null | live]
; [else-branch: 0 | curr@3@01 == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | curr@3@01 != Null]
(assert (not (= curr@3@01 $Ref.null)))
(declare-const $t@4@01 Bool)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | curr@3@01 == Null]
(assert (= curr@3@01 $Ref.null))
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] curr != null
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 5
(assert (not (= curr@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] curr != null
(pop) ; 6
(push) ; 6
; [eval] !(curr != null)
; [eval] curr != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] curr != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= curr@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | curr@3@01 != Null | live]
; [else-branch: 2 | curr@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | curr@3@01 != Null]
; [exec]
; var __plugin_refute_nondet1: Bool
(declare-const __plugin_refute_nondet1@6@01 Bool)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@6@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@6@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | __plugin_refute_nondet1@6@01 | live]
; [else-branch: 3 | !(__plugin_refute_nondet1@6@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | __plugin_refute_nondet1@6@01]
(assert __plugin_refute_nondet1@6@01)
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
; [else-branch: 3 | !(__plugin_refute_nondet1@6@01)]
(assert (not __plugin_refute_nondet1@6@01))
(pop) ; 7
; [eval] !__plugin_refute_nondet1
(push) ; 7
(set-option :timeout 10)
(assert (not __plugin_refute_nondet1@6@01))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not __plugin_refute_nondet1@6@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(__plugin_refute_nondet1@6@01) | live]
; [else-branch: 4 | __plugin_refute_nondet1@6@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | !(__plugin_refute_nondet1@6@01)]
(assert (not __plugin_refute_nondet1@6@01))
; [exec]
; curr := null
; Loop head block: Re-establish invariant
; [eval] curr != null
; [then-branch: 5 | False | dead]
; [else-branch: 5 | True | live]
(push) ; 8
; [else-branch: 5 | True]
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 4 | __plugin_refute_nondet1@6@01]
(assert __plugin_refute_nondet1@6@01)
(pop) ; 7
(pop) ; 6
; [eval] !(curr != null)
; [eval] curr != null
; [then-branch: 6 | curr@3@01 == Null | dead]
; [else-branch: 6 | curr@3@01 != Null | live]
(push) ; 6
; [else-branch: 6 | curr@3@01 != Null]
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (= curr@3@01 $Ref.null))
(assert (= $t@5@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 6
; [eval] curr != null
(pop) ; 6
(push) ; 6
; [eval] !(curr != null)
; [eval] curr != null
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [eval] curr != null
; [then-branch: 7 | curr@3@01 != Null | dead]
; [else-branch: 7 | curr@3@01 == Null | live]
(push) ; 6
; [else-branch: 7 | curr@3@01 == Null]
(pop) ; 6
; [eval] !(curr != null)
; [eval] curr != null
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= curr@3@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | curr@3@01 == Null | live]
; [else-branch: 8 | curr@3@01 != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 8 | curr@3@01 == Null]
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
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
