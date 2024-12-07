(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/annotation/annotationJoinsStateCons.vpr
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
; ---------- testMin1 ----------
(declare-const r@0@01 $Ref)
(declare-const b@1@01 Bool)
(declare-const r@2@01 $Ref)
(declare-const b@3@01 Bool)
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
; inhale acc(r.f, 1 / 2)
(declare-const $t@4@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(r.f, 1 / 2)
(declare-const $t@5@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- testMin2 ----------
(declare-const r@6@01 $Ref)
(declare-const b@7@01 Bool)
(declare-const r@8@01 $Ref)
(declare-const b@9@01 Bool)
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
; inhale acc(r.f, 1 / 2)
(declare-const $t@10@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(r.f, 1 / 2)
(declare-const $t@11@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- testMin3 ----------
(declare-const r@12@01 $Ref)
(declare-const b@13@01 Bool)
(declare-const r@14@01 $Ref)
(declare-const b@15@01 Bool)
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
; inhale acc(r.f, 1 / 2)
(declare-const $t@16@01 Int)
(assert (not (= r@14@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(r.f, 1 / 2)
(declare-const $t@17@01 Int)
(assert (= $t@16@01 $t@17@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 2
(pop) ; 1
; ---------- testMin4 ----------
(declare-const r@18@01 $Ref)
(declare-const b@19@01 Bool)
(declare-const r@20@01 $Ref)
(declare-const b@21@01 Bool)
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
; inhale acc(r.f, 1 / 2)
(declare-const $t@22@01 Int)
(assert (not (= r@20@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(r.f, 1 / 2)
(declare-const $t@23@01 Int)
(assert (= $t@22@01 $t@23@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 2
(pop) ; 1
; ---------- testJoin1 ----------
(declare-const r@24@01 $Ref)
(declare-const b@25@01 Bool)
(declare-const r@26@01 $Ref)
(declare-const b@27@01 Bool)
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
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@27@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@27@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@27@01 | live]
; [else-branch: 0 | !(b@27@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | b@27@01]
(assert b@27@01)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@27@01 | live]
; [else-branch: 1 | !(b@27@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | b@27@01]
; [exec]
; inhale acc(r.f, write)
(declare-const $t@28@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | !(b@27@01)]
(assert (not b@27@01))
; [eval] !b
(push) ; 5
(set-option :timeout 10)
(assert (not b@27@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | !(b@27@01) | live]
; [else-branch: 2 | b@27@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | !(b@27@01)]
; [exec]
; inhale acc(r.f, write)
(declare-const $t@29@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b@27@01) b@27@01))
; [exec]
; exhale acc(r.f, write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@27@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@27@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@27@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@27@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@27@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- testJoin2 ----------
(declare-const r@30@01 $Ref)
(declare-const b@31@01 Bool)
(declare-const r@32@01 $Ref)
(declare-const b@33@01 Bool)
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
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@33@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@33@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@33@01 | live]
; [else-branch: 3 | !(b@33@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | b@33@01]
(assert b@33@01)
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@33@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b@33@01 | live]
; [else-branch: 4 | !(b@33@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | b@33@01]
; [exec]
; inhale acc(r.f, write)
(declare-const $t@34@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | !(b@33@01)]
(assert (not b@33@01))
; [eval] !b
(push) ; 5
(set-option :timeout 10)
(assert (not b@33@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(b@33@01) | live]
; [else-branch: 5 | b@33@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(b@33@01)]
; [exec]
; inhale acc(r.f, write)
(declare-const $t@35@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b@33@01) b@33@01))
; [exec]
; exhale acc(r.f, write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@33@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@33@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@33@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (ite b@33@01 $Perm.Write $Perm.No)
    ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (- $Perm.Write ($Perm.min (ite b@33@01 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- testJoin3 ----------
(declare-const r@36@01 $Ref)
(declare-const b@37@01 Bool)
(declare-const r@38@01 $Ref)
(declare-const b@39@01 Bool)
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
(set-option :timeout 10)
(assert (not (not b@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@39@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | b@39@01 | live]
; [else-branch: 6 | !(b@39@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | b@39@01]
(assert b@39@01)
; [exec]
; inhale acc(r.f, write)
(declare-const $t@40@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 6 | !(b@39@01)]
(assert (not b@39@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@39@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(b@39@01) | live]
; [else-branch: 7 | b@39@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(b@39@01)]
(assert (not b@39@01))
; [exec]
; inhale acc(r.f, write)
(declare-const $t@41@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 7 | b@39@01]
(assert b@39@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testJoin4 ----------
(declare-const r@42@01 $Ref)
(declare-const b@43@01 Bool)
(declare-const r@44@01 $Ref)
(declare-const b@45@01 Bool)
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
(set-option :timeout 10)
(assert (not (not b@45@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@45@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@45@01 | live]
; [else-branch: 8 | !(b@45@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | b@45@01]
(assert b@45@01)
; [exec]
; inhale acc(r.f, write)
(declare-const $t@46@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 8 | !(b@45@01)]
(assert (not b@45@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@45@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@45@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(b@45@01) | live]
; [else-branch: 9 | b@45@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | !(b@45@01)]
(assert (not b@45@01))
; [exec]
; inhale acc(r.f, write)
(declare-const $t@47@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 9 | b@45@01]
(assert b@45@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- testJoin5 ----------
(declare-const r@48@01 $Ref)
(declare-const b@49@01 Bool)
(declare-const r@50@01 $Ref)
(declare-const b@51@01 Bool)
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
(set-option :timeout 10)
(assert (not (not b@51@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@51@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | b@51@01 | live]
; [else-branch: 10 | !(b@51@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | b@51@01]
(assert b@51@01)
; [exec]
; inhale acc(r.f, write)
(declare-const $t@52@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 10 | !(b@51@01)]
(assert (not b@51@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@51@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@51@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !(b@51@01) | live]
; [else-branch: 11 | b@51@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | !(b@51@01)]
(assert (not b@51@01))
; [exec]
; inhale acc(r.f, write)
(declare-const $t@53@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(r.f, write)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 11 | b@51@01]
(assert b@51@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
