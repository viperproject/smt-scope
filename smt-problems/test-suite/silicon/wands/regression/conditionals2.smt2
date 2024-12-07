(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/regression/conditionals2.vpr
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
; ---------- test5a ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) && acc(x.g, (x.f ? write : none)) {
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
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
; [eval] (x.f ? write : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@3@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@3@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | $t@3@01 | live]
; [else-branch: 0 | !($t@3@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | $t@3@01]
(assert ($SortWrappers.$SnapToBool $t@3@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !($t@3@01)]
(assert (not ($SortWrappers.$SnapToBool $t@3@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool $t@3@01))
  ($SortWrappers.$SnapToBool $t@3@01)))
(push) ; 4
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No) $Perm.No)
  ($SortWrappers.$SnapToBool $t@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No) $Perm.No)
  (< (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No) $Perm.No))))
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))))
  (not (= x@1@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
  (not (= x@1@01 $Ref.null))))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && acc(x.g, (x.f ? write : none))
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@3@01)
    ($Snap.combine $t@3@01 ($Snap.second $t@2@01)))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-0|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@3@01 $Snap)) (!
  (and
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))))
        (not (= x@1@01 $Ref.null))))
    (=
      (MWSF_apply mwsf@4@01 $t@3@01)
      ($Snap.combine $t@3@01 ($Snap.second $t@2@01))))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-1|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && acc(x.g, (x.f ? write : none))
(assert (=
  (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))
    ($Snap.second (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
; [eval] (x.f ? write : none)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(mwsf@4@01[First:($t@2@01)]) | live]
; [else-branch: 1 | !(First:(mwsf@4@01[First:($t@2@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(mwsf@4@01[First:($t@2@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(First:(mwsf@4@01[First:($t@2@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))
(push) ; 4
(assert (not (or
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
      $Perm.Write
      $Perm.No)
    $Perm.No)
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@5@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No))))
    (= $t@5@01 ($SortWrappers.$SnapToInt ($Snap.second $t@2@01))))
  (=>
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
    (=
      $t@5@01
      ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))))))
(assert (<=
  $Perm.No
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
      $Perm.Write
      $Perm.No))))
(assert (<=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
      $Perm.Write
      $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No)))
  (not (= x@1@01 $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(x.g, 1 / 1000)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))))
(assert (<=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000)))))
  (not (= x@1@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
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
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
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
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
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
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
          $Perm.Write
          $Perm.No))
      (/ (to_real 1) (to_real 1000))))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
    $Perm.No)
  (<
    (-
      (/ (to_real 1) (to_real 1000))
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@3@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@4@01 ($Snap.first $t@2@01))))
            $Perm.Write
            $Perm.No))
        (/ (to_real 1) (to_real 1000))))
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
; ---------- test5b ----------
(declare-const x@6@01 $Ref)
(declare-const x@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (not (= x@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) && acc(x.g, (x.f ? write : none)) {
; }
(push) ; 3
(declare-const $t@9@01 $Snap)
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
; [eval] (x.f ? write : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@9@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@9@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | $t@9@01 | live]
; [else-branch: 2 | !($t@9@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | $t@9@01]
(assert ($SortWrappers.$SnapToBool $t@9@01))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !($t@9@01)]
(assert (not ($SortWrappers.$SnapToBool $t@9@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool $t@9@01))
  ($SortWrappers.$SnapToBool $t@9@01)))
(push) ; 4
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No) $Perm.No)
  ($SortWrappers.$SnapToBool $t@9@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No) $Perm.No)
  (< (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No) $Perm.No))))
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))))
  (not (= x@7@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
  (not (= x@7@01 $Ref.null))))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && acc(x.g, (x.f ? write : none))
(declare-const mwsf@10@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@10@01 $t@9@01)
    ($Snap.combine $t@9@01 ($Snap.second $t@8@01)))
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-2|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@9@01 $Snap)) (!
  (and
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))))
        (not (= x@7@01 $Ref.null))))
    (=
      (MWSF_apply mwsf@10@01 $t@9@01)
      ($Snap.combine $t@9@01 ($Snap.second $t@8@01))))
  :pattern ((MWSF_apply mwsf@10@01 $t@9@01))
  :qid |quant-u-3|)))
