(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0259.vpr
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
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; ---------- test ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
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
(declare-const i@5@01 Int)
; [exec]
; i := 0
(declare-const i@6@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] i <= 10
(assert (<= i@6@01 10))
(pop) ; 3
(set-option :timeout 0)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] i <= 10
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
(assert (<= i@6@01 10))
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
(assert (not (not (< i@6@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@6@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | i@6@01 < 10 | live]
; [else-branch: 0 | !(i@6@01 < 10) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | i@6@01 < 10]
(assert (< i@6@01 10))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@8@01 Int)
(assert (= i@8@01 (+ i@6@01 1)))
; Loop head block: Re-establish invariant
; [eval] i <= 10
(push) ; 6
(assert (not (<= i@8@01 10)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@8@01 10))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@6@01 < 10)]
(assert (not (< i@6@01 10)))
(pop) ; 5
(assert (= ($Snap.first $t@7@01) ($Snap.first $t@4@01)))
(assert (= ($Snap.first ($Snap.second $t@7@01)) ($Snap.second $t@4@01)))
; [eval] !(i < 10)
; [eval] i < 10
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@6@01 10)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@6@01 10))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(i@6@01 < 10) | live]
; [else-branch: 1 | i@6@01 < 10 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | !(i@6@01 < 10)]
(assert (not (< i@6@01 10)))
; [exec]
; assert (unfolding acc(P(x), write) in x.f) ==
;   old((unfolding acc(P(x), write) in x.f))
; [eval] (unfolding acc(P(x), write) in x.f) == old((unfolding acc(P(x), write) in x.f))
; [eval] (unfolding acc(P(x), write) in x.f)
(push) ; 6
(assert (P%trigger ($Snap.first $t@7@01) x@2@01))
(assert (not (= x@2@01 $Ref.null)))
(pop) ; 6
; Joined path conditions
(assert (and (P%trigger ($Snap.first $t@7@01) x@2@01) (not (= x@2@01 $Ref.null))))
; [eval] old((unfolding acc(P(x), write) in x.f))
; [eval] (unfolding acc(P(x), write) in x.f)
(push) ; 6
(assert (P%trigger ($Snap.first $t@4@01) x@2@01))
(pop) ; 6
; Joined path conditions
(assert (P%trigger ($Snap.first $t@4@01) x@2@01))
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@7@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@7@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@4@01))))
; [exec]
; assert (unfolding acc(P(y), write) in y.f) ==
;   old((unfolding acc(P(y), write) in y.f))
; [eval] (unfolding acc(P(y), write) in y.f) == old((unfolding acc(P(y), write) in y.f))
; [eval] (unfolding acc(P(y), write) in y.f)
(push) ; 6
(assert (P%trigger ($Snap.first ($Snap.second $t@7@01)) y@3@01))
(assert (not (= y@3@01 $Ref.null)))
(pop) ; 6
; Joined path conditions
(assert (and
  (P%trigger ($Snap.first ($Snap.second $t@7@01)) y@3@01)
  (not (= y@3@01 $Ref.null))))
; [eval] old((unfolding acc(P(y), write) in y.f))
; [eval] (unfolding acc(P(y), write) in y.f)
(push) ; 6
(assert (P%trigger ($Snap.second $t@4@01) y@3@01))
(pop) ; 6
; Joined path conditions
(assert (P%trigger ($Snap.second $t@4@01) y@3@01))
(push) ; 6
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@7@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@4@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@7@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@4@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | i@6@01 < 10]
(assert (< i@6@01 10))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
