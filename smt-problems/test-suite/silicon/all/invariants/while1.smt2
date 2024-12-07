(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/invariants/while1.vpr
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
; ---------- test01 ----------
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
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@5@01)) $t@4@01))
(pop) ; 2
(push) ; 2
(declare-const b@6@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@7@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
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
; [eval] !b
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@6@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@6@01 | live]
; [else-branch: 0 | !(b@6@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | b@6@01]
(assert b@6@01)
; [exec]
; b := !b
; [eval] !b
(declare-const b@8@01 Bool)
(assert (= b@8@01 (not b@6@01)))
; Loop head block: Re-establish invariant
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(b@6@01)]
(assert (not b@6@01))
(pop) ; 5
(assert (= $t@7@01 $t@4@01))
; [eval] !b
(push) ; 5
(set-option :timeout 10)
(assert (not b@6@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@6@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(b@6@01) | live]
; [else-branch: 1 | b@6@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(b@6@01)]
(assert (not b@6@01))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | b@6@01]
(assert b@6@01)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@9@01 $Ref)
(declare-const b@10@01 Bool)
(declare-const x@11@01 $Ref)
(declare-const b@12@01 Bool)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(declare-const b@13@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@14@01 Int)
(assert (not (= x@11@01 $Ref.null)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@15@01 $Ref)
(declare-const b@16@01 Bool)
(declare-const x@17@01 $Ref)
(declare-const b@18@01 Bool)
(push) ; 1
(declare-const $t@19@01 Int)
(assert (not (= x@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(declare-const b@20@01 Bool)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@21@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
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
; [eval] !b
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@20@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b@20@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@20@01 | live]
; [else-branch: 2 | !(b@20@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | b@20@01]
(assert b@20@01)
; [exec]
; exhale acc(x.f, 1 / 4)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; b := !b
; [eval] !b
(declare-const b@22@01 Bool)
(assert (= b@22@01 (not b@20@01)))
; Loop head block: Re-establish invariant
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
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
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
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
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
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
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test20a ----------
(declare-const x@23@01 $Ref)
(declare-const y@24@01 $Ref)
(declare-const n@25@01 Int)
(declare-const x@26@01 $Ref)
(declare-const y@27@01 $Ref)
(declare-const n@28@01 Int)
(push) ; 1
(declare-const $t@29@01 Int)
(assert (not (= x@26@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
; [eval] n == 42
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= n@28@01 42))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= n@28@01 42)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | n@28@01 == 42 | live]
; [else-branch: 3 | n@28@01 != 42 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | n@28@01 == 42]
(assert (= n@28@01 42))
(assert (not (= y@27@01 $Ref.null)))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@27@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@30@01))) $t@29@01))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | n@28@01 != 42]
(assert (not (= n@28@01 42)))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.second ($Snap.second $t@30@01)) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@30@01))) $t@29@01))
(pop) ; 3
(pop) ; 2
(push) ; 2
(declare-const n@31@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@32@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
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
; [eval] n != 0
(pop) ; 5
(push) ; 5
; [eval] !(n != 0)
; [eval] n != 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] n != 0
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@31@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= n@31@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | n@31@01 != 0 | live]
; [else-branch: 4 | n@31@01 == 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | n@31@01 != 0]
(assert (not (= n@31@01 0)))
; [exec]
; n := n - 1
; [eval] n - 1
(declare-const n@33@01 Int)
(assert (= n@33@01 (- n@31@01 1)))
; [eval] n == 42
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@33@01 42))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@33@01 42)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | n@33@01 == 42 | live]
; [else-branch: 5 | n@33@01 != 42 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | n@33@01 == 42]
(assert (= n@33@01 42))
; [exec]
; inhale acc(y.f, write)
(declare-const $t@34@01 Int)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@26@01 y@27@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@27@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(assert (= $t@32@01 $t@29@01))
; [exec]
; label brk
; [eval] n == 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n@33@01 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | n@33@01 == 0 | dead]
; [else-branch: 6 | n@33@01 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 6 | n@33@01 != 0]
(assert (not (= n@33@01 0)))
(pop) ; 7
; [eval] !(n == 0)
; [eval] n == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (= n@33@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n@33@01 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | n@33@01 != 0 | live]
; [else-branch: 7 | n@33@01 == 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 7 | n@33@01 != 0]
(assert (not (= n@33@01 0)))
; [eval] n == 42
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= n@33@01 42))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | n@33@01 == 42 | live]
; [else-branch: 8 | n@33@01 != 42 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 8 | n@33@01 == 42]
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 5 | n@33@01 != 42]
(assert (not (= n@33@01 42)))
(pop) ; 6
; [eval] !(n == 42)
; [eval] n == 42
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@33@01 42)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@33@01 42))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | n@33@01 != 42 | live]
; [else-branch: 9 | n@33@01 == 42 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | n@33@01 != 42]
(assert (not (= n@33@01 42)))
; Loop head block: Re-establish invariant
(pop) ; 6
(push) ; 6
; [else-branch: 9 | n@33@01 == 42]
(assert (= n@33@01 42))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 4 | n@31@01 == 0]
(assert (= n@31@01 0))
(pop) ; 5
(assert (= $t@32@01 $t@29@01))
; [eval] !(n != 0)
; [eval] n != 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= n@31@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@31@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | n@31@01 == 0 | live]
; [else-branch: 10 | n@31@01 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | n@31@01 == 0]
(assert (= n@31@01 0))
; [exec]
; label brk
; [eval] n == 0
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@31@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | n@31@01 == 0 | live]
; [else-branch: 11 | n@31@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 11 | n@31@01 == 0]
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 7
(assert (not (= (ite (= y@27@01 x@26@01) $Perm.Write $Perm.No) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(set-option :timeout 0)
(push) ; 7
(assert (not (= (ite (= y@27@01 x@26@01) $Perm.Write $Perm.No) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(set-option :timeout 0)
(push) ; 7
(assert (not (= (ite (= y@27@01 x@26@01) $Perm.Write $Perm.No) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(set-option :timeout 0)
(push) ; 7
(assert (not (= (ite (= y@27@01 x@26@01) $Perm.Write $Perm.No) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test20b ----------
(declare-const x@35@01 $Ref)
(declare-const y@36@01 $Ref)
(declare-const n@37@01 Int)
(declare-const x@38@01 $Ref)
(declare-const y@39@01 $Ref)
(declare-const n@40@01 Int)
(push) ; 1
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (not (= x@38@01 $Ref.null)))
(assert (= ($Snap.second $t@41@01) $Snap.unit))
; [eval] x != y
(assert (not (= x@38@01 y@39@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
; [eval] n == 42
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= n@40@01 42))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= n@40@01 42)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | n@40@01 == 42 | live]
; [else-branch: 12 | n@40@01 != 42 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | n@40@01 == 42]
(assert (= n@40@01 42))
(assert (not (= y@39@01 $Ref.null)))
(assert (=
  ($Snap.second $t@42@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@01))
    ($Snap.second ($Snap.second $t@42@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@39@01 x@38@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@42@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 12 | n@40@01 != 42]
(assert (not (= n@40@01 42)))
(assert (= ($Snap.first $t@42@01) $Snap.unit))
(assert (=
  ($Snap.second $t@42@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@01))
    ($Snap.second ($Snap.second $t@42@01)))))
(assert (= ($Snap.second ($Snap.second $t@42@01)) $Snap.unit))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@42@01)))
  ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))
(pop) ; 3
(pop) ; 2
(push) ; 2
(declare-const n@43@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@44@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
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
; [eval] n != 0
(pop) ; 5
(push) ; 5
; [eval] !(n != 0)
; [eval] n != 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] n != 0
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= n@43@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | n@43@01 != 0 | live]
; [else-branch: 13 | n@43@01 == 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | n@43@01 != 0]
(assert (not (= n@43@01 0)))
; [exec]
; n := n - 1
; [eval] n - 1
(declare-const n@45@01 Int)
(assert (= n@45@01 (- n@43@01 1)))
; [eval] n == 42
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@45@01 42))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@45@01 42)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | n@45@01 == 42 | live]
; [else-branch: 14 | n@45@01 != 42 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 14 | n@45@01 == 42]
(assert (= n@45@01 42))
; [exec]
; inhale acc(y.f, write)
(declare-const $t@46@01 Int)
(push) ; 7
(set-option :timeout 10)
(assert (not (= x@38@01 y@39@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@39@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(assert (= $t@44@01 ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))
; [exec]
; label brk
; [eval] n == 0
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n@45@01 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | n@45@01 == 0 | dead]
; [else-branch: 15 | n@45@01 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 15 | n@45@01 != 0]
(assert (not (= n@45@01 0)))
(pop) ; 7
; [eval] !(n == 0)
; [eval] n == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (= n@45@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n@45@01 0))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | n@45@01 != 0 | live]
; [else-branch: 16 | n@45@01 == 0 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 16 | n@45@01 != 0]
(assert (not (= n@45@01 0)))
; [eval] n == 42
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= n@45@01 42))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | n@45@01 == 42 | live]
; [else-branch: 17 | n@45@01 != 42 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 17 | n@45@01 == 42]
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 14 | n@45@01 != 42]
(assert (not (= n@45@01 42)))
(pop) ; 6
; [eval] !(n == 42)
; [eval] n == 42
(push) ; 6
(set-option :timeout 10)
(assert (not (= n@45@01 42)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@45@01 42))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | n@45@01 != 42 | live]
; [else-branch: 18 | n@45@01 == 42 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | n@45@01 != 42]
(assert (not (= n@45@01 42)))
; Loop head block: Re-establish invariant
(pop) ; 6
(push) ; 6
; [else-branch: 18 | n@45@01 == 42]
(assert (= n@45@01 42))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 13 | n@43@01 == 0]
(assert (= n@43@01 0))
(pop) ; 5
(assert (= $t@44@01 ($SortWrappers.$SnapToInt ($Snap.first $t@41@01))))
; [eval] !(n != 0)
; [eval] n != 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= n@43@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= n@43@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | n@43@01 == 0 | live]
; [else-branch: 19 | n@43@01 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | n@43@01 == 0]
(assert (= n@43@01 0))
; [exec]
; label brk
; [eval] n == 0
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@43@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | n@43@01 == 0 | live]
; [else-branch: 20 | n@43@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 20 | n@43@01 == 0]
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 7
(assert (not (= (ite (= y@39@01 x@38@01) $Perm.Write $Perm.No) $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= (ite (= y@39@01 x@38@01) $Perm.Write $Perm.No) $Perm.No))
; [eval] n == 42
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= n@43@01 42))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | n@43@01 == 42 | dead]
; [else-branch: 21 | n@43@01 != 42 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 21 | n@43@01 != 42]
(assert (not (= n@43@01 42)))
; [eval] x.f == old(x.f)
; [eval] old(x.f)
(pop) ; 7
(pop) ; 6
; [eval] !(n == 0)
; [eval] n == 0
; [then-branch: 22 | n@43@01 != 0 | dead]
; [else-branch: 22 | n@43@01 == 0 | live]
(push) ; 6
; [else-branch: 22 | n@43@01 == 0]
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 19 | n@43@01 != 0]
(assert (not (= n@43@01 0)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
