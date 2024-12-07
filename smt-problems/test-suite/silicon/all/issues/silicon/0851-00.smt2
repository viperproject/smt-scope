(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0851.vpr
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
(declare-fun fun01 ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%limited ($Snap $Ref Bool Bool) Int)
(declare-fun fun01%stateless ($Ref Bool Bool) Bool)
(declare-fun fun01%precondition ($Snap $Ref Bool Bool) Bool)
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
(declare-fun $t@4@00 () Int)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (=
    (fun01%limited s@$ x@0@00 b1@1@00 b2@2@00)
    (fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (fun01%stateless x@0@00 b1@1@00 b2@2@00)
  :pattern ((fun01%limited s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  (and
    (and
      (=>
        (<
          $Perm.No
          (+
            (/ (to_real 1) (to_real 3))
            (ite b1@1@00 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
      (=>
        b2@2@00
        (= $t@4@00 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))))
    (=>
      (fun01%precondition s@$ x@0@00 b1@1@00 b2@2@00)
      (= (fun01 s@$ x@0@00 b1@1@00 b2@2@00) $t@4@00)))
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (b1@1@00 Bool) (b2@2@00 Bool)) (!
  true
  :pattern ((fun01 s@$ x@0@00 b1@1@00 b2@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const b1@1@01 Bool)
(declare-const b2@2@01 Bool)
(declare-const x@3@01 $Ref)
(declare-const b1@4@01 Bool)
(declare-const b2@5@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 Int)
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.v := 4
; [exec]
; assert fun01(x, b2, b1) == 4
; [eval] fun01(x, b2, b1) == 4
; [eval] fun01(x, b2, b1)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (b1 ? 1 / 3 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b2@5@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b2@5@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b2@5@01 | live]
; [else-branch: 0 | !(b2@5@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | b2@5@01]
(assert b2@5@01)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(b2@5@01)]
(assert (not b2@5@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b2@5@01) b2@5@01))
(push) ; 4
(assert (not (or (= (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No) b2@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (/ (to_real 2) (to_real 3))
    ($Perm.min
      (/ (to_real 2) (to_real 3))
      (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ (to_real 2) (to_real 3))
    ($Perm.min
      (/ (to_real 2) (to_real 3))
      (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))))
(assert (<=
  (-
    (/ (to_real 2) (to_real 3))
    ($Perm.min
      (/ (to_real 2) (to_real 3))
      (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
  (not (= x@3@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@5@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (b2 ? 1 / 3 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b1@4@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not b1@4@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b1@4@01 | live]
; [else-branch: 1 | !(b1@4@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | b1@4@01]
(assert b1@4@01)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(b1@4@01)]
(assert (not b1@4@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not b1@4@01) b1@4@01))
(push) ; 4
(assert (not (or (= (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No) b1@4@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (-
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    ($Perm.min
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    ($Perm.min
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))))
(assert (<=
  (-
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    ($Perm.min
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      ($Perm.min
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
  (not (= x@3@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)
      ($Perm.min
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)
      ($Perm.min
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@4@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 4)
  ($Snap.combine
    (ite b2@5@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit)
    (ite b1@4@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit))) x@3@01 b2@5@01 b1@4@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (or (not b2@5@01) b2@5@01)
  (<=
    $Perm.No
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
  (<=
    (-
      (/ (to_real 2) (to_real 3))
      ($Perm.min
        (/ (to_real 2) (to_real 3))
        (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.Write)
  (=>
    (<
      $Perm.No
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
    (not (= x@3@01 $Ref.null)))
  (or (not b1@4@01) b1@4@01)
  (<=
    $Perm.No
    (-
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      ($Perm.min
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
  (<=
    (-
      (-
        (/ (to_real 2) (to_real 3))
        ($Perm.min
          (/ (to_real 2) (to_real 3))
          (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
      ($Perm.min
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
    $Perm.Write)
  (=>
    (<
      $Perm.No
      (-
        (-
          (/ (to_real 2) (to_real 3))
          ($Perm.min
            (/ (to_real 2) (to_real 3))
            (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
        ($Perm.min
          (-
            (/ (to_real 2) (to_real 3))
            ($Perm.min
              (/ (to_real 2) (to_real 3))
              (ite b2@5@01 (/ (to_real 1) (to_real 3)) $Perm.No)))
          (ite b1@4@01 (/ (to_real 1) (to_real 3)) $Perm.No))))
    (not (= x@3@01 $Ref.null)))
  (fun01%precondition ($Snap.combine
    ($SortWrappers.IntTo$Snap 4)
    ($Snap.combine
      (ite b2@5@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit)
      (ite b1@4@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit))) x@3@01 b2@5@01 b1@4@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun01 ($Snap.combine
    ($SortWrappers.IntTo$Snap 4)
    ($Snap.combine
      (ite b2@5@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit)
      (ite b1@4@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit))) x@3@01 b2@5@01 b1@4@01)
  4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun01 ($Snap.combine
    ($SortWrappers.IntTo$Snap 4)
    ($Snap.combine
      (ite b2@5@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit)
      (ite b1@4@01 ($SortWrappers.IntTo$Snap 4) $Snap.unit))) x@3@01 b2@5@01 b1@4@01)
  4))
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
(pop) ; 2
(pop) ; 1
