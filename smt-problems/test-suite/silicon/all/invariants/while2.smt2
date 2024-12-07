(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/invariants/while2.vpr
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
; ---------- test00 ----------
(declare-const x@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const x@2@01 $Ref)
(declare-const b@3@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 Int)
(assert (not (= x@2@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(declare-const b@5@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@5@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@5@01 | live]
; [else-branch: 0 | !(b@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | b@5@01]
(assert b@5@01)
(declare-const $t@6@01 Int)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(b@5@01)]
(assert (not b@5@01))
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@3@01 | live]
; [else-branch: 1 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b@3@01]
(assert b@3@01)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 5
(assert b@5@01)
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
(pop) ; 6
(push) ; 6
; [eval] !b
(pop) ; 6
; Loop head block: Follow loop-internal edges
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@5@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@5@01 | live]
; [else-branch: 2 | !(b@5@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | b@5@01]
; [exec]
; b := !b
; [eval] !b
(declare-const b@8@01 Bool)
(assert (= b@8@01 (not b@5@01)))
; Loop head block: Re-establish invariant
(push) ; 7
(set-option :timeout 10)
(assert (not (not b@8@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@8@01 | dead]
; [else-branch: 3 | !(b@8@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 3 | !(b@8@01)]
(assert (not b@8@01))
(pop) ; 7
(pop) ; 6
(assert (= $t@6@01 $t@4@01))
; [eval] !b
; [then-branch: 4 | !(b@5@01) | dead]
; [else-branch: 4 | b@5@01 | live]
(push) ; 6
; [else-branch: 4 | b@5@01]
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (not b@5@01))
(assert (= $t@7@01 $Snap.unit))
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
(pop) ; 6
(push) ; 6
; [eval] !b
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [then-branch: 5 | b@5@01 | dead]
; [else-branch: 5 | !(b@5@01) | live]
(push) ; 6
; [else-branch: 5 | !(b@5@01)]
(pop) ; 6
; [eval] !b
(push) ; 6
(set-option :timeout 10)
(assert (not b@5@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(b@5@01) | live]
; [else-branch: 6 | b@5@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | !(b@5@01)]
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
; ---------- test03 ----------
(declare-const x@9@01 $Ref)
(declare-const b@10@01 Bool)
(declare-const x@11@01 $Ref)
(declare-const b@12@01 Bool)
(push) ; 1
(declare-const $t@13@01 Int)
(assert (not (= x@11@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 Int)
(pop) ; 2
(push) ; 2
(declare-const b@15@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@15@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@15@01 | live]
; [else-branch: 7 | !(b@15@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | b@15@01]
(assert b@15@01)
(declare-const $t@16@01 Int)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | !(b@15@01)]
(assert (not b@15@01))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@12@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@12@01 | live]
; [else-branch: 8 | !(b@12@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | b@12@01]
(assert b@12@01)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 5
(assert b@15@01)
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
(pop) ; 6
(push) ; 6
; [eval] !b
(pop) ; 6
; Loop head block: Follow loop-internal edges
(push) ; 6
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | b@15@01 | live]
; [else-branch: 9 | !(b@15@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | b@15@01]
; [exec]
; exhale acc(x.f, 1 / 2)
; [exec]
; b := !b
; [eval] !b
(declare-const b@18@01 Bool)
(assert (= b@18@01 (not b@15@01)))
; Loop head block: Re-establish invariant
(push) ; 7
(set-option :timeout 10)
(assert (not (not b@18@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | b@18@01 | dead]
; [else-branch: 10 | !(b@18@01) | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 10 | !(b@18@01)]
(assert (not b@18@01))
(pop) ; 7
(pop) ; 6
(assert (= $t@16@01 $t@13@01))
; [eval] !b
; [then-branch: 11 | !(b@15@01) | dead]
; [else-branch: 11 | b@15@01 | live]
(push) ; 6
; [else-branch: 11 | b@15@01]
(pop) ; 6
(pop) ; 5
(push) ; 5
(assert (not b@15@01))
(assert (= $t@17@01 $Snap.unit))
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
(pop) ; 6
(push) ; 6
; [eval] !b
(pop) ; 6
; Loop head block: Follow loop-internal edges
; [then-branch: 12 | b@15@01 | dead]
; [else-branch: 12 | !(b@15@01) | live]
(push) ; 6
; [else-branch: 12 | !(b@15@01)]
(pop) ; 6
; [eval] !b
(push) ; 6
(set-option :timeout 10)
(assert (not b@15@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(b@15@01) | live]
; [else-branch: 13 | b@15@01 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | !(b@15@01)]
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const x@19@01 $Ref)
(declare-const b@20@01 Bool)
(declare-const x@21@01 $Ref)
(declare-const b@22@01 Bool)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (not (= x@21@01 $Ref.null)))
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] x.f > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@23@01)) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(declare-const b@24@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] x.f > 0
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
; ---------- test02 ----------
(declare-const x@26@01 $Ref)
(declare-const b@27@01 Bool)
(declare-const x@28@01 $Ref)
(declare-const b@29@01 Bool)
(push) ; 1
(declare-const $t@30@01 Int)
(assert (not (= x@28@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.f := 1
(declare-const b@31@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@32@01 $Snap.unit))
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
; [eval] x.f > 0
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
