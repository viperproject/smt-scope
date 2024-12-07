(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permissions/possibly_none_perms.vpr
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
; [eval] (b ? write : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@3@01]
(assert b@3@01)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@3@01)]
(assert (not b@3@01))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@3@01) b@3@01))
(push) ; 2
(assert (not (or (= (ite b@3@01 $Perm.Write $Perm.No) $Perm.No) b@3@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $t@4@01 Int)
(assert (<= $Perm.No (ite b@3@01 $Perm.Write $Perm.No)))
(assert (<= (ite b@3@01 $Perm.Write $Perm.No) $Perm.Write))
(assert (=> b@3@01 (not (= x@2@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@5@01 Int)
; [exec]
; a := x.f
(push) ; 3
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@6@01 $Ref)
(declare-const b1@7@01 Bool)
(declare-const b2@8@01 Bool)
(declare-const x@9@01 $Ref)
(declare-const b1@10@01 Bool)
(declare-const b2@11@01 Bool)
(push) ; 1
(declare-const $t@12@01 Int)
(assert (not (= x@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a1: Int
(declare-const a1@13@01 Int)
; [exec]
; var a2: Int
(declare-const a2@14@01 Int)
; [exec]
; var a3: Int
(declare-const a3@15@01 Int)
; [exec]
; a1 := x.f
; [exec]
; exhale acc(x.f, (b1 ? 1 / 5 : none))
; [eval] (b1 ? 1 / 5 : none)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@10@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b1@10@01 | live]
; [else-branch: 1 | !(b1@10@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | b1@10@01]
(assert b1@10@01)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(b1@10@01)]
(assert (not b1@10@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b1@10@01) b1@10@01))
(push) ; 3
(assert (not (or (= (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No) $Perm.No) b1@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (/ (to_real 1) (to_real 5))
    ($Perm.min
      (/ (to_real 1) (to_real 5))
      (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (/ (to_real 1) (to_real 5))
    ($Perm.min
      (/ (to_real 1) (to_real 5))
      (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))))
(assert (<=
  (-
    (/ (to_real 1) (to_real 5))
    ($Perm.min
      (/ (to_real 1) (to_real 5))
      (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (/ (to_real 1) (to_real 5))
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No))))
  (not (= x@9@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@10@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale acc(x.f, 1 / 5)
(declare-const $t@16@01 Int)
(assert (=>
  (<
    $Perm.No
    (-
      (/ (to_real 1) (to_real 5))
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No))))
  (= $t@16@01 $t@12@01)))
(assert (<=
  $Perm.No
  (+
    (-
      (/ (to_real 1) (to_real 5))
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5)))))
(assert (<=
  (+
    (-
      (/ (to_real 1) (to_real 5))
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (/ (to_real 1) (to_real 5))
        ($Perm.min
          (/ (to_real 1) (to_real 5))
          (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
      (/ (to_real 1) (to_real 5))))
  (not (= x@9@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; a2 := x.f
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (/ (to_real 1) (to_real 5))
      ($Perm.min
        (/ (to_real 1) (to_real 5))
        (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale acc(x.f, (b2 ? 1 / 5 : none))
; [eval] (b2 ? 1 / 5 : none)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@11@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b2@11@01 | live]
; [else-branch: 2 | !(b2@11@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | b2@11@01]
(assert b2@11@01)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(b2@11@01)]
(assert (not b2@11@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b2@11@01) b2@11@01))
(push) ; 3
(assert (not (or (= (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No) $Perm.No) b2@11@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (+
      (-
        (/ (to_real 1) (to_real 5))
        ($Perm.min
          (/ (to_real 1) (to_real 5))
          (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
      (/ (to_real 1) (to_real 5)))
    ($Perm.min
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        (/ (to_real 1) (to_real 5))
        ($Perm.min
          (/ (to_real 1) (to_real 5))
          (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
      (/ (to_real 1) (to_real 5)))
    ($Perm.min
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))))
(assert (<=
  (-
    (+
      (-
        (/ (to_real 1) (to_real 5))
        ($Perm.min
          (/ (to_real 1) (to_real 5))
          (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
      (/ (to_real 1) (to_real 5)))
    ($Perm.min
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No))))
  (not (= x@9@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    $Perm.No)
  (<
    (-
      (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not b2@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale acc(x.f, 1 / 5)
(declare-const $t@17@01 Int)
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No))))
  (= $t@17@01 $t@16@01)))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5)))))
(assert (<=
  (+
    (-
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        ($Perm.min
          (+
            (-
              (/ (to_real 1) (to_real 5))
              ($Perm.min
                (/ (to_real 1) (to_real 5))
                (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
            (/ (to_real 1) (to_real 5)))
          (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
      (/ (to_real 1) (to_real 5))))
  (not (= x@9@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert true
; [exec]
; a3 := x.f
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (-
          (/ (to_real 1) (to_real 5))
          ($Perm.min
            (/ (to_real 1) (to_real 5))
            (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
        (/ (to_real 1) (to_real 5)))
      ($Perm.min
        (+
          (-
            (/ (to_real 1) (to_real 5))
            ($Perm.min
              (/ (to_real 1) (to_real 5))
              (ite b1@10@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
          (/ (to_real 1) (to_real 5)))
        (ite b2@11@01 (/ (to_real 1) (to_real 5)) $Perm.No)))
    (/ (to_real 1) (to_real 5))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert !b1 ==> a1 == a2 && a2 == a3
; [eval] !b1 ==> a1 == a2 && a2 == a3
; [eval] !b1
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not b1@10@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@10@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(b1@10@01) | live]
; [else-branch: 3 | b1@10@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | !(b1@10@01)]
(assert (not b1@10@01))
; [eval] a1 == a2 && a2 == a3
; [eval] a1 == a2
(push) ; 5
; [then-branch: 4 | $t@12@01 != $t@16@01 | live]
; [else-branch: 4 | $t@12@01 == $t@16@01 | live]
(push) ; 6
; [then-branch: 4 | $t@12@01 != $t@16@01]
(assert (not (= $t@12@01 $t@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | $t@12@01 == $t@16@01]
(assert (= $t@12@01 $t@16@01))
; [eval] a2 == a3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (= $t@12@01 $t@16@01) (not (= $t@12@01 $t@16@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | b1@10@01]
(assert b1@10@01)
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not b1@10@01)
  (and (not b1@10@01) (or (= $t@12@01 $t@16@01) (not (= $t@12@01 $t@16@01))))))
; Joined path conditions
(assert (or b1@10@01 (not b1@10@01)))
(push) ; 3
(assert (not (=> (not b1@10@01) (and (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (not b1@10@01) (and (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01))))
; [exec]
; assert !b2 ==> a2 == a3
; [eval] !b2 ==> a2 == a3
; [eval] !b2
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not b2@11@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(b2@11@01) | live]
; [else-branch: 5 | b2@11@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | !(b2@11@01)]
(assert (not b2@11@01))
; [eval] a2 == a3
(pop) ; 4
(push) ; 4
; [else-branch: 5 | b2@11@01]
(assert b2@11@01)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or b2@11@01 (not b2@11@01)))
(push) ; 3
(assert (not (=> (not b2@11@01) (= $t@16@01 $t@17@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (not b2@11@01) (= $t@16@01 $t@17@01)))
; [exec]
; assert a1 == a3 || (a1 == a2 || a2 == a3)
; [eval] a1 == a3 || (a1 == a2 || a2 == a3)
; [eval] a1 == a3
(push) ; 3
; [then-branch: 6 | $t@12@01 == $t@17@01 | live]
; [else-branch: 6 | $t@12@01 != $t@17@01 | live]
(push) ; 4
; [then-branch: 6 | $t@12@01 == $t@17@01]
(assert (= $t@12@01 $t@17@01))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | $t@12@01 != $t@17@01]
(assert (not (= $t@12@01 $t@17@01)))
; [eval] a1 == a2
(push) ; 5
; [then-branch: 7 | $t@12@01 == $t@16@01 | live]
; [else-branch: 7 | $t@12@01 != $t@16@01 | live]
(push) ; 6
; [then-branch: 7 | $t@12@01 == $t@16@01]
(assert (= $t@12@01 $t@16@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | $t@12@01 != $t@16@01]
(assert (not (= $t@12@01 $t@16@01)))
; [eval] a2 == a3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= $t@12@01 $t@16@01)) (= $t@12@01 $t@16@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= $t@12@01 $t@17@01))
  (and
    (not (= $t@12@01 $t@17@01))
    (or (not (= $t@12@01 $t@16@01)) (= $t@12@01 $t@16@01)))))
(assert (or (not (= $t@12@01 $t@17@01)) (= $t@12@01 $t@17@01)))
(push) ; 3
(assert (not (or (= $t@12@01 $t@17@01) (or (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01)))))
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
; [eval] a1 == a3 || (a1 == a2 || a2 == a3)
; [eval] a1 == a3
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | $t@12@01 == $t@17@01 | live]
; [else-branch: 8 | $t@12@01 != $t@17@01 | live]
(push) ; 4
; [then-branch: 8 | $t@12@01 == $t@17@01]
(assert (= $t@12@01 $t@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | $t@12@01 != $t@17@01]
(assert (not (= $t@12@01 $t@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a1 == a2
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | $t@12@01 == $t@16@01 | live]
; [else-branch: 9 | $t@12@01 != $t@16@01 | live]
(push) ; 6
; [then-branch: 9 | $t@12@01 == $t@16@01]
(assert (= $t@12@01 $t@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 9 | $t@12@01 != $t@16@01]
(assert (not (= $t@12@01 $t@16@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a2 == a3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= $t@12@01 $t@16@01)) (= $t@12@01 $t@16@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= $t@12@01 $t@17@01) (or (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01)))))
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
; [eval] a1 == a3 || (a1 == a2 || a2 == a3)
; [eval] a1 == a3
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | $t@12@01 == $t@17@01 | live]
; [else-branch: 10 | $t@12@01 != $t@17@01 | live]
(push) ; 4
; [then-branch: 10 | $t@12@01 == $t@17@01]
(assert (= $t@12@01 $t@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | $t@12@01 != $t@17@01]
(assert (not (= $t@12@01 $t@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a1 == a2
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | $t@12@01 == $t@16@01 | live]
; [else-branch: 11 | $t@12@01 != $t@16@01 | live]
(push) ; 6
; [then-branch: 11 | $t@12@01 == $t@16@01]
(assert (= $t@12@01 $t@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 11 | $t@12@01 != $t@16@01]
(assert (not (= $t@12@01 $t@16@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a2 == a3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= $t@12@01 $t@16@01)) (= $t@12@01 $t@16@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= $t@12@01 $t@17@01) (or (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01)))))
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
; [eval] a1 == a3 || (a1 == a2 || a2 == a3)
; [eval] a1 == a3
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | $t@12@01 == $t@17@01 | live]
; [else-branch: 12 | $t@12@01 != $t@17@01 | live]
(push) ; 4
; [then-branch: 12 | $t@12@01 == $t@17@01]
(assert (= $t@12@01 $t@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 12 | $t@12@01 != $t@17@01]
(assert (not (= $t@12@01 $t@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a1 == a2
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | $t@12@01 == $t@16@01 | live]
; [else-branch: 13 | $t@12@01 != $t@16@01 | live]
(push) ; 6
; [then-branch: 13 | $t@12@01 == $t@16@01]
(assert (= $t@12@01 $t@16@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 13 | $t@12@01 != $t@16@01]
(assert (not (= $t@12@01 $t@16@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] a2 == a3
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= $t@12@01 $t@16@01)) (= $t@12@01 $t@16@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (= $t@12@01 $t@17@01) (or (= $t@12@01 $t@16@01) (= $t@16@01 $t@17@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@18@01 $Ref)
(declare-const b@19@01 Bool)
(declare-const x@20@01 $Ref)
(declare-const b@21@01 Bool)
(push) ; 1
; [eval] (b ? write : none)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@21@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@21@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | b@21@01 | live]
; [else-branch: 14 | !(b@21@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | b@21@01]
(assert b@21@01)
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(b@21@01)]
(assert (not b@21@01))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not b@21@01) b@21@01))
(push) ; 2
(assert (not (or (= (ite b@21@01 $Perm.Write $Perm.No) $Perm.No) b@21@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $t@22@01 Int)
(assert (<= $Perm.No (ite b@21@01 $Perm.Write $Perm.No)))
(assert (<= (ite b@21@01 $Perm.Write $Perm.No) $Perm.Write))
(assert (=> b@21@01 (not (= x@20@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(x.f, wildcard)
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (ite b@21@01 $Perm.Write $Perm.No) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (ite b@21@01 $Perm.Write $Perm.No) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
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
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (ite b@21@01 $Perm.Write $Perm.No) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
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
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (ite b@21@01 $Perm.Write $Perm.No) $Perm.No))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- permarg ----------
(declare-const k@25@01 $Perm)
(declare-const k@26@01 $Perm)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
