(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:03
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/while.vpr
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
; ---------- t1 ----------
(declare-const n@0@01 Int)
(declare-const n@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] n > 0
(assert (> n@1@01 0))
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
(declare-const i@3@01 Int)
; [exec]
; i := 0
(declare-const i@4@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] i <= n
(assert (<= i@4@01 n@1@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= n
(push) ; 4
(assert (not (<= 0 n@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 n@1@01))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@5@01 $Snap.unit))
(assert (<= i@4@01 n@1@01))
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
; [eval] i < n
(pop) ; 5
(push) ; 5
; [eval] !(i < n)
; [eval] i < n
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@4@01 n@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@4@01 n@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@4@01 < n@1@01 | live]
; [else-branch: 0 | !(i@4@01 < n@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@4@01 < n@1@01]
(assert (< i@4@01 n@1@01))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@6@01 Int)
(assert (= i@6@01 (+ i@4@01 1)))
; Loop head block: Re-establish invariant
; [eval] i <= n
(push) ; 6
(assert (not (<= i@6@01 n@1@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@6@01 n@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@4@01 < n@1@01)]
(assert (not (< i@4@01 n@1@01)))
(pop) ; 5
; [eval] !(i < n)
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@4@01 n@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@4@01 n@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@4@01 < n@1@01) | live]
; [else-branch: 1 | i@4@01 < n@1@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@4@01 < n@1@01)]
(assert (not (< i@4@01 n@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@4@01 < n@1@01]
(assert (< i@4@01 n@1@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const n@7@01 Int)
(declare-const n@8@01 Int)
(push) ; 1
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] n > 0
(assert (> n@8@01 0))
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
(declare-const i@10@01 Int)
; [exec]
; i := 0
(declare-const i@11@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] i < n
(assert (< i@11@01 n@8@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i < n
(push) ; 4
(assert (not (< 0 n@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 n@8@01))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@12@01 $Snap.unit))
(assert (< i@11@01 n@8@01))
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
; [eval] i < n
(pop) ; 5
(push) ; 5
; [eval] !(i < n)
; [eval] i < n
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@11@01 n@8@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | i@11@01 < n@8@01 | live]
; [else-branch: 2 | !(i@11@01 < n@8@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | i@11@01 < n@8@01]
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@13@01 Int)
(assert (= i@13@01 (+ i@11@01 1)))
; Loop head block: Re-establish invariant
; [eval] i < n
(push) ; 6
(assert (not (< i@13@01 n@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < n
(set-option :timeout 0)
(push) ; 6
(assert (not (< i@13@01 n@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < n
(set-option :timeout 0)
(push) ; 6
(assert (not (< i@13@01 n@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] i < n
(set-option :timeout 0)
(push) ; 6
(assert (not (< i@13@01 n@8@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const n@14@01 Int)
(declare-const n@15@01 Int)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] n > 0
(assert (> n@15@01 0))
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
(declare-const i@17@01 Int)
; [exec]
; i := 2
(declare-const i@18@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] i <= n
(assert (<= i@18@01 n@15@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] i <= n
(push) ; 4
(assert (not (<= 2 n@15@01)))
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
; [eval] i <= n
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 2 n@15@01)))
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
; [eval] i <= n
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 2 n@15@01)))
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
; [eval] i <= n
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 2 n@15@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const n@20@01 Int)
(declare-const r@21@01 $Ref)
(declare-const n@22@01 Int)
(declare-const r@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] n > 0
(assert (> n@22@01 0))
(assert (= ($Snap.second $t@24@01) $Snap.unit))
; [eval] r != null
(assert (not (= r@23@01 $Ref.null)))
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
(declare-const i@25@01 Int)
; [exec]
; i := 2
(declare-const i@26@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
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
; [eval] i < r.f
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
; Loop head block: Follow loop-internal edges
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t5 ----------
(declare-const n@27@01 Int)
(declare-const r@28@01 $Ref)
(declare-const n@29@01 Int)
(declare-const r@30@01 $Ref)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] n > 0
(assert (> n@29@01 0))
(assert (not (= r@30@01 $Ref.null)))
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
(declare-const i@32@01 Int)
; [exec]
; i := 2
(declare-const i@33@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@34@01 Int)
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
; [eval] i < r.f
(pop) ; 5
(push) ; 5
; [eval] !(i < r.f)
; [eval] i < r.f
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < r.f
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@33@01 $t@34@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@33@01 $t@34@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | i@33@01 < $t@34@01 | live]
; [else-branch: 3 | !(i@33@01 < $t@34@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | i@33@01 < $t@34@01]
(assert (< i@33@01 $t@34@01))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@35@01 Int)
(assert (= i@35@01 (+ i@33@01 1)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@33@01 < $t@34@01)]
(assert (not (< i@33@01 $t@34@01)))
(pop) ; 5
; [eval] !(i < r.f)
; [eval] i < r.f
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@33@01 $t@34@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@33@01 $t@34@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(i@33@01 < $t@34@01) | live]
; [else-branch: 4 | i@33@01 < $t@34@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | !(i@33@01 < $t@34@01)]
(assert (not (< i@33@01 $t@34@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@33@01 < $t@34@01]
(assert (< i@33@01 $t@34@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t6 ----------
(declare-const r@36@01 $Ref)
(declare-const r@37@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(push) ; 3
; Loop head block: Check well-definedness of invariant
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
; [eval] perm(r.f) == none
; [eval] perm(r.f)
(pop) ; 5
(push) ; 5
; [eval] !(perm(r.f) == none)
; [eval] perm(r.f) == none
; [eval] perm(r.f)
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] perm(r.f) == none
; [eval] perm(r.f)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | True]
; Loop head block: Re-establish invariant
(pop) ; 5
; [eval] !(perm(r.f) == none)
; [eval] perm(r.f) == none
; [eval] perm(r.f)
; [then-branch: 6 | False | dead]
; [else-branch: 6 | True | live]
(push) ; 5
; [else-branch: 6 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t7 ----------
(declare-const r@38@01 $Ref)
(declare-const r@39@01 $Ref)
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
(declare-const i@40@01 Int)
; [exec]
; var j: Int
(declare-const j@41@01 Int)
; [exec]
; i := 1
; [exec]
; j := 2
(declare-const j@42@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
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
(pop) ; 5
(push) ; 5
; [eval] !true
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | True]
; [exec]
; assert i == 1
; [eval] i == 1
; [exec]
; assert j == 2
; [eval] j == 2
(push) ; 6
(assert (not (= j@42@01 2)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j == 2
(set-option :timeout 0)
(push) ; 6
(assert (not (= j@42@01 2)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j == 2
(set-option :timeout 0)
(push) ; 6
(assert (not (= j@42@01 2)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] j == 2
(set-option :timeout 0)
(push) ; 6
(assert (not (= j@42@01 2)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t8 ----------
(declare-const r@43@01 $Ref)
(declare-const r@44@01 $Ref)
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
; var j: Int
(declare-const j@45@01 Int)
; [exec]
; j := 2
(declare-const j@46@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
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
; [eval] j < 10
(pop) ; 5
(push) ; 5
; [eval] !(j < 10)
; [eval] j < 10
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] j < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@46@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@46@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | j@46@01 < 10 | live]
; [else-branch: 8 | !(j@46@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | j@46@01 < 10]
(assert (< j@46@01 10))
; [exec]
; j := j + 1
; [eval] j + 1
(declare-const j@47@01 Int)
(assert (= j@47@01 (+ j@46@01 1)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(j@46@01 < 10)]
(assert (not (< j@46@01 10)))
(pop) ; 5
; [eval] !(j < 10)
; [eval] j < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@46@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@46@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(j@46@01 < 10) | live]
; [else-branch: 9 | j@46@01 < 10 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | !(j@46@01 < 10)]
(assert (not (< j@46@01 10)))
; [exec]
; assert j >= 10
; [eval] j >= 10
(push) ; 6
(assert (not (>= j@46@01 10)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= j@46@01 10))
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t9 ----------
(declare-const r@48@01 $Ref)
(declare-const r@49@01 $Ref)
(push) ; 1
(declare-const $t@50@01 Int)
(assert (not (= r@49@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@51@01 Int)
; [exec]
; j := 2
(declare-const j@52@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@53@01 Int)
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
; [eval] j < r.f
(pop) ; 5
(push) ; 5
; [eval] !(j < r.f)
; [eval] j < r.f
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] j < r.f
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@52@01 $t@53@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@52@01 $t@53@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | j@52@01 < $t@53@01 | live]
; [else-branch: 10 | !(j@52@01 < $t@53@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | j@52@01 < $t@53@01]
(assert (< j@52@01 $t@53@01))
; [exec]
; j := j + 1
; [eval] j + 1
(declare-const j@54@01 Int)
(assert (= j@54@01 (+ j@52@01 1)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(j@52@01 < $t@53@01)]
(assert (not (< j@52@01 $t@53@01)))
(pop) ; 5
; [eval] !(j < r.f)
; [eval] j < r.f
(push) ; 5
(set-option :timeout 10)
(assert (not (< j@52@01 $t@53@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< j@52@01 $t@53@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !(j@52@01 < $t@53@01) | live]
; [else-branch: 11 | j@52@01 < $t@53@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | !(j@52@01 < $t@53@01)]
(assert (not (< j@52@01 $t@53@01)))
; [exec]
; assert j >= r.f
; [eval] j >= r.f
(push) ; 6
(assert (not (>= j@52@01 $t@53@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (>= j@52@01 $t@53@01))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | j@52@01 < $t@53@01]
(assert (< j@52@01 $t@53@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t10 ----------
(declare-const r@55@01 $Ref)
(declare-const r@56@01 $Ref)
(push) ; 1
(declare-const $t@57@01 Int)
(assert (not (= r@56@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@58@01 Int)
; [exec]
; j := 2
(declare-const j@59@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
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
; [eval] j < r.f
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
; Loop head block: Follow loop-internal edges
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t11 ----------
(declare-const r@60@01 $Ref)
(declare-const r@61@01 $Ref)
(push) ; 1
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] r != null
(assert (not (= r@61@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var j: Int
(declare-const j@63@01 Int)
; [exec]
; j := 2
(declare-const j@64@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.first $t@65@01) $Snap.unit))
; [eval] r != null
(assert (= ($Snap.second $t@65@01) $Snap.unit))
; [eval] r.f == 2
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
