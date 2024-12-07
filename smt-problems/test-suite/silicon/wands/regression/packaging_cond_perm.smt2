(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:36:55
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/packaging_cond_perm.vpr
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
(declare-sort $MWSF 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
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
; ---------- t01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; package acc(x.f, 1 / 2) && x.f > -1 --* acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2)) {
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] x.f > -1
; [eval] -1
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) (- 0 1)))
; [eval] (x.f > 0 ? 1 / 4 : 1 / 2)
; [eval] x.f > 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:($t@2@01) > 0 | live]
; [else-branch: 0 | !(First:($t@2@01) > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | First:($t@2@01) > 0]
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(First:($t@2@01) > 0)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0))
  (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)))
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (=
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2)))
    $Perm.No)
  (<
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2)))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))))
(assert (<=
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2))))))
  (not (= x@1@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    $Perm.No)
  (<
    (-
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<=
  $Perm.No
  ($Perm.min
    (/ (to_real 1) (to_real 2))
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2))))))
(assert (<=
  ($Perm.min
    (/ (to_real 1) (to_real 2))
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  (not (= x@1@01 $Ref.null))))
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) && x.f > -1 --* acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2))
(declare-const mwsf@3@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@3@01 $t@2@01) ($Snap.first $t@2@01))
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-0|)))
; [eval] -1
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@2@01 $Snap)) (!
  (and
    (and
      (<=
        $Perm.No
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2))))))
      (<=
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            (/ (to_real 1) (to_real 2))
            ($Perm.min
              (/ (to_real 1) (to_real 2))
              (ite
                (> ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 0)
                (/ (to_real 1) (to_real 4))
                (/ (to_real 1) (to_real 2))))))
        (not (= x@1@01 $Ref.null))))
    (= (MWSF_apply mwsf@3@01 $t@2@01) ($Snap.first $t@2@01)))
  :pattern ((MWSF_apply mwsf@3@01 $t@2@01))
  :qid |quant-u-1|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t02 ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
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
; inhale acc(x.f, 2 / 4)
(declare-const $t@6@01 Int)
(assert (not (= x@5@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; package acc(x.f, 2 / 4) && x.f > 0 --*
; acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 2 / 4 : 1 / 4)) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] x.f > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 0))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(check-sat)
; unknown
; [eval] (x.f > 0 ? 2 / 4 : 1 / 4)
; [eval] x.f > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:($t@7@01) > 0 | live]
; [else-branch: 1 | !(First:($t@7@01) > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:($t@7@01) > 0]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) $t@6@01))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, 2 / 4) && x.f > 0 --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 2 / 4 : 1 / 4))
(declare-const mwsf@8@01 $MWSF)
(assert (forall (($t@7@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@8@01 $t@7@01)
    ($Snap.combine ($Snap.first $t@7@01) ($SortWrappers.IntTo$Snap $t@6@01)))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-2|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@7@01 $Snap)) (!
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first $t@7@01)) $t@6@01)
    (=
      (MWSF_apply mwsf@8@01 $t@7@01)
      ($Snap.combine ($Snap.first $t@7@01) ($SortWrappers.IntTo$Snap $t@6@01))))
  :pattern ((MWSF_apply mwsf@8@01 $t@7@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; exhale acc(x.f, 1 / 4)
; [exec]
; exhale acc(x.f, 1 / 4)
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
; ---------- t03 ----------
(declare-const x@9@01 $Ref)
(declare-const x@10@01 $Ref)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2)) {
; }
(push) ; 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
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
(check-sat)
; unknown
; [eval] (x.f > 0 ? 1 / 4 : 1 / 2)
; [eval] x.f > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | Second:($t@11@01) > 0 | live]
; [else-branch: 2 | !(Second:($t@11@01) > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | Second:($t@11@01) > 0]
(assert (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(Second:($t@11@01) > 0)]
(assert (not (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0))
  (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)))
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (=
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2)))
    $Perm.No)
  (<
    (ite
      (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
      (/ (to_real 1) (to_real 4))
      (/ (to_real 1) (to_real 2)))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))))
(assert (<=
  (-
    (/ (to_real 1) (to_real 2))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2))))))
  (not (= x@10@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    $Perm.No)
  (<
    (-
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<=
  $Perm.No
  (+
    (/ (to_real 1) (to_real 4))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))))
(assert (<=
  (+
    (/ (to_real 1) (to_real 4))
    ($Perm.min
      (/ (to_real 1) (to_real 2))
      (ite
        (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
        (/ (to_real 1) (to_real 4))
        (/ (to_real 1) (to_real 2)))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2))))))
  (not (= x@10@01 $Ref.null))))
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2))
(declare-const mwsf@13@01 $MWSF)
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.combine ($Snap.second $t@11@01) ($Snap.second $t@11@01)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-4|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@12@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@13@01 $t@12@01)
    ($Snap.combine ($Snap.second $t@11@01) ($Snap.second $t@11@01)))
  :pattern ((MWSF_apply mwsf@13@01 $t@12@01))
  :qid |quant-u-5|)))
