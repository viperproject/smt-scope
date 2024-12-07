(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:53:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0232.vpr
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
(declare-const c@0@01 $Ref)
(declare-const d@1@01 $Ref)
(declare-const e@2@01 $Ref)
(declare-const c@3@01 $Ref)
(declare-const d@4@01 $Ref)
(declare-const e@5@01 $Ref)
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
; inhale acc(P(c), write)
(declare-const $t@6@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(d), write)
(declare-const $t@7@01 $Snap)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= c@3@01 d@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (perm(P(e)) > none ? acc(P(e), perm(P(e))) : true)
; [eval] perm(P(e)) > none
; [eval] perm(P(e))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (>
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>
  (+
    (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
    (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | (e@5@01 == d@4@01 ? W : Z) + (e@5@01 == c@3@01 ? W : Z) > Z | live]
; [else-branch: 0 | !((e@5@01 == d@4@01 ? W : Z) + (e@5@01 == c@3@01 ? W : Z) > Z) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | (e@5@01 == d@4@01 ? W : Z) + (e@5@01 == c@3@01 ? W : Z) > Z]
(assert (>
  (+
    (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
    (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
  $Perm.No))
; [eval] perm(P(e))
(push) ; 4
(assert (not (or
  (=
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
    $Perm.No)
  (<
    $Perm.No
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= d@4@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= c@3@01 e@5@01)))
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
(assert (not (= d@4@01 c@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@6@01 $t@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@7@01 $t@6@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= c@3@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= d@4@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (+
    (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
    (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
  $Perm.No)))
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
(assert (not (= d@4@01 c@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@6@01 $t@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@7@01 $t@6@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] perm(P(e))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
    $Perm.No)
  (<
    $Perm.No
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= c@3@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= d@4@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (+
    (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
    (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
  $Perm.No)))
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
(assert (not (= c@3@01 d@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@7@01 $t@6@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $t@6@01 $t@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= d@4@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= c@3@01 e@5@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (+
    (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
    (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !((e@5@01 == d@4@01 ? W : Z) + (e@5@01 == c@3@01 ? W : Z) > Z)]
(assert (not
  (>
    (+
      (ite (= e@5@01 d@4@01) $Perm.Write $Perm.No)
      (ite (= e@5@01 c@3@01) $Perm.Write $Perm.No))
    $Perm.No)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const this@8@01 $Ref)
(declare-const this@9@01 $Ref)
(push) ; 1
(declare-const $t@10@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(P(this), none)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale acc(P(this), perm(P(this)))
; [eval] perm(P(this))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const this@11@01 $Ref)
(declare-const this@12@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@13@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (perm(P(this)) > none ? acc(P(this), perm(P(this))) : true)
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
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
; [eval] perm(P(this))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const this@14@01 $Ref)
(declare-const this@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (not (= this@15@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(P(this.f), perm(P(this.f)))
; [eval] perm(P(this.f))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const this@17@01 $Ref)
(declare-const this@18@01 $Ref)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (not (= this@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (perm(P(this.f)) > none ? acc(P(this.f), perm(P(this.f))) : true)
; [eval] perm(P(this.f)) > none
; [eval] perm(P(this.f))
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | True]
; [eval] perm(P(this.f))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const this@20@01 $Ref)
(declare-const a@21@01 $Ref)
(declare-const this@22@01 $Ref)
(declare-const a@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
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
; exhale (perm(P(this.f)) > none ? acc(P(this.f), perm(P(this.f))) : true)
; [eval] perm(P(this.f)) > none
; [eval] perm(P(this.f))
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (>
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
      $Perm.Write
      $Perm.No)
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>
  (ite
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
    $Perm.Write
    $Perm.No)
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | (First:($t@24@01) == a@23@01 ? W : Z) > Z | live]
; [else-branch: 3 | !((First:($t@24@01) == a@23@01 ? W : Z) > Z) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | (First:($t@24@01) == a@23@01 ? W : Z) > Z]
(assert (>
  (ite
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
    $Perm.Write
    $Perm.No)
  $Perm.No))
; [eval] perm(P(this.f))
(push) ; 4
(assert (not (or
  (=
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
      $Perm.Write
      $Perm.No)
    $Perm.No)
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@23@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
        $Perm.Write
        $Perm.No)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
        $Perm.Write
        $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
          $Perm.Write
          $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
        $Perm.Write
        $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite
          (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
          $Perm.Write
          $Perm.No)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | !((First:($t@24@01) == a@23@01 ? W : Z) > Z)]
(assert (not
  (>
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@24@01)) a@23@01)
      $Perm.Write
      $Perm.No)
    $Perm.No)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const this@25@01 $Ref)
(declare-const a@26@01 $Ref)
(declare-const b@27@01 $Ref)
(declare-const this@28@01 $Ref)
(declare-const a@29@01 $Ref)
(declare-const b@30@01 $Ref)
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
(declare-const $t@31@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (perm(P(this)) > none ? acc(P(this), perm(P(this))) : true)
; [eval] perm(P(this)) > none
; [eval] perm(P(this))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | True]
; [eval] perm(P(this))
; [exec]
; inhale acc(P(a), write)
(declare-const $t@32@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (perm(P(a)) > none ? acc(P(a), perm(P(a))) : true)
; [eval] perm(P(a)) > none
; [eval] perm(P(a))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | True]
; [eval] perm(P(a))
; [exec]
; inhale acc(P(b), write)
(declare-const $t@33@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (perm(P(b)) > none ? acc(P(b), perm(P(b))) : true)
; [eval] perm(P(b)) > none
; [eval] perm(P(b))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | True]
; [eval] perm(P(b))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
