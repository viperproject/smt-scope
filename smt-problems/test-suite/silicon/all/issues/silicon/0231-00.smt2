(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0231.vpr
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
; ---------- test01 ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale perm(P(this)) == write &&
;   (acc(P(this), write) && perm(P(this)) == none)
; [eval] perm(P(this)) == write
; [eval] perm(P(this))
; [eval] perm(P(this)) == none
; [eval] perm(P(this))
(pop) ; 2
(pop) ; 1
; ---------- test02a ----------
(declare-const this@3@01 $Ref)
(declare-const this@4@01 $Ref)
(push) ; 1
(declare-const $t@5@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forperm r: Ref [P(r)] :: false) &&
;   (acc(P(this), write) && (forperm r: Ref [P(r)] :: false))
; [eval] (forperm r: Ref [P(r)] :: false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm r: Ref [P(r)] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm r: Ref [P(r)] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forperm r: Ref [P(r)] :: false)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02b ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(P(this), write) && (forperm r: Ref [P(r)] :: false)
; [eval] (forperm r: Ref [P(r)] :: false)
(pop) ; 2
(pop) ; 1
; ---------- test04a ----------
(declare-const this@9@01 $Ref)
(declare-const this@10@01 $Ref)
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
; inhale acc(P(this), write)
(declare-const $t@11@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(P(this), write) && perm(P(this)) >= write
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04b ----------
(declare-const this@12@01 $Ref)
(declare-const this@13@01 $Ref)
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
; inhale acc(P(this), write)
(declare-const $t@14@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(P(this), write)
; [exec]
; exhale perm(P(this)) >= write ==> acc(P(this), write)
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 4 | False | dead]
; [else-branch: 4 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 4 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test04c ----------
(declare-const this@15@01 $Ref)
(declare-const this@16@01 $Ref)
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
; inhale acc(P(this), write)
(declare-const $t@17@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(P(this), write) &&
;   (perm(P(this)) >= write ==> acc(P(this), write))
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 5 | False | dead]
; [else-branch: 5 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 5 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03a ----------
(declare-const this@18@01 $Ref)
(declare-const this@19@01 $Ref)
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
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (= ($Snap.first ($Snap.second $t@20@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@20@01)) $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
; [then-branch: 6 | False | dead]
; [else-branch: 6 | True | live]
(push) ; 4
; [else-branch: 6 | True]
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 5
; [else-branch: 7 | True]
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 6
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (= ($Snap.first ($Snap.second $t@20@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@20@01)) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
(push) ; 7
; [eval] !true
(pop) ; 7
; Loop head block: Follow loop-internal edges
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | True]
; Loop head block: Re-establish invariant
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
(push) ; 8
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 9 | True]
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 10 | False | dead]
; [else-branch: 10 | True | live]
(push) ; 9
; [else-branch: 10 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] !true
; [then-branch: 11 | False | dead]
; [else-branch: 11 | True | live]
(push) ; 7
; [else-branch: 11 | True]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test03b ----------
(declare-const this@21@01 $Ref)
(declare-const this@22@01 $Ref)
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
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
; [then-branch: 12 | False | dead]
; [else-branch: 12 | True | live]
(push) ; 4
; [else-branch: 12 | True]
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 13 | False | dead]
; [else-branch: 13 | True | live]
(push) ; 5
; [else-branch: 13 | True]
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 6
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
(push) ; 7
; [eval] !true
(pop) ; 7
; Loop head block: Follow loop-internal edges
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | True | live]
; [else-branch: 14 | False | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 14 | True]
; [exec]
; exhale acc(P(this), write)
; Loop head block: Re-establish invariant
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
; [then-branch: 15 | False | dead]
; [else-branch: 15 | True | live]
(push) ; 8
; [else-branch: 15 | True]
; [eval] perm(P(this)) >= write
; [eval] perm(P(this))
; [then-branch: 16 | False | dead]
; [else-branch: 16 | True | live]
(push) ; 9
; [else-branch: 16 | True]
(pop) ; 9
(pop) ; 8
(pop) ; 7
; [eval] !true
; [then-branch: 17 | False | dead]
; [else-branch: 17 | True | live]
(push) ; 7
; [else-branch: 17 | True]
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