(assert true)
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && acc(x.g, (x.f ? write : none))
(assert (=
  (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))
    ($Snap.second (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
; [eval] (x.f ? write : none)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(mwsf@10@01[First:($t@8@01)]) | live]
; [else-branch: 3 | !(First:(mwsf@10@01[First:($t@8@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | First:(mwsf@10@01[First:($t@8@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(First:(mwsf@10@01[First:($t@8@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(push) ; 4
(assert (not (or
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
      $Perm.Write
      $Perm.No)
    $Perm.No)
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@11@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No))))
    (= $t@11@01 ($SortWrappers.$SnapToInt ($Snap.second $t@8@01))))
  (=>
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
    (=
      $t@11@01
      ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))))
(assert (<=
  $Perm.No
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
      $Perm.Write
      $Perm.No))))
(assert (<=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
      $Perm.Write
      $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
        $Perm.Write
        $Perm.No)))
  (not (= x@7@01 $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(mwsf@10@01[First:($t@8@01)]) | live]
; [else-branch: 4 | !(First:(mwsf@10@01[First:($t@8@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(mwsf@10@01[First:($t@8@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))
; [exec]
; assert acc(x.g, write)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
          $Perm.Write
          $Perm.No))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@9@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(First:(mwsf@10@01[First:($t@8@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(pop) ; 4
; [eval] !x.f
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(First:(mwsf@10@01[First:($t@8@01)])) | live]
; [else-branch: 5 | First:(mwsf@10@01[First:($t@8@01)]) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | !(First:(mwsf@10@01[First:($t@8@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01))))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | First:(mwsf@10@01[First:($t@8@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@10@01 ($Snap.first $t@8@01)))))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test20a ----------
(declare-const x@12@01 $Ref)
(declare-const x@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (not (= x@13@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) &&
; (acc(x.g, (x.f ? write : none)) && acc(x.h, (!x.f ? write : none))) {
; }
(push) ; 3
(declare-const $t@15@01 $Snap)
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
; [eval] (x.f ? write : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@15@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | $t@15@01 | live]
; [else-branch: 6 | !($t@15@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | $t@15@01]
(assert ($SortWrappers.$SnapToBool $t@15@01))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !($t@15@01)]
(assert (not ($SortWrappers.$SnapToBool $t@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool $t@15@01))
  ($SortWrappers.$SnapToBool $t@15@01)))
(push) ; 4
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No) $Perm.No)
  ($SortWrappers.$SnapToBool $t@15@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No) $Perm.No)
  (< (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No) $Perm.No))))
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))))
  (not (= x@13@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
  (not (= x@13@01 $Ref.null))))
; [eval] (!x.f ? write : none)
; [eval] !x.f
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@15@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !($t@15@01) | live]
; [else-branch: 7 | $t@15@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | !($t@15@01)]
(assert (not ($SortWrappers.$SnapToBool $t@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | $t@15@01]
(assert ($SortWrappers.$SnapToBool $t@15@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  ($SortWrappers.$SnapToBool $t@15@01)
  (not ($SortWrappers.$SnapToBool $t@15@01))))
(push) ; 4
(assert (not (or
  (=
    (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)
    $Perm.No)
  (not ($SortWrappers.$SnapToBool $t@15@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (=
    (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)
    $Perm.No)
  (<
    (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No))))
  (not (= x@13@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
  (not (= x@13@01 $Ref.null))))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.g, (x.f ? write : none)) && acc(x.h, (!x.f ? write : none)))
(declare-const mwsf@16@01 $MWSF)
(assert (forall (($t@15@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@16@01 $t@15@01)
    ($Snap.combine
      $t@15@01
      ($Snap.combine
        ($Snap.first ($Snap.second $t@14@01))
        ($Snap.second ($Snap.second $t@14@01)))))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-4|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@15@01 $Snap)) (!
  (and
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))))
        (not (= x@13@01 $Ref.null))))
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@15@01))
                $Perm.Write
                $Perm.No))))
        (not (= x@13@01 $Ref.null))))
    (=
      (MWSF_apply mwsf@16@01 $t@15@01)
      ($Snap.combine
        $t@15@01
        ($Snap.combine
          ($Snap.first ($Snap.second $t@14@01))
          ($Snap.second ($Snap.second $t@14@01))))))
  :pattern ((MWSF_apply mwsf@16@01 $t@15@01))
  :qid |quant-u-5|)))
(assert true)
; [exec]
; apply acc(x.f, write) --*
;   acc(x.f, write) &&
;   (acc(x.g, (x.f ? write : none)) && acc(x.h, (!x.f ? write : none)))
(assert (=
  (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))
    ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(assert (=
  ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
    ($Snap.second ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))
; [eval] (x.f ? write : none)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(mwsf@16@01[First:($t@14@01)]) | live]
; [else-branch: 8 | !(First:(mwsf@16@01[First:($t@14@01)])) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(mwsf@16@01[First:($t@14@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(First:(mwsf@16@01[First:($t@14@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(push) ; 4
(assert (not (or
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
      $Perm.Write
      $Perm.No)
    $Perm.No)
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@17@01 Int)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No))))
    (= $t@17@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@14@01)))))
  (=>
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
    (=
      $t@17@01
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))))
(assert (<=
  $Perm.No
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
      $Perm.Write
      $Perm.No))))