(assert true)
(assert (and
  (<=
    $Perm.No
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2))))))
  (<=
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    $Perm.Write)
  (=>
    (<
      $Perm.No
      (-
        (/ (to_real 1) (to_real 2))
        ($Perm.min
          (/ (to_real 1) (to_real 2))
          (ite
            (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
            (/ (to_real 1) (to_real 4))
            (/ (to_real 1) (to_real 2))))))
    (not (= x@10@01 $Ref.null)))))
; [exec]
; exhale acc(x.f, 1 / 4)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    ($Perm.min
      (-
        (/ (to_real 1) (to_real 2))
        ($Perm.min
          (/ (to_real 1) (to_real 2))
          (ite
            (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
            (/ (to_real 1) (to_real 4))
            (/ (to_real 1) (to_real 2)))))
      (/ (to_real 1) (to_real 4))))
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
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    ($Perm.min
      (-
        (/ (to_real 1) (to_real 2))
        ($Perm.min
          (/ (to_real 1) (to_real 2))
          (ite
            (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
            (/ (to_real 1) (to_real 4))
            (/ (to_real 1) (to_real 2)))))
      (/ (to_real 1) (to_real 4))))
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
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    ($Perm.min
      (-
        (/ (to_real 1) (to_real 2))
        ($Perm.min
          (/ (to_real 1) (to_real 2))
          (ite
            (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
            (/ (to_real 1) (to_real 4))
            (/ (to_real 1) (to_real 2)))))
      (/ (to_real 1) (to_real 4))))
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
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ (to_real 1) (to_real 2))
      ($Perm.min
        (/ (to_real 1) (to_real 2))
        (ite
          (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
          (/ (to_real 1) (to_real 4))
          (/ (to_real 1) (to_real 2)))))
    ($Perm.min
      (-
        (/ (to_real 1) (to_real 2))
        ($Perm.min
          (/ (to_real 1) (to_real 2))
          (ite
            (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
            (/ (to_real 1) (to_real 4))
            (/ (to_real 1) (to_real 2)))))
      (/ (to_real 1) (to_real 4))))
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
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 4))
      ($Perm.min
        (-
          (/ (to_real 1) (to_real 2))
          ($Perm.min
            (/ (to_real 1) (to_real 2))
            (ite
              (> ($SortWrappers.$SnapToInt ($Snap.second $t@11@01)) 0)
              (/ (to_real 1) (to_real 4))
              (/ (to_real 1) (to_real 2)))))
        (/ (to_real 1) (to_real 4))))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t04 ----------
(declare-const x@14@01 $Ref)
(declare-const x@15@01 $Ref)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.second ($Snap.second $t@16@01)) $Snap.unit))
; [eval] x.f > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@16@01))) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2)) {
; }
(push) ; 3
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
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
(check-sat)
; unknown
; [eval] (x.f > 0 ? 1 / 4 : 1 / 2)
; [eval] x.f > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@16@01))) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:($t@16@01)) > 0 | live]
; [else-branch: 3 | !(First:(Second:($t@16@01)) > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | First:(Second:($t@16@01)) > 0]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2))
(declare-const mwsf@18@01 $MWSF)
(assert (forall (($t@17@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@18@01 $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.first ($Snap.second $t@16@01))))
  :pattern ((MWSF_apply mwsf@18@01 $t@17@01))
  :qid |quant-u-6|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@17@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@18@01 $t@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@16@01))
      ($Snap.first ($Snap.second $t@16@01))))
  :pattern ((MWSF_apply mwsf@18@01 $t@17@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; exhale acc(x.f, 1 / 4)
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
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- t05 ----------
(declare-const x@19@01 $Ref)
(declare-const x@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] x != null
(assert (not (= x@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.second ($Snap.second $t@21@01)) $Snap.unit))
; [eval] x.f > 0
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@21@01))) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2)) {
; }
(push) ; 3
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
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
(check-sat)
; unknown
; [eval] (x.f > 0 ? 1 / 4 : 1 / 2)
; [eval] x.f > 0
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@21@01))) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:($t@21@01)) > 0 | live]
; [else-branch: 4 | !(First:(Second:($t@21@01)) > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | First:(Second:($t@21@01)) > 0]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
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
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(x.f, 1 / 4) && acc(x.f, (x.f > 0 ? 1 / 4 : 1 / 2))
(declare-const mwsf@23@01 $MWSF)
(assert (forall (($t@22@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@22@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@21@01))
      ($Snap.first ($Snap.second $t@21@01))))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-8|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@22@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@22@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@21@01))
      ($Snap.first ($Snap.second $t@21@01))))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; exhale acc(x.f, 1 / 2)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
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
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
