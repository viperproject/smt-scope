(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/inhale_exhale/loops.vpr
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
; ---------- loopTrueTrue ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
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
(declare-const i@2@01 Int)
; [exec]
; i := 1
(declare-const i@3@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@4@01 $Snap.unit))
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
; [eval] i < 10
(pop) ; 5
(push) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@3@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@3@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@3@01 < 10 | live]
; [else-branch: 0 | !(i@3@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@3@01 < 10]
(assert (< i@3@01 10))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@5@01 Int)
(assert (= i@5@01 (+ i@3@01 1)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@3@01 < 10)]
(assert (not (< i@3@01 10)))
(pop) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@3@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@3@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@3@01 < 10) | live]
; [else-branch: 1 | i@3@01 < 10 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@3@01 < 10)]
(assert (not (< i@3@01 10)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@3@01 < 10]
(assert (< i@3@01 10))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loopFalseTrue ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
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
(declare-const i@8@01 Int)
; [exec]
; i := 1
(declare-const i@9@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
(assert false)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@10@01 $Snap.unit))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loopTrueFalse ----------
(declare-const this@11@01 $Ref)
(declare-const this@12@01 $Ref)
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
(declare-const i@13@01 Int)
; [exec]
; i := 1
(declare-const i@14@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loopFalse ----------
(declare-const this@16@01 $Ref)
(declare-const this@17@01 $Ref)
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
(declare-const i@18@01 Int)
; [exec]
; i := 1
(declare-const i@19@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
(assert false)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loopTrueExpression ----------
(declare-const this@21@01 $Ref)
(declare-const this@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 Int)
(assert (not (= this@22@01 $Ref.null)))
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
(declare-const i@24@01 Int)
; [exec]
; i := 1
(declare-const i@25@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@26@01 $Snap.unit))
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
; [eval] i < 10
(pop) ; 5
(push) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@25@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@25@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | i@25@01 < 10 | live]
; [else-branch: 2 | !(i@25@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | i@25@01 < 10]
(assert (< i@25@01 10))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@27@01 Int)
(assert (= i@27@01 (+ i@25@01 1)))
; Loop head block: Re-establish invariant
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- loopExpressionTrue ----------
(declare-const this@28@01 $Ref)
(declare-const this@29@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@30@01 Int)
(assert (not (= this@29@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@31@01 Int)
; [exec]
; i := 1
(declare-const i@32@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@33@01 Int)
(assert (not (= this@29@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (not (= this@29@01 $Ref.null)))
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
; [eval] i < 10
(pop) ; 5
(push) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@32@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@32@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | i@32@01 < 10 | live]
; [else-branch: 3 | !(i@32@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | i@32@01 < 10]
(assert (< i@32@01 10))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@34@01 Int)
(assert (= i@34@01 (+ i@32@01 1)))
; [exec]
; exhale acc(this.x, write)
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@32@01 < 10)]
(assert (not (< i@32@01 10)))
(pop) ; 5
; [eval] !(i < 10)
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@32@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@32@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(i@32@01 < 10) | live]
; [else-branch: 4 | i@32@01 < 10 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | !(i@32@01 < 10)]
(assert (not (< i@32@01 10)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@32@01 < 10]
(assert (< i@32@01 10))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