(assert (<=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
      $Perm.Write
      $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
        $Perm.Write
        $Perm.No)))
  (not (= x@13@01 $Ref.null))))
; [eval] (!x.f ? write : none)
; [eval] !x.f
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(First:(mwsf@16@01[First:($t@14@01)])) | live]
; [else-branch: 9 | First:(mwsf@16@01[First:($t@14@01)]) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | !(First:(mwsf@16@01[First:($t@14@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | First:(mwsf@16@01[First:($t@14@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))
(push) ; 4
(assert (not (or
  (=
    (ite
      (not
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
      $Perm.Write
      $Perm.No)
    $Perm.No)
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@18@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No))))
    (=
      $t@18@01
      ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second $t@14@01)))))
  (=>
    (not
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
    (=
      $t@18@01
      ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.second (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))))))
(assert (<=
  $Perm.No
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
    (ite
      (not
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
      $Perm.Write
      $Perm.No))))
(assert (<=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
    (ite
      (not
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
      $Perm.Write
      $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
      (ite
        (not
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
        $Perm.Write
        $Perm.No)))
  (not (= x@13@01 $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert acc(x.g, write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
          $Perm.Write
          $Perm.No))
      $Perm.Write))
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
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert acc(x.f, write) && (acc(x.g, write) && acc(x.h, write))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
      (ite
        ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
        (ite
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
          $Perm.Write
          $Perm.No))
      $Perm.Write))
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
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@15@01) $Perm.Write $Perm.No)))
          (ite
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
      (ite
        (not
          ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
        $Perm.Write
        $Perm.No))
    ($Perm.min
      (+
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@15@01)) $Perm.Write $Perm.No)))
        (ite
          (not
            ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
          $Perm.Write
          $Perm.No))
      $Perm.Write))
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
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@15@01))
                $Perm.Write
                $Perm.No)))
          (ite
            (not
              ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (+
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@15@01))
                $Perm.Write
                $Perm.No)))
          (ite
            (not
              ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply mwsf@16@01 ($Snap.first $t@14@01)))))
            $Perm.Write
            $Perm.No))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
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
; ---------- test20b ----------
(declare-const x@19@01 $Ref)
(declare-const x@20@01 $Ref)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (not (= x@20@01 $Ref.null)))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) &&
; (acc(x.g, (x.f ? write : none)) && acc(x.h, (!x.f ? write : none))) {
; }
(push) ; 3
(declare-const $t@22@01 $Snap)
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
; [eval] (x.f ? write : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@22@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@22@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | $t@22@01 | live]
; [else-branch: 10 | !($t@22@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | $t@22@01]
(assert ($SortWrappers.$SnapToBool $t@22@01))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !($t@22@01)]
(assert (not ($SortWrappers.$SnapToBool $t@22@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not ($SortWrappers.$SnapToBool $t@22@01))
  ($SortWrappers.$SnapToBool $t@22@01)))
(push) ; 4
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No) $Perm.No)
  ($SortWrappers.$SnapToBool $t@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (= (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No) $Perm.No)
  (< (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No) $Perm.No))))
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))))
  (not (= x@20@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  (not (= x@20@01 $Ref.null))))
; [eval] (!x.f ? write : none)
; [eval] !x.f
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool $t@22@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool $t@22@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !($t@22@01) | live]
; [else-branch: 11 | $t@22@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | !($t@22@01)]
(assert (not ($SortWrappers.$SnapToBool $t@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | $t@22@01]
(assert ($SortWrappers.$SnapToBool $t@22@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  ($SortWrappers.$SnapToBool $t@22@01)
  (not ($SortWrappers.$SnapToBool $t@22@01))))
(push) ; 4
(assert (not (or
  (=
    (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)
    $Perm.No)
  (not ($SortWrappers.$SnapToBool $t@22@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (or
  (=
    (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)
    $Perm.No)
  (<
    (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)
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
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
  (not (= x@20@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
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
    $Perm.Write
    (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
(assert (<=
  ($Perm.min
    $Perm.Write
    (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
  (not (= x@20@01 $Ref.null))))
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.g, (x.f ? write : none)) && acc(x.h, (!x.f ? write : none)))
(declare-const mwsf@23@01 $MWSF)
(assert (forall (($t@22@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@23@01 $t@22@01)
    ($Snap.combine
      $t@22@01
      ($Snap.combine
        ($Snap.first ($Snap.second $t@21@01))
        ($Snap.second ($Snap.second $t@21@01)))))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-6|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@22@01 $Snap)) (!
  (and
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))))
        (not (= x@20@01 $Ref.null))))
    (and
      (<=
        $Perm.No
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
      (<=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=>
        (<
          $Perm.No
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@22@01))
                $Perm.Write
                $Perm.No))))
        (not (= x@20@01 $Ref.null))))
    (=
      (MWSF_apply mwsf@23@01 $t@22@01)
      ($Snap.combine
        $t@22@01
        ($Snap.combine
          ($Snap.first ($Snap.second $t@21@01))
          ($Snap.second ($Snap.second $t@21@01))))))
  :pattern ((MWSF_apply mwsf@23@01 $t@22@01))
  :qid |quant-u-7|)))
(assert true)
; [exec]
; assert perm(x.g) == write && perm(x.h) == none ||
;   perm(x.h) == write && perm(x.g) == none
; [eval] perm(x.g) == write && perm(x.h) == none || perm(x.h) == write && perm(x.g) == none
; [eval] perm(x.g) == write && perm(x.h) == none
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(push) ; 4
; [then-branch: 12 | W - (min (W, ($t@22@01 ? W : Z))) != W | live]
; [else-branch: 12 | W - (min (W, ($t@22@01 ? W : Z))) == W | live]
(push) ; 5
; [then-branch: 12 | W - (min (W, ($t@22@01 ? W : Z))) != W]
(assert (not
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | W - (min (W, ($t@22@01 ? W : Z))) == W]
(assert (=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  $Perm.Write))
; [eval] perm(x.h) == none
; [eval] perm(x.h)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)
  (not
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write))))
(push) ; 4
; [then-branch: 13 | W - (min (W, ($t@22@01 ? W : Z))) == W && W - (min (W, (!($t@22@01) ? W : Z))) == Z | live]
; [else-branch: 13 | !(W - (min (W, ($t@22@01 ? W : Z))) == W && W - (min (W, (!($t@22@01) ? W : Z))) == Z) | live]
(push) ; 5
; [then-branch: 13 | W - (min (W, ($t@22@01 ? W : Z))) == W && W - (min (W, (!($t@22@01) ? W : Z))) == Z]
(assert (and
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.No)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(W - (min (W, ($t@22@01 ? W : Z))) == W && W - (min (W, (!($t@22@01) ? W : Z))) == Z)]
(assert (not
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.No))))
; [eval] perm(x.h) == write && perm(x.g) == none
; [eval] perm(x.h) == write
; [eval] perm(x.h)
(push) ; 6
; [then-branch: 14 | W - (min (W, (!($t@22@01) ? W : Z))) != W | live]
; [else-branch: 14 | W - (min (W, (!($t@22@01) ? W : Z))) == W | live]
(push) ; 7
; [then-branch: 14 | W - (min (W, (!($t@22@01) ? W : Z))) != W]
(assert (not
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.Write)))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | W - (min (W, (!($t@22@01) ? W : Z))) == W]
(assert (=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
  $Perm.Write))
; [eval] perm(x.g) == none
; [eval] perm(x.g)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.Write)
  (not
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.No)))
  (and
    (not
      (and
        (=
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
          $Perm.Write)
        (=
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@22@01))
                $Perm.Write
                $Perm.No)))
          $Perm.No)))
    (or
      (=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write)
      (not
        (=
          (-
            $Perm.Write
            ($Perm.min
              $Perm.Write
              (ite
                (not ($SortWrappers.$SnapToBool $t@22@01))
                $Perm.Write
                $Perm.No)))
          $Perm.Write))))))
(assert (or
  (not
    (and
      (=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
        $Perm.Write)
      (=
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.No)))
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.No))))
(push) ; 4
(assert (not (or
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.No))
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.No))
  (and
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write)
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.No))))
; [exec]
; assert (perm(x.g) == write || perm(x.h) == write) &&
;   perm(x.g) + perm(x.h) == write
; [eval] perm(x.g) == write || perm(x.h) == write
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(push) ; 4
; [then-branch: 15 | W - (min (W, ($t@22@01 ? W : Z))) == W | live]
; [else-branch: 15 | W - (min (W, ($t@22@01 ? W : Z))) != W | live]
(push) ; 5
; [then-branch: 15 | W - (min (W, ($t@22@01 ? W : Z))) == W]
(assert (=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | W - (min (W, ($t@22@01 ? W : Z))) != W]
(assert (not
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)))
; [eval] perm(x.h) == write
; [eval] perm(x.h)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
      $Perm.Write))
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)))
(push) ; 4
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    $Perm.Write)
  (=
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    $Perm.Write)))
; [eval] perm(x.g) + perm(x.h) == write
; [eval] perm(x.g) + perm(x.h)
; [eval] perm(x.g)
; [eval] perm(x.h)
(push) ; 4
(assert (not (=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (+
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
  $Perm.Write))
(push) ; 4
(set-option :timeout 10)
(assert (not (not ($SortWrappers.$SnapToBool ($Snap.first $t@21@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first $t@21@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:($t@21@01) | live]
; [else-branch: 16 | !(First:($t@21@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:($t@21@01)]
(assert ($SortWrappers.$SnapToBool ($Snap.first $t@21@01)))
; [exec]
; assert acc(x.h, write)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    ($Perm.min
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No))))
  (not (= x@20@01 $Ref.null))))
(assert (<=
  $Perm.No
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))))
(assert (<=
  (-
    $Perm.Write
    ($Perm.min
      $Perm.Write
      (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite ($SortWrappers.$SnapToBool $t@22@01) $Perm.Write $Perm.No))))
  (not (= x@20@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    ($Perm.min
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    ($Perm.min
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 5
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
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      $Perm.Write
      ($Perm.min
        $Perm.Write
        (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
    ($Perm.min
      (-
        $Perm.Write
        ($Perm.min
          $Perm.Write
          (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
      $Perm.Write))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min
        (-
          $Perm.Write
          ($Perm.min
            $Perm.Write
            (ite (not ($SortWrappers.$SnapToBool $t@22@01)) $Perm.Write $Perm.No)))
        $Perm.Write))
    $Perm.No))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test30 ----------
(declare-const x@24@01 $Ref)
(declare-const x@25@01 $Ref)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (not (= x@25@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; apply acc(x.f, write) --*
;   acc(x.f, write) &&
;   (acc(x.g, (x.f ? write : none)) && acc(x.h, (x.f ? none : write)))
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))))
; [eval] (x.f ? write : none)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(Second:($t@26@01)[First:($t@26@01)]) | live]
; [else-branch: 17 | !(First:(Second:($t@26@01)[First:($t@26@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | First:(Second:($t@26@01)[First:($t@26@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(First:(Second:($t@26@01)[First:($t@26@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(push) ; 3
(assert (not (or
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.Write
      $Perm.No)
    $Perm.No)
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
  (not (= x@25@01 $Ref.null))))
; [eval] (x.f ? none : write)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:($t@26@01)[First:($t@26@01)]) | live]
; [else-branch: 18 | !(First:(Second:($t@26@01)[First:($t@26@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | First:(Second:($t@26@01)[First:($t@26@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | !(First:(Second:($t@26@01)[First:($t@26@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (or
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.No
      $Perm.Write)
    $Perm.No)
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.No
    $Perm.Write)))
(assert (<=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.No
    $Perm.Write)
  $Perm.Write))
(assert (=>
  (not
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))
  (not (= x@25@01 $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (x.f ? perm(x.g) == write : perm(x.h) == write)
; [eval] (x.f ? perm(x.g) == write : perm(x.h) == write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:($t@26@01)[First:($t@26@01)]) | live]
; [else-branch: 19 | !(First:(Second:($t@26@01)[First:($t@26@01)])) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | First:(Second:($t@26@01)[First:($t@26@01)])]
(assert ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01)))))
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(First:(Second:($t@26@01)[First:($t@26@01)]))]
(assert (not
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))))
; [eval] perm(x.h) == write
; [eval] perm(x.h)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (ite
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.No
      $Perm.Write)
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (ite
  ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=
    (ite
      ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
      $Perm.No
      $Perm.Write)
    $Perm.Write)))
; [exec]
; assert perm(x.g) == write && perm(x.h) == write
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(push) ; 3
(assert (not (=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)
  $Perm.Write)))
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
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)
  $Perm.Write)))
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
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)
  $Perm.Write)))
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
; [eval] perm(x.g) == write
; [eval] perm(x.g)
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (ite
    ($SortWrappers.$SnapToBool ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second $t@26@01)) ($Snap.first $t@26@01))))
    $Perm.Write
    $Perm.No)
  $Perm.Write)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
